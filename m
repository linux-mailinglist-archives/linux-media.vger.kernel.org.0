Return-Path: <linux-media+bounces-67022-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BDglMftqTmpAMQIAu9opvQ
	(envelope-from <linux-media+bounces-67022-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:21:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E264727EB0
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:21:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=Trmf1Cql;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67022-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67022-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E6673114DC4
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB0C4CA282;
	Wed,  8 Jul 2026 14:49:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4F48C3FA
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522172; cv=none; b=IfwuulCdMD9qZ4U7zh7lEN5FqyAL0r1EFLhZaK6O0zZbgNOYJsDIcJp2jLfSIGbukF5JlMovrx98mIXxrKyBEPiSqycXHnATGVcJMdSrAYWBXvUrTToWmRcxF3YW7OKfM9KWiNHPAvO4XL8vhcM2XAkSLNHb0OKPVT2/++3cdkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522172; c=relaxed/simple;
	bh=xUTMOWk5+CT994jr6gP3kud/mZi2SFkhl+KumJEc/R0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mEnLLQKz/cYGWIKp37afzQybD09QLNaIgknuP4UPXwdvhqfn5CBxzv/IK7PnB/S1qgi+sMGX/7mRMdQATtwPoFcReKavwKPyssf4xedV2lhHqrtPlpaHvxwpkVTFVGf/m2VPXacLSLR/WWSdHPQCx8G8gbOVEp1pT/6oF2YEtao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Trmf1Cql; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ba701891so5495225e9.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522163; x=1784126963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RDtHzsl2KamU1JjxV3tuy+ogtFxRgmslfEKzaLXknw=;
        b=Trmf1CqlJ5VYl+Z+eiBpe5HnWwJnkkqPcrm5SZxNWKFIq9nyc3yc+hH+geEQuXe2XE
         ZZ00FPkC0YipD2EyhljZ9dQkM/tgKprNMOr31ZhgQ8TxyxdvBuJFrMihL6HTJ3+iWtQt
         u4OWN2LGzHuNtAptjN7kXg4iTBq3if5sU8syD1vwaMD63/579MPHTzt1+rGA6BXIm9bX
         oaa39TUDtC2txQ0uPnFRt5n1dTjjC3XQmeiFiUOYuXxWsKcW7vJHirJJWh2WvqGR0F8c
         cU9ClBLxZWp6Vw8tuSXmUzbmv0ra9PLcmkyh+LRYSMH0xSiU0h81K6F6y8uR3WNQUn4g
         4hPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522163; x=1784126963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RDtHzsl2KamU1JjxV3tuy+ogtFxRgmslfEKzaLXknw=;
        b=p1eJPrTrdfwOxdYqxJqgeIaMeNbNovGI6cvJ4vRvXZQ8remi8xNS8Zg4DebFbjSSKo
         ISM+waHg0/TTQPxuBSWTsZXS0fwkxNmaCl18182zdpAIBvpoRTINyWSuhEdXdXRxoE1W
         r96QftuBl7x1P8qkYus56xvI7l8zW2DnklFlDk+WZVxcXXx9yXTgKM6bUfnzdb1XYw9F
         yihiTGfln+jOlcTyKj/JzBmOsfE0zHdB8M+IHYf3fAwTKhq2t+c5n8SaP9DFLhlpbyls
         fc+0ck14LaZyRm1LwJ5O+oIJwMWhn734eG3kmIU/8mRjmXunkVoVy59f2BjI9+nOAPfQ
         g1AQ==
X-Gm-Message-State: AOJu0Yw1dICab3QF81p61pZn4rmuWQ53l8jAb69Pidz6dYHttJySa4+v
	JlLHXDCHoQ3DVMrT2q5ysgPM/1LvnqB+xpntPOe29kx81u6NtRUjPRIF7yhq8XxH0us=
X-Gm-Gg: AfdE7cncd2fJqkDNEBmKlYzx3GxKmBCVtuW4kTOiCuvwlq+P2Y+JUO+9ZtF7qICOed5
	K0cyzFjqqhMDPf7U5H+biOd/TeOK7Joo/+eF54bCTJefETNPIDrD1sPTH2bSZArNoOVwU33l0S7
	WIFFT5cG4QmFliiPnDLNtcjo3kF8Hvf/pxtXgjjft+d6sSWMwZv9gJlC+maDEBrxAQ/f9ojucQG
	0GmeUWC7YWavWo8spmoDzuheosF4Ie8fpHOtQmAEbmn9mTdT7/9JFbgpMf1YPorugxZNhLYDvwU
	xsBgMu2J7SW1htXsAtqAien1/yB8GMOM3Nbs4uaOtBRGD/VMP/EkCOeb1cmUiI32MSLIExCIm5Z
	CcPPfq7aQKDjQLrsUpgTzpeL0eWP4aK3I9TO6DQ5sXCY2FLBMWNgoGe/4XrH9+bE2TwiM1YcL+s
	Dk7bkgSLblHqMKM1i9ZIoK3Q0nnvDSmXOnuzctvHwXrmiJ8f7OJuPM9arnevWIfTNNo+l+ldFVc
	9E=
X-Received: by 2002:a05:600c:4709:b0:490:b7e6:bd1d with SMTP id 5b1f17b1804b1-493e689c16dmr28929185e9.16.1783522162862;
        Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:53 +0100
Subject: [PATCH v3 17/20] media: imx355: Compute link frequency from PLL
 setup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-17-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67022-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E264727EB0

In preparation for additional options in the PLL setup, compute
the link frequency rather than using a hardcoded value.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 6a779d700a4b..e45d60d665a1 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -29,7 +29,11 @@
 
 /* PLL registers that depend on the external clock frequency */
 #define IMX355_REG_EXTCLK_FREQ		CCI_REG16(0x0136)
+#define IMX355_REG_PLL_OP_PREDIV	CCI_REG8(0x030d)
 #define IMX355_REG_PLL_OP_MUL		CCI_REG16(0x030e)
+#define IMX355_REG_PLL_IVT_PCK_DIV	CCI_REG8(0x0301)
+#define IMX355_PLL_OP_PREDIV		2
+#define IMX355_PLL_IVT_PCK_DIV		5
 
 /* V_TIMING internal */
 #define IMX355_REG_FLL			CCI_REG16(0x0340)
@@ -83,9 +87,6 @@
 /* Flip Control */
 #define IMX355_REG_ORIENTATION		CCI_REG8(0x0101)
 
-/* default link frequency and external clock */
-#define IMX355_LINK_FREQ_DEFAULT	360000000LL
-
 /* number of data lanes */
 #define IMX355_DATA_LANES		4
 
@@ -141,6 +142,7 @@ static const struct imx355_clk_params imx355_clk_params[] = {
 };
 
 struct imx355_hwcfg {
+	s64 link_freq_menu;
 	unsigned long link_freq_bitmap;
 };
 
@@ -238,13 +240,13 @@ static const struct cci_reg_sequence imx355_global_regs[] = {
 	{ CCI_REG8(0x0112), 0x0a },
 	{ CCI_REG8(0x0113), 0x0a },
 	{ CCI_REG8(0x0114), 0x03 },
-	{ CCI_REG8(0x0301), 0x05 },
+	{ IMX355_REG_PLL_IVT_PCK_DIV, IMX355_PLL_IVT_PCK_DIV },
 	{ CCI_REG8(0x0303), 0x01 },
 	{ CCI_REG8(0x0305), 0x02 },
 	{ CCI_REG8(0x0306), 0x00 },
 	{ CCI_REG8(0x0307), 0x78 },
 	{ CCI_REG8(0x030b), 0x01 },
-	{ CCI_REG8(0x030d), 0x02 },
+	{ IMX355_REG_PLL_OP_PREDIV, IMX355_PLL_OP_PREDIV },
 	{ CCI_REG8(0x0310), 0x00 },
 	{ CCI_REG8(0x0220), 0x00 },
 	{ CCI_REG8(0x0222), 0x01 },
@@ -338,14 +340,6 @@ static const char * const imx355_test_pattern_menu[] = {
 	"Pseudorandom Sequence (PN9)",
 };
 
-/*
- * When adding more than the one below, make sure the disallowed ones will
- * actually be disabled in the LINK_FREQ control.
- */
-static const s64 link_freq_menu_items[] = {
-	IMX355_LINK_FREQ_DEFAULT,
-};
-
 /* Mode configs */
 static const struct imx355_mode supported_modes[] = {
 	{
@@ -1091,7 +1085,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 	s64 hblank;
 	u64 pixel_rate;
 	const struct imx355_mode *mode;
-	u32 max;
 	int ret;
 
 	ctrl_hdlr = &imx355->ctrl_handler;
@@ -1100,15 +1093,14 @@ static int imx355_init_controls(struct imx355 *imx355)
 		return ret;
 
 	ctrl_hdlr->lock = &imx355->mutex;
-	max = ARRAY_SIZE(link_freq_menu_items) - 1;
 	imx355->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx355_ctrl_ops,
-						   V4L2_CID_LINK_FREQ, max, 0,
-						   link_freq_menu_items);
+						   V4L2_CID_LINK_FREQ, 0, 0,
+						   &imx355->hwcfg->link_freq_menu);
 	if (imx355->link_freq)
 		imx355->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
+	pixel_rate = imx355->hwcfg->link_freq_menu * 2 * 4;
 	do_div(pixel_rate, 10);
 	/* By default, PIXEL_RATE is read only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -1183,12 +1175,14 @@ static int imx355_init_controls(struct imx355 *imx355)
 	return ret;
 }
 
-static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
+static struct imx355_hwcfg *imx355_get_hwcfg(struct imx355 *imx355)
 {
+	struct device *dev = imx355->dev;
 	struct imx355_hwcfg *cfg;
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
+	const struct imx355_clk_params *clk = imx355->clk_params;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	int ret;
@@ -1211,10 +1205,11 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
 		goto out_err;
 
+	cfg->link_freq_menu = (clk->ext_clk * clk->pll_op_mpy) /
+			      (IMX355_PLL_OP_PREDIV * 2);
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       link_freq_menu_items,
-				       ARRAY_SIZE(link_freq_menu_items),
+				       &cfg->link_freq_menu, 1,
 				       &cfg->link_freq_bitmap);
 	if (ret)
 		goto out_err;
@@ -1285,7 +1280,7 @@ static int imx355_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
 
-	imx355->hwcfg = imx355_get_hwcfg(imx355->dev);
+	imx355->hwcfg = imx355_get_hwcfg(imx355);
 	if (!imx355->hwcfg) {
 		dev_err(imx355->dev, "failed to get hwcfg");
 		ret = -ENODEV;

-- 
2.34.1


