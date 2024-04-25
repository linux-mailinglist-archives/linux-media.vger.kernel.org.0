Return-Path: <linux-media+bounces-10127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 833BC8B2AAE
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35FAD1F212D9
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F140A155A35;
	Thu, 25 Apr 2024 21:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzCekL0h"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F33155734
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080448; cv=none; b=lug9Z1h8DHN7OA1/MEmuMe3pdX4zANEystMK9GPCCnxEG5Zxbu7DzMo1UwoGBCVxeHaT8qymnI7BncJEFBgTk49vSwkomCFI+J0K09fuhU4gj7RAw3OAwXf6xgMGdk7OBTIO0PD8SJeBAvofR2bkOAhAfXpk3j4Rqu6XE058mj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080448; c=relaxed/simple;
	bh=wk8EQOxsQrxvTl7obQuNBqbS8jBUlGSy9hn6VnC20F4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rE4+I3HVblfBAFsbizXa5RaKm6b+0uMJWeMjJvgE3Q3g8tyCklveRwp6/vE8r6TMjeMJLP8/sBAEU6cNsgApK06UljIirB/wHPkMbvnNaRWr3E+hD9Vvsjwad7Li2K4YHsLd1lqHYn0aHLhdw7dhrsV7XbAlweNY3rXLjG3pgk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzCekL0h; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080447; x=1745616447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wk8EQOxsQrxvTl7obQuNBqbS8jBUlGSy9hn6VnC20F4=;
  b=VzCekL0ha9an+gjX6sXk9eqD2laVBvbyhCdyfMFwr9TvxgfUOtzcuEzo
   WqJrYKz8hUy2GkXTH7WBncYTUOh+7F9FkF4zGcC8hfXEo1lozPhIS8fga
   C/uYmg1YYrfuZQjEcCREKFzyJmdYE9dUa1P5+oIYuvM83MLLMLLinAiJb
   HmFF/5bl0vCOswZ2KL7TVgB0vyoj1JCV8837ZdGeO/bjQTFKsUUl7mmnb
   dIgY98v3qJ7zGY4LC7+PZrF6lOTNR9DHER5gBtSVGURkyJa1n2z4EXfVx
   PaUj3ACOdqzwQ2bRqnsmMPV1w1uVdD/oBKLymxr7ayz3O1DnuPT8gDmbO
   A==;
X-CSE-ConnectionGUID: OrklBE6IQ8u3WnOC1CHlEw==
X-CSE-MsgGUID: jEKmxpwkTmqwEUTdU8tL1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20487678"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="20487678"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:22 -0700
X-CSE-ConnectionGUID: GG731LeyTVqqpBsjaY11iA==
X-CSE-MsgGUID: h+DjriJKSM+pZWBJmNCECA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25305746"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:19 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 05CAA1203E8;
	Fri, 26 Apr 2024 00:27:14 +0300 (EEST)
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
Subject: [PATCH v2 02/14] media: Documentation: Add "stream" into glossary
Date: Fri, 26 Apr 2024 00:26:59 +0300
Message-Id: <20240425212711.928300-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
References: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
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


