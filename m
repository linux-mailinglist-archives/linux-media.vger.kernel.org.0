Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCB732E53A
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 10:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCEJss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 04:48:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbhCEJs0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 04:48:26 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99ACFC061574;
        Fri,  5 Mar 2021 01:48:26 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id 16so238452pfn.5;
        Fri, 05 Mar 2021 01:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lBLqTm8LAm2vM2JvWYN/kau0Luv/b/q3A2F/WW9Z07Y=;
        b=qH4Uj+KOv9z9Z308T8ARccdkgubmvLPUjafgS7q2F5DZgM6dlgF0He+hq9m6gHsR4n
         oMHrtH21C32CLqJg0wlgzcct7a9OKZ8RG/a2fMYZChDff1Ye38VIhZazIOiC/MUQ6WaD
         55OrRrrfsKWyITLr1LVY2geVsCPxH4G9kw3i1qU8xUP/I2wVVS4fDzkrJHLXlrI6uXND
         iKTY8ZfjfXbcWjkJvbUbU2Cd7M5kegq3FjDoA3vQSlxpN5O75nYOVwI7omxFNbj0Or4V
         F4FvyVMhDX1BN5ujTzJDWYrM7H/3156TuzoZHEPKE102J5XU/cj6koGgmnEc9+cDD+ju
         83Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lBLqTm8LAm2vM2JvWYN/kau0Luv/b/q3A2F/WW9Z07Y=;
        b=WKxvDwPp4DatMbhfebaMfNsReQx10R+Lf3px9fiUFR1NAfTG9MsfH87wmvcQgM4f+z
         +J+LDjHbUgIilyOIPYdXpeIfi3ZmJ+SrnxuLipKbpxls5Q92AL5ALHxt8srdFWvCHzXb
         l40DA5h7b2+GFR+1NxUnHnqXcSKY1pgOJjFYwZu4TM7xhurpclKNn4Cg3C+R5K58SIOE
         JjdbtATi/dSyuOh0IfHM4Zz9Cyo9XHGHHaHafw6lLwzInJ76oMu7IhIOOxMg+1CHooHa
         /BczUM6YjydYgDN6rOUUwCf/bAuNclHrLXsCiBWbtclvFCCCyG56vIFKs1KB3WcVJwMd
         Mf6w==
X-Gm-Message-State: AOAM530h5s9uy0z6JWLb+41hWCfVZb0P87BGD1WTIY3OC2PTUcTSYx3E
        yssHjVZkZJ3F66i8StS0kuA=
X-Google-Smtp-Source: ABdhPJyvbZcUBXp9Ww2TB7V8o1nujwy2gTBBkcI9x0R6Hvx7mBzQi89MX8pZmA96J57Jm1wA9FEfvA==
X-Received: by 2002:a05:6a00:ac8:b029:1ed:f8dc:cb3b with SMTP id c8-20020a056a000ac8b02901edf8dccb3bmr7948223pfl.60.1614937706258;
        Fri, 05 Mar 2021 01:48:26 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.129])
        by smtp.gmail.com with ESMTPSA id x1sm1727420pje.40.2021.03.05.01.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 01:48:25 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, michal.simek@xilinx.com
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] media: platform: xilinx: fix error return code of xvip_graph_init()
Date:   Fri,  5 Mar 2021 01:48:19 -0800
Message-Id: <20210305094819.13685-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the list of xdev->notifier.asd_list is empty, no error return code
of xvip_graph_init() is assigned.
To fix this bug, ret is assigned with -ENOENT as error return code.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index bf4015d852e3..2ce31d7ce1a6 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -525,6 +525,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
 
 	if (list_empty(&xdev->notifier.asd_list)) {
 		dev_err(xdev->dev, "no subdev found in graph\n");
+		ret = -ENOENT;
 		goto done;
 	}
 
-- 
2.17.1

