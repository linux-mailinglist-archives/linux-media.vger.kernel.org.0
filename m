Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 943A218F3E3
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 12:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgCWLrf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 07:47:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58520 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbgCWLrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 07:47:35 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 713301C0313; Mon, 23 Mar 2020 12:47:28 +0100 (CET)
Date:   Mon, 23 Mar 2020 12:47:27 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     sean@mess.org, hverkuil-cisco@xs4all.nl,
        mchehab+samsung@kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Subject: [PATCH] Minimal libv4l2 support for complex cameras
Message-ID: <20200323114727.GA31063@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

We now have easy-to-install support for complex camera in form of
Maemo Leste on N900.... Unfortunately we don't have anything in
userspace that can be used to work with the camera.

This attempts to be minimal solution to get libv4l2 to work.

It enables passing camera pipeline description to libv4l2, so that
controls are mapped to appopriate devices, and libv4l2 can be used
with complex camera.

It is useful for testing kernel parts of N900 subsystem, and it will
serve as a basis for autofocus work and autogain improvements.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/lib/include/libv4l2.h b/lib/include/libv4l2.h
index ea1870db0..a0ec0a91e 100644
--- a/lib/include/libv4l2.h
+++ b/lib/include/libv4l2.h
@@ -58,6 +58,10 @@ LIBV4L_PUBLIC extern FILE *v4l2_log_file;
    invalid memory address will not lead to failure with errno being EFAULT,
    as it would with a real ioctl, but will cause libv4l2 to break, and you
    get to keep both pieces.
+
+   You can open complex pipelines by passing ".cv" file with pipeline
+   description to v4l2_open(). libv4l2 will open all the required
+   devices automatically in that case.
 */
=20
 LIBV4L_PUBLIC int v4l2_open(const char *file, int oflag, ...);
diff --git a/lib/libv4l2/libv4l2-priv.h b/lib/libv4l2/libv4l2-priv.h
index 1924c91f6..1ee697a62 100644
--- a/lib/libv4l2/libv4l2-priv.h
+++ b/lib/libv4l2/libv4l2-priv.h
@@ -104,6 +104,7 @@ struct v4l2_dev_info {
 	void *plugin_library;
 	void *dev_ops_priv;
 	const struct libv4l_dev_ops *dev_ops;
+	struct v4l2_controls_map *map;
 };
=20
 /* From v4l2-plugin.c */
@@ -130,4 +131,20 @@ static inline void v4l2_plugin_cleanup(void *plugin_li=
b, void *plugin_priv,
 extern const char *v4l2_ioctls[];
 void v4l2_log_ioctl(unsigned long int request, void *arg, int result);
=20
+
+struct v4l2_control_map {
+	unsigned long control;
+	int fd;
+};
+
+struct v4l2_controls_map {
+	int main_fd;
+	int num_fds;
+	int num_controls;
+	struct v4l2_control_map map[];
+};
+
+int v4l2_open_pipeline(struct v4l2_controls_map *map, int v4l2_flags);
+LIBV4L_PUBLIC int v4l2_get_fd_for_control(int fd, unsigned long control);
+
 #endif
diff --git a/lib/libv4l2/libv4l2.c b/lib/libv4l2/libv4l2.c
index 9ebf8c18e..268a5101d 100644
--- a/lib/libv4l2/libv4l2.c
+++ b/lib/libv4l2/libv4l2.c
@@ -70,6 +70,8 @@
 #include <sys/types.h>
 #include <sys/mman.h>
 #include <sys/stat.h>
+#include <dirent.h>
+
 #include "libv4l2.h"
 #include "libv4l2-priv.h"
 #include "libv4l-plugin.h"
@@ -618,6 +620,8 @@ static void v4l2_update_fps(int index, struct v4l2_stre=
amparm *parm)
 		devices[index].fps =3D 0;
 }
=20
+static int v4l2_open_complex(int fd, int v4l2_flags);
+
 int v4l2_open(const char *file, int oflag, ...)
 {
 	int fd;
@@ -641,6 +645,20 @@ int v4l2_open(const char *file, int oflag, ...)
 	if (fd =3D=3D -1)
 		return fd;
=20
+	int len =3D strlen(file);
+	char *end =3D ".cv";
+	int len2 =3D strlen(end);
+	if ((len > len2) && (!strcmp(file + len - len2, end))) {
+		/* .cv extension */
+		struct stat sb;
+
+		if (fstat(fd, &sb) =3D=3D 0) {
+			if ((sb.st_mode & S_IFMT) =3D=3D S_IFREG) {
+				return v4l2_open_complex(fd, 0);
+			}
+		}
+	}
+
 	if (v4l2_fd_open(fd, 0) =3D=3D -1) {
 		int saved_err =3D errno;
=20
@@ -787,6 +805,8 @@ no_capture:
 	if (index >=3D devices_used)
 		devices_used =3D index + 1;
=20
+	devices[index].map =3D NULL;
+
 	/* Note we always tell v4lconvert to optimize src fmt selection for
 	   our default fps, the only exception is the app explicitly selecting
 	   a frame rate using the S_PARM ioctl after a S_FMT */
@@ -1056,12 +1076,47 @@ static int v4l2_s_fmt(int index, struct v4l2_format=
 *dest_fmt)
 	return 0;
 }
=20
+int v4l2_get_fd_for_control(int fd, unsigned long control)
+{
+	int index =3D v4l2_get_index(fd);
+	struct v4l2_controls_map *map;
+	int lo =3D 0;
+	int hi;
+
+	if (index < 0)
+		return fd;
+
+	map =3D devices[index].map;
+	if (!map)
+		return fd;
+	hi =3D map->num_controls;
+
+	while (lo < hi) {
+		int i =3D (lo + hi) / 2;
+		if (map->map[i].control =3D=3D control) {
+			return map->map[i].fd;
+		}
+		if (map->map[i].control > control) {
+			hi =3D i;
+			continue;
+		}
+		if (map->map[i].control < control) {
+			lo =3D i+1;
+			continue;
+		}
+		printf("Bad: impossible condition in binary search\n");
+		exit(1);
+	}
+	return fd;
+}
+
 int v4l2_ioctl(int fd, unsigned long int request, ...)
 {
 	void *arg;
 	va_list ap;
 	int result, index, saved_err;
-	int is_capture_request =3D 0, stream_needs_locking =3D 0;
+	int is_capture_request =3D 0, stream_needs_locking =3D 0,
+	    is_subdev_request =3D 0;
=20
 	va_start(ap, request);
 	arg =3D va_arg(ap, void *);
@@ -1081,13 +1136,14 @@ int v4l2_ioctl(int fd, unsigned long int request, .=
=2E.)
=20
 	/* Is this a capture request and do we need to take the stream lock? */
 	switch (request) {
-	case VIDIOC_QUERYCAP:
 	case VIDIOC_QUERYCTRL:
 	case VIDIOC_G_CTRL:
 	case VIDIOC_S_CTRL:
 	case VIDIOC_G_EXT_CTRLS:
-	case VIDIOC_TRY_EXT_CTRLS:
 	case VIDIOC_S_EXT_CTRLS:
+		is_subdev_request =3D 1;
+	case VIDIOC_QUERYCAP:
+	case VIDIOC_TRY_EXT_CTRLS:
 	case VIDIOC_ENUM_FRAMESIZES:
 	case VIDIOC_ENUM_FRAMEINTERVALS:
 		is_capture_request =3D 1;
@@ -1151,10 +1207,15 @@ int v4l2_ioctl(int fd, unsigned long int request, .=
=2E.)
 	}
=20
 	if (!is_capture_request) {
+		int sub_fd;
 no_capture_request:
+		sub_fd =3D fd;
+		if (is_subdev_request) {
+			sub_fd =3D v4l2_get_fd_for_control(index, ((struct v4l2_queryctrl *) ar=
g)->id);
+		}
 		result =3D devices[index].dev_ops->ioctl(
 				devices[index].dev_ops_priv,
-				fd, request, arg);
+				sub_fd, request, arg);
 		saved_err =3D errno;
 		v4l2_log_ioctl(request, arg, result);
 		errno =3D saved_err;
@@ -1782,3 +1843,193 @@ int v4l2_get_control(int fd, int cid)
 			(qctrl.maximum - qctrl.minimum) / 2) /
 		(qctrl.maximum - qctrl.minimum);
 }
+
+int v4l2_open_pipeline(struct v4l2_controls_map *map, int v4l2_flags)
+{
+	int index;
+	int i;
+
+	for (i=3D0; i<map->num_controls; i++) {
+		if (map->map[i].fd <=3D 0) {
+			V4L2_LOG_ERR("v4l2_open_pipeline: Bad fd in map.\n");
+			return -1;
+		}
+		if (i>=3D1 && map->map[i].control <=3D map->map[i-1].control) {
+			V4L2_LOG_ERR("v4l2_open_pipeline: Controls not sorted.\n");
+			return -1;
+		}
+	}
+
+	i =3D v4l2_fd_open(map->main_fd, v4l2_flags);
+	index =3D v4l2_get_index(map->main_fd);
+	devices[index].map =3D map;
+	return i;
+}
+
+static void scan_devices(char **device_names, int *device_fds, int num)
+{
+	struct dirent **namelist;
+	int n;
+	char *class_v4l =3D "/sys/class/video4linux";
+
+	n =3D scandir(class_v4l, &namelist, NULL, alphasort);
+	if (n < 0) {
+		perror("scandir");
+		return;
+	}
+
+	while (n--) {
+		if (namelist[n]->d_name[0] !=3D '.') {
+			char filename[1024], content[1024];
+			sprintf(filename, "%s/%s/name", class_v4l, namelist[n]->d_name);
+			FILE *f =3D fopen(filename, "r");
+			if (!f) {
+				printf("Strange, can't open %s", filename);
+			} else {
+				fgets(content, 1024, f);
+				fclose(f);
+
+				int i;
+				for (i =3D num-1; i >=3D0; i--) {
+					if (!strcmp(content, device_names[i])) {
+						sprintf(filename, "/dev/%s", namelist[n]->d_name);
+						device_fds[i] =3D open(filename, O_RDWR);
+						if (device_fds[i] < 0) {
+							V4L2_LOG_ERR("Error opening %s: %m\n", filename);
+						}
+					}
+				}
+			}
+		}
+		free(namelist[n]);
+	}
+	free(namelist);
+ =20
+}
+
+static int v4l2_open_complex(int fd, int v4l2_flags)
+{
+#define perr(s) V4L2_LOG_ERR("open_complex: " s "\n")
+#define BUF 256
+	FILE *f =3D fdopen(fd, "r");
+
+	int res =3D -1;
+	char buf[BUF];
+	int version, num_modes, num_devices, num_controls;
+	int dev, control;
+
+	if (!f) {
+		perr("open of .cv file failed: %m");
+		goto err;
+	}
+
+	if (fscanf(f, "Complex Video: %d\n", &version) !=3D 1) {
+		perr(".cv file does not have required header");
+		goto close;
+	}
+
+	if (version !=3D 0) {
+		perr(".cv file has unknown version");
+		goto close;
+	}
+
+	if (fscanf(f, "#modes: %d\n", &num_modes) !=3D 1) {
+		perr("could not parse modes");
+		goto close;
+	}
+
+	if (num_modes !=3D 1) {
+		perr("only single mode is supported for now");
+		goto close;
+	}
+
+	if (fscanf(f, "Mode: %s\n", buf) !=3D 1) {
+		perr("could not parse mode name");
+		goto close;
+	}
+
+	if (fscanf(f, " #devices: %d\n", &num_devices) !=3D 1) {
+		perr("could not parse number of devices");
+		goto close;
+	}
+#define MAX_DEVICES 16
+	char *device_names[MAX_DEVICES] =3D { NULL, };
+	int device_fds[MAX_DEVICES];
+	if (num_devices > MAX_DEVICES) {
+		perr("too many devices");
+		goto close;
+	}
+
+	for (dev =3D 0; dev < num_devices; dev++) {
+		int tmp;
+		if (fscanf(f, "%d: ", &tmp) !=3D 1) {
+			perr("could not parse device");
+			goto free_devices;
+		}
+		if (tmp !=3D dev) {
+			perr("bad device number");
+			goto free_devices;
+		}
+		fgets(buf, BUF, f);
+		device_names[dev] =3D strdup(buf);
+		device_fds[dev] =3D -1;
+	}
+
+	scan_devices(device_names, device_fds, num_devices);
+
+	for (dev =3D 0; dev < num_devices; dev++) {
+		if (device_fds[dev] =3D=3D -1) {
+			perr("Could not open all required devices");
+			goto close_devices;
+		}
+	}
+
+	if (fscanf(f, " #controls: %d\n", &num_controls) !=3D 1) {
+		perr("can not parse number of controls");
+		goto close_devices;
+	}
+
+	struct v4l2_controls_map *map =3D malloc(sizeof(struct v4l2_controls_map)=
 +
+					       num_controls*sizeof(struct v4l2_control_map));
+
+	map->num_controls =3D num_controls;
+	map->num_fds =3D num_devices;
+	map->main_fd =3D device_fds[0];
+
+	for (control =3D 0; control < num_controls; control++) {
+		unsigned long num;
+		int dev;
+		if (fscanf(f, "0x%lx: %d\n", &num, &dev) !=3D 2) {
+			perr("could not parse control");
+			goto free_map;
+		}
+		if ((dev < 0) || (dev >=3D num_devices)) {
+			perr("device out of range");
+			goto free_map;
+		}
+		map->map[control].control =3D num;
+		map->map[control].fd =3D device_fds[dev];
+	}
+	if (fscanf(f, "%s", buf) > 0) {
+		perr("junk at end of file");
+		goto free_map;
+	}
+
+	res =3D v4l2_open_pipeline(map, v4l2_flags);
+
+	if (res < 0) {
+free_map:
+		free(map);
+close_devices:
+		for (dev =3D 0; dev < num_devices; dev++)
+			close(device_fds[dev]);
+	}
+free_devices:
+	for (dev =3D 0; dev < num_devices; dev++) {
+		free(device_names[dev]);
+	}
+close:
+	fclose(f);
+err:
+	return res;
+}
diff --git a/lib/libv4lconvert/control/libv4lcontrol.c b/lib/libv4lconvert/=
control/libv4lcontrol.c
index 0b0a346e4..8d2516126 100644
--- a/lib/libv4lconvert/control/libv4lcontrol.c
+++ b/lib/libv4lconvert/control/libv4lcontrol.c
@@ -865,6 +865,7 @@ int v4lcontrol_vidioc_queryctrl(struct v4lcontrol_data =
*data, void *arg)
 	struct v4l2_queryctrl *ctrl =3D arg;
 	int retval;
 	uint32_t orig_id =3D ctrl->id;
+	int fd;
=20
 	/* if we have an exact match return it */
 	for (i =3D 0; i < V4LCONTROL_COUNT; i++)
@@ -874,8 +875,9 @@ int v4lcontrol_vidioc_queryctrl(struct v4lcontrol_data =
*data, void *arg)
 			return 0;
 		}
=20
+	fd =3D v4l2_get_fd_for_control(data->fd, ctrl->id);
 	/* find out what the kernel driver would respond. */
-	retval =3D data->dev_ops->ioctl(data->dev_ops_priv, data->fd,
+	retval =3D data->dev_ops->ioctl(data->dev_ops_priv, fd,
 			VIDIOC_QUERYCTRL, arg);
=20
 	if ((data->priv_flags & V4LCONTROL_SUPPORTS_NEXT_CTRL) &&
@@ -905,6 +907,7 @@ int v4lcontrol_vidioc_g_ctrl(struct v4lcontrol_data *da=
ta, void *arg)
 {
 	int i;
 	struct v4l2_control *ctrl =3D arg;
+	int fd;
=20
 	for (i =3D 0; i < V4LCONTROL_COUNT; i++)
 		if ((data->controls & (1 << i)) &&
@@ -913,7 +916,8 @@ int v4lcontrol_vidioc_g_ctrl(struct v4lcontrol_data *da=
ta, void *arg)
 			return 0;
 		}
=20
-	return data->dev_ops->ioctl(data->dev_ops_priv, data->fd,
+	fd =3D v4l2_get_fd_for_control(data->fd, ctrl->id);
+	return data->dev_ops->ioctl(data->dev_ops_priv, fd,
 			VIDIOC_G_CTRL, arg);
 }
=20
@@ -996,6 +1000,7 @@ int v4lcontrol_vidioc_s_ctrl(struct v4lcontrol_data *d=
ata, void *arg)
 {
 	int i;
 	struct v4l2_control *ctrl =3D arg;
+	int fd;
=20
 	for (i =3D 0; i < V4LCONTROL_COUNT; i++)
 		if ((data->controls & (1 << i)) &&
@@ -1010,7 +1015,8 @@ int v4lcontrol_vidioc_s_ctrl(struct v4lcontrol_data *=
data, void *arg)
 			return 0;
 		}
=20
-	return data->dev_ops->ioctl(data->dev_ops_priv, data->fd,
+	fd =3D v4l2_get_fd_for_control(data->fd, ctrl->id);
+	return data->dev_ops->ioctl(data->dev_ops_priv, fd,
 			VIDIOC_S_CTRL, arg);
 }
=20
diff --git a/v4l-utils-po/de.po b/v4l-utils-po/de.po
index 764393af2..2c576ffc6 100644
--- a/v4l-utils-po/de.po
+++ b/v4l-utils-po/de.po
@@ -8,7 +8,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: v4l-utils 1.18.0-1\n"
 "Report-Msgid-Bugs-To: linux-media@vger.Kernel.org\n"
-"POT-Creation-Date: 2019-09-22 12:03+0200\n"
+"POT-Creation-Date: 2018-09-21 15:56-0300\n"
 "PO-Revision-Date: 2019-11-23 18:34+0200\n"
 "Last-Translator: Chris Leick <c.leick@vollbio.de>\n"
 "Language-Team: German <debian-l10n-german@lists.debian.org>\n"
@@ -18,25 +18,22 @@ msgstr ""
 "Content-Transfer-Encoding: 8bit\n"
 "Plural-Forms: nplurals=3D2; plural=3Dn !=3D 1;\n"
=20
-#: utils/keytable/keytable.c:239
 # rc =3D radio control, Funkfernbedienung
+#: utils/keytable/keytable.c:225
+#, fuzzy
 msgid ""
 "\n"
-"Lists Remote Controller devices, loads rc keymaps, tests events, and "
-"adjusts\n"
-"other Remote Controller options. Rather than loading a rc keymap, it is "
-"also\n"
-"possible to set protocol decoders and set rc scancode to keycode mappings=
\n"
-"directly.\n"
+"Allows get/set IR keycode/scancode tables\n"
 "You need to have read permissions on /dev/input for the program to work\n"
 "\n"
 "On the options below, the arguments are:\n"
-"  SYSDEV    - the rc device as found at /sys/class/rc\n"
-"  KEYMAP    - a keymap file with protocols and scancode to keycode mappin=
gs\n"
+"  DEV       - the /dev/input/event* device to control\n"
+"  SYSDEV    - the ir class as found at /sys/class/rc\n"
+"  TABLE     - a file with a set of scancode=3Dkeycode value pairs\n"
 "  SCANKEY   - a set of scancode1=3Dkeycode1,scancode2=3Dkeycode2.. value =
pairs\n"
 "  PROTOCOL  - protocol name (nec, rc-5, rc-6, jvc, sony, sanyo, rc-5-sz, "
 "lirc,\n"
-"              sharp, mce_kbd, xmp, imon, rc-mm, other, all) to be enabled=
,\n"
+"              sharp, mce_kbd, xmp, imon, other, all) to be enabled,\n"
 "              or a bpf protocol name or file\n"
 "  DELAY     - Delay before repeating a keystroke\n"
 "  PERIOD    - Period to repeat a keystroke\n"
@@ -52,9 +49,11 @@ msgstr ""
 "testet\n"
 "Ereignisse und passt andere Fernbedienungsoptionen an. Anstatt eine\n"
 "Funkfernbedienungsschl=C3=BCsselcodetabellen zu laden, ist es auch m=C3=
=B6glich,\n"
-"Protokolldekodierer zu setzen und Zuordnungen von Scancodes zu Schl=C3=BC=
sselcodes\n"
+"Protokolldekodierer zu setzen und Zuordnungen von Scancodes zu "
+"Schl=C3=BCsselcodes\n"
 "direkt zu setzen.\n"
-"Damit das Programm funktioniert, m=C3=BCssen Sie Leserechte f=C3=BCr /dev=
/input haben.\n"
+"Damit das Programm funktioniert, m=C3=BCssen Sie Leserechte f=C3=BCr /dev=
/input "
+"haben.\n"
 "\n"
 "Die Argumente f=C3=BCr die Optionen unten sind:\n"
 "  SYSDEV    - die Fernbedienungsklasse, wie unter /sys/class/rc beschrieb=
en\n"
@@ -65,66 +64,83 @@ msgstr ""
 "              Scancode1=3DSchl=C3=BCsselcode1,Scancode2=3DSchl=C3=BCsselc=
ode2 =E2=80=A6\n"
 "  PROTOCOL  - Protokollname (nec, rc-5, rc-6, jvc, sony, sanyo, rc-5-sz, "
 "lirc,\n"
-"              sharp, mce_kbd, xmp, imon, rc-mm, andere, alle), der aktivi=
ert\n"
+"              sharp, mce_kbd, xmp, imon, rc-mm, andere, alle), der "
+"aktiviert\n"
 "              werden soll oder ein BPF-Protokollname oder eine Datei\n"
 "  DELAY     - Verz=C3=B6gerung vor dem Wiederholen eines Tastendrucks\n"
 "  PERIOD    - Zeitspanne, um einen Tastendruck zu wiederholen\n"
-"  PARAMETER - ein Satz von Name1=3DZahl1,[Name2=3DZahl2] =E2=80=A6 f=C3=
=BCr das BPF-Protokoll\n"
+"  PARAMETER - ein Satz von Name1=3DZahl1,[Name2=3DZahl2] =E2=80=A6 f=C3=
=BCr das BPF-"
+"Protokoll\n"
 "  CFGFILE   - Konfigurationsdatei, die einen Treiber-/Tabellennamen mit "
 "einer\n"
 "              Schl=C3=BCsselcodeabbildungsdatei verbindet\n"
 "\n"
 "Optionen k=C3=B6nnen miteinander kombiniert werden."
=20
-#: utils/keytable/keytable.c:260 utils/dvb/dvb-fe-tool.c:56
+#: utils/keytable/keytable.c:243 utils/dvb/dvb-fe-tool.c:56
 msgid "enables debug messages"
 msgstr "aktiviert Meldungen zur Fehlersuche."
=20
-#: utils/keytable/keytable.c:261
-msgid "Clears the scancode to keycode mappings"
-msgstr "leert die die Abbildungen der Scancodes auf Schl=C3=BCsselcodes."
+#: utils/keytable/keytable.c:244
+#, fuzzy
+msgid "clears the old table"
+msgstr "wertet die anderen NIT-/SDT-Tabellen aus"
=20
-#: utils/keytable/keytable.c:262
+#: utils/keytable/keytable.c:245
 msgid "SYSDEV"
 msgstr "SYSDEV"
=20
-#: utils/keytable/keytable.c:262
-msgid "rc device to control, defaults to rc0 if not specified"
-msgstr ""
-"zu steuernde Fernbedienung, Voreinstellung ist rc@, falls nicht angegeben"
+# LIRC =3D Linux Infrared Remote Control
+#: utils/keytable/keytable.c:245
+#, fuzzy
+msgid "ir class device to control"
+msgstr "zu verwendende Linux-Infrarotfernbedienung"
=20
-#: utils/keytable/keytable.c:263
+#: utils/keytable/keytable.c:246
 msgid "test if IR is generating events"
 msgstr "pr=C3=BCft, ob die Infrarotfernbedienung Ereignisse erzeugt."
=20
-#: utils/keytable/keytable.c:264
-msgid "reads the current scancode/keycode mapping"
+#: utils/keytable/keytable.c:247 utils/ir-ctl/ir-ctl.c:103
+msgid "DEV"
+msgstr "DEV"
+
+# LIRC =3D Linux Infrared Remote Control
+#: utils/keytable/keytable.c:247
+#, fuzzy
+msgid "ir device to control"
+msgstr "zu verwendende Linux-Infrarotfernbedienung"
+
+#: utils/keytable/keytable.c:248
+#, fuzzy
+msgid "reads the current scancode/keycode table"
 msgstr "liest die aktuelle Abbildung der Scancodes auf Schl=C3=BCsselcode."
=20
-#: utils/keytable/keytable.c:265 utils/keytable/keytable.c:272
-#: utils/ir-ctl/ir-ctl.c:127
-msgid "KEYMAP"
-msgstr "KEYMAP"
+#: utils/keytable/keytable.c:249
+msgid "TABLE"
+msgstr ""
=20
-#: utils/keytable/keytable.c:265
-msgid "write (adds) the keymap from the specified file"
+#: utils/keytable/keytable.c:249
+#, fuzzy
+msgid ""
+"write (adds) the scancodes to the device scancode/keycode table from an "
+"specified file"
 msgstr ""
 "schreibt die Schl=C3=BCsselcodetabelle aus der angegebenen Datei (oder f=
=C3=BCgt sie "
 "hinzu)."
=20
-#: utils/keytable/keytable.c:266
+#: utils/keytable/keytable.c:250
 msgid "SCANKEY"
 msgstr "SCANKEY"
=20
-#: utils/keytable/keytable.c:266
+#: utils/keytable/keytable.c:250
 msgid "Change scan/key pairs"
 msgstr "=C3=A4ndert Scan-/Schl=C3=BCsselpaare."
=20
-#: utils/keytable/keytable.c:267
+#: utils/keytable/keytable.c:251
 msgid "PROTOCOL"
 msgstr "PROTOCOL"
=20
-#: utils/keytable/keytable.c:267
+#: utils/keytable/keytable.c:251
 msgid ""
 "Protocol to enable (the other ones will be disabled). To enable more than=
 "
 "one, use the option more than one time"
@@ -132,168 +148,232 @@ msgstr ""
 "Protokoll, das aktiviert werden soll (die anderen werden deaktiviert). Um=
 "
 "mehr als eins zu aktivieren, benutzen Sie die Option mehrfach."
=20
-#: utils/keytable/keytable.c:268
+#: utils/keytable/keytable.c:252
 msgid "PARAMETER"
 msgstr "PARAMETER"
=20
-#: utils/keytable/keytable.c:268
+#: utils/keytable/keytable.c:252
 msgid "Set a parameter for the protocol decoder"
 msgstr "setzt einen Parameter f=C3=BCr den Protokolldekodierer."
=20
-#: utils/keytable/keytable.c:269
+#: utils/keytable/keytable.c:253
 msgid "DELAY"
 msgstr "DELAY"
=20
-#: utils/keytable/keytable.c:269
+#: utils/keytable/keytable.c:253
 msgid "Sets the delay before repeating a keystroke"
 msgstr "setzt die Verz=C3=B6gerung, bevor ein Tastendruck wiederholt wird."
=20
-#: utils/keytable/keytable.c:270
+#: utils/keytable/keytable.c:254
 msgid "PERIOD"
 msgstr "PERIOD"
=20
-#: utils/keytable/keytable.c:270
+#: utils/keytable/keytable.c:254
 msgid "Sets the period to repeat a keystroke"
 msgstr "setzt eine Zeitspanne zum Wiederholen eines Tastendrucks."
=20
-#: utils/keytable/keytable.c:271
+#: utils/keytable/keytable.c:255
 msgid "CFGFILE"
 msgstr "CFGFILE"
=20
-#: utils/keytable/keytable.c:271
+#: utils/keytable/keytable.c:255
+#, fuzzy
 msgid ""
-"Auto-load keymaps, based on a configuration file. Only works with --sysde=
v."
+"Auto-load a table, based on a configuration file. Only works with sysdev."
 msgstr ""
 "l=C3=A4dt automatisch eine Schl=C3=BCsselcodeabbildung basierend auf eine=
r "
 "Konfigurationsdatei. Dies funktioniert nur mit --sysdev."
=20
-#: utils/keytable/keytable.c:272
-msgid "Test if keymap is valid"
-msgstr "Testet, ob die Schl=C3=BCsselcodeabbildung g=C3=BCltig ist."
-
-#: utils/keytable/keytable.c:273 utils/dvb/dvb-fe-tool.c:70
+#: utils/keytable/keytable.c:256 utils/dvb/dvb-fe-tool.c:70
 #: utils/dvb/dvb-format-convert.c:62 utils/dvb/dvbv5-scan.c:93
 #: utils/dvb/dvbv5-zap.c:134
 msgid "Give this help list"
 msgstr "gibt diese Hilfeliste aus."
=20
-#: utils/keytable/keytable.c:274 utils/dvb/dvb-fe-tool.c:71
+#: utils/keytable/keytable.c:257 utils/dvb/dvb-fe-tool.c:71
 #: utils/dvb/dvb-format-convert.c:63 utils/dvb/dvbv5-scan.c:94
 #: utils/dvb/dvbv5-zap.c:135
 msgid "Give a short usage message"
 msgstr "gibt eine kurze Benutzungsnachricht aus."
=20
-#: utils/keytable/keytable.c:275 utils/dvb/dvb-fe-tool.c:72
+#: utils/keytable/keytable.c:258 utils/dvb/dvb-fe-tool.c:72
 #: utils/dvb/dvb-format-convert.c:64 utils/dvb/dvbv5-scan.c:95
 #: utils/dvb/dvbv5-zap.c:136
 msgid "Print program version"
 msgstr "gibt die Programmversion aus."
=20
-#: utils/keytable/keytable.c:398 utils/keytable/keytable.c:424
+#: utils/keytable/keytable.c:263
+msgid ""
+"--device [/dev/input/event* device]\n"
+"--sysdev [ir class (f. ex. rc0)]\n"
+"[for using the rc0 sysdev]"
+msgstr ""
+
+#: utils/keytable/keytable.c:380
+#, fuzzy, c-format
+msgid "Parsing %s keycode file as plain text\n"
+msgstr "Konfigurationsdatei %s wird ausgewertet\n"
+
+#: utils/keytable/keytable.c:415
+#, fuzzy, c-format
+msgid "Protocol %s invalid\n"
+msgstr "Protokoll %s ist %s\n"
+
+#: utils/keytable/keytable.c:446 utils/keytable/keytable.c:541
+#, c-format
+msgid "parsing %s=3D%s:"
+msgstr ""
+
+#: utils/keytable/keytable.c:449 utils/keytable/keytable.c:545
 #, c-format
 msgid "\tvalue=3D%d\n"
 msgstr "\tWert=3D%d\n"
=20
-#: utils/keytable/keytable.c:403
+#: utils/keytable/keytable.c:454
+#, fuzzy
+msgid "value"
+msgstr "\tWert=3D%d\n"
+
+#: utils/keytable/keytable.c:473 utils/keytable/keytable.c:699
 #, c-format
-msgid "%s: keycode `%s' not recognised, no mapping for scancode %d\n"
+msgid "Invalid parameter on line %d of %s\n"
+msgstr "ung=C3=BCltiger Parameter in Zeile %d von %s\n"
+
+#: utils/keytable/keytable.c:488
+#, fuzzy, c-format
+msgid "protocol missing\n"
+msgstr "Protokoll %s ist %s\n"
+
+#: utils/keytable/keytable.c:493
+#, c-format
+msgid "Bad value `%s' for protocol\n"
 msgstr ""
-"%s: Schl=C3=BCsselcode =C2=BB%s=C2=AB nicht erkannt, keine Abbildung f=C3=
=BCr Scancode %d\n"
=20
-#: utils/keytable/keytable.c:429
+#: utils/keytable/keytable.c:514
 #, c-format
-msgid "%s: keycode `%s' not recognised, no mapping\n"
-msgstr "%s: Schl=C3=BCsselcode =C2=BB%s=C2=AB nicht erkannt, keine Abbildu=
ng\n"
+msgid "No [protocols.scancodes] section\n"
+msgstr ""
+
+#: utils/keytable/keytable.c:530
+#, fuzzy, c-format
+msgid "Invalid value `%s'\n"
+msgstr "ung=C3=BCltige Einschaltdauer =C2=BB%s=C2=AB"
+
+#: utils/keytable/keytable.c:535
+#, c-format
+msgid "Bad value `%s' for keycode\n"
+msgstr ""
+
+#: utils/keytable/keytable.c:550
+#, fuzzy, c-format
+msgid "keycode `%s' not recognised, no mapping for scancode %s\n"
+msgstr ""
+"%s: Schl=C3=BCsselcode =C2=BB%s=C2=AB nicht erkannt, keine Abbildung f=C3=
=BCr Scancode %d\n"
+
+#: utils/keytable/keytable.c:580
+#, fuzzy, c-format
+msgid "Parsing %s keycode file as toml\n"
+msgstr "Konfigurationsdatei %s wird ausgewertet\n"
+
+#: utils/keytable/keytable.c:589
+#, fuzzy, c-format
+msgid "Failed to parse toml: %s\n"
+msgstr "Lesen von Tabellendatei %s fehlgeschlagen"
+
+#: utils/keytable/keytable.c:595
+#, fuzzy, c-format
+msgid "Missing [protocols] section\n"
+msgstr "%s-Protokoll %s\n"
+
+#: utils/keytable/keytable.c:612
+#, fuzzy, c-format
+msgid "No protocols found\n"
+msgstr "Fehler: Protokoll =C2=BB%s=C2=AB nicht gefunden\n"
=20
-#: utils/keytable/keytable.c:462
+#: utils/keytable/keytable.c:644
 #, c-format
 msgid "Parsing %s config file\n"
 msgstr "Konfigurationsdatei %s wird ausgewertet\n"
=20
-#: utils/keytable/keytable.c:466
+#: utils/keytable/keytable.c:648
 msgid "opening keycode file"
 msgstr "Schl=C3=BCsselcodedatei wird ge=C3=B6ffnet"
=20
-#: utils/keytable/keytable.c:493
+#: utils/keytable/keytable.c:675
 #, c-format
 msgid "Driver %s, Table %s =3D> file %s\n"
 msgstr "Treiber %s, Tabelle %s =3D> Datei %s\n"
=20
-#: utils/keytable/keytable.c:517
-#, c-format
-msgid "Invalid parameter on line %d of %s\n"
-msgstr "ung=C3=BCltiger Parameter in Zeile %d von %s\n"
-
-#: utils/keytable/keytable.c:542
+#: utils/keytable/keytable.c:724
 #, c-format
 msgid "Invalid delay: %s"
 msgstr "ung=C3=BCltige Verz=C3=B6gerung: =C2=BB%s=C2=AB"
=20
-#: utils/keytable/keytable.c:547
+#: utils/keytable/keytable.c:729
 #, c-format
 msgid "Invalid period: %s"
 msgstr "ung=C3=BCltige Zeitspanne: %s"
=20
-#: utils/keytable/keytable.c:560 utils/keytable/keytable.c:695
+#: utils/keytable/keytable.c:745
 #, c-format
 msgid "Failed to read table file %s"
 msgstr "Lesen von Tabellendatei %s fehlgeschlagen"
=20
-#: utils/keytable/keytable.c:564
+#: utils/keytable/keytable.c:747
 #, c-format
 msgid "Read %s table\n"
 msgstr "Lesen von Tabelle %s\n"
=20
-#: utils/keytable/keytable.c:573
+#: utils/keytable/keytable.c:753
 #, c-format
 msgid "Failed to read config file %s"
 msgstr "Lesen der Konfigurationsdatei %s fehlgeschlagen"
=20
-#: utils/keytable/keytable.c:582
+#: utils/keytable/keytable.c:762
 #, c-format
 msgid "Missing scancode: %s"
 msgstr "fehlender Scancode: %s"
=20
-#: utils/keytable/keytable.c:588 utils/keytable/keytable.c:659
+#: utils/keytable/keytable.c:768 utils/keytable/keytable.c:839
 msgid "No memory!\n"
 msgstr "Kein Speicher!\n"
=20
-#: utils/keytable/keytable.c:595
+#: utils/keytable/keytable.c:775
 #, c-format
 msgid "Invalid scancode: %s"
 msgstr "ung=C3=BCltiger Scancode: =C2=BB%s=C2=AB"
=20
-#: utils/keytable/keytable.c:602
+#: utils/keytable/keytable.c:782
 msgid "Missing keycode"
 msgstr "fehlender Schl=C3=BCsselcode"
=20
-#: utils/keytable/keytable.c:611 utils/keytable/keytable.c:675
+#: utils/keytable/keytable.c:791 utils/keytable/keytable.c:855
 #, c-format
 msgid "Unknown keycode: %s"
 msgstr "unbekannter Schl=C3=BCsselcode: %s"
=20
-#: utils/keytable/keytable.c:619
+#: utils/keytable/keytable.c:799
 #, c-format
 msgid "scancode 0x%04x=3D%u\n"
 msgstr "Scancode 0x%04x=3D%u\n"
=20
-#: utils/keytable/keytable.c:653
+#: utils/keytable/keytable.c:833
 #, c-format
 msgid "Missing parameter name: %s"
 msgstr "fehlender Parametername: %s"
=20
-#: utils/keytable/keytable.c:668
+#: utils/keytable/keytable.c:848
 msgid "Missing value"
 msgstr "fehlender Wert"
=20
-#: utils/keytable/keytable.c:680
-#, c-format
-msgid "parameter %s=3D%ld\n"
+#: utils/keytable/keytable.c:860
+#, fuzzy, c-format
+msgid "parameter %s=3D%d\n"
 msgstr "Parameter %s=3D%ld\n"
=20
-#: utils/keytable/keytable.c:703 utils/dvb/dvb-fe-tool.c:160
+#: utils/keytable/keytable.c:874 utils/dvb/dvb-fe-tool.c:160
 #: utils/dvb/dvb-format-convert.c:88 utils/dvb/dvbv5-scan.c:421
-#: utils/dvb/dvbv5-zap.c:715
+#: utils/dvb/dvbv5-zap.c:714
 #, c-format
 msgid ""
 "\n"
@@ -302,568 +382,544 @@ msgstr ""
 "\n"
 "Melden Sie Fehler an %s.\n"
=20
-#: utils/keytable/keytable.c:731
+#: utils/keytable/keytable.c:902
 #, c-format
 msgid "scancode 0x%04x =3D %s (0x%02x)\n"
 msgstr "Scancode 0x%04x =3D %s (0x%02x)\n"
=20
-#: utils/keytable/keytable.c:737
+#: utils/keytable/keytable.c:908
 #, c-format
 msgid "scancode 0x%04x =3D '%c' (0x%02x)\n"
 msgstr "Scancode 0x%04x =3D =C2=BB%c=C2=AB (0x%02x)\n"
=20
-#: utils/keytable/keytable.c:739
+#: utils/keytable/keytable.c:910
 #, c-format
 msgid "scancode 0x%04x =3D 0x%02x\n"
 msgstr "Scancode 0x%04x =3D 0x%02x\n"
=20
-#: utils/keytable/keytable.c:790 utils/keytable/keytable.c:1218
+#: utils/keytable/keytable.c:961 utils/keytable/keytable.c:1368
 #, c-format
 msgid "Couldn't find any node at %s%s*.\n"
 msgstr "Bei %s%s* konnte kein Knoten gefunden werden.\n"
=20
-#: utils/keytable/keytable.c:799
+#: utils/keytable/keytable.c:970
 msgid "Seek dir"
 msgstr "Suchverzeichnis"
=20
-#: utils/keytable/keytable.c:831
+#: utils/keytable/keytable.c:1002
 #, c-format
 msgid "Parsing uevent %s\n"
 msgstr "Uevent %s wird ausgewertet.\n"
=20
-#: utils/keytable/keytable.c:855
+#: utils/keytable/keytable.c:1026
 #, c-format
 msgid "Error on uevent information\n"
 msgstr "Fehler bei Uevent-Information\n"
=20
-#: utils/keytable/keytable.c:871
+#: utils/keytable/keytable.c:1042
 #, c-format
 msgid "%s uevent %s=3D%s\n"
 msgstr "%s Uevent %s=3D%s\n"
=20
-#: utils/keytable/keytable.c:900
+#: utils/keytable/keytable.c:1071
 #, c-format
 msgid "No devices found\n"
 msgstr "keine Ger=C3=A4te gefunden\n"
=20
-#: utils/keytable/keytable.c:906
+#: utils/keytable/keytable.c:1077
 #, c-format
 msgid "Found device %s\n"
 msgstr "Ger=C3=A4t %s gefunden\n"
=20
-#: utils/keytable/keytable.c:930
+#: utils/keytable/keytable.c:1101
 #, c-format
 msgid "Not found device %s\n"
 msgstr "Ger=C3=A4t %s nicht gefunden\n"
=20
-#: utils/keytable/keytable.c:986
+#: utils/keytable/keytable.c:1136
 #, c-format
 msgid "%s protocol %s\n"
 msgstr "%s-Protokoll %s\n"
=20
-#: utils/keytable/keytable.c:1051
+#: utils/keytable/keytable.c:1201
 #, c-format
 msgid "%s has invalid content: '%s'\n"
 msgstr "%s hat ung=C3=BCltigen Inhalt: =C2=BB%s=C2=AB\n"
=20
-#: utils/keytable/keytable.c:1058
+#: utils/keytable/keytable.c:1208
 #, c-format
 msgid "protocol %s is %s\n"
 msgstr "Protokoll %s ist %s\n"
=20
-#: utils/keytable/keytable.c:1059 utils/keytable/keytable.c:1126
+#: utils/keytable/keytable.c:1209 utils/keytable/keytable.c:1276
 msgid "enabled"
 msgstr "aktiviert"
=20
-#: utils/keytable/keytable.c:1059 utils/keytable/keytable.c:1126
+#: utils/keytable/keytable.c:1209 utils/keytable/keytable.c:1276
 msgid "disabled"
 msgstr "deaktiviert"
=20
-#: utils/keytable/keytable.c:1125
+#: utils/keytable/keytable.c:1275
 #, c-format
 msgid "%s protocol %s (%s)\n"
 msgstr "%s-Protokoll %s (%s)\n"
=20
-#: utils/keytable/keytable.c:1153
+#: utils/keytable/keytable.c:1303
 #, c-format
 msgid "Protocols for device can not be changed\n"
 msgstr "Protokolle f=C3=BCr das Ger=C3=A4t k=C3=B6nnen nicht ge=C3=A4ndert=
 werden.\n"
=20
-#: utils/keytable/keytable.c:1210
+#: utils/keytable/keytable.c:1360
 #, c-format
 msgid "Found more than one input interface. This is currently unsupported\=
n"
 msgstr ""
 "Es wurde mehr als eine Eingabeschnittstelle gefunden. Dies wird derzeit "
 "nicht unterst=C3=BCtzt.\n"
=20
-#: utils/keytable/keytable.c:1214
+#: utils/keytable/keytable.c:1364
 #, c-format
 msgid "Input sysfs node is %s\n"
 msgstr "Eingabe-Sysfs-Knoten ist %s\n"
=20
-#: utils/keytable/keytable.c:1226
+#: utils/keytable/keytable.c:1376
 #, c-format
 msgid "Found more than one event interface. This is currently unsupported\=
n"
 msgstr ""
 "Es wurde mehr als eine Ereignisschnittstelle gefunden. Dies wird derzeit "
 "nicht unterst=C3=BCtzt.\n"
=20
-#: utils/keytable/keytable.c:1230
+#: utils/keytable/keytable.c:1380
 #, c-format
 msgid "Event sysfs node is %s\n"
 msgstr "Ereignis-Sysfs-Knoten ist %s\n"
=20
-#: utils/keytable/keytable.c:1249
+#: utils/keytable/keytable.c:1399
 #, c-format
 msgid "Input device name not found.\n"
 msgstr "Eingabeger=C3=A4tename nicht gefunden\n"
=20
-#: utils/keytable/keytable.c:1274
+#: utils/keytable/keytable.c:1424
 #, c-format
 msgid "input device is %s\n"
 msgstr "Eingabeger=C3=A4t ist %s\n"
=20
-#: utils/keytable/keytable.c:1352
+#: utils/keytable/keytable.c:1502
 #, c-format
 msgid "Unable to query evdev protocol version: %s\n"
 msgstr "Edev-Protokollversion kann nicht abgefragt werden: %s\n"
=20
-#: utils/keytable/keytable.c:1357
+#: utils/keytable/keytable.c:1507
 #, c-format
 msgid "Input Protocol version: 0x%08x\n"
 msgstr "Eingabeprotokollversion: 0x%08x\n"
=20
-#: utils/keytable/keytable.c:1388
+#: utils/keytable/keytable.c:1538
 #, c-format
 msgid "Deleting entry %d\n"
 msgstr "Eintrag %d wird gel=C3=B6scht.\n"
=20
-#: utils/keytable/keytable.c:1410
+#: utils/keytable/keytable.c:1560
 #, c-format
 msgid "Setting scancode 0x%04x with 0x%04x via "
 msgstr "Scancode 0x%04x mit 0x%04x wird gesetzt =C3=BCber "
=20
-#: utils/keytable/keytable.c:1428
+#: utils/keytable/keytable.c:1578
 #, c-format
 msgid "Current kernel protocols: "
 msgstr "Aktuelle Kernelprotokolle: "
=20
-#: utils/keytable/keytable.c:1430
+#: utils/keytable/keytable.c:1580
 #, c-format
 msgid "Enabled kernel protocols: "
 msgstr "Aktivierte Kernelprotokolle: "
=20
-#: utils/keytable/keytable.c:1454
+#: utils/keytable/keytable.c:1604
 #, c-format
 msgid "%llu.%06llu: "
 msgstr "%llu.%06llu: "
=20
-#: utils/keytable/keytable.c:1459
+#: utils/keytable/keytable.c:1609
 #, c-format
 msgid "lirc protocol(%s): scancode =3D 0x%llx"
 msgstr "Linux-Infrarotfernbedienungsprotokoll(%s): Scancode =3D 0x%llx"
=20
-#: utils/keytable/keytable.c:1462
+#: utils/keytable/keytable.c:1612
 #, c-format
 msgid "lirc protocol(%d): scancode =3D 0x%llx"
 msgstr "Linux-Infrarotfernbedienungsprotokoll(%d): Scancode =3D 0x%llx"
=20
-#: utils/keytable/keytable.c:1466
+#: utils/keytable/keytable.c:1616
 #, c-format
 msgid " repeat"
 msgstr " wiederholen"
=20
-#: utils/keytable/keytable.c:1468
+#: utils/keytable/keytable.c:1618
 #, c-format
 msgid " toggle=3D1"
 msgstr " umschalten=3D1"
=20
-#: utils/keytable/keytable.c:1489
+#: utils/keytable/keytable.c:1639
 msgid "Can't open lirc device"
 msgstr "Linux-Infrarotfernbedienungsger=C3=A4t kann nicht ge=C3=B6ffnet we=
rden"
=20
-#: utils/keytable/keytable.c:1499
+#: utils/keytable/keytable.c:1649
 #, c-format
 msgid "Testing events. Please, press CTRL-C to abort.\n"
 msgstr ""
 "Ereignisse werden getestet. Bitte dr=C3=BCcken Sie STRG-C, um abzubrechen=
=2E\n"
=20
-#: utils/keytable/keytable.c:1510
+#: utils/keytable/keytable.c:1660
 msgid "poll returned error"
 msgstr "Abfrage gab Fehler zur=C3=BCck"
=20
-#: utils/keytable/keytable.c:1519
+#: utils/keytable/keytable.c:1669
 msgid "Error reading lirc scancode"
 msgstr "Fehler beim Lesen des Linux-Infrarotfernbedienungs-Scancodes"
=20
-#: utils/keytable/keytable.c:1530
+#: utils/keytable/keytable.c:1680
 msgid "Error reading event"
 msgstr "Fehler beim Lesen des Ereignisses"
=20
-#: utils/keytable/keytable.c:1535
+#: utils/keytable/keytable.c:1685
 #, c-format
 msgid "%ld.%06ld: event type %s(0x%02x)"
 msgstr "%ld.%06ld: Ereignistyp %s(0x%02x)"
=20
-#: utils/keytable/keytable.c:1544
+#: utils/keytable/keytable.c:1694
 #, c-format
 msgid " key_%s: %s(0x%04x)\n"
 msgstr " key_%s: %s(0x%04x)\n"
=20
-#: utils/keytable/keytable.c:1545
+#: utils/keytable/keytable.c:1695
 msgid "up"
 msgstr "hoch"
=20
-#: utils/keytable/keytable.c:1545
+#: utils/keytable/keytable.c:1695
 msgid "down"
 msgstr "runter"
=20
-#: utils/keytable/keytable.c:1550 utils/keytable/keytable.c:1556
+#: utils/keytable/keytable.c:1700 utils/keytable/keytable.c:1706
 #, c-format
 msgid ": %s (0x%04x) value=3D%d\n"
 msgstr ": %s (0x%04x) Wert=3D%d\n"
=20
-#: utils/keytable/keytable.c:1563
+#: utils/keytable/keytable.c:1713
 #, c-format
 msgid ": scancode =3D 0x%02x\n"
 msgstr ": Scancode =3D 0x%02x\n"
=20
-#: utils/keytable/keytable.c:1565
+#: utils/keytable/keytable.c:1715
 #, c-format
 msgid ": code =3D %s(0x%02x), value =3D %d\n"
 msgstr ": Code =3D %s(0x%02x), Wert =3D %d\n"
=20
-#: utils/keytable/keytable.c:1570
+#: utils/keytable/keytable.c:1720
 #, c-format
 msgid ": value =3D %d\n"
 msgstr ": Wert =3D %d\n"
=20
-#: utils/keytable/keytable.c:1579
+#: utils/keytable/keytable.c:1729
 #, c-format
 msgid ": code =3D 0x%02x, value =3D %d\n"
 msgstr ": Code =3D 0x%02x, Wert =3D %d\n"
=20
-#: utils/keytable/keytable.c:1648
+#: utils/keytable/keytable.c:1798
 #, c-format
 msgid "Changed Repeat delay to %d ms and repeat period to %d ms\n"
 msgstr ""
 "Wiederholungsverz=C3=B6gerung auf %d ms und Wiederholungsdauer auf %d ms "
 "ge=C3=A4ndert\n"
=20
-#: utils/keytable/keytable.c:1662
+#: utils/keytable/keytable.c:1812
 #, c-format
 msgid "Repeat delay =3D %d ms, repeat period =3D %d ms\n"
 msgstr "Wiederholungsverz=C3=B6gerung =3D %d ms, Wiederholungsperiode =3D =
%d ms\n"
=20
-#: utils/keytable/keytable.c:1681
+#: utils/keytable/keytable.c:1831
 #, c-format
 msgid "%sName: %.*s\n"
 msgstr "%sName: %.*s\n"
=20
-#: utils/keytable/keytable.c:1694
+#: utils/keytable/keytable.c:1844
 #, c-format
 msgid "%sbus: %d, vendor/product: %04x:%04x, version: 0x%04x\n"
 msgstr "%sbus: %d, Anbieter/Produkt: %04x:%04x, Version: 0x%04x\n"
=20
-#: utils/keytable/keytable.c:1725
+#: utils/keytable/keytable.c:1870
 #, c-format
 msgid "%s: not a raw IR receiver\n"
 msgstr "%s: kein Empfangsger=C3=A4t f=C3=BCr unverarbeitetes Infrarot\n"
=20
-#: utils/keytable/keytable.c:1773
+#: utils/keytable/keytable.c:1908
 #, c-format
 msgid "\tAttached BPF protocols: "
 msgstr "\tangef=C3=BCgte BPF-Protokolle: "
=20
-#: utils/keytable/keytable.c:1791
+#: utils/keytable/keytable.c:1926
 #, c-format
 msgid "\n"
 msgstr "\n"
=20
-#: utils/keytable/keytable.c:1794
+#: utils/keytable/keytable.c:1929
 #, c-format
 msgid "\tAttached BPF protocols: %m\n"
 msgstr "\ttangef=C3=BCgte BPF-Protokolle: %m\n"
=20
-#: utils/keytable/keytable.c:1829
+#: utils/keytable/keytable.c:1964
 #, c-format
 msgid "BPF protocol prog_id %d\n"
 msgstr "BPF-Protokoll prog_id %d\n"
=20
-#: utils/keytable/keytable.c:1833
+#: utils/keytable/keytable.c:1968
 #, c-format
 msgid "Failed to get BPF prog id %u: %m\n"
 msgstr "Holen der BPF-Programmkennung %u fehlgeschlagen: %m\n"
=20
-#: utils/keytable/keytable.c:1845
+#: utils/keytable/keytable.c:1980
 #, c-format
 msgid "BPF protocols removed\n"
 msgstr "BPF-Protokolle entfernt\n"
=20
-#: utils/keytable/keytable.c:1850
+#: utils/keytable/keytable.c:1985
 #, c-format
 msgid "error: ir-keytable was compiled without BPF support\n"
 msgstr ""
 "Fehler: Infrarot-Schl=C3=BCsselcodetabelle wurde ohne BPF-Unterst=C3=BCtz=
ung "
 "kompiliert\n"
=20
-#: utils/keytable/keytable.c:1869
-#, c-format
-msgid "Found %s with:\n"
+#: utils/keytable/keytable.c:2003
+#, fuzzy, c-format
+msgid "Found %s (%s) with:\n"
 msgstr "%s gefunden mit:\n"
=20
-#: utils/keytable/keytable.c:1872
+#: utils/keytable/keytable.c:2007
 #, c-format
 msgid "\tName: %s\n"
 msgstr "\tName: %s\n"
=20
-#: utils/keytable/keytable.c:1874
-#, c-format
-msgid "\tDriver: %s\n"
-msgstr "\tTreiber %s\n"
-
-#: utils/keytable/keytable.c:1876
-#, c-format
-msgid "\tDefault keymap: %s\n"
-msgstr "\tStandardschl=C3=BCsselcodeabbildung: %s\n"
-
-#: utils/keytable/keytable.c:1878
-#, c-format
-msgid "\tInput device: %s\n"
-msgstr "\tEingabeger=C3=A4t: %s\n"
+#: utils/keytable/keytable.c:2009
+#, fuzzy, c-format
+msgid "\tDriver: %s, table: %s\n"
+msgstr "Treiber %s, Tabelle %s =3D> Datei %s\n"
=20
-#: utils/keytable/keytable.c:1881
+#: utils/keytable/keytable.c:2013
 #, c-format
 msgid "\tLIRC device: %s\n"
 msgstr "\tLinux-Infrarotfernbedienung : %s\n"
=20
-#: utils/keytable/keytable.c:1885
+#: utils/keytable/keytable.c:2017
 #, c-format
 msgid "\tSupported kernel protocols: "
 msgstr "\tunterst=C3=BCtzte Kernelprotokolle: "
=20
-#: utils/keytable/keytable.c:1897
+#: utils/keytable/keytable.c:2029
 #, c-format
 msgid "\tExtra capabilities: <access denied>\n"
 msgstr "\tzus=C3=A4tzliche F=C3=A4higkeiten: <Zugriff verweigert>\n"
=20
-#: utils/keytable/keytable.c:1913 utils/keytable/keytable.c:1920
+#: utils/keytable/keytable.c:2045 utils/keytable/keytable.c:2052
 #, c-format
 msgid "asprintf failed: %m\n"
 msgstr "asprintf fehlgeschlagen: %m\n"
=20
-#: utils/keytable/keytable.c:1925
+#: utils/keytable/keytable.c:2057
 #, c-format
 msgid "Can't find %s bpf protocol in %s or %s\n"
 msgstr "BPF-Protokoll %s konnte weder in %s noch in %s gefunden werden.\n"
=20
-#: utils/keytable/keytable.c:1987
-#, c-format
-msgid ""
-"Auto-mode can be used only with --read, --verbose and --sysdev options\n"
+#: utils/keytable/keytable.c:2101
+#, fuzzy
+msgid "Can't open device"
+msgstr "Linux-Infrarotfernbedienungsger=C3=A4t kann nicht ge=C3=B6ffnet we=
rden"
+
+#: utils/keytable/keytable.c:2119
+#, fuzzy, c-format
+msgid "Auto-mode can be used only with --read, --debug and --sysdev option=
s\n"
 msgstr ""
 "Automatischer Modus kann nur mit den Optionen --read, --verbose und --sys=
dev "
 "benutzt werden.\n"
=20
+#: utils/keytable/keytable.c:2153
+#, c-format
+msgid "Table for %s, %s not found. Keep as-is\n"
+msgstr "Tabelle f=C3=BCr %s, %s nicht gefunden. Istzustand beibehalten\n"
+
 # Treibername, Schl=C3=BCsseltabellenname, Dateiname
-#: utils/keytable/keytable.c:2017
+#: utils/keytable/keytable.c:2158
 #, c-format
 msgid "Table for %s, %s is on %s file.\n"
 msgstr "Tabelle f=C3=BCr %s, %s ist in der Datei %s.\n"
=20
-#: utils/keytable/keytable.c:2026
+#: utils/keytable/keytable.c:2165
 #, c-format
 msgid "Can't load %s table\n"
 msgstr "Tabelle %s kann nicht geladen werden.\n"
=20
-#: utils/keytable/keytable.c:2046
+#: utils/keytable/keytable.c:2182
 #, c-format
 msgid "Can't load %s table from %s or %s\n"
 msgstr "Tabelle %s kann nicht von %s oder %s geladen werden.\n"
=20
-#: utils/keytable/keytable.c:2054
+#: utils/keytable/keytable.c:2187
 #, c-format
 msgid "Empty table %s\n"
 msgstr "leere Tabelle %s\n"
=20
-#: utils/keytable/keytable.c:2063
-#, c-format
-msgid "Table for %s, %s not found. Keep as-is\n"
-msgstr "Tabelle f=C3=BCr %s, %s nicht gefunden. Istzustand beibehalten\n"
-
-#: utils/keytable/keytable.c:2070
+#: utils/keytable/keytable.c:2194
 #, c-format
 msgid "Opening %s\n"
 msgstr "%s wird ge=C3=B6ffnet.\n"
=20
-#: utils/keytable/keytable.c:2086
+#: utils/keytable/keytable.c:2210
 #, c-format
 msgid "Old keytable cleared\n"
 msgstr "alte Schl=C3=BCsseltabelle geleert\n"
=20
-#: utils/keytable/keytable.c:2094
+#: utils/keytable/keytable.c:2218
 #, c-format
 msgid "Wrote %d keycode(s) to driver\n"
 msgstr "%d Schl=C3=BCsselcode(s) wurden in den Treiber geschrieben.\n"
=20
-#: utils/keytable/keytable.c:2106
+#: utils/keytable/keytable.c:2229
 #, c-format
 msgid "Couldn't change the IR protocols\n"
 msgstr "Die Fernbedienungsprotokolle konnten nicht ge=C3=A4ndert werden\n"
=20
-#: utils/keytable/keytable.c:2108
+#: utils/keytable/keytable.c:2231
 #, c-format
 msgid "Protocols changed to "
 msgstr "Protokolle ge=C3=A4ndert in "
=20
-#: utils/keytable/keytable.c:2118
+#: utils/keytable/keytable.c:2241
 #, c-format
 msgid "Error: unable to attach bpf program, lirc device name was not found=
\n"
 msgstr ""
-"Fehler: BPF-Programm kann nicht angef=C3=BCgt werden, Name der "
-"Linux-Infrarotfernbedienung wurde nicht gefunden\n"
+"Fehler: BPF-Programm kann nicht angef=C3=BCgt werden, Name der Linux-"
+"Infrarotfernbedienung wurde nicht gefunden\n"
=20
-#: utils/keytable/keytable.c:2126
+#: utils/keytable/keytable.c:2249
 #, c-format
 msgid "Loaded BPF protocol %s\n"
 msgstr "geladenes BPF-Protokoll %s\n"
=20
-#: utils/ir-ctl/ir-ctl.c:110
-msgid "DEV"
-msgstr "DEV"
-
 # LIRC =3D Linux Infrared Remote Control
-#: utils/ir-ctl/ir-ctl.c:110
+#: utils/ir-ctl/ir-ctl.c:103
 msgid "lirc device to use"
 msgstr "zu verwendende Linux-Infrarotfernbedienung"
=20
-#: utils/ir-ctl/ir-ctl.c:111
+#: utils/ir-ctl/ir-ctl.c:104
 msgid "list lirc device features"
 msgstr "Liste der Linux-Infrarotfernbedienungsfunktionalit=C3=A4ten"
=20
-#: utils/ir-ctl/ir-ctl.c:112 utils/ir-ctl/ir-ctl.c:113
+#: utils/ir-ctl/ir-ctl.c:105 utils/ir-ctl/ir-ctl.c:106
 msgid "FILE"
 msgstr "FILE"
=20
-#: utils/ir-ctl/ir-ctl.c:112
+#: utils/ir-ctl/ir-ctl.c:105
 msgid "receive IR to stdout or file"
 msgstr "empf=C3=A4ngt Infrarot auf Standardausgabe oder Datei"
=20
-#: utils/ir-ctl/ir-ctl.c:113
+#: utils/ir-ctl/ir-ctl.c:106
 msgid "send IR pulse and space file"
 msgstr "sendet Fernbedienungsimpuls und Datei mit Leerzeichen"
=20
-#: utils/ir-ctl/ir-ctl.c:114
+#: utils/ir-ctl/ir-ctl.c:107
 msgid "SCANCODE"
 msgstr "SCANCODE"
=20
-#: utils/ir-ctl/ir-ctl.c:114
+#: utils/ir-ctl/ir-ctl.c:107
 msgid "send IR scancode in protocol specified"
 msgstr "sendet Fernbedienungs-Scancode im angegebenen Protokoll"
=20
-#: utils/ir-ctl/ir-ctl.c:115
-msgid "KEYCODE"
-msgstr "SCHL=C3=9CSSELCODE"
-
-#: utils/ir-ctl/ir-ctl.c:115
-msgid "send IR keycode from keymap"
-msgstr "sendet Infrarotschl=C3=BCsselcode aus der Schl=C3=BCsselcode-Abbil=
dung"
-
-#: utils/ir-ctl/ir-ctl.c:116
+#: utils/ir-ctl/ir-ctl.c:108
 msgid "verbose output"
 msgstr "detaillierte Ausgabe"
=20
-#: utils/ir-ctl/ir-ctl.c:117
+#: utils/ir-ctl/ir-ctl.c:109
 msgid "Receiving options:"
 msgstr "Empfangsoptionen:"
=20
-#: utils/ir-ctl/ir-ctl.c:118
+#: utils/ir-ctl/ir-ctl.c:110
 msgid "end receiving after first message"
 msgstr "Empfang nach erster Nachricht beenden"
=20
-#: utils/ir-ctl/ir-ctl.c:119
-msgid "output in mode2 format"
-msgstr "Ausgabe im Modus-2-Format "
-
-#: utils/ir-ctl/ir-ctl.c:120
+#: utils/ir-ctl/ir-ctl.c:111
 msgid "use wideband receiver aka learning mode"
 msgstr "Breitbandempf=C3=A4nger alias Lernmodus verwenden"
=20
-#: utils/ir-ctl/ir-ctl.c:121
-msgid "use narrowband receiver, disable learning mode"
+#: utils/ir-ctl/ir-ctl.c:112
+#, fuzzy
+msgid "use normal narrowband receiver, disable learning mode"
 msgstr "normalen Schmalbandempf=C3=A4nger verwenden, Lernmodus deaktiviere=
n"
=20
-#: utils/ir-ctl/ir-ctl.c:122
+#: utils/ir-ctl/ir-ctl.c:113
 msgid "RANGE"
 msgstr "RANGE"
=20
-#: utils/ir-ctl/ir-ctl.c:122
+#: utils/ir-ctl/ir-ctl.c:113
 msgid "set receiver carrier range"
 msgstr "setzt Tr=C3=A4gerbereich des Empf=C3=A4ngers"
=20
-#: utils/ir-ctl/ir-ctl.c:123
+#: utils/ir-ctl/ir-ctl.c:114
 msgid "report carrier frequency"
 msgstr "berichtet die Tr=C3=A4gerfrequenz"
=20
-#: utils/ir-ctl/ir-ctl.c:124
+#: utils/ir-ctl/ir-ctl.c:115
 msgid "disable reporting carrier frequency"
 msgstr "deaktiviert das Berichten der Tr=C3=A4gerfrequenz"
=20
-#: utils/ir-ctl/ir-ctl.c:125
+#: utils/ir-ctl/ir-ctl.c:116
 msgid "TIMEOUT"
 msgstr "TIMEOUT"
=20
-#: utils/ir-ctl/ir-ctl.c:125
+#: utils/ir-ctl/ir-ctl.c:116
 msgid "set receiving timeout"
 msgstr "setzt die Empfangszeit=C3=BCberschreitung"
=20
-#: utils/ir-ctl/ir-ctl.c:126
+#: utils/ir-ctl/ir-ctl.c:117
 msgid "Sending options:"
 msgstr "Sendeoptionen:"
=20
-#: utils/ir-ctl/ir-ctl.c:127
-msgid "use keymap to send key from"
-msgstr "Schl=C3=BCsselcodeabbildung verwenden zum Schl=C3=BCsselversand vo=
n"
-
-#: utils/ir-ctl/ir-ctl.c:128
+#: utils/ir-ctl/ir-ctl.c:118
 msgid "CARRIER"
 msgstr "CARRIER"
=20
-#: utils/ir-ctl/ir-ctl.c:128
+#: utils/ir-ctl/ir-ctl.c:118
 msgid "set send carrier"
 msgstr "setzt den Sendetr=C3=A4ger"
=20
-#: utils/ir-ctl/ir-ctl.c:129
+#: utils/ir-ctl/ir-ctl.c:119
 msgid "DUTY"
 msgstr "DUTY"
=20
-#: utils/ir-ctl/ir-ctl.c:129
-msgid "set send duty cycle"
+#: utils/ir-ctl/ir-ctl.c:119
+#, fuzzy
+msgid "set duty cycle"
 msgstr "setzt die Sendebetriebsdauer"
=20
-#: utils/ir-ctl/ir-ctl.c:130
+#: utils/ir-ctl/ir-ctl.c:120
 msgid "EMITTERS"
 msgstr "EMITTERS"
=20
-#: utils/ir-ctl/ir-ctl.c:130
+#: utils/ir-ctl/ir-ctl.c:120
 msgid "set send emitters"
 msgstr "setzt die Sendeimpulsgeber"
=20
-#: utils/ir-ctl/ir-ctl.c:131
+#: utils/ir-ctl/ir-ctl.c:121
 msgid "GAP"
 msgstr "ABSTAND"
=20
-#: utils/ir-ctl/ir-ctl.c:131
+#: utils/ir-ctl/ir-ctl.c:121
 msgid "set gap between files or scancodes"
 msgstr "setzt den Abstand zwischen Dateien oder Scancodes."
=20
-#: utils/ir-ctl/ir-ctl.c:136
+#: utils/ir-ctl/ir-ctl.c:126
+#, fuzzy
 msgid ""
 "--features\n"
 "--receive [save to file]\n"
 "--send [file to send]\n"
 "--scancode [scancode to send]\n"
-"--keycode [keycode to send]\n"
 "[to set lirc option]"
 msgstr ""
 "--features\n"
@@ -872,24 +928,23 @@ msgstr ""
 "--scancode [Scancode, der gesendet werden soll]\n"
 "[zum Setzen der Linux-Infrarotfernbedienungsoption]"
=20
-#: utils/ir-ctl/ir-ctl.c:144
+#: utils/ir-ctl/ir-ctl.c:133
+#, fuzzy
 msgid ""
 "\n"
 "Receive IR, send IR and list features of lirc device\n"
 "You will need permission on /dev/lirc for the program to work\n"
 "\n"
 "On the options below, the arguments are:\n"
-"  DEV      - the /dev/lirc* device to use\n"
+"  DEV\t    - the /dev/lirc* device to use\n"
 "  FILE     - a text file containing pulses and spaces\n"
 "  CARRIER  - the carrier frequency to use for sending\n"
 "  DUTY     - the duty cycle to use for sending\n"
 "  EMITTERS - comma separated list of emitters to use for sending, e.g. 1,=
2\n"
-"  GAP      - gap between sending in microseconds\n"
+"  GAP      - gap between pulse and files or scancodes in microseconds\n"
 "  RANGE    - set range of accepted carrier frequencies, e.g. 20000-40000\=
n"
 "  TIMEOUT  - set length of space before receiving stops in microseconds\n"
-"  KEYCODE  - key code in keymap\n"
 "  SCANCODE - protocol:scancode, e.g. nec:0xa814\n"
-"  KEYMAP   - a rc keymap file from which to send keys\n"
 "\n"
 "Note that most lirc setting have global state, i.e. the device will remai=
n\n"
 "in this state until set otherwise."
@@ -921,398 +976,355 @@ msgstr ""
 "bis\n"
 "es anderweitig gesetzt wird."
=20
-#: utils/ir-ctl/ir-ctl.c:219 utils/ir-ctl/ir-ctl.c:380
-#: utils/ir-ctl/ir-ctl.c:536
+#: utils/ir-ctl/ir-ctl.c:207
+#, c-format
+msgid "%s: could not open: %m\n"
+msgstr "%s: konnte nicht =C3=B6ffnen: %m\n"
+
+#: utils/ir-ctl/ir-ctl.c:213 utils/ir-ctl/ir-ctl.c:390
 #, c-format
 msgid "Failed to allocate memory\n"
 msgstr "Reservieren von Speicher fehlgeschlagen\n"
=20
-#: utils/ir-ctl/ir-ctl.c:238
+#: utils/ir-ctl/ir-ctl.c:231
 #, c-format
 msgid "warning: %s:%d: missing argument\n"
 msgstr "Warnung: %s:%d: fehlendes Argument\n"
=20
-#: utils/ir-ctl/ir-ctl.c:254
-#, c-format
+#: utils/ir-ctl/ir-ctl.c:247
+#, fuzzy, c-format
 msgid ""
-"error: %s:%d: scancode argument '%s' should be in protocol:scancode forma=
t\n"
+"error: %s:%d: scancode argument '%s' should in protocol:scancode format\n"
 msgstr ""
 "Fehler: %s:%d: Scancode-Argument =C2=BB%s=C2=AB sollte das Format Protoko=
ll:Scancode\n"
 "haben.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:263
+#: utils/ir-ctl/ir-ctl.c:254
 #, c-format
 msgid "error: %s:%d: protocol '%s' not found\n"
 msgstr "Fehler: %s:%d: Protokoll =C2=BB%s=C2=AB nicht gefunden\n"
=20
-#: utils/ir-ctl/ir-ctl.c:270
+#: utils/ir-ctl/ir-ctl.c:259
 #, c-format
 msgid "error: %s:%d: invalid scancode '%s'\n"
 msgstr "Fehler: %s:%d: ung=C3=BCltiger Scancode =C2=BB%s=C2=AB\n"
=20
-#: utils/ir-ctl/ir-ctl.c:277
+#: utils/ir-ctl/ir-ctl.c:264
 #, c-format
 msgid "error: %s:%d: no encoder available for `%s'\n"
 msgstr "Fehler: %s:%d: kein g=C3=BCltiger Kodierer f=C3=BCr =C2=BB%s=C2=AB=
 verf=C3=BCgbar\n"
=20
-#: utils/ir-ctl/ir-ctl.c:286
+#: utils/ir-ctl/ir-ctl.c:269
+#, fuzzy, c-format
+msgid "error: %s:%d: invalid scancode '%s' for protocol '%s'\n"
+msgstr "Fehler: %s:%d: ung=C3=BCltiger Scancode =C2=BB%s=C2=AB\n"
+
+#: utils/ir-ctl/ir-ctl.c:274
 #, c-format
 msgid "error: %s:%d: too much IR for one transmit\n"
 msgstr "Fehler: %s:%d: zu viel Infrarot f=C3=BCr einen Versendevorgang\n"
=20
-#: utils/ir-ctl/ir-ctl.c:294
+#: utils/ir-ctl/ir-ctl.c:280
 #, c-format
 msgid "error: %s:%d: carrier already specified\n"
 msgstr "Fehler: %s:%d: Tr=C3=A4ger bereits angegeben\n"
=20
-#: utils/ir-ctl/ir-ctl.c:305
+#: utils/ir-ctl/ir-ctl.c:291
 #, c-format
 msgid "warning: %s:%d: invalid argument '%s'\n"
 msgstr "Warnung: %s:%d: ung=C3=BCltiges Argument =C2=BB%s=C2=AB\n"
=20
-#: utils/ir-ctl/ir-ctl.c:311
+#: utils/ir-ctl/ir-ctl.c:297
 #, c-format
 msgid "warning: %s:%d: '%s' unexpected\n"
 msgstr "Warnung: %s:%d: =C2=BB%s=C2=AB nicht erwartet\n"
=20
-#: utils/ir-ctl/ir-ctl.c:318
+#: utils/ir-ctl/ir-ctl.c:304
 #, c-format
 msgid "warning: %s:%d: leading space ignored\n"
 msgstr "Warnung: %s:%d: f=C3=BChrendes Leerzeichen ignoriert\n"
=20
-#: utils/ir-ctl/ir-ctl.c:336
+#: utils/ir-ctl/ir-ctl.c:322
 #, c-format
 msgid "warning: %s:%d: carrier already specified\n"
 msgstr "Warnung: %s:%d: Tr=C3=A4ger bereits angegeben\n"
=20
-#: utils/ir-ctl/ir-ctl.c:341
+#: utils/ir-ctl/ir-ctl.c:327
 #, c-format
 msgid "warning: %s:%d: unknown keyword '%s' ignored\n"
 msgstr "Warnung: %s:%d: unbekanntes Schl=C3=BCsselwort =C2=BB%s=C2=AB igno=
riert\n"
=20
-#: utils/ir-ctl/ir-ctl.c:346 utils/ir-ctl/ir-ctl.c:437
+#: utils/ir-ctl/ir-ctl.c:332
 #, c-format
 msgid "warning: %s:%d: IR cannot exceed %u edges\n"
 msgstr "Warnung: %s:%d: Infrarot kann %u R=C3=A4nder nicht =C3=BCbersteige=
n\n"
=20
-#: utils/ir-ctl/ir-ctl.c:354 utils/ir-ctl/ir-ctl.c:448
+#: utils/ir-ctl/ir-ctl.c:340
 #, c-format
 msgid "%s: no pulses or spaces found\n"
 msgstr "%s: keine Impulse oder Leerzeichen gefunden\n"
=20
-#: utils/ir-ctl/ir-ctl.c:360 utils/ir-ctl/ir-ctl.c:454
+#: utils/ir-ctl/ir-ctl.c:346
 #, c-format
 msgid "warning: %s:%d: trailing space ignored\n"
 msgstr "Warnung: %s:%d: f=C3=BChrenden Leerzeichen ignoriert\n"
=20
-#: utils/ir-ctl/ir-ctl.c:402
-#, c-format
-msgid "%s:%d: error: expected integer, got `%s'\n"
-msgstr "%s:%d: Fehler: Ganzzahl erwartet, =C2=BB%s=C2=AB erhalten\n"
-
-#: utils/ir-ctl/ir-ctl.c:411
-#, c-format
-msgid "%s:%d: error: pulse found where space expected `%s'\n"
-msgstr "%s:%d: Fehler: Impuls gefunden, wo Pause erwartet wurde =C2=BB%s=
=C2=AB\n"
-
-#: utils/ir-ctl/ir-ctl.c:419
-#, c-format
-msgid "%s:%d: error: space found where pulse expected `%s'\n"
-msgstr "%s:%d: Fehler: Pause gefunden, wo Impuls erwartet wurde =C2=BB%s=
=C2=AB\n"
-
-#: utils/ir-ctl/ir-ctl.c:428
-#, c-format
-msgid "%s:%d: error: value `%s' out of range\n"
-msgstr "%s:%d: Fehler: Wert =C2=BB%s=C2=AB au=C3=9Ferhalb des Bereichs\n"
-
-#: utils/ir-ctl/ir-ctl.c:470
-#, c-format
-msgid "%s: could not open: %m\n"
-msgstr "%s: konnte nicht =C3=B6ffnen: %m\n"
-
-#: utils/ir-ctl/ir-ctl.c:500
-#, c-format
-msgid "%s: file is empty\n"
-msgstr "%s: Datei ist leer\n"
-
-#: utils/ir-ctl/ir-ctl.c:514
+#: utils/ir-ctl/ir-ctl.c:365
 #, c-format
 msgid "error: scancode '%s' must be in protocol:scancode format\n"
 msgstr "Fehler: Scancode =C2=BB%s=C2=AB muss das Format Protokoll:Scancode=
 haben\n"
=20
-#: utils/ir-ctl/ir-ctl.c:521
+#: utils/ir-ctl/ir-ctl.c:372
 #, c-format
 msgid "error: protocol '%s' not found\n"
 msgstr "Fehler: Protokoll =C2=BB%s=C2=AB nicht gefunden\n"
=20
-#: utils/ir-ctl/ir-ctl.c:528
+#: utils/ir-ctl/ir-ctl.c:379
 #, c-format
 msgid "error: invalid scancode '%s'\n"
 msgstr "Fehler: ung=C3=BCltiger Scancode =C2=BB%s=C2=AB\n"
=20
-#: utils/ir-ctl/ir-ctl.c:557
+#: utils/ir-ctl/ir-ctl.c:384
+#, fuzzy, c-format
+msgid "error: invalid scancode '%s' for protocol '%s'\n"
+msgstr "Fehler: ung=C3=BCltiger Scancode =C2=BB%s=C2=AB\n"
+
+#: utils/ir-ctl/ir-ctl.c:409
 msgid "features can not be combined with receive or send option"
 msgstr ""
 "Funktionalit=C3=A4ten k=C3=B6nnen nicht mit Empfangs- oder Sendeoptionen =
kombiniert "
 "werden."
=20
-#: utils/ir-ctl/ir-ctl.c:563
+#: utils/ir-ctl/ir-ctl.c:415
 msgid "receive can not be combined with features or send option"
 msgstr ""
 "Empfang kann nicht mit Funktionalit=C3=A4ten oder Sendeoptionen kombinier=
t werden."
=20
-#: utils/ir-ctl/ir-ctl.c:568
+#: utils/ir-ctl/ir-ctl.c:420
 msgid "receive filename already set"
 msgstr "Empfangsdateiname bereits gesetzt"
=20
-#: utils/ir-ctl/ir-ctl.c:584 utils/ir-ctl/ir-ctl.c:590
+#: utils/ir-ctl/ir-ctl.c:433 utils/ir-ctl/ir-ctl.c:439
 msgid "cannot enable and disable carrier reports"
 msgstr "Tr=C3=A4gerberichte k=C3=B6nnen nicht aktiviert oder deaktiviert w=
erden."
=20
-#: utils/ir-ctl/ir-ctl.c:596 utils/ir-ctl/ir-ctl.c:602
+#: utils/ir-ctl/ir-ctl.c:445 utils/ir-ctl/ir-ctl.c:451
 msgid "cannot use narrowband and wideband receiver at once"
 msgstr ""
 "Schmal- und Breitbandempf=C3=A4nger k=C3=B6nnen nicht gleichzeitig benutz=
t werden."
=20
-#: utils/ir-ctl/ir-ctl.c:612 utils/ir-ctl/ir-ctl.c:615
+#: utils/ir-ctl/ir-ctl.c:461 utils/ir-ctl/ir-ctl.c:464
 #, c-format
 msgid "cannot parse carrier range `%s'"
 msgstr "Tr=C3=A4gerbereich =C2=BB%s=C2=AB kann nicht ausgewertet werden."
=20
-#: utils/ir-ctl/ir-ctl.c:624
+#: utils/ir-ctl/ir-ctl.c:473
 #, c-format
 msgid "cannot parse timeout `%s'"
 msgstr "Zeit=C3=BCberschreitung =C2=BB%s=C2=AB kann nicht ausgewertet werd=
en."
=20
-#: utils/ir-ctl/ir-ctl.c:634
+#: utils/ir-ctl/ir-ctl.c:483
 #, c-format
 msgid "cannot parse carrier `%s'"
 msgstr "Tr=C3=A4ger =C2=BB%s=C2=AB kann nicht ausgewertet werden."
=20
-#: utils/ir-ctl/ir-ctl.c:639
+#: utils/ir-ctl/ir-ctl.c:488
 #, c-format
 msgid "cannot parse emitters `%s'"
 msgstr "Versender =C2=BB%s=C2=AB kann nicht ausgewertet werden."
=20
-#: utils/ir-ctl/ir-ctl.c:644
+#: utils/ir-ctl/ir-ctl.c:493
 #, c-format
 msgid "cannot parse gap `%s'"
 msgstr "Abstand =C2=BB%s=C2=AB kann nicht ausgewertet werden."
=20
-#: utils/ir-ctl/ir-ctl.c:649
+#: utils/ir-ctl/ir-ctl.c:498
 #, c-format
 msgid "invalid duty cycle `%s'"
 msgstr "ung=C3=BCltige Einschaltdauer =C2=BB%s=C2=AB"
=20
-#: utils/ir-ctl/ir-ctl.c:653 utils/ir-ctl/ir-ctl.c:669
+#: utils/ir-ctl/ir-ctl.c:502 utils/ir-ctl/ir-ctl.c:518
 msgid "send can not be combined with receive or features option"
 msgstr ""
-"Senden kann nicht mit Empfangs- oder Funktionalit=C3=A4tenoption kombinie=
rt werden."
-
-#: utils/ir-ctl/ir-ctl.c:686
-msgid "key send can not be combined with receive or features option"
-msgstr ""
-"Senden des Schl=C3=BCssels kann nicht mit Empfangs- oder Funktionalit=C3=
=A4tenoption "
-"kombiniert werden."
-
-#: utils/ir-ctl/ir-ctl.c:790
-#, c-format
-msgid "error: protocol '%s' not supported\n"
-msgstr "Fehler: Protokoll =C2=BB%s=C2=AB nicht unterst=C3=BCtzt\n"
-
-#: utils/ir-ctl/ir-ctl.c:797
-#, c-format
-msgid "error: keycode `%s' not found in keymap\n"
-msgstr "Fehler: Schl=C3=BCsselcode =C2=BB%s=C2=AB nicht in Schl=C3=BCsselc=
odeabbildung gefunden\n"
-
-#: utils/ir-ctl/ir-ctl.c:802
-#, c-format
-msgid "warning: keycode `%s' has %d definitions in keymaps, using first\n"
-msgstr ""
-"Warnung: Schl=C3=BCsselcode =C2=BB%s=C2=AB hat %d Definitionen in Schl=C3=
=BCsselcodeabbildungen, "
-"die erste wird benutzt.\n"
+"Senden kann nicht mit Empfangs- oder Funktionalit=C3=A4tenoption kombinie=
rt "
+"werden."
=20
-#: utils/ir-ctl/ir-ctl.c:820
+#: utils/ir-ctl/ir-ctl.c:561
 #, c-format
 msgid "%s: cannot open: %m\n"
 msgstr "%s: =C3=96ffnen nicht m=C3=B6glich: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:827
+#: utils/ir-ctl/ir-ctl.c:568
 #, c-format
 msgid "%s: cannot stat: %m\n"
 msgstr "%s: Stat nicht m=C3=B6glich: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:833
+#: utils/ir-ctl/ir-ctl.c:574
 #, c-format
 msgid "%s: not character device\n"
 msgstr "%s: kein zeichenorientiertes Ger=C3=A4t\n"
=20
-#: utils/ir-ctl/ir-ctl.c:840
+#: utils/ir-ctl/ir-ctl.c:581
 #, c-format
 msgid "%s: failed to get lirc features: %m\n"
 msgstr ""
 "%s: Holen von Linux-Infrarotfernbedienungsfunktionalit=C3=A4ten fehlgesch=
lagen: "
 "%m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:853
+#: utils/ir-ctl/ir-ctl.c:594
 #, c-format
 msgid "warning: %s: failed to set carrier: %m\n"
 msgstr "Warnung: %s: Setzen des Tr=C3=A4gers fehlgeschlagen: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:855
+#: utils/ir-ctl/ir-ctl.c:596
 #, c-format
 msgid "warning: %s: set send carrier returned %d, should return 0\n"
 msgstr ""
 "Warnung: %s: Setzen des Sendetr=C3=A4gers gab %d zur=C3=BCck, sollte jedo=
ch 0 "
 "zur=C3=BCckgeben.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:857
+#: utils/ir-ctl/ir-ctl.c:598
 #, c-format
 msgid "warning: %s: does not support setting send carrier\n"
 msgstr "Warnung: %s: Einstellung des Sendetr=C3=A4gers wird nicht unterst=
=C3=BCtzt.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:869
+#: utils/ir-ctl/ir-ctl.c:610
 #, c-format
 msgid "%s: failed to set receiving timeout\n"
 msgstr "%s: Setzen der Empfangszeit=C3=BCberschreitung fehlgeschlagen\n"
=20
-#: utils/ir-ctl/ir-ctl.c:871
+#: utils/ir-ctl/ir-ctl.c:612
 #, c-format
 msgid "%s: device does not support setting timeout\n"
 msgstr "%s: Ger=C3=A4t unterst=C3=BCtzt die Einstellung der Zeit=C3=BCbers=
chreitung nicht.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:879
+#: utils/ir-ctl/ir-ctl.c:620
 #, c-format
 msgid "%s: failed to set wideband receiver %s\n"
 msgstr "%s: Setzen des Breitbandempf=C3=A4ngers %s fehlgeschlagen\n"
=20
-#: utils/ir-ctl/ir-ctl.c:879 utils/ir-ctl/ir-ctl.c:889
+#: utils/ir-ctl/ir-ctl.c:620 utils/ir-ctl/ir-ctl.c:630
 msgid "on"
 msgstr "an"
=20
-#: utils/ir-ctl/ir-ctl.c:879 utils/ir-ctl/ir-ctl.c:889
+#: utils/ir-ctl/ir-ctl.c:620 utils/ir-ctl/ir-ctl.c:630
 msgid "off"
 msgstr "aus"
=20
-#: utils/ir-ctl/ir-ctl.c:881
+#: utils/ir-ctl/ir-ctl.c:622
 #, c-format
 msgid "%s: device does not have wideband receiver\n"
 msgstr "%s: Ger=C3=A4t hat keinen Breitbandempf=C3=A4nger.\n"
=20
 # %s =3D Ger=C3=A4t, %s =3D on/off
-#: utils/ir-ctl/ir-ctl.c:889
+#: utils/ir-ctl/ir-ctl.c:630
 #, c-format
 msgid "%s: failed to set carrier reports %s\n"
 msgstr "%s: Setzen von Tr=C3=A4gerberichten auf %s fehlgeschlagen\n"
=20
-#: utils/ir-ctl/ir-ctl.c:891
+#: utils/ir-ctl/ir-ctl.c:632
 #, c-format
 msgid "%s: device cannot measure carrier\n"
 msgstr "%s: Ger=C3=A4t kann Tr=C3=A4ger nicht messen.\n"
=20
 # %s =3D Ger=C3=A4t, %s =3D on/off
-#: utils/ir-ctl/ir-ctl.c:898
+#: utils/ir-ctl/ir-ctl.c:639
 #, c-format
 msgid "%s: failed to enable timeout reports: %m\n"
 msgstr "%s: Aktivieren von Zeit=C3=BCberschreitungsberichten fehlgeschlage=
n: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:905
+#: utils/ir-ctl/ir-ctl.c:646
 #, c-format
 msgid "%s: failed to set low carrier range: %m\n"
 msgstr "%s: Setzen des niedrigen Tr=C3=A4gerbereichs fehlgeschlagen: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:908
+#: utils/ir-ctl/ir-ctl.c:649
 #, c-format
 msgid "%s: failed to set high carrier range: %m\n"
 msgstr "%s: Setzen des h=C3=B6heren Tr=C3=A4gerbereichs fehlgeschlagen: %m=
\n"
=20
-#: utils/ir-ctl/ir-ctl.c:910
+#: utils/ir-ctl/ir-ctl.c:651
 #, c-format
 msgid "%s: device does not support setting receiver carrier range\n"
 msgstr ""
 "%s: Ger=C3=A4t unterst=C3=BCtzt die Einstellung des Empfangstr=C3=A4gerbe=
reichs nicht.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:920
+#: utils/ir-ctl/ir-ctl.c:661
 #, c-format
 msgid "warning: %s: failed to set duty cycle: %m\n"
 msgstr "Warnung: %s: Setzen der Einschaltdauer fehlgeschlagen: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:922
+#: utils/ir-ctl/ir-ctl.c:663
 #, c-format
 msgid "warning: %s: does not support setting send duty cycle\n"
 msgstr "Warnung: %s: Einstellung der Einschaltdauer wird nicht unterst=C3=
=BCtzt.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:929
+#: utils/ir-ctl/ir-ctl.c:670
 #, c-format
 msgid "warning: %s: failed to set send transmitters: only %d available\n"
 msgstr "Warnung: %s: Setzen des Senders fehlgeschlagen: nur %d verf=C3=BCg=
bar\n"
=20
-#: utils/ir-ctl/ir-ctl.c:931
+#: utils/ir-ctl/ir-ctl.c:672
 #, c-format
 msgid "warning: %s: failed to set send transmitters: %m\n"
 msgstr "Warnung: %s: Setzen des Senders fehlgeschlagen: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:933
+#: utils/ir-ctl/ir-ctl.c:674
 #, c-format
 msgid "warning: %s: does not support setting send transmitters\n"
 msgstr "Warnung: %s: Einstellung des Senders wird nicht unterst=C3=BCtzt.\=
n"
=20
-#: utils/ir-ctl/ir-ctl.c:949
+#: utils/ir-ctl/ir-ctl.c:690
 #, c-format
 msgid "warning: %s: device returned resolution of 0\n"
 msgstr "Warnung: %s: Ger=C3=A4t lieferte Aufl=C3=B6sung von 0 zur=C3=BCck\=
n"
=20
-#: utils/ir-ctl/ir-ctl.c:951
+#: utils/ir-ctl/ir-ctl.c:692
 #, c-format
 msgid "warning: %s: unexpected error while retrieving resolution: %m\n"
 msgstr "Warnung: %s: unerwarteter Fehler beim Abfragen der Aufl=C3=B6sung:=
 %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:954
+#: utils/ir-ctl/ir-ctl.c:695
 #, c-format
 msgid "Receive features %s:\n"
 msgstr "Empfangsfunktionalit=C3=A4ten %s:\n"
=20
-#: utils/ir-ctl/ir-ctl.c:956
+#: utils/ir-ctl/ir-ctl.c:697
 #, c-format
 msgid " - Device can receive scancodes\n"
 msgstr " - Ger=C3=A4t kann Scancodes empfangen.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:958
+#: utils/ir-ctl/ir-ctl.c:699
 #, c-format
 msgid " - Device can receive raw IR\n"
 msgstr " - Ger=C3=A4t kann unverarbeitetes Infrarot empfangen.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:960
+#: utils/ir-ctl/ir-ctl.c:701
 #, c-format
 msgid " - Can report decoded scancodes and protocol\n"
 msgstr " - kann dekodierte Scancodes und Protokolle berichten\n"
=20
-#: utils/ir-ctl/ir-ctl.c:962
+#: utils/ir-ctl/ir-ctl.c:703
 #, c-format
 msgid " - Resolution %u microseconds\n"
 msgstr " - Aufl=C3=B6sung %u Mikrosekunden\n"
=20
-#: utils/ir-ctl/ir-ctl.c:964
+#: utils/ir-ctl/ir-ctl.c:705
 #, c-format
 msgid " - Set receive carrier\n"
 msgstr " - Empfangstr=C3=A4ger setzen\n"
=20
-#: utils/ir-ctl/ir-ctl.c:966
+#: utils/ir-ctl/ir-ctl.c:707
 #, c-format
 msgid " - Use wideband receiver\n"
 msgstr " - Breitbandempf=C3=A4nger verwenden\n"
=20
-#: utils/ir-ctl/ir-ctl.c:968
+#: utils/ir-ctl/ir-ctl.c:709
 #, c-format
 msgid " - Can measure carrier\n"
 msgstr " - Tr=C3=A4ger kann gemessen werden.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:975
-#, c-format
-msgid " - Receiving timeout %u microseconds\n"
-msgstr " - Empfangszeit=C3=BCberschreitung %u Mikrosekunden\n"
-
-#: utils/ir-ctl/ir-ctl.c:978
+#: utils/ir-ctl/ir-ctl.c:714
 #, c-format
 msgid ""
 "warning: %s: device supports setting receiving timeout but "
@@ -1321,7 +1333,7 @@ msgstr ""
 "Warnung: %s: Ger=C3=A4t unterst=C3=BCtzt die Einstellung zum Empfangen de=
r "
 "Zeit=C3=BCberschreitungen, LIRC_GET_MIN_TIMEOUT gibt jedoch folgendes zur=
=C3=BCck: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:981
+#: utils/ir-ctl/ir-ctl.c:717
 #, c-format
 msgid ""
 "warning: %s: device supports setting receiving timeout but min timeout is=
 0\n"
@@ -1329,7 +1341,7 @@ msgstr ""
 "Warnung: %s: Ger=C3=A4t unterst=C3=BCtzt die Einstellung zum Empfangen de=
r "
 "Zeit=C3=BCberschreitungen, die minimale Zeit=C3=BCberschreitung ist jedoc=
h 0\n"
=20
-#: utils/ir-ctl/ir-ctl.c:984
+#: utils/ir-ctl/ir-ctl.c:720
 #, c-format
 msgid ""
 "warning: %s: device supports setting receiving timeout but "
@@ -1338,7 +1350,7 @@ msgstr ""
 "Warnung: %s: Ger=C3=A4t unterst=C3=BCtzt die Einstellung zum Empfangen de=
r "
 "Zeit=C3=BCberschreitungen, LIRC_GET_MAX_TIMEOUT gibt jedoch folgendes zur=
=C3=BCck: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:987
+#: utils/ir-ctl/ir-ctl.c:723
 #, c-format
 msgid ""
 "warning: %s: device supports setting receiving timeout but max timeout is=
 0\n"
@@ -1346,14 +1358,14 @@ msgstr ""
 "Warnung: %s: Ger=C3=A4t unterst=C3=BCtzt die Einstellung zum Empfangen de=
r "
 "Zeit=C3=BCberschreitungen, die maximale Zeit=C3=BCberschreitung ist jedoc=
h 0\n"
=20
-#: utils/ir-ctl/ir-ctl.c:991
-#, c-format
-msgid " - Can set receiving timeout min %u microseconds, max %u microsecon=
ds\n"
+#: utils/ir-ctl/ir-ctl.c:727
+#, fuzzy, c-format
+msgid " - Can set receiving timeout min:%u microseconds max:%u microsecond=
s\n"
 msgstr ""
 " - Empfangszeit=C3=BCberschreitung kann auf minimal %u Millisekunden und =
maximal "
 "%u Mikrosekunden gesetzt werden\n"
=20
-#: utils/ir-ctl/ir-ctl.c:994
+#: utils/ir-ctl/ir-ctl.c:730
 #, c-format
 msgid ""
 " - Device can receive using device dependent LIRCCODE mode (not supported=
)\n"
@@ -1361,37 +1373,37 @@ msgstr ""
 " - Ger=C3=A4t kann mittels eines ger=C3=A4teabh=C3=A4ngigen LIRCCODE-Modu=
s empfangen (nicht "
 "unterst=C3=BCtzt)\n"
=20
-#: utils/ir-ctl/ir-ctl.c:996
+#: utils/ir-ctl/ir-ctl.c:732
 #, c-format
 msgid " - Device cannot receive\n"
 msgstr " - Ger=C3=A4t nicht empfangsbereit\n"
=20
-#: utils/ir-ctl/ir-ctl.c:999
+#: utils/ir-ctl/ir-ctl.c:735
 #, c-format
 msgid "Send features %s:\n"
 msgstr "Sendefunktionalit=C3=A4ten %s:\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1001
+#: utils/ir-ctl/ir-ctl.c:737
 #, c-format
 msgid " - Device can send raw IR\n"
 msgstr " - Ger=C3=A4t kann unverarbeitetes Infrarot senden\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1003
+#: utils/ir-ctl/ir-ctl.c:739
 #, c-format
 msgid " - IR scancode encoder\n"
 msgstr " - Infrarot-Scancode-Kodierer\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1005
+#: utils/ir-ctl/ir-ctl.c:741
 #, c-format
 msgid " - Set carrier\n"
 msgstr " - Tr=C3=A4ger setzen\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1007
+#: utils/ir-ctl/ir-ctl.c:743
 #, c-format
 msgid " - Set duty cycle\n"
 msgstr " - Einschaltdauer setzen\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1012
+#: utils/ir-ctl/ir-ctl.c:748
 #, c-format
 msgid ""
 "warning: %s: device supports setting transmitter mask but returns 0 as "
@@ -1400,19 +1412,19 @@ msgstr ""
 "Warnung: %s: Ger=C3=A4t unterst=C3=BCtzt die Einstellung der Sendermaske,=
 gibt jedoch "
 "als Anzahl der Sender 0 zur=C3=BCck\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1014
+#: utils/ir-ctl/ir-ctl.c:750
 #, c-format
 msgid "warning: %s: device supports setting transmitter mask but returns: =
%m\n"
 msgstr ""
 "Warnung: %s: Ger=C3=A4t unterst=C3=BCtzt die Einstellung der Sendermaske,=
 gibt jedoch "
 "folgendes zur=C3=BCck: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1016
+#: utils/ir-ctl/ir-ctl.c:752
 #, c-format
 msgid " - Set transmitter (%d available)\n"
 msgstr " - Sender setzen (%d verf=C3=BCgbar)\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1019
+#: utils/ir-ctl/ir-ctl.c:755
 #, c-format
 msgid ""
 " - Device can send using device dependent LIRCCODE mode (not supported)\n"
@@ -1420,72 +1432,67 @@ msgstr ""
 " - Ger=C3=A4t kann mittels eines ger=C3=A4teabh=C3=A4ngigen LIRCCODE-Modu=
s senden (nicht "
 "unterst=C3=BCtzt)\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1021
+#: utils/ir-ctl/ir-ctl.c:757
 #, c-format
 msgid " - Device cannot send\n"
 msgstr " - Ger=C3=A4t kann nicht senden.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1032
+#: utils/ir-ctl/ir-ctl.c:768
 #, c-format
 msgid "%s: device cannot send\n"
 msgstr "%s: Ger=C3=A4t kann nicht senden.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1058
+#: utils/ir-ctl/ir-ctl.c:790
 #, c-format
 msgid "%s: cannot set send mode\n"
 msgstr "%s: Sendemodus kann nicht gesetzt werden\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1066
+#: utils/ir-ctl/ir-ctl.c:798
 #, c-format
 msgid "%s: no encoder available for `%s'\n"
 msgstr "%s: kein Kodierer f=C3=BCr =C2=BB%s=C2=AB verf=C3=BCgbar\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1075
+#: utils/ir-ctl/ir-ctl.c:807
 #, c-format
 msgid "warning: %s: carrier specified but overwritten on command line\n"
 msgstr ""
 "Warnung: %s: Tr=C3=A4ger angegeben, jedoch auf der Befehlszeile =C3=BCber=
schrieben\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1089
+#: utils/ir-ctl/ir-ctl.c:820
 #, c-format
 msgid "%s: failed to send: %m\n"
 msgstr "%s: Senden fehlgeschlagen: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1094
+#: utils/ir-ctl/ir-ctl.c:825
 #, c-format
 msgid "warning: %s: sent %zd out %zd edges\n"
 msgstr "Warnung: %s: %zd von %zd R=C3=A4ndern gesendet\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1114
+#: utils/ir-ctl/ir-ctl.c:845
 #, c-format
 msgid "%s: device cannot receive raw ir\n"
 msgstr "%s Ger=C3=A4t kann kein unbearbeitetes Infrarot empfangen.\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1120
+#: utils/ir-ctl/ir-ctl.c:851
 #, c-format
 msgid "%s: failed to set receive mode: %m\n"
 msgstr "%s: Setzen des Empfangsmodus fehlgeschlagen: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1127
+#: utils/ir-ctl/ir-ctl.c:858
 #, c-format
 msgid "%s: failed to open for writing: %m\n"
 msgstr "%s: =C3=96ffnen zum Schreiben fehlgeschlagen: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1140
+#: utils/ir-ctl/ir-ctl.c:870
 #, c-format
 msgid "%s: failed read: %m\n"
 msgstr "%s: Lesen fehlgeschlagen: %m\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1145
+#: utils/ir-ctl/ir-ctl.c:875
 #, c-format
 msgid "%s: read returned %zd bytes\n"
 msgstr "%s: Lesen gab %zd Byte zur=C3=BCck\n"
=20
-#: utils/ir-ctl/ir-ctl.c:1255
-#, c-format
-msgid "error: no keymap specified\n"
-msgstr "Fehler: keine Schl=C3=BCsselcodeabbildung angegeben\n"
-
 # DVB =3D Digital Video Broadcasting (=E2=80=9EDigitales Fernsehen=E2=80=
=9C)
 #: utils/dvb/dvb-fe-tool.c:48
 msgid ""
@@ -1592,43 +1599,43 @@ msgid "dvb_fe_get_stats failed"
 msgstr "=C2=BBdvb_fe_get_stats=C2=AB fehlgeschlagen"
=20
 #: utils/dvb/dvb-fe-tool.c:199 utils/dvb/dvbv5-scan.c:146
-#: utils/dvb/dvbv5-zap.c:445
+#: utils/dvb/dvbv5-zap.c:444
 msgid "Quality"
 msgstr "Qualit=C3=A4t"
=20
 #: utils/dvb/dvb-fe-tool.c:202 utils/dvb/dvbv5-scan.c:149
-#: utils/dvb/dvbv5-zap.c:448
+#: utils/dvb/dvbv5-zap.c:447
 msgid "Signal"
 msgstr "Signal"
=20
 # Carrier/Noise (Signal-/Rausch-Verh=C3=A4ltnis)
 #: utils/dvb/dvb-fe-tool.c:205 utils/dvb/dvbv5-scan.c:152
-#: utils/dvb/dvbv5-zap.c:451
+#: utils/dvb/dvbv5-zap.c:450
 msgid "C/N"
 msgstr "S/R"
=20
 #: utils/dvb/dvb-fe-tool.c:208 utils/dvb/dvbv5-scan.c:155
-#: utils/dvb/dvbv5-zap.c:454
+#: utils/dvb/dvbv5-zap.c:453
 msgid "UCB"
 msgstr "UCB (Anzahl unkorrigierter Fehler)"
=20
 # BER =3D Bit-Fehlerrate
 #: utils/dvb/dvb-fe-tool.c:211 utils/dvb/dvbv5-scan.c:158
-#: utils/dvb/dvbv5-zap.c:457
+#: utils/dvb/dvbv5-zap.c:456
 msgid "postBER"
 msgstr "postBER"
=20
 #: utils/dvb/dvb-fe-tool.c:214 utils/dvb/dvbv5-scan.c:161
-#: utils/dvb/dvbv5-zap.c:460
+#: utils/dvb/dvbv5-zap.c:459
 msgid "preBER"
 msgstr "preBER"
=20
 #: utils/dvb/dvb-fe-tool.c:217 utils/dvb/dvbv5-scan.c:164
-#: utils/dvb/dvbv5-zap.c:463
+#: utils/dvb/dvbv5-zap.c:462
 msgid "PER"
 msgstr "PER"
=20
-#: utils/dvb/dvb-fe-tool.c:346 utils/dvb/dvbv5-zap.c:1100
+#: utils/dvb/dvb-fe-tool.c:346 utils/dvb/dvbv5-zap.c:1098
 #, c-format
 msgid "Connecting to %s:%d\n"
 msgstr "Verbinden mit %s:%d\n"
@@ -1845,12 +1852,12 @@ msgstr "Scan-Frequenz #%d %d"
 msgid "<initial file>"
 msgstr "<Anfangsdatei>"
=20
-#: utils/dvb/dvbv5-scan.c:496 utils/dvb/dvbv5-zap.c:1086
+#: utils/dvb/dvbv5-scan.c:496 utils/dvb/dvbv5-zap.c:1084
 #, c-format
 msgid "Please select one of the LNBf's below:\n"
 msgstr "Bitte w=C3=A4hlen Sie einen der nachfolgenden LNBfs aus:\n"
=20
-#: utils/dvb/dvbv5-scan.c:500 utils/dvb/dvbv5-zap.c:1090
+#: utils/dvb/dvbv5-scan.c:500 utils/dvb/dvbv5-zap.c:1088
 #, c-format
 msgid "Using LNBf "
 msgstr "Verwendet wird LNBf "
@@ -1860,17 +1867,17 @@ msgstr "Verwendet wird LNBf "
 msgid "ERROR: Please specify a valid format\n"
 msgstr "FEHLER: Bitte geben Sie ein g=C3=BCltiges Format an.\n"
=20
-#: utils/dvb/dvbv5-scan.c:529 utils/dvb/dvbv5-zap.c:1112
+#: utils/dvb/dvbv5-scan.c:529 utils/dvb/dvbv5-zap.c:1110
 #, c-format
 msgid "Couldn't find demux device node\n"
 msgstr "Es wurde kein Demultiplexer-Ger=C3=A4teknoten gefunden.\n"
=20
-#: utils/dvb/dvbv5-scan.c:536 utils/dvb/dvbv5-zap.c:1128
+#: utils/dvb/dvbv5-scan.c:536 utils/dvb/dvbv5-zap.c:1126
 #, c-format
 msgid "using demux '%s'\n"
 msgstr "Demultiplexer =C2=BB%s=C2=AB wird verwendet.\n"
=20
-#: utils/dvb/dvbv5-scan.c:556 utils/dvb/dvbv5-zap.c:1160
+#: utils/dvb/dvbv5-scan.c:556 utils/dvb/dvbv5-zap.c:1158
 #, c-format
 msgid "Failed to set the country code:%s\n"
 msgstr "Setzen des L=C3=A4nderkennzeichens fehlgeschlagen:%s\n"
@@ -1956,8 +1963,8 @@ msgstr "packets_per_sec"
=20
 #: utils/dvb/dvbv5-zap.c:128
 msgid ""
-"sets DVB low traffic threshold. PIDs with less than this amount of "
-"packets per second will be ignored. Default: 1 packet per second"
+"sets DVB low traffic threshold. PIDs with less than this amount of packet=
s "
+"per second will be ignored. Default: 1 packet per second"
 msgstr ""
 "setzt die untere Schwelle f=C3=BCr DVB-Datenaufkommen. PIDs mit einem kle=
ineren "
 "Betrag von Paketen pro Sekunde werden ignoriert. Voreinstellung: 1 Paket =
pro "
@@ -1989,170 +1996,245 @@ msgstr "Dienst hat PID-Typ %02x: "
 msgid "tuning to %i Hz\n"
 msgstr "Einstellen auf %i Hz\n"
=20
-#: utils/dvb/dvbv5-zap.c:566
+#: utils/dvb/dvbv5-zap.c:565
 #, c-format
 msgid "buffer overrun at %lld\n"
 msgstr "Puffer=C3=BCberlauf bei %lld\n"
=20
-#: utils/dvb/dvbv5-zap.c:568
+#: utils/dvb/dvbv5-zap.c:567
 #, c-format
 msgid "buffer overrun after %lld.%02ld seconds\n"
 msgstr "Puffer=C3=BCberlauf nach %lld.%02ld Sekunden\n"
=20
-#: utils/dvb/dvbv5-zap.c:593 utils/dvb/dvbv5-zap.c:835
+#: utils/dvb/dvbv5-zap.c:592 utils/dvb/dvbv5-zap.c:834
 msgid "Write failed"
 msgstr "Schreiben fehlgeschlagen"
=20
-#: utils/dvb/dvbv5-zap.c:601
+#: utils/dvb/dvbv5-zap.c:600
 #, c-format
 msgid "received %lld bytes (%lld Kbytes/sec)\n"
 msgstr "%lld Byte empfangen (%lld Kilobyte/Sek)\n"
=20
-#: utils/dvb/dvbv5-zap.c:604
+#: utils/dvb/dvbv5-zap.c:603
 #, c-format
 msgid "received %lld bytes\n"
 msgstr "%lld Byte empfangen\n"
=20
-#: utils/dvb/dvbv5-zap.c:777 utils/dvb/dvbv5-zap.c:1253
+#: utils/dvb/dvbv5-zap.c:776 utils/dvb/dvbv5-zap.c:1251
 #, c-format
 msgid "dvb_dev_set_bufsize: buffer set to %d\n"
 msgstr "dvb_dev_set_bufsize: Puffer auf %d gesetzt\n"
=20
-#: utils/dvb/dvbv5-zap.c:787
+#: utils/dvb/dvbv5-zap.c:786
 #, c-format
 msgid "  dvb_set_pesfilter to 0x2000\n"
 msgstr "  dvb_set_pesfilter auf 0x2000\n"
=20
-#: utils/dvb/dvbv5-zap.c:796
+#: utils/dvb/dvbv5-zap.c:795
 #, c-format
 msgid "Can't get timespec\n"
 msgstr "Timespec kann nicht geholt werden\n"
=20
-#: utils/dvb/dvbv5-zap.c:802
+#: utils/dvb/dvbv5-zap.c:801
 #, c-format
 msgid "%.2fs: Starting capture\n"
 msgstr "%.2fs: Aufnahme wird gestartet\n"
=20
-#: utils/dvb/dvbv5-zap.c:814
+#: utils/dvb/dvbv5-zap.c:813
 #, c-format
 msgid "%.2fs: buffer overrun\n"
 msgstr "%.2fs: Puffer=C3=BCberlauf\n"
=20
-#: utils/dvb/dvbv5-zap.c:817
+#: utils/dvb/dvbv5-zap.c:816
 #, c-format
 msgid "%.2fs: read() returned error %zd\n"
 msgstr "%.2fs: read() gab den Fehler %zd zur=C3=BCck\n"
=20
-#: utils/dvb/dvbv5-zap.c:840
+#: utils/dvb/dvbv5-zap.c:839
 #, c-format
 msgid "%.2fs: only read %zd bytes\n"
 msgstr "%.2fs: nur %zd Byte gelesen\n"
=20
-#: utils/dvb/dvbv5-zap.c:847
+#: utils/dvb/dvbv5-zap.c:846
 #, c-format
 msgid "%.2fs: invalid sync byte. Discarding %zd bytes\n"
 msgstr "%.2fs: ung=C3=BCltiges Synchronisations-Byte. %zd Byte werden verw=
orfen.\n"
=20
-#: utils/dvb/dvbv5-zap.c:870
+#: utils/dvb/dvbv5-zap.c:869
 #, c-format
 msgid "%.2fs: invalid pid: 0x%04x\n"
 msgstr "%.2fs: ung=C3=BCltige PID: 0x%04x\n"
=20
-#: utils/dvb/dvbv5-zap.c:897
+#: utils/dvb/dvbv5-zap.c:896
 #, c-format
 msgid "%.2fs: pid %d has adaption layer, but size is too small!\n"
 msgstr "%.2fs: PID %d hat Anpassungsebene, aber die Gr=C3=B6=C3=9Fe ist zu=
 gering!\n"
=20
-#: utils/dvb/dvbv5-zap.c:908
+#: utils/dvb/dvbv5-zap.c:907
 #, c-format
 msgid "%.2fs: pid %d, expecting %d received %d\n"
 msgstr "%.2fs: PID %d, erwartet %d empfangen %d\n"
=20
-#: utils/dvb/dvbv5-zap.c:953
+#: utils/dvb/dvbv5-zap.c:952
 #, c-format
 msgid " PID           FREQ         SPEED       TOTAL\n"
 msgstr " PID           FREQ         TEMPO       GESAMT\n"
=20
-#: utils/dvb/dvbv5-zap.c:978
+#: utils/dvb/dvbv5-zap.c:977
 #, c-format
 msgid "OTHER"
 msgstr "ANDERE"
=20
-#: utils/dvb/dvbv5-zap.c:1004
+#: utils/dvb/dvbv5-zap.c:1003
 #, c-format
 msgid "%.2fs: Stopping capture\n"
 msgstr "%.2fs: Aufnahme wird gestoppt\n"
=20
-#: utils/dvb/dvbv5-zap.c:1042
+#: utils/dvb/dvbv5-zap.c:1039
 msgid "DVB zap utility"
 msgstr "DVB-Umschaltwerkzeug"
=20
-#: utils/dvb/dvbv5-zap.c:1043
+#: utils/dvb/dvbv5-zap.c:1040
 msgid "<channel name> [or <frequency> if in monitor mode]"
 msgstr "<Kanalname> [oder <Frequenz>, falls im =C3=9Cberwachungsmodus]"
=20
-#: utils/dvb/dvbv5-zap.c:1120
+#: utils/dvb/dvbv5-zap.c:1118
 #, c-format
 msgid "Couldn't find dvr device node\n"
 msgstr "Es wurde kein DVR-Ger=C3=A4teknoten gefunden\n"
=20
-#: utils/dvb/dvbv5-zap.c:1141
+#: utils/dvb/dvbv5-zap.c:1139
 #, c-format
 msgid "reading channels from file '%s'\n"
 msgstr "Kan=C3=A4le werden aus Datei =C2=BB%s=C2=AB gelesen.\n"
=20
-#: utils/dvb/dvbv5-zap.c:1182 utils/dvb/dvbv5-zap.c:1302
-#: utils/dvb/dvbv5-zap.c:1354
+#: utils/dvb/dvbv5-zap.c:1180 utils/dvb/dvbv5-zap.c:1300
+#: utils/dvb/dvbv5-zap.c:1352
 #, c-format
 msgid "open of '%s' failed"
 msgstr "=C3=96ffnen von =C2=BB%s=C2=AB fehlgeschlagen"
=20
-#: utils/dvb/dvbv5-zap.c:1193
+#: utils/dvb/dvbv5-zap.c:1191
 #, c-format
 msgid "Service id 0x%04x was not specified at the file\n"
 msgstr "Dienstkennung 0x%04x wurde nicht in der Datei angegeben.\n"
=20
-#: utils/dvb/dvbv5-zap.c:1206
+#: utils/dvb/dvbv5-zap.c:1204
 #, c-format
 msgid "couldn't find pmt-pid for sid %04x\n"
 msgstr "PMT-PID f=C3=BCr SID %04x konnte nicht gefunden werden.\n"
=20
-#: utils/dvb/dvbv5-zap.c:1240
+#: utils/dvb/dvbv5-zap.c:1238
 #, c-format
 msgid "pass all PID's to TS\n"
 msgstr "reicht alle PIDs an TS weiter.\n"
=20
-#: utils/dvb/dvbv5-zap.c:1242
+#: utils/dvb/dvbv5-zap.c:1240
 #, c-format
 msgid "video pid %d\n"
 msgstr "Video-PID %d\n"
=20
-#: utils/dvb/dvbv5-zap.c:1251 utils/dvb/dvbv5-zap.c:1277
+#: utils/dvb/dvbv5-zap.c:1249 utils/dvb/dvbv5-zap.c:1275
 #, c-format
 msgid "  dvb_set_pesfilter %d\n"
 msgstr "  dvb_set_pesfilter %d\n"
=20
-#: utils/dvb/dvbv5-zap.c:1270
+#: utils/dvb/dvbv5-zap.c:1268
 #, c-format
 msgid "audio pid %d\n"
 msgstr "Audio-PID %d\n"
=20
-#: utils/dvb/dvbv5-zap.c:1288
+#: utils/dvb/dvbv5-zap.c:1286
 #, c-format
 msgid "frontend doesn't lock\n"
 msgstr "Oberfl=C3=A4che sperrt nicht\n"
=20
-#: utils/dvb/dvbv5-zap.c:1319
+#: utils/dvb/dvbv5-zap.c:1317
 #, c-format
 msgid "Record to file '%s' started\n"
 msgstr "Aufzeichnung in Datei =C2=BB%s=C2=AB gestartet\n"
=20
-#: utils/dvb/dvbv5-zap.c:1338
+#: utils/dvb/dvbv5-zap.c:1336
 #, c-format
 msgid "DVR pipe interface '%s' will be opened\n"
 msgstr "DVR-Pipe-Schnittstelle =C2=BB%s=C2=AB wird ge=C3=B6ffnet.\n"
=20
-#: utils/dvb/dvbv5-zap.c:1362
+#: utils/dvb/dvbv5-zap.c:1360
 #, c-format
 msgid "DVR interface '%s' can now be opened\n"
 msgstr "DVR-Schnittstelle =C2=BB%s=C2=AB kann nun ge=C3=B6ffnet werden.\n"
+
+#~ msgid "Clears the scancode to keycode mappings"
+#~ msgstr "leert die die Abbildungen der Scancodes auf Schl=C3=BCsselcodes=
=2E"
+
+#~ msgid "rc device to control, defaults to rc0 if not specified"
+#~ msgstr ""
+#~ "zu steuernde Fernbedienung, Voreinstellung ist rc@, falls nicht angege=
ben"
+
+#~ msgid "KEYMAP"
+#~ msgstr "KEYMAP"
+
+#~ msgid "Test if keymap is valid"
+#~ msgstr "Testet, ob die Schl=C3=BCsselcodeabbildung g=C3=BCltig ist."
+
+#~ msgid "%s: keycode `%s' not recognised, no mapping\n"
+#~ msgstr "%s: Schl=C3=BCsselcode =C2=BB%s=C2=AB nicht erkannt, keine Abbi=
ldung\n"
+
+#~ msgid "\tDriver: %s\n"
+#~ msgstr "\tTreiber %s\n"
+
+#~ msgid "\tDefault keymap: %s\n"
+#~ msgstr "\tStandardschl=C3=BCsselcodeabbildung: %s\n"
+
+#~ msgid "\tInput device: %s\n"
+#~ msgstr "\tEingabeger=C3=A4t: %s\n"
+
+#~ msgid "KEYCODE"
+#~ msgstr "SCHL=C3=9CSSELCODE"
+
+#~ msgid "send IR keycode from keymap"
+#~ msgstr "sendet Infrarotschl=C3=BCsselcode aus der Schl=C3=BCsselcode-Ab=
bildung"
+
+#~ msgid "output in mode2 format"
+#~ msgstr "Ausgabe im Modus-2-Format "
+
+#~ msgid "use keymap to send key from"
+#~ msgstr "Schl=C3=BCsselcodeabbildung verwenden zum Schl=C3=BCsselversand=
 von"
+
+#~ msgid "%s:%d: error: expected integer, got `%s'\n"
+#~ msgstr "%s:%d: Fehler: Ganzzahl erwartet, =C2=BB%s=C2=AB erhalten\n"
+
+#~ msgid "%s:%d: error: pulse found where space expected `%s'\n"
+#~ msgstr "%s:%d: Fehler: Impuls gefunden, wo Pause erwartet wurde =C2=BB%=
s=C2=AB\n"
+
+#~ msgid "%s:%d: error: space found where pulse expected `%s'\n"
+#~ msgstr "%s:%d: Fehler: Pause gefunden, wo Impuls erwartet wurde =C2=BB%=
s=C2=AB\n"
+
+#~ msgid "%s:%d: error: value `%s' out of range\n"
+#~ msgstr "%s:%d: Fehler: Wert =C2=BB%s=C2=AB au=C3=9Ferhalb des Bereichs\=
n"
+
+#~ msgid "%s: file is empty\n"
+#~ msgstr "%s: Datei ist leer\n"
+
+#~ msgid "key send can not be combined with receive or features option"
+#~ msgstr ""
+#~ "Senden des Schl=C3=BCssels kann nicht mit Empfangs- oder "
+#~ "Funktionalit=C3=A4tenoption kombiniert werden."
+
+#~ msgid "error: protocol '%s' not supported\n"
+#~ msgstr "Fehler: Protokoll =C2=BB%s=C2=AB nicht unterst=C3=BCtzt\n"
+
+#~ msgid "error: keycode `%s' not found in keymap\n"
+#~ msgstr ""
+#~ "Fehler: Schl=C3=BCsselcode =C2=BB%s=C2=AB nicht in Schl=C3=BCsselcodea=
bbildung gefunden\n"
+
+#~ msgid "warning: keycode `%s' has %d definitions in keymaps, using first=
\n"
+#~ msgstr ""
+#~ "Warnung: Schl=C3=BCsselcode =C2=BB%s=C2=AB hat %d Definitionen in "
+#~ "Schl=C3=BCsselcodeabbildungen, die erste wird benutzt.\n"
+
+#~ msgid " - Receiving timeout %u microseconds\n"
+#~ msgstr " - Empfangszeit=C3=BCberschreitung %u Mikrosekunden\n"
+
+#~ msgid "error: no keymap specified\n"
+#~ msgstr "Fehler: keine Schl=C3=BCsselcodeabbildung angegeben\n"

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl54oc8ACgkQMOfwapXb+vKLfACgpOpTjDCyIg9f+ZMzPClc29Kn
Kn8An3q6U4e/6xNbL6Yj+mqrnKienik1
=WD8J
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
