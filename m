Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5A11C1B61
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729432AbgEARQQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:15 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A400C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:15 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f7so1830168pfa.9
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uHr5JKoQoDtH72JlNFLgtURjWLo3YGj8deaBxUTPJOg=;
        b=RB2ttOVmnRoYuZd2k3MUsWHmkfany7VaXoCqXth77Bql4a9xZZlfWStCPJDIy3JcFB
         ViD5AKgg9LSv7wGfD1LksPDEGVKS1slXQzv/Jv4sa5q4Y2+4kY4GAvtEGsweYDV9kkJo
         uvYNd//TQJHBiDB+G6oVkLO4rUpMKtZKKf69hdsedJ/W4F5jkMguk1OK2jSLClriatYB
         +YaGnkD4snAawCY4dB/p/b6ydi+ktFDE4RA3YmtwiR2BR+6+U0boTNJHcNDW9q0AsAro
         zzlxIbPIDCmmItg3vnQStGxG/HXy4aWHKTf14x3gKO7VAydSIgYml77y8EVnf63eyCOX
         eGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uHr5JKoQoDtH72JlNFLgtURjWLo3YGj8deaBxUTPJOg=;
        b=ZTNOdZSndDeHYQYzOwkwCa2X54N2pdC5OJohkd7Um3Z2YIWlOLHr6ILmB33jutF6IF
         8xl3YvD1c/G1UgieJOT4Bg9bXpUEe1bt3HypX3nHQgk036JgRZTfuIT41185MfjpUN2q
         IDCoPIcE1MS+Tajr1PEQLLxXZdwfSU5IM9TFrZQFvn7eElTp/0k2VrfG+Lhk+X/DQcN/
         fS7kMEqllVURHpvh1pTjjh6yDOjJB3U36CYJ8I4Y/Qbbs4Rvvk4SYO/pZqI7mA82oWnJ
         dmQLPwGX+7r4Igl7xEd80AipU3G8pRUPp0uexhkaW0Cf4cwQOvmup/yeIQNlq2pjeR0I
         8D+g==
X-Gm-Message-State: AGi0PuZd7l8yzFTgT/8i3KDa75iyOlCtrTbzzbjLsua/XaQPorxWUAEg
        XWkdM8ZtFeK9UsMdoYFuGoMSbqTJ
X-Google-Smtp-Source: APiQypJHqewNXyH53HtsQhxFejQqBdIP8Y8W+dh4xDf0y1hK1FfqWobpZyGNrO6B+6C2o7Ibo68mqg==
X-Received: by 2002:a63:e242:: with SMTP id y2mr4610812pgj.205.1588353374587;
        Fri, 01 May 2020 10:16:14 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:13 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 09/22] media: imx: mipi csi-2: Implement get_fwnode_pad op
Date:   Fri,  1 May 2020 10:15:43 -0700
Message-Id: <20200501171556.14731-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_subdev_get_fwnode_pad_1_to_1() as the get_fwnode_pad operation.
The MIPI CSI-2 receiver maps port numbers and pad indexes 1:1.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 332d77aec8aa..23823c8c6c3d 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -510,6 +510,7 @@ static int csi2_registered(struct v4l2_subdev *sd)
 static const struct media_entity_operations csi2_entity_ops = {
 	.link_setup = csi2_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 };
 
 static const struct v4l2_subdev_video_ops csi2_video_ops = {
-- 
2.17.1

