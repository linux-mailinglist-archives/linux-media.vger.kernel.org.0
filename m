Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B2A43AE2B
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 10:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbhJZIhQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 04:37:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:56376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232001AbhJZIhQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 04:37:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CDBE60F46;
        Tue, 26 Oct 2021 08:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635237292;
        bh=QlPHR7ufXmFxgMpPMQTjAd3avsJoYelK6Xz5gGhBaCQ=;
        h=From:To:Cc:Subject:Date:From;
        b=HfEq/lalFrkivwUtuoDMutUydMlIaLLVXIwjXTeD4JMSt35cMz2NlI7ZBa65+NZ3w
         Dkh/duXWw69za/OMFUt7/AEAegZOP5p9HJrVtiKvUgjpBm6v5s3Rwbp03enNDb8uFc
         Mrd/FapNtFMPSr/fBt6fPzhGvt0M5jA0/GPCm2ANW1/U+8FTM2z7CE/loCdV2/aAsG
         S8MSBQBbKKSoZbPBYa65QLJQDa3RHgRtcDb8+7tO3wI9V8D4ndCkAUA2I8/KpMv3v9
         ORRQ3+USggkLaEBks7OJqMNY1SNdpizG0fmFq4FivqH13EjMCoibINIaRv2iAVdwx3
         h++bIO8NnOOcw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] dma-buf: st: fix error handling in test_get_fences()
Date:   Tue, 26 Oct 2021 10:34:37 +0200
Message-Id: <20211026083448.3471055-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The new driver incorrectly unwinds after errors, as clang points out:

drivers/dma-buf/st-dma-resv.c:295:7: error: variable 'i' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
                if (r) {
                    ^
drivers/dma-buf/st-dma-resv.c:336:9: note: uninitialized use occurs here
        while (i--)
               ^
drivers/dma-buf/st-dma-resv.c:295:3: note: remove the 'if' if its condition is always false
                if (r) {
                ^~~~~~~~
drivers/dma-buf/st-dma-resv.c:288:6: error: variable 'i' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (r) {
            ^
drivers/dma-buf/st-dma-resv.c:336:9: note: uninitialized use occurs here
        while (i--)
               ^
drivers/dma-buf/st-dma-resv.c:288:2: note: remove the 'if' if its condition is always false
        if (r) {
        ^~~~~~~~
drivers/dma-buf/st-dma-resv.c:280:10: note: initialize the variable 'i' to silence this warning
        int r, i;
                ^
                 = 0

Skip cleaning up the bits that have not been allocated at this point.

Fixes: 1d51775cd3f5 ("dma-buf: add dma_resv selftest v4")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I'm not familiar with these interfaces, so I'm just guessing where
we should jump after an error, please double-check and fix if necessary.
---
 drivers/dma-buf/st-dma-resv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 6f3ba756da3e..bc32b3eedcb6 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -287,7 +287,7 @@ static int test_get_fences(void *arg, bool shared)
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
 		pr_err("Resv locking failed\n");
-		goto err_free;
+		goto err_resv;
 	}
 
 	if (shared) {
@@ -295,7 +295,7 @@ static int test_get_fences(void *arg, bool shared)
 		if (r) {
 			pr_err("Resv shared slot allocation failed\n");
 			dma_resv_unlock(&resv);
-			goto err_free;
+			goto err_resv;
 		}
 
 		dma_resv_add_shared_fence(&resv, f);
@@ -336,6 +336,7 @@ static int test_get_fences(void *arg, bool shared)
 	while (i--)
 		dma_fence_put(fences[i]);
 	kfree(fences);
+err_resv:
 	dma_resv_fini(&resv);
 	dma_fence_put(f);
 	return r;
-- 
2.29.2

