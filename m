Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199EA32FB1C
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 15:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhCFOQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 09:16:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhCFOPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 09:15:45 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2629C06174A;
        Sat,  6 Mar 2021 06:15:44 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id j6so2824033plx.6;
        Sat, 06 Mar 2021 06:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=X8TTCBPkViEllxII2GAPq686qNKT8VhCeBCNCuQb630=;
        b=X4HjQFXJ5I+4Ga5ghW9W0m+NFQmbaZvOV/98ZlS9tGmLGyTFguBYAqaluWx6xhXs5x
         +Flxm6eUBr75IEMaL91AqyIrG0WtRsQKeK9WEFTtsywnpiLhd9CCkOQxxetDnNTJr+eH
         3z1yvhdANnQdGU+jcpbmOL7qTJOKvuGjQrAp72HicTG7vJVHyI7VIF4w8oQn5Z3UA0wr
         2grs5Nhohf7kdBvXkNe7YyFG1hdlnQjW/h9WmqNNxIrLvE44Wdmto/OgVQWeqwNe1fOg
         hZVJR6PWKGyPL2vth00xb01ROaTnNFPNx1ykVUcZlHJ0DGcq7Uzs3PE7HCqHehn/Sr9U
         uGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=X8TTCBPkViEllxII2GAPq686qNKT8VhCeBCNCuQb630=;
        b=pcSnV0nnErMm6j0FizIuNYqrn2TgC17qaCTayuq3W3vja10Ul/b/nXDx6gvPGOSnv5
         3I9+SPdP7e3IzPz6RMZkl6P0hhQCfCBK6wpazZo/3+wtN0ssZkuqnLM0wDkuaqc0L5WD
         gabPRZY3sMbJt81w7rBSENXC5+XiiN5KcoKE8HgeoCDH57j/YOUHGjjTgi9GuotYww0/
         4dz6bjB84tYuIq3vtli5TiHPyrscYQtB5DP4QuOPKlfOG8JZwde0E3Q6y8aj4spWMMSE
         QvrZL4O/zeaLXA0IV+7A2nzwMURp+T2w6bRNV0M5BjtfSe/dtIyrjcpZiBzC0LJLuAPH
         O1yw==
X-Gm-Message-State: AOAM531oSUyVSyY6zisNxKvFxg+f1uymwA6ulqiyKg4m9klgg3FPrsQE
        EPXjvzCscavkAZfUl9n9/DE=
X-Google-Smtp-Source: ABdhPJyaM8lMeDzibOR+TiKsLfgOxn28TEFwwtmGxMsh78ukFhJQhsfWsQh0vUQxUgOzuk2qDAxXXQ==
X-Received: by 2002:a17:90a:e50c:: with SMTP id t12mr15289117pjy.138.1615040144308;
        Sat, 06 Mar 2021 06:15:44 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.79])
        by smtp.gmail.com with ESMTPSA id 64sm5516888pfd.174.2021.03.06.06.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 06:15:43 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     yong.deng@magewell.com, mchehab@kernel.org, mripard@kernel.org,
        wens@csie.org, jernej.skrabec@siol.net
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] media: platform: sunxi: sun6i-csi: fix error return code of sun6i_video_start_streaming()
Date:   Sat,  6 Mar 2021 06:15:28 -0800
Message-Id: <20210306141528.18925-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When sun6i_video_remote_subdev() returns NULL to subdev, no error return
code of sun6i_video_start_streaming() is assigned.
To fix this bug, ret is assigned with -EINVAL in this case.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index b55de9ab64d8..3181d0781b61 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -151,8 +151,10 @@ static int sun6i_video_start_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 
 	subdev = sun6i_video_remote_subdev(video, NULL);
-	if (!subdev)
+	if (!subdev) {
+		ret = -EINVAL;
 		goto stop_media_pipeline;
+	}
 
 	config.pixelformat = video->fmt.fmt.pix.pixelformat;
 	config.code = video->mbus_code;
-- 
2.17.1

