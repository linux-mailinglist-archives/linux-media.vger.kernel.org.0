Return-Path: <linux-media+bounces-23938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 464419F94B3
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A594E16A78F
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EEB218AA8;
	Fri, 20 Dec 2024 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HbZbJ9Fa"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A2B21885F
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705726; cv=none; b=TYKevH6hUeSE8PbkH+4+kDzMXFv+hKNKrpc5B1y+V5/ZjST6XBSFKH6iFl8b33fkCEElVhgWrITMEAX/1Gi4w9h9Qi+sYJL9BtqaCnMHAf9bROYcFCJ9r7Mz6NT+Jqm0HCav9zgYhBsaygDKRFustkQz/PJ/LbYEZoaqrGw+NTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705726; c=relaxed/simple;
	bh=wLOkJd4R7+1SKUDUR0U5ABL5bDe4gnxLtsTkYNWdU30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FTrnGZgMZ4BQIL9/TYoZW3Ywqo9DZ86RKKtSsf9vIp5JzJUjepclkxOBGV4OxII4TDbE/ypcHrMj8ZEPeMz7qOBwtt0Mlj/r4h4XybSiqRJqSSEAWZ7nbWJx/+014gbsO7Fdz/I/uQN+jjVJYO0q9SYyou2D07t5ludlUFTNGTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HbZbJ9Fa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734705724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bkvQTbRa8pWhTHpELJKs1/AvJz910487S2ItXLxGCzQ=;
	b=HbZbJ9FaZJQWaqc+Ybn8s5naCgHi273K/OZ2+KawbuF3WBfdXeyMZK/81NAcNqkpv5/pE4
	ZgTPmD5kS2ypAM9yoc0G/niVO/JWvYFZ0S9g2jSEzBAxhsGJSefA2NFgbbTlHE3se0QX0+
	L3bUTrsHzMC1GYDOxN839/yMa/7RQSI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-kWsIAN8BPmi4o9yY5Mjaxg-1; Fri,
 20 Dec 2024 09:42:02 -0500
X-MC-Unique: kWsIAN8BPmi4o9yY5Mjaxg-1
X-Mimecast-MFC-AGG-ID: kWsIAN8BPmi4o9yY5Mjaxg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25DBE195609D;
	Fri, 20 Dec 2024 14:42:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4D9BD19560AD;
	Fri, 20 Dec 2024 14:41:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 09/10] media: ov08x40: Add missing '\n' to ov08x40_check_hwcfg() error messages
Date: Fri, 20 Dec 2024 15:41:29 +0100
Message-ID: <20241220144130.66765-10-hdegoede@redhat.com>
In-Reply-To: <20241220144130.66765-1-hdegoede@redhat.com>
References: <20241220144130.66765-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

A number of dev_err() error messages miss a terminating '\n', add
the missing '\n' to these.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 7d00740222c1..e7012ee84822 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2194,27 +2194,27 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
 					       &xvclk_rate);
 		if (ret) {
-			dev_err(dev, "can't get clock frequency");
+			dev_err(dev, "can't get clock frequency\n");
 			goto out_err;
 		}
 	}
 
 	if (xvclk_rate != OV08X40_XVCLK) {
-		dev_err(dev, "external clock %d is not supported",
+		dev_err(dev, "external clock %d is not supported\n",
 			xvclk_rate);
 		ret = -EINVAL;
 		goto out_err;
 	}
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV08X40_DATA_LANES) {
-		dev_err(dev, "number of CSI2 data lanes %d is not supported",
+		dev_err(dev, "number of CSI2 data lanes %d is not supported\n",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
 		goto out_err;
 	}
 
 	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_err(dev, "no link frequencies defined");
+		dev_err(dev, "no link frequencies defined\n");
 		ret = -EINVAL;
 		goto out_err;
 	}
@@ -2227,7 +2227,7 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 		}
 
 		if (j == bus_cfg.nr_of_link_frequencies) {
-			dev_err(dev, "no link frequency %lld supported",
+			dev_err(dev, "no link frequency %lld supported\n",
 				link_freq_menu_items[i]);
 			ret = -EINVAL;
 			goto out_err;
@@ -2252,7 +2252,7 @@ static int ov08x40_probe(struct i2c_client *client)
 	/* Check HW config */
 	ret = ov08x40_check_hwcfg(ov08x, &client->dev);
 	if (ret) {
-		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
+		dev_err(&client->dev, "failed to check hwcfg: %d\n", ret);
 		return ret;
 	}
 
-- 
2.47.1


