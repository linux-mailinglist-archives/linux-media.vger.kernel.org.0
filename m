Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D6B1BEDF5
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 03:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgD3B7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 21:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgD3B7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 21:59:37 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805CBC035494
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 18:59:36 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id v26so3795487qto.0
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 18:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fVFXHIsh0/YRSKtqr5ljSmMbeR52DAiwA44HTGSUEYs=;
        b=LxmFwU7TGw7y9TAZafLVzvatQZ0gZjRW65fHnG9mih+vMFlq42rxUunxAOoL/uGZwV
         b5K/FJ8TlMReE9NuZwdRSN6JlWVx8OuU2m6gEcAXGPHBij943y09p3qom6ajQqpAGCDL
         DkgvAmBO0xKju/EuTeKYhKvfU/Vh10jMxTnMlNsbKhjkRYiFRaS9DB/KBcYIG1mCBMbw
         C5iSVrlzItgv9jyBA+YiqNlUYGLVHSg4H1/08Bcf6R2/x3tcYJFHZ+r/5kUSPSwN+Wts
         /0wnxrhLKsD/Orm3kO/tYZVEOjnATZK4APJk6ZCQ2tof62k6ScOI5t0iHP4HngekMbhA
         fsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fVFXHIsh0/YRSKtqr5ljSmMbeR52DAiwA44HTGSUEYs=;
        b=uZd/NGT0g3YgmxFquJ6OscmB6K62FpupTWx7EKtt2V2M9S3TcZ0DTS3KiYSvJuX6jH
         /NtC02Up5ysv18tdDJmu+mgUnm56pOvgufWWJIAPGIu64DAD0H1VkF8WzdLQfdeGi+1+
         5O1AFUpQIoGccj/4h2hpz6ydpaTINxcrXIO7Xc498yVi9WpnunRGBSmo3B6GuB5yKx2o
         KsPaJ+0/buzyKx9E3r9GkHxHe78QBRZuu+rdBBq5Cjar9n7Ouq/001PfPCyPYAIt+NY0
         C0xVhkMOXyn+IcCEp3yD4kzWrcuBbj/Vx9kQv90loXaN1v3pY0J6ricnLXgxHQQTtfN/
         BINQ==
X-Gm-Message-State: AGi0PuZEbnqLWxgwrpGWBpLT3XYZWkQY8XWfuXMpTSgchnlGa0jMIETD
        tCbTYry9VpS6vJoSTjUqQ9YrrC+Ub0U=
X-Google-Smtp-Source: APiQypJoSfYUsyxQnQO9ATp9PPbiyFH/GL856p8ztpAhtz6K1Fy0hNXDM3D+1FjMDNceAVO1N+vsvA==
X-Received: by 2002:ac8:51cb:: with SMTP id d11mr1332622qtn.370.1588211975468;
        Wed, 29 Apr 2020 18:59:35 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id l24sm836378qtp.8.2020.04.29.18.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 18:59:35 -0700 (PDT)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     dri-devel@lists.freedesktop.org
Cc:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        brendanhiggins@google.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] dma-buf: Documentation: fix: `make htmldocs` warnings
Date:   Wed, 29 Apr 2020 22:59:30 -0300
Message-Id: <20200430015930.32224-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missed ":" on kernel-doc function parameter.

This patch fixes this warnings from `make htmldocs`:
./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_ops' not described in 'dma_buf_dynamic_attach'
./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_priv' not described in 'dma_buf_dynamic_attach'

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ccc9eda1bc28..0756d2155745 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
  * calls attach() of dma_buf_ops to allow device-specific attach functionality
  * @dmabuf:		[in]	buffer to attach device to.
  * @dev:		[in]	device to be attached.
- * @importer_ops	[in]	importer operations for the attachment
- * @importer_priv	[in]	importer private pointer for the attachment
+ * @importer_ops:	[in]	importer operations for the attachment
+ * @importer_priv:	[in]	importer private pointer for the attachment
  *
  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
  * must be cleaned up by calling dma_buf_detach().
-- 
2.25.1

