Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 080BB97964
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 14:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbfHUMbw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 08:31:52 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52565 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbfHUMbw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 08:31:52 -0400
Received: by mail-wm1-f68.google.com with SMTP id o4so1940841wmh.2
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 05:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vRxenyuPXTsYnahqRGyH5Yj5fC/fTi1KqSFOQ4JZ9Gw=;
        b=NJrL3XmrnUWfBNkl8aiq8ei98CkVERx3HcNoujZ4cEQs+IfvAc53siSy0b2/FIwMJ6
         sJR/dmHEFSrwKbWVa1LEHcebpLkgdbesPcWukPLAaUqqOf7gOMlPgyk3go0qkg9bppx5
         qz17wLSdHAUgIj3c9Ve6dKIr4MhlLUMI2SgP8eIo+fSAObImyakpvmGE9bUikGfJJVTA
         BB5syatvbCcXs6ND2fhlK8NEPsLH8tfSa7Nan3DkVATJu11abImtVpLqGvLgGJBTb4o9
         xgIkChloADsd/scie8iJbbR0bT2o9PMlU4OZYTyQzILStwMPKCYTKiR5jWG1DCOQmpYn
         /zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vRxenyuPXTsYnahqRGyH5Yj5fC/fTi1KqSFOQ4JZ9Gw=;
        b=Gl1t2dhevlJ4hcU8DUHBpNGKad1cy1fjkbyi63isG0DN747aqmBpubbY0hGlX+DN5s
         CLBUEjMaQ6r5RqcUug/0w4uG3fr//B6eg8bglqP3dvtY/k9nbhLiLEcOD9irq4oTeMc5
         TTGjVNAjgjx2e0yEbTq55wXJJYEAPclsTcSR6BLjmbdnpirHnZWtKP87Y2X1gxCM7CL+
         3/NlVcNByYgrg+YxgBOmE02L8zHINTTSG2El0MSZPl764PaNq/Qb1wdNUKAIQd1ryrob
         HytKfw7v+9w4vWgQCH+zycp4Nag7jqIDGbjwtfPBKn9NEypCTTDFkSNSMm+0U1BrbAE1
         AddA==
X-Gm-Message-State: APjAAAX7wHOyzCNS6DT3kw9aXaYwGgorLFZTJ0i5bmz4VGm/GYe8YEtW
        zaQ2hzn5CJhe5fs91EPqA2U=
X-Google-Smtp-Source: APXvYqytx4jIhEs5N7wdzTIPC5/5YonglEmhFRoN8cVyNZfDM3u68wy5ntVWhBf7ISyXWk0v2rofoQ==
X-Received: by 2002:a1c:1d4f:: with SMTP id d76mr6199693wmd.127.1566390710289;
        Wed, 21 Aug 2019 05:31:50 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
        by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 05:31:49 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/10] dma-buf: make to_dma_fence_array NULL safe
Date:   Wed, 21 Aug 2019 14:31:38 +0200
Message-Id: <20190821123147.110736-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A bit surprising that this wasn't already the case.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence-array.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 303dd712220f..f99cd7eb24e0 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -68,7 +68,7 @@ static inline bool dma_fence_is_array(struct dma_fence *fence)
 static inline struct dma_fence_array *
 to_dma_fence_array(struct dma_fence *fence)
 {
-	if (fence->ops != &dma_fence_array_ops)
+	if (!fence || fence->ops != &dma_fence_array_ops)
 		return NULL;
 
 	return container_of(fence, struct dma_fence_array, base);
-- 
2.17.1

