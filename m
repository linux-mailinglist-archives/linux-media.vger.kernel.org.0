Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2540433194
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 10:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbhJSIzU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 04:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhJSIzT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 04:55:19 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1294BC06161C
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 01:53:07 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id i83-20020a252256000000b005b67a878f56so17181912ybi.17
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 01:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=DPdVaDsVnXSUR++QFdtLJWwCj6OF4KTQcCHheGSLtI4=;
        b=qwTmzOfAEH6en8FRDOQTsHFxJMEXIcrhY+XJ76Fi70wk6K8KDgI8Bg7ML6Ix+lyEZq
         6u/F/zecV6l6Ipx3xutmsrat6uiTm7K4RImLiVBqATb498CyZvAoz4rne3YR3+8VntBl
         zH4vsISpeTgrA80yPqTj3Czo7aJNUMUhcj/TCiQrn3LarRt8RGkQd8mcqxJijb/W4itL
         7wRQ4W8Y6bVSAIT14zWlkZbrpociC4B6R+rzZCZlOOzg0DrdId0ZfUpuwwa2XiyKpZuI
         /EmP1yWrrUa+erAn/30rnWvt56N4NyMtITrgf8+Nd6ZMeSHdKe2lSjxApmbVqIFxEw91
         tENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=DPdVaDsVnXSUR++QFdtLJWwCj6OF4KTQcCHheGSLtI4=;
        b=BeAPH5ulhADK+IVfW32kLH3NTzhr9BslALK6AJgBefWU5wa+byw01RAf/LJLBCtQBk
         wzEJvxPRuqGapWWCk6LGXQvBlTomrwmVQCQB6NWjtN+47Wxq02dpc7OABrMQIYylhnsW
         fc7uJYCHfS3LWut/3Emd9TTFu2v1ceX7tZwYwyrtoGp5ZIJ/MKtnB4/H3d0b7LRH/zFv
         CwLyEns+avEfO7VPmI/Y2pUSiF0eakPB9kLhgYLcv1uLAqtyuK41b3OdvQrqRKtEl35a
         Us/ffrMaPbZGKilC5XQbPnXkNkFMnZnj5ECz7YFPA8p5e4tPY/a2ZCUghjXhjJpLQXFd
         1/9w==
X-Gm-Message-State: AOAM531vvnQvP0BTUSbjdGxZxPmDlaiFNEtCdVURm7+0fxfKImWHwvP6
        JtYihczTEiuwuSmdL+jJWTX1OAtR1Cx3
X-Google-Smtp-Source: ABdhPJyHVGltnpxzHl+hfIC64iTUkFhBIB0Fl/ZZrccOuHGCRhISzyuXnb8ljvboI8USUXTmWQLt9DQvZYIz
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:6ff0:aecc:16ef:4060])
 (user=tzungbi job=sendgmr) by 2002:a25:5488:: with SMTP id
 i130mr34105087ybb.454.1634633586344; Tue, 19 Oct 2021 01:53:06 -0700 (PDT)
Date:   Tue, 19 Oct 2021 16:52:44 +0800
Message-Id: <20211019085244.1403-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH] media: mtk-vcodec: vdec: remove redundant 'pfb' assignment
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, tzungbi@google.com,
        acourbot@chromium.org, yunfei.dong@mediatek.com,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A clang-analyzer warning was reported.

>> drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c:133:18:
   warning: Value stored to 'pfb' during its initialization is never
   read [clang-analyzer-deadcode.DeadStores]

            struct vdec_fb *pfb = &framebuf->frame_buffer;
                            ^~~   ~~~~~~~~~~~~~~~~~~~~~~~

Removes the redundant 'pfb' assignment to fix.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index 8f4a1f0a0769..3d9f47555884 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -133,7 +133,6 @@ static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx,
 	struct vdec_fb *pfb = &framebuf->frame_buffer;
 	struct vb2_buffer *dst_buf = &vb2_v4l2->vb2_buf;
 
-	pfb = &framebuf->frame_buffer;
 	pfb->base_y.va = NULL;
 	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
 	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
-- 
2.33.0.1079.g6e70778dc9-goog

