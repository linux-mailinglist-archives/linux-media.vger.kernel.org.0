Return-Path: <linux-media+bounces-33369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F088AC3E72
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AA51169B46
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 11:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCEA1FC104;
	Mon, 26 May 2025 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6A4FA0/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4C51F75A6;
	Mon, 26 May 2025 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748258263; cv=none; b=jPgbElGgazTDn4YoSRWmdy/Z8yRLBDuG2KHeATAHz3r8TZj1lPwB69tFdIcEXYcaf5IG7ZSmuM1oq/3Tym3ND7OG4s9dqypiK2tJTsKCnx2KXQC5z5s0BXqIORLw2wIFygaInwc5xpdLcVO165EDln1z3RXt6UDtvCRubkLZsjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748258263; c=relaxed/simple;
	bh=m8YQVofkJCtwe20yeLll70xpn3T43Wc4zSl6gncAeOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ngvhRNNu1IwMEcVTeZ0jOAn/1cXKrmrk2xXssXoVFy5knFpo/NWv93FiRKFCiS5H1GRw7L3U5HgNKCYghJ4DHbnb/Scvj8fqYzrLBL92JH8ghqO2TV0BiPFS61jGuudhZmIMettAwCdJbzSWjUOa4Gz5HucuXC5TXAfv2KMXWQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6A4FA0/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748258262; x=1779794262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m8YQVofkJCtwe20yeLll70xpn3T43Wc4zSl6gncAeOI=;
  b=M6A4FA0/VvkG7RT1UrreLy7w6qUr78ccAEnIFutU8GbCZxIVAVLotVXH
   6TFStSRq7Z4or4I5iIMc5WOunpyc3iEWJ2SsVzH6Z81cbLS4k5krLBBhE
   oNRvCZWVRq+RJsRAC3Y+uDjeGF+2PrYvVozduEBU25iYG8yNoLh1/WqM2
   ChuJsMaCx9gKWv3itTU5dmhZ17jO0b2vtX+MetkPhZyzFWYo7aqFmj0Qm
   bgyZmGOjkABxRUT+Lw4/OwOeqHFCluijlEaV7w7hn01ONjEvr3l9KJYuI
   vublpa7bFTdYSLIV/LeKk70kBJj1xBul9Q/JEf0CUBQbdds/0cYGGNO0a
   w==;
X-CSE-ConnectionGUID: tDMKyG+zSPKiL/ybljjD7A==
X-CSE-MsgGUID: wnK7a0GSShGWvtiqkQO6LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="49935373"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="49935373"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 04:17:39 -0700
X-CSE-ConnectionGUID: upL2KudERTeStd7qkOas0w==
X-CSE-MsgGUID: SCCraYAhSlecBQ5miMJAfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="142273288"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.125])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 04:17:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C26C211F743;
	Mon, 26 May 2025 14:17:32 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uJVpk-0022ku-2O;
	Mon, 26 May 2025 14:17:32 +0300
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
Subject: [PATCH 2/2] media: uapi: Document IOCTL number assignment
Date: Mon, 26 May 2025 14:17:32 +0300
Message-Id: <20250526111732.487229-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250526111732.487229-1-sakari.ailus@linux.intel.com>
References: <20250526111732.487229-1-sakari.ailus@linux.intel.com>
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


