Return-Path: <linux-media+bounces-319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 487307EACF4
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 10:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1F821F237C9
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 09:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EE0168C8;
	Tue, 14 Nov 2023 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJewKk18"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6774168A4
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 09:25:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A971130
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 01:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699953916; x=1731489916;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LBNxLgXKhXkujXdM89274y2xRr6ODZiq+8/IgAXZ0MM=;
  b=GJewKk18ynYs5k1qFvJ+zw4BA3V7dBnnO4jCGKqArPFxenOJYalSX3Px
   +9UY7kB1qrAvIko4m8JH2rHaUce2ydqTc9GEhzd2LHmNxOivK0bHTgBTe
   qWG+0d3LkJMKUBOEMoaDbH6Bpw8RLRA0gyjF8GDf5IfXUWXnTy34QXGAr
   R6oFMoJpAEL+eNfD4uWpnoOTv26wdhh0Hl4RE5zcW+PlrDsTJlERM1Ry1
   zhu+ZeAFitgei0iZdTDaHbPykdGTZUw2wvVnt4AiW4Jvx0MESFzuEGGBY
   d1GLDwBm8DQWfc/kXtyi27e1Q6fD7Rbd8sP/GhO1e9S7qbtM5/lHp+1zg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387781653"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="387781653"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938015854"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="938015854"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:14 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6AB6E11F7D1;
	Tue, 14 Nov 2023 11:25:11 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v4 0/6] Use V4L2 CCI in CCS driver
Date: Tue, 14 Nov 2023 11:25:04 +0200
Message-Id: <20231114092510.1443545-1-sakari.ailus@linux.intel.com>
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
the CCI registers (besides register address) and obtaining register
address and width using convenient V4L2 CCI macros.

since v3:

- Drop unintended changes to make newly added macros in v4l2-cci.h signed
  again.

since v2:

- Rename CCS static data read-only register access function.

- Fix ccs-regs.h generation to include all changes in the 4th patch (some
  had slipped into the 5th).

since v1:

- Fix two SMIAPP register definitions using misspelled CCI macro names.

- Add macros using FIELD_GET() to obtain CCI register address and width,
  use the macros in V4L2 CCI.

- Use _SHIFT and _MASK for private register range.

- Check CCS driver's private flags only cover driver-private bits of the
  CCI register definition, using  BUILD_BUG_ON().

- Fix CCS CCI register macro generation (register address vs. flag vs.
  array indices).

- Use a nicer way to check for the guardian value in the limit array, i.e.
  don't pass the value unconditionally to CCI_REG_WIDTH_BYTES().

- Include linux/bits.h and media/v4l2-cci.h in smiapp-reg-defs.h.

- Improve commit message of the  CCS static data register access function
  rename patch.

Sakari Ailus (6):
  media: v4l: cci: Include linux/bits.h
  media: v4l: cci: Add driver-private bit definitions
  media: v4l: cci: Add macros to obtain register width and address
  media: ccs: Generate V4L2 CCI compliant register definitions
  media: ccs: Better separate CCS static data access
  media: ccs: Use V4L2 CCI for accessing sensor registers

 .../driver-api/media/drivers/ccs/mk-ccs-regs  | 104 +-
 drivers/media/i2c/ccs/ccs-core.c              |  84 +-
 drivers/media/i2c/ccs/ccs-reg-access.c        | 213 +---
 drivers/media/i2c/ccs/ccs-regs.h              | 906 ++++++++---------
 drivers/media/i2c/ccs/ccs.h                   |   2 +
 drivers/media/i2c/ccs/smiapp-reg-defs.h       | 951 +++++++++---------
 drivers/media/v4l2-core/v4l2-cci.c            |   8 +-
 include/media/v4l2-cci.h                      |  11 +
 8 files changed, 1100 insertions(+), 1179 deletions(-)


base-commit: 62bdf633090d684c3ac6d3b46e926c0ac8cef466
-- 
2.39.2


