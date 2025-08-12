Return-Path: <linux-media+bounces-39638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BECABB23AF5
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 453DD3AEE39
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5292DAFBE;
	Tue, 12 Aug 2025 21:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oNdHzNns"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FF729BDAE;
	Tue, 12 Aug 2025 21:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035207; cv=none; b=RKvhkzd7etmnLJHDmQgnck1Lb2MVW1nrQSXwtul+mhtCGlmnEZta8nM3KOtXhsWFkiWqFjfT96sB/EDF3fs5fo9HwpDAEjEi5trr4zeyIk58XfMz0Jxmm5OfuVMCoDjbCqs9DmqxSwNqwyhgZYmac/nwExA2Ii5cxcB7aB05gH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035207; c=relaxed/simple;
	bh=xkzxhyL2/TpN+FDBsDLekG+ZwTlMEuRAosKLxFjVO34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GctBHPa4HyLM/FH1YeKlJctrgnckl5rTnpjQUuF6M/l9InWZ9fTmEFdR41RlDELU+2xL1nXQXgWCYbW9cSBvKuNe604xfEhdDZlBzjRtkL8gyAqVI5XZdREXj75xfSUdcVV/NcInNW7pHuDZCYXKLHB7GAdD1BrY+neWDLQHPmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oNdHzNns; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2336710D4;
	Tue, 12 Aug 2025 23:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035149;
	bh=xkzxhyL2/TpN+FDBsDLekG+ZwTlMEuRAosKLxFjVO34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oNdHzNnsanaLy/mhO+UWCVLgLv0KMmpPbWukBcInQsCTuY4wqiv6pDxvnDK4dgvjq
	 8wf04M04GXG6ipsCKw2sFTVWv7rmJvIwvTTJCTBKhXXRm2q57weUsoieDFIXpl/eRz
	 hrEu9+/kfd/pePHdCp/i3eWzVdNgJs86WRMlBuT4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 02/72] dt-bindings: media: et8ek8: Deprecate clock-frequency property
Date: Wed, 13 Aug 2025 00:45:10 +0300
Message-ID: <20250812214620.30425-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


