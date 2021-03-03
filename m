Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4442532C785
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355623AbhCDAcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386157AbhCCRqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 12:46:51 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05905C061765
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 09:43:31 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id v5so38431336lft.13
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 09:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mikpPCKqiawoZCyFMz/JZszyNAgG2MWQqRABlKUmtPE=;
        b=qPag2lIKx7lybT1A8UT7VBqWbqmI/IzPDWnJI60OE5N6mh3ngTzRKXzJO9ugnhQiDg
         5GbvPCRPJwVx2vAItSFv2FKFNu2VyQDmLQaWfLBnu/V19VNOoMNojrDNQA5WfyssEzWC
         bxc/dde1HAtqp8MsUPGbTNb7D99TmItDbVpz5N0J3sSVVsP7/pls9OaQSs/qW/SGFxsk
         4mWyWhXsfqe53vmNFe8PDYRjIVlihqEfUcWsjXFwY4hmgwT7cckKL462+1TqEF61NeQX
         V9rW3218DHYK59+fJ6KPEhWngR9A3GkF043BZuQUf4fov0RggHvHu3K0E8QqDfVm8d+C
         arqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mikpPCKqiawoZCyFMz/JZszyNAgG2MWQqRABlKUmtPE=;
        b=pZokEIAm6m9FSf7aoe6iVPbKrH/oognSiZjqIxADwF8z1pI+9YcuXd/6DDsuZwMWW8
         qGyWdfh6+OUoYfY0j7abD6E8e61fbAwgCn4qbGSa2rK5Y4FlkgwjTi5lUWIo4Ec+R0VB
         xgvM1c0QXyuzEkTdUov1KdZTYZS8YgjuLc0HxkF9Fx0XoSHD3PeYcZeUT8fr5QG+VOjf
         da3y15Y/2Ptc54aCascarAoU7LJtoCAcH1/3HiZkX04sKwUNsa9S1PqCLPGpokiNDBgr
         lc0cy/Bd1Wg9c28W8cIZn5u4c5E7u8KnFNVUsm49zwuGQA7EMa2Pb1kQMcysKFEtR7ES
         VDmA==
X-Gm-Message-State: AOAM5333mVSUqCMSS9Qy+IBMmBshBdUHBCUrJZ0LHiJM8L6HpjXlKrlA
        MNSFW6fr3t8gahSvKgUK89EAYw==
X-Google-Smtp-Source: ABdhPJz24Nt4zTWXCh0P8CSKaTk4yAMhHXahLWxwJBGz1RSR42b/HhFny15eAaawuAsKINhR/37ykw==
X-Received: by 2002:a19:4042:: with SMTP id n63mr16165938lfa.256.1614793409462;
        Wed, 03 Mar 2021 09:43:29 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id s7sm2101441lfi.140.2021.03.03.09.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 09:43:28 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com
Cc:     todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 3/3] media: qcom: camss: Fix overflows in clock rate calculations
Date:   Wed,  3 Mar 2021 20:42:50 +0300
Message-Id: <20210303174250.11405-4-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303174250.11405-1-andrey.konovalov@linaro.org>
References: <20210303174250.11405-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Vladimir Lypak <junak.pub@gmail.com>

Because of u32 type being used to store pixel clock rate, expression used
to calculate pipeline clocks (pixel_clock * bpp) produces wrong value due
to integer overflow. This patch changes data type used to store, pass and
retrieve pixel_clock from u32 to u64 to make this mistake less likely to
be repeated in the future.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
Acked-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
 drivers/media/platform/qcom/camss/camss.c     | 2 +-
 drivers/media/platform/qcom/camss/camss.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fae2b513b2f9..b2c95b46ce66 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1112,7 +1112,7 @@ static inline void vfe_isr_halt_ack(struct vfe_device *vfe)
 static int vfe_set_clock_rates(struct vfe_device *vfe)
 {
 	struct device *dev = vfe->camss->dev;
-	u32 pixel_clock[MSM_VFE_LINE_NUM];
+	u64 pixel_clock[MSM_VFE_LINE_NUM];
 	int i, j;
 	int ret;
 
@@ -1194,7 +1194,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
  */
 static int vfe_check_clock_rates(struct vfe_device *vfe)
 {
-	u32 pixel_clock[MSM_VFE_LINE_NUM];
+	u64 pixel_clock[MSM_VFE_LINE_NUM];
 	int i, j;
 	int ret;
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index eb8fb8c34acd..d82bbc2213a6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -578,7 +578,7 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
  *
  * Return 0 on success or a negative error code otherwise
  */
-int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
+int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
 {
 	struct media_entity *sensor;
 	struct v4l2_subdev *subdev;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 86cdc25189eb..e29466d07ad2 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -110,7 +110,7 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 struct media_entity *camss_find_sensor(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 			unsigned int lanes);
-int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock);
+int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
-- 
2.17.1

