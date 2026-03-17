Return-Path: <linux-media+bounces-55992-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMFGHI3ouGkllQEAu9opvQ
	(envelope-from <linux-media+bounces-55992-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 06:37:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4E2A4053
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 06:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47DA3302AC34
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 05:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D3337F018;
	Tue, 17 Mar 2026 05:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdOt05lH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E1837F730
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773725825; cv=none; b=ZipK4EjXzxtd2SCtFd+biJMuLKsb7f/NYRk1ak6Z1VpLc6U+/AV2QoM5OB0LOZxhkxqZRQDETXXA5dQue5jD7KAxyQDdMM48gkI/n7nw1qU+tY0ru5iMnE9PW+p51kRuXS5dxXYGfHEwOCxegVgW09TbHVdK1wC8/1uP1q5s8vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773725825; c=relaxed/simple;
	bh=GxQU1VRrYRoTgEMwUUU2mm0qyNrjehpCX0AAPIFbHH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Al+fNsDoYqw/U61s2VfJBdzwhvqYfC9v4cuIG+ofvUmsCYIOHptGLrEGxnhIQgHmAXrJsJ1doaulXjwk4OZX53DJ53HCkwM9JndoDDJ+atee5brgQvVH+zJ2MUhcm1K6gYyM70014eLBZ6IWkYr0PejFGO/4o7h+wmilLDWMKgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdOt05lH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59e4989dacdso6045317e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 22:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773725822; x=1774330622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2NiRAQv05vxst//6uLfp/yYFASGq0d9XovqJe++xcxQ=;
        b=OdOt05lHxGWg/gkvUpH+ItKSO494Xz9SfA2B3Ljhl5zGJyjtsgTkniIdCbAJF+MPcX
         IvhR+Gedu+wSCPxqdJB5QQDEHeCD8RjHjE0T7O69qbHvKdgDa8+42Z/Z4KrulFtIoB/A
         utRMtx3b36m/NUmoTif/d/VDP5d+fuTaWeuemjRImCPD4KMAp5/JCEo2XW4i8UUTZ0uc
         Lql07SfF9PonCAskYOki3fme8O0WZkOR9BJYXatgeoknwNVQZaXa9/3LndeDCqtJfr9j
         1okDnOTRNNoToBIuRjrSt5B6nLDAio8TzT30N1jvtIk4gh0mYdp6EzCQTZRlCc3K/6ZI
         9mUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773725822; x=1774330622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NiRAQv05vxst//6uLfp/yYFASGq0d9XovqJe++xcxQ=;
        b=ks/0M7fgkAsaxWEelaBVsoQd25EQH/L7rXmL+0HRTqnO9sVA/uS0lHYpO6gG8cXEi3
         Sn/tgLtDlHPBsUaisdpYqlnBvy1MdW+4QHtxfNkgRaDZU+hVJxNu4F2X83vBorJ9zAAU
         tS6bgR3W5VaVDJWKtfmk3WLxo0BQ8BgwSFRaVGnQh5tETGTUmgDbz//ZGAWdJS+GzOSh
         gvlj0QPR4kDomiYFpINw/wiMqTP2raesAUqCO6BYxbX/RntoM1ERt9j62Ioi4ag2RFkT
         jKxigCG/V9SHhjXAn6ZvvwLTUh6P8i57fUVch1yRbURMJ8eluuiYz95ojWrxrt1TdBBn
         IfAw==
X-Forwarded-Encrypted: i=1; AJvYcCV6LwU9GP8kVGpIvbB5XZXjuMdo37YIzOYw1G2X6c26KKa+838eU1E+Z7V9fcEnNQfZ0wJcFXEEV2CWsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylSt0vVeyLGYsPRQDVXg2HT0Q7ViOXoj8I9JEOgnfw31jFBWfx
	d2lwuDbT+6x6wtU40Of2yLrq0kk85Py4osZh5UHmuK8MU4sGMJpT9EsI
X-Gm-Gg: ATEYQzzB1hgeWBQKaIXDD2aUvl3BO+8ljVoP8SlD+gB9AVEt+XiFkmimEpkyOtN1uty
	GgW7uOrdFYtsnCPjtMCMfJv8Wei7uWHMMD50c+XZVrO6UUXwT/2FDpCT4AmcxCpaslBhF72KBJR
	2lGTFWaM6EyCzguR0T9V+7yRxtzBwFd5/6+uNh1XD22GJNBLNfUNUyyCJ27NwWMigvkRKma2wzw
	BFBl0YYoSgZA+p5WAJB22WwUzwpNETeGPW2XVXWzzh7RtgiPXbXZXPhmLh/3qQn2vZwaZThdW3g
	tLRLtBavjuhGxncJUr0o2TSDZJ1Lqh85SvqSU09HWUK++5Zn9qRCkxuv2E2Pp/zjfOi2qBKgum9
	l5bja8wAS5q75Oft0alWLK8zfg4+FQfjllw7u2fZZLU5d87L4oCcVa91GdqkZbEFjI7ZLnLzehJ
	Nag6Aj32GgK8vSueKD+rHnlp6KwVVpQk7qiMxH+JhalQ4z
X-Received: by 2002:a05:6512:2350:b0:5a1:c03b:7980 with SMTP id 2adb3069b0e04-5a1c03b7a7dmr186889e87.28.1773725821391;
        Mon, 16 Mar 2026 22:37:01 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366606sm3958338e87.73.2026.03.16.22.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 22:36:59 -0700 (PDT)
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
Subject: [PATCH] dma-buf/udmabuf: skip redundant cpu sync to fix cacheline EEXIST warning
Date: Tue, 17 Mar 2026 10:36:53 +0500
Message-ID: <20260317053653.28888-1-mikhail.v.gavrilov@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55992-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EBC4E2A4053
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
 drivers/dma-buf/udmabuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 94b8ecb892bb..9c6f8785a28a 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -162,7 +162,7 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
 			     ubuf->offsets[i]);
 
-	ret = dma_map_sgtable(dev, sg, direction, 0);
+	ret = dma_map_sgtable(dev, sg, direction, DMA_ATTR_SKIP_CPU_SYNC);
 	if (ret < 0)
 		goto err_map;
 	return sg;
@@ -177,7 +177,7 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
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


