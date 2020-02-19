Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 556581644C1
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 13:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgBSM7T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 07:59:19 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44599 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgBSM7S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 07:59:18 -0500
Received: by mail-wr1-f66.google.com with SMTP id m16so374813wrx.11
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 04:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hCeM9CJ6pzmi1o3KK+XpvWx7SxeTxw84lBGmVzLUTd8=;
        b=giRn9oVt2bLLBetMmwF1HDSw7QygLii+yESQB5yyQvHBoCUPNuhnnuCcO40866mAXl
         ZgzznsO+vKrBC+IcmIylWWYdRBFFIzr4HwBm1qyHfGjl8qFfWwtb3M+N4FT7V8mYFFcH
         NsI8ko5OmvLIaTfedhhSSDd1gQwJfwjRocqOg3wWBgKFcQykt78LG7Sn52D3XGKIPlNK
         tl11S5HhDJ2Gt7ZZrcMAJsDWjTh8UK7MGGlawsYsxffHGrX9LQwjthDrlY6FdXK5q6gh
         Sht+o8y9KkbLvmRyk348Ter9+EWz62i6Vx0g1R+1qwJH8foAUktVPR3WhQK6Yzyr4LLo
         s4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hCeM9CJ6pzmi1o3KK+XpvWx7SxeTxw84lBGmVzLUTd8=;
        b=F7I3kgAfdarwvPK/FhIR8e9Iu1AJU8sgWgICO155SvmPXeBa8e5575TIsuhMWO878L
         UBor4kkqX4Q13/qzaCBbHTPw4OszpDHQLQRANHSUzyzOikXjjEoN1GdthYEzzSzOTQ5y
         2eMu6b1JA9zJBnnAKcFo7Z0J8UDWIS5AEMKiRxrqFyWU6hI2ZOMowZ/1KkPh1wBIANLE
         4oIX4Sajz76/QbnlhHQqyuCWnWAyMlB7DMsrzx3R8ojSmjA81u6iNfC3KgQlh8YoOTY5
         PbLOJvTTowUfL08nF50lIAr7MAOAzO6FstjRwSeFdk3VcCiRQwwTkztW6E8lBHXITlmN
         7okw==
X-Gm-Message-State: APjAAAUA0A1tbs9azAVoRY8xKbkroYGiSCV3areaLxImZif/3NB0kxYr
        mG5rCeJwgTpeprDb0pqZK5Q=
X-Google-Smtp-Source: APXvYqySOgedUHE0WIseUqC6YRH4GURoV+8ztV20bSWnbuN2/ag6oz0YQs44nziyGSFcOqFV5ziYRA==
X-Received: by 2002:adf:dfcc:: with SMTP id q12mr35180842wrn.171.1582117156160;
        Wed, 19 Feb 2020 04:59:16 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:90ea:9d7:18a3:895e])
        by smtp.gmail.com with ESMTPSA id h2sm3079024wrt.45.2020.02.19.04.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 04:59:15 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: [PATCH 6/7] dma-buf: drop dynamic_mapping flag
Date:   Wed, 19 Feb 2020 13:59:09 +0100
Message-Id: <20200219125910.89147-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219125910.89147-1-christian.koenig@amd.com>
References: <20200219125910.89147-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead use the pin() callback to detect dynamic DMA-buf handling.
Since amdgpu is now migrated it doesn't make much sense to keep
the extra flag.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                   |  5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  1 -
 include/linux/dma-buf.h                     | 21 +++++----------------
 3 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5f10d1929476..6d0a82d1b23d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -524,11 +524,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	}
 
 	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
-		    exp_info->ops->dynamic_mapping))
+		    (exp_info->ops->pin || exp_info->ops->unpin)))
 		return ERR_PTR(-EINVAL);
 
-	if (WARN_ON(!exp_info->ops->dynamic_mapping &&
-		    (exp_info->ops->pin || exp_info->ops->unpin)))
+	if (WARN_ON(!exp_info->ops->pin != !exp_info->ops->unpin))
 		return ERR_PTR(-EINVAL);
 
 	if (!try_module_get(exp_info->owner))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 1a040ccf61bf..ffeb20f11c07 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -364,7 +364,6 @@ static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 }
 
 const struct dma_buf_ops amdgpu_dmabuf_ops = {
-	.dynamic_mapping = true,
 	.attach = amdgpu_dma_buf_attach,
 	.detach = amdgpu_dma_buf_detach,
 	.pin = amdgpu_dma_buf_pin,
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index b38cea240b67..1ade486fc2bb 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -42,18 +42,6 @@ struct dma_buf_ops {
 	  */
 	bool cache_sgt_mapping;
 
-	/**
-	 * @dynamic_mapping:
-	 *
-	 * If true the framework makes sure that the map/unmap_dma_buf
-	 * callbacks are always called with the dma_resv object locked.
-	 *
-	 * If false the framework makes sure that the map/unmap_dma_buf
-	 * callbacks are always called without the dma_resv object locked.
-	 * Mutual exclusive with @cache_sgt_mapping.
-	 */
-	bool dynamic_mapping;
-
 	/**
 	 * @attach:
 	 *
@@ -99,7 +87,8 @@ struct dma_buf_ops {
 	 * This is called by dma_buf_pin and lets the exporter know that the
 	 * DMA-buf can't be moved any more.
 	 *
-	 * This is called with the dmabuf->resv object locked.
+	 * This is called with the dmabuf->resv object locked and is mutual
+	 * exclusive with @cache_sgt_mapping.
 	 *
 	 * This callback is optional and should only be used in limited use
 	 * cases like scanout and not for temporary pin operations.
@@ -116,7 +105,8 @@ struct dma_buf_ops {
 	 * This is called by dma_buf_unpin and lets the exporter know that the
 	 * DMA-buf can be moved again.
 	 *
-	 * This is called with the dmabuf->resv object locked.
+	 * This is called with the dmabuf->resv object locked and is mutual
+	 * exclusive with @cache_sgt_mapping.
 	 *
 	 * This callback is optional.
 	 */
@@ -455,8 +445,7 @@ static inline void get_dma_buf(struct dma_buf *dmabuf)
  */
 static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
 {
-	/* TODO: switch to using pin/unpin functions as indicator. */
-	return dmabuf->ops->dynamic_mapping;
+	return !!dmabuf->ops->pin;
 }
 
 /**
-- 
2.17.1

