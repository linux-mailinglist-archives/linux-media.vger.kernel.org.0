Return-Path: <linux-media+bounces-40562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EEEB2F799
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D69F1BC14EC
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDA731194B;
	Thu, 21 Aug 2025 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BjerxzuE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE79431079C
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778335; cv=none; b=vBNLBL0etHoMr26jGRCj5EQ1OYiOzkvnUz9P5V4Ot+6PETBL6kNTk1uPOP5alxdypfN/WC0CbQU+qbL9l4yV9fDXV/5/w86Aa/smeted7WaD96Mccih4ojaDZE7OiKJQj5o/gRxsYt1xk/wmJEuid0krDTbwbLB08yamuY/KRNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778335; c=relaxed/simple;
	bh=r5iKvwNEPFLhfjSlc/+NQlSqBQ4txNFUKw46I1v9ZQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITy2U8sTxg9KFI1v2rc94tlo3saqkqjaUoHg4fYlxB7v96l8YOu1OX9Jsw6DO5RPVj9cqRMWlmEr2jASTvRffUxtMTSWdZc2N8mMqulqqr8JASq6MkqliU1eIUOiMxuwkYQH0cEleZ05ypQEvRsdglQanENMsWNovhDlc5mPsXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BjerxzuE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755778334; x=1787314334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r5iKvwNEPFLhfjSlc/+NQlSqBQ4txNFUKw46I1v9ZQI=;
  b=BjerxzuEXI/DzkrF6GKPigkzqa77xvpVsLryD48aE3A8gtyqiHQd0Rhh
   pRxJRomtxJoOVEb/xddIECPYtceCTuWgE71/zDfFWCmZz/ypahADrAaj2
   +Get2vU+rZljqhrS+a0+ozZPdbLYt7IgtMjWdOzvZoibYEI3yg8NAFZYu
   OWIcHWElK/CXB+eRk73hsZW/ZLZ4rEQWK5v4GN9psKPgWXzEZh+M3wnsa
   F40y8Qg/ihvkmPYXENTvPpl2XwWQCv2e7NweiqmbXDf0onxdHp8IVBDwS
   8WNUVMy3ojm0yGs0KapdSD21r08Snz+g8DopMkEsiRj47RdFuTr78gblZ
   g==;
X-CSE-ConnectionGUID: ZyfFGYAiTC6sbcQYWIoRcg==
X-CSE-MsgGUID: eOexYjE/SAGsK/QtiEW3XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57089494"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57089494"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:12:12 -0700
X-CSE-ConnectionGUID: ebMAWbhFSAal0GB6xRWfUg==
X-CSE-MsgGUID: HkS1SWH9S6qjysfQuEdzfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="192077010"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:12:10 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 15C9C120247;
	Thu, 21 Aug 2025 15:12:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1up49I-00000002Jra-0JbH;
	Thu, 21 Aug 2025 15:12:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 1/3] media: amlogic: c3-mipi-csi2: Call v4l2_get_link_freq() on source pad
Date: Thu, 21 Aug 2025 15:12:05 +0300
Message-ID: <20250821121207.552993-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call v4l2_get_link_freq() on the source pad so we can remove the
workaround that allows calling it on a control handler.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Keke Li <keke.li@amlogic.com>
Tested-by: Keke Li <keke.li@amlogic.com>
---
 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
index 1011ab3ebac7..b9e4ef3fc308 100644
--- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
+++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
@@ -388,13 +388,12 @@ static void c3_mipi_csi_cfg_host(struct c3_csi_device *csi)
 	c3_mipi_csi_write(csi, CSI2_HOST_N_LANES, csi->bus.num_data_lanes - 1);
 }
 
-static int c3_mipi_csi_start_stream(struct c3_csi_device *csi,
-				    struct v4l2_subdev *src_sd)
+static int c3_mipi_csi_start_stream(struct c3_csi_device *csi)
 {
 	s64 link_freq;
 	s64 lane_rate;
 
-	link_freq = v4l2_get_link_freq(src_sd->ctrl_handler, 0, 0);
+	link_freq = v4l2_get_link_freq(csi->src_pad, 0, 0);
 	if (link_freq < 0) {
 		dev_err(csi->dev,
 			"Unable to obtain link frequency: %lld\n", link_freq);
@@ -434,7 +433,7 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
 
 	pm_runtime_resume_and_get(csi->dev);
 
-	c3_mipi_csi_start_stream(csi, src_sd);
+	c3_mipi_csi_start_stream(csi);
 
 	ret = v4l2_subdev_enable_streams(src_sd, csi->src_pad->index, BIT(0));
 	if (ret) {
-- 
2.47.2


