Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0512C498052
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 14:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242880AbiAXNDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 08:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242871AbiAXNDh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 08:03:37 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0767FC06173B
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:37 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id r14so13457192wrp.2
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CoA+r1KF28F1CAMI7pwE9OjWnR4XEafI/kYvKFT/pwo=;
        b=cIOzXEE5EC1Tz/fcrcFHUYHyr8c5+b40bPRHwMMP2zwfimRbd06SzhWeuAvbXXWQiV
         qaOSfP7s6l0uvcT288WJAtX3RszY8F8V8NjwczrE4i3Wv2dsts6PxATUp0WNOBaFxHzu
         ysnIIP5kbx0Hx+5o7Z8ZSIFYbauc3yub3Fo/07RhHiEBMKOokPgibzZGgOibEybM3wyz
         6dftEXuh2bT+xTwSn0QSp2HJU1kUby32Uja1rHbE2MpF2CU3Z9neXAlDgeEGR6hYiFIl
         uPXoBoGtSL6xE99G+KaXbQ557khAFyezO+3OFF6tfkQ3tkBSD2yrvxpgMRdfAZXQihF8
         bnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CoA+r1KF28F1CAMI7pwE9OjWnR4XEafI/kYvKFT/pwo=;
        b=o36wouRP7eDR0mTX6loHtcXlZuBc5hzOcrvf39+YaoLSL6F3HTYFcqjk6H4WITdds2
         uvMnSMrD8yT4O7OmERssTfMUc1bS3MQ8WaDZMOtIxobEvBEipQeqqCCIFeGTI1ULDyaa
         wa8ipSwwXX0romIC3zafoKzcPXN6vvf5RCuChMp9yYg6cky88QVOWjeebyIuClWeUQZD
         UkJyqoNL8QK+DNq/hUtn070829gktfdbLmhoyZ3hoGaoJmtMqt9SEMR13xZG+n81uhtF
         vzoGdoB4kN9Y84q/n+BuctOeZRQD5h3O2O8Q+8Bvv4kICdfvJN1GE3h43ClRw3r7VtE0
         FqFg==
X-Gm-Message-State: AOAM531WZkhv1LWnnT6N83ENpTUMetNnABtHf50Q+Su8tvwVzP929V43
        WczWvUmBYSVUhxWI/S0jKSw=
X-Google-Smtp-Source: ABdhPJz8YMGjZC/90UmA7yXibWlmpeoAiaU+31DFIQQPY6Fglc75a7vxcse0ZoigED2XGmkMLF5cQg==
X-Received: by 2002:a5d:5044:: with SMTP id h4mr11949849wrt.681.1643029415677;
        Mon, 24 Jan 2022 05:03:35 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 05:03:35 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/11] dma-buf: warn about dma_fence_array container rules v2
Date:   Mon, 24 Jan 2022 14:03:21 +0100
Message-Id: <20220124130328.2376-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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

