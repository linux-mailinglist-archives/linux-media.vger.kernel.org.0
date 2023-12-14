Return-Path: <linux-media+bounces-2390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321F81288D
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 07:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CFDF1F2120D
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 06:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB9F10A14;
	Thu, 14 Dec 2023 06:50:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A464EB9;
	Wed, 13 Dec 2023 22:50:50 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6EE82819B;
	Thu, 14 Dec 2023 14:50:49 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:49 +0800
Received: from ubuntu.mshome.net (113.72.145.168) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:46 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	"Marvin Lin" <milkfafa@gmail.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, "Ming Qian" <ming.qian@nxp.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Carpenter
	<dan.carpenter@linaro.org>
CC: Jack Zhu <jack.zhu@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
Subject: [PATCH v1 8/9] staging: media: starfive: Add frame sync event for video capture device
Date: Wed, 13 Dec 2023 22:50:26 -0800
Message-ID: <20231214065027.28564-9-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214065027.28564-1-changhuang.liang@starfivetech.com>
References: <20231214065027.28564-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Add frame sync event for video capture device.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../staging/media/starfive/camss/stf-capture.c    |  9 +++++++++
 drivers/staging/media/starfive/camss/stf-video.c  | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers=
/staging/media/starfive/camss/stf-capture.c
index 6a137a273c8a..d0be769da11b 100644
--- a/drivers/staging/media/starfive/camss/stf-capture.c
+++ b/drivers/staging/media/starfive/camss/stf-capture.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
  */
=20
+#include <media/v4l2-event.h>
 #include "stf-camss.h"
=20
 static const char * const stf_cap_names[] =3D {
@@ -430,10 +431,15 @@ static void stf_buf_flush(struct stf_v_buf *output,=
 enum vb2_buffer_state state)
=20
 static void stf_buf_done(struct stf_v_buf *output)
 {
+	struct stf_capture *cap =3D container_of(output, struct stf_capture,
+					       buffers);
 	struct stfcamss_buffer *ready_buf;
 	struct stfcamss *stfcamss =3D cap->video.stfcamss;
 	u64 ts =3D ktime_get_ns();
 	unsigned long flags;
+	struct v4l2_event event =3D {
+		.type =3D V4L2_EVENT_FRAME_SYNC,
+	};
=20
 	if (output->state =3D=3D STF_OUTPUT_OFF ||
 	    output->state =3D=3D STF_OUTPUT_RESERVED)
@@ -445,6 +451,9 @@ static void stf_buf_done(struct stf_v_buf *output)
 		if (cap->type =3D=3D STF_CAPTURE_SCD)
 			stf_isp_fill_yhist(stfcamss, ready_buf->vaddr_sc);
=20
+		event.u.frame_sync.frame_sequence =3D output->sequence;
+		v4l2_event_queue(&cap->video.vdev, &event);
+
 		ready_buf->vb.vb2_buf.timestamp =3D ts;
 		ready_buf->vb.sequence =3D output->sequence++;
=20
diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/s=
taging/media/starfive/camss/stf-video.c
index 54d855ba0b57..32381e9ad049 100644
--- a/drivers/staging/media/starfive/camss/stf-video.c
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -507,6 +507,17 @@ static int video_try_fmt(struct file *file, void *fh=
, struct v4l2_format *f)
 	return __video_try_fmt(video, f);
 }
=20
+static int video_subscribe_event(struct v4l2_fh *fh,
+				 const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	default:
+		return -EINVAL;
+	}
+}
+
 static const struct v4l2_ioctl_ops stf_vid_ioctl_ops =3D {
 	.vidioc_querycap                =3D video_querycap,
 	.vidioc_enum_fmt_vid_cap        =3D video_enum_fmt,
@@ -523,6 +534,8 @@ static const struct v4l2_ioctl_ops stf_vid_ioctl_ops =
=3D {
 	.vidioc_prepare_buf             =3D vb2_ioctl_prepare_buf,
 	.vidioc_streamon                =3D vb2_ioctl_streamon,
 	.vidioc_streamoff               =3D vb2_ioctl_streamoff,
+	.vidioc_subscribe_event         =3D video_subscribe_event,
+	.vidioc_unsubscribe_event       =3D v4l2_event_unsubscribe,
 };
=20
 static int video_scd_g_fmt(struct file *file, void *fh, struct v4l2_form=
at *f)
@@ -554,6 +567,8 @@ static const struct v4l2_ioctl_ops stf_vid_scd_ioctl_=
ops =3D {
 	.vidioc_prepare_buf             =3D vb2_ioctl_prepare_buf,
 	.vidioc_streamon                =3D vb2_ioctl_streamon,
 	.vidioc_streamoff               =3D vb2_ioctl_streamoff,
+	.vidioc_subscribe_event         =3D video_subscribe_event,
+	.vidioc_unsubscribe_event       =3D v4l2_event_unsubscribe,
 };
=20
 /* ---------------------------------------------------------------------=
--------
--=20
2.25.1


