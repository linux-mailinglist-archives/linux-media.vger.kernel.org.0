Return-Path: <linux-media+bounces-1824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2271280875A
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E4E1C21B06
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D156539AEC;
	Thu,  7 Dec 2023 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4WllaiE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9411AD
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701950958; x=1733486958;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9fOFYktSFQg47ljnZ75PuhLhMyM1zHo/i9jIWI/82cg=;
  b=I4WllaiEgCo0Gq2FNeEOuqK1OF20HtgOscOIZvsRLphMaIk/jzg6M+Bm
   736g0eiLKi5FmPhQIUYKpKHrVZDszPI2s3fmW6jJa1YZ4iik0hfP+UMJW
   70aqecJsiPHa13hNgXxU5AOgDz3DYxyG/8SwFUvtvc7MGh92EuiKVo8cn
   T3tl9xfnRGkMogNS7s2DHkdFQE5ibdCi1fMM9r12fuI5pdstsf6C75yVm
   47dZ4b4fHUuX85mZk28UotvciJr4n5G550aI4L+SkPE0yLPF5jTMfezAa
   Cs9RDDG0Td05gUQm2rGRs9lFKoSOBxRF9aAi5XsuWNPpBLyhaq60pqfKv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373707142"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="373707142"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="19684493"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:09:16 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DB0FA11FB50;
	Thu,  7 Dec 2023 14:09:12 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: [PATCH 0/6] Old non-MC-aware drivers have no sub-device state
Date: Thu,  7 Dec 2023 14:09:06 +0200
Message-Id: <20231207120912.270716-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set replaces the earlier attempt to fix non-MC-aware sub-device
drivers that still use the set_fmt and similar sub-device ops. These
drivers have been converted from the olf set_fmt etc. video ops.

The issue here is that the caller does not initialise the full sub-device
state so the sd field of struct v4l2_subdev_state is NULL, leading
currently to NULL pointer dereference, even if the code compiles. This was
not the case before commit fd17e3a9a7886ec949ce269a396b67875b51ff45 .

Even then, there's no need to access the sub-device state as the format
(or selection rectangle) won't be stored for a longer period of time: the
caller (saa7134 driver) simply uses the original configuration to obtain
the changed value.

This patchset does not address similar issues in the ov6650 driver.

Sakari Ailus (6):
  media: saa6752hs: Don't set format in sub-device state
  media: adv7183: Don't set format in sub-device state
  media: mt9t112: Don't set format in sub-device state
  media: rj54n1cb0c: Don't set format in sub-device state
  media: tw9910: Don't set format in sub-device state
  media: ov9640: Don't set format in sub-device state

 drivers/media/i2c/adv7183.c    | 2 --
 drivers/media/i2c/mt9t112.c    | 1 -
 drivers/media/i2c/ov9640.c     | 2 --
 drivers/media/i2c/rj54n1cb0c.c | 4 +---
 drivers/media/i2c/saa6752hs.c  | 4 +---
 drivers/media/i2c/tw9910.c     | 2 --
 6 files changed, 2 insertions(+), 13 deletions(-)

-- 
2.39.2


