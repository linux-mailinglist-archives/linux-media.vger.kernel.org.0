Return-Path: <linux-media+bounces-43622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CDABB3A2E
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D51F519C021A
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97EB30BBB8;
	Thu,  2 Oct 2025 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tb9Ea6su"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7471730ACEE
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401185; cv=none; b=XJEri6Wz5wbM7Hk33YKdZF6QKS5Uqgo5S7vJaNfIHxC7aY1crw9c2iS9aVvpIyUQBH4YxsyYf1/wG2HK5xulNpiwg4KjYGI1KUibGmiejzClq4jCSbCJbzrFH03mjv0YgXem2ie7mwSAplOpFqmluqCs4M78asLFuXZlU+xrX7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401185; c=relaxed/simple;
	bh=+uuck3UO91uSNKF4XPrUrIjW01cBYhJHCvbVEc8jxSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tnfIU09odWbuCoDrrmdKTHM/fN8YLnOsb73YBdAlbo+vUbfWAdXaA73FP8XTO74nIxQZ2tod9QY7H+VOoAHo9ujLfz8miyWYfQks2vnlGyD88AugXfwxZqk1Lpkd2KEVxje5QlIpS9vuIKfiv/LJtQ0NNp5u4n9kMYJwUJ9b/5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tb9Ea6su; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759401183; x=1790937183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+uuck3UO91uSNKF4XPrUrIjW01cBYhJHCvbVEc8jxSc=;
  b=Tb9Ea6sukrqpHqcjOx7GFyhAoQA+93+C9k1x501BarfN3JHBdyBfnwXz
   K11jGXjrca+m/qf2ZXNFnI3NY0zd8Pzsw8S/IJx2NXYCnNYvOnNqILX5c
   +LVnI4sHyLfiGIGwPq5aNBD1qXGTiDy2JwdURGhdDiZfGx4MR2WTgROKm
   GKkrEbm/AY+q97qX4b3G0vI/JE3LBPlLYweGe4l3JDJibPdzIP3z2ERFo
   bjE3dWpT+1mvLqmxUiOTxcb+bHqgk/sVay6PbLlbkA5nqXtO72qyvScPu
   cl2FZYTJIe3QPXMlULTCjYojt/6YAyVkJihbY3PMr5Nj+uJPtGzu1IpaL
   w==;
X-CSE-ConnectionGUID: spir953OQxOu7kP5HgD79Q==
X-CSE-MsgGUID: Eh5dKUwWSOi+QAQPEmVRdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="49238079"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="49238079"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 03:33:00 -0700
X-CSE-ConnectionGUID: IVhx8Ru3RECAgZkdJQs+1g==
X-CSE-MsgGUID: +Wk9LDJmRYStdUZz/Iuz7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="179457279"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.175])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 03:32:59 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DB494121EE2;
	Thu, 02 Oct 2025 13:32:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v4GcK-00000008jcA-2FBV;
	Thu, 02 Oct 2025 13:32:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	hans@jjverkuil.nl
Subject: [PATCH 1/3] media: v4l2-subdev: Make media_entity_to_v4l2_subdev() const-aware
Date: Thu,  2 Oct 2025 13:32:53 +0300
Message-ID: <20251002103256.2081947-2-sakari.ailus@linux.intel.com>
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

Retain the constness of the object in media_entity_to_v4l2_subdev(), by
switching to container_of_const().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e0bb58cb6d04..a37d9a847196 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1103,7 +1103,7 @@ struct v4l2_subdev {
 	typeof(ent) __me_sd_ent = (ent);				\
 									\
 	__me_sd_ent ?							\
-		container_of(__me_sd_ent, struct v4l2_subdev, entity) :	\
+		container_of_const(__me_sd_ent, struct v4l2_subdev, entity) : \
 		NULL;							\
 })
 
-- 
2.47.3


