Return-Path: <linux-media+bounces-25808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E747A2C3EB
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 14:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0014C163667
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 13:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DE31F5615;
	Fri,  7 Feb 2025 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgVEz2LE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0B61F4196;
	Fri,  7 Feb 2025 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935694; cv=none; b=j7JNXtkbx5s1f4wxFQ/HKDOk314Pybj7c/h7lrM44+lZt76rXQ59iwhd7u/lK1/s2ZZ5bbux9J+egmeSWvfUdzGMvAQDUN83CQU5iX2AI+3ufv7OHGP5sUbPWhqAggmSudWJexqa7x1xAIQhGqe5QkOd+ahn9e0JTBSWzM/OZyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935694; c=relaxed/simple;
	bh=v0h29GVxB3ysMUMfKgQu8n60ZttZaCsSX6W7o5T2hBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e0M4KCcliH/1Md+4OcYfvGHtWn64zn1o6zRLULh3AiLmSk9X116OSNpWqAZKJ7sT2amrbGXdB2C1QzLufqioBo1f4t6aeq++D4CxsvxK/2z45XLVmO/5PNyFJXsHxWvsunFnfQwmhjui///aaDnMaq04Rp2Z8AANj1ilgXGdoT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgVEz2LE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738935693; x=1770471693;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v0h29GVxB3ysMUMfKgQu8n60ZttZaCsSX6W7o5T2hBQ=;
  b=XgVEz2LE5M+SEGeTeBrweVbwp81kKWy0M1/W/UJaYO36JF7H175+n+ql
   nDwLdGJxFnxg7m+6jWZI9+BvwNHTAOuaiYdzyCQHbiDjak9I65EdMwu9V
   HBMpQrZRJ+8ljN9dY9LgqEpiXufEG9OFuyaAtrZqEI4k6/pSlfLsGEBQi
   9+Qbt17aqYWFBWW0cht/xnMRyKkYqbwAHzFlU4XZZlBVAoWGTsUoypMPa
   3EFL3cHb+eVOfA/WWrdMZZxnHpNGgll0zsmBIwuMQSDJuFdw36DXVFCR1
   FnXgA+3NOtyLgNhlBpVdqVJmxOxomQnxazwmsKf02lg5j706qblgPEig7
   A==;
X-CSE-ConnectionGUID: iBmvhvbfSwm77Zao/OVHIg==
X-CSE-MsgGUID: x06+abJ5TQekqUNHliXX8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42416934"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="42416934"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:41:32 -0800
X-CSE-ConnectionGUID: RKCoKrSARb+mk2w8I5mdRg==
X-CSE-MsgGUID: /SvIlFbQRVG30lH9dJ86qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="112040281"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:41:30 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 97D8E1202DE;
	Fri,  7 Feb 2025 15:41:26 +0200 (EET)
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
Subject: [PATCH v6 0/3] int3472: Support GPIO con_id based on _HID
Date: Fri,  7 Feb 2025 15:41:23 +0200
Message-Id: <20250207134126.1769183-1-sakari.ailus@linux.intel.com>
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

since v5:

- Add a comment to the GPIO mapping code.

- Align ternary operator conditionals right of "= " on the previous line.

Sakari Ailus (3):
  platform/x86: int3472: Use correct type for "polarity", call it
    gpio_flags
  platform/x86: int3472: Call "reset" GPIO "enable" for INT347E
  platform/x86: int3472: Call "func" "con_id" instead

 drivers/platform/x86/intel/int3472/discrete.c | 105 +++++++++++++-----
 1 file changed, 75 insertions(+), 30 deletions(-)

-- 
2.39.5


