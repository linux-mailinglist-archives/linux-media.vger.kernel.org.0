Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1286272FFD5
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 15:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbjFNNUP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 09:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244933AbjFNNTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 09:19:49 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11823184
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 06:19:48 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f8d61cb36cso7054505e9.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 06:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686748786; x=1689340786;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PTawR0BST9G8lotfidO6LQNYRUso7ZDIUXpuUcCHtQE=;
        b=BkNqnKVPVix70BOCgXe1QS8U2bYh+Edg1fvfVenwQ/Ri1EdnqryOIy0ZDW8e4tRjGZ
         gKywT15Z86R6zMxsROch7kSZqBpTDmKV60o3lgC8wmvibvywkcPd2gST+lF9rS6+E8Z/
         BzqjJ2VW/T4Mx5qRRXO2O7UjR4O/jT6wfJTgqZbg72kZCLTRN/G7JPNaq9R8hN/xNMB6
         HWw3AE9CYtxy9ebFDvEmT6Kg4WhNlB/Qc24OigcLyAAbvLLJOLyTD26ZrrvMgFaVCi+Z
         we0Cf+dolYNcSkqDdd6FasfuwA0+Sok2MdB4LIaRjktDqg/HwbfHxywwfLxOeC23JCql
         0N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748786; x=1689340786;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTawR0BST9G8lotfidO6LQNYRUso7ZDIUXpuUcCHtQE=;
        b=NplRnfsZJfo066UYFIZ2ZZG4dmsvEBd8o4IJvIc50SMzm40+CJMN5mXvRiuR6pxusx
         wVVbflCNrp1USHgltvORq2Ii/gTluurKiFcajoKx+NViOanWi7yGRpy95y5howKZ01/H
         vsMmj5DFPQkOvANIV0x9HTPFpvL767FtFYAIOvf/eao+aDfn7kkNgM/EQHUwwCGnzXlM
         IASuFdGR7PlqfOlbaT4Xu70UqUyUwCf/cYf0DUAC2gpmffqtTtRoeVomrs+8LRA6oBJM
         4rcTmnq9JWCxv20/nQhF+NENaCt9BqauqLPm/C+pjRnP589J6EKjwUoqy65kY0aznx9t
         9K5w==
X-Gm-Message-State: AC+VfDwf5DVT4sU6SnvosAkKfJOHnRzshGrpvIZRJKtZTqBcmxqkOAUo
        eFaAn3RbgM8YMLz6CmFhpIbEcQ==
X-Google-Smtp-Source: ACHHUZ4DeIGubCRzWcvMeuPt39igLK19RrM/aDbDy7aAEaqAAwy/j8foX3lY71X1d6U5MvbZfo2OWA==
X-Received: by 2002:a05:600c:287:b0:3f6:766:f76f with SMTP id 7-20020a05600c028700b003f60766f76fmr11311559wmk.36.1686748786546;
        Wed, 14 Jun 2023 06:19:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z21-20020a1c4c15000000b003f80622bb65sm16430946wmf.12.2023.06.14.06.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:19:45 -0700 (PDT)
Date:   Wed, 14 Jun 2023 16:19:41 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 4/4] media: mediatek: vcodec: Improve an error message
Message-ID: <0cdeeee4-3bd7-4bd5-88a1-c5ecf7f6a1f8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca491aaa-cfc4-4a84-b7fc-b64f3adc6550@moroto.mountain>
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is intended to print the error code but there is a typo so it
prints IS_ERR() instead of PTR_ERR().

Fixes: 77f3b023f452 ("media: mediatek: vcodec: Add debugfs interface to get debug information")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This driver has quite a bit of code to handle the case where DEBUG_FS is
turned off.  It's a bit over engineered.  With debugfs you're normally
just supposed to call the functions and ignore the errors.

But it's also harmless to do it this way.

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
index 2ebf68d33d57..6957105492ae 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
@@ -185,8 +185,8 @@ void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev, bool is_encode)
 	else
 		vcodec_dev->dbgfs.vcodec_root = debugfs_create_dir("vcodec-dec", NULL);
 	if (IS_ERR(vcodec_dev->dbgfs.vcodec_root))
-		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%d\n",
-			IS_ERR(vcodec_dev->dbgfs.vcodec_root));
+		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%ld\n",
+			PTR_ERR(vcodec_dev->dbgfs.vcodec_root));
 
 	vcodec_root = vcodec_dev->dbgfs.vcodec_root;
 	debugfs_create_x32("mtk_v4l2_dbg_level", 0644, vcodec_root, &mtk_v4l2_dbg_level);
-- 
2.39.2

