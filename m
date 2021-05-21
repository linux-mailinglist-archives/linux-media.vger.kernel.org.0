Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA9D38C1BB
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 10:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhEUI0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 04:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhEUI0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 04:26:46 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21F5C061574
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 01:25:22 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso6871020wmh.4
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VuTwYX4Q26caaR9IN1tjc2go7zoMoQua0a3RckpZLx0=;
        b=L+KIDk7nhsI/m97OqsOzeJ8QOYgeF4E8st1gFL5OjUrpBEbmbjBBlvXrkC2k+ne5cW
         8TG39wbXCJd0f3YENUG4pgtsG9qpmPNOKeJrwZthCU6t6An4NNLqCyq48XvZhhdgmdOn
         oFA8Yrr8BXuUxqaJzwl9FiwGJK3ll7uvJ3+1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VuTwYX4Q26caaR9IN1tjc2go7zoMoQua0a3RckpZLx0=;
        b=P17hyeSO5CY78tAvmIQYyRtNcP3VR54gRSla0c+zIsVKOBFx4BjOhBevwgrca+52x6
         PsvQBTNInyiMyyrgEQSaj8BlCe+dadI9gKS3O310XTxDWIzWh/quNyfUIIaW/5rz8ADh
         HllJsyHycgvfrr4QlXfNBIl3BZJ7P0sKeq3oc+LFvgCVpvCSOpbx11f7Ue+8YqL542YE
         0JnjdDE/vxB1c4tmRkNGeteTLVmhisRltzhdNbFOjzm2449WiEFCEdNGu8M+2An1HI4w
         yHFOOxYb1symxRaeXWApMsiHXvxwadJA176jZsxOJQIWQb1sjdGZKS8gZYmUdXuPhUVZ
         m2FQ==
X-Gm-Message-State: AOAM530hHrfdzevpq+kIF6zynZzsC2AVTmGs6T2FdJOm6Er9iieVwOU2
        J4bUAKbz/Q3c/wCelN3vM40oww==
X-Google-Smtp-Source: ABdhPJwpq8MvTk0i71/cS6Xwd8UgAniNeakCY1BQO7ahoqJqMzvB7DSqVR/JYfS3O+UIO1Toqi+nCQ==
X-Received: by 2002:a05:600c:2c1:: with SMTP id 1mr147948wmn.93.1621585521662;
        Fri, 21 May 2021 01:25:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n13sm1250976wrg.75.2021.05.21.01.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 01:25:21 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/doc: Includ fence chain api
Date:   Fri, 21 May 2021 10:24:57 +0200
Message-Id: <20210521082457.1656333-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have this nice kerneldoc, but forgot to include it.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 Documentation/driver-api/dma-buf.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 7f37ec30d9fd..7f21425d9435 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -178,6 +178,15 @@ DMA Fence Array
 .. kernel-doc:: include/linux/dma-fence-array.h
    :internal:
 
+DMA Fence Chain
+~~~~~~~~~~~~~~~
+
+.. kernel-doc:: drivers/dma-buf/dma-fence-chain.c
+   :export:
+
+.. kernel-doc:: include/linux/dma-fence-chain.h
+   :internal:
+
 DMA Fence uABI/Sync File
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.31.0

