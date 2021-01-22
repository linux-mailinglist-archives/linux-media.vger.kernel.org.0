Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F7D300455
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 14:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbhAVNhP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 08:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbhAVNhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 08:37:12 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E469BC0613D6
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:36:31 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id e15so4373913wme.0
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=edG1bcKl/JltMmw8l3x2znGINV2sLZxwkYJ8IRqXyp4=;
        b=QAgz2EzaBlKwijAgAQpl6fX2ZKyUP4Vt+msdnx4A5y5bo6FldmRBNMpJDtqtar9arz
         E4tu8bXvgQDwpg9+YC8HyVujuwbaXSsEBW3JnMWcsvkgXskLMtDPf7FvHBUSs7Qn8KMV
         YXo4RpK0uOHegM18CS014aqDUxy5uVGc92ctQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=edG1bcKl/JltMmw8l3x2znGINV2sLZxwkYJ8IRqXyp4=;
        b=hPu0Upbl+rX6fNQT5RTX++w9IcVVDwfg8KtfY8i0VZHfScfkS1wfLfd9d3UujWNMNK
         L9CobAWgp7pjAWJhATrGkueuE639tzXo4ObTXFdvAUYO0v9AeceOLgxJoTg8xwQUPJ3Q
         FudhN3h1Qfrnap9IhaK1Z84SamcdKpX9KTKjorMK1SrOCqRNrweQd2K9JdxNp2xJXG0I
         BPwHI+gc73Gm9Lz839u/NEGZ9HE711x+p7pwbZe/BhWQzxBsG5XJ5GKFhB+Lwe97uoGj
         wirZ/FyOCXr1Lqyv0v4bPWjOSKQxHy71lj13IjeCZP3sxSxN2fgvBkOHE5xgeZXwBNg0
         Tniw==
X-Gm-Message-State: AOAM532S/KW5Cvnc8x5B8CvEBrlC5zVPk55K9YDaL9wgRdthdug1ej4k
        q6Io6pK5W2pnRYw66UYpExhVzA==
X-Google-Smtp-Source: ABdhPJyqUays+vT7bQV8b2GQBF2WkY4wYp/uur4k09VBD0DwleCxtfjPL3RB07HyZym+ymor5fJfww==
X-Received: by 2002:a7b:cd8e:: with SMTP id y14mr4119720wmj.61.1611322590741;
        Fri, 22 Jan 2021 05:36:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i131sm10939005wmi.25.2021.01.22.05.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 05:36:30 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/todo: Add entry for moving to dma_resv_lock
Date:   Fri, 22 Jan 2021 14:36:23 +0100
Message-Id: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Requested by Thomas. I think it justifies a new level, since I tried
to make some forward progress on this last summer, and gave up (for
now). This is very tricky.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 Documentation/gpu/todo.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index dea9082c0e5f..f872d3d33218 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -23,6 +23,9 @@ Advanced: Tricky tasks that need fairly good understanding of the DRM subsystem
 and graphics topics. Generally need the relevant hardware for development and
 testing.
 
+Expert: Only attempt these if you've successfully completed some tricky
+refactorings already and are an expert in the specific area
+
 Subsystem-wide refactorings
 ===========================
 
@@ -168,6 +171,22 @@ Contact: Daniel Vetter, respective driver maintainers
 
 Level: Advanced
 
+Move Buffer Object Locking to dma_resv_lock()
+---------------------------------------------
+
+Many drivers have their own per-object locking scheme, usually using
+mutex_lock(). This causes all kinds of trouble for buffer sharing, since
+depending which driver is the exporter and importer, the locking hierarchy is
+reversed.
+
+To solve this we need one standard per-object locking mechanism, which is
+dma_resv_lock(). This lock needs to be called as the outermost lock, with all
+other driver specific per-object locks removed. The problem is tha rolling out
+the actual change to the locking contract is a flag day, due to struct dma_buf
+buffer sharing.
+
+Level: Expert
+
 Convert logging to drm_* functions with drm_device paramater
 ------------------------------------------------------------
 
-- 
2.30.0

