Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6520333AA1
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 11:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbhCJKrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 05:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232576AbhCJKqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 05:46:42 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F43C061761
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 02:46:42 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id x9so27281509edd.0
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 02:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7E2gXsQZ9cBxH8hKnNKchItzy4zUfJI/8/dUUecjq8=;
        b=dxAPCGTYWx8GZ/6wY8jtkMzDpWcBv0e/dNkghlRLMrgsVfdrQJ2z+oJ6mrAvIzwzrZ
         7KpwWUdSEKNo9psYA0JmmsiLbNMf4qZUlU6zYRWdNGlyQ2fzwm3WYy9mZ+IfKxv2Vb7X
         gommdvyC2NX/sK1OB/WI4S/tC1x7hnsRunNzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7E2gXsQZ9cBxH8hKnNKchItzy4zUfJI/8/dUUecjq8=;
        b=nss8ruY714DbirRhgZvHXpUhPNcb9onaM3y9t/OZ/TT3IOjeKcpp2e/vxkm3hEX5nW
         xsDWBCZE8O8a/JFURNHhhr/XR7EgmgSkDsvhYAWMEE1swi+cH7Fuo8m2OwW7gHmbb0jE
         lRLu/5mVks3u2+svABVYMD3bdSzWShdk/dS1zjPgBiNJiGEhQbIT5XZe1Fr5Fj0lFO4h
         MHUlfFHuLyV9ImOI00PMaxcf3GGCug2BVatGgPQq09PZGHvRr/8kB4eBo/2z781MJgvR
         odUQylry42thywgPltAqFsg6r9sgsoVf7b/wvLG/E+V05GE6ZkCtvOIZo+ehZIXjPtWn
         1y4w==
X-Gm-Message-State: AOAM532+Lk+LktbuG6fpgv0A4H/etlBROVXs7/zmbcp2Sxjqlg1LAsJr
        RXv/eMmVgGe636qkqp/IhcxvBVj4pTueH8TziKc=
X-Google-Smtp-Source: ABdhPJxPx0CojsYcEqI9IXVTlvXpnhDJnrEF6fgKvzZaTdmzHC6l1zZ6iIYZu6SYm/K5k5S0bFYnEA==
X-Received: by 2002:a50:ee19:: with SMTP id g25mr2522188eds.351.1615373200967;
        Wed, 10 Mar 2021 02:46:40 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hd37sm9416918ejc.114.2021.03.10.02.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 02:46:40 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: videobuf2: Explicitly state max size of planes
Date:   Wed, 10 Mar 2021 11:46:39 +0100
Message-Id: <20210310104639.1069974-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The plane size needs to be PAGE_ALIGNED, so it is not possible to have
sizes bigger than MAX_INT - PAGE_SIZE.

We already check for overflows when that happen:
 if (size < vb->planes[plane].length)
	goto free;

But it is good to explicitly state our max allowed value, in order to
align with the driver expectations.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/media/videobuf2-core.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 799ba61b5b6f..12955cb460d2 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -154,9 +154,11 @@ struct vb2_mem_ops {
  * @dbuf:	dma_buf - shared buffer object.
  * @dbuf_mapped:	flag to show whether dbuf is mapped or not
  * @bytesused:	number of bytes occupied by data in the plane (payload).
- * @length:	size of this plane (NOT the payload) in bytes.
+ * @length:	size of this plane (NOT the payload) in bytes. The maximum
+ *		valid size is MAX_UINT - PAGE_SIZE.
  * @min_length:	minimum required size of this plane (NOT the payload) in bytes.
- *		@length is always greater or equal to @min_length.
+ *		@length is always greater or equal to @min_length, and like
+ *		@length, it is limited to MAX_UINT - PAGE_SIZE.
  * @m:		Union with memtype-specific data.
  * @m.offset:	when memory in the associated struct vb2_buffer is
  *		%VB2_MEMORY_MMAP, equals the offset from the start of
-- 
2.30.1.766.gb4fecdf3b7-goog

