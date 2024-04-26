Return-Path: <linux-media+bounces-10177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1078B3345
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 469E01F234FD
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C481C13D291;
	Fri, 26 Apr 2024 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmcipGX4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D94213C903
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121448; cv=none; b=JwE4krf15psK1kHU45DpIBe/7Tmw44MzcWeryHlTyzQRRHYl5VkyTdlPhetoM5rX08dl7M+RVRe0eQzYTbFeNbmE5KjkJAL+xLTigOKWBdE6Z0BAJ4WbuXmqJFvt/vXppyYZH9d9EbiFIPKUVCK2BAInsQ+FsOwq3gx4vdex/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121448; c=relaxed/simple;
	bh=L5gyJjmTdCe1rwv2ccnxWiayZxdHhgsZ6mGNe3CfpvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k8ofC/xoGKIsirwgyB+8rGaEDi5uycqb3LrwJMprP88QwbQ51EZ9jqiW6hqeNaC0KwUtgyE0s+QlGUrxcU9F2RRtYKOuKx9ENop9K2eTGRFPkcZuJHgWvyIkVFY5LEfaRIYkAuWA/OzueurAerJMCSs7RVqPvaGNMR+2U189mXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmcipGX4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121447; x=1745657447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L5gyJjmTdCe1rwv2ccnxWiayZxdHhgsZ6mGNe3CfpvQ=;
  b=UmcipGX42fpbOHBDtBQ9g5uqOf7rPxINQc0dX7jRhPyt38afbeVqcspT
   zfDwB4ARTLllJbE8PHDMYY8Nglw3qkL5f5PTLk8kmtk35OK0HkgmqGWde
   9vTKML1je5kywKrXaoAG5yLRcuJRWXO6ZGVGujX6HvAcMrUEbpFqnXm0S
   YN2i3sXiQzbdVT/IrirK8Ihg9RzFnfVI9Bqqf7uWPuFl927RhGLD7DW+z
   PTmlN5JWlILtMd5Uxlltmjy5fkl7e5YS1CEG+MU+pyA9xv35ntPfE3QL/
   zm1Dv6CQDw7c7nNm0dh915dUAwNrvCipOwZCZSCbYJFrqJGtbEdpktABm
   Q==;
X-CSE-ConnectionGUID: 4WU6sgzLQPWAt1CJ5cMo2A==
X-CSE-MsgGUID: DUgMsMvRQa6EQHAgA2xtXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683787"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683787"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:47 -0700
X-CSE-ConnectionGUID: SpRPKlmtROix4D1ScKi3+A==
X-CSE-MsgGUID: otqjub2rQ/ybsaYmqmMB3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598500"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:44 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4EFAB120358;
	Fri, 26 Apr 2024 11:50:41 +0300 (EEST)
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
Subject: [PATCH v3 02/14] media: Documentation: Add "stream" into glossary
Date: Fri, 26 Apr 2024 11:50:26 +0300
Message-Id: <20240426085038.943733-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add term "stream" to the glossary of the Media subsystem documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/userspace-api/media/glossary.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
index 96a360edbf3b..5759f4c78398 100644
--- a/Documentation/userspace-api/media/glossary.rst
+++ b/Documentation/userspace-api/media/glossary.rst
@@ -173,6 +173,11 @@ Glossary
 	An integrated circuit that integrates all components of a computer
 	or other electronic systems.
 
+    Stream
+	A distinct flow of data (image data or metadata) from an initial source
+	to a final sink. The initial source may be e.g. an image sensor and the
+	final sink e.g. a memory buffer.
+
     V4L2 API
 	**V4L2 userspace API**
 
-- 
2.39.2


