Return-Path: <linux-media+bounces-47279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C5CC69404
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 6CD5B2AE86
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD289357701;
	Tue, 18 Nov 2025 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aazr/Vuv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4464A3570AC;
	Tue, 18 Nov 2025 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467445; cv=none; b=IKINe+NYCIBmlHlFAhiHXWBvil6ot0WAruoHHT5HzoDUYoqmOTu2tAaRft3HKc5SWiTE7WVPHORBkxnFuV8aHlr5hzMjl0kOwlx4Zg52PfoKL8pq+aDMG0jeaR27jfK17mN0Klf8qY5lfQ6QaY6nz7ED+idt0F9AXMpAgPrCUBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467445; c=relaxed/simple;
	bh=81GOwsSJOTnG/k04fTwbNWn7mJdu/iyHP4/xMNXV0LU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K0qWEeezxRJGi+1/U1TdfnYKCqqyzPolaVckRM96LQqzgH9TDrOtYRFA3JDbBU6L+XidzE5UK+q/RlGbgyBs+mZGOlmB1MhadE1jA2xhAXYW4iDOceU5lwRZkJSDTuYcqtD86vRvF3AdpRx0c3NIRM+CibuXiWQUbXpAYAboWKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aazr/Vuv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B865920E3;
	Tue, 18 Nov 2025 13:01:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467318;
	bh=81GOwsSJOTnG/k04fTwbNWn7mJdu/iyHP4/xMNXV0LU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aazr/VuvzkpMZ8cf+kqA6KiPEHi/EL8U9GtnJuV4dONAV508vhrG9rZoOY1qSBZj7
	 4wuR9j0f+zwNLtoPaMIWuxA24yvAKJpULTTtvmzofFeUvgBWysI2IvBhgz/2dstqhg
	 Te1dYJwAs8RDsDJi2pRpV87kyrF0LS2xRa4+w0oo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:33:00 +0530
Subject: [PATCH v2 07/16] dt-bindings: media: ov5647: Allow props from
 video-interface-devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-7-5e78e7cb7f9b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=81GOwsSJOTnG/k04fTwbNWn7mJdu/iyHP4/xMNXV0LU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGCAnf41nn1SWCg3Yy6awUleP1xZJTQ0YL40O
 5R2BbvMgsWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxggAAKCRBD3pH5JJpx
 RV/sD/kBUaYtpg5P5EjkSxEPgfgbpyRyD2iHYgFSj49W/UISjkOoDBQ4fi2QV/aQhw5qUy89498
 i5wWpc0mbezXZbF0OP/chgcx9+wtxVo5hcdxpUxnkF/Kkyy7dNa6s5bogMQ/wdGd2aqD4DrZAJl
 lRu2ysyspEFBa+kNVFIAKftHChp28xYYtSI8lSggK0KoWtNhI+NZv5L4JHTuPrFEiFWV5MHV3/E
 6saEMohOlpGRhnwIcj5E7LTaerslND6ftTW09D8q+mMIci/D//II8dkWCt8sONUGeHQPdhzmoiG
 GCXSrpYqpfUVJqn2E9Jiqqpi7FR//qDavQ3oiz+EZmhW5UomXCZ3GtAdahBsYtjfrwh6MXPHYe5
 mDZvDGOy720EOZZsZsSRSlBaw5sjb9upDX49hl343EMXE4oikmcq1iOQ5baoYjG/Iv7bam560tI
 Uud8w1LjKR9gNlE1oNtLnHyMYtUS9+BlnXopTVWPZz7Q7qobljH8/NKZ20PCg3/45MqI+6WlVTF
 3T+M/JeOqxyvEJAJFp8oBmUl1tsD2Xymey1Y+aex9KJ08t7D//QpfLOdHvqAyErwyL7asNHTb8N
 3na0If5M9lp0qacUu24QLtFXlKwKf+895A86lN3qRPkjX5r8cVyem0H66GvZ+sOgEVUnDmsn+Mj
 Oxtpcb4vAsQtORw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Allow properties from video-interface-devices. The change is identical to
commit 08fbd355be3d ("media: dt-bindings: sony,imx219: Allow props from
video-interface-devices")

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
2.51.1


