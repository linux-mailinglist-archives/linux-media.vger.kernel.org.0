Return-Path: <linux-media+bounces-22231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D69DBA71
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F619B22A11
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 15:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19081B982E;
	Thu, 28 Nov 2024 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BBwlR2c0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A94D1BB6A0
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732807442; cv=none; b=r53Q3cqtGwuQvZa20Jjj8zO3RpXDaqYLSmnVk5EO0+e1GdoxqwATss5VmYmIO9a8gXfwZeVDbD4h8aHCH8dJ9l8TmlRMBYcvdr+MGWGRMnveLLpAOZM3Eqyk4rGo2cIdENMQaSgWIXrNbdJoiD0fE7zlZD/7YYAhl8b0NwIcWpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732807442; c=relaxed/simple;
	bh=BoO73raussRA7CNeRG2fXLuf5/3JLbH82UaHoSFRqow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPFgsjsjYlgtSAERCmvvUENbwgf3PCO22GkCH8YH+OD9GgXcbJRF+TrMjX5pwwemy81vJdSdpF3/vPPb+5r5m88qRiLujZ+FKl9r9YwN94wBHEyaImoUVgBNJJjaxw4ns6rJtMe+aCYvgKlV0lX/tAd3FlEYradwEhh/TTwqJh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BBwlR2c0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732807439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnpBELolWXPjgsDU9LMfupQlXW2NYouC49hueeD7KrQ=;
	b=BBwlR2c0vllJ4MX0dvfoXi4VU5Zt4RYNkdZsquiRAtT+W0ejcim1gTwKxiHHNHTZueK2Jz
	crlOxpIdn41ftKTtKmdK1XDzTNWMX4NHwipo9MX/3Zcc2IDhQug0hanh1Rcw+5KmztIp56
	VSi8W7E3+fOuS4Ai4XcRDJmcZv0LhBU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-219-ERAyju75MmCXicA4_GvOzA-1; Thu,
 28 Nov 2024 10:23:55 -0500
X-MC-Unique: ERAyju75MmCXicA4_GvOzA-1
X-Mimecast-MFC-AGG-ID: ERAyju75MmCXicA4_GvOzA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 205F41956058;
	Thu, 28 Nov 2024 15:23:52 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.119])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E69D195608A;
	Thu, 28 Nov 2024 15:23:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 3/4] media: ov2740: Add powerdown GPIO support
Date: Thu, 28 Nov 2024 16:23:37 +0100
Message-ID: <20241128152338.4583-4-hdegoede@redhat.com>
In-Reply-To: <20241128152338.4583-1-hdegoede@redhat.com>
References: <20241128152338.4583-1-hdegoede@redhat.com>
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

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 998e1977978d..14d0a0588cc2 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -525,6 +525,7 @@ struct ov2740 {
 
 	/* GPIOs, clocks */
 	struct gpio_desc *reset_gpio;
+	struct gpio_desc *powerdown_gpio;
 	struct clk *clk;
 
 	/* Current mode */
@@ -1306,6 +1307,7 @@ static int ov2740_suspend(struct device *dev)
 	struct ov2740 *ov2740 = to_ov2740(sd);
 
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
+	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
 	clk_disable_unprepare(ov2740->clk);
 	return 0;
 }
@@ -1320,6 +1322,7 @@ static int ov2740_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 0);
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
 	msleep(20);
 
@@ -1348,9 +1351,17 @@ static int ov2740_probe(struct i2c_client *client)
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
2.47.0


