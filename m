Return-Path: <linux-media+bounces-14792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC692BF87
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ED53288AF0
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208E519DF48;
	Tue,  9 Jul 2024 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPjq8vya"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E2C158A36;
	Tue,  9 Jul 2024 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541873; cv=none; b=cDYfY+pY6zwNZDDUWRJCS9HfWrP3Eg77tugm/by2tv1VeoFrA2S5nILTAgF1Z8xBrj7X68+hQ51+a7kEAMrszMaq+vCtY3GYrkAmPN985BvTcOe9Cpv60MgG/2EQzI5ARIPi0FBJPs90DanGWcRqRZ9r50JR69upKT8XK6NINco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541873; c=relaxed/simple;
	bh=TamJKovQUEkt3niIxAxyUtA7ak5N59S2pM5XNNELtW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tHqRsN0cskmWwd/Lu2jbciK8WwDZuJ85DXVUouWiJO3G/1yT39z0GJ2pjvDm1JmrcjwenBco7HbtOEaI0/TMhJhhWHjdCCnwHpR2bjiLwA3tC2umlUsAS8pU8P5+7qfz0jy64IttDyRWDgWZNRoDjZgx0uWCuUSMCkOFmtvoeDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPjq8vya; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720541872; x=1752077872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TamJKovQUEkt3niIxAxyUtA7ak5N59S2pM5XNNELtW8=;
  b=KPjq8vyaTKXoIS7MrmvYA9UikQxWxSq+DVsB1SWkNnVjYZK/prthVYCp
   zYkvOaQw8Q1Kuck5Zjp9rTz48FM9f6yEO99NG4c3USwb1o1cqtZOIE0xf
   hmMwsvrK7u20AMR0EVDNcRYOmItW6KbAl8hmOrXc2FyILEI3GTd3pMfPo
   Tx54mS1U2CI/5Q5eOnauztnERWOWNArfSoQa3gspiHLxdRl4+5nr+LA8h
   BZRaA5SVH6yyyC7RVn6MKfabeUWTdYGnX9b9NlpnS7lbNSD5tB7mdoaBp
   j9V/ofoidRKioQCQ9/QG6Wh2TdOG/tXJFSW236aLJS3QABMqetFdFO3jp
   Q==;
X-CSE-ConnectionGUID: sJ6lhNzcTbOZuT1BurEX3g==
X-CSE-MsgGUID: DKdo2jo7Stat8JOLIN9NtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28971255"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="28971255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 09:17:51 -0700
X-CSE-ConnectionGUID: 4BkvPTidQY6Z03JB80wrOQ==
X-CSE-MsgGUID: X5teJpiRSRKh9Pg/QDXp0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="47989294"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 09:17:49 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2293711F811;
	Tue,  9 Jul 2024 19:17:45 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sRDXF-00Fd1R-0A;
	Tue, 09 Jul 2024 19:17:45 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Greg KH <greg@kroah.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH 1/1] media: raspberrypi: Switch to remove_new
Date: Tue,  9 Jul 2024 19:17:35 +0300
Message-Id: <20240709161735.3724913-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240709163715.3bcd6ab3@canb.auug.org.au>
References: <20240709163715.3bcd6ab3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stephen Rothwell <sfr@canb.auug.org.au>

The remove callback's return value is about to change from int to void,
this is done by commit 0edb555a65d1 ("platform: Make
platform_driver::remove() return void"). Prepare for merging the patch by
switching the PiSP driver from remove to remove_new callback.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Co-developed-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Acked-by: Naushir Patuck <naush@raspberrypi.com>
Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi folks,

This patch improves the original 'linux-next: build failure after merge of
the driver-core tree' patch. I kept the acks, hopefully that's fine.

 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index e74df5b116dc..65ff2382cffe 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1756,7 +1756,7 @@ static int pispbe_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int pispbe_remove(struct platform_device *pdev)
+static void pispbe_remove(struct platform_device *pdev)
 {
 	struct pispbe_dev *pispbe = platform_get_drvdata(pdev);
 
@@ -1765,8 +1765,6 @@ static int pispbe_remove(struct platform_device *pdev)
 	pispbe_runtime_suspend(pispbe->dev);
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops pispbe_pm_ops = {
@@ -1783,7 +1781,7 @@ MODULE_DEVICE_TABLE(of, pispbe_of_match);
 
 static struct platform_driver pispbe_pdrv = {
 	.probe		= pispbe_probe,
-	.remove		= pispbe_remove,
+	.remove_new	= pispbe_remove,
 	.driver		= {
 		.name	= PISPBE_NAME,
 		.of_match_table = pispbe_of_match,
-- 
2.39.2


