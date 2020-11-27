Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7A72C69F6
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 17:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732198AbgK0QoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 11:44:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732187AbgK0QoG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 11:44:06 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A571C0613D1;
        Fri, 27 Nov 2020 08:44:06 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id b23so2932149pls.11;
        Fri, 27 Nov 2020 08:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kbClK/FDOF+E0ix0J3ZWkK+oML0oIoT2QMRepleWE6Y=;
        b=XIxjDalHT6LEdidb4zsEyZdHVatrVyXm+qB5XRMJHncBqjYkSg1toXNGbxxHf+fo/z
         qNdlJ/yqWv+v7NsMudqwSu+54MOpkLkO4SFHIbiHSA8qNW0wcqSve5ZlU2m5OccBmMNA
         ySO1ql6OGxwlW6RwaMPTKvXR8zE//hv7GB4v2WpjztMMfTNH5QDgWi8aR9m5r4YHXPYX
         tDdSZ3jJm9HgltXdDDex/TViRnQbYbq+4Gqr/dx1r6ZlOMNfefMPfcxyin0TI7lY6IvA
         syoHG9q3cr4e9vwXc+0ySh1VJDBvdEtY/T3sASsoUujMRjRVrDK7hznlM1IgZ5kaSZqg
         p6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kbClK/FDOF+E0ix0J3ZWkK+oML0oIoT2QMRepleWE6Y=;
        b=aVHBUiBTQd/8+dljxF5UXThkomqwq9WZuTCLwTpPghpibupFhbIHjY/hzJgvt4DbeA
         P+cflDyYKTK4GUxScj8oMhzZGnrJFSIPcZrjEdDouH5HXGCX2nOZ05LgwrRqCAMtLUk9
         kN21EQBHIXo4HUk60tHmqDhc1rohmPk9ejDVVa3enlFtb0ZYM0gJ8oKOeYY6w+e8GEk+
         OInOcA/spsgh9vUwyZPqUOyaeWp1/VnFEpDsAwoL8PQ9hgLBJIr5eEUhhRCky/fRaoI/
         KnER8lft5BhmtSZMufgxeg3HvRVRytLMlHb9BtaAcJDOMYdi9yKV07YkNYDdUnBy2AK+
         Gclg==
X-Gm-Message-State: AOAM531JZtwVwzaffo6NWcbGMm29xdooF50WAYEHUH/38Baxy4XZKm6Z
        4b77avVtKsHXMmtQNlFe/38=
X-Google-Smtp-Source: ABdhPJxPBLwriAsYe0OdOL9lWq4zCdeBhddzpEMaBQlQYtHgQkgaIJ4A5Bg7od/LceIX+oVEznFRJg==
X-Received: by 2002:a17:902:9a06:b029:da:1d45:2c63 with SMTP id v6-20020a1709029a06b02900da1d452c63mr7628964plp.31.1606495445696;
        Fri, 27 Nov 2020 08:44:05 -0800 (PST)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id 22sm11021181pjw.56.2020.11.27.08.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:44:04 -0800 (PST)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2] media: vb2: set buffer cache sync hints during initialisation
Date:   Sat, 28 Nov 2020 01:43:53 +0900
Message-Id: <20201127164353.1207871-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to set ->need_cache_sync_on_prepare and
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

v2: add a comment and set cache sync flags only for specific buffers (Hans)

 drivers/media/common/videobuf2/videobuf2-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 5499013cf82e..da777c3c5d69 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -414,6 +414,18 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 		vb->index = q->num_buffers + buffer;
 		vb->type = q->type;
 		vb->memory = memory;
+		/*
+		 * A workaround fix. We need to set these flags here so that
+		 * videobuf2 core will call ->prepare()/->finish() cache
+		 * sync/flush on vb2 buffers when appropriate. Otherwise, for
+		 * backends that don't rely on V4L2 (perhaps dvb) these flags
+		 * will always be false and, hence, videobuf2 core will skip
+		 * cache sync/flush operations.
+		 */
+		if (!q->allow_cache_hints && q->memory != VB2_MEMORY_DMABUF) {
+			vb->need_cache_sync_on_prepare = 1;
+			vb->need_cache_sync_on_finish = 1;
+		}
 		for (plane = 0; plane < num_planes; ++plane) {
 			vb->planes[plane].length = plane_sizes[plane];
 			vb->planes[plane].min_length = plane_sizes[plane];
-- 
2.29.2

