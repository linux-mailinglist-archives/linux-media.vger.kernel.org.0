Return-Path: <linux-media+bounces-238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D47E9D87
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF4BC1F212A1
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466B21D527;
	Mon, 13 Nov 2023 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/zL8P+n"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56E3208AF
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:45:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FE5D4E
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699883104; x=1731419104;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GA33GJjR8SD/E96b9TO9sQNITcadk4ohk+PqnyA8Vos=;
  b=N/zL8P+n2QMteRo+GNohwSXIu/EM5kRfuBqwp9tG54U15wh9S4pi7WH5
   cM3FcQLsYj7SyqmRb/nl4MBaNG+Yz2Qwy2NsUy5GS5DJ84iHLlr2RdJ6+
   NHARpe1cOmigJvGLHOLbO9cKrLBFg3ym6spp6eLfKeAndkSTf34C6ngU8
   I4cZRXpYuR2RK9IbTG21N7FjlCKCClRWF4xiDtKX++OSxNmzuMAEY779a
   zfOtk2CBes+yUdc6tcwVwphxVxZfKMb/Q2iCG+1hJyhMuanDc09/NUBb3
   Q33S/fOn3fkD4Z4qYGeLyfXGKYC1+L5YGIhFq8/NHw2k4IjDCLHlmaWBx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421531256"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="421531256"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793440929"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="793440929"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:02 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2330611F7D1;
	Mon, 13 Nov 2023 15:44:59 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v2 0/6] Use V4L2 CCI in CCS driver
Date: Mon, 13 Nov 2023 15:44:52 +0200
Message-Id: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ccs/ccs-reg-access.c        | 212 +---
 drivers/media/i2c/ccs/ccs-regs.h              | 906 ++++++++---------
 drivers/media/i2c/ccs/ccs.h                   |   2 +
 drivers/media/i2c/ccs/smiapp-reg-defs.h       | 951 +++++++++---------
 drivers/media/v4l2-core/v4l2-cci.c            |   8 +-
 include/media/v4l2-cci.h                      |  11 +
 8 files changed, 1099 insertions(+), 1179 deletions(-)


base-commit: 62bdf633090d684c3ac6d3b46e926c0ac8cef466
-- 
2.39.2


