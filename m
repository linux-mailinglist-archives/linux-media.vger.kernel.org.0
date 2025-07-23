Return-Path: <linux-media+bounces-38234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA25B0EDE5
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 10:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 131E9965E86
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 08:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C616283CB8;
	Wed, 23 Jul 2025 08:58:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BDB28032F
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261115; cv=none; b=d+0IobfOUZZdiO6YLQYKLWhZrc1pg9/Vb4f7TGNOmm7KRrNhqwLT3P0uNr+Mf3oMz+feJSdtxroij6GdAAeaE0HwNt/oG8py/qfLqrGKLPNMrC+RJQ62i+YJIfhHsWToArHRcTzif4dJYfwFEc6+BUY7Y7RPk1rF+Rb0eKVOTYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261115; c=relaxed/simple;
	bh=mWeU+1DOAnqTfJUWnya4OXPc3E5CUg3Td3dpwglJP7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kt78AZ/0m2OS35rcxDkPzdaLPNqAZFftMXyx0P70XHMnxSHM/LI8iII4ayKLM0WsdGFRt0EqBCwJsMOfghDjp4Aa3RqJC9Z/ZdXuFMo4+9pCM/OiQAiG6rsdfjx3o62OibZiCOFtyeUyqY1anjwYDlzO0aEAihKg5SzCA7fOHIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pfitzner@pengutronix.de>)
	id 1ueVJ0-0004xI-JX; Wed, 23 Jul 2025 10:58:30 +0200
From: Fabian Pfitzner <f.pfitzner@pengutronix.de>
Date: Wed, 23 Jul 2025 10:58:30 +0200
Subject: [PATCH 2/2] media: v4l: fwnode: parse horizontal/vertical flip
 properties
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-fpf-media-dt-flip-v1-2-75b3a938b4be@pengutronix.de>
References: <20250718-fpf-media-dt-flip-v1-0-75b3a938b4be@pengutronix.de>
In-Reply-To: <20250718-fpf-media-dt-flip-v1-0-75b3a938b4be@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, entwicklung@pengutronix.de, 
 Fabian Pfitzner <f.pfitzner@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: f.pfitzner@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

There are cameras containing a mirror on their optical path e. g. when
mounted upside down.

Introduce two options to change the device's flip property via device tree.

As there is already support for the panel-common driver [1], add it for cameras as well.

[1] commit 3c0ecd83eee9 ("dt-bindings: display: panel: Move flip properties to panel-common")

Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 3 +++
 include/media/v4l2-fwnode.h           | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index cb153ce42c45d..7fd0936fbda80 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -845,6 +845,9 @@ int v4l2_fwnode_device_parse(struct device *dev,
 		dev_dbg(dev, "device rotation: %u\n", val);
 	}
 
+	props->hflip = fwnode_property_read_bool(fwnode, "flip-horizontal");
+	props->vflip = fwnode_property_read_bool(fwnode, "flip-vertical");
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index f7c57c7765898..f8a51ab8317ae 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -75,10 +75,14 @@ enum v4l2_fwnode_orientation {
  * struct v4l2_fwnode_device_properties - fwnode device properties
  * @orientation: device orientation. See &enum v4l2_fwnode_orientation
  * @rotation: device rotation
+ * @hflip: device horizontal flip
+ * @vflip: device vertical flip
  */
 struct v4l2_fwnode_device_properties {
 	enum v4l2_fwnode_orientation orientation;
 	unsigned int rotation;
+	bool hflip;
+	bool vflip;
 };
 
 /**

-- 
2.39.5


