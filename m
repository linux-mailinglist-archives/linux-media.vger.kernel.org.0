Return-Path: <linux-media+bounces-28124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776EDA5F071
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D92E3168D4A
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11252265CB9;
	Thu, 13 Mar 2025 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMD/KwaB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C88265630
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861078; cv=none; b=f/+7Uu0QULEnvaf5YfJg5vQ8MGcdmae5el0zqmCeX/rQjc9kOyQ+rzFbxWGXfKLv4E+2FIZ62U6dlGuGozrh8ptHqMqn8Um/znq0Xyhea79apRjeerqcnXB6xqA00mOAJhNrgGakDcQ6HhJUN3co8LtVBfm7zXlsAW3J/HITENE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861078; c=relaxed/simple;
	bh=LAeRJMtm1uvG/j8zE5Ns5HJwd0CFWkXNdT2kDLMfMx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R4Lxoo5RapNRda+B+uQuixe6f4WioOL5tbAPBznI3YUVZ+YP8bCzLbnvMy4DFVO9rxd3urZGifu9cCr+ssev+q251bb8GZMgdIWX83JmOTpm1cNYx9+Q6Kjp/+h98ELBhb2RDlOoEim1i8oNgf1vQki/1cbqxb7D9ZyE1bng0kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMD/KwaB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741861077; x=1773397077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LAeRJMtm1uvG/j8zE5Ns5HJwd0CFWkXNdT2kDLMfMx0=;
  b=dMD/KwaBa8V3apfjHl6li8L46bprBzNyakaLLvcd4yGUMnXkzB/+OURh
   WuVIH75CT+3x43Yg/Fl/jTyUnxrCMjNuUWO/JlMGS8z4laBXoGo/F7EzS
   HyXbKHxOqxYIBwo/VGypF5XgR0e5PFttNIQpqmKj8nhDr7REFHKgHMISm
   hi1BAFbu82woEB44D7Me5dcoBg/chmb3e1GUZPCR5dkeeQrhK6yyTzQbh
   yJqDlnA1k9oXdVN3L8x1kAAZJFJMNxSn+sn7C/iPJ49Psm/8mKDqAOxDL
   Qff4q1nf3CaXdae9uMd6gRKWdgw7jC3AxC9652MsTgf0Eocfe/K464qNB
   g==;
X-CSE-ConnectionGUID: Z4eZS2ShTC6DIhBP7KfCwQ==
X-CSE-MsgGUID: 4s2/HYd3QUexYirPsshpjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42700009"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="42700009"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:17:57 -0700
X-CSE-ConnectionGUID: UsIyinIpRpqYj7oXLzSo9g==
X-CSE-MsgGUID: 9yemRalhR76XA/KKF0Gfdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="158070742"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:17:54 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 2/3] media: intel/ipu6: Remove ipu6_buttress_ctrl started field
Date: Thu, 13 Mar 2025 11:17:43 +0100
Message-Id: <20250313101744.128564-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313101744.128564-1-stanislaw.gruszka@linux.intel.com>
References: <20250313101744.128564-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We assign to ->started field but newer read back, the field can be removed.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 2 --
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index d8db5aa5d528..787fcbd1df09 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -478,8 +478,6 @@ int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
 		dev_err(&isp->pdev->dev,
 			"Change power status timeout with 0x%x\n", val);
 
-	ctrl->started = !ret && on;
-
 	mutex_unlock(&isp->buttress.power_mutex);
 
 	return ret;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index 482978c2a09d..4b9763acdfdd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -26,7 +26,6 @@ struct ipu6_buttress_ctrl {
 	u32 freq_ctl, pwr_sts_shift, pwr_sts_mask, pwr_sts_on, pwr_sts_off;
 	unsigned int ratio;
 	unsigned int qos_floor;
-	bool started;
 };
 
 struct ipu6_buttress_ipc {
-- 
2.34.1


