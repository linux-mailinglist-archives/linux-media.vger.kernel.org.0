Return-Path: <linux-media+bounces-37228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7C8AFF330
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 22:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 672FD3B840C
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 20:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0FA2459F8;
	Wed,  9 Jul 2025 20:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWZUrtYW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E080241671
	for <linux-media@vger.kernel.org>; Wed,  9 Jul 2025 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752093554; cv=none; b=ET0bz4mJywNAdlgI412dCxzibyhe+yQ7jmswFo+BFCg+b/H+dnI5rooeIRMk7itSZPI4yihUH8BG1YZUexxfnnBUMSW0ciEtlkIBPx+gV9A1YevT3ziaNcGWjK5/UfJDuPuN2821lrTpeEvdqf9Fx1M1tvTwrYtWE96M75Km8f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752093554; c=relaxed/simple;
	bh=ieh8FfCn2GLUay668odXCukN4iQ6hhjtQ5ubnfXYvcY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TnW0847YSISWMIXvW7oU9VJLiB/WFCEaLp9x54ShYRe5i6gz5SaUxhN81E6TSrv/93WyXe22HQiVGpEozMlKJxuzuMfo1qrIrNg2r65FgRVDnshHvn7f5gNrPWFhkNAneRK18sHPTDSNB3zuqUNE1DWpheJ5g5OKaBQfWJS/+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWZUrtYW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752093552; x=1783629552;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ieh8FfCn2GLUay668odXCukN4iQ6hhjtQ5ubnfXYvcY=;
  b=mWZUrtYWEwAawmbVL6FF104mwP2NojHh2YKAWI8jAJXcU21OjK2Z3EB5
   1zjPJsZbA9IrCKRWLa3kWsEXjglclVERnfeWB0tKfmJY8+nPF+YVcmGKm
   nT7ldvJ5HrOvTgkbZU5JPUr9trv8T7VY5c+DR+WPCaVpNSPCsvQnjrXql
   wn7F8IRr2PAm+rwDVbBXSCZpcYLL1bcgabIuJRl66ycEIb4gsjKCGwV1E
   v7hFxt1JxS80GY/Fo55rh6YdHAdwAAAGBPMWAxRXcIIQhZPknkfHrrQS2
   4tYe6Ls+Pdg8GGnpC58K0OAMRQ3UWa5Lmrv/3Q036SxMlJgIDYNXC+xXM
   g==;
X-CSE-ConnectionGUID: boGDDZLjTTmfBf2h0Beyqw==
X-CSE-MsgGUID: 1zNbBjkSSFaZamKwj/60ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54511303"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="54511303"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 13:39:12 -0700
X-CSE-ConnectionGUID: zPiGiJ3QRmudghMZn6QZyg==
X-CSE-MsgGUID: xdDUEy4cQaW8UYUzh8fTNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="159900780"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.15])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 13:39:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7652711F89A;
	Wed,  9 Jul 2025 23:39:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uZbZM-0045ZO-1A;
	Wed, 09 Jul 2025 23:39:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: [PATCH v2 1/1] media: v4l: Make media_entity_to_video_device() NULL-safe
Date: Wed,  9 Jul 2025 23:39:08 +0300
Message-Id: <20250709203908.974714-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make media_entity_to_video_device(NULL) return NULL, instead of an invalid
pointer value.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-dev.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 1b6222fab24e..e0461c697377 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -313,10 +313,17 @@ struct video_device {
  * media_entity_to_video_device - Returns a &struct video_device from
  *	the &struct media_entity embedded on it.
  *
- * @__entity: pointer to &struct media_entity
- */
-#define media_entity_to_video_device(__entity) \
-	container_of(__entity, struct video_device, entity)
+ * @__entity: pointer to &struct media_entity, may be NULL
+ */
+#define media_entity_to_video_device(__entity)				\
+	({								\
+		typeof (__entity) __me_vdev_ent = __entity;		\
+									\
+		__me_vdev_ent ?						\
+			container_of(__me_vdev_ent,			\
+				     struct video_device, entity) :	\
+			NULL;						\
+	})
 
 /**
  * to_video_device - Returns a &struct video_device from the
-- 
2.39.5


