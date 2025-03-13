Return-Path: <linux-media+bounces-28123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9ADA5F06D
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5277317B815
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5869A1FBCA6;
	Thu, 13 Mar 2025 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWSnxAQS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D4C264630
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861075; cv=none; b=aQbKQnEERqCdCgj/NTy2ajfrT0AjIWyAUujLDU1Dvaph61+K+zIM0K/hOdaKrHLMy+mttADLXv4YN/YuZkaDP++gkNHCeJgQGuK91iT/fGFN4oVSKwf1iZnGYlHOAH8tcKpPmhUiV4i9Imd6AGy54jy2725jQs8AB2TeOJF1J4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861075; c=relaxed/simple;
	bh=7P40b1sMECSGgLNwTax97WcROk49V7Ejaqzj+d4qmno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GkUR8Ez9StCKCsJWl6YzRzcONc9YcKQt5DwZV6I3oF7HsijcUo1Y10woqTNkmV4XsZDx3EkDYx44KkRQlr+NTTAY0jseM/SeRxjGH3a6unea32XgI3D18RhBEPTS8k12KmjgKp4RdAMtDLgTvqZ5IOiImE5KOEvKj+w8r7Cp1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWSnxAQS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741861074; x=1773397074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7P40b1sMECSGgLNwTax97WcROk49V7Ejaqzj+d4qmno=;
  b=MWSnxAQSeW2y7MJkUowrMIbTCSp8k+xTssXQEyQJvVGYYIVXUNCA0zap
   Hbp3pZnvL+VqlmjrFjyf7KDBDQmBYb2uc1C+4tb15ZDXPtJN8bMt6Tbph
   pOhn2mXvR/kRlT3+v46n+b29Qap8tPjx59W4+zYylElebolxBkwuwABCg
   IBubaestrrK9bkmJNZXwDk7ZG6q6ykn0FJDS58q6MppuWqvGHtUU/H6jd
   XhuybPk4HztN2Os9550i1p4CnuEmCtsIge/MkqoksKEqL07wpCdCypjZ+
   0ykkUadUqWdaEwuObihF8EHM1wDNe/W7XREBgitQY1YqSh+kkWaMRvDrb
   A==;
X-CSE-ConnectionGUID: KdJ/Tg5nSKKPqZcPCZOFRw==
X-CSE-MsgGUID: kg/oOOoxSYC8/MI4MzCi5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68324598"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="68324598"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:17:52 -0700
X-CSE-ConnectionGUID: P792BxmpRdCoX5QyWVZVYg==
X-CSE-MsgGUID: P944Jz/DTN+xtzicfnT3ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="125983377"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.114])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:17:51 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/3] media: intel/ipu6: Remove unused IPU6_BUS_NAME
Date: Thu, 13 Mar 2025 11:17:42 +0100
Message-Id: <20250313101744.128564-2-stanislaw.gruszka@linux.intel.com>
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

Remove unused define.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-bus.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.h b/drivers/media/pci/intel/ipu6/ipu6-bus.h
index bb4926dfdf08..ebf470806a74 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-bus.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
@@ -15,8 +15,6 @@
 struct firmware;
 struct pci_dev;
 
-#define IPU6_BUS_NAME	IPU6_NAME "-bus"
-
 struct ipu6_buttress_ctrl;
 
 struct ipu6_bus_device {
-- 
2.34.1


