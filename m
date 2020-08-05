Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605AC23CBDD
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 17:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgHEP6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 11:58:55 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35866 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgHEPui (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 11:50:38 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1k3HZQ-0008I0-5Z; Wed, 05 Aug 2020 11:26:56 +0000
From:   Colin King <colin.king@canonical.com>
To:     Laura Abbott <labbott@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        devel@driverdev.osuosl.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: ion: fix spelling mistake in function name "detatch" -> "detach"
Date:   Wed,  5 Aug 2020 12:26:55 +0100
Message-Id: <20200805112655.17696-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the function name ion_dma_buf_detatch.
Fix it by removing the extraneous t.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/android/ion/ion.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
index 3c9f09506ffa..e1fe03ceb7f1 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -205,8 +205,8 @@ static int ion_dma_buf_attach(struct dma_buf *dmabuf,
 	return 0;
 }
 
-static void ion_dma_buf_detatch(struct dma_buf *dmabuf,
-				struct dma_buf_attachment *attachment)
+static void ion_dma_buf_detach(struct dma_buf *dmabuf,
+			       struct dma_buf_attachment *attachment)
 {
 	struct ion_dma_buf_attachment *a = attachment->priv;
 	struct ion_buffer *buffer = dmabuf->priv;
@@ -331,7 +331,7 @@ static const struct dma_buf_ops dma_buf_ops = {
 	.mmap = ion_mmap,
 	.release = ion_dma_buf_release,
 	.attach = ion_dma_buf_attach,
-	.detach = ion_dma_buf_detatch,
+	.detach = ion_dma_buf_detach,
 	.begin_cpu_access = ion_dma_buf_begin_cpu_access,
 	.end_cpu_access = ion_dma_buf_end_cpu_access,
 };
-- 
2.27.0

