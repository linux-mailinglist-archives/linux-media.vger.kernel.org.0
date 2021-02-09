Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7252D31574F
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 21:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbhBIUAQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 15:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233632AbhBITtK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 14:49:10 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C19C061A2E
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 11:48:27 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id o38so1628209pgm.9
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 11:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ysXoxmHGWekWNyITP0f9QwT2Iyo77pJXB4WoqmtP4Co=;
        b=AsJEwfacT50dzlHJesYHyvPMmGevTS+ag8BhYTlHlCJ+z3e0U27w5lWhFvWXNw7K8p
         zjYspoGmCqgQYQJwbFzTIIhNSHhbb5GUcYIAxQIAz1PYnBg+ZXtkZlhyChFBnWXgJxXH
         688qnGvDFa3ydexIBy6mU/hvuFDcrqljXxSyISZMOdRAlYG+dSio7eFkfQVYl34a2I+a
         yXJsmt1Esb3/IQ5Fl7WoidYkFMmEZNI7ozgOogtAlXgZ4bTjmV51W7t0QlKszQ2Sm3CS
         s3aT36pWaoZpeWiP7FYlxNQ/p8szINRxpSNZ045YUXExUAc6iM6vk99/GBEjfjkV1t1P
         9Pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ysXoxmHGWekWNyITP0f9QwT2Iyo77pJXB4WoqmtP4Co=;
        b=YJRGQZOZ3OoIyT0knPquRKIsou7UtPtgujkl4EQlgb7qsecAsWhk4VYFGU1+pf7qn1
         rUKS0ozwwLKhBOwvW1AOcfxDmiY6/zZpJU2UmUIJ/b9F4i2IcyhAZszSnclio2QyW70Y
         aqVsI/XF9BoEcln+7C2QmYMJjafOUcvFaGaSjWSSAu+70Pu+UPSl7JXEzZudnDHJ8mAv
         c2ovKacaO32rhg0EVikWKkQKc5Hv6ZAA5ltyNchqQj0mOiylVuLxnO3KfPiWJKby9SQ2
         Bvj41sM4mSyy6aJw8cPvvcKWFnTihLSL6ZsJGYFawnq3YNNnaaX5C/SqtJcLT1N+jbNo
         NniQ==
X-Gm-Message-State: AOAM532dp0/OlV5geEpY5Y9NnEgzEu11zck89kHMph1EHYH9SDkro5i6
        xKLWUVTf4zFDl0E47cH3Ng6hkw==
X-Google-Smtp-Source: ABdhPJzbnY58mnNBjT7Di/zQColXsY24/57OAsMRe1ZHW4yoCGkME/b6oR4C3hpIJMQURcXm2cyODA==
X-Received: by 2002:a62:5ec5:0:b029:1ae:6847:fa02 with SMTP id s188-20020a625ec50000b02901ae6847fa02mr24453587pfb.61.1612900106860;
        Tue, 09 Feb 2021 11:48:26 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id j17sm22365836pfh.183.2021.02.09.11.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 11:48:26 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] dma-buf: heaps: Fix the name used when exporting dmabufs to be the actual heap name
Date:   Tue,  9 Feb 2021 19:48:18 +0000
Message-Id: <20210209194818.2459062-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210209194818.2459062-1-john.stultz@linaro.org>
References: <20210209194818.2459062-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

By default dma_buf_export() sets the exporter name to be
KBUILD_MODNAME. Unfortunately this may not be identical to the
string used as the heap name (ie: "system" vs "system_heap").

This can cause some minor confusion with tooling, and there is
the future potential where multiple heap types may be exported
by the same module (but would all have the same name).

So to avoid all this, set the exporter exp_name to the heap name.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c    | 1 +
 drivers/dma-buf/heaps/system_heap.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 364fc2f3e499..62465d61ccc7 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -339,6 +339,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
 	buffer->pagecount = pagecount;
 
 	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.ops = &cma_heap_buf_ops;
 	exp_info.size = buffer->len;
 	exp_info.flags = fd_flags;
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 17e0e9a68baf..2d4afc79c700 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -388,6 +388,7 @@ static int system_heap_allocate(struct dma_heap *heap,
 	}
 
 	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.ops = &system_heap_buf_ops;
 	exp_info.size = buffer->len;
 	exp_info.flags = fd_flags;
-- 
2.25.1

