Return-Path: <linux-media+bounces-59792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHijEs+A8Gn6UAEAu9opvQ
	(envelope-from <linux-media+bounces-59792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:41:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2D2481B18
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 180AF302EC4D
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10013D9DD4;
	Tue, 28 Apr 2026 09:01:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E563DD50B
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366862; cv=none; b=nmCVmbDBjO2XOAa2iNMcb3Lxy7A8U9pgLmN+BahYjkw+IswLVzsoXgvYUObFrEnJqVP08isY/Q7yHYGa4iMcur/+Y+SCjBYWeDqRMxGs/w3bGmQDEoduiuw953g7gJXMHGTozDwNVCVXLFwoUeldLhCQ13QufA1MeNZ3khCvNLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366862; c=relaxed/simple;
	bh=BH2oF6z4IcbYRERqJXEJ87CMKAgRRaFDo4Hk4DFuD5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gm8DhoMkO8S01QeUnvczdgHu21kTxd+FW6Df2307riComc4Ko6gyljkeGx6Nw9HKdY5Rb2FDPVXTi8GuydjZohlpuXBuqZ392jsHbnOopojlIDeqHEcOA9drpwnV+Cnry0A3/AFWuqJxxOGYc/f0ZCDpCtdxk/D/N/Xv+PokY08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHeJE-0004Lz-7d; Tue, 28 Apr 2026 11:00:48 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 28 Apr 2026 11:00:47 +0200
Subject: [PATCH v5 12/29] media: rockchip: rga: avoid odd frame sizes for
 YUV formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-spu-rga3-v5-12-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
In-Reply-To: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: 4D2D2481B18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59792-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email]

Avoid odd frame sizes for YUV formats, as they may cause undefined
behavior. This is done in preparation for the RGA3, which hangs when the
output format is set to 129x129 pixel YUV420 SP (NV12).

This requirement is documented explicitly for the RGA3 in  section 5.6.3
of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
(section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions the
x/y offsets and stride aligning requirements. But the vendor driver for
the RGA2 also contains checks for the width and height to be aligned to
2 bytes.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index f599c992829dd..77b8c7ab74274 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	const struct rga_hw *hw = ctx->rga->hw;
 	struct rga_fmt *fmt;
+	struct v4l2_frmsize_stepwise frmsize = {
+		.min_width = hw->min_width,
+		.max_width = hw->max_width,
+		.min_height = hw->min_height,
+		.max_height = hw->max_height,
+		.step_width = 1,
+		.step_height = 1,
+	};
+
+	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
+		frmsize.step_width = 2;
+		frmsize.step_height = 2;
+	}
 
 	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
 		const struct rga_frame *frm;
@@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	if (!fmt)
 		fmt = &hw->formats[0];
 
-	pix_fmt->width = clamp(pix_fmt->width,
-			       hw->min_width, hw->max_width);
-	pix_fmt->height = clamp(pix_fmt->height,
-				hw->min_height, hw->max_height);
-
+	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frmsize);
 	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
 	pix_fmt->field = V4L2_FIELD_NONE;
 

-- 
2.54.0


