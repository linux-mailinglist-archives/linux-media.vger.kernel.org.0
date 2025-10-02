Return-Path: <linux-media+bounces-43624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6378BB3A3A
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 781A919C022D
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C991F30C372;
	Thu,  2 Oct 2025 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zvv13ZsA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7721730BB96
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401187; cv=none; b=Tz4Q6N6Wc3X+rK4ZtkpZf85bEglBXUpaCV3bqzfwxVToj47lcewtSafZCAie+idHIOQAwSUS/zQzYEjw4AV+I8//1MjmiwlQla1/qd7Ytk15WXXFYUInej8EOri5VrWEvsruLjzyZt9YWeAE0vUILd5AYA1Q6BcyRjYdlr/eD7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401187; c=relaxed/simple;
	bh=/f+lXZuabTL5VLWroA7PJQEjzc8gARAuyW/NMVzEk6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdCPoXia+SW6MofIk0UUSrySFugcbaQswXBCV77vjyG2btCLMrbEOJakoFhK9+Q03BNWbpzrJqvJJ0iNJGNc6B3AUDcJc9fXqA1gZPNAKmEgy0UFd2wPfec1eXZ1iwYBPVI8v2yD29EbOshocQSAvOKzFmSxQYTQriv0bzLTib4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zvv13ZsA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759401185; x=1790937185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/f+lXZuabTL5VLWroA7PJQEjzc8gARAuyW/NMVzEk6A=;
  b=Zvv13ZsAEVRIE1PrU8adi9y28AWuHomLXk8rTm0BvxjEfsfP4puIX4kJ
   miywVNaKvr9btyuKq+xzyi5Id/dFnxZbdOecddPkXQ27LnDhqh8zI/r6R
   t4MCn1ObkvyofR5+60zezWM2TR9IEL19fILb9PqjvTblegCu+z4GAdAnd
   h2fJ4wgwjdLxphkXnyXJKg8VRJIlKdIDBEq6ZHJaJ7bS2dt0cYI7ueSi4
   XziYtO3cPrdjWXu1x5t4oaKn0oeUoJT/wVarNgMU4fP27qzQ9enfHC/9t
   A63QropGRGscjmbK047J3KBQhAP+uzgtpfkjNxk0Dz6DI3j2XYKBuB4ty
   A==;
X-CSE-ConnectionGUID: P7yODys7QgSlZljnitV6Vw==
X-CSE-MsgGUID: dIT63BbDQyGSuxiLHCDcyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="49238082"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="49238082"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 03:33:01 -0700
X-CSE-ConnectionGUID: yFfWfMtLShyLMnml5kLnuA==
X-CSE-MsgGUID: XYVuMEKMQGS/LcQ4XoO5gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="179457280"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.175])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 03:32:59 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DBF46121EE8;
	Thu, 02 Oct 2025 13:32:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v4GcK-00000008jcE-2KEl;
	Thu, 02 Oct 2025 13:32:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	hans@jjverkuil.nl
Subject: [PATCH 2/3] media: v4l2-dev: Make macros to obtain containers const-aware
Date: Thu,  2 Oct 2025 13:32:54 +0300
Message-ID: <20251002103256.2081947-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251002103256.2081947-1-sakari.ailus@linux.intel.com>
References: <20251002103256.2081947-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Retain the constness of the object in media_entity_to_video_device() and
to_video_device(), by switching to container_of_const().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-dev.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index a213c3398dcf..2e0f6d2e6a78 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -320,8 +320,8 @@ struct video_device {
 	typeof(__entity) __me_vdev_ent = __entity;			\
 									\
 	__me_vdev_ent ?							\
-		container_of(__me_vdev_ent,  struct video_device, entity) : \
-		NULL;							\
+		container_of_const(__me_vdev_ent,  struct video_device, \
+				   entity) : NULL;			\
 })
 
 /**
@@ -330,7 +330,7 @@ struct video_device {
  *
  * @cd: pointer to &struct device
  */
-#define to_video_device(cd) container_of(cd, struct video_device, dev)
+#define to_video_device(cd) container_of_const(cd, struct video_device, dev)
 
 /**
  * __video_register_device - register video4linux devices
-- 
2.47.3


