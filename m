Return-Path: <linux-media+bounces-37355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AE1B00A78
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E60CB189457C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAA72F2376;
	Thu, 10 Jul 2025 17:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UpGY+9j1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA6199BC;
	Thu, 10 Jul 2025 17:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169742; cv=none; b=kG4YlhixqeLdiv0iqndg/9emR2BNsFG3uC5Ng5G3fSgG8cwbKj1fdd2ovgVt8PqfB9sOiHF5VL/D6nlsJ9lCJNcVqJ0cOM+dyiqBxQAjGRhH71t/S1S/jNsiwuc8bfwEXHVew9KKaX5bnJFQ88vujsZ13Vuz6vxXRKO4tAItqkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169742; c=relaxed/simple;
	bh=+/YegUR3QD020fI4pwf488L2amOa0J/wVfb1IzvgWm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMB2nH01zaEJiRd8RC995EVUYH5Oq+bHGEbP7V+VnorM+rNA/uutpe6FCFelqN+082xU/u0ONKBz2btt3gR+7qIsxTIei52URT7DL/ppUO85obxwjsY6uFikki3cSWBkE64X8qQIvXYqt1zchpfKAcx0HXLjG/EE5ePptxPG6wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UpGY+9j1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 864CA2391;
	Thu, 10 Jul 2025 19:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169709;
	bh=+/YegUR3QD020fI4pwf488L2amOa0J/wVfb1IzvgWm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UpGY+9j1t4JKD0xB4Bs8wApn+zNmonRiV0SIEo6JqXBqYJP+yYUqCLb1SOh829pcN
	 K7VjMTluL1zU8KXNHZNggACbOEisb96QBN64Exh/07qYR3rbt1X8+MKWES0ALa7jec
	 pcJCcCqNJAGD4Rka9iYH746zzavHJE210lVzSyo0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 12/72] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor node
Date: Thu, 10 Jul 2025 20:47:08 +0300
Message-ID: <20250710174808.5361-13-laurent.pinchart@ideasonboard.com>
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

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index 51f1a4883ab8..dbe1911d8e47 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -44,7 +44,8 @@ camera@10 {
 
 		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
 		clock-names = "xvclk";
-		clock-frequency = <19200000>;
+		assigned-clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+		assigned-clock-rates = <19200000>;
 
 		/*
 		 * The &vreg_s4a_1p8 trace is powered on as a,
-- 
Regards,

Laurent Pinchart


