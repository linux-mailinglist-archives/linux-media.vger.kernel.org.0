Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D5C49804E
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 14:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242867AbiAXNDf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 08:03:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242717AbiAXNDe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 08:03:34 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8093C06173B
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:33 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id u15so13452435wrt.3
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iln5gjTz62zqfYGlcLHz+tSndCkcbqCw4qI5vFOyxu0=;
        b=FtHZGsNcCMqHb5xGQRdkRgDH7RY0N6RZ6ivUXEw1s/MNexBi1c+CI3gtAY9Bv8brI1
         H3O/N1KMMFQVs1/envxvkYCilUUZlxpsTpL0TvzG/BLSlZPAlhy/cPZmWDgMM3MmJgfx
         OmPlwkliusrYX8Qf7OBR50y+pbNSSQMD33G0N1MhfeW+FcSJ3eBWo1+2LiJLjYQ2QaUQ
         JRyKrN8GVPmuqoSdHyAgT0toI9zbc0Zkdsb8rjia36TU00FmIWxdJHylIZpA4GaD1oQy
         H4mYax9UFCpO9Q1zNA7fLevRivELP4sOTpGi0fpSqol/Mu6h4VoiFRdgpw7qFAFD3c1y
         gRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iln5gjTz62zqfYGlcLHz+tSndCkcbqCw4qI5vFOyxu0=;
        b=zvw4L8oayaglxWvKAXxIMsc1I0sCrI3UmSzJy2qPSIeeQY2SO3J7tQMyVEgpZYrbQw
         f/h06A2JMOZMQBzXvchCUft4gDoLdbca3UnfooWsXLXVzuGNfixRBy3Zfz4e5w5LQ+Pl
         uY8vSMQT6631NfoBNlqs6SfU5qn6+mo+OKfht8hFkkWzaaAnn98pHmMGTTUMmKKLC2Zk
         fktUB5MpYAKsSFqILRuiXH93uoNPkawVCe5RSPFLVy5QI5pSM4nzJBMnU0DA3bp5Bg1e
         n6WUzROz1LdTG54DUPl1WLkd8mf7nEyA6a2NJFDZlzm6yt5NzK+87ucS7RF3kCmB9lY7
         qMDA==
X-Gm-Message-State: AOAM533F7+LPwXaCrcTfl8WCGpHisNsFIwEU+x5Q2l95NshOq1/5s6rf
        LooCmocO7yb6qE0bhvbzQrWiKI8kiMg=
X-Google-Smtp-Source: ABdhPJx73TPcrcp4J6XlhIWaLhB6ba/1n7iR3MXQPOOTPOBZn9KdwnCJrygAK0v9RCLneem3MgsKXQ==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr2845559wrq.122.1643029412475;
        Mon, 24 Jan 2022 05:03:32 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 05:03:32 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/11] drm/radeon: use ttm_resource_manager_debug
Date:   Mon, 24 Jan 2022 14:03:18 +0100
Message-Id: <20220124130328.2376-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of calling the debug operation directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 11b21d605584..0d1283cdc8fb 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -802,7 +802,7 @@ static int radeon_mm_vram_dump_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -820,7 +820,7 @@ static int radeon_mm_gtt_dump_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_TT);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
-- 
2.25.1

