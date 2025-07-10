Return-Path: <linux-media+bounces-37250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B48AFFA46
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 08:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38BC24E5E2D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 06:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7DA2877FF;
	Thu, 10 Jul 2025 06:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fou9WSJh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C4C17A300
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 06:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752130735; cv=none; b=EXlQp/2vwMh25AKZTXKDWTblhdyRze9AGw8PdUZamepIFsFPuv+6DVMw5/a44cA7FMKZIdcZbssFBRVzlqXCT/IM4p4f++lmkphYYlmx5tzU3XV/YpSgUsKzfcjUylTIW9vp1mA+nAOcpNP97DWEZB61e9Y17uYron3GZIiQtV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752130735; c=relaxed/simple;
	bh=VEfcDYKeCEh+IaynSFkV6GCwadTavF/VQYRT0wH+8a4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ajYYM1ROL3np49EP7scqKV6d5S5KecmHPeXoSM6EtqqE6MbfJ2ZjVAPc9nr5mnOSm49P/1h3EE02fi79SLkRYN6K0oaIw9X+RgvraX7WSYAaG33b/URbSshobAtGrGa/oO5r1PB/SomW7DCr9aejAPz85p9/fsKJ2cGj0NBOQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fou9WSJh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752130733; x=1783666733;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VEfcDYKeCEh+IaynSFkV6GCwadTavF/VQYRT0wH+8a4=;
  b=fou9WSJhDKvxRx/YuYtrdUFzaYn+qrIs1vZSzOPIJzhIqHMrhO7VHlti
   f9iXSBXaLd7E8wwRTH+8b5Fp8uAZaCczS1oMiLSly+a9pXckIgt9D2DgZ
   rDI5a39pElixZPp+jtApSFN7YbHn9ipKfdYIAwwQReu7x+y/XFfRG6Gza
   YcuAJe02NAdJo3Q++rVHEW0ADmXcG5dBL0N2nUe6drxHXGuOYvHhgbSHY
   i7Ag+2xfRvArrZwQ62WtPlUt2vmqWoVtZzYk9q5MKDRhN6Zs3eV77QkZu
   1GqAKBgwLMSy6tO/f9MQXNFVJdX/LlbxkZFd5hFwvzGE8boo8+N+CzGAr
   Q==;
X-CSE-ConnectionGUID: MbfSfy1LQqSUmlAYRMfEmg==
X-CSE-MsgGUID: sJbdl/FOTYiNCzfDPaL9EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54549941"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54549941"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 23:58:53 -0700
X-CSE-ConnectionGUID: OPnPc6N/TEi5TbK90wdaPw==
X-CSE-MsgGUID: XYMi1IinQYqgYAIsILtvFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="186966027"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 23:58:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9F7191207A2;
	Thu, 10 Jul 2025 09:58:48 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uZlF3-0045qa-0x;
	Thu, 10 Jul 2025 09:58:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: [PATCH v3 1/1] media: v4l: Make media_entity_to_video_device() NULL-safe
Date: Thu, 10 Jul 2025 09:58:49 +0300
Message-Id: <20250710065849.975780-1-sakari.ailus@linux.intel.com>
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
since v2:

- Just new indentation and rewrap a little.

 include/media/v4l2-dev.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 1b6222fab24e..a69801274800 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -313,10 +313,16 @@ struct video_device {
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
+({									\
+	typeof(__entity) __me_vdev_ent = __entity;			\
+									\
+	__me_vdev_ent ?							\
+		container_of(__me_vdev_ent,  struct video_device, entity) : \
+		NULL;							\
+})
 
 /**
  * to_video_device - Returns a &struct video_device from the
-- 
2.39.5


