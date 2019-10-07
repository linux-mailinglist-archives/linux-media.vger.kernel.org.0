Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48602CE3D7
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfJGNhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:37:07 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39364 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGNhH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=+/VL2rHq7vq2DnAhaJqD+it3BkKnRi3cmIDH3We/YPk=; b=uMnMz+Wd8Q4JECMjPASj9hxNO
        4DkOxft+/1sMtmX0pnZUZUKr8lmjeY+s+ZQW5wlmeDQJues0BPyCmAZi/mOmroxeuyURZNjVH4+8M
        geFrdbWwaAGLsC+pohmOT3SDFamRFYyE4AmY60F4AhxE4kUPzDMokAMAaSblJUT7vOeTiMp6jz9FE
        PDcyGyqUokU6zekScOoi9MBh58Voc75+bugTAnWSGD2ApYMjn6fyA1Nlq7ucnpRLiMA4hazrUIZfx
        TH+fqEUfHGvjo0zoFuzvkWkgHVJiVDOdzIMdh89cBbFKYAKFStE/TFtXIJOlHHwgsCfk5YlKPR5zu
        amV6YNxhA==;
Received: from [179.95.33.153] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iHTCE-0005Ln-Eu; Mon, 07 Oct 2019 13:37:06 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iHTCB-00067Q-BS; Mon, 07 Oct 2019 10:37:03 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: venus: fix build on 32bit environments
Date:   Mon,  7 Oct 2019 10:37:01 -0300
Message-Id: <f8b266dea8594c046bd545ca1f497bfc1658835d.1570455418.git.mchehab+samsung@kernel.org>
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

That's said, why fps is a 64 bits integer?

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 5ea5d90f8e5f..09fa87e3c0a0 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -522,8 +522,14 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
 	unsigned long vpp_freq = 0, vsp_freq = 0;
 	u64 fps = inst->fps;
 	u32 mbs_per_sec;
+	u64 tmp;
+
+
+	tmp = load_per_instance(inst);
+	do_div(tmp, inst->fps);
+
+	mbs_per_sec = (u32)tmp;
 
-	mbs_per_sec = load_per_instance(inst) / inst->fps;
 	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
 	/* 21 / 20 is overhead factor */
 	vpp_freq += vpp_freq / 20;
-- 
2.21.0

