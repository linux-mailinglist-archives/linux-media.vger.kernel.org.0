Return-Path: <linux-media+bounces-28128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EF7A5F0BC
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF4FE16BFB0
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B4B265CD3;
	Thu, 13 Mar 2025 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4x6HCDD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAE3264F86
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861486; cv=none; b=sFfnmfp80ym4zP+Ocl2CqTYA6h5ux+fKVs7x1+tglfDFMBQmjjmFSFvozJ/IJdf2MOhBQCKPoI9C8IK7cln+XIQtT7rqatjWnxDPNjrcaEB1cO6bvjgSCYjIrq9D0NqPrk9dTX1kOpmmYFn2/zAteYLWh6vVwILV5WBQDx47FoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861486; c=relaxed/simple;
	bh=G7NQhlYi/kHEIZJ6KFDfFjuxatvH7Nf5cpE1EqfT6Ls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ps3TiCimk/Y6QkMcEW9jBODyPPgEEFXdSuAYSvDcuoa26637S0ckM2MIJZP25/h5ABMz6CbbZMchUvAJ8NpdIOV0DR5E62FVgvh7RcqACoP0MJPRbC8EOrG0a48Gs3oexi3JlhVXFrag1vUj7OSNUkYZY8MukL1sRruALeEvxB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4x6HCDD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741861485; x=1773397485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G7NQhlYi/kHEIZJ6KFDfFjuxatvH7Nf5cpE1EqfT6Ls=;
  b=J4x6HCDD245TAlG7eSJv/mjxtnA5v8Fa1etq2BqFPGZInENgk+lfGS2A
   V5vGemBu9StLG6beNWvZ9MooGj3L4SihKdbqhdpkhUkJEi6coO+zFVSYV
   IcOwU80z06KHCX9TvLeJi8RBSU5U8d7wM+7rCbsFUDSom4RILHiE4nm+w
   M3PnDBTiiyvFPo64kcWoNVh4PGD7mZuSKAlrGhQtzsdWnGyk2T16HvRir
   Au/Az/os9+rwAz3yVrwCD831lwzbaK3jQ6tyUP7VPHzS4jj+7gBEB34dh
   F2+4CL1O1rTCKGbBmn4oMvtWznObw627Cqe95ScVtae8VuvoHlWH49JFk
   Q==;
X-CSE-ConnectionGUID: SMD3dJ72TlGO/QESsPo+Nw==
X-CSE-MsgGUID: 9x2MFYS0SOyVrPdNblvmSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43102673"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="43102673"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:44 -0700
X-CSE-ConnectionGUID: thqEsF3rSC6R6jYN7JDfaA==
X-CSE-MsgGUID: XWBDuQRnRSaRDJfXR0HBfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="121413897"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.114])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:42 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 2/5] media: intel/ipu6: Make two functions static
Date: Thu, 13 Mar 2025 11:24:24 +0100
Message-Id: <20250313102427.131832-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313102427.131832-1-stanislaw.gruszka@linux.intel.com>
References: <20250313102427.131832-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function used only in one file static and remove from header file.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 ++++---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h | 4 ----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 9a19695abbaf..3984b9d43919 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -697,8 +697,9 @@ static u64 get_sof_ns_delta(struct ipu6_isys_video *av,
 	return ipu6_buttress_tsc_ticks_to_ns(delta, isp);
 }
 
-void ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib,
-				      struct ipu6_fw_isys_resp_info_abi *info)
+static void
+ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib,
+				 struct ipu6_fw_isys_resp_info_abi *info)
 {
 	struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -721,7 +722,7 @@ void ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib,
 		vbuf->vb2_buf.timestamp);
 }
 
-void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib)
+static void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib)
 {
 	struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index fe8fc796a58f..1a277b0fb4b5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -69,10 +69,6 @@ void
 ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
 			      struct ipu6_isys_stream *stream,
 			      struct ipu6_isys_buffer_list *bl);
-void
-ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib,
-				 struct ipu6_fw_isys_resp_info_abi *info);
-void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib);
 void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 			       struct ipu6_fw_isys_resp_info_abi *info);
 int ipu6_isys_queue_init(struct ipu6_isys_queue *aq);
-- 
2.34.1


