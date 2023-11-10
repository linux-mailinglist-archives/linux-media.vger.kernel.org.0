Return-Path: <linux-media+bounces-51-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 331297E7F2E
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E15D4280E75
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDA13E46C;
	Fri, 10 Nov 2023 17:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cr/lJpF1"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140A03D969
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:47:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D219F2509F
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 01:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699609630; x=1731145630;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nsqrPJ3lAv1k2RxcLeIyvBQoOU2K5KHzWdHiSWvWoWw=;
  b=Cr/lJpF1ezRo4udNyzCqX6Pxmr25hAZG6Y9G1IWKfnKgCoJ8hnSeWm+F
   VVJY0usreVZt/XUl6J7IH+Q3Jt0yH6H8O2l2y1UFFBBWxsakQNakqlaDC
   f/kpdBN6YgRzN1LAWzcTabiNB17uVKokoRl+erdWuRof4EMvJeZtgvJd8
   dgb30IkFXdPNG1Qqc/WarLaHCRv6izo9Ih+wbo67mpzQXGE/2SU+CNjmf
   AZWRUxwHtzz9ae6QekFtjOmcs52StpR+eJU0YwQDDQm43efGwGqyc/6XD
   pdWKmXrQQxwCi1IzcYcNHHfxcBYqEglZr2E1sLwgjpV3fkZ0kCDWllfjf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="421253779"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="421253779"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="740114805"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="740114805"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:47:09 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BE70511F7D1;
	Fri, 10 Nov 2023 11:47:05 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH 0/6] Use V4L2 CCI in CCS driver
Date: Fri, 10 Nov 2023 11:46:59 +0200
Message-Id: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set adds a few features to the V4L2 CCI library and makes the CCS
driver use V4L2 CCI.

The additional features are about storing driver specific information in
the CCI registers (besides register address) and obtaining register width
using a convenient V4L2 CCI macro.

Sakari Ailus (6):
  media: v4l: cci: Include linux/bits.h
  media: v4l: cci: Add driver-private bit definitions
  media: v4l: cci: Add macros to obtain register width
  media: ccs: Generate V4L2 CCI compliant register definitions
  media: ccs: Better separate CCS static data access
  media: ccs: Use V4L2 CCI for accessing sensor registers

 .../driver-api/media/drivers/ccs/mk-ccs-regs  |  61 +-
 drivers/media/i2c/ccs/ccs-core.c              |  80 +-
 drivers/media/i2c/ccs/ccs-reg-access.c        | 211 +---
 drivers/media/i2c/ccs/ccs-regs.h              | 904 +++++++++--------
 drivers/media/i2c/ccs/ccs.h                   |   2 +
 drivers/media/i2c/ccs/smiapp-reg-defs.h       | 948 +++++++++---------
 include/media/v4l2-cci.h                      |  10 +
 7 files changed, 1049 insertions(+), 1167 deletions(-)


base-commit: 62bdf633090d684c3ac6d3b46e926c0ac8cef466
-- 
2.39.2


