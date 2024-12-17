Return-Path: <linux-media+bounces-23671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8329F5930
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 23:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D19D2164A3C
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AAC1FA831;
	Tue, 17 Dec 2024 21:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwuv98Y9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68611F9F52
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 21:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734472500; cv=none; b=LheBlKT3BRRiSoVtzpM7FW0LPsbxCjtZcdqn4ee99Wy5877fctWoZ43Gz1yBNdS2m3cK//epoQlV4xYlxwLmbt19Kd91pI7s/vE70P8GZIu833MTCS01nmeRmDU1t/aLyXHXaAxOxh986Cs0Lu3EdcNUFHS+zYNXfqoDaTeXOr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734472500; c=relaxed/simple;
	bh=v1KKhp+XIaijVbuPccvLcg9K/r5VIAYLmbQelsEASgw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f1J6cL9YQT2tfxHr/nKJQvIJQ5j2nzSUFYYNizf+vgVeK6hcdFja3rmiG7khuopfgylPNGqRqwnmhVvGOrvtscATqznLXRGIBZTCB7NiK0rIV3ZvR4+rtRP50vAraHjwAnI3FXxwlH8cY+tSfLUnkWGigJ7uV2vAebMRr3QWTKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwuv98Y9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734472498; x=1766008498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v1KKhp+XIaijVbuPccvLcg9K/r5VIAYLmbQelsEASgw=;
  b=dwuv98Y9Yci6ffTM+2Q1nlFUn2Xq92QgwcDuRIZK5xNwt+U0BL+RPDxu
   eL3C3RcOfQK2eGoNpr+jSKQHbf18eM6WUhEioS1YzNGkLWICUzM3VRWVr
   hmS7L1FWwteVLVUVJQZuTpdX2dXwycyL3Z2Xg4SZB1+VUTIqSuKZZS9NU
   LI1iWco33iVizq0RqEnh/0rc7NYnNLZjh1BANDv3s30UygmZkk3vKWPOK
   IxYrhhNmIf0H7/195q6HUI7/O7lnb3T9tS1O4ElyajKLizRnghhfnIsQa
   ReZrkksg7/K20vyyGmRITzNycrCY39Nl9nh3s+ZvhGlfJLO6hZ+w01Wyg
   w==;
X-CSE-ConnectionGUID: gnlq5B5cRPKs3KfKpFA8mg==
X-CSE-MsgGUID: df5Gd4DGS6+Y5F9HJ634qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38861600"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38861600"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:58 -0800
X-CSE-ConnectionGUID: 9TN4SwFwQsCV7OBU3T4hRw==
X-CSE-MsgGUID: XtRzfW1uRHyN0PN9wFW84w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97511254"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:58 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 72B0311F9A3;
	Tue, 17 Dec 2024 23:54:54 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com
Subject: [PATCH v8 6/9] media: Documentation: Add a note to set all fields in get_mbus_config op
Date: Tue, 17 Dec 2024 23:54:42 +0200
Message-Id: <20241217215445.901459-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
References: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document that the implementations of the V4L2 sub-device pad operation
get_mbus_config shall set all fields of the struct to defined values.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 2f2200875b03..abcc879fabb2 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -822,7 +822,10 @@ struct v4l2_subdev_state {
  *		     possible configuration from the remote end, likely calling
  *		     this operation as close as possible to stream on time. The
  *		     operation shall fail if the pad index it has been called on
- *		     is not valid or in case of unrecoverable failures.
+ *		     is not valid or in case of unrecoverable failures. The
+ *		     implementations of the get_mbus_config operation shall set
+ *		     all the values of struct v4l2_mbus_config to defined
+ *		     values.
  *
  * @set_routing: Enable or disable data connection routes described in the
  *		 subdevice routing table. Subdevs that implement this operation
-- 
2.39.5


