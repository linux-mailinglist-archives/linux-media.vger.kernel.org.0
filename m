Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1FC24A53A
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 19:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgHSRvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 13:51:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:51682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbgHSRvo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 13:51:44 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE7BB2067C;
        Wed, 19 Aug 2020 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597859504;
        bh=G1v8Y0rM+ilZYs/g4rxUC1FVBPLyodeBTtIrGaLV2n4=;
        h=From:To:Cc:Subject:Date:From;
        b=JCUogtEYZ/8me7HZojvQkJGKHBPzVDG7FKXGO0QrAiz4XeJt3D6ux8801PWaBqMjN
         lqwTqO7vQd007s8BHaffjdoma815t5YCzuSxokNZwaOa4jMcUBLr3h3cPMdEOpv32c
         hbK97T6qJHGN4zn6Hc1OuFU+TU5qyGr6RSuEx1KY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 1/2] dma-buf: Fix kerneldoc of dma_buf_set_name()
Date:   Wed, 19 Aug 2020 19:51:33 +0200
Message-Id: <20200819175134.19261-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix W=1 compile warnings (invalid kerneldoc):

    drivers/dma-buf/dma-buf.c:328: warning: Function parameter or member 'dmabuf' not described in 'dma_buf_set_name'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/dma-buf/dma-buf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 1699a8e309ef..58564d82a3a2 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -316,9 +316,9 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
  * name of the dma-buf if the same piece of memory is used for multiple
  * purpose between different devices.
  *
- * @dmabuf [in]     dmabuf buffer that will be renamed.
- * @buf:   [in]     A piece of userspace memory that contains the name of
- *                  the dma-buf.
+ * @dmabuf: [in]     dmabuf buffer that will be renamed.
+ * @buf:    [in]     A piece of userspace memory that contains the name of
+ *                   the dma-buf.
  *
  * Returns 0 on success. If the dma-buf buffer is already attached to
  * devices, return -EBUSY.
-- 
2.17.1

