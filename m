Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E2D1B70DB
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgDXJak (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726523AbgDXJak (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:30:40 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D01C09B045;
        Fri, 24 Apr 2020 02:30:40 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 7so4570218pjo.0;
        Fri, 24 Apr 2020 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PnRbc31NNtJk9tFYJKwcEqOlUSl+vuVKarKs0i2/PM0=;
        b=pDxPOHvWZ3cgHZ1XYJ03IyzGoG+JXH+2/HBBGIR3219YABQPHhHmxsvmSTJ7MzoJY1
         3cQo1WYCEU5HIO0UmNhodH49KKuNRH5FhQsOh7IgAPxEsQf0Ild4l8lFKiL5bHwZWQP8
         nyYpQxOTH2Ylv9jiM5THkinvn8HHuuSZTGGvWDNUC0Hb9HpYWmls1vfcGSPdtWAM9hlF
         njb5WxU5yLlJ1wjaQGlSO5UJqumzNeXUIfx4sFXjSmu3dh2h4SPcqQ34rq+puQb6D6Do
         fVtxUWM9xpnv8oDmW8dbQ2KUwXSCC51VV6CJcWWbDBo4q+hb5Kry941/g03yOFAiZa5O
         I08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PnRbc31NNtJk9tFYJKwcEqOlUSl+vuVKarKs0i2/PM0=;
        b=WBYA3dc2Esr9MZAdINTaruT15sn4F+j5SgbRu2/VSpnbWeQnvaG+7yh2ehFNM/lDGj
         bTEZq4J7jnL0BRUIDqqYzmOuhyb5gE6O/O2uY5yf7yt1+Hr7UyE4RWryzOXe/iqpcDaQ
         0Nx82ID5Jtnoi3YqdnaohxsVaf2YklSNVzsRXUsPspEqTjP/pfkAUy5WSmzBKxPmsWVN
         9PFBjzpDU99/47/MCUbvfZa3/pvLk+dr9jFeYFCMUXzH/zlxeTT9k6ZhKUXnYwPKX5xg
         +PbZwzzNZbbqdkNQBh0L0qegiaPRfaRwnaWwQeLPyCh9ZlwkhZfpHREJ9zFrnPrEz9/I
         lwbA==
X-Gm-Message-State: AGi0PuZ3jcWa7/I3m0xWx9Kvzq6MIM+sEpO5/9MnFSQV6kJEsHDnGil6
        yQmvIbkowZX/iZAKALXpe2c=
X-Google-Smtp-Source: APiQypKYfsb89CG8UIY5O5Gldu5tg5+E917n3JgQZ7mDFSuJPk7yoJ0s81OtjnkcvJq/rYS6/NQYCA==
X-Received: by 2002:a17:902:968a:: with SMTP id n10mr7784459plp.96.1587720639576;
        Fri, 24 Apr 2020 02:30:39 -0700 (PDT)
Received: from localhost.localdomain (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
        by smtp.gmail.com with ESMTPSA id 185sm5541315pfv.9.2020.04.24.02.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:30:39 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 01/13] videobuf2: use explicit unsigned int in vb2_queue
Date:   Fri, 24 Apr 2020 18:29:08 +0900
Message-Id: <20200424092920.4801-2-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
References: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

Switch from 'unsigned' to 'unsigned int' so that checkpatch doesn't
complain.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/media/videobuf2-core.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index f11b96514cf7..9e522bd2acc7 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -558,15 +558,15 @@ struct vb2_queue {
 	unsigned int			io_modes;
 	struct device			*dev;
 	unsigned long			dma_attrs;
-	unsigned			bidirectional:1;
-	unsigned			fileio_read_once:1;
-	unsigned			fileio_write_immediately:1;
-	unsigned			allow_zero_bytesused:1;
-	unsigned		   quirk_poll_must_check_waiting_for_buffers:1;
-	unsigned			supports_requests:1;
-	unsigned			requires_requests:1;
-	unsigned			uses_qbuf:1;
-	unsigned			uses_requests:1;
+	unsigned int			bidirectional:1;
+	unsigned int			fileio_read_once:1;
+	unsigned int			fileio_write_immediately:1;
+	unsigned int			allow_zero_bytesused:1;
+	unsigned int		   quirk_poll_must_check_waiting_for_buffers:1;
+	unsigned int			supports_requests:1;
+	unsigned int			requires_requests:1;
+	unsigned int			uses_qbuf:1;
+	unsigned int			uses_requests:1;
 
 	struct mutex			*lock;
 	void				*owner;
-- 
2.26.2

