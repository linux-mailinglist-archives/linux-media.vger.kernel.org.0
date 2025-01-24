Return-Path: <linux-media+bounces-25285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C9EA1B8FE
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 384EA18910AD
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E342236FC;
	Fri, 24 Jan 2025 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LK5SgA+6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7F622332D;
	Fri, 24 Jan 2025 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731926; cv=none; b=ZwFbpIBBT4vA5eQj3EbAkjclIfYg+VM/i6RKGiNrAcv+Tw+vgQpnhjsOwzn9znoIBdytpUOd46a73pinUH96QZyfutYhXvAfUxQOQpAYtZxsLGFzgRibk+Gdd4TdTKSO2jseLFOCsJYEM239fcf5mJlDZPMM//WiOhCuN4Sucw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731926; c=relaxed/simple;
	bh=g11XBTvWzgcPzaKggR5W/Zb8FhNx48Tg1iTCBkSNWZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FfnXP7gwUWTkcvcqy6Ph++g/uDUk8xZZWEY3O4jI2X2VP3OmXsG+68QyURpPUjNOXbOJ4/Kkod1MM2aRRxC/HHu1dnt7ZEIuQVItFc06r9LPeYPw4daDalhE03s4EjOkkqY+nonIOxvJJZKqHkNMigvpUgNaA9r3H2QIxM5NLfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LK5SgA+6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1FD71B98;
	Fri, 24 Jan 2025 16:17:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731838;
	bh=g11XBTvWzgcPzaKggR5W/Zb8FhNx48Tg1iTCBkSNWZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LK5SgA+6PqOk7sWANC2ZFWRxxKGGP7Jyjhcnhzrf9yJb2mWhAj1U9NNLkvAe3Neye
	 M4uePR6dfjNvjCiMtent3SZd+GIY/hRavhNqaV4mYWVPm7R9IygiKxWw2cOSQzoy22
	 u1ML2xD8d0JWyymS4edc4YDmc53RcitrrNYaAjO0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:54 +0200
Subject: [PATCH v2 17/22] media: dt-bindings: ti,ds90ub960: Add
 ti,enable-sscg property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-17-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=VoDm6aq0ZESFm7Xvi+d0xoD9+qfwfSUo9NPo6S4QUmQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68xwGE00koy8RwFz3Kw1BSvdGWR0PJ9H1YTn
 kZr7/LSsDaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvMQAKCRD6PaqMvJYe
 9SQeEACaRFo3cGqaHESglj4d9MtRtSUVNlAXagRTdYGOAsaiMWDuO00t4II8CMUzz4ywqnC32Qe
 SinMSuSMWAm8qiwq90yDAvYWJaaOLQlDh8Nb7lUTb4pLZ3cqJbs45MJrwZl4zgxHSsPyfL5m0ij
 5VzpMkLE1tGVe0nQM0b8MpALZQ4fHMbAGpEAVGO8uCIoYcWdo0rmc86NoMnDczPT6vXjPYniv74
 aNY+Fir2JAW7YBdi0E8BsnFCvJLzFyUV1/RWwSXHvK/hbF62OGEeVSgRrrOO9h/GNW51Ep2Vl0O
 7n+tXZUZcrqR3t+2VzwEXMOjvJQZgmELjO6onkGZSU4t9McAmoCzYen4lBoxzm3RUtUqCCzjUmo
 +QhdBtByITJDWQFCk64BaIyC1WZhYulpmWCnBIWQxeKRmCSup6XcRmWpz3IiBrAfCRX56HKRG7B
 ah+sNN2J6WBk9RwCkkykNhLgJzoVP+jDf3bRVqIR9GPeRPP63P4QMHhrebUL5SWrvy+lI3k4RF9
 kN528OBX6SYez7LiJahoMLmuOpYeJpp0/oxFKy65/vO//Huc2yIqCvlkOCKBdAPel5gVJA/6w1C
 R0uISN0BhZvdFoETLQd5zr4aMZ2Li4gB+x7/luUSxROMqIurs+sOj6NdwRhTPCTqV/299O6YNw6
 LKk/C8nhDVgkFjQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Jai Luthra <jai.luthra@ideasonboard.com>

Spread-spectrum clock generation is supported by UB9702, but only
optionally required depending upon the hardware. Add a device-tree
property for enabling SSCG.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 0b71e6f911a8..970f0f36449a 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -43,6 +43,11 @@ properties:
     minItems: 1
     maxItems: 32
 
+  ti,enable-sscg:
+    type: boolean
+    description:
+      Enable Spread-Spectrum Clock Generator for the BC clock for all ports.
+
   links:
     type: object
     additionalProperties: false

-- 
2.43.0


