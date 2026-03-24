Return-Path: <linux-media+bounces-56855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHiXJjxrwmlScwQAu9opvQ
	(envelope-from <linux-media+bounces-56855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:45:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB6C306A4E
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 108833054231
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47FE3EF647;
	Tue, 24 Mar 2026 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="OQ+C2YrH"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6203ED105;
	Tue, 24 Mar 2026 10:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348933; cv=none; b=BQf09XCaszqBC9sc8fCkYA+UrRyKKcBt/rpMcbXUq2wLouUcDUFMz2OPV4/duNR2DpQdVDvjdYq5HBmkQUuj7FxEwGE/lf5KPWslDXGyRYvQVr0VHZs57U3hQrXBxey0i8t4gV9hWt3fuk+QoAMUB5BiTXZOEybBcTFxemKiKK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348933; c=relaxed/simple;
	bh=kDhXWNpU+Z3cNQziKC4jCvZunHLIPJUxSnZ3f1xr1EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FddteJyh/EH01LXT9U9Rwk5DLXZGcARqH8xnrY0vkNQXTlLC9AeCuDYJ06mhpmUJ25PVPuTBjeAjok6QuMjaKb+re8t81AJFcklFSwvPngQW82rkOBi4XykOzxiHw+jcHzNbBkujaYx1WnAUg3Bib83FAkHMmA9Eyt5OO2yJTl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=OQ+C2YrH; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SmfjdOOxN9oFPnKzL3556jZBgVQoOTG2EB4JaGgvhrA=; b=OQ+C2YrH9fGtOKtwpTfZ7m3t8c
	LrkfxmRIQVRqSTIwHh4HI8YylKynxvVXuprR4rR4G9y9cY/Y0rUDtR/vRSNDnZ4pTYsTfBGNJ6cBY
	5KE2jpOSbComJ6J47q65K38qkIooRgafRvi+j59PtLeFvlNfMsx97pjbQW3MyiztdHr0=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:55336 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1w4zD6-00DIvK-6n; Tue, 24 Mar 2026 11:42:08 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Tue, 24 Mar 2026 11:41:43 +0100
Subject: [PATCH v3 9/9] media: i2c: ov08d10: add support for 24 MHz input
 clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-ov08d10-v3-9-1e44069cf91e@emfend.at>
References: <20260324-ov08d10-v3-0-1e44069cf91e@emfend.at>
In-Reply-To: <20260324-ov08d10-v3-0-1e44069cf91e@emfend.at>
To: Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Add support for the required power supplies as well as the
    control of an optional sensor reset. Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
    --- drivers/media/i2c/ov08d10.c | 93 ++++++++++++++++++++++++++++++++++++++++++++-
    1 file changed, 92 insertions(+), 1 deletion(-) 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56855-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[emfend.at:email,emfend.at:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4BB6C306A4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The sensor supports an input clock in the range of 6 to 27 MHz. Currently,
the driver only supports a 19.2 MHz clock. Extend the driver so that at
least 24 MHz, which is a typical frequency for this sensor, can also be
used.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 80 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 64 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 19035991e8bb164d4fca5d87ee4551191974e8bb..9adef5446a61f3204fb809ca3f077c1afb5f7a47 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -14,7 +14,6 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV08D10_SCLK			144000000ULL
-#define OV08D10_XVCLK_19_2		19200000
 #define OV08D10_ROWCLK			36000
 #define OV08D10_DATA_LANES		2
 #define OV08D10_RGB_DEPTH		10
@@ -78,8 +77,13 @@ struct ov08d10_reg_list {
 	const struct ov08d10_reg *regs;
 };
 
+static const u32 ov08d10_xvclk_freqs[] = {
+	19200000,
+	24000000
+};
+
 struct ov08d10_link_freq_config {
-	const struct ov08d10_reg_list reg_list;
+	const struct ov08d10_reg_list reg_list[ARRAY_SIZE(ov08d10_xvclk_freqs)];
 };
 
 struct ov08d10_mode {
@@ -108,8 +112,8 @@ struct ov08d10_mode {
 	u8 data_lanes;
 };
 
-/* 3280x2460, 3264x2448 need 720Mbps/lane, 2 lanes */
-static const struct ov08d10_reg mipi_data_rate_720mbps[] = {
+/* 3280x2460, 3264x2448 need 720Mbps/lane, 2 lanes - 19.2 MHz */
+static const struct ov08d10_reg mipi_data_rate_720mbps_19_2[] = {
 	{0xfd, 0x00},
 	{0x11, 0x2a},
 	{0x14, 0x43},
@@ -119,8 +123,8 @@ static const struct ov08d10_reg mipi_data_rate_720mbps[] = {
 	{0xb7, 0x02}
 };
 
-/* 1632x1224 needs 360Mbps/lane, 2 lanes */
-static const struct ov08d10_reg mipi_data_rate_360mbps[] = {
+/* 1632x1224 needs 360Mbps/lane, 2 lanes - 19.2 MHz */
+static const struct ov08d10_reg mipi_data_rate_360mbps_19_2[] = {
 	{0xfd, 0x00},
 	{0x1a, 0x04},
 	{0x1b, 0xe1},
@@ -132,6 +136,30 @@ static const struct ov08d10_reg mipi_data_rate_360mbps[] = {
 	{0xb7, 0x02}
 };
 
+/* 3280x2460, 3264x2448 need 720Mbps/lane, 2 lanes - 24 MHz */
+static const struct ov08d10_reg mipi_data_rate_720mbps_24_0[] = {
+	{0xfd, 0x00},
+	{0x11, 0x2a},
+	{0x14, 0x43},
+	{0x1a, 0x04},
+	{0x1b, 0xb4},
+	{0x1e, 0x13},
+	{0xb7, 0x02}
+};
+
+/* 1632x1224 needs 360Mbps/lane, 2 lanes - 24 MHz */
+static const struct ov08d10_reg mipi_data_rate_360mbps_24_0[] = {
+	{0xfd, 0x00},
+	{0x1a, 0x04},
+	{0x1b, 0xb4},
+	{0x1d, 0x00},
+	{0x1c, 0x19},
+	{0x11, 0x2a},
+	{0x14, 0x54},
+	{0x1e, 0x13},
+	{0xb7, 0x02}
+};
+
 static const struct ov08d10_reg lane_2_mode_3280x2460[] = {
 	/* 3280x2460 resolution */
 	{0xfd, 0x01},
@@ -525,6 +553,7 @@ struct ov08d10 {
 	struct clk *clk;
 	struct reset_control *reset;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(ov08d10_supply_names)];
+	u8 xvclk_index;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -565,17 +594,29 @@ static const struct ov08d10_lane_cfg lane_cfg_2 = {
 	},
 	{{
 		.reg_list = {
+		{
 			.num_of_regs =
-				ARRAY_SIZE(mipi_data_rate_720mbps),
-			.regs = mipi_data_rate_720mbps,
-		}
+				ARRAY_SIZE(mipi_data_rate_720mbps_19_2),
+			.regs = mipi_data_rate_720mbps_19_2,
+		},
+		{
+			.num_of_regs =
+				ARRAY_SIZE(mipi_data_rate_720mbps_24_0),
+			.regs = mipi_data_rate_720mbps_24_0,
+		}}
 	},
 	{
 		.reg_list = {
+		{
 			.num_of_regs =
-				ARRAY_SIZE(mipi_data_rate_360mbps),
-			.regs = mipi_data_rate_360mbps,
-		}
+				ARRAY_SIZE(mipi_data_rate_360mbps_19_2),
+			.regs = mipi_data_rate_360mbps_19_2,
+		},
+		{
+			.num_of_regs =
+				ARRAY_SIZE(mipi_data_rate_360mbps_24_0),
+			.regs = mipi_data_rate_360mbps_24_0,
+		}}
 	}},
 	{{
 		.width = 3280,
@@ -1028,7 +1069,8 @@ static int ov08d10_start_streaming(struct ov08d10 *ov08d10)
 
 	link_freq_index = ov08d10->cur_mode->link_freq_index;
 	reg_list =
-	    &ov08d10->priv_lane->link_freq_configs[link_freq_index].reg_list;
+		&ov08d10->priv_lane->link_freq_configs[link_freq_index]
+			 .reg_list[ov08d10->xvclk_index];
 
 	/* soft reset */
 	ret = i2c_smbus_write_byte_data(client, OV08D10_REG_PAGE, 0x00);
@@ -1456,9 +1498,15 @@ static int ov08d10_probe(struct i2c_client *client)
 				     "failed to get clock\n");
 
 	freq = clk_get_rate(ov08d10->clk);
-	if (freq != OV08D10_XVCLK_19_2)
-		dev_warn(ov08d10->dev,
-			 "external clock rate %lu is not supported\n", freq);
+	for (i = 0; i < ARRAY_SIZE(ov08d10_xvclk_freqs); i++) {
+		if (freq == ov08d10_xvclk_freqs[i])
+			break;
+	}
+	if (i >= ARRAY_SIZE(ov08d10_xvclk_freqs))
+		return dev_err_probe(ov08d10->dev, -EINVAL,
+				     "external clock rate %lu is not supported\n",
+				     freq);
+	ov08d10->xvclk_index = i;
 
 	ret = ov08d10_get_hwcfg(ov08d10);
 	if (ret) {

-- 
2.34.1


