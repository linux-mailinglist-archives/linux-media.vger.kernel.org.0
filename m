Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C6E41A62F
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 05:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238874AbhI1DsU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 23:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238852AbhI1DsT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 23:48:19 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA12DC061604
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 20:46:40 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id s75so3262252pgs.5
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 20:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z3bAoCya8Y7Dh6QkxEXxat/NHosu9KdF5sqakVDClzs=;
        b=iXG2vit4ZhMA5CWRsWzZE095T5xH65GnTeu1OKkTXELLzVC3OS/Qwv0vuI546RGMOv
         KjdQ6beOQZH881Hj17lcsBIHeVX9SrB4UgK5WANszpWjaQRnk6X0SbgHBV9FSrpVVKtQ
         8O8msarkOX2cdb+YgQ4/rG0nA4w65Qxm4Z5Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z3bAoCya8Y7Dh6QkxEXxat/NHosu9KdF5sqakVDClzs=;
        b=KmOMqBJ1Vr0Zoqdr/fOFNwES2py1wKJ4d+AIRpGyXEkLhRnvvXY2oNHMrIisioi1Ym
         jY7VUzWaFAR+UFckWkxmNLTZpJwxFC1pQWwk1vlPbXbQ0w8OwAtChB9+/jaxC7vo/lhE
         ogvhQnHIn2L2cRyynBWt+gZgGpBzb50QAv8hPpJLY+gAlaixeO6qWMHxkeRWQ9lpjBsR
         xL4Pac7v8sP1PJMZ1rQAUJztfcjqMhCvs+anUmTEJUBgEOSypdE0DgdRCOk2rPWf9Oyp
         A3lu+iihWSceP60chUBfaQbAk5X6qrVzV5maBu426TMumr+EU2F290s5Tw+UxLhzOYzr
         QEVg==
X-Gm-Message-State: AOAM530crAX8c7FwC4xLSpJNv/brt7r6tb8eskCSU144vSgdiYrBJcuh
        kFXx1K8Ks25F0djKxQti5ePmYA==
X-Google-Smtp-Source: ABdhPJzvHwlXLhgEm4VzBgzXNJBgJ2neN0GBz2lKVasoXPDHMP+l4i6Q/cz4hAonJYbux9muKZV4/w==
X-Received: by 2002:a62:dd94:0:b0:442:bb03:9663 with SMTP id w142-20020a62dd94000000b00442bb039663mr3197190pff.0.1632800800438;
        Mon, 27 Sep 2021 20:46:40 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:481c:a10e:b908:28fe])
        by smtp.gmail.com with ESMTPSA id f205sm19411980pfa.92.2021.09.27.20.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 20:46:40 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] media: videobuf2: always set buffer vb2 pointer
Date:   Tue, 28 Sep 2021 12:46:34 +0900
Message-Id: <20210928034634.333785-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to always link allocated vb2_dc_buf back to vb2_buffer because
we dereference vb2 in prepare() and finish() callbacks.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index b052a4e36961..38767791955d 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -600,6 +600,7 @@ static void *vb2_dc_get_userptr(struct vb2_buffer *vb, struct device *dev,
 
 	buf->dev = dev;
 	buf->dma_dir = vb->vb2_queue->dma_dir;
+	buf->vb = vb;
 
 	offset = lower_32_bits(offset_in_page(vaddr));
 	vec = vb2_create_framevec(vaddr, size);
@@ -788,6 +789,8 @@ static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	buf->dev = dev;
+	buf->vb = vb;
+
 	/* create attachment for the dmabuf with the user device */
 	dba = dma_buf_attach(dbuf, buf->dev);
 	if (IS_ERR(dba)) {
-- 
2.33.0.685.g46640cef36-goog

