Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D606F2C620A
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 10:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbgK0Jln (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 04:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729299AbgK0Jln (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 04:41:43 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014C6C0613D4;
        Fri, 27 Nov 2020 01:41:42 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id m9so3928813pgb.4;
        Fri, 27 Nov 2020 01:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9b3DW2H2fIy5rHH49Dn8tazN9CD4QYpDJnWXSKIEJRg=;
        b=WBVyXHKgyjXFVD0Y+NaG93/hlXgNLhM5WgR7iO//yZdwTGHUdrseX7CfxM0dxiIwRd
         IDFWOc/7RjUMEYJMaHuYW16U9ybCU5QHAYDhuMHVzyhvlgRa3Y0Jei/d4gT+fORFrRGD
         lsUYg/GKnkOgM/DyACdQXJuXSttYpcu/7GDaPbWJmGKdmJTVj1pWdVGO4zIXPmO5nUnF
         ph2MJE9hXTYDcJcu2oMgf4e21hvzJYB5saFofKoGvp4L8Uj8M+1Kt0wD9XssSal9vteK
         FW2OURGsIScHz4nCkPXLH9RHVbDbzq6may/dpCl+ba0oQ4wttuM6cEc00ODXFYcgh1fu
         KzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9b3DW2H2fIy5rHH49Dn8tazN9CD4QYpDJnWXSKIEJRg=;
        b=gdy9m5FwdXvQV6q/CzIvnuIgjLeC7q+emG1vEU7LfZvzB4VIj5xGpr/eYd5haZbBC4
         KfEPg0VJ+mdOAsa+Ba+C0cWw2fRXV4B79RB1wt0W33N0J73xpjgONArWDA8zl8BsBEid
         0e5QHQYnepy9YZHNuC97zTxNzmorRpdTzeD0o0oi9hw8A1EC/2bywKY6hmFPIYeVxAWJ
         9NJ3kHqetMrMcNUw9gYytIb3IVAU2y6FBPA+n4Tpz/LzjbXkxK9uhvtGtCuDwrFYiNKe
         iF3vYjkPqsSqtWZndwQWRMx4vupmM+46YzJ9lrCdmHR0uJC925patmJJjwqA5b1P33OT
         LDlQ==
X-Gm-Message-State: AOAM533axdGw5vCSUYCeiUNpsK6enS36vNwkj+ms/OgJ9v1E4h5HBd3A
        vB8bsrhzbcTOgTDwBPCmIjM=
X-Google-Smtp-Source: ABdhPJw/94xD49Tqe0zeIl775gnP9Lz9VeRJbWf9hNbVy3Cv6ss0njmbXSpCdExfb8x3T66vb1TFTg==
X-Received: by 2002:a17:90a:940e:: with SMTP id r14mr9004730pjo.47.1606470102432;
        Fri, 27 Nov 2020 01:41:42 -0800 (PST)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id h7sm8120198pgi.90.2020.11.27.01.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 01:41:41 -0800 (PST)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] media: vb2: always set buffer cache sync hints
Date:   Fri, 27 Nov 2020 18:41:36 +0900
Message-Id: <20201127094136.1051071-1-sergey.senozhatsky@gmail.com>
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

Reported-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 5499013cf82e..14a26888a892 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -414,6 +414,8 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 		vb->index = q->num_buffers + buffer;
 		vb->type = q->type;
 		vb->memory = memory;
+		vb->need_cache_sync_on_prepare = 1;
+		vb->need_cache_sync_on_finish = 1;
 		for (plane = 0; plane < num_planes; ++plane) {
 			vb->planes[plane].length = plane_sizes[plane];
 			vb->planes[plane].min_length = plane_sizes[plane];
-- 
2.29.2

