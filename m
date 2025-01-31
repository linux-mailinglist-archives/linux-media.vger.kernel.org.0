Return-Path: <linux-media+bounces-25445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D5EA23A33
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 08:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2832F168F5C
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 07:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C34154425;
	Fri, 31 Jan 2025 07:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsJaXJFp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC646EED8;
	Fri, 31 Jan 2025 07:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738309038; cv=none; b=gzTCryVba66FWtZVVAzpQOnTFeV9XhEYLwmpLwdFUrVQ2Y8gzfeltYH6qf3tejzBGCBoeL9JaoJl4gQjQ1glqMIOdK7/o14tSYG2/t3wII+ZarDuZfpG9Ux8vDRLhpDVC+Gf3VajBGoArvH8DrX9nTYn99kZxyYuVen8Hh2zPSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738309038; c=relaxed/simple;
	bh=WFlXjacSq62HCl6AdYrRCHYFlrNhbYaesVja6hAXKbs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kF7AiTgwRoc7O9pWxdSlrGWtCe1lkmAXG2FkGDHaStgnow7SgjufbcYZDLIcKPMcsYEHu4hv/9IujZNDZJmeIw+4lpWAwgP/iUAUkXKwpGzIku5q3Jt3g8zHmvepCIFRZVEyN8Qb4RWdye7B2PpbI+Wb9Ii9RbAHycYG4E+WTU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsJaXJFp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738309036; x=1769845036;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WFlXjacSq62HCl6AdYrRCHYFlrNhbYaesVja6hAXKbs=;
  b=OsJaXJFptY6UvocT4UzM2KfzDuFLl0GiSq9iVPR3okebfJxAqR1VJ4uO
   dIZ2DZAT+k6sBVYKREj1Gj40DzjOdLUnHLFhTBmwHYNgPw787Rw86aE8Z
   IOPkRTMXsu8AZlXJFVkExLYYV9vpQ0O85uCqyV4vbLw/ZEReMft9UJPXY
   aJkqrsICmRT7xJp+mD+wtgvFkvUNRhhau7ttaxCeREIxVoUq5GC4PrOZ/
   pCaAiL5F2riLFaPDpIZO0E1tmO56tsM7qQTtnW/PMZgAd2ICXgdkBXtDP
   Tc2d8xUjtbayGHot8t0SEDE8mqRxgyaLhTvTTs5t2WeqHDF0lA9OSpB2k
   w==;
X-CSE-ConnectionGUID: KiiGeBDzSkSZP/LwuRcy0g==
X-CSE-MsgGUID: stHa0AYiTCWzIGRorZipdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="26481233"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="26481233"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 23:37:15 -0800
X-CSE-ConnectionGUID: bLg2Wjy7QyeZEyogP5akrw==
X-CSE-MsgGUID: DUDbzl38RFWeVu2XbXlc7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132821477"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 23:37:13 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 40ECD11F88A;
	Fri, 31 Jan 2025 09:37:09 +0200 (EET)
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
Subject: [PATCH v4 0/3] int3472: Support GPIO con_id based on _HID
Date: Fri, 31 Jan 2025 09:37:04 +0200
Message-Id: <20250131073707.1082931-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

One patch turned into a set, the second patch being the original one.

since v3:

- Add a patch (first one) to switch to unsigned long type for polarity
  field and renames it as gpio_flags.

- Use a polarity_low boolean field for indicating the GPIO polarity. This
  is turned to gpio_flags in int3472_get_con_id_and_polarity().

- Put the new polarity_low bool field next to the u8's for better struct
  packing.

- Add a patch (last one) to rename "func" as "con_id" which is used
  throughout the GPIO framework.

Sakari Ailus (3):
  platform/x86: int3472: Use correct type for "polarity", call it
    gpio_flags
  platform/x86: int3472: Call "reset" GPIO "enable" for INT347E
  platform/x86: int3472: Call "func" "con_id" instead

 drivers/platform/x86/intel/int3472/discrete.c | 98 +++++++++++++------
 1 file changed, 68 insertions(+), 30 deletions(-)

-- 
2.39.5


