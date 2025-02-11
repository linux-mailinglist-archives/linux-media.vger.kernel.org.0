Return-Path: <linux-media+bounces-25982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20EA30478
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 08:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B18416668A
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 07:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40EA1EBFE1;
	Tue, 11 Feb 2025 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUMgI7At"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC7D1EB9F4;
	Tue, 11 Feb 2025 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739258935; cv=none; b=NI7Na+qjij1WTSFXS+ZmRWxgbe1YUKZ/yY7RqUgak96RXu+j/da0PWI+WjDmKpDUKGPwmYGo4fyRXpe1mBphdpYnRxv7qOA/F/AglwuhP6gYr5l7nK0ahAuRtlH/3J9DrX+e+DKKnNmcvRaE1LrEwkemOVDRrciIGyXt23/Mx+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739258935; c=relaxed/simple;
	bh=dHcsq92/2DclvmgXPQM04Jjv3sq2oMWvLWLfE1lhLyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BMLGN0N5MpY//Oa1S1QsvjdIMTtkINjqRVuwyJovzW4DYNsWu3XzyvJPGRIy6vlPXLRTAyQ8MPbY08UZNPjM0MxZmAydkL6gdHimrg/XBySgrYkj8YEFSv/8bQ4nRS3Xy6gKOGWWDN9i06XZA7/80ZZxv/tNdKdcbq+5zDh73t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUMgI7At; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739258934; x=1770794934;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dHcsq92/2DclvmgXPQM04Jjv3sq2oMWvLWLfE1lhLyk=;
  b=OUMgI7At9crjz5TzzEinNgeF5+Kfo3D2ueZZSAOnWkDU4k0i5HXcMu6N
   XzIkkAFvR4qSY0NQ2lD6QHU9Wy2+e+fp9esZ2LNlMpHHxkkVe2BanSKrS
   0pLDHrchoxWgxCCiAX6bl137TRzvi+z8pOlbA5WAvTmXEFU9FCezPBIf5
   u1S7g2oRuMpWVsWQkHKFt9XtMPiw5HQBL3XmUIDB27pQh38dpHputROlz
   IBPBuWeUO4joYRQvKyOjo7x3jX0FIPUPct+zxZ2Iku+bXXvfjpF3shYAC
   fuDGqkjDI6aCE0P2QR/1nK5Badhb718Waxp2pomUhfzyVUXT/dxBgGQCd
   Q==;
X-CSE-ConnectionGUID: k4BAiELYT/a1CaY3NV9s+Q==
X-CSE-MsgGUID: nbsje1T/RiWP0eCSAXb1fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50498296"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="50498296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 23:28:52 -0800
X-CSE-ConnectionGUID: VmnNgNtAS7uFIwM6wpPzMg==
X-CSE-MsgGUID: piFVcFLNTp+I0iK9yCrlfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="112193888"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 23:28:50 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7581711F7E8;
	Tue, 11 Feb 2025 09:28:45 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: [PATCH v7 0/3] int3472: Support GPIO con_id based on _HID
Date: Tue, 11 Feb 2025 09:28:38 +0200
Message-Id: <20250211072841.7713-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One patch turned into a set, the second patch being the original one.

since v6:

- Reword the comment regarding GPIO map processing.

Sakari Ailus (3):
  platform/x86: int3472: Use correct type for "polarity", call it
    gpio_flags
  platform/x86: int3472: Call "reset" GPIO "enable" for INT347E
  platform/x86: int3472: Call "func" "con_id" instead

 drivers/platform/x86/intel/int3472/discrete.c | 105 +++++++++++++-----
 1 file changed, 75 insertions(+), 30 deletions(-)

-- 
2.39.5


