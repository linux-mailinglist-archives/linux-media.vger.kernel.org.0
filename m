Return-Path: <linux-media+bounces-48755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A85C1CBCCD0
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38D7E300BA32
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B03A32C92F;
	Mon, 15 Dec 2025 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b/2QGkC6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D92E285CAE;
	Mon, 15 Dec 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783905; cv=none; b=XKLuIdVgBX1ugcep7/PCxvH1GC4er9BWWhhZbVVyExxxCuahx/UrUPK34Ycakpz+KCFiXe/7gFTaoSaNJyYs6wQCWvDZQC8+56mPF50m5TslLba4IhqyFrtjMTCrTMziFWbFShM4B9nXjHTysm0GD6b3Vh1c/oU4W8cx0ku9YwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783905; c=relaxed/simple;
	bh=WlpbZmmjqKJS3DmyyAUMl6LDaznhjOwdS3TShMr19Mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PVDMx8ump7cjwz2mqHdR6k3TnjbPnVG1GiI8GnVPotOD4ZU1Zm22z1Z5Y1r1nMMR1HjCon6qg5v2uy8ZEmBW0Mgvi0QdubZtFJjcmtu0WUteR1Ki2XB9JdCmrDbR9TWUMSp4yREiYi1aQRupi9ao3UXc5FmqPOntl8e18LWm+Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b/2QGkC6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8644581;
	Mon, 15 Dec 2025 08:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783898;
	bh=WlpbZmmjqKJS3DmyyAUMl6LDaznhjOwdS3TShMr19Mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b/2QGkC6XutwtAuniMvtAAnyjvxty5/d+NZztk5Ego3U1qLUm3jienlLpox6bTEZa
	 AVIdCYCn10WRm16woHxJOVMi1R3QkrgFvdqD63oNLTUrqeniD79UMhtT2nLV1Iiw9T
	 TBb961/k0f0gINTNrldDbCuXZPpKu8Yi1ViG9SEQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:58:03 +0530
Subject: [PATCH v3 07/16] dt-bindings: media: ov5647: Allow props from
 video-interface-devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-7-4c25e3c883b2@ideasonboard.com>
References: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
In-Reply-To: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=WlpbZmmjqKJS3DmyyAUMl6LDaznhjOwdS3TShMr19Mk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jdX8wYI7b5QDRVsm3XJBS7rBOWKIjBpAWsF
 228WTlXW+mJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+43QAKCRBD3pH5JJpx
 Rac2EAComk9dX51zxGk8JvdT/ltpyvTt3VtmjLVmBjl2pgBcZ1rBdx1/Ju6jkPAJnzLKw8/xo9b
 uCHclh2qmDqX4de3vDjQnt9iX4sTqYzhjIwbrB33/2zvSQJ/AUPsZxRY9JK02BsFmCzxn5b0RO4
 0MSHat26qcn8tKB3ekkZL8MBauQf1aNefQXoRvtsWPrrkkvODquHRZwCUicH2f3tDT8qupAWovP
 b0/fNbQPD59YrGdEbVyNDG/fIFTHtlXaeTzaQxP7q+G+1EMiZ5g+YVUSUum8S8YOWVSugveYMp9
 dVCiwgqMFQfhOgRoG/GQvQOt9wirkBHAIWdj1V5TATGu4rDMNk/7aKPHuYN6PKvF4sQo0uU3x5U
 XIhIMVDJcrKCm/2tiIjXTDJh3xnRPagENasTYvXc05GxkDpMxs/U4wdz0zcUBfLQtVm7VksB9kZ
 5zTMomDnalj1XKPU3JHTa/yI9koDL9grCn7NJ67F8Dxy8Pf5F04WOT0qyFD9ZkdCwXFzyqYJFui
 2Nh0+Y6ALYOLt6pSXlUpi45WIGTy0Pz/pd/KN0lAvDlsRhF4lvp+tRxpK4paygTnXyc5+ceW3eu
 Qagg7aLNBpiuTwdYNIjFHEt4uxh7DEPYQ4wmxigR9zUFG0q58ld2PSV8XTU418SzGXup/gIAl+A
 s0KmjDmdDto1mKw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Allow properties from video-interface-devices. The change is identical to
commit 08fbd355be3d ("media: dt-bindings: sony,imx219: Allow props from
video-interface-devices")

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
index 9d3f7f1789cdedb357dae2e18b03c5af3c0e68e3..2d7937a372a2b0f12c6837b6f0d790b4bea7f553 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
@@ -14,6 +14,9 @@ description: |-
   The OV5647 is a raw image sensor with MIPI CSI-2 and CCP2 image data
   interfaces and CCI (I2C compatible) control bus.
 
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     const: ovti,ov5647
@@ -57,7 +60,7 @@ required:
   - clocks
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.52.0


