Return-Path: <linux-media+bounces-23834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D9E9F8428
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 20:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59B0E16956C
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8491AE01D;
	Thu, 19 Dec 2024 19:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WsK7/jj6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588571AAA35
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 19:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734636341; cv=none; b=ncipMX14NqUfz+rJ1CQVt19+AEnqAwaCv+2sUt1k2fPO6oCyNBkG9yN2eCzU3/LUkXpGBoFFf+9ZlJKTr9HnnbrLnIy/g+jlm+TM9fxXb8ygYhdPDNCHxqwrYHaVzNyE/W2JlWT87IbfwZcTNXS0ZeT4PBKjK/ywrsYN2/UG+Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734636341; c=relaxed/simple;
	bh=BuuFXIB96BwO7KjRBZJ8rYamSLqo6IgtHrR5NRYsv8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ut2uH6UOC+91f9JQD9btop+4ICk1ZXI4F1st7BAU5VnuoFb/h5ps0NBdLYKX7nQj0tdpW71miAfRGA0KkwKSnlr5aGbFrnQ/rWw8YK5L7V2Fei97H/4bd+NEqWJJ94vf4B0rBfA6Z6/DvllTZYDgPYxr4Im4xgotwL6YoHoWhWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WsK7/jj6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734636338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/KaG17BUuSDjoAKk8TcUgNaEeMowsMz7g43mdo5rro=;
	b=WsK7/jj6FLAzZ5aUiPp/p62dvayUdu4bHIwRJGrURRYX7O6jhQReaUFH0kHQsJjrz8jlEh
	ksHNiHhYxIElY7bVDranRqdvBzkuir/+XB9A8I37JLjL6M8pJYpFGrwVnYXCpEF16c9Sc1
	IMIelpXmb059lQBFIKbs831yxRwymN4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-577-kODwSFG9Pj6rJMnns0qz1A-1; Thu,
 19 Dec 2024 14:25:33 -0500
X-MC-Unique: kODwSFG9Pj6rJMnns0qz1A-1
X-Mimecast-MFC-AGG-ID: kODwSFG9Pj6rJMnns0qz1A
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE4FE1956089;
	Thu, 19 Dec 2024 19:25:32 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0F3421953953;
	Thu, 19 Dec 2024 19:25:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: ov08x40: Add missing '\n' to ov08x40_check_hwcfg() error messages
Date: Thu, 19 Dec 2024 20:25:26 +0100
Message-ID: <20241219192527.45561-2-hdegoede@redhat.com>
In-Reply-To: <20241219192527.45561-1-hdegoede@redhat.com>
References: <20241219192527.45561-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

A number of dev_err() error messages miss a terminating '\n', add
the missing '\n' to these.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index b6e69e0c2ecf..b2af533bac0a 100644
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


