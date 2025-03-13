Return-Path: <linux-media+bounces-28126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8416A5F0BB
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCAE17A00F7
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145D2264630;
	Thu, 13 Mar 2025 10:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4efqICJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE9D26462C
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861478; cv=none; b=uIh4LSZKLjrSXoEFRFD7tgE7iZ4I2xOUn7tENIptUIxkxYm8WMOpAoV+SL15AG9M9rX4E04jL5S9Q+gcZraDwVbDj8+FZIgZgD6Ch5X5Ara5d76k8mc9jEmMzI2ABqMmVm1aChoODrtP/hj+wgS9KREL9x0RTAnHNf8LRvqnUCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861478; c=relaxed/simple;
	bh=J7V9/5Tqn9TNpQF+BiJWjLj95F7mcPkkSAkoRi8T/aQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W23bWJSslBkJudaL20YtnDyTNd2HszdWeQFczXmePSLZwZi4hambB9rAIkl0WSBTUfxdBcMilLZmf6UDeYqx73PUa2f1pS+gexJJiSmEwqJN5Y300U6oHSypWtx6ALkli/8bKVGb78Cu+YmahiEzLmdunLdr7xKJH+xHXrud1o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4efqICJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741861477; x=1773397477;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J7V9/5Tqn9TNpQF+BiJWjLj95F7mcPkkSAkoRi8T/aQ=;
  b=X4efqICJF91louj02blO6YIXqJx9nD54DTFXOyOE2wg+/XrsVnDi3Om4
   x5N5YcorD/l2MyL67+gGE2TXScBqPQSOC7Z6ae63emfodUk6T9FTWO0n5
   /7egXPq4Hai9JC/D+RZciWBXoYd8a9ZXd+Qbiy3enJMkfruwd64An3IOM
   UnsrTaYCsDUaBqDDVyNpj3oKGI44+zTYybEB/KwE4pn2BAHMiosEFytmt
   uFFApbiyK5unOJZJ6jaXRuoEs69lpjZ6djddWyLFVbWd2qiXJHGqLEW+o
   0xgZtv2xbXzqoQhKuFDsrXYLsWHUGiwT2WEGwSaj63xI4ecEh1t3ZEc5f
   w==;
X-CSE-ConnectionGUID: 5Y4RQc4nTCmR11dEsCAC5Q==
X-CSE-MsgGUID: Tk/es2VGQ7CyVIAWU9AVSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68325124"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="68325124"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:36 -0700
X-CSE-ConnectionGUID: fWyjpgabR4Gs1ZtnK2Y/EQ==
X-CSE-MsgGUID: JlVHBg3PSQiSZYGKV+3MVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="125984281"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.114])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:35 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 0/5] media: intel/ipu6: Cleanups and small refactor
Date: Thu, 13 Mar 2025 11:24:22 +0100
Message-Id: <20250313102427.131832-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some clenaups and abstract buf ready function away from FW interface
to make it reusable with ipu7.

Stanislaw Gruszka (5):
  media: intel/ipu6: Add missing new line character in error message
  media: intel/ipu6: Make two functions static
  media: intel/ipu6: Use timestamp value directly
  media: intel/ipu6: Abstart buf ready function
  media: intel/ipu6: Remove unused dev field from ipu6_isys_queue

 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 51 ++++++++++---------
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  5 --
 2 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.34.1


