Return-Path: <linux-media+bounces-31226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C02FAA9F574
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 18:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77B551A80566
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 16:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3169227A92C;
	Mon, 28 Apr 2025 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxaZTFD+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16411279789
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857021; cv=none; b=bmmFgFJJ8utSMWYLM1128XPLoOdiNooCC+r43iug9iR9xnmtngMLJCg/gDT75Nx3PjQdi/6u5qOoF8TZVO0jfXUzoQnW9s7L61hzR4H0CEVP9b3092/mvL1SeRJl4aO9eW3a1xJEsvMsTSzUQf7LO42nN/WPPXchDErqxR4PNco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857021; c=relaxed/simple;
	bh=OektgsmfKk963NaqrIENyN4vGCTuLbafDvoklirhBxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jk8G9au3SIS+77s57OsN1KZdNNiRDj/GRzzmY0/y04QtBpchbqiYK6GsFownFcLKBWLnSQMgvpeYj43O0pFKRb4VG0fkNLMLGzncGPQA7iMWB54JFBTd4rqX/0VwHAVKBN3npyQnoxraH/4EV4gX9Zy12lCN5A+zQCMbfiWZIbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxaZTFD+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745857020; x=1777393020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OektgsmfKk963NaqrIENyN4vGCTuLbafDvoklirhBxE=;
  b=KxaZTFD++I/cowzzd/tkcQ2L5smWbC7yBL0AwRrlYhiUCcI4llFjBw6/
   mjaL7Tyii6JNoEjdHypH7JNKuludYXvc77tsPdMw/LH/0Ihio1K/wSh+A
   JlyvYPl0aDgKEZunGKjX52tR/NQL04laH9aLv5+GK+6K1QTeksJ2v6fU5
   zzfROIG3JKevdhfZPKlcGs3Xm7DAu3wwDWTDtEBmiC8oKzXxsY0pyQ78Z
   BNGksyzhiiP/GPNlBbPFYosC4eIwQR/I0JvJ6YSw9iPIy7sIcp9nDR7vL
   Ur0MMFOsmeW2YJcE2iqsfxrH1mqmIwRpxtYq/C4NfNQQjjNTSroqVeOxj
   g==;
X-CSE-ConnectionGUID: BJHKPxS9TyGVGX3LBh4CtQ==
X-CSE-MsgGUID: BpbGagQRR7y942W0J06rVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47547141"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="47547141"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:16:59 -0700
X-CSE-ConnectionGUID: cpO7UqWvQgaKlD+OJsBbjw==
X-CSE-MsgGUID: dmaCD2vTQLS/tb0CaL24hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="164522866"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.253.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:16:58 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 3/5] media: intel/ipu6: Remove redundant ipu6_isys_subdev_to_csi2 macro
Date: Mon, 28 Apr 2025 18:16:41 +0200
Message-Id: <20250428161643.321617-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428161643.321617-1-stanislaw.gruszka@linux.intel.com>
References: <20250428161643.321617-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

to_ipu6_isys_csi2 and ipu6_isys_subdev_to_csi2 are the same macros
with different name, use the former one consequently.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c  | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h  | 3 ---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 2 +-
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 543f81b1899f..c8935bf7df31 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -560,7 +560,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream)
 {
 	struct video_device *vdev = stream->asd->sd.devnode;
 	struct device *dev = &stream->isys->adev->auxdev.dev;
-	struct ipu6_isys_csi2 *csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(stream->asd);
 	struct v4l2_event ev = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 	};
@@ -575,7 +575,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream)
 void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream)
 {
 	struct device *dev = &stream->isys->adev->auxdev.dev;
-	struct ipu6_isys_csi2 *csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(stream->asd);
 	u32 frame_sequence = atomic_read(&stream->sequence);
 
 	dev_dbg(dev, "eof_event::csi2-%i sequence: %i\n",
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index ce8eed91065c..24ed13b4a63f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -57,9 +57,6 @@ struct ipu6_csi2_error {
 	bool is_info_only;
 };
 
-#define ipu6_isys_subdev_to_csi2(__sd) \
-	container_of(__sd, struct ipu6_isys_csi2, asd)
-
 #define to_ipu6_isys_csi2(__asd) container_of(__asd, struct ipu6_isys_csi2, asd)
 
 s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index f2e8922be166..c11e62a44fbf 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -729,7 +729,7 @@ int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 		return -EINVAL;
 
 	stream->stream_source = stream->asd->source;
-	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	csi2 = to_ipu6_isys_csi2(stream->asd);
 	csi2->receiver_errors = 0;
 	stream->source_entity = source_entity;
 
@@ -771,7 +771,7 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 	else
 		av->watermark.hblank = 0;
 
-	csi2 = ipu6_isys_subdev_to_csi2(av->stream->asd);
+	csi2 = to_ipu6_isys_csi2(av->stream->asd);
 	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
 	if (link_freq > 0) {
 		lanes = csi2->nlanes;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 8df1d83a74b5..9b7ff5c440de 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1266,7 +1266,7 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 	}
 	stream->error = resp->error_info.error;
 
-	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	csi2 = to_ipu6_isys_csi2(stream->asd);
 
 	switch (resp->type) {
 	case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
-- 
2.34.1


