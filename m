Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4E63932AC
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235654AbhE0Pq6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235559AbhE0Pq4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:46:56 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7CCC0613CE;
        Thu, 27 May 2021 08:45:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id e12so853539ejt.3;
        Thu, 27 May 2021 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tWh5VnD7cFHZl8C6HW0Fm8ub9f2GQzag/b5XhoSI/fU=;
        b=q9fQcC7wLe3lM0iph0SsisC3/aNTsM/GvBZwFDBeMPskHAlxRJak3yrR5oACerI8QO
         sOP97Qu/BdABWfOPRMwtEofpFUkYV/kuw5pmh5JPGcZe/ZQhQbjAjIbbi5NV8aLYCVmr
         IGe/1iz0dMUE5AmqStxMoWET4S1SuwowwRiRSBTQ0TKMQ/r20Q5dHuVkZ9WR3k0OaK2r
         TfjGqMpNunVJXd+Hi3ipSzUdo08wD+6qjsjjUlBqwW+NL6lAQUPV2WTom7Q3BJ8bVdfF
         wMaOPBmiUB7xrh0cVBbXlRuCckH1oo5gCq4YkEPZR9p5TPyDS6rtLxVsx9ytEPJWDUIL
         zYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tWh5VnD7cFHZl8C6HW0Fm8ub9f2GQzag/b5XhoSI/fU=;
        b=if8QuVJpmU8ljk+Tn+b8YhI1AxtpdQGtSqqw24j5ZfWTy1YcTaXjOZca19WHVpy13i
         XNiLJV3znW91Y08dQXrpYT7/BmzWasUnlXm9S8BuJ+FGlqZZRQUvQ1/PO7Gn6BDhrX+g
         T+QetrEAe9Ar4/Q9Shtl2MHNcnrZgTdxdpUc4EmIq72Fh7WjaXxm/bVP63Wx8kCkuuvY
         zCuGwYeEU0XIMtjJMVeM0vCz50Qq3HMQ2zYkbZCpUcEwXbqB77t2wy8ftvLqrNsimcm5
         cw6wPGCDiLCiokFAn/fXWETZ9DONrQ4XmWr0Fd30ivhDk6ty5Qq/SIL4gmaxGT8wg2CX
         Vfyg==
X-Gm-Message-State: AOAM532fWYeLcH9Eva3xKI9BuCmL+ZdsW5LTGKvFM+my6hIzSZ9wv4qc
        3+/JODQ9JZgHKmLZ9QOwDg==
X-Google-Smtp-Source: ABdhPJx72nszVqk+UI7jolgi7GYA7GGvBFxILd6po326xUR5QN1cFlYUVmwLbXdRjxkIy45WaDcKRg==
X-Received: by 2002:a17:906:5211:: with SMTP id g17mr4525723ejm.281.1622130321132;
        Thu, 27 May 2021 08:45:21 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:20 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Alex Bee <knaerzche@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/12] media: hantro: reorder variants
Date:   Thu, 27 May 2021 17:44:47 +0200
Message-Id: <20210527154455.358869-5-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reorder variants in hantro driver alphanumeric.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v2:
 - added patch

 drivers/staging/media/hantro/hantro_drv.c | 4 ++--
 drivers/staging/media/hantro/hantro_hw.h  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 2f6b01c7a6a0..2f7035a14804 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -486,9 +486,9 @@ static const struct v4l2_file_operations hantro_fops = {
 
 static const struct of_device_id of_hantro_match[] = {
 #ifdef CONFIG_VIDEO_HANTRO_ROCKCHIP
-	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
-	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
+	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
+	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 3d8b53567f16..bbdbdb90b628 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -160,10 +160,10 @@ enum hantro_enc_fmt {
 	RK3288_VPU_ENC_FMT_UYVY422 = 3,
 };
 
-extern const struct hantro_variant rk3399_vpu_variant;
-extern const struct hantro_variant rk3328_vpu_variant;
-extern const struct hantro_variant rk3288_vpu_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
+extern const struct hantro_variant rk3288_vpu_variant;
+extern const struct hantro_variant rk3328_vpu_variant;
+extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant sama5d4_vdec_variant;
 
 extern const struct hantro_postproc_regs hantro_g1_postproc_regs;
-- 
2.27.0

