Return-Path: <linux-media+bounces-28131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56132A5F0D7
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A9213B625F
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DEF266562;
	Thu, 13 Mar 2025 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joEqwq4V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C171E266578
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861498; cv=none; b=iV1JfqG5C+CxMD9PxjwWaZuzjiM/k7boURqSZxkYky+xJ6L8IxvDYGbxRPfzNzncwSAjbix91t71d5rI9jDlrUqhaP2KMrLWFL6Ox15v/P2ILlx738Y1yDnr5ewPkbjZagcrb6E9Kfp7fepIhJTpbHsQNf9iss7foLu5VWePMW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861498; c=relaxed/simple;
	bh=14TVlruPdITvCYLx/OemBAedB7FJuMut+c8jD3FjWuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PH1uSIKuOrsD7VK8Fs0spSbCRRtPrnyi4Rmo90mx1Al5ptFYqbG/EFW0LZTgTYSWEruE/4thtXzU2be7FyIKrrD9F5cg0DwdqD/CAJk9e9FOuQ8SVq8/fa6WhpLnpYB5i0dnoqvp3yBlZy5U4fjgwhQS0jh4Y53G8pmFTXbIFxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joEqwq4V; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741861497; x=1773397497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=14TVlruPdITvCYLx/OemBAedB7FJuMut+c8jD3FjWuA=;
  b=joEqwq4VewyeoSXLlp9c1dBwoEYhqAcwEWaQxhAFHiFep218dQ4uuZC9
   S/Bg/wFpQdG5HwLgOi2c07qYuxnAYMNpVoCkM89WACoSBd7RtME57qA8C
   rJEq6xRBE0/Be2y+5Sz96W3AziPb7qbIfpxLGtlDVCKs73cwvlRwgBp4g
   QPvW6RSlpbhHTvwn8EIwXT10dWXD+12fFXkpYx9ZT2th3KyrTtPcwamvM
   9BFEoS3jJSt6PbeW4MGRw+GOvbQPuumg4phkf+Rf/efDn/1gXaNu+uri7
   hQj5mm24wbfvCVX6oIiDeYMzOZJFp4AgG8Rqo0EJ8HJ8TjL/rsphtEioJ
   g==;
X-CSE-ConnectionGUID: abLL9xUtTO26XYzzp4C+RQ==
X-CSE-MsgGUID: 09Sn8wtHQTO2hTP7J/PxXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68325153"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="68325153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:56 -0700
X-CSE-ConnectionGUID: jLOhI2pKQZiupvHsZiyj4w==
X-CSE-MsgGUID: BGoJm93xTP2Vmd3rz1jWdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="126100012"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.114])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:55 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 5/5] media: intel/ipu6: Remove unused dev field from ipu6_isys_queue
Date: Thu, 13 Mar 2025 11:24:27 +0100
Message-Id: <20250313102427.131832-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313102427.131832-1-stanislaw.gruszka@linux.intel.com>
References: <20250313102427.131832-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With current code base dev is only writend but never read.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 1 -
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index c7f302df2dcc..dd11eae1eeca 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -841,7 +841,6 @@ int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
 	if (ret)
 		return ret;
 
-	aq->dev = &adev->auxdev.dev;
 	aq->vbq.dev = &adev->isp->pdev->dev;
 	spin_lock_init(&aq->lock);
 	INIT_LIST_HEAD(&aq->active);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index 1a277b0fb4b5..b865428a0fce 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -20,7 +20,6 @@ struct ipu6_isys_stream;
 struct ipu6_isys_queue {
 	struct vb2_queue vbq;
 	struct list_head node;
-	struct device *dev;
 	/*
 	 * @lock: serialise access to queued and pre_streamon_queued
 	 */
-- 
2.34.1


