Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3C0B5903D8
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 18:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238065AbiHKQ0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 12:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237765AbiHKQYd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 12:24:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2127D1E3D2;
        Thu, 11 Aug 2022 09:06:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE8E16133A;
        Thu, 11 Aug 2022 16:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE24C433D6;
        Thu, 11 Aug 2022 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660233977;
        bh=2r2PnYBxb7RpjZbnQX3kszv4R2LwzqCDy706sRtJkCo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s1AimDkCfVspQg7eemeVAZUP8Mv373Re4e3FZ1N5pLLb7yFKRclfrO0N4rClK3RVn
         V+cJ3lke9BWgPpTF3a78n2Wq9mFNtCUB31R2bwYxWdSiAKLD4ng43Boyi5QvQPhC/8
         xH6zHZVdua//Ck69qh7gHT+4LKoUerGokzbZ0te3uIfce4oK10O3qAmxP+KGPO2spd
         ZeWed0wmoaj08oVXROyRD/CIjB18OaBQpVYCzMZtFw/ezwgb0fWRIVGevUqAr8wSoB
         fe+bnp9Pfh5pQYj7CDjb5sdxX5qig3cDte3x4HHh2ZAtqQ0TybnvZ64nIp+9+ONFsh
         jfX44eJ1C9Tgw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, acourbot@chromium.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 18/46] media: mediatek: vcodec: prevent kernel crash when scp ipi timeout
Date:   Thu, 11 Aug 2022 12:03:42 -0400
Message-Id: <20220811160421.1539956-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811160421.1539956-1-sashal@kernel.org>
References: <20220811160421.1539956-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

[ Upstream commit 9223415d47e1efe939fcc791870db8ce5bb6cc03 ]

When SCP timeout during playing video, kernel crashes with following
message. It's caused by accessing NULL pointer in vpu_dec_ipi_handler.
This patch doesn't solve the root cause of NULL pointer, but merely
prevent kernel crashed when encounter the NULL pointer.

After applied this patch, kernel keeps alive, only the video player turns
to green screen.

[67242.065474] pc : vpu_dec_ipi_handler+0xa0/0xb20 [mtk_vcodec_dec]
[67242.065485] [MTK_V4L2] level=0 fops_vcodec_open(),334:
18000000.vcodec_dec decoder [135]
[67242.065523] lr : scp_ipi_handler+0x11c/0x244 [mtk_scp]
[67242.065540] sp : ffffffbb4207fb10
[67242.065557] x29: ffffffbb4207fb30 x28: ffffffd00a1d5000
[67242.065592] x27: 1ffffffa0143aa24 x26: 0000000000000000
[67242.065625] x25: dfffffd000000000 x24: ffffffd0168bfdb0
[67242.065659] x23: 1ffffff76840ff74 x22: ffffffbb41fa8a88
[67242.065692] x21: ffffffbb4207fb9c x20: ffffffbb4207fba0
[67242.065725] x19: ffffffbb4207fb98 x18: 0000000000000000
[67242.065758] x17: 0000000000000000 x16: ffffffd042022094
[67242.065791] x15: 1ffffff77ed4b71a x14: 1ffffff77ed4b719
[67242.065824] x13: 0000000000000000 x12: 0000000000000000
[67242.065857] x11: 0000000000000000 x10: dfffffd000000001
[67242.065890] x9 : 0000000000000000 x8 : 0000000000000002
[67242.065923] x7 : 0000000000000000 x6 : 000000000000003f
[67242.065956] x5 : 0000000000000040 x4 : ffffffffffffffe0
[67242.065989] x3 : ffffffd043b841b8 x2 : 0000000000000000
[67242.066021] x1 : 0000000000000010 x0 : 0000000000000010
[67242.066055] Call trace:
[67242.066092]  vpu_dec_ipi_handler+0xa0/0xb20 [mtk_vcodec_dec
12220d230d83a7426fc38c56b3e7bc6066955bae]
[67242.066119]  scp_ipi_handler+0x11c/0x244 [mtk_scp
8fb69c2ef141dd3192518b952b65aba35627b8bf]
[67242.066145]  mt8192_scp_irq_handler+0x70/0x128 [mtk_scp
8fb69c2ef141dd3192518b952b65aba35627b8bf]
[67242.066172]  scp_irq_handler+0xa0/0x114 [mtk_scp
8fb69c2ef141dd3192518b952b65aba35627b8bf]
[67242.066200]  irq_thread_fn+0x84/0xf8
[67242.066220]  irq_thread+0x170/0x1ec
[67242.066242]  kthread+0x2f8/0x3b8
[67242.066264]  ret_from_fork+0x10/0x30
[67242.066292] Code: 38f96908 35003628 91004340 d343fc08 (38f96908)

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 58b0e6fa8fd2..ccdd78f21702 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -42,6 +42,11 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
 					(unsigned long)msg->ap_inst_addr;
 
+	if (!vpu) {
+		mtk_v4l2_err("ap_inst_addr is NULL, did the SCP hang or crash?");
+		return;
+	}
+
 	mtk_vcodec_debug(vpu, "+ id=%X", msg->msg_id);
 
 	if (msg->status == 0) {
-- 
2.35.1

