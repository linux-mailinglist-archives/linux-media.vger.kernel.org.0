Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9692AC705
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 22:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731496AbgKIVUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 16:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731400AbgKIVTd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 16:19:33 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D709C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 13:19:33 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id c16so918238wmd.2
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 13:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/mxdauGCfin4P1unK7sTKqBRJWd95ferwSgYprlXsM=;
        b=b5h89XM0bSAA01H9VI7YC0WubiXdlYohWOGdakYwfbQeM0MifG/HJ7RiJjyS8bNAqv
         Yq0xrDdJ/NdDCYnAvDV+Gz94LXJqrl3Y9rQ1xU5cQVElcN9MRBYPt7zShja/Bk9UKiY+
         WqQGtf5m5oHpwx0PpT6vx6sx0WU+595ypt6m//MfqLkRGLEVbmlBXKkjvjc4+0QCw5SY
         32zJqgbybJVw0CEE2G/rBftR+lVzzS50Z19Gnxv32vnSAyV0pO+I/ApDOOXfswqPnmLU
         rAqt+Z5FRuuTuszclEWd6FGcuvBK9Rvt+6Q2ubDA7I6UNZGYzp4HdqjtuyoOZzsm2oeB
         Q+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/mxdauGCfin4P1unK7sTKqBRJWd95ferwSgYprlXsM=;
        b=FZuQvc6M77SYW0LP+JJd5eqi4qGgAeLuJDh8eMVG7UqCXiynuuM2TnkzXt2VzDVBL/
         vNWPxhoVg4acZ8qsgrG9kTop2WW7E70PmLfyJfMzV8w5ywTKYtKLLpOpYelnbHr9Lu8P
         tkcALCoy/tAZ7WsVvj4hDMu+wl0UagbsuNMo+rq8WfKHZX9ZAZMR8ghooivyswSj8ZZk
         qKxCuY1XPt4ffkHIxQ7hPh0Qd/VC60+Gfswcc3HypYqXf7noq/x0zwN4PhvonQTCDZaW
         7nAJJXVhaeliRv68Z46xAAY032kaCSg3eo7w1jANsuqoHMjxzFoWkOIuB3hAoWgM48Ib
         TWog==
X-Gm-Message-State: AOAM533g6hSduN0dJY9PwMrddcaLBvCShYHgpTo4nmFQgXaIHTMGdp/M
        4hQozQY9SToNKns9LgG7VbFSmQ==
X-Google-Smtp-Source: ABdhPJxxFY7gIh1xOMJZO9bky0lc6wrxtmYioHA4roB/Bb4hQn3EO/H57QfVq/ydFUCTODr9S7X8CA==
X-Received: by 2002:a1c:6545:: with SMTP id z66mr1082675wmb.157.1604956772232;
        Mon, 09 Nov 2020 13:19:32 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:19:31 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 12/20] drm/radeon/radeon_cs: Fix a bunch of doc-rot issues
Date:   Mon,  9 Nov 2020 21:18:47 +0000
Message-Id: <20201109211855.3340030-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/radeon_cs.c:416: warning: Function parameter or member 'backoff' not described in 'radeon_cs_parser_fini'
 drivers/gpu/drm/radeon/radeon_cs.c:735: warning: Function parameter or member 'p' not described in 'radeon_cs_packet_parse'
 drivers/gpu/drm/radeon/radeon_cs.c:735: warning: Function parameter or member 'idx' not described in 'radeon_cs_packet_parse'
 drivers/gpu/drm/radeon/radeon_cs.c:735: warning: Excess function parameter 'parser' description in 'radeon_cs_packet_parse'
 drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Function parameter or member 'p' not described in 'radeon_cs_packet_next_reloc'
 drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Function parameter or member 'cs_reloc' not described in 'radeon_cs_packet_next_reloc'
 drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Function parameter or member 'nomm' not described in 'radeon_cs_packet_next_reloc'
 drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Excess function parameter 'parser' description in 'radeon_cs_packet_next_reloc'
 drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Excess function parameter 'data' description in 'radeon_cs_packet_next_reloc'
 drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Excess function parameter 'offset_start' description in 'radeon_cs_packet_next_reloc'
 drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Excess function parameter 'offset_mask' description in 'radeon_cs_packet_next_reloc'
 drivers/gpu/drm/radeon/radeon_cs.c:844: warning: Excess function parameter 'reloc' description in 'radeon_cs_packet_next_reloc'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/radeon/radeon_cs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 21ce2f9502c09..729939df29cc5 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -408,6 +408,7 @@ static int cmp_size_smaller_first(void *priv, struct list_head *a,
  * cs_parser_fini() - clean parser states
  * @parser:	parser structure holding parsing context.
  * @error:	error number
+ * @backoff:	indicator to backoff the reservation
  *
  * If error is set than unvalidate buffer, otherwise just free memory
  * used by parsing context.
@@ -723,8 +724,9 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 
 /**
  * radeon_cs_packet_parse() - parse cp packet and point ib index to next packet
- * @parser:	parser structure holding parsing context.
+ * @p:		parser structure holding parsing context.
  * @pkt:	where to store packet information
+ * @idx:	packet index
  *
  * Assume that chunk_ib_index is properly set. Will return -EINVAL
  * if packet is bigger than remaining ib size. or if packets is unknown.
@@ -829,11 +831,9 @@ void radeon_cs_dump_packet(struct radeon_cs_parser *p,
 
 /**
  * radeon_cs_packet_next_reloc() - parse next (should be reloc) packet
- * @parser:		parser structure holding parsing context.
- * @data:		pointer to relocation data
- * @offset_start:	starting offset
- * @offset_mask:	offset mask (to align start offset on)
- * @reloc:		reloc informations
+ * @p:			parser structure holding parsing context.
+ * @cs_reloc:		reloc informations
+ * @nomm:		never actually used
  *
  * Check if next packet is relocation packet3, do bo validation and compute
  * GPU offset using the provided start.
-- 
2.25.1

