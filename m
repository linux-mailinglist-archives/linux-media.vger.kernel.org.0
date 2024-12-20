Return-Path: <linux-media+bounces-23869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFDC9F9188
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44CE116528C
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CB81C5CB0;
	Fri, 20 Dec 2024 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iDwRsN4U"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63981C07FE
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 11:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695019; cv=none; b=SDFsrqzYSLYU9sLwfWlTNpGB2xAc5XhJZG00vLpp2swT1iv9StBpRpjW6ZHsZ47Ew5XHtB51F6WRZGOs+DWnPGSZFD5H5B5eL/xSDUZULAYgS6Lv0gkE3N6BCzuhrXWUqjH3auFhmT769enwSbMb912AD/OvLEphc0BZMnn+sQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695019; c=relaxed/simple;
	bh=hsPz69MzjmcIoDAhid+LhdCnlCLmEUA0S18ARdxlDA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzAX8Tv4Daj1Rj9ercUUCPn+lZwIv+JdBX/A1hyBfQtOjn0UVEaDPQTIcaNpnbD+7cCDkGszdT/8Uwx5MAOvKDHmxiAIJR+MbaNC95QE27pJTTX+7ncbn2P9rdQxjdJGaCJ0C1xELWVPRI20jHCuoqP8OCBqJcXjG8NFzgWve5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iDwRsN4U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734695016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYsw5oU1PQaf1eTERqYuhMXTCvUl+XagFLUha6auHIw=;
	b=iDwRsN4U7s7m1M7w/ekrrxAjgD3cAukSLIZG+jkco7kSf7phLFJcNBbPmD5KXgRq0ZnYGc
	blRaU1zNTdHs8UhaB/b900CpgNwE+wO24UbbsXV+ksZy0lHtoT0/wJ7O+mCz/+M8l1AJa3
	3psPjRn9D2sbIWKX1w4IIv1HQMCrWRA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-601-KsO67oYcMoGw2sXAfWjT0A-1; Fri,
 20 Dec 2024 06:43:34 -0500
X-MC-Unique: KsO67oYcMoGw2sXAfWjT0A-1
X-Mimecast-MFC-AGG-ID: KsO67oYcMoGw2sXAfWjT0A
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C059E19560AB;
	Fri, 20 Dec 2024 11:43:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 50725195608A;
	Fri, 20 Dec 2024 11:43:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: [PATCH v2 3/4] media: ov2740: Add powerdown GPIO support
Date: Fri, 20 Dec 2024 12:43:16 +0100
Message-ID: <20241220114317.21219-3-hdegoede@redhat.com>
In-Reply-To: <20241220114317.21219-1-hdegoede@redhat.com>
References: <20241220114317.21219-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

The ov2740 sensor has both reset and power_down inputs according to
the datasheet one or the other should always be tied to DOVDD but on
some designs both are attached to GPIOs.

Add support for controlling both a reset and a powerdown GPIO.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index bd7475c337e2..0ee83e2680eb 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -525,6 +525,7 @@ struct ov2740 {
 
 	/* GPIOs, clocks */
 	struct gpio_desc *reset_gpio;
+	struct gpio_desc *powerdown_gpio;
 	struct clk *clk;
 
 	/* Current mode */
@@ -1308,6 +1309,7 @@ static int ov2740_suspend(struct device *dev)
 	struct ov2740 *ov2740 = to_ov2740(sd);
 
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
+	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
 	clk_disable_unprepare(ov2740->clk);
 	return 0;
 }
@@ -1322,6 +1324,7 @@ static int ov2740_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 0);
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
 	msleep(20);
 
@@ -1350,9 +1353,17 @@ static int ov2740_probe(struct i2c_client *client)
 	if (IS_ERR(ov2740->reset_gpio)) {
 		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
 				     "failed to get reset GPIO\n");
-	} else if (ov2740->reset_gpio) {
+	}
+
+	ov2740->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(ov2740->powerdown_gpio)) {
+		return dev_err_probe(dev, PTR_ERR(ov2740->powerdown_gpio),
+				     "failed to get powerdown GPIO\n");
+	}
+
+	if (ov2740->reset_gpio || ov2740->powerdown_gpio) {
 		/*
-		 * Ensure reset is asserted for at least 20 ms before
+		 * Ensure reset/powerdown is asserted for at least 20 ms before
 		 * ov2740_resume() deasserts it.
 		 */
 		msleep(20);
-- 
2.47.1


