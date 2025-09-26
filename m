Return-Path: <linux-media+bounces-43254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07364BA3C8A
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 15:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 438681C0321A
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 13:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBDB2FB97D;
	Fri, 26 Sep 2025 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ek5B5R6n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC942F6164
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892296; cv=none; b=EmchoDsek+2s+QhnBEpy1XD8pMi+r2YlR9Gv+HLZcA2h3bAF/NKOSwFpN0mE8FetvG6SyujI2jVx3t6lIlMgT7BnJgOd62i07J3KdI2SfY8HUn7ffS+3XL+t3BH1xbdtpP3WN1n2WARBPWefG3hn/s/G+yTG+XalaSg0EPfQb34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892296; c=relaxed/simple;
	bh=80G8sSF8+f0UAG0XdkLdvNrCi6HOOZflBRDxb6bYpC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqHMMWJItG20isBgBIR4NGcT/ACaWGplBpbtaub2DPGc6RNUHWyyiuXiYoZkjlQLRVU9A5rmZeqwBhcqO0M8bZLfXg5+8FphFbEoogTo7Tpc0Y0lke7G6yirCAopKUf44qLCYu85ENQAPq4m35env1CALW9tsTk8bNgPpGBvBYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ek5B5R6n; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57933d3e498so2476220e87.3
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 06:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892292; x=1759497092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO+ZRHeTAK51LRbge1abR5CWq6P2opiI+XHVYGi/IpE=;
        b=Ek5B5R6n55TSnFKW0GuBypFweQw8X4sOVkixEjA4uyqhsvIn6ccW6DzZmT/t1ZxIpq
         KV4V0Le5Yd95VxYU1TIFCUhpW5v7iogHPO1YvW182Iee7j/QfExD7vmseSG/CWTsRX+7
         g6EV2uP4aswmFDEfn316QTgEvYGOIMVCsu7bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892292; x=1759497092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LO+ZRHeTAK51LRbge1abR5CWq6P2opiI+XHVYGi/IpE=;
        b=jtVcjujRY0cqUidwQ/5BrNgVyHg1/jX5SMxWNVrSxaipiD/DM4NT/+HZqTBuNVAf/O
         BqYcGMk77uJFv/Y3OfQvcydJHzqAWK4pRQMHQS7w+cEdDNVJvItI04leBnfl01UesfMI
         zx0mIWcyMXiDq389iCRnfdy0QXggnV5qUNSK1bXVD1rWNLE/yMyEfRYlgVrdrKezxcBM
         hMLFFYnHrCFL48WuonP5bWc8NhwM4LZN/3e2iwcns7sMl0wDGqBkndcmfndPjF6HcRBm
         O+v8b2H3HWcOKRqbYVGMvbBydHL/orrJRsKq1Pjc2h/PyCTrx1meFp+be7CqmUw0THMf
         TjSg==
X-Gm-Message-State: AOJu0Yyt/MwrAqXvL7YZpxx5FNbebYQZYI5o/rxYCPuaiy/rtXUbh1dJ
	2CYG/AlKvSlJBtqyfdNWQcZ/CAZkCJARBNp/H1HtHZnCWtp8CK48XyCulxP9WxxzNw==
X-Gm-Gg: ASbGncsqvvbgkrvIIrOf7nQk71iWEQgJKLDBXnLl9kqzXyxNKvCejNnoaSZkmpQZ2T/
	+w80VlGJF1KLqWgXeqS+GamVZR00aGmNWSQKHSqUOS7X4kOCmliisCbVIAaWv6R7ta2cSnrgV55
	933keQ9mrtmfG9065kA+UrgM/xsinPBzFj1SpTa5xm9NyQCzL2hm2YiJJAL4OiSgPeovR7yacMn
	hCnvvVB7qCkmlkKO0JpRNpguXLROPHX4iKlh17PWTFUE3av98WEOlh03GRYMVj2eBCQiCF8NF0X
	RWtrQXsnnw+SKdFSri9Ub+uxVVTcetLZ4r/1Yr1YETs5405vfOPtfb5jeHi2Vf4KOvcTmGKhEKV
	fl0Y0BL0pqi03D7NImgSspGerNipw3XX+L6O24prhtEr6P8N9aK/rite3YtO0o7w8eTRwOPJwaL
	aL2w==
X-Google-Smtp-Source: AGHT+IEKOz9hLF8FHkWrsyP0/Z6mTRW5uekYu6y0CaJ96qJRiudQJlAsNVVlhQMiizZElwgvlCzXEQ==
X-Received: by 2002:a05:6512:b12:b0:57a:310:66a8 with SMTP id 2adb3069b0e04-582d35df2d7mr2404401e87.55.1758892291516;
        Fri, 26 Sep 2025 06:11:31 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:27 +0000
Subject: [PATCH v3 03/12] media: v4l: fwnode: Support ACPI's _PLD for
 v4l2_fwnode_device_parse
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-3-6dc2fa5b4220@chromium.org>
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
In-Reply-To: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
To: Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Currently v4l2_fwnode_device_parse() obtains the orientation and
rotation via fwnode properties.

Extend the function to support as well ACPI devices with _PLD info.

We give a higher priority to fwnode, because it might contain quirks
injected via swnodes.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 84 ++++++++++++++++++++++++++++++++---
 1 file changed, 78 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..4110f64d3277e652473f991fb58d191862f98eb0 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -15,6 +15,7 @@
  * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
  */
 #include <linux/acpi.h>
+#include <acpi/acpi_bus.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -807,16 +808,69 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
 
-int v4l2_fwnode_device_parse(struct device *dev,
-			     struct v4l2_fwnode_device_properties *props)
+static int v4l2_fwnode_device_parse_acpi(struct device *dev,
+					 struct v4l2_fwnode_device_properties *props)
+{
+	struct acpi_pld_info *pld;
+	int ret = 0;
+
+	if (!is_acpi_device_node(dev_fwnode(dev)))
+		return 0;
+
+	if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
+		acpi_handle_debug(ACPI_HANDLE(dev), "cannot obtain _PLD\n");
+		return 0;
+	}
+
+	if (props->orientation == V4L2_FWNODE_PROPERTY_UNSET) {
+		switch (pld->panel) {
+		case ACPI_PLD_PANEL_FRONT:
+			props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
+			break;
+		case ACPI_PLD_PANEL_BACK:
+			props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
+			break;
+		case ACPI_PLD_PANEL_TOP:
+		case ACPI_PLD_PANEL_LEFT:
+		case ACPI_PLD_PANEL_RIGHT:
+		case ACPI_PLD_PANEL_UNKNOWN:
+			props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
+			break;
+		default:
+			acpi_handle_warn(ACPI_HANDLE(dev),
+					 "invalid panel %u in _PLD\n",
+					 pld->panel);
+			ret = -EINVAL;
+			goto done;
+		}
+	}
+
+	if (props->rotation == V4L2_FWNODE_PROPERTY_UNSET) {
+		switch (pld->rotation) {
+		case 0 ... 7:
+			props->rotation = pld->rotation * 45;
+			break;
+		default:
+			acpi_handle_warn(ACPI_HANDLE(dev),
+					 "invalid rotation %u in _PLD\n",
+					 pld->rotation);
+			ret = -EINVAL;
+			goto done;
+		}
+	}
+
+done:
+	ACPI_FREE(pld);
+	return ret;
+}
+
+static int v4l2_fwnode_device_parse_of(struct device *dev,
+				       struct v4l2_fwnode_device_properties *props)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	u32 val;
 	int ret;
 
-	memset(props, 0, sizeof(*props));
-
-	props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
 	ret = fwnode_property_read_u32(fwnode, "orientation", &val);
 	if (!ret) {
 		switch (val) {
@@ -833,7 +887,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
 		dev_dbg(dev, "device orientation: %u\n", val);
 	}
 
-	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
 	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
 	if (!ret) {
 		if (val >= 360) {
@@ -847,6 +900,25 @@ int v4l2_fwnode_device_parse(struct device *dev,
 
 	return 0;
 }
+
+int v4l2_fwnode_device_parse(struct device *dev,
+			     struct v4l2_fwnode_device_properties *props)
+{
+	int ret;
+
+	memset(props, 0, sizeof(*props));
+
+	props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
+	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
+
+	/* Start by looking into swnodes and DT. */
+	ret = v4l2_fwnode_device_parse_of(dev, props);
+	if (ret)
+		return ret;
+
+	/* Let's check the ACPI table. */
+	return v4l2_fwnode_device_parse_acpi(dev, props);
+}
 EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
 
 /*

-- 
2.51.0.536.g15c5d4f767-goog


