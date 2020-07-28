Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D5923107B
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 19:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731835AbgG1RIf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 13:08:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:34640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731623AbgG1RIe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 13:08:34 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 318A9207F5;
        Tue, 28 Jul 2020 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595956113;
        bh=J+IjkUW3t6+Z48T6sJ6E00JRYLjetsG85a5bs6k5OlU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DngtZ7nV6HZqTP9AT77+BrH88xt3gXMhEMbTVjYz2uX7V5ZQ3baGe1Ylz5TJAKCeC
         gShx0nGR8GIMlVDo+WELY8i6c+JnXwy2WHrOtIvZagoTXIRCvYlZwY0G/xSA0gowDt
         J+iNuCb6OFYBza8ssyyNQeKSvrSTan84MyfUY9uc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] dma-buf: fence-chain: Document missing dma_fence_chain_init() parameter in kerneldoc
Date:   Tue, 28 Jul 2020 19:08:21 +0200
Message-Id: <20200728170821.28050-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728170821.28050-1-krzk@kernel.org>
References: <20200728170821.28050-1-krzk@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix W=1 compile warnings (invalid kerneldoc):

    drivers/dma-buf/dma-fence-chain.c:233: warning: Function parameter or member 'seqno' not described in 'dma_fence_chain_init'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/dma-buf/dma-fence-chain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 3d123502ff12..7d129e68ac70 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -222,6 +222,7 @@ EXPORT_SYMBOL(dma_fence_chain_ops);
  * @chain: the chain node to initialize
  * @prev: the previous fence
  * @fence: the current fence
+ * @seqno: the sequence number to use for the fence chain
  *
  * Initialize a new chain node and either start a new chain or add the node to
  * the existing chain of the previous fence.
-- 
2.17.1

