Return-Path: <linux-media+bounces-51673-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID77I53PeGmNtQEAu9opvQ
	(envelope-from <linux-media+bounces-51673-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:45:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A61195F1D
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C31FA303190B
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 14:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CF736072F;
	Tue, 27 Jan 2026 14:40:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5784935FF62
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524820; cv=none; b=EPVaM28wkuQtNModzUjdwKJtkVipto4iKvpyIZjz0ZDNLK8kKF9Etng8NMRTkGnqb+LerPtldU5OrP5NQxVlXlRljx2+fBSNkP1XaiXQ1rEt6e0OQKN9p//uPQeeNP38bnCTzOF8PP31PT/DyKRr+boJsFzxDhy6UcCTm6H5fpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524820; c=relaxed/simple;
	bh=i76+ZhA7uUnOTpJ826FpHqCzbtSaPcBMDvf50EJMVwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HPbCyUZ4D2XAvcL0kGKcuMxEc1Ynxf6vWh2oGX+0fOvthXHzNDP573CerL3gBwZGvDFo8fsUp7+wCHOarr8DJ9859NhBoorv5fv6LFM43B5cSVswCMag3a1ZQ+jix4yPvJrLnMUEYJny8OKY+XGXLnH2Cgp1Ty5axyCUne1AIDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vkkEn-0007YT-1K; Tue, 27 Jan 2026 15:40:13 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 27 Jan 2026 15:39:18 +0100
Subject: [PATCH v3 09/27] media: rockchip: rga: announce and sync
 colorimetry
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-spu-rga3-v3-9-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
In-Reply-To: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51673-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9A61195F1D
X-Rspamd-Action: no action

Announce the capability to adjust the quantization and ycbcr_enc on the
capture side and check if the SET_CSC flag is set when the colorimetry
is changed. Furthermore copy the colorimetry from the output to the
capture side to fix the currently failing v4l2-compliance tests, which
expect exactly this behavior.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 20d1d9cb7625d..cf9d5702598fa 100644
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
2.52.0


