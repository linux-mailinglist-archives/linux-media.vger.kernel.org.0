Return-Path: <linux-media+bounces-25463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E24A23D6B
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 13:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA7DC3A8660
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 12:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706441C2309;
	Fri, 31 Jan 2025 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mf31hs0b"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC9114F70;
	Fri, 31 Jan 2025 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738324921; cv=none; b=YK4sLEDe6XenYGgyTklLr6lv6pnmGijaQ771THoYHz33Z6CXx7ZI2l5Vlg50Y3zptO7qIDk7AuD0na4sQ2dzwN2q9d3W/qzKa/WvGEEqydVj9k3NLqPyrtBNTbyFIPXsh+JLcQBQJN7YGhJMWkWsQ1xU+FlbvH7JK2UhBbE/4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738324921; c=relaxed/simple;
	bh=B6EalirYfwiSyHYrmsm+XnJVm308VMZIxIRJBCiHATs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sQ7ipo3FvVzIKNzGn43V7DqkN6cJwLyupKFhBgCqoPmixYPCotf0mYLzi+X0MNXu5W+8DA9eQIhB1yhNbIBptwEG1XwCc8MCs/YQpi/z8vpDD1VoX+WgksNbVcYn5FE1tP3psmqsILGLslv3T0bdib/TGEqAgL0BOgV0iOtXsLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mf31hs0b; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738324920; x=1769860920;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B6EalirYfwiSyHYrmsm+XnJVm308VMZIxIRJBCiHATs=;
  b=mf31hs0bs1losSPGWYfunLKRkYyOkJMaRcrWUdmfO9YHw7KPdP96VZ5G
   DV0GyG2CcbHa4dXu0aIbFTZhI9ntO0tp2yIY3B8RyJj7NJybo8AL+Nf+N
   jS+JfKQAoBjheljmapO51KmIMM/+3tuW0C+6nvg24KPV1p2kBMC/xcKHJ
   6tUOaCenvi3MJClbGK6B0hYEL/e7O++KzM8tE0gFpahAGBOBamhWklfOr
   1qo9dOCVT1RTfF8rx9+aCvtOosMfAwdm5uE2pHUT5Fl3YjfVStvn35ZFs
   t2j5d8sKZ2Xxaa/Zm6jG64cCfajRWW70ZUNWIzftWOtZyg/RidHlCxYN/
   g==;
X-CSE-ConnectionGUID: +YZqZK9iTG2XRTU5tRRbng==
X-CSE-MsgGUID: DZr1yrTEQ5eMdjPHfm5ngQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39050262"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="39050262"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 04:02:00 -0800
X-CSE-ConnectionGUID: 65TMyPC0Qdulzb4CMI8ZOQ==
X-CSE-MsgGUID: 2nBhRk8URaiJCPOC3bsxVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="140498439"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 04:01:58 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7C20B11F7E2;
	Fri, 31 Jan 2025 14:01:53 +0200 (EET)
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
Subject: [PATCH v5 0/3] int3472: Support GPIO con_id based on _HID
Date: Fri, 31 Jan 2025 14:01:49 +0200
Message-Id: <20250131120152.1109476-1-sakari.ailus@linux.intel.com>
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

since v4:

- Split the newly added if () clause into two for better readability in
  int3472_get_func_and_polarity().

Sakari Ailus (3):
  platform/x86: int3472: Use correct type for "polarity", call it
    gpio_flags
  platform/x86: int3472: Call "reset" GPIO "enable" for INT347E
  platform/x86: int3472: Call "func" "con_id" instead

 drivers/platform/x86/intel/int3472/discrete.c | 100 ++++++++++++------
 1 file changed, 70 insertions(+), 30 deletions(-)

-- 
2.39.5


