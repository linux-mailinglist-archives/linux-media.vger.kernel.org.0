Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECD2075E99B
	for <lists+linux-media@lfdr.de>; Mon, 24 Jul 2023 04:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbjGXCRI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jul 2023 22:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbjGXCQz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jul 2023 22:16:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB621212D;
        Sun, 23 Jul 2023 19:16:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B9DE660F9C;
        Mon, 24 Jul 2023 01:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53F2C433BB;
        Mon, 24 Jul 2023 01:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690162560;
        bh=PW4WxFGrvqfneht5/Jh0eks0NWEnSus/V5aQFykvO60=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PhoJAM1Wz3t1UDlxLMs7M762JvpCudlNbSDkmjdc4QvYdpqR1eItftglN0bQwKWUf
         /33coj89E9CM5Cc8bLn2ft4xpUd9Ug+EzSXjb5peetlJE833GDHZK8biucM2Dx6gGa
         mpFXtB+ykJ6+W/GaxQ5IH751/a24tN1o9g5az1ux1JejVPuBeUGSzSEX5QWBe6bo0H
         BVcps63aPJLLF4Ay53d9u4hBCOn+nExkUI9fe6xv0NPhT7j1NI8W+iT7ao8fEOc29t
         HpFexqPiiLcvqXiuJZneoDwSrL9fc6QhPmGzkj0yN5T/y4YzqRmUhjICgQWicRe/i0
         prHGqgEUVqDGA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, tiffany.lin@mediatek.com,
        andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com,
        houlong.wei@mediatek.com, matthias.bgg@gmail.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 2/9] media: platform: mediatek: vpu: fix NULL ptr dereference
Date:   Sun, 23 Jul 2023 21:35:44 -0400
Message-Id: <20230724013554.2334965-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013554.2334965-1-sashal@kernel.org>
References: <20230724013554.2334965-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.320
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 3df55cd773e8603b623425cc97b05e542854ad27 ]

If pdev is NULL, then it is still dereferenced.

This fixes this smatch warning:

drivers/media/platform/mediatek/vpu/mtk_vpu.c:570 vpu_load_firmware() warn: address of NULL pointer 'pdev'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 019a5e7e1a402..de5e732b1f0b6 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -536,16 +536,18 @@ static int load_requested_vpu(struct mtk_vpu *vpu,
 int vpu_load_firmware(struct platform_device *pdev)
 {
 	struct mtk_vpu *vpu;
-	struct device *dev = &pdev->dev;
+	struct device *dev;
 	struct vpu_run *run;
 	const struct firmware *vpu_fw = NULL;
 	int ret;
 
 	if (!pdev) {
-		dev_err(dev, "VPU platform device is invalid\n");
+		pr_err("VPU platform device is invalid\n");
 		return -EINVAL;
 	}
 
+	dev = &pdev->dev;
+
 	vpu = platform_get_drvdata(pdev);
 	run = &vpu->run;
 
-- 
2.39.2

