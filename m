Return-Path: <linux-media+bounces-62368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOG5E0k+Dmqr9AUAu9opvQ
	(envelope-from <linux-media+bounces-62368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:05:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE3F59C8AD
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 41083310E712
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10643FCB2D;
	Wed, 20 May 2026 22:45:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB563FB7E7
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 22:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779317101; cv=none; b=Ay9e1/kQR5HuezfUMekn49lexYEJkSuVDdxOmDVjIEbuh5uUXIW0SOpTPyrMgcGRC6v5VpK349VccfIMSp7bn4vEAKk7VcscZ5vqPNBT7e1Yzthf+UVC2ezdvDJr8aYObm3YfL56V2lAUWHssRF0raCNd49xeFZigr5Mo1S347A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779317101; c=relaxed/simple;
	bh=Uqg6wmWG6y9fNdlQFRUJKJQX+Ue5TJkuYK51zqkA9SI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FYzSvf4P+NNEOgjPxIexB4zVjamXOxRKXn3dL9M+NCaQFLcOTGwupkXfWw6sUWcp2KmLz9xbmPnZl0NRoXqustk8lXctMe3rwxAkJubbuapZbUXIAT4y6xMBXb5an/cr3fcUI9x9KqZ/SYlCEAMY1dNq1WbNm9rQ/2xC7pSEIzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wPpeZ-0005vy-TJ; Thu, 21 May 2026 00:44:39 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Thu, 21 May 2026 00:44:15 +0200
Subject: [PATCH v7 10/28] media: rockchip: rga: announce and sync
 colorimetry
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-spu-rga3-v7-10-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
In-Reply-To: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62368-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,collabora.com:email]
X-Rspamd-Queue-Id: 4EE3F59C8AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Announce the capability to adjust the quantization and ycbcr_enc on the
capture side and check if the SET_CSC flag is set when the colorimetry
is changed. Furthermore copy the colorimetry from the output to the
capture side to fix the currently failing v4l2-compliance tests, which
expect exactly this behavior.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index ca8d8a53dc251..8c34f73d69764 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -437,6 +437,15 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 	fmt = &formats[f->index];
 	f->pixelformat = fmt->fourcc;
 
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return 0;
+
+	/* allow changing the quantization and xfer func for YUV formats */
+	if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
+		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION |
+			    V4L2_FMT_FLAG_CSC_YCBCR_ENC;
+
 	return 0;
 }
 
@@ -459,8 +468,25 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rga_fmt *fmt;
 
+	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
+		const struct rga_frame *frm;
+
+		frm = rga_get_frame(ctx, f->type);
+		if (IS_ERR(frm))
+			return PTR_ERR(frm);
+
+		if (!(pix_fmt->flags & V4L2_PIX_FMT_FLAG_SET_CSC)) {
+			pix_fmt->quantization = frm->pix.quantization;
+			pix_fmt->ycbcr_enc = frm->pix.ycbcr_enc;
+		}
+		/* disallow values not announced in vidioc_enum_fmt */
+		pix_fmt->colorspace = frm->pix.colorspace;
+		pix_fmt->xfer_func = frm->pix.xfer_func;
+	}
+
 	fmt = rga_fmt_find(pix_fmt->pixelformat);
 	if (!fmt)
 		fmt = &formats[0];
@@ -506,6 +532,17 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm->fmt = rga_fmt_find(pix_fmt->pixelformat);
 	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
 
+	/*
+	 * Copy colorimetry from output to capture as required by the
+	 * v4l2-compliance tests
+	 */
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		ctx->out.pix.colorspace = pix_fmt->colorspace;
+		ctx->out.pix.ycbcr_enc = pix_fmt->ycbcr_enc;
+		ctx->out.pix.quantization = pix_fmt->quantization;
+		ctx->out.pix.xfer_func = pix_fmt->xfer_func;
+	}
+
 	/* Reset crop settings */
 	frm->crop.left = 0;
 	frm->crop.top = 0;

-- 
2.54.0


