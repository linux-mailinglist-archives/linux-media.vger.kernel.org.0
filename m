Return-Path: <linux-media+bounces-16174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E30950088
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 10:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B783284783
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 08:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B7A16DEAA;
	Tue, 13 Aug 2024 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzt0tilG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA3915B7;
	Tue, 13 Aug 2024 08:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539381; cv=none; b=VDHVK3SLsyuRljLYXS8pqOiOAwQ+Wy/ozhAop67HQkGnOjZXHkzLD3KP1LqgYNPgN7C1o/qWYAZi9MmuRxPPa35FovaWK0Brp7clVdQpCA2ejJfxMCq7ux102v99PSe5jHVEQ0zqOJtsXnpODZ/p4xUVtnRAMmXxFS3SWY8/olo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539381; c=relaxed/simple;
	bh=l+HSWa0Q04huECSVHAdrH0Y3m5k5eFpl+UFlrdTRl9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gk3jZMuZq3P9kA8bCrIVUxHugQivFZHwDe3cbGYc+hH0aTpK11kCxBmG9CP62KhhlIyqH8VZDpCUSeVvpY8nLT7Sjr5BegLy9GokVI6K1pNl6NUZeVjA/Oyta2Zuu4EeOdnl65gTexFjyIeyfBN0pptNf3o/VxbtDgdOrng6wbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzt0tilG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723539380; x=1755075380;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l+HSWa0Q04huECSVHAdrH0Y3m5k5eFpl+UFlrdTRl9U=;
  b=hzt0tilGZkM+lJOhNkQjFvLezMX06WcrzM8mlQzPV18iG+Idp2HoCPVY
   /40kuQLcm8SgoHStSiYRbZdK+Yw0ywY0xQzBvjevmUstiTSCKkGOvycnN
   TinIB2M4tkOMV9X/aOZsQmd7Nnmmljd94yVkfWerIwFvAN0i9WpSREyDh
   dUiTi5h22APlraD3QucQImVhTLrccPC5GOSLN0Pu4uBiXL9Y/388iBcd9
   Y12uJBssIXBfSVybuvbeOqZdRA+p8TIivQ84TKUSBFbv15VYSlCVLXexn
   LMdKzCuOulb3o7u8UtOySiRG4vmL3zXrXDG+mvI3wmusevX+PoqIlhvjx
   g==;
X-CSE-ConnectionGUID: 3qPvxQY4ScaJpv6rBMA6cg==
X-CSE-MsgGUID: jmbDTWYdRvSpSM/jBEs9kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21856874"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21856874"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 01:56:20 -0700
X-CSE-ConnectionGUID: 12jI/QJCTAmEPSbGzokVSA==
X-CSE-MsgGUID: kAqf42uQReeHRqDvZiJ0KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58552176"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Aug 2024 01:56:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 529CB3B5; Tue, 13 Aug 2024 11:56:16 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: atomisp: Simplify ia_css_pipe_create_cas_scaler_desc_single_output()
Date: Tue, 13 Aug 2024 11:56:15 +0300
Message-ID: <20240813085615.1546111-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make ia_css_pipe_create_cas_scaler_desc_single_output() easier to read by
shortening parameter names.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 44 ++++++++++------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 01f0b8a33c99..ca97ea082cf4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5826,20 +5826,19 @@ need_yuv_scaler_stage(const struct ia_css_pipe *pipe)
  * Later, merge this with ia_css_pipe_create_cas_scaler_desc
  */
 static int ia_css_pipe_create_cas_scaler_desc_single_output(
-	    struct ia_css_frame_info *cas_scaler_in_info,
-	    struct ia_css_frame_info *cas_scaler_out_info,
-	    struct ia_css_frame_info *cas_scaler_vf_info,
+	    struct ia_css_frame_info *in_info,
+	    struct ia_css_frame_info *out_info,
+	    struct ia_css_frame_info *vf_info,
 	    struct ia_css_cas_binary_descr *descr)
 {
 	unsigned int i;
 	unsigned int hor_ds_factor = 0, ver_ds_factor = 0;
 	int err = 0;
 	struct ia_css_frame_info tmp_in_info;
-
 	unsigned int max_scale_factor_per_stage = MAX_PREFERRED_YUV_DS_PER_STEP;
 
-	assert(cas_scaler_in_info);
-	assert(cas_scaler_out_info);
+	assert(in_info);
+	assert(out_info);
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "ia_css_pipe_create_cas_scaler_desc() enter:\n");
@@ -5847,10 +5846,8 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 	/* We assume that this function is used only for single output port case. */
 	descr->num_output_stage = 1;
 
-	hor_ds_factor = CEIL_DIV(cas_scaler_in_info->res.width,
-				 cas_scaler_out_info->res.width);
-	ver_ds_factor = CEIL_DIV(cas_scaler_in_info->res.height,
-				 cas_scaler_out_info->res.height);
+	hor_ds_factor = CEIL_DIV(in_info->res.width, out_info->res.width);
+	ver_ds_factor = CEIL_DIV(in_info->res.height, out_info->res.height);
 	/* use the same horizontal and vertical downscaling factor for simplicity */
 	assert(hor_ds_factor == ver_ds_factor);
 
@@ -5895,30 +5892,29 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 		goto ERR;
 	}
 
-	tmp_in_info = *cas_scaler_in_info;
+	tmp_in_info = *in_info;
 	for (i = 0; i < descr->num_stage; i++) {
 		descr->in_info[i] = tmp_in_info;
-		if ((tmp_in_info.res.width / max_scale_factor_per_stage) <=
-		    cas_scaler_out_info->res.width) {
+		if ((tmp_in_info.res.width / max_scale_factor_per_stage) <= out_info->res.width) {
 			descr->is_output_stage[i] = true;
 			if ((descr->num_output_stage > 1) && (i != (descr->num_stage - 1))) {
-				descr->internal_out_info[i].res.width = cas_scaler_out_info->res.width;
-				descr->internal_out_info[i].res.height = cas_scaler_out_info->res.height;
-				descr->internal_out_info[i].padded_width = cas_scaler_out_info->padded_width;
+				descr->internal_out_info[i].res.width = out_info->res.width;
+				descr->internal_out_info[i].res.height = out_info->res.height;
+				descr->internal_out_info[i].padded_width = out_info->padded_width;
 				descr->internal_out_info[i].format = IA_CSS_FRAME_FORMAT_YUV420;
 			} else {
 				assert(i == (descr->num_stage - 1));
 				descr->internal_out_info[i].res.width = 0;
 				descr->internal_out_info[i].res.height = 0;
 			}
-			descr->out_info[i].res.width = cas_scaler_out_info->res.width;
-			descr->out_info[i].res.height = cas_scaler_out_info->res.height;
-			descr->out_info[i].padded_width = cas_scaler_out_info->padded_width;
-			descr->out_info[i].format = cas_scaler_out_info->format;
-			if (cas_scaler_vf_info) {
-				descr->vf_info[i].res.width = cas_scaler_vf_info->res.width;
-				descr->vf_info[i].res.height = cas_scaler_vf_info->res.height;
-				descr->vf_info[i].padded_width = cas_scaler_vf_info->padded_width;
+			descr->out_info[i].res.width = out_info->res.width;
+			descr->out_info[i].res.height = out_info->res.height;
+			descr->out_info[i].padded_width = out_info->padded_width;
+			descr->out_info[i].format = out_info->format;
+			if (vf_info) {
+				descr->vf_info[i].res.width = vf_info->res.width;
+				descr->vf_info[i].res.height = vf_info->res.height;
+				descr->vf_info[i].padded_width = vf_info->padded_width;
 				ia_css_frame_info_set_format(&descr->vf_info[i], IA_CSS_FRAME_FORMAT_YUV_LINE);
 			} else {
 				descr->vf_info[i].res.width = 0;
-- 
2.43.0.rc1.1336.g36b5255a03ac


