Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50681494EF0
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 14:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235404AbiATN1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 08:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235180AbiATN1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 08:27:54 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1579CC061574
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:54 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id q141-20020a1ca793000000b00347b48dfb53so13857442wme.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
        b=LNchh6gl8Sin17f9Wh5+/HOL+rNQVvxSyd0bp6mFiYCrspxHZQU9U+hvKXcKIpg1U1
         UazaERxWOtIx6YUDh9JMiIzosFBPSpxII4osAS4ZUNCFXbDeO8QEu0i9X2CEj/YFdjI5
         bWwlNi/o+C2bmSXH49DQMovVVvKxYEGQYS9wwdrkesT33RNCvgjvPkDDfs3m68DjiiIb
         xVbzbCSzQC4DKcKcF+1eHAsLQa1/U82DW2+HY2CYHgguNQTHpS5bGW0N5QhulqLeyOnQ
         znAkuM03oahCp8aQq+CoPnR5LwzSSz82InPNk213n8MVV18WP/Wl6NtNA1tkEcOg92Mr
         NZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
        b=zYQhMmQkkgkUGcLiNNPvbvHr753vX3F+VRjodz6k+L7ge78sJoV+xTnEHv9EA6cktK
         P5zfKSqBuLkbvQWx7wawd21Qmcel897PTzTqsjUSqHgIsHIb/X69CsNhNFo7caaTUbby
         MFTDCOol3YxGHn8uASy3DQrzZWbSzkIb241p16ruDiM7ZDJiSJEP5awJ+iEPOdjLrOr1
         RCgvUSjD6IciCV6DTkEMX8egicRlzwoYFK2kUF7kcLSaSGfmyqaXLl9+KXoUJ+r7aink
         Wo5jg6xPHFwUvkMoj9+TMSQGyEynUp5DrJFSYoiX4m9SSxp5i7P1WkdLE8PKTaE5ppf1
         i6mQ==
X-Gm-Message-State: AOAM5308WNaogsW6uDYBz+Fg3KyNpDaILnRgCbThKat8Y2uTexEBfR5V
        izw/sWGghzMcVoyQMzh3V/s=
X-Google-Smtp-Source: ABdhPJwzwzhmn3CcMtiwnM1MVezq2gDxAcy2+ILKUo9enxe96/BtMCoq9XKzEf6HEkqNAqFTxFg6YQ==
X-Received: by 2002:a05:600c:5125:: with SMTP id o37mr9069286wms.161.1642685272749;
        Thu, 20 Jan 2022 05:27:52 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 05:27:52 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/9] dma-buf: warn about containers in dma_resv object
Date:   Thu, 20 Jan 2022 14:27:42 +0100
Message-Id: <20220120132747.2348-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers should not add containers as shared fences to the dma_resv
object, instead each fence should be added individually.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 6dd9a40b55d4..e8a0c1d51da2 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -256,6 +256,11 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	dma_resv_assert_held(obj);
 
+	/* Drivers should not add containers here, instead add each fence
+	 * individually.
+	 */
+	WARN_ON(dma_fence_is_container(fence));
+
 	fobj = dma_resv_shared_list(obj);
 	count = fobj->shared_count;
 
-- 
2.25.1

