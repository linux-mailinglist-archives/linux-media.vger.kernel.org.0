Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B321846164B
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241484AbhK2N3q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377501AbhK2N1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:27:45 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8944C09B06F
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:16 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id o13so36150728wrs.12
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
        b=GNCy9OAidh99/qEk1zKxyw4ypwtKj8LdbT2qsAqoTvD4EFB+BauBwFE+qGkDlWqECB
         8TdYZiIKmH7NT3lkZw0ykvvAfRrkLuoG3bkjH4IIWaQH5veBzyS+4jxm6HTktp59r5Ij
         73IrqDDmcSL2Pznrd2yP23du5MKuhuw4bGgTdiYjf+g/aEabrozTJfTNPLEkmpQtJDLa
         y/eI5q51uizdJ58MlsovowQ3dD51AKQYK1eJMFFIcT2cgzqhYY9YnNDdpG+N3FW5A5rg
         Qpv/HqAY/ySZjMPLap699LVMY1n0yhuMcP8x1uUME4T4PrYc0AI+baPCYmgvztsE1GYf
         KILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IRN4qp5Iqo3k44JzsPUytvzY07JybWV7N7oXbJsRX+E=;
        b=hTakitvAK+wBhcTRdMmAVcOovchgepkbf7CgCd9YeFp53RHTPEjzCgI9CiT+uJM1gO
         T5T+hpbe77u45adNKettAxX/LJzVxsGHNiuoZXLjbv9uVAzV04srWXuoozMoYMLrztdi
         C+NIuJe1nfeKZzJaDAnjg8cbJvMywHIqSWDhGdoAoX6/xlDtNKXrAIROHTkHCvEo1ZlO
         zigcImJzPX5Lu1oz5negmf9Aph31htO5KvY7Zxro9hMOEbEPwxJFbT8ZGs5JqBqpOk8U
         LrIKtWzgSdQuRlpwZFyV4bSi5KW/MefpEGilHYWE3UVqTTaYTGkkBTP6Ie2w0oEaCnnO
         70VA==
X-Gm-Message-State: AOAM532OEM/OcFc9ag+K0Bk0NOKc+/K8YbPm4DsXMvShVWh/avhcjYAS
        8dc15me9ozbZ9eo1VU/q7zM=
X-Google-Smtp-Source: ABdhPJyBF+tlFX4VwvgGat3TR86DCM4R3QSZ1WW22O70tCZn2dZIPBlsIfogSx0kdHmK5dtWChU2+A==
X-Received: by 2002:a05:6000:2a3:: with SMTP id l3mr33033215wry.415.1638187635333;
        Mon, 29 Nov 2021 04:07:15 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:14 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 12/28] drm/vmwgfx: stop using dma_resv_excl_fence
Date:   Mon, 29 Nov 2021 13:06:43 +0100
Message-Id: <20211129120659.1815-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 8d1e869cc196..23c3fc2cbf10 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1168,8 +1168,10 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 		vmw_bo_fence_single(bo, NULL);
 		if (bo->moving)
 			dma_fence_put(bo->moving);
-		bo->moving = dma_fence_get
-			(dma_resv_excl_fence(bo->base.resv));
+
+		/* TODO: This is actually a memory management dependency */
+		return dma_resv_get_singleton(bo->base.resv, false,
+					      &bo->moving);
 	}
 
 	return 0;
-- 
2.25.1

