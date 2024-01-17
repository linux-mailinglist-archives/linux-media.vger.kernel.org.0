Return-Path: <linux-media+bounces-3815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F13830905
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 16:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B09081C21A08
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 15:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3272137C;
	Wed, 17 Jan 2024 15:02:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A120DC9
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 15:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503766; cv=none; b=vA3nuHiCEjEMmZQOrU7uqWAtlWyYpYUdLVplMBxVf7PQ295BZQHRKzNDhKHcDa2uqqEDMGvIxdEcgqq8R+M0413PvRs0OimOTZoi9GYWgIwWj0yIvg6koiPuwZCHXDyuhsxO0dSyBPMCWsQmAP8ytK1hhMfqUA31UAJGWyRH++c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503766; c=relaxed/simple;
	bh=o5qhsbxfTsXZq2xooR16Fxk1PjPuTSBMwXST6pC1rB0=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding; b=MwShZ5ymP8vEnthZVJWHxJww8ZtcKMA3Izw4QOoQO7pLYmyvDVvTXx0sn0HcYhet9F8T4ejhv9Mr9KduCX9fOyH1DR4bIqyD+PmGkKyhWDdm/MpMf/tYY2jHRiEx3LqFq1+68okKQit1eGgjVIVBF4JZys5MHfLNyywlFoCaY54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B11CC433F1;
	Wed, 17 Jan 2024 15:02:45 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 06/10] v4l2-ctl: support v4l-audio devices
Date: Wed, 17 Jan 2024 16:02:14 +0100
Message-ID: <048be2437c1c78389c77433aeb70f2ffc3536353.1705503477.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
References: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for v4l-audioX devices.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/v4l2-ctl/Android.mk             |   3 +-
 utils/v4l2-ctl/meson.build            |   1 +
 utils/v4l2-ctl/v4l2-ctl-audio.cpp     | 131 ++++++++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-common.cpp    |   2 +
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp |  14 +--
 utils/v4l2-ctl/v4l2-ctl.1.in          |   4 +
 utils/v4l2-ctl/v4l2-ctl.cpp           |  27 ++++++
 utils/v4l2-ctl/v4l2-ctl.h             |  18 ++++
 8 files changed, 193 insertions(+), 7 deletions(-)
 create mode 100644 utils/v4l2-ctl/v4l2-ctl-audio.cpp

diff --git a/utils/v4l2-ctl/Android.mk b/utils/v4l2-ctl/Android.mk
index 3078c629..ecb8c5e1 100644
--- a/utils/v4l2-ctl/Android.mk
+++ b/utils/v4l2-ctl/Android.mk
@@ -22,6 +22,7 @@ LOCAL_SRC_FILES := \
     v4l2-ctl-io.cpp v4l2-ctl-stds.cpp v4l2-ctl-vidcap.cpp v4l2-ctl-vidout.cpp \
     v4l2-ctl-overlay.cpp v4l2-ctl-vbi.cpp v4l2-ctl-selection.cpp v4l2-ctl-misc.cpp \
     v4l2-ctl-streaming.cpp v4l2-ctl-sdr.cpp v4l2-ctl-edid.cpp v4l2-ctl-modes.cpp \
-    v4l2-ctl-meta.cpp v4l2-ctl-subdev.cpp v4l2-info.cpp media-info.cpp \
+    v4l2-ctl-meta.cpp v4l2-ctl-audio.cpp v4l2-ctl-subdev.cpp \
+    v4l2-info.cpp media-info.cpp \
     v4l2-tpg-colors.c v4l2-tpg-core.c v4l-stream.c codec-fwht.c
 include $(BUILD_EXECUTABLE)
diff --git a/utils/v4l2-ctl/meson.build b/utils/v4l2-ctl/meson.build
index 3e366c6c..62c3c3ee 100644
--- a/utils/v4l2-ctl/meson.build
+++ b/utils/v4l2-ctl/meson.build
@@ -7,6 +7,7 @@ v4l2_ctl_sources = files(
     'v4l2-ctl-edid.cpp',
     'v4l2-ctl-io.cpp',
     'v4l2-ctl-meta.cpp',
+    'v4l2-ctl-audio.cpp',
     'v4l2-ctl-misc.cpp',
     'v4l2-ctl-modes.cpp',
     'v4l2-ctl-overlay.cpp',
diff --git a/utils/v4l2-ctl/v4l2-ctl-audio.cpp b/utils/v4l2-ctl/v4l2-ctl-audio.cpp
new file mode 100644
index 00000000..23ff17ca
--- /dev/null
+++ b/utils/v4l2-ctl/v4l2-ctl-audio.cpp
@@ -0,0 +1,131 @@
+#include <endian.h>
+
+#include "v4l2-ctl.h"
+
+static struct v4l2_format vfmt;	/* set_format/get_format */
+static unsigned mbus_code;
+static unsigned mbus_code_out;
+
+void audio_usage()
+{
+	printf("\nAudio Formats options:\n"
+	       "  --list-formats-audio [<mbus_code>] display supported audio capture formats.\n"
+	       "		     <mbus_code> is an optional media bus code, if the device has\n"
+	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
+	       "		     media bus code are listed [VIDIOC_ENUM_FMT]\n"
+	       "  --get-fmt-audio    query the audio capture format [VIDIOC_G_FMT]\n"
+	       "  --set-fmt-audio <f> set the audio capture format [VIDIOC_S_FMT]\n"
+	       "                     parameter is either the format index as reported by\n"
+	       "                     --list-formats-audio, or the fourcc value as a string\n"
+	       "  --try-fmt-audio <f>  try the audio capture format [VIDIOC_TRY_FMT]\n"
+	       "                     parameter is either the format index as reported by\n"
+	       "                     --list-formats-audio, or the fourcc value as a string\n"
+	       "  --list-formats-audio-out [<mbus_code>] display supported audio output formats.\n"
+	       "		     <mbus_code> is an optional media bus code, if the device has\n"
+	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
+	       "		     media bus code are listed [VIDIOC_ENUM_FMT]\n"
+	       "  --get-fmt-audio-out query the audio output format [VIDIOC_G_FMT]\n"
+	       "  --set-fmt-audio-out <f>  set the audio output format [VIDIOC_S_FMT]\n"
+	       "                     parameter is either the format index as reported by\n"
+	       "                     --list-formats-audio-out, or the fourcc value as a string\n"
+	       "  --try-fmt-audio-out <f>  try the audio output format [VIDIOC_TRY_FMT]\n"
+	       "                     parameter is either the format index as reported by\n"
+	       "                     --list-formats-audio-out, or the fourcc value as a string\n"
+	       );
+}
+
+void audio_cmd(int ch, char *optarg)
+{
+	switch (ch) {
+	case OptSetAudioFormat:
+	case OptTryAudioFormat:
+	case OptSetAudioOutFormat:
+	case OptTryAudioOutFormat:
+		if (strlen(optarg) == 0) {
+			audio_usage();
+			std::exit(EXIT_FAILURE);
+		} else if (strlen(optarg) == 4) {
+			vfmt.fmt.audio.audioformat = v4l2_fourcc(optarg[0],
+					optarg[1], optarg[2], optarg[3]);
+		} else {
+			vfmt.fmt.audio.audioformat = strtol(optarg, nullptr, 0);
+		}
+		break;
+	case OptListAudioFormats:
+		if (optarg)
+			mbus_code = strtoul(optarg, nullptr, 0);
+		break;
+	case OptListAudioOutFormats:
+		if (optarg)
+			mbus_code_out = strtoul(optarg, nullptr, 0);
+		break;
+	}
+}
+
+static void __audio_set(cv4l_fd &_fd, bool set, bool _try, __u32 type)
+{
+	struct v4l2_format in_vfmt;
+	int fd = _fd.g_fd();
+	int ret;
+
+	if (!set && !_try)
+		return;
+
+	in_vfmt.type = type;
+	in_vfmt.fmt.audio.audioformat = vfmt.fmt.audio.audioformat;
+
+	if (in_vfmt.fmt.audio.audioformat < 256) {
+		struct v4l2_fmtdesc fmt = {};
+
+		fmt.index = in_vfmt.fmt.audio.audioformat;
+		fmt.type = in_vfmt.type;
+
+		if (doioctl(fd, VIDIOC_ENUM_FMT, &fmt))
+			fmt.pixelformat = 0;
+
+		in_vfmt.fmt.audio.audioformat = fmt.pixelformat;
+	}
+
+	if (set)
+		ret = doioctl(fd, VIDIOC_S_FMT, &in_vfmt);
+	else
+		ret = doioctl(fd, VIDIOC_TRY_FMT, &in_vfmt);
+	if (ret == 0 && (verbose || _try))
+		printfmt(fd, in_vfmt);
+}
+
+void audio_set(cv4l_fd &_fd)
+{
+	__audio_set(_fd, options[OptSetAudioFormat], options[OptTryAudioFormat],
+		   V4L2_BUF_TYPE_AUDIO_CAPTURE);
+	__audio_set(_fd, options[OptSetAudioOutFormat],
+		   options[OptTryAudioOutFormat], V4L2_BUF_TYPE_AUDIO_OUTPUT);
+}
+
+static void __audio_get(cv4l_fd &fd, __u32 type)
+{
+	vfmt.type = type;
+	if (doioctl(fd.g_fd(), VIDIOC_G_FMT, &vfmt) == 0)
+		printfmt(fd.g_fd(), vfmt);
+}
+
+void audio_get(cv4l_fd &fd)
+{
+	if (options[OptGetAudioFormat])
+		__audio_get(fd, V4L2_BUF_TYPE_AUDIO_CAPTURE);
+	if (options[OptGetAudioOutFormat])
+		__audio_get(fd, V4L2_BUF_TYPE_AUDIO_OUTPUT);
+}
+
+void audio_list(cv4l_fd &fd)
+{
+	if (options[OptListAudioFormats]) {
+		printf("ioctl: VIDIOC_ENUM_FMT\n");
+		print_video_formats(fd, V4L2_BUF_TYPE_AUDIO_CAPTURE, mbus_code);
+	}
+
+	if (options[OptListAudioOutFormats]) {
+		printf("ioctl: VIDIOC_ENUM_FMT\n");
+		print_video_formats(fd, V4L2_BUF_TYPE_AUDIO_OUTPUT, mbus_code_out);
+	}
+}
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 0370708b..c089c332 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -79,6 +79,7 @@ void common_usage()
 	       "  --help-all         all options\n"
 	       "  --help-io          input/output options\n"
 	       "  --help-meta        metadata format options\n"
+	       "  --help-audio       audio format options\n"
 	       "  --help-misc        miscellaneous options\n"
 	       "  --help-overlay     overlay format options\n"
 	       "  --help-sdr         SDR format options\n"
@@ -123,6 +124,7 @@ static const char *prefixes[] = {
 	"swradio",
 	"v4l-subdev",
 	"v4l-touch",
+	"v4l-audio",
 	"media",
 	nullptr
 };
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 13bc057d..c96b41d6 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1864,7 +1864,8 @@ static void streaming_set_cap(cv4l_fd &fd, cv4l_fd &exp_fd)
 	if (!(capabilities & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_CAPTURE_MPLANE |
 			      V4L2_CAP_VBI_CAPTURE | V4L2_CAP_SLICED_VBI_CAPTURE |
 			      V4L2_CAP_META_CAPTURE | V4L2_CAP_SDR_CAPTURE |
-			      V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE))) {
+			      V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE |
+			      V4L2_CAP_AUDIO_M2M))) {
 		fprintf(stderr, "unsupported stream type\n");
 		return;
 	}
@@ -2162,7 +2163,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
 
 static void streaming_set_out(cv4l_fd &fd, cv4l_fd &exp_fd)
 {
-	__u32 type = fd.has_vid_m2m() ? v4l_type_invert(fd.g_type()) : fd.g_type();
+	__u32 type = fd.has_m2m() ? v4l_type_invert(fd.g_type()) : fd.g_type();
 	cv4l_queue q(type, out_memory);
 	cv4l_queue exp_q(exp_fd.g_type(), V4L2_MEMORY_MMAP);
 	int fd_flags = fcntl(fd.g_fd(), F_GETFL);
@@ -2178,7 +2179,8 @@ static void streaming_set_out(cv4l_fd &fd, cv4l_fd &exp_fd)
 	if (!(capabilities & (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_OUTPUT_MPLANE |
 			      V4L2_CAP_VBI_OUTPUT | V4L2_CAP_SLICED_VBI_OUTPUT |
 			      V4L2_CAP_SDR_OUTPUT | V4L2_CAP_META_OUTPUT |
-			      V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE))) {
+			      V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE |
+			      V4L2_CAP_AUDIO_M2M))) {
 		fprintf(stderr, "unsupported stream type\n");
 		return;
 	}
@@ -2718,7 +2720,7 @@ static void streaming_set_m2m(cv4l_fd &fd, cv4l_fd &exp_fd)
 	fd.g_fmt(fmt[OUT], out.g_type());
 	fd.g_fmt(fmt[CAP], in.g_type());
 
-	if (!fd.has_vid_m2m()) {
+	if (!fd.has_m2m()) {
 		fprintf(stderr, "unsupported m2m stream type\n");
 		return;
 	}
@@ -2768,7 +2770,7 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
 	bool use_poll = options[OptStreamPoll];
 	bool use_dmabuf = options[OptStreamDmaBuf] || options[OptStreamOutDmaBuf];
 	bool use_userptr = options[OptStreamUser] && options[OptStreamOutUser];
-	__u32 out_type = out_fd.has_vid_m2m() ? v4l_type_invert(out_fd.g_type()) : out_fd.g_type();
+	__u32 out_type = out_fd.has_m2m() ? v4l_type_invert(out_fd.g_type()) : out_fd.g_type();
 	cv4l_queue in(fd.g_type(), memory);
 	cv4l_queue out(out_type, out_memory);
 	fps_timestamps fps_ts[2];
@@ -3007,7 +3009,7 @@ void streaming_list(cv4l_fd &fd, cv4l_fd &out_fd)
 		list_buffers(fd, fd.g_type());
 
 	if (options[OptListBuffersOut])
-		list_buffers(*p_out_fd, p_out_fd->has_vid_m2m() ?
+		list_buffers(*p_out_fd, p_out_fd->has_m2m() ?
 			     v4l_type_invert(p_out_fd->g_type()) : p_out_fd->g_type());
 
 	if (options[OptStreamBufCaps])
diff --git a/utils/v4l2-ctl/v4l2-ctl.1.in b/utils/v4l2-ctl/v4l2-ctl.1.in
index b7e41740..977b1628 100644
--- a/utils/v4l2-ctl/v4l2-ctl.1.in
+++ b/utils/v4l2-ctl/v4l2-ctl.1.in
@@ -32,6 +32,10 @@ wrapper library.
 \fB\-h\fR, \fB\-\-help\fR
 Prints the help message.
 .TP
+\fB\-\-help\-audio\fR
+Prints the help message for all options that get/set/list memory-to-memory audio
+formats.
+.TP
 \fB\-\-help\-io\fR
 Prints the help message for all options that get/set/list inputs and outputs, both
 video and audio.
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index e195ad8e..fb03675e 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -76,6 +76,7 @@ static struct option long_options[] = {
 	{"help-vbi", no_argument, nullptr, OptHelpVbi},
 	{"help-sdr", no_argument, nullptr, OptHelpSdr},
 	{"help-meta", no_argument, nullptr, OptHelpMeta},
+	{"help-audio", no_argument, nullptr, OptHelpAudio},
 	{"help-subdev", no_argument, nullptr, OptHelpSubDev},
 	{"help-selection", no_argument, nullptr, OptHelpSelection},
 	{"help-misc", no_argument, nullptr, OptHelpMisc},
@@ -111,6 +112,8 @@ static struct option long_options[] = {
 	{"list-formats-out-ext", optional_argument, nullptr, OptListOutFormatsExt},
 	{"list-formats-meta", optional_argument, nullptr, OptListMetaFormats},
 	{"list-formats-meta-out", optional_argument, nullptr, OptListMetaOutFormats},
+	{"list-formats-audio", optional_argument, nullptr, OptListAudioFormats},
+	{"list-formats-audio-out", optional_argument, nullptr, OptListAudioOutFormats},
 	{"list-subdev-mbus-codes", optional_argument, nullptr, OptListSubDevMBusCodes},
 	{"list-subdev-framesizes", required_argument, nullptr, OptListSubDevFrameSizes},
 	{"list-subdev-frameintervals", required_argument, nullptr, OptListSubDevFrameIntervals},
@@ -166,6 +169,12 @@ static struct option long_options[] = {
 	{"get-fmt-meta-out", no_argument, nullptr, OptGetMetaOutFormat},
 	{"set-fmt-meta-out", required_argument, nullptr, OptSetMetaOutFormat},
 	{"try-fmt-meta-out", required_argument, nullptr, OptTryMetaOutFormat},
+	{"get-fmt-audio", no_argument, nullptr, OptGetAudioFormat},
+	{"set-fmt-audio", required_argument, nullptr, OptSetAudioFormat},
+	{"try-fmt-audio", required_argument, nullptr, OptTryAudioFormat},
+	{"get-fmt-audio-out", no_argument, nullptr, OptGetAudioOutFormat},
+	{"set-fmt-audio-out", required_argument, nullptr, OptSetAudioOutFormat},
+	{"try-fmt-audio-out", required_argument, nullptr, OptTryAudioOutFormat},
 	{"get-subdev-fmt", optional_argument, nullptr, OptGetSubDevFormat},
 	{"set-subdev-fmt", required_argument, nullptr, OptSetSubDevFormat},
 	{"try-subdev-fmt", required_argument, nullptr, OptTrySubDevFormat},
@@ -233,6 +242,8 @@ static struct option long_options[] = {
 	{"list-buffers-sdr-out", no_argument, nullptr, OptListBuffersSdrOut},
 	{"list-buffers-meta", no_argument, nullptr, OptListBuffersMeta},
 	{"list-buffers-meta-out", no_argument, nullptr, OptListBuffersMetaOut},
+	{"list-buffers-audio", no_argument, nullptr, OptListBuffersAudio},
+	{"list-buffers-audio-out", no_argument, nullptr, OptListBuffersAudioOut},
 	{"stream-count", required_argument, nullptr, OptStreamCount},
 	{"stream-skip", required_argument, nullptr, OptStreamSkip},
 	{"stream-loop", no_argument, nullptr, OptStreamLoop},
@@ -287,6 +298,7 @@ static void usage_all()
        vbi_usage();
        sdr_usage();
        meta_usage();
+       audio_usage();
        subdev_usage();
        selection_usage();
        misc_usage();
@@ -523,6 +535,13 @@ void printfmt(int fd, const struct v4l2_format &vfmt)
 		       printfmtname(fd, vfmt.type, vfmt.fmt.meta.dataformat).c_str());
 		printf("\tBuffer Size     : %u\n", vfmt.fmt.meta.buffersize);
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		printf("\tAudio Format    : '%s'%s\n", fcc2s(vfmt.fmt.audio.audioformat).c_str(),
+		       printfmtname(fd, vfmt.type, vfmt.fmt.audio.audioformat).c_str());
+		printf("\tChannels        : %u\n", vfmt.fmt.audio.channels);
+		printf("\tBuffer Size     : %u\n", vfmt.fmt.audio.buffersize);
+		break;
 	}
 }
 
@@ -1214,6 +1233,9 @@ int main(int argc, char **argv)
 		case OptHelpMeta:
 			meta_usage();
 			return 0;
+		case OptHelpAudio:
+			audio_usage();
+			return 0;
 		case OptHelpSubDev:
 			subdev_usage();
 			return 0;
@@ -1285,6 +1307,7 @@ int main(int argc, char **argv)
 			vbi_cmd(ch, optarg);
 			sdr_cmd(ch, optarg);
 			meta_cmd(ch, optarg);
+			audio_cmd(ch, optarg);
 			subdev_cmd(ch, optarg);
 			selection_cmd(ch, optarg);
 			misc_cmd(ch, optarg);
@@ -1316,6 +1339,7 @@ int main(int argc, char **argv)
 	case MEDIA_TYPE_RADIO:
 	case MEDIA_TYPE_SDR:
 	case MEDIA_TYPE_TOUCH:
+	case MEDIA_TYPE_AUDIO:
 	case MEDIA_TYPE_SUBDEV:
 		break;
 	default:
@@ -1485,6 +1509,7 @@ int main(int argc, char **argv)
 	vbi_set(c_fd);
 	sdr_set(c_fd);
 	meta_set(c_fd);
+	audio_set(c_fd);
 	subdev_set(c_fd);
 	selection_set(c_fd);
 	misc_set(c_fd);
@@ -1502,6 +1527,7 @@ int main(int argc, char **argv)
 	vbi_get(c_fd);
 	sdr_get(c_fd);
 	meta_get(c_fd);
+	audio_get(c_fd);
 	subdev_get(c_fd);
 	selection_get(c_fd);
 	misc_get(c_fd);
@@ -1518,6 +1544,7 @@ int main(int argc, char **argv)
 	vbi_list(c_fd);
 	sdr_list(c_fd);
 	meta_list(c_fd);
+	audio_list(c_fd);
 	subdev_list(c_fd);
 	streaming_list(c_fd, c_out_fd);
 
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index cc7f1184..b9e7c352 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -86,6 +86,8 @@ enum Option {
 	OptGetSdrOutFormat,
 	OptGetMetaFormat,
 	OptGetMetaOutFormat,
+	OptGetAudioFormat,
+	OptGetAudioOutFormat,
 	OptGetSubDevFormat,
 	OptSetSlicedVbiOutFormat,
 	OptSetOverlayFormat,
@@ -95,6 +97,8 @@ enum Option {
 	OptSetSdrOutFormat,
 	OptSetMetaFormat,
 	OptSetMetaOutFormat,
+	OptSetAudioFormat,
+	OptSetAudioOutFormat,
 	OptSetSubDevFormat,
 	OptTryVideoOutFormat,
 	OptTrySlicedVbiOutFormat,
@@ -107,6 +111,8 @@ enum Option {
 	OptTrySdrOutFormat,
 	OptTryMetaFormat,
 	OptTryMetaOutFormat,
+	OptTryAudioFormat,
+	OptTryAudioOutFormat,
 	OptTrySubDevFormat,
 	OptAll,
 	OptListStandards,
@@ -122,6 +128,8 @@ enum Option {
 	OptListOutFormatsExt,
 	OptListMetaFormats,
 	OptListMetaOutFormats,
+	OptListAudioFormats,
+	OptListAudioOutFormats,
 	OptListSubDevMBusCodes,
 	OptListSubDevFrameSizes,
 	OptListSubDevFrameIntervals,
@@ -210,6 +218,8 @@ enum Option {
 	OptListBuffersSdrOut,
 	OptListBuffersMeta,
 	OptListBuffersMetaOut,
+	OptListBuffersAudio,
+	OptListBuffersAudioOut,
 	OptStreamCount,
 	OptStreamSkip,
 	OptStreamLoop,
@@ -255,6 +265,7 @@ enum Option {
 	OptHelpVbi,
 	OptHelpSdr,
 	OptHelpMeta,
+	OptHelpAudio,
 	OptHelpSubDev,
 	OptHelpSelection,
 	OptHelpMisc,
@@ -418,6 +429,13 @@ void meta_list(cv4l_fd &fd);
 void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
 void meta_fillbuffer(cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
 
+// v4l2-ctl-audio.cpp
+void audio_usage(void);
+void audio_cmd(int ch, char *optarg);
+void audio_set(cv4l_fd &fd);
+void audio_get(cv4l_fd &fd);
+void audio_list(cv4l_fd &fd);
+
 // v4l2-ctl-subdev.cpp
 void subdev_usage(void);
 void subdev_cmd(int ch, char *optarg);
-- 
2.42.0


