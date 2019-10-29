Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637AEE85E2
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 11:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbfJ2Kk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 06:40:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37987 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfJ2Kk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 06:40:56 -0400
Received: by mail-wm1-f67.google.com with SMTP id 22so1830277wms.3
        for <linux-media@vger.kernel.org>; Tue, 29 Oct 2019 03:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jIrSwkySu99IZFShnoHMSIHDhs88OfSpxWdYrboWutY=;
        b=BtX3Y2bIICvPkckdzlsjd+uP9spMfVI2GiBjvE5xcnYFfqHZqV75n3SFsD3mTeUMZx
         tBqL/6LB35aez2rquIBgLFHFiF4Fx1sB/7wk62XuHlQeRPws8AQVqFnBLgFwhoKnVCUj
         T9CB6kc7VisfS16gCmMD1scdrT7n/J6MldlSQeLFQst+8E+Dak/WzrYcdYR5RtJ5cjKY
         ngnEAdPeKzPk+pKSquzKkU0hMZ3NlEz3//1gPO+b5RqhGAkIejSZlbDeBVsucd31jOaj
         GI58UxgMahyAWIx+20awa2oOqJGwyOQHIOHl8JvFV+aPYkTTX2Qvz7lG8Z7ibItpLPU4
         Suaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIrSwkySu99IZFShnoHMSIHDhs88OfSpxWdYrboWutY=;
        b=iB938ZEWP5AoDns4/G5Hucm2xwyYo9kO2aCRjojRMmTUAxC/jPfTBE2wtcC72ssk1T
         CKiMT4Z7o6R50+8+D6Z74GTzKD2Y1jvHrVbsF/bikVB70BHCf6hJWZVxsViMgGxtARIS
         G8ekJuemvIbwVXDfJP3Wvh/sT7swJU6eSVaTeinMM1PW026ZmYyvqbWAumNQgF0dFvwh
         XCdCDQvEISa0fvrHn5czhvt/om7Ds6cyUGXmZPYLNZejvvQlnOIWJEJxnwyNfnrotK/+
         DhDD5qvWVUPlgqfPvGgbkQOexrwCiJgI3PG2PvzZX5SYQE+vtRfmJ1Wm5OvH+lTFLCqE
         abYg==
X-Gm-Message-State: APjAAAXa7NfFVcnQkUbuUmx8WCbviBaE2ukkGXmQXHQ4HZy6MJ9PUHwh
        3drm+iYNYjdSA1XHUT/RjeG2Op6u
X-Google-Smtp-Source: APXvYqyqMO+qdPSkT30UFlfsb1zNCp0MH2Q3Lb3eFI/S2EA4a60/VXHXUuIFLdM1mRmiOcbSfvB7pA==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr3330229wmi.21.1572345653806;
        Tue, 29 Oct 2019 03:40:53 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c5d9:7998:9ca6:452])
        by smtp.gmail.com with ESMTPSA id v10sm2910210wmg.48.2019.10.29.03.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 03:40:53 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/ttm: remove the backing store if no placement is given
Date:   Tue, 29 Oct 2019 11:40:46 +0100
Message-Id: <20191029104049.9011-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029104049.9011-1-christian.koenig@amd.com>
References: <20191029104049.9011-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pipeline removal of the BOs backing store when no placement is given
during validation.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d52fc16266ce..2d1488271d63 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1219,6 +1219,18 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	uint32_t new_flags;
 
 	dma_resv_assert_held(bo->base.resv);
+
+	/*
+	 * Remove the backing store if no placement is given.
+	 */
+	if (!placement->num_placement && !placement->num_busy_placement) {
+		ret = ttm_bo_pipeline_gutting(bo);
+		if (ret)
+			return ret;
+
+		return ttm_tt_create(bo, false);
+	}
+
 	/*
 	 * Check whether we need to move buffer.
 	 */
-- 
2.17.1

