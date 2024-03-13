Return-Path: <linux-media+bounces-6944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2785787A372
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D283B1F2230D
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A0518EB2;
	Wed, 13 Mar 2024 07:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDWdXoIU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB20168CD
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314755; cv=none; b=osVZWBq5j87JA9TBtJtTYQT13YyG7nfhK1UkR8VXkDCBOwl2FTCtMvHOJ/AR4X22JPOcBZv2cGkQFe4jWxTOfIhJalVE5GX4QStACqbU0z72jT3BcZJiTCA5sBmuNfzPNl6r1p3QZlsNYEN9H7HVe86LpZRJMc/cBx08dPWcqEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314755; c=relaxed/simple;
	bh=U0kPXLUFWjINvab94UyZ/EQJc8/lRJANylD3wwexS+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YohXzkOG270tYQpnjBYh/4DkkkwN9thz4SVaJ2SbmfWboK08/mzkNYTeXdxlEKLR3L9iVE6IWGEGO/Nf/mqz2c2+LrKzWFJV7Fuo8SONmNLaJdL5cBpFOc6uMfKun6Zjx6uAoluJ2aE6ItPuOqjGd8/jm19q9pUr8HUVp4aTyaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDWdXoIU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314753; x=1741850753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U0kPXLUFWjINvab94UyZ/EQJc8/lRJANylD3wwexS+o=;
  b=GDWdXoIU/PQSYaXUiQ/HGpvbDwWkGtoKGDseAuxgYose4O3SLQxXvOJT
   2VlSkqJTa1OYM8XMuZxyup1Z5Cwl511iYvbQShBPLnBeuDRO3QNaZcRha
   isAFV0vygCo8FIaOSljTqQFScfybLqy8stWeHZ9DC7ogxl4envegt74gX
   fU8crY+28AZgtXkwcip288OSOdHFihrlQ9mMJUYOfDHa1fp2pJ56J2Jkw
   bBTkYBfkg/Tej9IZWLVhiZ8xKAi95Jwhec64B2QVf7T+FYuNZ0dbjFNYJ
   w2CHyaZoJerHGrkm4OhO3ofMj3WaaI7RVuz7O2fWxdNucycm78dPO4xeF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575549"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575549"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816358"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:32 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 85C881201C3;
	Wed, 13 Mar 2024 09:25:28 +0200 (EET)
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
Subject: [PATCH v8 07/38] media: Documentation: Additional streams generally don't harm capture
Date: Wed, 13 Mar 2024 09:24:45 +0200
Message-Id: <20240313072516.241106-8-sakari.ailus@linux.intel.com>
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

Having extra streams on the source end of the link that cannot be captured
by the sink sub-device generally are not an issue, at least not on CSI-2
bus. Still document that there may be hardware specific limitations. For
example on parallel bus this might not work on all cases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index f375b820ab68..a387e8a15b8d 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -529,9 +529,9 @@ the its sink pad and allows to route them individually to one of its source
 pads.
 
 Subdevice drivers that support multiplexed streams are compatible with
-non-multiplexed subdev drivers, but, of course, require a routing configuration
-where the link between those two types of drivers contains only a single
-stream.
+non-multiplexed subdev drivers. However, if the driver at the sink end of a link
+does not support streams, then only the stream 0 on source end may be
+captured. There may be additional hardware specific limitations.
 
 Understanding streams
 ^^^^^^^^^^^^^^^^^^^^^
-- 
2.39.2


