Return-Path: <linux-media+bounces-66892-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OhLeOoUzTWoSwgEAu9opvQ
	(envelope-from <linux-media+bounces-66892-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:12:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1799C71E2A4
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:12:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=SbK8NgUQ;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66892-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66892-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13060303032B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C38480DE8;
	Tue,  7 Jul 2026 17:06:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D296466B7D
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443994; cv=none; b=NC/UU+mMc8pGqSUwduUyQNTewkKghdBkxsgGOoELIMl3aLEWYSgO1fifjZ8ei2Hb4ZFMd4+tzUX6maz6H5osbCxACPJIEaQixGag2lcKs/wyYR0tT2y17Pgbkon/EyNPMkSxZpIlUWgWV7Poo5wYCO20C7E7navnYlOfsKFjUxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443994; c=relaxed/simple;
	bh=0fRd2Shb9iwK17T3SXWtZhl1o68cmssCDMlehkQYDLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFJbUvJDkY/V8gH0y72NnSCIC9zeh9GeMlfqDgMCxOdn4n7Gkyylx0MF14ol2OTQF45lRv05S+ab/IjaJnBhZ2SAnD3otI/EXeWLKKTZ224hjM/TvvEXvg8IeFqyBd0yweSJ/hiD+jHT7IxL7HDPwIscJRHkgmx7R7Re8hNJNgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=SbK8NgUQ; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so2744488f8f.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443990; x=1784048790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsL30bF6hI9j0WHskUYBcTkcyemOoQL59FDGPoj0ZcY=;
        b=SbK8NgUQ8RRL9q4Fqdzwl4F98oPTSboX4GcOSqmdlajxl/XyXKi49ytMZzcwkoRLcN
         eY34MbFcHLQBVnyNz0EufLfZk6TLlERYVPJIbs2Nx2awDQld7IY2xVbTNaQleES2qEMp
         9nV0nSklSC2C8Vt6qZXc2NAnsVKR4tS+57SQghUbzVCzFD84pqXP5Xjp3gJe5t53j/DY
         DMpoMLObyqYVYyw+nt3DV+d8PXTk7R9Tvl821Qtk7+HfVHH0ZcagHysckf9KTzGC/dcY
         ACvveV8dnshlUszYYTFOwETxkqPsAMprUGu0gK19oos3RzxSwZXfYWPEYlnZkrUEGSGt
         6twA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443990; x=1784048790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HsL30bF6hI9j0WHskUYBcTkcyemOoQL59FDGPoj0ZcY=;
        b=JGT0py+QTLNW1qdb27zzbeMCCX4eIP3sGUqDtaN/YD1NHHHnBt4AbkpBOhL3lMNLkN
         rl4fOWsT/515uWiNwTIORQ0Npw2NTb7KE5QeQwpzKA8u85iJn+cgE0Abny8ACHljHe7V
         5hylRksA8VI7yyiYEu381OIpSluAhtUT325T5li+tShT3xJbIdAlsXHBSAWm2hdA3+op
         jfLzmmP6Gc/5MyvLBoFZcmwsj6GHCWPCvA8Zo39D/gKbCVjQoTwMJ/jnmDDTNeqb/nOP
         Frc2v9mE6qhAaGW0VEWVAd9UTAxU/jhny2PDfPekpf9sqjS9FSn6cQgYCieX46FQBqf6
         TEzA==
X-Gm-Message-State: AOJu0Ywtqia0FhJ7pq5BeXzcGma/n684xNyI+0hs1Ip1ZgPbf7FNtn+1
	3hsNwe4hgYEFQ5ib/RFdHeV4zwHbbucBzIL+uA4ycA2cTAyzuZ3dMO3nL2Sjc9aCftA=
X-Gm-Gg: AfdE7cntf3bewE8749BvTgyNFtG0k23e6c2wPAiZax+6i3kzEUK41frB/fNlQBAgdqr
	Q4wEcbnzPQFMUMu4utDDftqWCTzN7yblP1lrVFdNWZ5MNj93tv+pjvnF6sks0jzAWo74XvIjQ8n
	ek2Mo+yR9zLKdW63XC1VG9DyqtZv7BNVCpPue+Wfh16ZAsYJDAWzWj4Rktu2FgC2C1BYW3g5V9T
	jKIipnu1AzLIgSEE7sjXE133LZqfhAjcJVZaRVaz8DUnkqSQEAiZtisreotzVAW5ppHni81ALlo
	MP8gHaYLoSJHZVQoWkIO8dF0ezdKZ8V3lwpVx8HHrJ8zlGu3LSce1lQUgx4/p283EFo0DmkOzCN
	mofOcQCia0v7zb5042hJbI/213H2QpDN6V+syfJAB5wr3QvNcVbeK2PC7JF+T1OJYgMsWz57PoF
	ViWHXY0ogUC/KVvi14+geYiGL/tkmY6Zfk6yyZiVKdMTZaMb+M8wWHQlneg21g/IKq
X-Received: by 2002:a5d:588b:0:b0:475:f0c2:75ab with SMTP id ffacd0b85a97d-47de66fac40mr6651149f8f.60.1783443989711;
        Tue, 07 Jul 2026 10:06:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:49 +0100
Subject: [PATCH v2 17/20] media: imx355: Compute link frequency from PLL
 setup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-17-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66892-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1799C71E2A4

In preparation for additional options in the PLL setup, compute
the link frequency rather than using a hardcoded value.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index cff87c6ea789..3586c4cd3fbe 100644
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
 
@@ -238,12 +240,12 @@ static const struct cci_reg_sequence imx355_global_regs[] = {
 	{ CCI_REG8(0x0112), 0x0a },
 	{ CCI_REG8(0x0113), 0x0a },
 	{ CCI_REG8(0x0114), 0x03 },
-	{ CCI_REG8(0x0301), 0x05 },
+	{ IMX355_REG_PLL_IVT_PCK_DIV, IMX355_PLL_IVT_PCK_DIV },
 	{ CCI_REG8(0x0303), 0x01 },
-	{ CCI_REG8(0x0305), 0x00 },
+	{ CCI_REG8(0x0305), 0x02 },
 	{ CCI_REG8(0x0306), 0x78 },
 	{ CCI_REG8(0x0307), 0x02 },
-	{ CCI_REG8(0x030d), 0x02 },
+	{ IMX355_REG_PLL_OP_PREDIV, IMX355_PLL_OP_PREDIV },
 	{ CCI_REG8(0x0310), 0x00 },
 	{ CCI_REG8(0x0220), 0x00 },
 	{ CCI_REG8(0x0222), 0x01 },
@@ -337,14 +339,6 @@ static const char * const imx355_test_pattern_menu[] = {
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
@@ -1080,7 +1074,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 	s64 hblank;
 	u64 pixel_rate;
 	const struct imx355_mode *mode;
-	u32 max;
 	int ret;
 
 	ctrl_hdlr = &imx355->ctrl_handler;
@@ -1089,15 +1082,14 @@ static int imx355_init_controls(struct imx355 *imx355)
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
@@ -1172,12 +1164,14 @@ static int imx355_init_controls(struct imx355 *imx355)
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
@@ -1200,10 +1194,11 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
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
@@ -1275,7 +1270,7 @@ static int imx355_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
 
-	imx355->hwcfg = imx355_get_hwcfg(imx355->dev);
+	imx355->hwcfg = imx355_get_hwcfg(imx355);
 	if (!imx355->hwcfg) {
 		dev_err(imx355->dev, "failed to get hwcfg");
 		ret = -ENODEV;

-- 
2.34.1


