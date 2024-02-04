Return-Path: <linux-media+bounces-4659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5D884908E
	for <lists+linux-media@lfdr.de>; Sun,  4 Feb 2024 22:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F9931F2286C
	for <lists+linux-media@lfdr.de>; Sun,  4 Feb 2024 21:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7A633082;
	Sun,  4 Feb 2024 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwlWS37T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAF22C696
	for <linux-media@vger.kernel.org>; Sun,  4 Feb 2024 21:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707080819; cv=none; b=nHp+814ujYyVp2Z6DUVXFRVUFSs5CRBuOjzg5ah5/LgnAd4aESY+ZGaBFhUE8XgCUG9OHeWdkcG4/nVqOtULEoQ87pCfCbkT7mEZutmKyktCMHOLNPPmrnq2reoLFqxVLxezJ77L3IxaPCaldK3odDj9ZvOYOf+hfkZhXfY/2hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707080819; c=relaxed/simple;
	bh=e9tcrD2POPy7i8XXopmPJAYL65YRDez3C79wpOGK86w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ISWkCSsIgktoW7vo+o04LUDyByOvubdvFilrLI4CtCpNmq2OMWITo1P5f/w8nwvi1vKTWQsxFk7MPBzR7oDvEaUxKkCxVuvSpg/BtntH0BedcOjVMBQtxi/dNi0eX76gPKEwkGWHWqV51HosyPWutHfFzSVcP+/Tl5S0HiRVQjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwlWS37T; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707080818; x=1738616818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e9tcrD2POPy7i8XXopmPJAYL65YRDez3C79wpOGK86w=;
  b=OwlWS37T5m/NQLDATVYntVuT290PFzDWBByOetVw3A5iucnMd8y/2sF4
   soDrGPJWT838oeqSGCqjP1jhkXQiYsqwOfnM9nXJ6Ogrqd9OsoJaraqw9
   oHmorbPfZgFKXveULSQcbESboQDJDv9aDWrtgDWakED4/DDkFCPYKBJ26
   /19mTjUF8wcdLCaqXH1yF3hjJUmtJBNWt8fUMrMI0ovKyCT7/3q2OgieL
   TWniYsH/j6AQ0ozMuyH0x60qAMRekT/xMsr18L3hLNMrrqEyJbn8N7nex
   05QskylBLRRxSHIYShxj0x0Fy6J4initUZeUsad3x/oCBSN3xKxx6B4gm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="309641"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="309641"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 13:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="823694904"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="823694904"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 13:06:55 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B31E611FCC3;
	Sun,  4 Feb 2024 23:06:52 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rWjhU-002uX9-2B;
	Sun, 04 Feb 2024 23:06:52 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/2] ARM: dts: Revert changes to omap3-n9.dts
Date: Sun,  4 Feb 2024 23:06:42 +0200
Message-Id: <20240204210642.693958-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240204210642.693958-1-sakari.ailus@linux.intel.com>
References: <20240204210642.693958-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit feb8831be9d4 ("media: ov08x40: Reduce start streaming time")
introduced an unintentional change to
arch/arm/boot/dts/ti/omap/omap3-n9.dts. Revert this change now.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Fixes: feb8831be9d4 ("media: ov08x40: Reduce start streaming time")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 arch/arm/boot/dts/ti/omap/omap3-n9.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-n9.dts b/arch/arm/boot/dts/ti/omap/omap3-n9.dts
index 728a8fcf25b3..a3cf3f443785 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-n9.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-n9.dts
@@ -26,7 +26,7 @@ smia_1: camera@10 {
 		flash-leds = <&as3645a_flash &as3645a_indicator>;
 		port {
 			smia_1_1: endpoint {
-				link-frequencies = /bits/ 32 <199200000 210000000 499200000>;
+				link-frequencies = /bits/ 64 <199200000 210000000 499200000>;
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
 				remote-endpoint = <&csi2a_ep>;
-- 
2.39.2


