Return-Path: <linux-media+bounces-25121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA61A190D3
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 12:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45EE93A85AC
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 11:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B6E21148F;
	Wed, 22 Jan 2025 11:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ip5Y1iI/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B511ABED7
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737546320; cv=none; b=BVbOUUk8kU16v4Q3QzyMUw/rWaliGwoXu0UB61ryiVCdXsd5pQMI9wx8pWxRoltcszBRKonrYqPJx68cLPMsI47mx+xkKk+x7KxXMmfVPvAhfJK28rMsO6sTWHZWtzPRdvOPyhWzdVPdX/A+wlcNXmetONx5q6wTbrzUaq06My8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737546320; c=relaxed/simple;
	bh=Fv4KYdxxlXOBrkvKjlL/N4WI8UxpMEzW9KaJgHSjCmY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GWABfEm2nbocR1idd/KLFTdtzCAlDqZj8K0t1QQX90K1+guVDM4utmlx3mrZ8nMA3yxOau5nI7srmqjG4cC3ILYjyrpibx0FegJ/QDfAPWigtvgFhv2qNtqP8M/8YBU+kOFw7ORrLFAGuhssjEnwH9Mf65GmHMxg9EYC9gjZli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ip5Y1iI/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737546318; x=1769082318;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Fv4KYdxxlXOBrkvKjlL/N4WI8UxpMEzW9KaJgHSjCmY=;
  b=ip5Y1iI/4De0H9M2UVngfict8xml2+PpKLm9acUVi3ztsqZNHu6vctjl
   OqM2A6IHtX3uNaRhK/THgj9n9SepKuuPAJWzWE8jiIlfXizp8LAv2+zq8
   D/GgstmP8DqivAYlOkKDrTeXTj3hDmTCEQWz0vsTMPdRS73dnXXJBOec7
   xzE63oE05JS9qiMhKxP+nULSJkc1HOkK69mhSFQL1dx0L2aqvaOaKdkY9
   A6OZ64cWqiFa2rimV++XpRA1kWiugOMwEkriV+kiAFj1IEg4rcr2pNmD9
   vtKTwLO3lipncGsUuqk6QA+RB5Jsn30Zz6QNwWPecBbFJoG8ZmkTziQX+
   A==;
X-CSE-ConnectionGUID: QNk1QO5FQwy+RzDR8mmEFw==
X-CSE-MsgGUID: mSCcaYy4Qc+srU5gdDihrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38167405"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="38167405"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 03:45:14 -0800
X-CSE-ConnectionGUID: 5/h4WM9YSuGEh+Dl1TxJdQ==
X-CSE-MsgGUID: i0Y0KmJ/Qx6AKfmvH4bogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="106953650"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 03:45:13 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 42C1911F944;
	Wed, 22 Jan 2025 13:45:11 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1taZAV-006mvU-0Z;
	Wed, 22 Jan 2025 13:45:11 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [yavta PATCH 1/1] Add IPU3_Y10 support
Date: Wed, 22 Jan 2025 13:45:01 +0200
Message-Id: <20250122114501.1618032-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 yavta.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/yavta.c b/yavta.c
index 882603333bcc..c8706df8e047 100644
--- a/yavta.c
+++ b/yavta.c
@@ -358,6 +358,7 @@ static struct v4l2_format_info {
 	{ "IPU3_SGBRG10", V4L2_PIX_FMT_IPU3_SGBRG10, 1 },
 	{ "IPU3_SGRBG10", V4L2_PIX_FMT_IPU3_SGRBG10, 1 },
 	{ "IPU3_SRGGB10", V4L2_PIX_FMT_IPU3_SRGGB10, 1 },
+	{ "IPU3_Y10", V4L2_PIX_FMT_IPU3_Y10, 1 },
 	{ "DV", V4L2_PIX_FMT_DV, 1 },
 	{ "MJPEG", V4L2_PIX_FMT_MJPEG, 1 },
 	{ "MPEG", V4L2_PIX_FMT_MPEG, 1 },
-- 
2.39.5


