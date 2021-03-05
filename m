Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E81F32E000
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 04:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhCEDTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 22:19:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhCEDTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 22:19:52 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4171C061574;
        Thu,  4 Mar 2021 19:19:51 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d8so648536plg.10;
        Thu, 04 Mar 2021 19:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Mmb0AMwY7KA4BBFBr/4WxaBOD6GrsRdVk6XodB+KlyA=;
        b=GqX8IbpgcztRZwSNVZUE9Zpo3hG9IKkkkGwl4CcYO/ezr7+mzmm4SYhgi28UgVcg4D
         W1t4iyq2zV2+93ucMreym9AgTRJxTqN9iNjFcYWF+0qdCdk1an4/QlUjtJpobeQC4tlQ
         BZfZ/NcXcbhJGGLx+OKjajv8e6P+/I+ienH1V7JShCws2gcXcAVyZKLQd3auVNRQC5Sv
         8C6E/zeZKqlzJclB3aZPtkVUcVEH14dcR+jzgDeLyESj4iPzBNUEj3G6lJOJfxJ+Pf0j
         znCNc8BnEfN110Xx9GOeTj62hv6772Qtpd+UZUlOrUtoYuijwPw4sT4FERpTBSZGLuXB
         I+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Mmb0AMwY7KA4BBFBr/4WxaBOD6GrsRdVk6XodB+KlyA=;
        b=cGRpj2cBfj2VeA0GYFCgTfq0GcbK0RhxekmPpuA9tUADGbiXxEAbLYOsZqB1+FIC81
         oorKlT0GaUo4cSR+1SsXmeIQdh6zK41ffCHiPZevTwq55WCdPdBh3g9hIgx6IKyzu+1O
         YduDSlj1+TVSUyQguVLZ9FvWVbCdm8EcZYxDAKlMSr6Gjzveech0+b/DQSz1q7kGChAl
         ziVBKfpFXTGISM/23FGhqpNzK4+53jEe4UO9vngOKKGhH/AMVwEUWen57iDteB3cWvwi
         eRA0G9v0qUkS8VOqUksLemX3xNTRGuEHKrzmEo0fu22nGGS38Yjy5CUN0sgh4BXaWvGN
         dHpg==
X-Gm-Message-State: AOAM532o45wYF509QF4UBWQiXxhOBxB+GIpvp5dLr3IE5vCfy9exfqzt
        Df9Hlza3BfZeyLaGwXGJegc=
X-Google-Smtp-Source: ABdhPJyVGXtU2Bz4vgPTYGTAmH5Yu7qFtd16oH1Bed3aKphWuuMktgPBilmhbvWb2gkTx77NCNKyPw==
X-Received: by 2002:a17:90a:71c3:: with SMTP id m3mr8005043pjs.186.1614914391490;
        Thu, 04 Mar 2021 19:19:51 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.129])
        by smtp.gmail.com with ESMTPSA id 14sm684186pfy.55.2021.03.04.19.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 19:19:50 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     leonl@leopardimaging.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] media: i2c: imx274: fix error return code of imx274_s_frame_interval()
Date:   Thu,  4 Mar 2021 19:19:42 -0800
Message-Id: <20210305031942.5648-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When __v4l2_ctrl_modify_range() fails, no error return code of
imx274_s_frame_interval() is assigned.
To fix this bug, ret is assigned with the return valye of
__v4l2_ctrl_modify_range(), and then ret is checked.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/media/i2c/imx274.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 54642d5f2d5b..04f516cb6b07 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1380,7 +1380,8 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
 		max = fi->interval.numerator * 1000000
 			/ fi->interval.denominator;
 		def = max;
-		if (__v4l2_ctrl_modify_range(ctrl, min, max, 1, def)) {
+		ret = __v4l2_ctrl_modify_range(ctrl, min, max, 1, def);
+		if (ret) {
 			dev_err(&imx274->client->dev,
 				"Exposure ctrl range update failed\n");
 			goto unlock;
-- 
2.17.1

