Return-Path: <linux-media+bounces-5067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5204285315D
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 14:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB09C283A20
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 13:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B775750A91;
	Tue, 13 Feb 2024 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDz8mkOS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D0338DDF
	for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829713; cv=none; b=c4R4vh0XBDz1bhlwRVat30dTPFruKnrd3Fn0udE+Nh/GXAYNaG9Js6mWAGVzMSHL6XT7Z06O/bxD14on/wjX2Td6ST46QE7X7bPAG5aiPkVGqtLY5Ux19gsFLr4AHhmZZKnfbZGbBrXFQFD8njjFuaB7qfbWDbY1c51EUpP8qXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829713; c=relaxed/simple;
	bh=DWPsWvLda2x8XjRkTE/zETU10NY0DevKQQ5lIvIsl60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XSGzr8w7SSVgAIc8qQTy2FJQDZDNadSQ7dNqLEZKDbPXWPLWzWHy22NyrKHjyBzx0VkTUpA7jK8cn0leN3qE7WR4DpDY8MTzeZRWfkILhg7OnINUbuGbZT0wunQUfOy08EUEhTbUrCvMEgg86a4v8FcgzaEDR4wrRe4sR+t7VdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDz8mkOS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707829711; x=1739365711;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DWPsWvLda2x8XjRkTE/zETU10NY0DevKQQ5lIvIsl60=;
  b=lDz8mkOS4GUVLfwJlewTffJqazKsnPQmpnpjJsjT9uknXbJZVtdQB3p8
   NZL9XtFNw8/9Q+0+G3K3qgn2JxHkBj4A5KXw0dlLT7k/mphIXPENm50q+
   iintphyK71fqWOef+JHRqru6auWiwziO6eqlOnJ4K4Qeg8ZzBwu+T2BKW
   rH1VIxrR70F9hsT5GRHmr4xDisQ7pwFiBPjzutUQAtZvrjM6K8sk0MhY4
   7jGAktuHz2BE7V6wGrw6tXRsPYHuaqY2lnifmr6mwB/SIsBYwRCdUxonT
   d5AElHLXjg1BGFlzPhagTZJkXfFdskIcCL7gQ78MefgsjwFZ5cmmXLMRf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1739938"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1739938"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 05:08:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="26061685"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 05:08:20 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 78BE211F853;
	Tue, 13 Feb 2024 15:08:16 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 0/4] IPU bridge improvements for IPU6
Date: Tue, 13 Feb 2024 15:08:11 +0200
Message-Id: <20240213130815.382792-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Here are four simple patches, one to add support for ov01a10 in Dell XPS
9315 and the rest to improve reliability of driver probing on systems with
IVSC.

since v1:

- Instead of sleeping in IPU6 driver probe, instantiate the software nodes
  via IPU bridge init also from MEI CSI driver.

Sakari Ailus (4):
  media: ipu-bridge: Add ov01a10 in Dell XPS 9315
  media: ipu-bridge: Move graph checking to IPU bridge
  media: ipu-bridge: Serialise calls to IPU bridge init
  media: ivsc: csi: Use IPU bridge

 drivers/media/pci/intel/ipu-bridge.c     | 26 ++++++++++++++++++++
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 30 +++---------------------
 drivers/media/pci/intel/ivsc/mei_csi.c   | 20 ++++++++++++++--
 3 files changed, 47 insertions(+), 29 deletions(-)

-- 
2.39.2


