Return-Path: <linux-media+bounces-10945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204A8BD896
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 935EDB23389
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B37A928;
	Tue,  7 May 2024 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="gm67OccF"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F55E389
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041534; cv=none; b=B+JTTxApN6ZLuamlR6Ez75WLTBp93YkiyaSgFvGqJHOlu5S3Oi9JPmquHBeZRyKmxdVs7VsXr2XFd0VH+pJEASZs2dzJ4KI7DqJflBtw4jL97r40HLpjhoBzi73Ilr0Jv8bn17qFr4w9IcxGco9W61CyHwvV6XzuDX9i09JN0LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041534; c=relaxed/simple;
	bh=TYjgjKXafUWqDcFg/VAUrExwUY7VyLxVCeUPBAiTVio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QMUxQ5KHme2Zr+E3VCLSPIfYnww9mGWPLdo35XPY14Wu8x29D4dbb+HSaTr3w49/1MTj7aFi7GMUyq44HLQnt/i6nc/nz6zFzmbVjNQOi2SBy9lO4boIYe31rJGWZ7XU3r6p9smpiL6rGLDp+A/t/ltIz8M+TBb9edp4+qbjYGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=gm67OccF; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041529; x=1715646329; i=herdler@nurfuerspam.de;
	bh=sHiG/LHz5ilh6w4se0jNWjm0J+ARPrwvJ3UBMjE/ADQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gm67OccFUoideISqhCR6XFINqK2/OHg1G8a0vPSzvDCI0OqtgwZMuR9kUslDF411
	 zCatnGyWiAMOKP1yxO5cRWRbVZUHHPLt+pXhhB1N6Wt1C+Z2zyV+bkLfF0yBOmZvw
	 QWLe36mtkI3f7D+AGRiUETwmHZE1Bt2F8ZllmcoQPlgHDarwecqrvcR5MvsNzP9Nj
	 WLDsW7mkIVfqRN9zZUrDnK4wXHJslSdNkgRFD6RtEk3nZlbtkJNA2nrb38vzGq3Ee
	 gAws34/lMDyMzKLaXBhrOJR0pI1eiJYjoSv3L0wkh2W3NAzxjL8eWdF2XQpcvLgof
	 5DY8rgRTJcXwbHLzuw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1OXT-1skFvu1qLD-012scm; Tue, 07
 May 2024 02:25:29 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 17/21] media: av7110: coding style fixes: variable types
Date: Tue,  7 May 2024 02:24:56 +0200
Message-Id: <20240507002500.81867-18-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240507002500.81867-1-herdler@nurfuerspam.de>
References: <20240507002500.81867-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MKi3i80oHKPsLayfvauw1qyeWnwBsH0ByR/Q+QIJVG2aCBzYCUY
 SStwjOdSB2/z8/qLHPCIds8n3eoUb97m9+4wVKmXQiC0h5ziUkcsvCPf2YcsZL+ZdKTZ+2r
 aSqSj0xZ/SGmYcR48MTrr57u3BoFAPv5X+C3xb1Q3FpSuma8P9pqa4UVfQ5/m2GBeKIx0bu
 fc6G4CTxqvupI4Ilp9cpQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6AHejE+96yk=;G57c6MKth9UPEk8BI79y2hJcnG6
 bm/Hdh2VpPSU0zLAldgoY5HYlpJ+Oh2R7oJQZh69aGWx+Jit7cA+4DxPFIptWCcWEn/mqazGt
 5rONNNZt6U/gQV/LMkUFAogSYOajCj3sAnHbi9rjl0IRCCXb8n/rauW7waHpxIRuqWPKWaxFc
 ShN/6cObz2CFOc0x0zSoGpX4VtLgtYkdQTgKYgX2N1qjBMm49Wcu6jNv0iMj/y7Wcc+yUk0bA
 asN48oFZ2WmD6Wp8Vwrw/F+oTboEhEgTcepMukmDpG/K2xmX+/HL4CcMWoAEWiGB7OSeOLlW9
 wKsCaxWS/pJAfBnQXXBnCGXCF2DkFmVIkCDSxn/MSqr/scA2LPfzUPBJktcJ5WKZMKA02TS0D
 Rqo+6PEr6GYvy5Q5FwpV+xP5PUeXDp4fFqVuaRElc78c9o102L8CBW3WJvl52I0okKovKbREo
 Mcp39jve8tgHTcdSR9W/Hw8oc+bHZtHf5Q4Z4joTrOzIGH+wc+renoq7ja5azD7TjcgUPdM8l
 qT3SH9gQ+U7Vi4pCUqGEfkLxnuRuExvwKzBkLxlBELdZZaOIkp59Z880DpxSwSCCznN7D3/vH
 cVri4sKUOiXb0TTRdWAGRn2bgQybaomKRESbzLKAgRBlVM93dR2dM8vW2GK6fo0hFxF+JxlOq
 LJ6LrVyKHep5d4wiZC+ImoHyhdhYYvL2pTEwS/W+lgFmJuf+x1IJfQOZNJlzQhVBtqhaXN3LX
 WosPzFxJ1ru+o/FC+Epinn+Os7fRCJNVsuEbkYyqu4kIHnTL04J0ENSPXS0JS9DCeYsOEFy7u
 46TT9W08J/eIcpI4Jw7W6ae095fxFzeyVZW5SIVvGA7qA=

This patch fixes the following checkpatch warnings:

CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 's32' over 'int32_t'
CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
WARNING:UNNECESSARY_INT: Prefer 'long' over 'long int' as the int is unnec=
essary
WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
Will be fixes in:
[PATCH 21/21] media: av7110: coding style fixes: avoid_externs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

 drivers/staging/media/av7110/av7110.c    |  4 ++--
 drivers/staging/media/av7110/av7110.h    |  2 +-
 drivers/staging/media/av7110/av7110_av.c | 12 ++++++------
 drivers/staging/media/av7110/av7110_av.h |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index 42b5d049e..14c512fdf 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1094,7 +1094,7 @@ static void restart_feeds(struct av7110 *av7110)
 }

 static int dvb_get_stc(struct dmx_demux *demux, unsigned int num,
-		       uint64_t *stc, unsigned int *base)
+		       u64 *stc, unsigned int *base)
 {
 	int ret;
 	u16 fwstc[4];
@@ -1183,7 +1183,7 @@ static int stop_ts_capture(struct av7110 *budget)

 static int start_ts_capture(struct av7110 *budget)
 {
-	unsigned y;
+	unsigned int y;

 	dprintk(2, "budget: %p\n", budget);

diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media=
/av7110/av7110.h
index 1cfe13df6..3f6b88f0f 100644
=2D-- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -58,7 +58,7 @@ enum av7110_video_mode {
 struct av7110_p2t {
 	u8		  pes[TS_SIZE];
 	u8		  counter;
-	long int	  pos;
+	long		  pos;
 	int		  frags;
 	struct dvb_demux_feed *feed;
 };
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/me=
dia/av7110/av7110_av.c
index 3e0db8e9a..a408e10fb 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -71,7 +71,7 @@
 #define PIECE_RATE	 0x40
 #define SEAM_SPLICE	 0x20

-static void p_to_t(u8 const *buf, long int length, u16 pid,
+static void p_to_t(u8 const *buf, long length, u16 pid,
 		   u8 *counter, struct dvb_demux_feed *feed);
 static int write_ts_to_decoder(struct av7110 *av7110, int type, const u8 =
*buf, size_t len);

@@ -585,7 +585,7 @@ static void clear_p2t(struct av7110_p2t *p)
 	p->frags =3D 0;
 }

-static int find_pes_header(u8 const *buf, long int length, int *frags)
+static int find_pes_header(u8 const *buf, long length, int *frags)
 {
 	int c =3D 0;
 	int found =3D 0;
@@ -634,7 +634,7 @@ static int find_pes_header(u8 const *buf, long int len=
gth, int *frags)
 	return c;
 }

-void av7110_p2t_write(u8 const *buf, long int length, u16 pid, struct av7=
110_p2t *p)
+void av7110_p2t_write(u8 const *buf, long length, u16 pid, struct av7110_=
p2t *p)
 {
 	int c, c2, l, add;
 	int check, rest;
@@ -763,7 +763,7 @@ static int write_ts_header2(u16 pid, u8 *counter, int =
pes_start, u8 *buf, u8 len
 	return c;
 }

-static void p_to_t(u8 const *buf, long int length, u16 pid, u8 *counter,
+static void p_to_t(u8 const *buf, long length, u16 pid, u8 *counter,
 		   struct dvb_demux_feed *feed)
 {
 	int l, pes_start;
@@ -1023,7 +1023,7 @@ static u8 iframe_header[] =3D { 0x00, 0x00, 0x01, 0x=
e0, 0x00, 0x00, 0x80, 0x00, 0x

 static int play_iframe(struct av7110 *av7110, char __user *buf, unsigned =
int len, int nonblock)
 {
-	unsigned i, n;
+	unsigned int i, n;
 	int progressive =3D 0;
 	int match =3D 0;

@@ -1090,7 +1090,7 @@ static int play_iframe(struct av7110 *av7110, char _=
_user *buf, unsigned int len
 #ifdef CONFIG_COMPAT
 struct compat_video_still_picture {
 	compat_uptr_t iFrame;
-	int32_t size;
+	s32 size;
 };

 #define VIDEO_STILLPICTURE32 _IOW('o', 30, struct compat_video_still_pict=
ure)
diff --git a/drivers/staging/media/av7110/av7110_av.h b/drivers/staging/me=
dia/av7110/av7110_av.h
index ce0f9945d..f1c5c26c6 100644
=2D-- a/drivers/staging/media/av7110/av7110_av.h
+++ b/drivers/staging/media/av7110/av7110_av.h
@@ -21,7 +21,7 @@ extern int av7110_av_start_play(struct av7110 *av7110, i=
nt av);
 extern void dvb_video_add_event(struct av7110 *av7110, struct video_event=
 *event);

 extern void av7110_p2t_init(struct av7110_p2t *p, struct dvb_demux_feed *=
feed);
-extern void av7110_p2t_write(u8 const *buf, long int length, u16 pid, str=
uct av7110_p2t *p);
+extern void av7110_p2t_write(u8 const *buf, long length, u16 pid, struct =
av7110_p2t *p);

 extern int av7110_av_register(struct av7110 *av7110);
 extern void av7110_av_unregister(struct av7110 *av7110);
=2D-
2.34.0


