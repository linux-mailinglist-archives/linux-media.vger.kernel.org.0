Return-Path: <linux-media+bounces-49292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B683CD4F2A
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31D06300DFC4
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1783E30C368;
	Mon, 22 Dec 2025 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZYnqCgET"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBFF25F96B;
	Mon, 22 Dec 2025 08:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391394; cv=none; b=qXdXMVz/bN48q3hXDb8BJYAU7sFQWIsKijnnTQqffAkX1ZvnjqrTicBGWmKfOchHIZUECBrQpT7twLSWJQHLcqOZmaA4GYfhHSysOex08kxR6gRLjU4ClwgvBv1xRH0lA9iXr1rjm2Bzue7SIY1YODLXAolrqaoz09ufsGC3vJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391394; c=relaxed/simple;
	bh=Pl/hH+BNqw39kKJVWn7FBhDR2ywqsJ/MxZlWpkgdix0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=leDpVRv/aHpFPaSJ+e+MsXDGFQC7mNi/vAGFPhYDQApGQ6H5EG99joOy9VursS9knISqhJCwuwoYcjpgs1yElTr9vqnEkuSeQPbpApzXmu2swMzajY7geP0hSVbwW7TAk3F/kssYH0e9H05VTZnBFRlJuhbyXlEa1SWOF6teS0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZYnqCgET; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55A6D593;
	Mon, 22 Dec 2025 09:16:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391380;
	bh=Pl/hH+BNqw39kKJVWn7FBhDR2ywqsJ/MxZlWpkgdix0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZYnqCgETfFv4Jehan9LBzv4VVBsK4VmQsC1m7jpv23dfvZh+V9nMVO0O//T8wiBks
	 ETRU9AKkzJ59UziijBg+gV3JbleWpXSsQjz5SbGq2xoJGqjHAXs1OrKJwPAB1XRua1
	 5u8F0Lw6KuGmRk4uJVtbHwWc74pymCN4EHPldu6I=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:30 +0530
Subject: [PATCH v4 06/17] dt-bindings: media: ov5647: Add optional
 regulators
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-6-b949c7309280@ideasonboard.com>
References: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
In-Reply-To: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Pl/hH+BNqw39kKJVWn7FBhDR2ywqsJ/MxZlWpkgdix0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4mqZQCTRu2ai/Y5nVDxe4SQpN2b9YmI0jfj
 01kYcVCbkWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+JgAKCRBD3pH5JJpx
 Ra2SEADWJAp2ShgFnl2xKoDbbsTr/0A9yyDsccqHpJmGZN0CXjKXSwdEfA9qwvcvfh49ncrFHzU
 c0uUa4IlJIZDrdhqILtzyOcr1EcG8pSksQ3PDPCZp6lGritGiQIRAteT6SLsZZLzX4V/aAlox6X
 g/ul0+8lgMU/D9LkvwiCs7ZRhCotcK+fNn0jh5823XZSaOAJV63Opqg+9LHT4XbT0vAI8Go7sQi
 6wAqGXxRukdHzouZt5Dh4ck9CdkuO117R9MzBJ2kYkhklSI8W9OhT4NQgcze6PgOUrLPSHiKxwZ
 zTPD6dU07qpC16U/9utG0/Ar3mmjwXXhL3okj6r29LDE0BhQ5TUbWypZi2TcT5/WXK+SFCkIooi
 3vrMqsOuV51mNP0Pc00fz/JlsL/u30Mi4uiTac9SOqmoHrRFyXMV/BuS/qJuy4xHW6SvYGN8cxs
 8qqBZL732hjTkkSD0v2mrBV9jGkWxN8VPy2n7jqw51TJLJjaC/7sduC2VOsOrrM16Mm1wScNFQy
 RfsdltSMas/EmjU7/UgcZvGi6VuTMR6vrEqyBM7Lktf0C+NkVtFgh3qNNVR9ciCsU/+LTZeJD3Y
 2qhep5ErSRMSt+EzfRXpheIWtlUZ3tKHtvTuTbfN7d78x6DkT/+qw84x5YZ7aafRDlkdnx2utCX
 xW/I2vrbCISCbbQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The OV5647 camera sensor takes 3 voltage supplies. So define those in
the bindings as optional regulators, to not break existing users.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
index a2abed06a099b41c7b165c0650e3967ec43a4962..9d3f7f1789cdedb357dae2e18b03c5af3c0e68e3 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
@@ -30,6 +30,15 @@ properties:
     description: Reference to the GPIO connected to the pwdn pin. Active high.
     maxItems: 1
 
+  avdd-supply:
+    description: Analog voltage supply, 2.8 volts
+
+  dvdd-supply:
+    description: Digital core voltage supply, 1.5 volts
+
+  dovdd-supply:
+    description: Digital I/O voltage supply, 1.7 - 3.0 volts
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false

-- 
2.52.0


