Return-Path: <linux-media+bounces-2788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D89819D03
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AD6C1F220DB
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FC12232C;
	Wed, 20 Dec 2023 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SL2ngBBW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC2A2231D
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068656; x=1734604656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GM7xgpgktcL56dQNEFGyQPFoQmRP0ehv7t2mbRo1xzk=;
  b=SL2ngBBWGZpppEPIk68kbcvil+q+Vpj3KNJMOA3Jm8islVy+PdSoG3Tx
   qnH3aFgLnCHT8L0YxQXyPXhmmhVKZZ+73fz94eaRQ0zV0rnmPqLBRwtpP
   YZkKVK1dsRLBQX0OxsaYeNl6hqGBd0QAtROo05AstoxAKJOvkpHVO1i7K
   aCIABA5bUvWbtBszyoWG5yuA/Eg8MhgLjCj1a8VD+MZSHK+upEuEOxxm0
   Kc6r9hm+agke9Rp8+852ye2s9c4neSdNM15xpvkGLgaDjlOywLhrTkNpf
   AobOMn/4KojENOfrzr8CGKPvO+Q7J+EmW8D1TKI7jNPIgML3l4oWhUqjf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174415"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174415"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544283"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544283"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:34 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CB15D11FB5E;
	Wed, 20 Dec 2023 12:37:31 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 28/29] media: mc: Warn about drivers not releasing media device safely
Date: Wed, 20 Dec 2023 12:37:12 +0200
Message-Id: <20231220103713.113386-29-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The media device and associated resources may be released only when its
memory is no longer used. Warn about drivers not doing this, but instead
releasing the resources at driver unbind time.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 97d63146b344..a1ca2a56269d 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -826,6 +826,9 @@ int __must_check __media_device_register(struct media_device *mdev,
 		ref = kzalloc(sizeof(*mdev->devnode.ref), GFP_KERNEL);
 		if (!ref)
 			return -ENOMEM;
+
+		dev_warn(mdev->dev,
+			 "Set mdev release op to safely release resources!\n");
 	}
 
 	/* Register the device node. */
-- 
2.39.2


