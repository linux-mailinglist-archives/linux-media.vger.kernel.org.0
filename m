Return-Path: <linux-media+bounces-57713-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJi4C/Fmy2mAHQYAu9opvQ
	(envelope-from <linux-media+bounces-57713-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:17:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3AE3646E2
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 38E85301B7B9
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 06:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3A93B19A6;
	Tue, 31 Mar 2026 06:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/dPmRFB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02873A8FE1
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 06:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937827; cv=none; b=bySmwbXem1UF5ieU6hLGos/tMwuariO04AHyq7dBQdg+qHXha14fcM3Lwz908kF84rPpQThpdW7pg4nnEmcVCUaYfcV539l66R5XVSNVmHHdqlyu1Sk+OPFAxzQzy+Dhx+E8+6/gRhTXhA50oPuYnK8MuFPW4nPIZyNER0MiLCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937827; c=relaxed/simple;
	bh=32Nkju6QPo7DcDfAct7IAD8EQeQKUz1dOWtW6JHOpPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUcwTsyMln983bMedywZrxRR9kIH7DKR9qVZtGZlPq+0+rP5aPLTBaRJZrRbiNFfyhWRS9iSkfCiZr/hvsAQCauTisFQ1qTooYQiayRo1orgL3QPco6RY8gFuE7UPIG0ERHcGXVJGaDJciqpqEfMFH4eLnJvgNdptXH2lxpLns8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/dPmRFB; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a13e1cfa45so6218272e87.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 23:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774937822; x=1775542622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=slrIynpsyCDGbw/DVJ139y58tD8HDF7VkYtGZ4Dd10U=;
        b=P/dPmRFBIohgW+J1TbSt/GE0XAz0coqH2iZXs2lf31kShRPnxveKhLhjnVtYaAMRmP
         ekQ+yBAxsKy/D4NpGexvd9aIl8hndoaQnUwSyq9OM95X5c2OnhfDT/BegYZ50cfzANPy
         W21i3Id2f0l9Ar6gpzFX0EsCcZc1iD7d6Svpw7/9sZzTwn+5TQn/KCtxFF5xSzEel+1Q
         K5ERR+HkEbnasS0hFmbw6f7Ke/r/umNNifE7Mtd7b+Qd4zd981TvRGztvIF/yjfTL/A+
         wmbRNuX/fpBdEaoa3f4+bdar5M/B9y0Npq05VkBRcPlgG7dzQy0R1hwH/DCHzeDFaEJ2
         Cu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937822; x=1775542622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slrIynpsyCDGbw/DVJ139y58tD8HDF7VkYtGZ4Dd10U=;
        b=AzXU28g8EK7CcZcxV593WGgt0V44OXaMBv8hi8S1No4p2uryywEyl75Dc/NGZ27DVp
         5Kp7+V/1nbsOf1Ad8N5A6ZylDSaYwIlVPCliJg1GGRKv3HZ9N1zH2e7ShelvUHlN1AYX
         y4gC1yKP0Vz1A7HBMIAjaTFqz4GTgUnJfBPyJYSOUi77eH8CdLPuGI44W0EwznHYk1Sz
         oBatGBvILIJrxchSzsqABiV1+aZOpx+Eacq6yEzoDcV61Vbf2+e2VrRnIpnSyRbTOSUh
         lgRXQrmmdYyQqzoSvzOrL6sq3DQ5cZlnqpo4ZxZRBAMaPs/60+st5iQ/WtZNvopbz7qR
         XalA==
X-Forwarded-Encrypted: i=1; AJvYcCWQy9fGK1fX8dvnwEkq5/MOXPsXWN4sV+Ear49JLBxoNwuEPZOw1c9rFbRcZkCw+gHRE2DwoGPgakkNQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvbK2gq/e/23ivc9sZtA/rjyRmBTxc7AMFsF4Qo5G/h7Xgjmqo
	a69ppbqIgwBBIZ6cfKmKH3y8zGfHGz5zA2F762XHts8YEeaQdKPXeney+29DZbxRgPIKKCvG
X-Gm-Gg: ATEYQzxiv6Nq41ZDRc9WXCsjfOVR/pMkLCQU8P1FtRnHBEwJV92k/MRn6taYrMZu6OA
	G38mnWyvz1Ol2LQSymTaBycJ8IYnaauGR3zxCblnczMLCTdHz/U63zXPPjnMl21IZcCMuribBUv
	LdLFi5HDs9o4yf79cw3slAn1CT9p90jv0AG/B6I/OyFmU7MyKV6WB63Van1O8EDaaT6lMFFo2ro
	WLrq1F0Zm8+fyr11CauChKDZ4wYKzq3obyJB82U7Mr4vITtQW60+p/p29Vk7o8Ik50PXsaFzead
	l1iuu9IXNiewAklPDpUDq03bbN6qQLybsWEfPDCHUKKEExfB1clRUzvFOZarAtrRZlVygJA8feq
	NDoiKde1SU7glOVd1Z0esui3cPShq5WVBG+GpfZbN1/XZ3BePR1oBmqXfAzXkeO7S4ykGtQghtg
	1x2U1dFiCMP1uNGdS5gODmCCRzHnOZSazkeA==
X-Received: by 2002:a05:6512:3b2c:b0:5a2:b3fc:b877 with SMTP id 2adb3069b0e04-5a2b3fcbaacmr2578412e87.25.1774937821564;
        Mon, 30 Mar 2026 23:17:01 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1455e14sm2145277e87.64.2026.03.30.23.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:17:00 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: kraxel@redhat.com,
	vivek.kasireddy@intel.com
Cc: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v2] dma-buf/udmabuf: skip redundant cpu sync to fix cacheline EEXIST warning
Date: Tue, 31 Mar 2026 11:16:57 +0500
Message-ID: <20260331061657.79983-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57713-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D3AE3646E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When CONFIG_DMA_API_DEBUG_SG is enabled, importing a udmabuf into a DRM
driver (e.g. amdgpu for video playback in GNOME Videos / Showtime)
triggers a spurious warning:

  DMA-API: amdgpu 0000:03:00.0: cacheline tracking EEXIST, \
      overlapping mappings aren't supported
  WARNING: kernel/dma/debug.c:619 at add_dma_entry+0x473/0x5f0

The call chain is:

  amdgpu_cs_ioctl
   -> amdgpu_ttm_backend_bind
    -> dma_buf_map_attachment
     -> [udmabuf] map_udmabuf -> get_sg_table
      -> dma_map_sgtable(dev, sg, direction, 0)  // attrs=0
       -> debug_dma_map_sg -> add_dma_entry -> EEXIST

This happens because udmabuf builds a per-page scatter-gather list via
sg_set_folio().  When begin_cpu_udmabuf() has already created an sg
table mapped for the misc device, and an importer such as amdgpu maps
the same pages for its own device via map_udmabuf(), the DMA debug
infrastructure sees two active mappings whose physical addresses share
cacheline boundaries and warns about the overlap.

The DMA_ATTR_SKIP_CPU_SYNC flag suppresses this check in
add_dma_entry() because it signals that no CPU cache maintenance is
performed at map/unmap time, making the cacheline overlap harmless.

All other major dma-buf exporters already pass this flag:
  - drm_gem_map_dma_buf() passes DMA_ATTR_SKIP_CPU_SYNC
  - amdgpu_dma_buf_map() passes DMA_ATTR_SKIP_CPU_SYNC

The CPU sync at map/unmap time is also redundant for udmabuf:
begin_cpu_udmabuf() and end_cpu_udmabuf() already perform explicit
cache synchronization via dma_sync_sgtable_for_cpu/device() when CPU
access is requested through the dma-buf interface.

Pass DMA_ATTR_SKIP_CPU_SYNC to dma_map_sgtable() and
dma_unmap_sgtable() in udmabuf to suppress the spurious warning and
skip the redundant sync.

Fixes: 284562e1f348 ("udmabuf: implement begin_cpu_access/end_cpu_access hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

v1 -> v2:
  - Rebased on drm-tip to resolve conflict with folio conversion
    patches. No code change, same two-line fix.

v1: https://lore.kernel.org/all/20260317053653.28888-1-mikhail.v.gavrilov@gmail.com/

 drivers/dma-buf/udmabuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 94b26ea706a3..bced421c0d65 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -145,7 +145,7 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 	if (ret < 0)
 		goto err_alloc;
 
-	ret = dma_map_sgtable(dev, sg, direction, 0);
+	ret = dma_map_sgtable(dev, sg, direction, DMA_ATTR_SKIP_CPU_SYNC);
 	if (ret < 0)
 		goto err_map;
 	return sg;
@@ -160,7 +160,7 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 static void put_sg_table(struct device *dev, struct sg_table *sg,
 			 enum dma_data_direction direction)
 {
-	dma_unmap_sgtable(dev, sg, direction, 0);
+	dma_unmap_sgtable(dev, sg, direction, DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sg);
 	kfree(sg);
 }
-- 
2.53.0


