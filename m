Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFFC44BC6E
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 08:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhKJH7X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 02:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhKJH7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 02:59:22 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53416C061764
        for <linux-media@vger.kernel.org>; Tue,  9 Nov 2021 23:56:33 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id z65-20020a256544000000b005c21b35717dso2795528ybb.10
        for <linux-media@vger.kernel.org>; Tue, 09 Nov 2021 23:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=KiXUagDG3cX/b6Fu0oxZWEBV0L+JWFX9vvJaFQ2iibg=;
        b=ETfHB9s6lalxrBjf1YNIRPdiIKg79rVtRz0YTkMCLPXKCJZREdYvg/dkyziNmhbZ+4
         mP58bVaCnnrEZua1QiWB+wTRGmJV3LesvhuEXq+8jQ8qeXl9hfzW8wgmiuejBFNb7s4a
         H0unfNQ4zYxC5yQRBulONhYp6zQYqAXikdT26RRE+dRSDbM33JkPe06sZz55p+oibitn
         XQnpSFt3EuiAoBYQhgtsgp/RQX1FXaNYUWfyAldbg8kEo0GuDJjieu7sqs6SOKOAOspp
         dcZr/3xbHadWEWKlozgDJrhlk6DNmfUpUZU0o19uNCdAKzLO/UvY3EVr45/SmGaI3Jv/
         A7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=KiXUagDG3cX/b6Fu0oxZWEBV0L+JWFX9vvJaFQ2iibg=;
        b=2665P03nKiuw5mDZCC05b0J/2y0/Y39+yeqfrt8g3B2x5XqxaPZvLv6qJKL13PbbPI
         VMdQWk/ITlYNJuFcacpBlKKAkfoLmlq5UuEaZFlnvltuCRU9EKo8zYkfCzvD7Vjk/NKc
         mCv4uME3QmjiTDHG3EAIoqLXQk5G4rjXHFeS1FFIg+ks0mgYUlcO+sRDkh86mw2Nu5ju
         HgyBe6qvjwhswtkbJWwQi7xLBgMiyN1lT3794QbK6Aq5PAGxTKSfLGdueb++y40WWA5q
         ah0f5VAUyg6Ku/nAUcJi1LvKR42CY3XwBQJDQ1+1HxzDFWVL3SGRXVyNRHPysgaEGSIn
         Dkiw==
X-Gm-Message-State: AOAM531vwaL1PLiPPVLcTowQZuInKbuJCjJf2IV9qb3vHk9sE0/vVktt
        Ov6IpAHCf/cqPCjXjBoZpGWJQe3DTooz
X-Google-Smtp-Source: ABdhPJzxVv0W1PK1J6sVUYOcpw8rLYL7Bs4q/sVaiJM3KRIixKX1MjJdO4mc+CjvI4NmgzS9+wqy9PNXdUug
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:98de:eb7c:fc0b:2afc])
 (user=tzungbi job=sendgmr) by 2002:a25:800f:: with SMTP id
 m15mr15338009ybk.525.1636530992574; Tue, 09 Nov 2021 23:56:32 -0800 (PST)
Date:   Wed, 10 Nov 2021 15:56:11 +0800
Message-Id: <20211110075611.3952962-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [RESEND PATCH] media: mtk-vcodec: vdec: remove redundant 'pfb' assignment
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, acourbot@chromium.org,
        yunfei.dong@mediatek.com, tzungbi@google.com,
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
2.34.0.rc0.344.g81b53c2807-goog

