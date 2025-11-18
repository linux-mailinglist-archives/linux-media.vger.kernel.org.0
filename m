Return-Path: <linux-media+bounces-47277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F8EC69431
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 283CA4F3E42
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3C83563E0;
	Tue, 18 Nov 2025 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lYWtDkNC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036993559FE;
	Tue, 18 Nov 2025 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467435; cv=none; b=GDKTUqfAFfFRXWR3IBkfAGA1N+XvsFSSqRDiX4h4IOTFHAV+K0zkqvnNpunap38Bi/qqqwO9jrtUCOTKtzbAEzUniPoL3e7mlCbO0PhkyfdPC8hEHObVKwXhMq+ErpvYqDx/Wcz8kPAALJQSPTDhqFpYicN6V5msD25BaivYx5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467435; c=relaxed/simple;
	bh=5I/Q+eoXXlRQ1U7SNlP0oIbzqlqzBd4tuW/Mv2fKQTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ut3amI0YFjBIezqalxtQc+SeAjvu2VoCw3Ta58dBLr9piSgjM9DKu1fCsLAlNtT6RNQMSkmvsMXSOgRIIsO0SZuZ8pCxK4KGJkX/BeLwz9IzsBSHb0EstSz8RCWHXwKTF/AmK+05mZzQba8JVscqfaQ/6l4pm1Oyq7i4GL8kKOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lYWtDkNC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A47A20FB;
	Tue, 18 Nov 2025 13:01:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467309;
	bh=5I/Q+eoXXlRQ1U7SNlP0oIbzqlqzBd4tuW/Mv2fKQTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lYWtDkNCokLkPsvF/jj1HjyiyjOt6GSuFRxhB/Jwd8EUMgG7Fo24lV7ff+KGTPI++
	 M798bVVBKaE5gfMZGfYebyeo5BjhWvCdVcsWb3wpBYbOn82h5bQDzfuO0ltZsufclc
	 VWxzT8CkPM8rAW7k5FcRiB86cxN5XRmJB3bTsCuA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:32:58 +0530
Subject: [PATCH v2 05/16] dt-bindings: media: ov5647: Add optional
 regulators
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-5-5e78e7cb7f9b@ideasonboard.com>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=5I/Q+eoXXlRQ1U7SNlP0oIbzqlqzBd4tuW/Mv2fKQTg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGB+FiefbloeJ5UbphHsHoSYZtIudwHouepV1
 NWV4TvONK+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxgfgAKCRBD3pH5JJpx
 RdbiD/0RVtufQztzB3xZaiCd55N4OCEsk5PYfZvq/GbKfh5oo7d6JqSsSt9po8UUIHH0vQ4X1ny
 mZpcjPWW1X6xdA8rzbGPK84s+X/CrhaUz3IFEE/5oU8UgJQQiXLxFhhgBFT2YZfXlK4VvbwlOLU
 8qiNJYWOGeAZm6V26BXXNI1X++gyIR1Jf9ckwnjXEfGPYFRKUYbbl6TMlZtTnUqpt1LnhmXevTz
 Vs1jQQ7vcfsDw5zLoDz0Sw+v/VnDRFYhHSLzZ/QKsQlqJ+mJQTwtbhEMqFYoSo2SM5LYDC4IWNX
 G9A3rrmhrOk1Yf2Qgd8rl0hjqLTp2AdOypDT8ldtqpT1+jyfYMA12MLp9c39hbbV9MkpR0KKb1G
 5pnIym68tQI/MPopQFmpIyFXZiqQ0uEBWcEOEeJW6CPdVyPzHdy6hZaCpmz27TVuBllkH6Z8DyD
 N8ggMujpDHkhQXd4ToiExt8rO7mGY1xHBdfytbTy3FzoEyvtbvIiSmkvH+pPYDNinCQnx3wFjnP
 /7n14TG7N7bUd7j5QT4TdOOZmjZk4SXBHH+cyAxkxH5zPkBgcBIz+oVc6QtUFwE63mwikoNxdB5
 iAx3EzEYjcCRx+/ZVBesyXo3K2ImG4YL6ngGYSjRmVEUHacZ4IxbOX2oUOFz17NlmHRUci2LVdw
 qdHB9X1N6CJkw5Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The OV5647 camera sensor takes 3 voltage supplies. So define those in
the bindings as optional regulators, to not break existing users.

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
2.51.1


