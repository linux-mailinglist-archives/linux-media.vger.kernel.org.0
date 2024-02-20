Return-Path: <linux-media+bounces-5498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794BB85BCCE
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 14:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB4FC1C212C5
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 13:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD796A02E;
	Tue, 20 Feb 2024 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3KSmHQf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6000F69E06
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708434228; cv=none; b=IljTdoLVbXjpew0UdWmlgGhIMrAIw9H+/skei0CNk0EUWMDOSKyd0/pNk9v6sesokSVQqGx9Bzi3F3K2zGc05G3cPeqPPkujD4egsZ2lD78eOxsbMcDDaRKJF6VT07i4qwqMtcwhMitHOvz1yCtyv5YFXYldTh9dwiBDtLhxtDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708434228; c=relaxed/simple;
	bh=UXeOwJi7Jg8COAxQ7qwF88Nk6l1nCgklb97xMK/SbCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GciSzCMvz+ZqBVvt1BWhKQMGn0A9edldbZ31ypRanVqdRBhK/nF/h4FZug0ir/0X4amt6QD8hItB7EuzRCrXBObfzSgvzzJkxFhjJ+r34oo3Un4CjBL0a87uOMRDQLHtsa8LMOQvfIWWKiB5TyzKEn4ymO3NE8aEXIwXKF1U/90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3KSmHQf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708434227; x=1739970227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UXeOwJi7Jg8COAxQ7qwF88Nk6l1nCgklb97xMK/SbCs=;
  b=C3KSmHQfqMIij/L0bRohqgKBiY7XfSWSM3G2Xm7S3U0RvQRS4AJlrTpB
   pzhv1UAj82rbgKnkRpvYX83F08eYZrqYIrtB3TP7ZzP4GSfhlg1O0dpyS
   0aREJe/6Yx9yROxHfRfV7fWB4OgP21LbedbwtAWhSK1a2IioqofaMXug9
   fg3rPXu5/cCLaFaThXzreJL3VaN2tXyVC/K4i7p7a4XHrKpDAhnQG0+XL
   zhj7Vtiv6fQDW9HXDfVRUY4IlqMP3VbnkGndDhZm5wyz6+Ti/zoTeP2Pw
   hMm7z6DxWoPa+L/jxw9RE3tP9K+K7Er7gilIWrjZUea2eEteJ/GKtr3Oc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13158159"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="13158159"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 05:03:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="827157822"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="827157822"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 05:03:43 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D89E71201C3;
	Tue, 20 Feb 2024 15:03:40 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH 2/3] media: Documentation: v4l: LINK_FREQ can be an INTEGER64 control
Date: Tue, 20 Feb 2024 15:03:38 +0200
Message-Id: <20240220130339.543749-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
References: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a device passes through the video data while still having its own
receiver and transmitter, it can use the same frequency as the upstream
link does. The Intel MEI CSI device is an example of this. An integer menu
control isn't useful in conveying the actual frequency to the receiver in
this case.

Document that the LINK_FREQ control may also be a 64-bit integer control.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index b1c2ab2854af..7a3ccb100e1d 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -22,7 +22,7 @@ Image Process Control IDs
 
 .. _v4l2-cid-link-freq:
 
-``V4L2_CID_LINK_FREQ (integer menu)``
+``V4L2_CID_LINK_FREQ (integer menu or 64-bit integer)``
     The frequency of the data bus (e.g. parallel or CSI-2).
 
 .. _v4l2-cid-pixel-rate:
-- 
2.39.2


