Return-Path: <linux-media+bounces-30009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D65A85670
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 10:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BE6F173974
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 08:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4D9296149;
	Fri, 11 Apr 2025 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSuFX3JY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2E729346B;
	Fri, 11 Apr 2025 08:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359869; cv=none; b=bIH1/an3IKCwXmJSyt3vDCnX8BbLTzoFgr1K43HHF01GoB0UfHfsdRdmo/zW7Z9C31FPOc9suWjdjwSBpDcR30r8WUJ2kuvRgc/B8MHOdC0QKf1q+MP7ywz4jnuH8mcLNeMTHgbC/Iz7+nirDrJFyzEOowQiraVKDEGLfJvFmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359869; c=relaxed/simple;
	bh=wd8J/WcJetlQbeQ1IoCPp1JzqLyHlAEkt4KEhKVEVQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BoRGF+B6FqRj2EyxsutjTfMPzVjEmJ4VMKWgXzg7/WQYA6LXDmE8PNnUQWjTRCOJU7+p7V3YJDY1j+7znYDwOmMq62PM5cC8GpgJNcD4eQYTnj+IB6u/FBdTyzTYOg48882DeZHkwHunyEESgzTf591jwIAK7JqF2rJ5Uo2oYVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSuFX3JY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744359868; x=1775895868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wd8J/WcJetlQbeQ1IoCPp1JzqLyHlAEkt4KEhKVEVQA=;
  b=nSuFX3JYyjroPGBHrUmbZJo7LahqgijTOqrsgGkJ+sIe0EexUzp4qEK4
   IOYD3bfig6itu1ffokUf2VJGDfANDtueWx+rvoNRPlOQUoRUekfpFagP2
   /DnlURfW/MBn6O1oDWS+UB/nxZHKxaX0XhkKVbckzEcItx4CTpDkRTFe3
   4Z9N4eu1AlAqLqaDKiBpJgNanNVC97xwwZMicQQwO6GNBOo3pQO2jfO4i
   wxJXiIajNYq1P7Y9Vq9c49VjLtw5Vi/55+opAvsxaDJE99B8n0yF5ttMj
   ZJJHNXmLtt4QbLfsNhCy3twViOowlaohlAHujEbSM2GmdtcLYSPf07Dki
   A==;
X-CSE-ConnectionGUID: kGGPCc92QhO8WO/P4lySuA==
X-CSE-MsgGUID: p9rykTtbRYC/PlpSwxUXhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45615370"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45615370"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 01:24:27 -0700
X-CSE-ConnectionGUID: QvwHwBrPT8618veo0yKJ/g==
X-CSE-MsgGUID: f6/EJAqpTTaB6L0smyjDEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="133238882"
Received: from bjledic266.bj.intel.com ([172.16.127.175])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 01:24:22 -0700
From: Dongcheng Yan <dongcheng.yan@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	u.kleine-koenig@baylibre.com,
	ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org,
	dongcheng.yan@linux.intel.com,
	hao.yao@intel.com
Subject: [PATCH v1 2/2] media: i2c: change lt6911uxe irq_gpio name to "hpd"
Date: Fri, 11 Apr 2025 16:23:57 +0800
Message-Id: <20250411082357.392713-2-dongcheng.yan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411082357.392713-1-dongcheng.yan@intel.com>
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lt6911uxe is used in IPU6 / x86 platform, worked with an out-of-tree
int3472 patch and upstream intel/ipu6 before.
The upstream int3472 driver uses "hpd" instead of "readystat" now.
this patch updates the irq_gpio name to "hpd" accordingly, so that
mere users can now use the upstream version directly without relying
on out-of-tree int3472 pin support.

The new name "hpd" (Hotplug Detect) aligns with common naming
conventions used in other drivers(like adv7604) and documentation.

Fixes: e49563c3be09d4 ("media: i2c: add lt6911uxe hdmi bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
---
 drivers/media/i2c/lt6911uxe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/lt6911uxe.c b/drivers/media/i2c/lt6911uxe.c
index c5b40bb58a37..24857d683fcf 100644
--- a/drivers/media/i2c/lt6911uxe.c
+++ b/drivers/media/i2c/lt6911uxe.c
@@ -605,10 +605,10 @@ static int lt6911uxe_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(lt6911uxe->reset_gpio),
 				     "failed to get reset gpio\n");
 
-	lt6911uxe->irq_gpio = devm_gpiod_get(dev, "readystat", GPIOD_IN);
+	lt6911uxe->irq_gpio = devm_gpiod_get(dev, "hpd", GPIOD_IN);
 	if (IS_ERR(lt6911uxe->irq_gpio))
 		return dev_err_probe(dev, PTR_ERR(lt6911uxe->irq_gpio),
-				     "failed to get ready_stat gpio\n");
+				     "failed to get hpd gpio\n");
 
 	ret = lt6911uxe_fwnode_parse(lt6911uxe, dev);
 	if (ret)
-- 
2.34.1


