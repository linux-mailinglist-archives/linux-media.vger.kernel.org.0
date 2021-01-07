Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971722EE6CF
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 21:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbhAGU1B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 15:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbhAGU1A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 15:27:00 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720EEC0612F5
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 12:26:20 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id v3so4171504plz.13
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 12:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U9M2e+GyD9N3kdkTu1dWZpMp+TAsO6qz5jF42PL+fHo=;
        b=PdcvmPrsZTt84GZCS+kSt2fsYPUuWBnUZ6TgSGrzQm7LMI06dViN+9q1BlvX3wKwvy
         1wk7rj1JVz438UvHsZkQev7kMal1vDAykDsfxC7na5m4/YFebvq9SSUKtS9Y0YF4N/OF
         whDN3W5ZGFo6U3kffrK2ffFmsDsrro0IYJE2cc7EPQDaGOrY7OAee/+wtZPbpDlgGgAL
         r8gQLptYjvGMrb7QH8D/qwA29QjZF6SuWybgWBfUtX3P53vcbGm0db0nba5hWgQ888ZK
         n+32dBm5G6GBN1TV8lD0c2epBxo233wXHEb1OEUoqkyDzv+UgJ+vMhEXBEPVTXNetmQA
         x0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U9M2e+GyD9N3kdkTu1dWZpMp+TAsO6qz5jF42PL+fHo=;
        b=jqn3OuRzLgwbTEKhqP8sZvVb+HUzj+8X5biJnoEsGgyUZi3Xa3POsIpdOLLagm2uop
         eTIOs2yt2/OWAH8nWpxAD08JJtSoO23qQ2ezfdm/8+2O/Yd8eANr1qinYZOLn8jQQK9V
         9s9chd82Z5znLl0wh5ZEy15VyMyyS1la81sAwPEqGh+xIG0CEBf7A1IPNbwDkioWlzZA
         GYv0IPnGFo2g5yTZEmepr82ftAsIOahJYBJW5PE1kf9IcjyHQaModPn8F0VwV0gWmnvf
         N26qtRDP4K1cz6KHQAZoNnQWS3lnb/VdOqS48nONcig4hzWb0tbhOr2YLOH3htQBpmwO
         RcCg==
X-Gm-Message-State: AOAM530N7mRScQldN3N1j66fNxHspEimCJD2bOoNftAMNR34dK6qsnw4
        yUfI7C2Z/R/3w1nXm7QsSIBgfA==
X-Google-Smtp-Source: ABdhPJzFeKvAsLz8R7Rwlkdtsye3bkYdvaN9gR1Ris0ONyaGl04w2s13SWnH/vv8k+BsZYzGRRZY/w==
X-Received: by 2002:a17:90a:3948:: with SMTP id n8mr216103pjf.206.1610051180075;
        Thu, 07 Jan 2021 12:26:20 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id q9sm7042112pgb.82.2021.01.07.12.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 12:26:19 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Bing Song <bing.song@nxp.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: cma_heap: Fix memory leak in CMA heap
Date:   Thu,  7 Jan 2021 20:26:16 +0000
Message-Id: <20210107202616.75170-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bing Song noticed the CMA heap was leaking memory due to a flub
I made in commit a5d2d29e24be ("dma-buf: heaps: Move heap-helper
logic into the cma_heap implementation"), and provided this fix
which ensures the pagelist is also freed on release.

Cc: Bing Song <bing.song@nxp.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Reported-by: Bing Song <bing.song@nxp.com>
Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 3c4e34301172..364fc2f3e499 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -251,6 +251,9 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
 		buffer->vaddr = NULL;
 	}
 
+	/* free page list */
+	kfree(buffer->pages);
+	/* release memory */
 	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
 	kfree(buffer);
 }
-- 
2.17.1

