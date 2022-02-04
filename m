Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737BA4A9764
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 11:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358092AbiBDKEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 05:04:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358099AbiBDKEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 05:04:40 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F1EC061714
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 02:04:40 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id ee12so11284564edb.8
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 02:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lua3ndSNkQ4/4Jps3PRoP7cS+stYoWZoem0sckVfZ4Y=;
        b=J6fLl5aNXVs7I7cJKmW+cvYJYiMnH4xxcXJmbxzwowAzLiVNNfYtym5eqlEXTMbvdO
         jyqt7VPBNUIC0WU5R2Li2xjq0YdXRtBriRfk5dvtwcvNDINzyp19MCUPG5Ev2HGQ4Vxn
         g6w7YUeeFRNBndYBK4hDHGdAJYfctaUFYScUuKccdXmC50/2zOWPew6Fx8P5yfMJHM6f
         Ux2zu4IverpLIQrG/KJy/fJPzg2aC3geRy5jXOUJxzsxCTKvYLCNUN6R+/ArrtSFZc/R
         2yDRyM6oLmGRI5AUK3oadxHnZr+q1kOmQqPk/jr/YPq7j1VVtloVt8pyJpZIL893G9IE
         bx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lua3ndSNkQ4/4Jps3PRoP7cS+stYoWZoem0sckVfZ4Y=;
        b=xKuY4ZJkocIqNMgBJC0c3J+cclAuxQoH5luAqs1d8uuUN/KB5MQwyT/FvDAlOLoYVZ
         xItMGIJVK1QNwQjJhLuCd2r8dlvJ6aBDdPVA9QJxeDlcRU7fzU7O0jeXuC210g5j5tp3
         kyScM+M8J6rV+YLBBXceIemBAWcAHWwhf2RXmu9eScnoDqtJ8PngCqZco7GDCdi0dJ6c
         0O/aR88ZxdZV4NoCQqU1RCd4JXOtLQ+afz+i20RXtDigPOTmqV01hvbR/GSRFbb0G5mL
         kycoMf5nNZ+ObkiP/IaxAmUAad2CV6M0KJSLKbsN3OxpbDwh5zISJMwH+HitKec3IK5f
         4dxA==
X-Gm-Message-State: AOAM5315g9pe6t93vEJ4btomeHV5tvE+k2EFwstAOoA+SMetsznKqA+U
        dDKiUNaYmd/s71GM63Wk6vOAA+h6tn8=
X-Google-Smtp-Source: ABdhPJz8hCqpmvlhCbMTzHXgtghoGTUiIoV0KxhuC94AUMCYZjdcSIN4UbCV+Z4RoJk32V5kj+6oAQ==
X-Received: by 2002:a50:d70e:: with SMTP id t14mr2287416edi.19.1643969078713;
        Fri, 04 Feb 2022 02:04:38 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id z10sm633943edl.54.2022.02.04.02.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 02:04:38 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, thomas.hellstrom@linux.intel.com,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] dma-buf: warn about dma_fence_array container rules v2
Date:   Fri,  4 Feb 2022 11:04:25 +0100
Message-Id: <20220204100429.2049-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204100429.2049-1-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's not allowed to nest another dma_fence container into a dma_fence_array
or otherwise we can run into recursion.

Warn about that when we create a dma_fence_array.

v2: fix comment style and typo in the warning pointed out by Thomas

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 3e07f961e2f3..cb1bacb5a42b 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -176,6 +176,20 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 	array->base.error = PENDING_ERROR;
 
+	/*
+	 * dma_fence_array objects should never contain any other fence
+	 * containers or otherwise we run into recursion and potential kernel
+	 * stack overflow on operations on the dma_fence_array.
+	 *
+	 * The correct way of handling this is to flatten out the array by the
+	 * caller instead.
+	 *
+	 * Enforce this here by checking that we don't create a dma_fence_array
+	 * with any container inside.
+	 */
+	while (num_fences--)
+		WARN_ON(dma_fence_is_container(fences[num_fences]));
+
 	return array;
 }
 EXPORT_SYMBOL(dma_fence_array_create);
-- 
2.25.1

