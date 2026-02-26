Return-Path: <linux-media+bounces-53450-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGc2MUUToGlAfgQAu9opvQ
	(envelope-from <linux-media+bounces-53450-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:32:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B21A36DC
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DEDC3155A70
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BA83A1E94;
	Thu, 26 Feb 2026 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="PZWMbPY9"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347C23A4F3A;
	Thu, 26 Feb 2026 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097843; cv=none; b=QG5nwt2Amq98CDjR1PGiPZO5Terj9jlc/ksaeRiyFrehF0lw87FUTh3vhDF6mfIEelfZvmbl54sPuDi/yi/FPhFPninybRpab1PEAFPl7ObTo0rXvVNZyk6YICKf7rfB1xseqbEDnyuyI7/OWnVwsgoMsVR1uFVoof0b40zRmws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097843; c=relaxed/simple;
	bh=PKB20d4HwDvrUtISRR+YsDcUK5D9637SCIK+isWymLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inUb42jkDrEd1eqagz3VWUm1GucjOaseQiYkRsWPa6oVv+CW8ZJv7B+GzaXLHSvpc6TAyIc+Wisz6r0iTML95czNbcWHc8L0owgCJ0y955NhC0g5Dep0C6caceG0Yiye0JoN7PsGpVebX2wHp9IxOrLr5AHEjIEddr2Ivp2Bzag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=PZWMbPY9; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ydV3u3Wp1/+BHYeVS9mosQEp9B2XhD7idHBc3IWnXuQ=; b=PZWMbPY9rJbM2vFq06Lo8o3tb5
	5LzRlnGcZmcFUXZFefJpNUgykbn5+lB//mgVL4uzsAsv0ntsnj/atjqASsA+xXWaItdbXB0r+DuLR
	qT7PCO/ktaynhD8mp6MijQNG2aex2RJxGGDJdFF4Gzf5WCRLuJpVba8HDOsITj5rq+YI=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:64689 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vvXAx-0018Zt-SF; Thu, 26 Feb 2026 09:56:52 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Thu, 26 Feb 2026 09:56:08 +0100
Subject: [PATCH 8/8] media: i2c: ov08d10: add missing newline to prints
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-ov08d10-v1-8-c3a916368123@emfend.at>
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
In-Reply-To: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Fix some spelling errors in comments. Signed-off-by: Matthias
    Fend <matthias.fend@emfend.at> --- drivers/media/i2c/ov08d10.c | 10 +++++-----
    1 file changed, 5 insertions(+), 5 deletions(-) diff --git a/drivers/media/i2c/ov08d10.c
    b/drivers/media/i2c/ov08d10.c index fa8d29a62fbfa956dff6b57ccd6c9b7777967731..f5c187d763c4264056100b904ab9585b25909e95
    100644 --- a/drivers/media/i2c/ov08d10.c [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53450-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.960];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,emfend.at:mid,emfend.at:email]
X-Rspamd-Queue-Id: 283B21A36DC
X-Rspamd-Action: no action

Add trailing \n to dev_* prints where missing.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index f5c187d763c4264056100b904ab9585b25909e95..6eab9a899726aaacdddb12d2861e7b0f8d5e5fd7 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -714,7 +714,7 @@ static int ov08d10_write_reg_list(struct ov08d10 *ov08d10,
 						r_list->regs[i].val);
 		if (ret) {
 			dev_err_ratelimited(ov08d10->dev,
-					    "failed to write reg 0x%2.2x. error = %d",
+					    "failed to write reg 0x%2.2x. error = %d\n",
 					    r_list->regs[i].address, ret);
 			return ret;
 		}
@@ -1075,32 +1075,32 @@ static int ov08d10_start_streaming(struct ov08d10 *ov08d10)
 	/* soft reset */
 	ret = i2c_smbus_write_byte_data(client, OV08D10_REG_PAGE, 0x00);
 	if (ret < 0) {
-		dev_err(ov08d10->dev, "failed to reset sensor");
+		dev_err(ov08d10->dev, "failed to reset sensor\n");
 		return ret;
 	}
 	ret = i2c_smbus_write_byte_data(client, 0x20, 0x0e);
 	if (ret < 0) {
-		dev_err(ov08d10->dev, "failed to reset sensor");
+		dev_err(ov08d10->dev, "failed to reset sensor\n");
 		return ret;
 	}
 	usleep_range(3000, 4000);
 	ret = i2c_smbus_write_byte_data(client, 0x20, 0x0b);
 	if (ret < 0) {
-		dev_err(ov08d10->dev, "failed to reset sensor");
+		dev_err(ov08d10->dev, "failed to reset sensor\n");
 		return ret;
 	}
 
 	/* update sensor setting */
 	ret = ov08d10_write_reg_list(ov08d10, reg_list);
 	if (ret) {
-		dev_err(ov08d10->dev, "failed to set plls");
+		dev_err(ov08d10->dev, "failed to set plls\n");
 		return ret;
 	}
 
 	reg_list = &ov08d10->cur_mode->reg_list;
 	ret = ov08d10_write_reg_list(ov08d10, reg_list);
 	if (ret) {
-		dev_err(ov08d10->dev, "failed to set mode");
+		dev_err(ov08d10->dev, "failed to set mode\n");
 		return ret;
 	}
 
@@ -1127,19 +1127,19 @@ static void ov08d10_stop_streaming(struct ov08d10 *ov08d10)
 
 	ret = i2c_smbus_write_byte_data(client, OV08D10_REG_PAGE, 0x00);
 	if (ret < 0) {
-		dev_err(ov08d10->dev, "failed to stop streaming");
+		dev_err(ov08d10->dev, "failed to stop streaming\n");
 		return;
 	}
 	ret = i2c_smbus_write_byte_data(client, OV08D10_REG_MODE_SELECT,
 					OV08D10_MODE_STANDBY);
 	if (ret < 0) {
-		dev_err(ov08d10->dev, "failed to stop streaming");
+		dev_err(ov08d10->dev, "failed to stop streaming\n");
 		return;
 	}
 
 	ret = i2c_smbus_write_byte_data(client, OV08D10_REG_PAGE, 0x01);
 	if (ret < 0) {
-		dev_err(ov08d10->dev, "failed to stop streaming");
+		dev_err(ov08d10->dev, "failed to stop streaming\n");
 		return;
 	}
 }
@@ -1425,7 +1425,7 @@ static int ov08d10_get_hwcfg(struct ov08d10 *ov08d10)
 
 	/* Get number of data lanes */
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
-		dev_err(dev, "number of CSI2 data lanes %d is not supported",
+		dev_err(dev, "number of CSI2 data lanes %d is not supported\n",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
 		goto check_hwcfg_error;
@@ -1437,7 +1437,7 @@ static int ov08d10_get_hwcfg(struct ov08d10 *ov08d10)
 	ov08d10->modes_size = ov08d10_modes_num(ov08d10);
 
 	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_err(dev, "no link frequencies defined");
+		dev_err(dev, "no link frequencies defined\n");
 		ret = -EINVAL;
 		goto check_hwcfg_error;
 	}
@@ -1450,7 +1450,7 @@ static int ov08d10_get_hwcfg(struct ov08d10 *ov08d10)
 		}
 
 		if (j == bus_cfg.nr_of_link_frequencies) {
-			dev_err(dev, "no link frequency %lld supported",
+			dev_err(dev, "no link frequency %lld supported\n",
 				ov08d10->priv_lane->link_freq_menu[i]);
 			ret = -EINVAL;
 			goto check_hwcfg_error;
@@ -1510,7 +1510,7 @@ static int ov08d10_probe(struct i2c_client *client)
 
 	ret = ov08d10_get_hwcfg(ov08d10);
 	if (ret) {
-		dev_err(ov08d10->dev, "failed to get HW configuration: %d",
+		dev_err(ov08d10->dev, "failed to get HW configuration: %d\n",
 			ret);
 		return ret;
 	}
@@ -1539,7 +1539,7 @@ static int ov08d10_probe(struct i2c_client *client)
 
 	ret = ov08d10_identify_module(ov08d10);
 	if (ret) {
-		dev_err(ov08d10->dev, "failed to find sensor: %d", ret);
+		dev_err(ov08d10->dev, "failed to find sensor: %d\n", ret);
 		goto probe_error_power_off;
 	}
 
@@ -1547,7 +1547,7 @@ static int ov08d10_probe(struct i2c_client *client)
 	ov08d10->cur_mode = &ov08d10->priv_lane->sp_modes[0];
 	ret = ov08d10_init_controls(ov08d10);
 	if (ret) {
-		dev_err(ov08d10->dev, "failed to init controls: %d", ret);
+		dev_err(ov08d10->dev, "failed to init controls: %d\n", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -1557,7 +1557,7 @@ static int ov08d10_probe(struct i2c_client *client)
 	ov08d10->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov08d10->sd.entity, 1, &ov08d10->pad);
 	if (ret) {
-		dev_err(ov08d10->dev, "failed to init entity pads: %d", ret);
+		dev_err(ov08d10->dev, "failed to init entity pads: %d\n", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -1566,7 +1566,7 @@ static int ov08d10_probe(struct i2c_client *client)
 
 	ret = v4l2_async_register_subdev_sensor(&ov08d10->sd);
 	if (ret < 0) {
-		dev_err(ov08d10->dev, "failed to register V4L2 subdev: %d",
+		dev_err(ov08d10->dev, "failed to register V4L2 subdev: %d\n",
 			ret);
 		goto probe_error_media_entity_cleanup;
 	}

-- 
2.34.1


