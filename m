Return-Path: <linux-media+bounces-24597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99296A08B55
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BB5B3AB15C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06B320E02B;
	Fri, 10 Jan 2025 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dZZ4iX4S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6BF20DD75;
	Fri, 10 Jan 2025 09:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500544; cv=none; b=UC4jaD4LiGrL173XxHxFJxMB5KPmoDsiEzFvUmvRHUdxp8BpHcj83/whpyKjUDeu/HZTsP1lhlDJqTfN5aBHYNGu4nyX86Ucu0omArK3DI3BNjJBqohUz9VP8SZ2B2W/iBCWPJyYOaTEe2Tq19tV0BYAQ3iYT0k/SaYTX0iVGs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500544; c=relaxed/simple;
	bh=sfFux45FQcncQHHLAZmUrqaIyq2629TmZ7HxcgGYM7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+D3YMTfPJOOe2xTC56/XXU92Q39eG/wbFlA6atiQBeznsbidMdfCH2oP8HKFKu49auxW5qfkSy35f2tA9wdIcocVmCYfDl6icZUPbtLGpjE2xQGGqtQIIBHJ7aEK9VFWIk0iu8N2Gajn6Fd3o+bbtQHUJJPhiCYzewkxaL6sBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dZZ4iX4S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C436826A1;
	Fri, 10 Jan 2025 10:14:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500460;
	bh=sfFux45FQcncQHHLAZmUrqaIyq2629TmZ7HxcgGYM7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dZZ4iX4SgIAGpqwP4alh7JbO1yBkdjg6BguA1GxTbVkjtqAAOaF7Yxhu+ggVnHxAe
	 i88N+j8kdfASGwiCYT2jmVNM+i7R2uXTT7bH4Pawnukiq6/IGVaxKVqfJjjk30U1RT
	 FW1U4ZZ28n2bnjBcTYfAig4smZoffdyfzTn+e0dU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:17 +0200
Subject: [PATCH 17/19] media: dt-bindings: ti,ds90ub960: Add "i2c-addr"
 link property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-17-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=GDTLyS9Si8q6ga2oVEsfw2W8NhUNtYkaUlhU96iZCzU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUWSSZWGpf7vTZOk6zfV9ekwY9MhJJDj5mVf
 MZZOOxeiRGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlFgAKCRD6PaqMvJYe
 9RXuD/9JS6B4RAQuwpqCx9hxlbIEXzXAAWC3A+GYRkKAVOZ5kDyQ6KHbT0YC3JxmX8UAOOMw36Y
 YEGwEaGUS9sfqqtG2SJFrdzmRXXv0LeYhXXcC9IivqpzeacInf01KKsz5ERP6+2eKCHZmUP2j2o
 5aQGCoOG5EaTF6eZjwBzbeQYskLq6UBPgR1gwRgh/Y2f0VGfNzHvFIyiJSI7Z/EABzftDwMUpzF
 Ddt+cxdoVTM5VqBOPl1pPdwPQNwkMsFCXN1fJA+sWOA51DgzyXQCpDGZ4AFW+RazI1Y1neGXGww
 bFjpo7HbvMN1Gvqa2/NuTIpijkeKEeFE5irTkKBu/v8JIz730ukqgjPxySzAhv06DVm90ZRYtF5
 h8z0AmF9Jf0ktFstB3sl1o6TYE1JUixkybTLNk957z0Ro0jpcAskqZvIbJQHPf2eQnUc1R3tIOD
 drWAWkczf3pjxp8WWtfsoi8kLEmzBsaXENv349FJKXmOEInI7a03Xhrx//Jne7fCCEzQ/uJhSiX
 KzXbJcV+90kLZwI8e57uxce5i0ei0QuieG9qaCQyKojGRpdMnmPVJcutA5EmcrprYwb2EHNoc+r
 HzPjNNVIoMDxrWm5Zxs9KKwzkVzTUER6Feuscmw4B4ns6qsZ8U4OB6gTGfo350PiHU1vicfPrDF
 6ylzY1f96s85uuw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Jai Luthra <jai.luthra@ideasonboard.com>

The serializer's I2C address on the FPD-Link bus is usually communicated
to the deserializer once the forward-channel is established. But in some
cases it might be necessary to program the serializer (over the
back-channel) before the forward-channel is established.

This can be used e.g. to correct serializer configuration which
otherwise would prevent the FC to be enabled.

Add a new optional property to specify the I2C address of the
serializer.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 0b71e6f911a8..e17b508b6409 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -75,6 +75,13 @@ properties:
               address on the I2C bus where the deserializer resides are
               forwarded to the serializer.
 
+          i2c-addr:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              The strap I2C address of the serializer. This is used by the
+              deserializer to internally communicate to the serializer over the
+              FPD-Link back-channel.
+
           ti,rx-mode:
             $ref: /schemas/types.yaml#/definitions/uint32
             enum:

-- 
2.43.0


