Return-Path: <linux-media+bounces-10008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA128B0934
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F13A1F22EDB
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 12:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A3D15ADBD;
	Wed, 24 Apr 2024 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeP3BIRj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CE815959E
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961369; cv=none; b=q+M3DuvC2I8NE7k89y6Wb+TGuJ5tSJyUxpIIwAay0C978bqjISkqrQvKY6pQ3sUcjYRbzdwcuMLoQaz+juNbvuWNilzwhIZAsNBi13LTgZVaqQ5UakdzHPYAvo4G583HRlLEM55CshEAwVun1LHc08NhRT8biHjIDDPqWsgUn1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961369; c=relaxed/simple;
	bh=wk8EQOxsQrxvTl7obQuNBqbS8jBUlGSy9hn6VnC20F4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FNOL3uTB092DFifKV4wXT7mBVCnP1DyEQggHWF+e8FqejjMPZRMqc9XxoXonC/H51SMls20NkysVWhaRHljL8xhDqLjPc7DdQYUsUEUpm39djfaWrnVGZa5ROcIl9UbvPiTsF3N6GJ+W9k6NyCrvU5KzPht4GALy5agLvenn7pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeP3BIRj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713961367; x=1745497367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wk8EQOxsQrxvTl7obQuNBqbS8jBUlGSy9hn6VnC20F4=;
  b=QeP3BIRjkS+xzIQaxZP34GySGAuxtw1FpfKejViCbQBc8nJgTj2b4r5A
   ZGjuMf3UYaSSgoV89cRJ4NOtG4KSPQQChxy1u7OQWJpt7qw2T/QQsYaHc
   yeFDeGqH5iyoUKbFNFBk/p13Nbhmail9syx3Wt4UimOVz6/chPQcISaSV
   utWqDq/8c+rsDFWUf1Bt3CYFm3LTISf2vocol4a1VVyUHzruZFxfLL4BM
   QLTq9elrv1DX5j6FPfX0Mefw5Lln9VKokapBAIV3PZndFQbTHzoP0PHTs
   qfgs3AB3/Tt6+5o/6O2WhG2AkGscdtiW3jHyngcw4riwy/tgl9BCBK6e8
   w==;
X-CSE-ConnectionGUID: CObiNKTRTfmfRoc6A4XeUg==
X-CSE-MsgGUID: A0xlsWDyTxCrSTXGOI1vVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="12522893"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="12522893"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:47 -0700
X-CSE-ConnectionGUID: 4f96pnWvRdGbz+md/HK8Ew==
X-CSE-MsgGUID: NlbKByE6RoW9T7vp5JudCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29348883"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:45 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 91F1F11FAD8;
	Wed, 24 Apr 2024 15:22:41 +0300 (EEST)
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
Subject: [PATCH 02/14] media: Documentation: Add "stream" into glossary
Date: Wed, 24 Apr 2024 15:22:25 +0300
Message-Id: <20240424122237.875000-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
References: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
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


