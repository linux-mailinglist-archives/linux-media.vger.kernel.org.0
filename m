Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0AB63A716E
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 23:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbhFNVgW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 17:36:22 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:45711 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhFNVgV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 17:36:21 -0400
Received: by mail-wr1-f46.google.com with SMTP id z8so15998748wrp.12;
        Mon, 14 Jun 2021 14:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pl1qnOWWubTC26cB06B87T2plCazXd0mlQJnYZkPgAc=;
        b=mZQlY5Olju1HaCYf7aG1fVd7kg9HDxwc2X9TrRhOxrgu9HBHfnnvSPPcVQ0KTje1js
         hGI9V6Q+GiY3ob062t8nTE3TlN4rIgH+cAUDce+HZCNP4d+yeEie5PFM/oUEehHvOWkf
         55zzhd2z1LBM0lU1+t8fF0hu6vIZQBZmk0FO3xLsv3XIAsIY0TzCRc+t58FEMmYl7bAY
         Du0NoyfUETlMwv6FxqdHKuO3RptIM4TWbbxuXzCGJ4aA+knwCUwroP1xuqyw7dTSalC+
         G/s7HZli5sEjIHykvb69SFRsQg82zGTk3NXgxa7j9X2APZm0XsuY/GZfinPwIiCwaei5
         4Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pl1qnOWWubTC26cB06B87T2plCazXd0mlQJnYZkPgAc=;
        b=jPM509de9iU1rE+QoCw7p+ZD+S/ijBxLi7koN8LLB742eSbXhsadMQTKrrvhRXHW41
         fQDW8A0v46mIUqI8J/uAv7M9Pq/DWCSDQRxbvo3BKAb2vnrXozMxmbVlv57t4vZgyOFh
         vQB4RTHimCVufVOJpQUay0kNNH660o9ZUj8YwFPx+So8o3sV6cDmAC1pGXdVjP+YuCBx
         r2FNL09K2yibP7ZZfnCJXjSfd/jgQGnyBhHL86yiDi/xNjpu55U0K/pXOfTOTDi0find
         jy9Gdm+rGZ2KjxxSLaI9RgbIxUfVFMCk+E0Y19YBuVfmGEy+Yezg0+lvavBlaeHybW4E
         g/Pg==
X-Gm-Message-State: AOAM533Busz5EnuodCIfk6WQAyo2fhmTYho/KF0tRcOIuNYMxFK71QM0
        mIMngXDuQJSVaAZz8u6EEg==
X-Google-Smtp-Source: ABdhPJwvrf/NrlKOGNaR1KB3YfTEDnQY2S/6zmyOXagOaz/D6YTHrokf2DjqhxjqIBgxnVUOxfFhWw==
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr21659152wrw.310.1623706397004;
        Mon, 14 Jun 2021 14:33:17 -0700 (PDT)
Received: from localhost.localdomain ([91.67.75.139])
        by smtp.googlemail.com with ESMTPSA id g23sm989525wmk.3.2021.06.14.14.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 14:33:16 -0700 (PDT)
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
Subject: [PATCH v3 3/6] media: hantro: reorder variants
Date:   Mon, 14 Jun 2021 23:32:12 +0200
Message-Id: <20210614213215.99389-4-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614213215.99389-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210614213215.99389-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reorder variants in hantro driver alphanumeric.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
---

 Changes in v3:
 - collect Reviewed-Tag

 Changes in v2:
 - added patch

 drivers/staging/media/hantro/hantro_drv.c | 4 ++--
 drivers/staging/media/hantro/hantro_hw.h  | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index dbc69ee0b562..34e778e1cea1 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -582,9 +582,9 @@ static const struct v4l2_file_operations hantro_fops = {
 
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
index 5737a7707944..7fa67d0c7e0f 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -203,12 +203,12 @@ enum hantro_enc_fmt {
 	RK3288_VPU_ENC_FMT_UYVY422 = 3,
 };
 
-extern const struct hantro_variant rk3399_vpu_variant;
-extern const struct hantro_variant rk3328_vpu_variant;
-extern const struct hantro_variant rk3288_vpu_variant;
+extern const struct hantro_variant imx8mq_vpu_g2_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
+extern const struct hantro_variant rk3288_vpu_variant;
+extern const struct hantro_variant rk3328_vpu_variant;
+extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant sama5d4_vdec_variant;
-extern const struct hantro_variant imx8mq_vpu_g2_variant;
 
 extern const struct hantro_postproc_regs hantro_g1_postproc_regs;
 
-- 
2.27.0

