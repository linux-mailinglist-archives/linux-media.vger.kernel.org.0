Return-Path: <linux-media+bounces-35233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D128ADFF87
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5CA03A21B6
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB72F262D14;
	Thu, 19 Jun 2025 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISM5gtbI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9873021B9F2
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320956; cv=none; b=eIMfTVpQYWAsRyGevsQZ/sKiqirk+L33rBDH+pzD6JfuR3PUN4lFLhs9uAnr38gp1JEzhM/9ixgjCk9Bp+MA786KhCR+c2Jmefwa6UA29Ldzb9ZzXN0lkaQOMG76asoI4JBsb9Es1BWPXYMzYn9fgShO1IGzppZZvWwt9d4krFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320956; c=relaxed/simple;
	bh=uJxr5LxkHj1/ihtcMu9oH3317X6BvI7DDYg+W62Q1HA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C5z2BKc69lvTKVBI5Le8uvqY2g4SS9g1XhWq9nXpGhW0Wgseg+zWEc39DMeEUp2scfyeSY/9NBIyd+yuiudUAemu1Wg9FaFi6U7fWkSCa+DrcJHK0qSuLhFDdwxidR06W/VIR5yoIp2/S+jBI/4r1IqBnZ/HxvwcLJ0fzOO4E4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISM5gtbI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320955; x=1781856955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uJxr5LxkHj1/ihtcMu9oH3317X6BvI7DDYg+W62Q1HA=;
  b=ISM5gtbIUEbKEcdxb53h4pwsTRcjzomltFXtOmFqhj2ENLXV5HRCT5mD
   wejz3RVJywvdE14zx6OdYMvtLgWZmlu+ajvmjwmGAEWa7PM/ff8ka0aEF
   4ejjEy4+OgeVNO0QQ3RGWFToHsa0MGXjSYKswTpDKD0ABikTQB+oQJ/wK
   dnQ8cA7HMoVJ4VbX2LLj3LohUZmUOcYylarFASWwdx6i8yHNL7S4JkGR8
   hu8hFArFF1uCoxvf4WcDDCnNNSvsty7hhOAzU2WE9mJ+lxpZKG2xpjgp+
   9vRkyrLPc4jFH23uIOPmJ8sWaIVbTSImbEc0dqKpYlfSVQt+IRKHWbpJs
   A==;
X-CSE-ConnectionGUID: UjpCgvfcT9uMU3J8iZ9Jaw==
X-CSE-MsgGUID: wci6wOzGTHSqV9dqBJvkYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716674"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:50 -0700
X-CSE-ConnectionGUID: /x5hEqYCSDuUmIcNJsRveQ==
X-CSE-MsgGUID: /JsnMujRRqOIU0QLqCtx8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640621"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 87B8E120323;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006doQ-1d;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 01/13] media: ipu6: Use correct pads for xlate_streams()
Date: Thu, 19 Jun 2025 11:15:34 +0300
Message-Id: <20250619081546.1582969-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arguments to v4l2_subdev_state_xlate_streams() were incorrect, the
source pads was used as the sink pad and the source pad was a constant
(rather than the actual source pad). Fix these.

Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index da8581a37e22..6030bd23b4b9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -354,9 +354,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
-						       CSI2_PAD_SINK,
-						       &streams_mask);
+	sink_streams =
+		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
+						&streams_mask);
 
 	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
 	if (ret)
@@ -384,9 +384,9 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	struct media_pad *remote_pad;
 	u64 sink_streams;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
-						       CSI2_PAD_SINK,
-						       &streams_mask);
+	sink_streams =
+		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
+						&streams_mask);
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-- 
2.39.5


