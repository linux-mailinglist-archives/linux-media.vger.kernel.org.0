Return-Path: <linux-media+bounces-37345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05086B00A66
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 060B47BB708
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1172F0E49;
	Thu, 10 Jul 2025 17:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LXpE9tqN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEA3199BC;
	Thu, 10 Jul 2025 17:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169727; cv=none; b=XsLMNIOAYCCFq8Hy6Sg8eKlfxiP65kzy1AAl27MYP1/MCu/uqTJqNpbKqJAGVvnd3ex5dDX/tjSemD9kA1Ut0rGHPdcWq6zf8Y6ay+s+FrQ7j8HUT+aHtSf/bBxYWV8mG6JMW7OsQpVD9YfpgfuJYqvBGcokGVYUlfhI7rHZBb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169727; c=relaxed/simple;
	bh=krWMkI+1C9NVsuUTf+Kmn/ozcWvferRt2Nqw7jjZTkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pEXZXH8d9Y6xTU0aLsuxQ/L72sR3XMIkBzYOgMUqch/zD243kV4ZY8EM2FCoYSubkmO/NiRXAj8PAj0p/DVdaKwFIkqw+lE/rZpTLl3l6yQEnOnwlR2rCDtEqxzHzbHLNJkMrQfuVKV9roMS4r6UD25ZpDS+W7HTZDePsYLRHT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LXpE9tqN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E3047C0B;
	Thu, 10 Jul 2025 19:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169693;
	bh=krWMkI+1C9NVsuUTf+Kmn/ozcWvferRt2Nqw7jjZTkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LXpE9tqN3Z0DTGTEYqtVEfBQee6DrUuIoOTxzZ2tgtVe/xOnxN+PcTtgHQkXBi/df
	 KkLe0wtlRpfS6noImb5ie2yqFnPFB78hNeoAI7QjgathBlKAX3OXbUGn/silRmjHmN
	 S35SgcQZhmHIAyC/Yx9i60S4OJ3pQPgZz7hQZBa8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 02/72] dt-bindings: media: et8ek8: Deprecate clock-frequency property
Date: Thu, 10 Jul 2025 20:46:58 +0300
Message-ID: <20250710174808.5361-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usage of the clock-frequency property for camera sensors is discouraged
in favour of using assigned-clock-rates (and assigned-clock-parents
where needed). Drop the property, and update the example accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/media/i2c/toshiba,et8ek8.txt      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
index e80d5891b7ed..8d8e40c56872 100644
--- a/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
@@ -13,9 +13,6 @@ Mandatory properties
 - reg: I2C address (0x3e, or an alternative address)
 - vana-supply: Analogue voltage supply (VANA), 2.8 volts
 - clocks: External clock to the sensor
-- clock-frequency: Frequency of the external clock to the sensor. Camera
-  driver will set this frequency on the external clock. The clock frequency is
-  a pre-determined frequency known to be suitable to the board.
 - reset-gpios: XSHUTDOWN GPIO. The XSHUTDOWN signal is active low. The sensor
   is in hardware standby mode when the signal is in the low state.
 
@@ -43,8 +40,11 @@ Example
 		compatible = "toshiba,et8ek8";
 		reg = <0x3e>;
 		vana-supply = <&vaux4>;
+
 		clocks = <&isp 0>;
-		clock-frequency = <9600000>;
+		assigned-clocks = <&isp 0>;
+		assigned-clock-rates = <9600000>;
+
 		reset-gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>; /* 102 */
 		port {
 			csi_cam1: endpoint {
-- 
Regards,

Laurent Pinchart


