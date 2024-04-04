Return-Path: <linux-media+bounces-8625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A7489837E
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 503171C2100E
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 08:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88C173175;
	Thu,  4 Apr 2024 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEJMqNxi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7FA71B3B
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 08:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712220724; cv=none; b=e76kTCWTOf/MsV2GnvLoTAK6zgOSf9dpQ1VqhVVLDdoXfwANHryT/o3eUtdsRb5FmapVZ+vALNKRYBm7uNbzenovsg8I5OaylwOF9el3sBUi/cOek+s+jYT7AtQrSCiL9NgJeVzaiuE4x9wBRSFr8DaC8SV+HExhERgidbGWJ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712220724; c=relaxed/simple;
	bh=b0LMoXU+TAkFVea0f/HFoE3LyShLHE83LfXQjK5DJew=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iRC5auR5DXDxVPtYgQvq3xhaGvEwyEgr3IjjoR2q1LV+v+jFbSOdg9WO10MbM/39SvNz2OZZi1wrpyM3469P+6As9YdVmyhE9pH2pMcQAAQgbhjLSiC/+RSfk17bq9QIne81g1EzLz2NiOeObjejUQL6tO0o9xMqLDiR+K4wex8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEJMqNxi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712220721; x=1743756721;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=b0LMoXU+TAkFVea0f/HFoE3LyShLHE83LfXQjK5DJew=;
  b=VEJMqNxiliAah3SnftseKiUhTDaRzjBQbCpxYq74MZ9AQ6h0YRhS21Zj
   BaNcY439y7ZvYIImCUb5GeUQNnW88PMQ2ycDqGG1uajSlXqu2otzvYPG2
   duy6RX2l9QpGPP3L8OLvsBLID7D1eVzDzLjwCV2LYWLVHzfVlmJJj8nrA
   xYZHN/TbkOLnQbAKJamVHaES6PfHYA+YXEvagCeg1H8GOBqspw0vt0B7X
   B2N3LceIjupH8YcvDeK5p9IjI87GmB9AW0mNUElyoFvEYUJdER8ZNwSsk
   ROdTub/+0UgbG7IReqgT+zJo39zYTTPmsr1VoxnEwezCFBPp0Geu/Hd1H
   Q==;
X-CSE-ConnectionGUID: qkEzS7JtQn2hgfA6wrPbTw==
X-CSE-MsgGUID: eWC6qMmRTNOgJLufzyEWyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7658992"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7658992"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:51:49 -0700
X-CSE-ConnectionGUID: cLCytNhBQla0S9pIE3Y1UA==
X-CSE-MsgGUID: 5BdlgnRZTTqPdySi8SSNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23186559"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:51:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B12CF11FBD1
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 11:51:45 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rsIoz-001hOJ-2D
	for linux-media@vger.kernel.org;
	Thu, 04 Apr 2024 11:51:45 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/3] media: ipu3-cio2: Update e-mail addresses
Date: Thu,  4 Apr 2024 11:51:33 +0300
Message-Id: <20240404085135.405104-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240404085135.405104-1-sakari.ailus@linux.intel.com>
References: <20240404085135.405104-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove e-mail addresses that are no longer valid.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 6873ad4b3dae..8ed2220d045c 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -4,9 +4,9 @@
  *
  * Based partially on Intel IPU4 driver written by
  *  Sakari Ailus <sakari.ailus@linux.intel.com>
- *  Samu Onkalo <samu.onkalo@intel.com>
+ *  Samu Onkalo
  *  Jouni Högander <jouni.hogander@intel.com>
- *  Jouni Ukkonen <jouni.ukkonen@intel.com>
+ *  Jouni Ukkonen
  *  Antti Laakso <antti.laakso@intel.com>
  * et al.
  */
@@ -1997,10 +1997,10 @@ static struct pci_driver cio2_pci_driver = {
 
 module_pci_driver(cio2_pci_driver);
 
-MODULE_AUTHOR("Tuukka Toivonen <tuukka.toivonen@intel.com>");
+MODULE_AUTHOR("Tuukka Toivonen");
 MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Jian Xu Zheng");
-MODULE_AUTHOR("Yuning Pu <yuning.pu@intel.com>");
+MODULE_AUTHOR("Yuning Pu");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("IPU3 CIO2 driver");
-- 
2.39.2


