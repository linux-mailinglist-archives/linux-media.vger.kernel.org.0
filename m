Return-Path: <linux-media+bounces-35253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B754AAE0211
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 11:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B13C189F375
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FD6221574;
	Thu, 19 Jun 2025 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHF/HSzp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D35221286
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326758; cv=none; b=aHt6Pu3aq2L405id2U1PUQQZfvIfDg5rTnfU2bjihBxjMg44i1Kn17LBAAyj03L+TmtwcVzfMNkzHeb18LRa2kYGbeX3vEuvP8Z1+uNMj6V4oI479F9dFEe1qpXB9S2LtjOEGFcoFcbtNCeg9l1UKK4o/JzO024zvQUXoM7usyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326758; c=relaxed/simple;
	bh=VCzgHRPEZZLQERNUnjK+55oH5ZJS9u6meB0LzqV4Ie0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YYtgbTXsobxuFQ/40KHDAgi3psgT5zbF0RxcvpSTrIBvUtyH5dHcP8Nprz45VVXFEK+7q1TljgF/SidqW6F8YNRmFNMwWUtMHCqGaMlTCTPwqsoBTQjfoHS6S15Zq1D8GEi0jrSkZOR5/dvZamrQq0p5TSHzndv7Y7obYCLZPeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHF/HSzp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750326756; x=1781862756;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VCzgHRPEZZLQERNUnjK+55oH5ZJS9u6meB0LzqV4Ie0=;
  b=DHF/HSzpOV2usdPbxmyvv7irt7vxakPYqwlPngLYcPmwYYAPvv3SRcGa
   fv6JDlQM4mh+kBH4KG/UoAvTkcvOhUWjtNOndftibLP+hsrD5+j7Ps+Kv
   nXeIv+aaHYnWTZy9uDfZDj//4TY/XxuDbnHvmMjV832pHAQ0Q1cVai4eh
   WtnxeHsMgnuA9Mx29Qfa0UkMblSz8fPsIUZMm5sz52d+9LYDeThf+QPJk
   2Ylc0/ZQzQG5aQhuqssRMbwpV0xrqsp8dMsNqIsZnxyZJKPZe9p6ml0sa
   HL6D2LHFgQjBUviAlNmM6ML7NcV04pL42+rIbt0FDqEUYME7WS2Wdv1tM
   w==;
X-CSE-ConnectionGUID: rOdVijUvQAapM+ZTz9rg8Q==
X-CSE-MsgGUID: 1vYlEd2DQ9eyTMqFdNWAwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="40185112"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="40185112"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 02:52:32 -0700
X-CSE-ConnectionGUID: SbVnmYTVQuy/HsVwSHh+dA==
X-CSE-MsgGUID: aSJmGH0iS6WSdTVk2JDTjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150037998"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 02:52:32 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0537411F91E;
	Thu, 19 Jun 2025 12:52:28 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSBwZ-0088SK-2w;
	Thu, 19 Jun 2025 12:52:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 0/3] Control handler free changes
Date: Thu, 19 Jun 2025 12:52:24 +0300
Message-Id: <20250619095227.1939114-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set changes the control handler's error code handing when the handler
is free and documents it.

since v1:

- Added the Fixes: / Cc: stable tags.

- Added two patches to return the handler's error and document the error
  isn't changed when the handler is freed.

Sakari Ailus (3):
  media: v4l2-ctrls: Don't reset handler's error in
    v4l2_ctrl_handler_free()
  media: v4l2-ctrls: Return the handler's error in
    v4l2_ctrl_handler_free()
  media: Documentation: Document new v4l2_ctrl_handler_free() behaviour

 Documentation/driver-api/media/v4l2-controls.rst | 9 +++------
 drivers/media/v4l2-core/v4l2-ctrls-core.c        | 7 ++++---
 include/media/v4l2-ctrls.h                       | 7 +++++--
 3 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.39.5


