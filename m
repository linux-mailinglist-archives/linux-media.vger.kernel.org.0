Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9D01D35EC
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgENQDR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQDQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:03:16 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A239C061A0C;
        Thu, 14 May 2020 09:03:16 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f23so1426082pgj.4;
        Thu, 14 May 2020 09:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fjVyJRVWy9ca+3Xi4BztaczxsLydF8GYNLUqCa/Q7hs=;
        b=YKJgGKYNbMg6yVsep+dH1X3857st5yYb0rdy1NvLH1iHV5OP5fvCD0q28gq/6nuoX6
         otwLWGOUoa5yTVRc0XUREN2Kt9PEWCbVqX16yoe80fbcSiUH6H71ALLx2FbbJZSnJtvO
         eWADzJRqoEKN+nmlDLLCo1mqSDxBkHhJR5odORkTEFQqw/bIomxXLG59MXVnLA3I9dIr
         G2wFrtnOSxoEgbe53dgrT3lvxB9gl/Lfth1r24ZoNmb6A7Qcuf7JD6Yv8NLkR+xUBhPX
         of6b0HSE53wjBHR2q5L+tn7wnklDT8elocdiabrmchhqjVtA5fcUCZWsLhbHwzX6pDfD
         yuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fjVyJRVWy9ca+3Xi4BztaczxsLydF8GYNLUqCa/Q7hs=;
        b=YbDksL9PJxVo716+1+X5Z53zEp/Eahs4q+Yqno5WNL5NDZ5whNcNW6NYZGHteNRI3V
         JqlLzoWyP4g6f71zUNi4smnIPrjstOycg6dlsQLzZ6+XHrkuiSJvkSZykZ/rnKEMIBN8
         CTIk8tvVgtiWPFwwg6RSul2e/WCx2vk9xyRY2q687+lu2C/8tnR2L7/hnUfTbuPqZQEi
         IwPqzFZ+vtZb9Mf4Ht8K2TFbAe8RCJtq7rgvMmgyJORgavePIyLS6AYC8I4OHWyLUKOp
         XB0NQ5Ml9Eu26nhMCp3EihZjcYk7uATFjvztu/kSzrXTZTzzTWjL9Fk5he/mE+eGoG69
         ddzg==
X-Gm-Message-State: AOAM531aBD9kpR6/8VvmPhhKnx6PENbFzpYf3D9FjR/eC/ufh2NTSkR1
        omn1TnM6UD9HwjGCQGart8w=
X-Google-Smtp-Source: ABdhPJy3JHsTPxCh3oH0qeq7xfzaE+sGfGL7Ga10UrKJgxMNv0Nkkw2Kb01daClTcLOXUA8a/YLSeA==
X-Received: by 2002:aa7:9690:: with SMTP id f16mr5396316pfk.20.1589472195942;
        Thu, 14 May 2020 09:03:15 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:03:15 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 13/14] videobuf2: remove redundant if-statement
Date:   Fri, 15 May 2020 01:01:52 +0900
Message-Id: <20200514160153.3646-14-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

That if-statement seems to be unneeded.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 5a3e1c3b556f..6ac0822e1bf0 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -152,8 +152,7 @@ static void *vb2_dc_alloc(struct device *dev, unsigned long attrs,
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
-	if (attrs)
-		buf->attrs = attrs;
+	buf->attrs = attrs;
 	buf->cookie = dma_alloc_attrs(dev, size, &buf->dma_addr,
 					GFP_KERNEL | gfp_flags, buf->attrs);
 	if (!buf->cookie) {
-- 
2.26.2

