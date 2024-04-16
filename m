Return-Path: <linux-media+bounces-9555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4B28A74D8
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B657284075
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C644213958F;
	Tue, 16 Apr 2024 19:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKOO9VlK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33F6139568
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296013; cv=none; b=bo8Xkt8R9dd3sBC++cvHnMB34rvUSg64pbeLaSKihILd3StJ/Aymi+YyCgu0KsxiXdmxDEY1/ZLU3jBaCPL3KMPDcve/SEAvJWlVVybRpZ8hL5JU2XcFbZbkxvm7gZWFeG/l4vxaa0A2ckwofemPMx0htBLgyPZDXE2ctxAZBzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296013; c=relaxed/simple;
	bh=llOSAS7hDcYISZYWZPd1KSS9lF5vwC1PTYe6II3BpuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V4KVcuNVL9D2X5UtR12akD6FgMBDX5/iJj4j/2ZUfOAZn0BTHYgskEhA+DPf2EnVW8kqPHqKW6wBC4Thtn20W3IUEZC4Vn0RLHUJuRDWvR13Lg3Z2loFpV0dPzTsZrD75GyGnPHOOtMHkIP0eaQETB3mUlov3FSQEHJJGLLIZFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKOO9VlK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296012; x=1744832012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=llOSAS7hDcYISZYWZPd1KSS9lF5vwC1PTYe6II3BpuY=;
  b=jKOO9VlKPyMVZhdL6nTiXYgi5/Z6w+ldfSLd6vOfth8TIrATupSbvXNE
   QH6GUCsWGF5gR9RehfFISrB4qTfnKqiseatHcRREBAA4/G9BiqntXORLu
   /trt4eCQZQ042mHdEBN+ZQBM2L+HSUQtioBWR0FUDP6tJ72ZxzPHhb4Ro
   jUztXQm/QYpsrnZogEj5Th2hVH5dqOOjzHC3aRGsJO/NCrXtNInErjq2O
   lk6/Tskbg3FPxLAKmj24m6QVWVBVuz3CmS/w1xkRxGyCZdxHcUJpfFXYB
   07LK0ry14Esn4EoHyYUK2AnrHnRDSnm18yrjJSViY57h6whqF24s50v+w
   w==;
X-CSE-ConnectionGUID: hZnqWCSQQrGGOKy1AIAzow==
X-CSE-MsgGUID: bYFjRwg7TKmm2A8C9a1TZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8621193"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8621193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:31 -0700
X-CSE-ConnectionGUID: gkJid1qfSE2H4n3ZTbFIoQ==
X-CSE-MsgGUID: ZhiNg1/LQ+KyMvWJ1fMUsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22430700"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:28 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 318AD12053D;
	Tue, 16 Apr 2024 22:33:25 +0300 (EEST)
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
Subject: [PATCH v9 03/46] media: Documentation: Add "stream" into glossary
Date: Tue, 16 Apr 2024 22:32:36 +0300
Message-Id: <20240416193319.778192-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
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


