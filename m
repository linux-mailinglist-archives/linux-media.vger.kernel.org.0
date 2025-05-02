Return-Path: <linux-media+bounces-31624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DFAAA7657
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1EB91C01207
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623A1189912;
	Fri,  2 May 2025 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VR7qwKrp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C872586C3
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200703; cv=none; b=UroxJh6Tit/0JMk2R33WHzzN1MnYdvPS08xQ9BNrJZcsFeWtmIyXnxPdEnorpNfZk5Pt2Ffa49xb6HM3hxfW1pWc/d7urU/lLdMr9MM5DDzfXUMFT/UfwyxA+wla+sUzfiBJpuWL9xlLzWwGx216ESSg98+erNT/rJyyX183pJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200703; c=relaxed/simple;
	bh=DdChOKnkUSHLNyR/IOEcgZSRasst5rYXPuKDtQ1ow88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QlozPrgsIHjc54XIkhixQIVbpoYZ/UZI7M/7YoQtiiGOOuHEW/G3t6vpEkYaqyp9q72n9vX8O/tEIkd5pc5Z9ViFn13iBUbWIXIM0OetolxBuzs50n/rNHgjT6dMd4sUGSvkLHz0pSMosBcZi+bs6W91ZYaQsn4EHkPSFz0ATkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VR7qwKrp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746200702; x=1777736702;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DdChOKnkUSHLNyR/IOEcgZSRasst5rYXPuKDtQ1ow88=;
  b=VR7qwKrpUq3sye31Ev1EVa+cUEdg2MOcRasUhUn2X5bmC518xI/dmZIt
   PPZggZb9+xQL5deBNyi97LMpdIH6jOyKnQj3ULUAcapONUhYc+0drYJYy
   q4mUA5KERQd/InKgoAPGdmAAoTnioa3Sa9J6fm4HN9k1VXJZRo7h24o/A
   EFMdBza3uQlF0YIyIwWOqu1pNNcAWpn7q69YOJqWJapsCmvwf5mE8Ood8
   l2pS4OGFrVAebwcZ3LJ3JNZOmyb29HqFdWus5BGuDMz0COB8q/iqprhId
   NOvTO+nDC3hkEsvEIEQ50sUuISw7Z+SdyhNMskRxO47vcRbJ4o2NPFcKN
   Q==;
X-CSE-ConnectionGUID: vpL2kI+zRaG5zgISyweXog==
X-CSE-MsgGUID: YeKaoslzQz6cUgaGTxNdUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="50540751"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="50540751"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:45:02 -0700
X-CSE-ConnectionGUID: as25tWUeR+64+nuSggcRKw==
X-CSE-MsgGUID: APNKh0dQTBK5tBeqpPyChw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135178522"
Received: from csteflea-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.252.84])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:45:01 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 3/5] media: intel/ipu6: Change deprecated lock comment
Date: Fri,  2 May 2025 17:44:44 +0200
Message-Id: <20250502154446.88965-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>
References: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pre_streamon_queued is no longer used. The lock now is protecting active
and incoming lists.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index b865428a0fce..844dfda15ab6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -20,10 +20,7 @@ struct ipu6_isys_stream;
 struct ipu6_isys_queue {
 	struct vb2_queue vbq;
 	struct list_head node;
-	/*
-	 * @lock: serialise access to queued and pre_streamon_queued
-	 */
-	spinlock_t lock;
+	spinlock_t lock; /* Protects active and incoming lists */
 	struct list_head active;
 	struct list_head incoming;
 	unsigned int fw_output;
-- 
2.34.1


