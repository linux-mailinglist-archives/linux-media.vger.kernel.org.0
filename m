Return-Path: <linux-media+bounces-49294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAADCD4F7E
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E76F30443F7
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A9F30DD36;
	Mon, 22 Dec 2025 08:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ptPR9KjA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ACC30C62D;
	Mon, 22 Dec 2025 08:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391404; cv=none; b=ghzT4+IguYi1AeEQAVh+cahOqYx3xSLg8uT4LB60jz5GJYyBFP3EebGutg6jMH5T3i9vaqL4SYIYDcZ94rHJ0IFqYPSG2eOnafD4HZkkyVnF02/yO2lfUuDPlF3EhTn2ic7GIJD4eYz2qNpe6nMYcfZWAQhxNjPzY+sRcjBKrh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391404; c=relaxed/simple;
	bh=WlpbZmmjqKJS3DmyyAUMl6LDaznhjOwdS3TShMr19Mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3Zg9zGFpZ2+W9BMtTQSCnKVtYCP4rM7WV2YQxTPAjO8wE3VaamcT8tw/CNWKSkQg8ffjvLDbPCWKGC3t59rYY2PUE8XotVrgfr4JH1mrfAUytklzSGntUgsZnfMj3Iu8PNLsU+b6u/yutYACdRjiPvr1l9OiBAtN1bRm/W2e3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ptPR9KjA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F6E5177D;
	Mon, 22 Dec 2025 09:16:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391391;
	bh=WlpbZmmjqKJS3DmyyAUMl6LDaznhjOwdS3TShMr19Mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ptPR9KjAqz67HxehAa/gTbSWK+8osFcXPffkLnEyZSfu6Yt2TBchmvei/aj7dp9Yw
	 Wfd+AtcLSbyqncgw8OLdXWkxKzR8NS21EtuRybdZr0qlXV7khr7iWY+slshZF9Eay0
	 FFGE9qE+gTpJo7pdce5/bhkCR0kXq0kfCDXas9TU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:32 +0530
Subject: [PATCH v4 08/17] dt-bindings: media: ov5647: Allow props from
 video-interface-devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-8-b949c7309280@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=WlpbZmmjqKJS3DmyyAUMl6LDaznhjOwdS3TShMr19Mk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4o/XZsKhZ+MX4vpXCnbmSzUdAt9DZQ2pOG5
 Fk4z28wL3+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+KAAKCRBD3pH5JJpx
 RYYBD/9F2I6KWgrnf2KSGLnzvN00VmZrmj5nVoTwUXfhcu0AXGrDCLJfSMvoB2JS3FsVJvIdku9
 lSpJ1u5rPkuls7qHNLn3vsffeVGKySfBwxL5FINEvmvsW4AIAH3zUuWHfAJvHZpUhi1z7JC8UVl
 Pcq8dEQHhVf42y3Sp+lodHCs0gq0XB83eX/wJdM/XGQc1IG8A4EB+TCVrEYObekRHsLtcAmjaCx
 AodtDLtSFfxdWnbYvBsfJ2bJa7QBrCMRdPKb26B09tcisgJLl005mE8LgRCfla0Nzg/b5TZxWNw
 hRZZ3i+mKhVFiMGyyhQZxwyDKrY5mNHhtmddTfFusjBr+yfW8qvpeRyH7FdPuvrBRFQl3t5sogy
 uLuyjTMH+iCdozvs09MhQ5jPtqH2M+5FxPGO4+zDVSxzg5CLR98T6CcErB3n8piBUhNz9zRbzuJ
 2KFw2cKQjf1XqAeyecEev9DH+Ax1pWUZXAC5Q84cpwQMXcQrKcAm6y6gpELMUewfXHWbQ/QRFuB
 Ft6v23Y/xVafXWerDyv1M54ww6P+016EwjnNdSDFDmN45GyTldsUI2Nv/AMEX9hUJ2+hwAF1qNN
 CPGBKtiG1HXbLiNw+IO4yGyxXrleGm5doUSSwpapXnyS2yn95BwxVaiJE0hiDkQTbBJFLS6M4Pk
 akqGGI4q7tyrOkg==
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


