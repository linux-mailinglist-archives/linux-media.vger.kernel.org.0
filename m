Return-Path: <linux-media+bounces-33429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DBBAC47F2
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 07:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77CA17A2592
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 05:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4C01F8AC8;
	Tue, 27 May 2025 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkrF+BE/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEC91F5842;
	Tue, 27 May 2025 05:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325417; cv=none; b=mPGAWzZSwYmFyfGXStDgonlj+c/0NqKeZzSM4FnFKrejQnxoJHhsmdL65Tchotl0jNr5uut9sEe199VQnx78W5dYzYZ8caH9m18b2nrmHJH7XkX8iFrcD2nbgOyeah9m8YTsaCW+4AFIkEYV5sGcIUReiyLbZOe/22kLP73BUc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325417; c=relaxed/simple;
	bh=kONUo+8Oo/kgCEOLgiSxnicaTnF9/35ALsbjV6NZi3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dLyeH98PQKDaka+dH/3Ikdq6xKx10CJYkdS3GeAu8+ZlYNP+Oq5oPm2N72//iYpoUSNTJN9cyk3u1rJMvQnpGaIoBNNZBmmhIPyNMH1vklFSndw/fqO0D/LhGqP9f8VnI+qgCsczTAHwmBBPDarLM1+9019Zp8ywKCjMtd42G14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkrF+BE/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748325416; x=1779861416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kONUo+8Oo/kgCEOLgiSxnicaTnF9/35ALsbjV6NZi3M=;
  b=BkrF+BE/5yfsE/l4ZJX4YcahT1bwVM/QB9TywJAfiANgUc6K0/Wi5x9j
   WdzAOoI7b2IiqmmXZzLvwPuIKpV5NVbpQSiApCPHV15Uz94kUphusVNYV
   LTb8SDw/pFZHx8r6+rEJc3Nwe4dGREPbFeQXfeTKAFFu2EcPZuHjD6EA2
   b708soZAb1nh4u4vLDA+V0TEjV6nhJ2qUPsOLCDXurMbEoF1yymfx5nnL
   Ti4ViOKU5E3RDAFVZ5BKloTn6KBrvLfuFcWvQSaYhNtuwVmh78XoT/16x
   0F1B80LMaMRJRhYgaeFK0c5pUl6iGB85wqGP1Jh7/cfKTMXnl0ey2BjQO
   g==;
X-CSE-ConnectionGUID: zQQA38NWTIKVdvvfuiNHeg==
X-CSE-MsgGUID: ibeV6Hf4TkWf2XSbDowRWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67710391"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="67710391"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 22:56:55 -0700
X-CSE-ConnectionGUID: 4y1ByW3nQnWdvIWqx9Ak2Q==
X-CSE-MsgGUID: w9z/vJLfTle1hlYxjUpo6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="147919444"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 22:56:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 58478120324;
	Tue, 27 May 2025 08:56:47 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uJnIv-00275Z-03;
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
Subject: [PATCH v2 2/3] media: uapi: Document IOCTL number assignment
Date: Tue, 27 May 2025 08:56:47 +0300
Message-Id: <20250527055648.503884-3-sakari.ailus@linux.intel.com>
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

Document MC IOCTL number assignment in linux/media.h. In the past the
assignment up to 0x7f was missed so to prevent that from happening again,
document the value here as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/uapi/linux/media.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..2808132fcf49 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -381,6 +381,10 @@ struct media_v2_topology {
  */
 #define MEDIA_REQUEST_IOC_QUEUE		_IO('|',  0x80)
 #define MEDIA_REQUEST_IOC_REINIT	_IO('|',  0x81)
+/*
+ * Don't allocate new IOCTL numbers past 0x8f, MC IOCTL number assignment ends
+ * there!
+ */
 
 #ifndef __KERNEL__
 
-- 
2.39.5


