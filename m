Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2DB9CF765
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 12:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730317AbfJHKrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 06:47:20 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44734 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730026AbfJHKrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 06:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Rb6Rd4h4jcCyK5/exmA3E1tM/0mlAcZYCYGv9TxKgsQ=; b=TJDbGx983pekipOac7pyQbqUE
        zuFJCzmpmhhh+d+8X0AemJyXIDoiRVBlsmzMsrWH2FP9lmZ3atLifgiMIFqabWoDuzSHfVK80qG+B
        dLiuUA6RVIyuPdFWwZm0+KMEU5vk0fVOBr+NQAc5UeLkQObutk26qaqYFt9NtgHc2u4ujkc8unck5
        43dA6ZWYZ4PMkwJqAxWDocjkX+Hg3fiZqFeUnqg++adorzBSRMGIUzi0m2Q0K0nlDlrR9g9hX4amE
        HdUgxAuWBxsGMAfzr8t6SplGXKD5MbE6RU6nQx3MOHqe/FOBLBFa8jOR0M2WhMGsD2mUayR7Ab1Ot
        P7EZ/GVIQ==;
Received: from [179.95.33.153] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iHn1T-0006Qy-SW; Tue, 08 Oct 2019 10:47:19 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iHn1H-0003sZ-DP; Tue, 08 Oct 2019 07:47:07 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] media: venus: fix build on 32bit environments
Date:   Tue,  8 Oct 2019 07:47:06 -0300
Message-Id: <fe713104c8e1c218149013576e8e99f8563796bd.1570531619.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported by jenkins@linuxtv.org, the build with i386 fails
with:

	ld: drivers/media/platform/qcom/venus/helpers.o: in function `venus_helper_load_scale_clocks':
	(.text+0x1d77): undefined reference to `__udivdi3'
	ld: (.text+0x1dce): undefined reference to `__udivdi3'
	make: *** [Makefile:1094: vmlinux] Error 1

That's because it divides an u32 bit integer by a u64 one.

Fix it by explicitly callind do_div.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 5ea5d90f8e5f..a172f1ac0b35 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -520,10 +520,11 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
 					 unsigned long filled_len)
 {
 	unsigned long vpp_freq = 0, vsp_freq = 0;
-	u64 fps = inst->fps;
+	u32 fps = (u32)inst->fps;
 	u32 mbs_per_sec;
 
-	mbs_per_sec = load_per_instance(inst) / inst->fps;
+	mbs_per_sec = load_per_instance(inst) / fps;
+
 	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
 	/* 21 / 20 is overhead factor */
 	vpp_freq += vpp_freq / 20;
-- 
2.21.0

