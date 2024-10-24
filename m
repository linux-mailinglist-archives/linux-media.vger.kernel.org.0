Return-Path: <linux-media+bounces-20150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6051A9ADA66
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 05:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E4128157C
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 03:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5FA15A868;
	Thu, 24 Oct 2024 03:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3Mf/3Co"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F184E3C47B
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 03:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729740128; cv=none; b=AXkEWL5HsCdxVSh8C5hTNTLLzTi8OHc88R+yVQhTCcJehMiJYBFYOG1nFGURmtjbueGIifrKsa94dxpZdgTpi2LHcfW6VoavLhDKjoW3AmGfXTzXTQ4dhwQ7I0ZjvazXKumVRwWAtzf+EntCbnMuQsy3FtZje/LwFaZgOsQprPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729740128; c=relaxed/simple;
	bh=ZAKJBL2acN7JlzCIl390+0xbR1Uy/rmnQqVc2hNFLII=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mC0x5UpwaPGH3bVXKvDVZvvVvpNIc2l0vCqZ2NoAUgaeuui9wljMnbNPTrG6U8QZII+a1jqRqFjb+1QPLI0hmFWXrSW3jiYrip9VrUGPQd39NJWKaesStFPRkDfHHdTke+ST+2Kujd2FoEwY6v5IWWIbDEmsf95OTnrLwqtzGt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3Mf/3Co; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729740126; x=1761276126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZAKJBL2acN7JlzCIl390+0xbR1Uy/rmnQqVc2hNFLII=;
  b=B3Mf/3CoIw3pAn78/QUJfn3nPMl6VYOK3RxGv1bX5ltzACDmcdRgKohU
   qFXVXnS5+5BBdkhf4Y/v8MLTju3Zep31ZWCCxAbDmdd7fbAVeEbDHWisq
   /4zq6sYigYjn8cSsF1FTLQRYUgta+3UceU71VdBoZgCIHRGobjMkv6T+x
   BN9YeGRfJVn3iDjcpE57A0fJAp2PaouWioPydNolwDksBRvC/0emcNcPq
   qFXc6jTAsRoe9JsLFWpr00Wp/JU6a29nLNjVm3eaKBlv80FEe8g4SXsIP
   MyehikcyZuiCHiuDdlo6fmTh3ApCyMYVAWlRWDlC6kyPCzJqmyznb2PSh
   Q==;
X-CSE-ConnectionGUID: Z/mvg51YQP2VfZs2q52dEw==
X-CSE-MsgGUID: qDuiXWJLRpqBkrhqsZofnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39938187"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="39938187"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 20:22:05 -0700
X-CSE-ConnectionGUID: 2ytPrZm7SxmNlHyHgDoKKQ==
X-CSE-MsgGUID: OPdd1N/xSwCgynw4hXjJVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="117929360"
Received: from icg-hal3.bj.intel.com ([172.16.127.200])
  by orviesa001.jf.intel.com with ESMTP; 23 Oct 2024 20:22:04 -0700
From: Hongju Wang <hongju.wang@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@linux.intel.com,
	Hongju Wang <hongju.wang@intel.com>
Subject: [PATCH] media: intel/ipu6: Set the VC of the stream as the SOF event id
Date: Thu, 24 Oct 2024 11:22:01 +0800
Message-Id: <20241024032201.3867638-1-hongju.wang@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the virtual channel case, they should use v4l2_event.id to distinguish
SOF events of different streams. Therefore, we set the virtual channel
number of the stream as the SOF event ID. This number is unique.

Signed-off-by: Hongju Wang <hongju.wang@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 051898ce53f4..5ad426afa0f0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -578,6 +578,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream)
 		.type = V4L2_EVENT_FRAME_SYNC,
 	};
 
+	ev.id = stream->vc;
 	ev.u.frame_sync.frame_sequence = atomic_fetch_inc(&stream->sequence);
 	v4l2_event_queue(vdev, &ev);
 
-- 
2.34.1


