Return-Path: <linux-media+bounces-67667-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dxOyIWR0V2q6OQEAu9opvQ
	(envelope-from <linux-media+bounces-67667-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:52:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 192DB75DC8C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:52:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=FgVMfjCH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67667-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67667-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A99A931658B8
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE4847ECCF;
	Wed, 15 Jul 2026 11:44:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C1044C659
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115870; cv=none; b=TTl/2A4YVHEl/FQ0wLYRVwK3JSbVzhY34gmfU3V4hdmlHCxjfDNCp366TTpVvr2GHCC/zybRizAGU58Jm2AVp5A5PK4AxZ5z6K0IHjbPXyWSBaYd0w6u0J5mblqJtlbT7GRWSLhqgqO7k/hk/xMFrkAYe9T9BOSCpMdgFFa5Jj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115870; c=relaxed/simple;
	bh=Wl8RfzI9IrUnC7tk+Es7yprPsqx3LPpSpAVr4tycswo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCK4cr/opX+qVq+4BzzMj2nSYbwzAuOphkdZsnVpWhzSmC2C+9O/a+YPmLHrFroXp+RDdQd0BKCrhrYykEKbhKNqDYaFY6GnX8Am8amLXfHS/eaDqGGFBYNqOHIoApi3hnrHSFYSb5yyoD9+3fLYrBcQpTCFgOEKiq3ze45DCNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=FgVMfjCH; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso2928407f8f.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115866; x=1784720666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pl7PA8UFD8aYyE0Hyiby4HzRH7HToq0zqg27/Ivv8vM=;
        b=FgVMfjCHbJUxN04u+ei6w7280x1K27WbYHcNJjvFeZ05KEttB/dT6qdCxQ2QjCyJlQ
         m2KHFQinBn4OjRxAnQPHhPT59AZ7xAWNIm+b2wMJU/+9sAceczSRV+VKqw8Si8MezOxa
         9w8ovqXCQYLmbrbnlIRS/BhTKos1I/55UqmBHYXF3BASDtWHciwPQPAgVd1ECmeOQK39
         kuwf6k5Lq3/wV0QUNzZVfFQlujVPVZ15rMM1PRHyuIbNele3mjQU/4jf8cwIhoWX4jwY
         JYW5xhaBPjOyAz9x4DYUtpHogSTdOkkehIzaU2iwphFg2Iee21hsUUYw1UV7oeDb+80I
         xPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115866; x=1784720666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pl7PA8UFD8aYyE0Hyiby4HzRH7HToq0zqg27/Ivv8vM=;
        b=keXvI/6RRw6TwOoLJAJpVa1Tnevdl33X7OqPwoba8k9XquslsyHmdjR0vXiRk8cjSP
         DcdNvYflFJV5cJfsq8IPqWUJUIayxLZYJpS4K5IlMZ8DkjrriWsIZl0bFkrSZyOjcmL2
         MOFC3rkSUcKPOIIoagL3xG2Pbwuqu7uXf69n87f1DU/dcCIYTyB8wVZKeZbTzChWwCWg
         S60AsyeZwAuExUpwjVonr71rmJF9iPTrUGegmE1/mAcdE7lKTG0xjWYKQjLYBeNKveF+
         6Q0ETb44YnXVHtF/POjbbQIBXjnGxI9AcBOVNBhuvrMrB3eWl2jOKlpxNu1ZKcu0TV7n
         SFYA==
X-Gm-Message-State: AOJu0YzfRr7g+Q8ZdymqjxCDsRAYdvffhkuzKr/8umJB+qxZtXjDv1+b
	FzMUV25SX8FTho7lhwNzuxkQaunXV5gQBUslntSno09xEZnREbCRGGhloCGEKnuOoRU=
X-Gm-Gg: AfdE7ckJSqLWyIor+eI+EerWgG1/6xRm+fLFv4JstYq8R3YjTtLYZ3KUGjHnPddZXMx
	kgo2daA+TumptWQDuO9/FYuOGpf/cYE0r/LIZM4dpsuvd6gQDO6XErVq4tMK6b4TVhIbLiqzaiq
	ADENAdTfjFiAcTzz9C3Q3t9bbTwLK1c5ioSLmczS5HQhNt4wcV2uqh6byJ/WiUJ926ikfHgLbzS
	BZSSy2YGTzwU4FR9yH1BgBk14veI6Tam2LigQNpxhgfS02ZpW4C4onu8kfaxLKIvi873RLCRMxY
	bcKmkDknKmquDWn0aZpPLIbmddbehg0rrDL3bl2iGQvSOejE/iVeRzPGqtOsE0Z67uGpD57Tiuy
	of1gnPQrqFm68JjAYns8+9ZMWG5N2RbPCp3c5J8nujAF41JioSoWEGS+wEYq9AExSOWUoG9gd+5
	70x/hG3dNMXjPZGpWO4cp9x9d97Xfok9k4lOEsYxvQvcYobpDG93V5yXJt5elCNk9n
X-Received: by 2002:a05:6000:4a0a:b0:47d:f43b:fd63 with SMTP id ffacd0b85a97d-47f4fcc1527mr2804147f8f.26.1784115866245;
        Wed, 15 Jul 2026 04:44:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:25 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:31 +0100
Subject: [PATCH v4 18/21] media: imx355: Compute link frequency from PLL
 setup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-18-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67667-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 192DB75DC8C

In preparation for additional options in the PLL setup, compute
the link frequency rather than using a hardcoded value.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 3b3bf41485c2..d8f8efc0c927 100644
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
@@ -1092,7 +1086,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 	s64 hblank;
 	u64 pixel_rate;
 	const struct imx355_mode *mode;
-	u32 max;
 	int ret;
 
 	ctrl_hdlr = &imx355->ctrl_handler;
@@ -1101,15 +1094,14 @@ static int imx355_init_controls(struct imx355 *imx355)
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
@@ -1184,12 +1176,14 @@ static int imx355_init_controls(struct imx355 *imx355)
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
@@ -1212,10 +1206,11 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
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
@@ -1286,7 +1281,7 @@ static int imx355_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
 
-	imx355->hwcfg = imx355_get_hwcfg(imx355->dev);
+	imx355->hwcfg = imx355_get_hwcfg(imx355);
 	if (!imx355->hwcfg) {
 		dev_err(imx355->dev, "failed to get hwcfg");
 		ret = -ENODEV;

-- 
2.34.1


