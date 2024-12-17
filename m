Return-Path: <linux-media+bounces-23670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E946D9F592F
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 23:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D540A16429E
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06961FA827;
	Tue, 17 Dec 2024 21:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HM0oTWNq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA171FA251
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 21:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734472499; cv=none; b=VAQ5tIOo6KhvgHHGeeXqXtzRnfMyEHs8irqrDwRaB17RYtVYPuyO+0U18uFFKXi6q1n76ItdAlq69oPGI0q/c7jQqEmdjBSG1C2S9StpiOj0EeL7v7UQIs4X+7xLFF1e39XGWKYXoQCoHDov5QEXzLD0/kQsxYJKIOmouDO4kJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734472499; c=relaxed/simple;
	bh=/zOTANi2loibCnQsUZOdeXNp3ElME59VEVwpGoksEZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iWaoYjNrVZ9q0zDLCN0pERkq0raf2MXZqz0W/OW3uyW8S94zR7bGhwJFXOVk/wvdhmd0FDrUKdh8qFVav74D9CtsIuwZEQCARQl9+KXzBniH3jOEi88AWVKH+2V0HBPUlNIEX8nJFDm2+IGylpPkfBoGmqOSV/JM7GkwBpyd/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HM0oTWNq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734472497; x=1766008497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/zOTANi2loibCnQsUZOdeXNp3ElME59VEVwpGoksEZQ=;
  b=HM0oTWNqln4ITYpT9g9EJRwIgjE18j3VAHsEbPJFBc1IwDE/YkF3H0EM
   UkmJfjcysoz0bUpsmvOvaB/RirLN0Nbu36BfPY2ZUE7vAduoBheezbYxm
   0Lzkcr+phr1TuT9IQYnCFmHdJRie/kQiPQeH6Rjb/880o43nzgdF2nPfY
   G7SMm4nzUOM00U7OTGs7c0xWLVbTgjtV1GriQff6lrEJbRt7NnJisT1J1
   SOaWXtxywEXLdNWj/siNC0WSzAJ2zOBY4xFNDV/VkTmb52/+ESwY2iZkG
   +kwB8UZzULF/SbvJPrLP275BSPcCVfAcR5gKfomBeiXOQcBJ8hzluIiuW
   Q==;
X-CSE-ConnectionGUID: t+UxfyBzSdCZU9Fkkb4tfQ==
X-CSE-MsgGUID: qhJUDsudTjiTLPYSXy0B3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38861597"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38861597"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:57 -0800
X-CSE-ConnectionGUID: 2t1rHy/bSg6zxvlrXpe3aw==
X-CSE-MsgGUID: 5ZzFO2xqQUyN1/wIdi4F/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97511251"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:57 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C6A6811F89A;
	Tue, 17 Dec 2024 23:54:52 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com
Subject: [PATCH v8 5/9] media: Documentation: Receiver drivers should call v4l2_get_link_freq()
Date: Tue, 17 Dec 2024 23:54:41 +0200
Message-Id: <20241217215445.901459-6-sakari.ailus@linux.intel.com>
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

Document that receiver drivers should call v4l2_get_link_freq() to obtain
the link frequency.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/tx-rx.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 03768e5aa88f..0b8c9cde8ee4 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -53,6 +53,9 @@ Drivers that do not have user-configurable link frequency should report it
 through the ``.get_mbus_config()`` subdev pad operation, in the ``link_freq``
 field of struct v4l2_mbus_config, instead of through controls.
 
+Receiver drivers should use :c:func:`v4l2_get_link_freq` helper to obtain the
+link frequency from the transmitter sub-device.
+
 ``.enable_streams()`` and ``.disable_streams()`` callbacks
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.5


