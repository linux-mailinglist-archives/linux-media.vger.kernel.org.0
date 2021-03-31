Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C87350596
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 19:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234540AbhCaRfx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 13:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234440AbhCaRfd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 13:35:33 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE821C061574;
        Wed, 31 Mar 2021 10:35:31 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id g25so10584113wmh.0;
        Wed, 31 Mar 2021 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zVDA2U87siFM4bZ03zT66KCDipDzfZC9XU/CesvHFfk=;
        b=jw0NR0Pxj8uM0WtAtSN3Bgx8kGIbnevLfdNHMT2ryH6VkqPIJfsiwiWKndehWXuEae
         02o5ptYoCY1HqW7JVx5GYTxEQ86ueMoILBmWANfovgpvijLay8SAOpvPO2w5zJikUv7o
         TRa5wyI+c5W2fjc+Lfp/sIZIsCQ0DdVzy2f1UqkpK5boYa7hgdY69uc3v2K874YumVN2
         hTD/eUz/m/uVkUksGmO9Rq4/g/+TVr5lxSLEpNC8nnNRnKEDUIrjYhnWgBMRRbqV7EwK
         fmn9d5nil9wTLYtqgCjUnIo5xqSrkWf1w9HiS9zRhWKON5VikosTu6cyZH/ts+vHgck4
         06Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zVDA2U87siFM4bZ03zT66KCDipDzfZC9XU/CesvHFfk=;
        b=KRs+eeUz3iTRjLwMZUKLRhKImsHNESjocWs0To1KR6Q7gGb5MiXq+bPuuCF/yAhd+s
         jSwH3lLuDD8dY+Xbb6imHrh05GWTWhaOXZiYWGZ1SqDXPiXWXKsLl3GpHW7yXfvlkUJW
         Yg73f2MmZT9hXpDyUwAY+kINFjQO1wES+Dh9N4k+1JJKHxQMZIuXCN0p+PLxAvd9K6VZ
         tI3kaXlEJAeAsJFVvzjep78YPrgEyzO2Glq7r122DUMVRApIL1UDVYFQ5f4Rit4LK7Sj
         U0VcZCIbAIREIgr88He3+KhYgpJthKkb2//KjVcBD6XwxyrDmP6lmrJOrNys4kyw6FqG
         1gMw==
X-Gm-Message-State: AOAM533g60F/kjHpcxcmdXA8whviFaI1suOdUmTvolJha4W6el6lcC8W
        282358NcB+MjTfubsX8tcUA=
X-Google-Smtp-Source: ABdhPJzuSwFwMSEJJ4VXKWTaJL0XmwpILnO7FdeSPO+nnDztjerBrxyZP6h8rTPDslnjtl6Bjffg5A==
X-Received: by 2002:a1c:3182:: with SMTP id x124mr4127095wmx.41.1617212130737;
        Wed, 31 Mar 2021 10:35:30 -0700 (PDT)
Received: from arch-x1c3.. ([2a00:5f00:102:0:6e1d:cfb9:fb12:552d])
        by smtp.gmail.com with ESMTPSA id 12sm4714200wmw.43.2021.03.31.10.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 10:35:30 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v3 3/9] media: hantro: imx: remove duplicate dec_base init
Date:   Wed, 31 Mar 2021 18:35:14 +0100
Message-Id: <20210331173520.184191-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210331173520.184191-1-emil.l.velikov@gmail.com>
References: <20210331173520.184191-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The vpu->dec_base is already set by the hantro driver itself.

Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 1f48c1956cd2..cb1ac02c03d2 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -150,7 +150,6 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
 
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
-	vpu->dec_base = vpu->reg_bases[0];
 	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
 
 	return 0;
-- 
2.31.1

