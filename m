Return-Path: <linux-media+bounces-43625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49DBB3A3D
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C922A324DF1
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AB230C618;
	Thu,  2 Oct 2025 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3m28u3D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1CA30BBBB
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401187; cv=none; b=s8tCSQDjGFeniErmqjCdEgCjCfKECiRjum1RvFceR/XrQvUT4IeshUW9Ef5mIqIBxCoev+EhteS1N7GtlrZ+hBDfGqebUFPACNUUE5hRQQoe3qFQ74AMG+tj9d96hktakqa8b4M0GHP/TPUrQRtjEsI31BTww3gSDCKHbb3LO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401187; c=relaxed/simple;
	bh=kc5SgDUcVWKZnEP1E0L4IjQ/3VkT91bhxld6yIngHj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imon/Ny9rxvgKD/G2JxadREXivN/6Ix4ul1xdRfU3BeO1iI3VrU7hO+B58NKoh60WALUmi4V289baOuA7zXkH/ORCCVXS+AU1ZMUJo+NET3POT1AwVLSINvjf4c6UTDkoIvdoBgeTtYDW9L9YJGQPm+VpHwa/4oGaxpb3W8cVTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3m28u3D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759401186; x=1790937186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kc5SgDUcVWKZnEP1E0L4IjQ/3VkT91bhxld6yIngHj8=;
  b=f3m28u3DzDuWRWwDGBiMtUy3roAUaLIaIt9HQqZop/3fwEqye8F7WAUT
   SALOZ0Heswu0K70QklodncBD0eDZwsBNXtixyW4RLh8IwDoezy6NNr932
   E1iiCZyuWlyzyykMmyWQWiwmX8nU4nq7mnz3RKyC/nYNUT3kNWFWgneXD
   7AFBiItxYXXZDPCwkY8w0TtgJq0Qedp/0MA6SZ913aBCeNx8uYsiHOMHr
   QC0uGtRNrCbjqejKsb6K5mE9Gzp80Ktliwnd7L7ZrA0EoXQeN9k6ozc0N
   kDMHT1jxphhblukIGWQmxRmChHmRkUNfZXu1yGecgGXGeI3X1B/6K13fI
   Q==;
X-CSE-ConnectionGUID: clB77+R9SmGYGxYcAoaWXA==
X-CSE-MsgGUID: 6TnstSVuSxOkhlxEsYLYHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="49238073"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="49238073"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 03:33:00 -0700
X-CSE-ConnectionGUID: +ea2wenrRe2OKfgkhUg1hw==
X-CSE-MsgGUID: slPwP0CvSnmQNXUWl0QKcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="179457276"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.175])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 03:32:59 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DFA4C121F3C;
	Thu, 02 Oct 2025 13:32:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v4GcK-00000008jcM-2Ttd;
	Thu, 02 Oct 2025 13:32:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	hans@jjverkuil.nl
Subject: [PATCH 3/3] media: v4l2-dev: Make macros to obtain containers const-aware
Date: Thu,  2 Oct 2025 13:32:56 +0300
Message-ID: <20251002103256.2081947-5-sakari.ailus@linux.intel.com>
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

Retain the constness of the graph objects and interfaces in macros to
obtain their containers, by switching to container_of_const().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/media-entity.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 64cf590b1134..b91ff6f8c3bb 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -627,7 +627,7 @@ static inline bool media_entity_enum_intersects(
  * @gobj: Pointer to the struct &media_gobj graph object
  */
 #define gobj_to_entity(gobj) \
-		container_of(gobj, struct media_entity, graph_obj)
+		container_of_const(gobj, struct media_entity, graph_obj)
 
 /**
  * gobj_to_pad - returns the struct &media_pad pointer from the
@@ -636,7 +636,7 @@ static inline bool media_entity_enum_intersects(
  * @gobj: Pointer to the struct &media_gobj graph object
  */
 #define gobj_to_pad(gobj) \
-		container_of(gobj, struct media_pad, graph_obj)
+		container_of_const(gobj, struct media_pad, graph_obj)
 
 /**
  * gobj_to_link - returns the struct &media_link pointer from the
@@ -645,7 +645,7 @@ static inline bool media_entity_enum_intersects(
  * @gobj: Pointer to the struct &media_gobj graph object
  */
 #define gobj_to_link(gobj) \
-		container_of(gobj, struct media_link, graph_obj)
+		container_of_const(gobj, struct media_link, graph_obj)
 
 /**
  * gobj_to_intf - returns the struct &media_interface pointer from the
@@ -654,7 +654,7 @@ static inline bool media_entity_enum_intersects(
  * @gobj: Pointer to the struct &media_gobj graph object
  */
 #define gobj_to_intf(gobj) \
-		container_of(gobj, struct media_interface, graph_obj)
+		container_of_const(gobj, struct media_interface, graph_obj)
 
 /**
  * intf_to_devnode - returns the struct media_intf_devnode pointer from the
@@ -663,7 +663,7 @@ static inline bool media_entity_enum_intersects(
  * @intf: Pointer to struct &media_intf_devnode
  */
 #define intf_to_devnode(intf) \
-		container_of(intf, struct media_intf_devnode, intf)
+		container_of_const(intf, struct media_intf_devnode, intf)
 
 /**
  *  media_gobj_create - Initialize a graph object
-- 
2.47.3


