Return-Path: <linux-media+bounces-9301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B73F8A47BE
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 08:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFC261F22459
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 06:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98046139;
	Mon, 15 Apr 2024 06:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njBDPC2J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF1212B89
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 06:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713161059; cv=none; b=ODJjywrwUBKanxiBWr24GRNsTkzs0YDAdZ7OnOcjnmcup//XxyEfJ8oJrBfzd3RzsKAc8UFam6tKEQRRofOBN1zW/JvWm7iltRB0dGS5PtN8ipUDicF/AUF8iXTrx4TAd+/RsLXMyF+scHVSMhwjoKZXAYhf3gMEVZYDXUHceWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713161059; c=relaxed/simple;
	bh=GpComzv1Z7uiSJyTSjl9cTEmW3hdwWn7rrkYZOCtLew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sYywnJO4jw6HVA3d/9GOW7Ho3IBROM+O/4ojLnP+jDpRla1q8hy1d2iSI8SjepOgmmeLdjM1C6u2aAT5GpZ9EkLuNO+muGk/RsvhLAT++j65ss+MiDVRHEbuFeMyL5zhqvUBdAUnxONmsfuvD59pSH1lbgbknkMnf9o+43eeGpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njBDPC2J; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713161057; x=1744697057;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GpComzv1Z7uiSJyTSjl9cTEmW3hdwWn7rrkYZOCtLew=;
  b=njBDPC2JTXmXh0HlnHSy26My/YNz+1a+wnvOk+dps/MqrxwlxKnG6jW7
   3dUFIaYqFPOfETAb85Ermllq38ns8XSprPXd7JXrve3i/GpLcAsLTHHDo
   +QFDMhskz/SZjdehmvXN/MqR+HF05Zs5XBCG6BhqVfrj3szF5KUthrest
   7VQdlO5tPVj0HgJ1o4FX18T/emXUR3hrUzXFSsH+p+0sdNdMKq7P7xIlF
   qhE+EPQFbdyZwOJD5uMi+NNxMTApsIA+Wokjtljlz13aKjcmWUK6NlTtJ
   yUDlbkpoOzIQyA4CVPiGJFzw1Xm2UJzsAQJooTE7hq4kjWPLO7cjdUc2T
   g==;
X-CSE-ConnectionGUID: eACeOAkfTiK/c5m2shQ+Ug==
X-CSE-MsgGUID: DgYx3gGtTaOIoM/g9lDXqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="19680686"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="19680686"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 23:04:17 -0700
X-CSE-ConnectionGUID: Jo3w6u67T9SF58G6mEELyQ==
X-CSE-MsgGUID: WLnAS5IpR/mrKovlTE1PRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="26484034"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 23:04:16 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1DF8811F8AF;
	Mon, 15 Apr 2024 09:04:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rwFRt-003a2Z-05;
	Mon, 15 Apr 2024 09:04:13 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH 1/1] media: v4l: Guarantee non-NULL return from v4l2_find_nearest_size()
Date: Mon, 15 Apr 2024 09:04:03 +0300
Message-Id: <20240415060403.853515-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Guarantee that v4l2_find_nearest_size() returns a non-NULL value when the
mode array passed to it has non-zero number of entries.

Fixes: 95ce9c28601a ("media: v4l: common: Add a function to obtain best size from a list")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index d34d210908d9..12e8cbe92d7c 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -159,7 +159,7 @@ __v4l2_find_nearest_size(const void *array, size_t array_size,
 			 size_t height_offset, s32 width, s32 height)
 {
 	u32 error, min_error = U32_MAX;
-	const void *best = NULL;
+	const void *best = array;
 	unsigned int i;
 
 	if (!array)
-- 
2.39.2


