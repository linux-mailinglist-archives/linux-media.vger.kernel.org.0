Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF402C775F
	for <lists+linux-media@lfdr.de>; Sun, 29 Nov 2020 04:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgK2DQt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 22:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgK2DQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 22:16:48 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E41FC0613D1;
        Sat, 28 Nov 2020 19:16:08 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id k11so7556441pgq.2;
        Sat, 28 Nov 2020 19:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4oxlPetDGevWx8+PQ3DS/1BMJ6iQVMJPTwtu8ujLY9A=;
        b=TFfMQNP1P/S3YgjCDCeHh71YYglw/gd4jOOyJlZImA7y0RPlDyPccwu4w1acxobGs7
         uq+eyld/IVrlg1y/O87Qzp4aDodrJvB9llrU+yrz+5OcEsH137O2RvTHP5eqJW+MYSLO
         hRp2/zUO45VrG8HUgehYLpcQZhXYt5Ca3Uv0dYa0Y5KxMLN8iccxnu1ShwmBC2Q+LbCG
         CWJPKXvAyAtjUysv900cfGsyqgytkgl1Rh58HT5Ac+u8O23qn4woRrpVT5BeO0D+xXAp
         llL2PmfvzScfiUtPAigXWcUbb9pBr7jZDRyVtjtxiWjs7NbIxGYrQBuBaYoTLbEKPB1n
         74Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4oxlPetDGevWx8+PQ3DS/1BMJ6iQVMJPTwtu8ujLY9A=;
        b=NGQvOMn5JAYKIjbvD3rxCbAd3qV2E3A+jI4JJTeh3OYsoMv7n5lfT3CK6Ylk13GjBp
         IpjgZ7eHYE+SOxRESKXxuP0uGYnOqPqYBzVEUXDU4utK8wv0HS6Op0cFt9cwNqHQ5j6r
         aN1FVFzuC4+1wcHoV0Kr3DRhfyVcFXWn9RSKf2ZY0RzqUNNzdHZETT3X0MH83qK2KM6q
         cIgbmw11NO4TXTO23AxfcMflTYdMIhukO0svgyU3/Inx49QTOyrObx/k1t8aUphSuXGV
         eO/6WocFoZkYFAlmt53c21XTsU5C4+On88uB/YoW2lKN/I+YaoXYGRumgXmKj1CDEnYs
         e7EQ==
X-Gm-Message-State: AOAM532npDykgh4/0tG9OUjcq2FuAwgOoxpMoqgeKjOxrxdSAGPl5x9r
        QnA07p76eY8A+20Sp1WGG/4=
X-Google-Smtp-Source: ABdhPJwVPgU5BbOpeTTgEl5gFr/10QrTtdq3OMFltN/wju6Id6EufrlFsZSTvTJ3QsdzcCJLN3TmBw==
X-Received: by 2002:a17:90a:c092:: with SMTP id o18mr6218541pjs.141.1606619767967;
        Sat, 28 Nov 2020 19:16:07 -0800 (PST)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id q200sm11895156pfq.95.2020.11.28.19.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 19:16:06 -0800 (PST)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3] media: vb2: always set buffer cache sync hints
Date:   Sun, 29 Nov 2020 12:15:45 +0900
Message-Id: <20201129031545.557586-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to always set ->need_cache_sync_on_prepare and
->need_cache_sync_on_finish when we initialize vb2 buffer.

Currently these flags are set/adjusted only in V4L2's
vb2_queue_or_prepare_buf(), which means that for the code
paths that don't use V4L2 vb2 will always tell videobuf2
core to skip ->prepare() and ->finish() cache syncs/flushes.

This is a quick solution that should do the trick. The
proper fix, however, is much more complicated and requires
a rather big videobuf2 refactoring - we need to move cache
sync/flush decision making out of core videobuf2 to the
allocators.

Fixes: f5f5fa73fbfb ("media: videobuf2: handle V4L2 buffer cache flags")
Reported-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

v3: Improved code comment and dropped queue allow_cache_hints check (Tomasz)
v2: Added a comment and set cache sync flags only for specific buffers (Hans)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 5499013cf82e..3f11fc5b5d9a 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -414,6 +414,20 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 		vb->index = q->num_buffers + buffer;
 		vb->type = q->type;
 		vb->memory = memory;
+		/*
+		 * A workaround fix. We need to set these flags here so that
+		 * videobuf2 core will call ->prepare()/->finish() cache
+		 * sync/flush on vb2 buffers when appropriate. Otherwise, for
+		 * backends that don't rely on V4L2 (perhaps dvb) these flags
+		 * will always be false and, hence, videobuf2 core will skip
+		 * cache sync/flush operations. However, we can avoid explicit
+		 * ->prepare() and ->finish() cache sync for DMABUF buffers,
+		 * because DMA exporter takes care of it.
+		 */
+		if (q->memory != VB2_MEMORY_DMABUF) {
+			vb->need_cache_sync_on_prepare = 1;
+			vb->need_cache_sync_on_finish = 1;
+		}
 		for (plane = 0; plane < num_planes; ++plane) {
 			vb->planes[plane].length = plane_sizes[plane];
 			vb->planes[plane].min_length = plane_sizes[plane];
-- 
2.29.2

