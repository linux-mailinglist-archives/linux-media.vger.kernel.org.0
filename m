Return-Path: <linux-media+bounces-6938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CDA87A369
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EE601C218A0
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AC9171AF;
	Wed, 13 Mar 2024 07:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQGrEGMM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD8115EA2
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314729; cv=none; b=gLp9Jp7gZVaRnV6kWZ2u53IkLkat53XfZ/zjKhV9idijbmLDCPkQixl5u+6Rn7jf0vGyx5K1IbysClGtdSUQE2It85vNJK1KwS3E8jV2zEi/Iv2ePns8MzocLegQ4xia+QWxBVOK8Ngumt83Zmp1qjDnU65nCQ3XoIAOEjREllY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314729; c=relaxed/simple;
	bh=l/jZfXH2tVTgL8/Ie1NybefdQQ/2/AiCsyR4KUE/+0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VsMj+tmlTUOjnIPjOcMCE6oxMwHLE41dcOWAnqybQYebdZLa6HpwyGkbVxm3to+KEuoP14kE/lhGBNvrb45RlnWnQ9Kj+b2ypWlNGr0mY083R3FdEr2Hithpqec3PFCDKWz2rDAdYeqONQ3JFmmT2cAdErpmeybLyWoF/R06F4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQGrEGMM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314728; x=1741850728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l/jZfXH2tVTgL8/Ie1NybefdQQ/2/AiCsyR4KUE/+0U=;
  b=NQGrEGMMvu3HsD0/Ne3UxDfkcktasMHAYtDHHaqXmZ/mLog45g4vHhZ4
   Eu7IY3ZdcVf+PYh6dwEvfuUYx6GScPdPnBiJngOLHsejvthMDkjkrNHxk
   JYiStojfZqtxO03kQlPfiUJTxo6pX0rAcefKAchPOg9Q6a51Yzpuzq3yJ
   ECxhHcs5Bj4XbPJVnk8vbZy6eh0sYKcp1Qww9loa/ohlFM/sy90zVc580
   9JhWchkO7eWfBODG1zYFcG2ZGz3h29QF2S5mQ22PQ3rtrfSes5yDCF6Y1
   WhCtKB9HKS/UoLUI6EozLxezSqgxvB/fyJpkALgnsnfFqfVR738gq5DVE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4991137"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4991137"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16414932"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:24 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7F5B51201C3;
	Wed, 13 Mar 2024 09:25:20 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v8 02/38] media: Documentation: Add "stream" into glossary
Date: Wed, 13 Mar 2024 09:24:40 +0200
Message-Id: <20240313072516.241106-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add term "stream" to the glossary of the Media subsystem documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/glossary.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
index 96a360edbf3b..ef0ab601b5bf 100644
--- a/Documentation/userspace-api/media/glossary.rst
+++ b/Documentation/userspace-api/media/glossary.rst
@@ -173,6 +173,12 @@ Glossary
 	An integrated circuit that integrates all components of a computer
 	or other electronic systems.
 
+_media-glossary-stream:
+    Stream
+	A distinct flow of data (image data or metadata) from an initial source
+	to a final sink. The initial source may be e.g. an image sensor and the
+	final sink e.g. a memory buffer.
+
     V4L2 API
 	**V4L2 userspace API**
 
-- 
2.39.2


