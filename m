Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B83E1C2813
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 21:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbgEBTll (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 15:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728472AbgEBTlk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 15:41:40 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8ABC061A0C;
        Sat,  2 May 2020 12:41:40 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id i68so10709950qtb.5;
        Sat, 02 May 2020 12:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CzAS92/gIVDVCtU/nlrZcCoacFpXKrv+S/G4vPnPz9w=;
        b=CfM1ArAe0XOdhzIArrqdoBorCjqX6EzLXt79Vqaeh5dKDaPsb91Z2WaTRHTiTmL+hc
         Swae4YXaminVHGTtXUxTOQXtRGw4sWaQHo/uUhHiY3dfbg1lUcoVTBKTqH0HlcXdXh4A
         8kUUgmGmkKzZu5Faq+hh7TWGsWaD4rbyX+FdFuyUHTKlFcFyQhZtFCQKJxAqwGsuLaOa
         YGNHQ/1Xbez/YjfywqiP3vfYVPk7mxq9wQhLAj9o5GlA/IwsYfBZSCpF0coqu+EWOrsj
         o09t8YSGSu3rGo29z5AMC7Hmwmmsc07DRm1/+wtYFhPtTVaLVw0scV5jrGWD6qMwEI5H
         w9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CzAS92/gIVDVCtU/nlrZcCoacFpXKrv+S/G4vPnPz9w=;
        b=YOtjSrd1OT+6JS1Ihqo4O6uUcEVhcSv0jM4dqafCySGOu6tCmPPHkS5n7O7S5eysrL
         Vhl85QqBSQj16aVjFW1XuJno8qiH8/MQ/jyOhkSJCa7dkvURsdYpbPwXqkN9Of9Hc4hk
         YXOkuAhSJ7mnO5uniIkrGea4X81tG2YuVQnd+rC3A/Y6YxkHekNYtbndHedUZ5Mw9EIo
         hisfjMuGnytvvBNcErSxOyRiI/6aaSsNY8ugKW+MVPCiHQ32iCFXt7CPoVlsD3sAqYK8
         o1q0P3dzsNmkEkKiZ85OpY1L0/mfWi+L8/Yg/8649IWO5+ta8HSUlfhcNEN+vvRtE2C8
         JALQ==
X-Gm-Message-State: AGi0PubH0pSSPRdld2d4SF7xjDggA8DimDn1/Rr0hrIkaPD7l96mGESQ
        WcN7GYQx12x43Uh0+gwnF7w=
X-Google-Smtp-Source: APiQypKxSb6SUd0UvEqHA79llP/qMV+I+83MWiw8H0TQNOnCJmO+OPknSlUySU7fxJmCrZwHiJLCIA==
X-Received: by 2002:aed:2142:: with SMTP id 60mr10038261qtc.177.1588448499648;
        Sat, 02 May 2020 12:41:39 -0700 (PDT)
Received: from localhost.localdomain (c-71-232-27-28.hsd1.ma.comcast.net. [71.232.27.28])
        by smtp.gmail.com with ESMTPSA id t6sm5696709qkf.27.2020.05.02.12.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 12:41:39 -0700 (PDT)
From:   Andriy Gelman <andriy.gelman@gmail.com>
X-Google-Original-From: Andriy Gelman
Cc:     Andriy Gelman <andriy.gelman@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: s5p-mfc: set V4L2_BUF_FLAG_LAST flag on final buffer
Date:   Sat,  2 May 2020 15:40:52 -0400
Message-Id: <20200502194052.485-1-andriy.gelman@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Andriy Gelman <andriy.gelman@gmail.com>

As per V4L2 api, the final buffer should set V4L2_BUF_FLAG_LAST flag.

Signed-off-by: Andriy Gelman <andriy.gelman@gmail.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index 5c2a23b953a4..b3d9b3a523fe 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -614,6 +614,7 @@ static void s5p_mfc_handle_stream_complete(struct s5p_mfc_ctx *ctx)
 		list_del(&mb_entry->list);
 		ctx->dst_queue_cnt--;
 		vb2_set_plane_payload(&mb_entry->b->vb2_buf, 0, 0);
+		mb_entry->b->flags |= V4L2_BUF_FLAG_LAST;
 		vb2_buffer_done(&mb_entry->b->vb2_buf, VB2_BUF_STATE_DONE);
 	}
 
-- 
2.25.1

