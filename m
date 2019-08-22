Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50A0A9A066
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 21:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392358AbfHVTpf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 15:45:35 -0400
Received: from mailoutvs50.siol.net ([185.57.226.241]:56282 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2392324AbfHVTpb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 15:45:31 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 4AD9E5249EB;
        Thu, 22 Aug 2019 21:45:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 42uRjQLJpET2; Thu, 22 Aug 2019 21:45:29 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id F1F6252481F;
        Thu, 22 Aug 2019 21:45:28 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 8A5B15249EF;
        Thu, 22 Aug 2019 21:45:26 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        jernej.skrabec@siol.net, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com,
        jonas@kwiboo.se
Subject: [PATCH 8/8] media: cedrus: Add support for V4L2_DEC_CMD_FLUSH
Date:   Thu, 22 Aug 2019 21:45:00 +0200
Message-Id: <20190822194500.2071-9-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190822194500.2071-1-jernej.skrabec@siol.net>
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This command is useful for explicitly flushing last decoded frame.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../staging/media/sunxi/cedrus/cedrus_video.c | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
index 5153b2bba21e..9eae69d5741c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -331,6 +331,37 @@ static int cedrus_s_fmt_vid_out(struct file *file, v=
oid *priv,
 	return 0;
 }
=20
+static int cedrus_try_decoder_cmd(struct file *file, void *fh,
+				  struct v4l2_decoder_cmd *dc)
+{
+	if (dc->cmd !=3D V4L2_DEC_CMD_FLUSH)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int cedrus_decoder_cmd(struct file *file, void *fh,
+			      struct v4l2_decoder_cmd *dc)
+{
+	struct cedrus_ctx *ctx =3D cedrus_file2ctx(file);
+	struct vb2_v4l2_buffer *out_vb, *cap_vb;
+	int ret;
+
+	ret =3D cedrus_try_decoder_cmd(file, fh, dc);
+	if (ret < 0)
+		return ret;
+
+	out_vb =3D v4l2_m2m_last_src_buf(ctx->fh.m2m_ctx);
+	cap_vb =3D v4l2_m2m_last_dst_buf(ctx->fh.m2m_ctx);
+
+	if (out_vb)
+		out_vb->flags &=3D ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
+	else if (cap_vb && cap_vb->is_held)
+		v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
+
+	return 0;
+}
+
 const struct v4l2_ioctl_ops cedrus_ioctl_ops =3D {
 	.vidioc_querycap		=3D cedrus_querycap,
=20
@@ -355,6 +386,9 @@ const struct v4l2_ioctl_ops cedrus_ioctl_ops =3D {
 	.vidioc_streamon		=3D v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff		=3D v4l2_m2m_ioctl_streamoff,
=20
+	.vidioc_try_decoder_cmd		=3D cedrus_try_decoder_cmd,
+	.vidioc_decoder_cmd		=3D cedrus_decoder_cmd,
+
 	.vidioc_subscribe_event		=3D v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event	=3D v4l2_event_unsubscribe,
 };
--=20
2.22.1

