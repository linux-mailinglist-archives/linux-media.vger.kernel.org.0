Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4C6616167B
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729376AbgBQPpQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:45:16 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34297 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729347AbgBQPpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:45:15 -0500
Received: by mail-wm1-f66.google.com with SMTP id s144so179349wme.1
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2020 07:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+IMDOmFylD8uY29srTPJeuhzvALvSmjHT6oldeZvGlc=;
        b=LhUrZ5r+Hh5Ypw/NTckBaw4la+jkk5dnSovmwQ+mxJTUPxUWl9t9MbKSZCKcJ9+cbe
         y/5m8Pd/y4d83Uy8NeOKeuAGy1f68QeJgKox2UdF6yQ2fGjibOGs6Jp/CbEA94CuJLc5
         0Y1cy/wJYUqSgjmJ7R9qLH0AAB5RTdn9YBV2Nn0DnxBNvsIEeEYZLMkiEkyG1Hfdc+gW
         ohE8fDd0+DI7boKQxErueU/hgpGFkwAHhZ4KdjWei5dQqE9lF5o2EY/uJTdpU96qzjnl
         pF3N8zsowUplkELdewoc3gv5u261pIZGZG4zCdfhRoJawy3ja0O9L+pMLpnMXh6CQj++
         8VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+IMDOmFylD8uY29srTPJeuhzvALvSmjHT6oldeZvGlc=;
        b=K8rlT9aD0Ua+vhA9obbiSyEbfNf6CJtIF8euHwsI+JfGPoirpjfswkWZj+4cmLe2Pp
         PFwHjrGQyvxIg+koiSmiixC7Q+XFjUD+rYZMy0gH7sCFXmBAIJi7H+aL1BqJlvbpQUpL
         Nf0kgVx5SEueWHBD/sjOA3dPTkyx68CMyy7ypXhUIx/AaKET8ZVpHJ4EP9WS+ZkLuy/c
         NEVu8SSeHx1FO7On9jChU3npoy3K4zxmkqzir6JFcoklEHvXWEeZf35+MxUzLq2e9Cc0
         Zfqkjp/AP/uII81pq14YP9q+gZjA3fK9J9oWG/GCdPGA8GAHn2upiw/NQ0XTy+v7g39j
         JkSQ==
X-Gm-Message-State: APjAAAWQxlbbS/SrMOtXy8PbRHpZ+z+bwetft0PaZWqHuGkd3HtftFSm
        ECQ2Hmt7MQWyFL52i79/Srs=
X-Google-Smtp-Source: APXvYqzwzcqOuX6mDbw5hwvhy07pOTJEJrMbcblybJM071pMDEkY0YwtF2pDWB7YbLXWi2/ItUl3fA==
X-Received: by 2002:a05:600c:211:: with SMTP id 17mr22731033wmi.60.1581954314747;
        Mon, 17 Feb 2020 07:45:14 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:180d:d2d6:6ff9:a6cb])
        by smtp.gmail.com with ESMTPSA id r6sm1372658wrq.92.2020.02.17.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:45:14 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: [PATCH 2/5] drm/ttm: remove the backing store if no placement is given
Date:   Mon, 17 Feb 2020 16:45:06 +0100
Message-Id: <20200217154509.2265-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217154509.2265-1-christian.koenig@amd.com>
References: <20200217154509.2265-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pipeline removal of the BOs backing store when no placement is given
during validation.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 229205e499db..a56cb2a2b4ad 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1225,6 +1225,18 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	uint32_t new_flags;
 
 	dma_resv_assert_held(bo->base.resv);
+
+	/*
+	 * Remove the backing store if no placement is given.
+	 */
+	if (!placement->num_placement && !placement->num_busy_placement) {
+		ret = ttm_bo_pipeline_gutting(bo);
+		if (ret)
+			return ret;
+
+		return ttm_tt_create(bo, false);
+	}
+
 	/*
 	 * Check whether we need to move buffer.
 	 */
-- 
2.17.1

