Return-Path: <linux-media+bounces-33432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBFDAC47FA
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 07:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B83A3B0859
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 05:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D991201270;
	Tue, 27 May 2025 05:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezQiZqmQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE8B1F9A8B;
	Tue, 27 May 2025 05:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325420; cv=none; b=IkcUbmMm47/6bPGyiK7dDxus7nNjK75tNqdjoamwa1lVrp8764kboGHIMMsGKBFE1tb3GQFXL5NOCtxf0gz9UP6Z5e0picaFv/xJR+jZqcmHhUWOhL6Jr7sHW8j29dWhXL6kcHIfLTelS3nyckNKACXj6BiG7gbyLBDj1Iv9MAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325420; c=relaxed/simple;
	bh=wCJ0KmxrLDiZr6YbKmg2teoSaVXP8sPeXKgkaeD9Tkg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q2CeuXjlTqa7sNbcD+CkEs+nJ/SRvIfP9Rq8/g9GNTi9w3mrxFIg0bEE3Zcj5lN2dIcGMQGQRMNstxKteYzVkLjnsd3MJNHmKHllqWwBfIi77Iu/ty0GYzpR44WYXRDz1fB0gOhtCHR8Pew1L2C5JqDWMFyCeMnmjiLava9uN8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezQiZqmQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748325419; x=1779861419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wCJ0KmxrLDiZr6YbKmg2teoSaVXP8sPeXKgkaeD9Tkg=;
  b=ezQiZqmQDFMUsqYAif1yW4Q/GwED/mTYIl0UOcyN5XXPsQxNV4P6CQFC
   ID5GxWL54N/oGPC1mCbhorH62MyUfrPlB06xKrGAG/r9Mg7/vouQ8aQZr
   fwKvH43W9u6mQbEoOhyWQ+1G01KR/H0Wo58wgP33LUrE+gDp0iMk5Mt67
   G5MAeqkM6igbvMjfFimg51ZRxJXOiuqjgO8sk6xWvYEdl0Dtfby/dX8K+
   9+e2i/TjrTo978DrZsNDjTYoZZe+9hgsuDxYK1FG9E7y1QUfs2e3pGAFa
   lHDc/h9r0iliaF4CZQHmh+0V825bUPvgLSvw6qdFiDfNR0VHEghoyrZJv
   A==;
X-CSE-ConnectionGUID: fMXgX5e2SySPB0tCwOdGwQ==
X-CSE-MsgGUID: c142Y1xQSfSVxbjbZaY5oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67710414"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="67710414"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 22:56:55 -0700
X-CSE-ConnectionGUID: H/WMSj6iT+qXKjWJeJjycw==
X-CSE-MsgGUID: MyEU+cv5QFyX1HqrLVdDYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="147919450"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 22:56:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5A84F12033D;
	Tue, 27 May 2025 08:56:47 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uJnIv-00275d-07;
	Tue, 27 May 2025 08:56:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Akshay Gupta <akshay.gupta@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 3/3] samples: rust_misc_device: Bump IOCTL numbers
Date: Tue, 27 May 2025 08:56:48 +0300
Message-Id: <20250527055648.503884-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250527055648.503884-1-sakari.ailus@linux.intel.com>
References: <20250527055648.503884-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 0x90 as the IOCTL number base instead of 0x80, thus avoiding using the
same IOCTL numbers as the Media Controller. The change is also in line
with current IOCTL number documentation.

Also use 0xaf, belonging to the samples IOCTL number range, as the
unimplemented IOCTL.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 samples/rust/rust_misc_device.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index c881fd6dbd08..2bd017d7c7c3 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -14,10 +14,10 @@
 //! #include <unistd.h>
 //! #include <sys/ioctl.h>
 //!
-//! #define RUST_MISC_DEV_FAIL _IO('|', 0)
-//! #define RUST_MISC_DEV_HELLO _IO('|', 0x80)
-//! #define RUST_MISC_DEV_GET_VALUE _IOR('|', 0x81, int)
-//! #define RUST_MISC_DEV_SET_VALUE _IOW('|', 0x82, int)
+//! #define RUST_MISC_DEV_FAIL _IO('|', 0xaf)
+//! #define RUST_MISC_DEV_HELLO _IO('|', 0x90)
+//! #define RUST_MISC_DEV_GET_VALUE _IOR('|', 0x91, int)
+//! #define RUST_MISC_DEV_SET_VALUE _IOW('|', 0x92, int)
 //!
 //! int main() {
 //!   int value, new_value;
@@ -110,9 +110,9 @@
     uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
 };
 
-const RUST_MISC_DEV_HELLO: u32 = _IO('|' as u32, 0x80);
-const RUST_MISC_DEV_GET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x81);
-const RUST_MISC_DEV_SET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x82);
+const RUST_MISC_DEV_HELLO: u32 = _IO('|' as u32, 0x90);
+const RUST_MISC_DEV_GET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x91);
+const RUST_MISC_DEV_SET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x92);
 
 module! {
     type: RustMiscDeviceModule,
-- 
2.39.5


