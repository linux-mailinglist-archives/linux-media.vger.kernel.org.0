Return-Path: <linux-media+bounces-19402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 917F6999E97
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 09:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0C581C22DE0
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 07:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B0D20ADCC;
	Fri, 11 Oct 2024 07:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="br5/Kcz9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F82209664
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728633352; cv=none; b=JCFwlvFcJxxVKoKCLM2x75DaksIMKzqJlhfcqBlkeKtViM9SUQfinjhpftAaFHAmEo9E8IFqy/TpEva1wt2px+yhNW2ap8eH4JqZZLANRZ+b247ft1AmwycKf3HXcM1FPW1j0hoO+7h/mzWWIZxIHGDtnXJ86BGhnWbcgijqmT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728633352; c=relaxed/simple;
	bh=NlHZQcTX8fTFO2mNwZSVn6pmxqgKEnNDuoUszz5Ja3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V2fHj+/4egUP0NzADazJ90mFL5rqJ6Na2tCSIkaLnS1vlWa5Y2wuCrn3gRCVeaIJnGnXEQrw6eiHXZzAkjKwYjZLPVd4a/gvlxhf3M16dYQv+4faVgcx+oSGq3ylsqR7r8mB7SvIUlaO0MdyikfW1J8S9YAinwsYDX76ctukSVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=br5/Kcz9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728633351; x=1760169351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NlHZQcTX8fTFO2mNwZSVn6pmxqgKEnNDuoUszz5Ja3Q=;
  b=br5/Kcz958tShtbqsyzlpJ2PhZXSTIQ53FPzzq9iLGiotZtddvreKt8m
   YJeQfi1s+nAvH2ZNumKnG2PmZFvlu5WSP9Ulx4l0sMBrF8qmOho6G3wyA
   3JH/t7IHme08OGkeg/Vn9LNDBz7+8PBIjN3ehW3f8w1WG0A9m68gK9Lcm
   o+5LGM0zLDu0fTWjhzhHuSK7A2zHqHMAfQwg9ISn0oHpzjj2Tpk4QqAon
   qrfCWXIxiAjV0wLFvRjNrkIyokcmqSyPeDHd1o6XSEDmdllLULHtVE47h
   hNfYDHI8gArDPLLQcIzjEwlsitZ2g79jju0LsVJAp5fXaBLJyBvhn6a6B
   Q==;
X-CSE-ConnectionGUID: ZpOimQBDToKMgislwo2b2Q==
X-CSE-MsgGUID: uKKtPX5mTuGf+SgR+20Wrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30898394"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="30898394"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:55:51 -0700
X-CSE-ConnectionGUID: sk0u2EEHQPuckDfwkcjmJA==
X-CSE-MsgGUID: pnI30kvKSZO8TMoPa6O4cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="81826881"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:55:47 -0700
Received: from svinhufvud.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C89D811F9C2;
	Fri, 11 Oct 2024 10:55:41 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [RFC 2/4] media: Documentation: Reword split of sensor driver to two classes
Date: Fri, 11 Oct 2024 10:55:33 +0300
Message-Id: <20241011075535.588140-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sensor drivers do not configure the output size of the sensors but the
entire internal pipeline. Reflect this in the documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst      | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index d82cd803e337..ad4049ff7eec 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -10,11 +10,13 @@ used to control the camera sensor drivers.
 
 You may also find :ref:`media_writing_camera_sensor_drivers` useful.
 
-Frame size
-----------
+Sensor internal pipeline configuration
+--------------------------------------
 
-There are two distinct ways to configure the frame size produced by camera
-sensors.
+The camera sensors have an internal processing pipeline including cropping and
+binning functionality. The sensor drivers belong to two distinct classes, freely
+configurable and register list based drivers, depending on how the driver
+configures this functionality.
 
 Freely configurable camera sensor drivers
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.39.5


