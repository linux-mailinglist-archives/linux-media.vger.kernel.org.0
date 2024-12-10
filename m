Return-Path: <linux-media+bounces-22981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C799EAA25
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 08:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C247A1675AB
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 07:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3DA22E3E3;
	Tue, 10 Dec 2024 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTPrwU1r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BE922ACF4
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 07:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733817556; cv=none; b=FmsemPmXRdwdoguYku4oMcy0vnx25t6MPjgDVtFX6TGbA8WplXo1wlt5nKSNwzjSCrRSFzSiOyX/L7KEeD7mEEObs+AZJc1t/xQzP11qt/bYzz4IPZPqv3ysOU0mn6isOp8A0YUqvie6qNXjUaZTO+qbwyJq17uPZ9DybTMZXXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733817556; c=relaxed/simple;
	bh=RspjEY3uo/iYOMb1L7fkm/Ftg9vEDkTGAwjGqVUdmcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LnuSK9/kB15s08DywXveEmhzLyF8StoJNhjYtpItNdrctAEhHmyX1Lb7VUH+oFLPg1cODtDZWKl5vrBgpTDopLDZXWTbnKRbzNBE4aNi2FAvHSO6P8vbDE77j3HsBTWcbR0jJBiIqODSUMrVIQtQRMmON3rwccTfl+S1psnsSRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTPrwU1r; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733817555; x=1765353555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RspjEY3uo/iYOMb1L7fkm/Ftg9vEDkTGAwjGqVUdmcE=;
  b=iTPrwU1r81i6NRyxVoxP7VpTusGr1QzxQ4oVmPpgh9tvuegVm7dJ4iHq
   mv8k7H4xt+toaZEH1z86pCbw7WDMGnP88u675428tGcHEV63DihRkwXWw
   7KwxL7eUIh3XuTsgVXT2+GEtBPp8CFeDOOBzGAwK1Qof2vP/YwXXWJ46V
   DDr/fmM/WJuArB3ZU3Yz6PMkC8Hhj38qqNQdPwf5WyFLMa7i1EhC6szij
   2GfCuCVDhDFwrMj+4uBD7wKbatFVIUqxXmggAWnYJIvuuQIvt84Nsncdd
   K0XyC1ClyY22B/KWF8hxFeykIXuxz7aHunXRYERZn/oOlqs40qylYnpDV
   w==;
X-CSE-ConnectionGUID: 2H7PNbUUQtWmK4Ssl+D0kA==
X-CSE-MsgGUID: MXscYJM+TzGh3s6TpGxCAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45544632"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="45544632"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:14 -0800
X-CSE-ConnectionGUID: IOQecjV2S42vP09FAcasRQ==
X-CSE-MsgGUID: aFg8CWQ8Rn696i8Yo/CXhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="99808218"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:13 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5B1131206B2;
	Tue, 10 Dec 2024 09:59:10 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v7 3/5] media: Documentation: Update link frequency driver documentation
Date: Tue, 10 Dec 2024 09:59:04 +0200
Message-Id: <20241210075906.609490-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the get_mbus_config() as the means for conveying the link frequency
towards the receiver drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/tx-rx.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index dd09484df1d3..1430c330fd52 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -49,6 +49,10 @@ Link frequency
 The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
 receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
 
+On devices where the link frequency isn't configurable, the link_freq field of
+struct v4l2_mbus_config is recommended over controls for conveying the link
+frequency to the downstream driver in the pipeline.
+
 ``.enable_streams()`` and ``.disable_streams()`` callbacks
 ^^^^^^^^^^^^^^^^^^^^^^^^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.39.5


