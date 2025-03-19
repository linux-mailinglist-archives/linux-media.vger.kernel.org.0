Return-Path: <linux-media+bounces-28481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD966A68C74
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 13:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C855C17E665
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A340C255E47;
	Wed, 19 Mar 2025 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvfN9EX8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B25255E32
	for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742386258; cv=none; b=WMpdfMkh03qRHUerEjvW1mXHjJoOkrAkexGdsUxre0f1X24UNUGgzdCefz7CW0923NTjfiOZe1AKArkPURgdmEF031ckHdDE/aWpr0kEWhArFaYpEctpM88Rh+lpasY+q6LqpR6mCjNoQskdQXHbS7aKM1vshmvQC6LwiuVcjyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742386258; c=relaxed/simple;
	bh=G7NQhlYi/kHEIZJ6KFDfFjuxatvH7Nf5cpE1EqfT6Ls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YAAmu4c3A8By5/wMzaQBbpowRicgaay3ioETwNRY7B1Ml3eYsfCI5E2CDzEpt+QezPSMJwc8PKWQ3W0LQhFAj4ktJxVoOskb02+QpM3+dDUl5HINocVexgd/3O/WbUuC4YqZqfS5zD7BcyMd8f/dqDP3YCtxkqv0LTmAUZv7EdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvfN9EX8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742386256; x=1773922256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G7NQhlYi/kHEIZJ6KFDfFjuxatvH7Nf5cpE1EqfT6Ls=;
  b=IvfN9EX8d45Z9duUsEO+3w6lrKWYsTUMuq0NBMRrHYb18qfSeyQR68VZ
   R5pn/LxqPWAwftgf0bhz2gqiwidvZPjcFhO/5G+T6zvkp1K8V4/ElI08e
   5uXI9wHhLWuDjhm2AMupy2tyQYloDGmMduC+Sr1t7eg8ZVb69loYiewsH
   sCmXY7GVVIR8SwTu2LUd3b11SoMBCYTojMLFhdw3qOL+eXg3Ls97L473y
   uxSojA0hUoAyUAloyLlJtgQp92BiMuq6Oov89R6ucDweJ5gUnu/bpEOvg
   ejSkKxiQ6E4tYNaq31BaDIt7JsnWzLcSW9Y6imWkE1DntNgcjmMSHdzeK
   Q==;
X-CSE-ConnectionGUID: aWjlMMdHRU6GbxITF4DLDw==
X-CSE-MsgGUID: CXCIpzkrRZuvjUzTf7u5fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53785889"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="53785889"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:10:56 -0700
X-CSE-ConnectionGUID: 7ROpEWQST9m841GK9uKvlQ==
X-CSE-MsgGUID: 2WhphlRpRSiCW88t4TbioQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123086699"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.118])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:10:55 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 2/5] media: intel/ipu6: Make two functions static
Date: Wed, 19 Mar 2025 13:10:41 +0100
Message-Id: <20250319121044.113705-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319121044.113705-1-stanislaw.gruszka@linux.intel.com>
References: <20250319121044.113705-1-stanislaw.gruszka@linux.intel.com>
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


