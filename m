Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DED2D185C33
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 12:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgCOLmE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 07:42:04 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43719 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728388AbgCOLmE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 07:42:04 -0400
Received: by mail-wr1-f66.google.com with SMTP id b2so11437601wrj.10;
        Sun, 15 Mar 2020 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/ZHbzhy9ZS6xkEyqLUuxEAb0cu6PN2SW3D1r8A2qMc=;
        b=CYL22yiZGuQWaFMI80Lnyz6zKBuvCA1vLnrsyprbyfDKPvU68JGT/8lnKlRtOeHRrs
         PCzx2AXXoSNXJjvsoaoTNrb6YpunoMztM627obntcXmK9AqEdIotWSmsi3CEMfkmVK/x
         3TjDkeOl6buV5JOGSjGoE1fzC/a2iODPuqhtGEiwoujw3DrACNpTvJ65FeVCmVGiIElA
         AoVOMauoQDB6brvIcYEbt8HorjnfTEAv+WRZ6tNUGDhceRJuBOrRRCPKURNC1E0Q0q3X
         kRHBU9M3POheEj4IHOCMamxJbXKrDQCJVQ6zjxlInmvei8Uao8vYjGsRarU4RK12ZLiQ
         lMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/ZHbzhy9ZS6xkEyqLUuxEAb0cu6PN2SW3D1r8A2qMc=;
        b=ViRCdrsIz3+D3YInDrMdopRIl6a67ycwEiNJayjc7i3SZ27r+NZWiUnn5P80vhyXrJ
         dkDuI3BsrVfOh41VFJjwRyY4NcD2GXJS8Bzyntmetgg3hv/zJ7bERYLPMqif+QsiglIg
         AZ7lgY+qX3cp96KHt3/dIkFudWyc8XHxCj0IESdWM1eKzQpr2wE8am+QPOUWQ7fy7zk9
         XY/6pf7NSY3Gs6l74hOpLGIUDspz1gb1fhRZjf/BiC1RthYIRM5z6lObzgIpsykGStFc
         BLPT3D3c9yCc7qvRCvbr46bJWQFf/86n4jRSanDOdOnBe6h+kzOmViBMFFqXH62YQTs5
         x1zg==
X-Gm-Message-State: ANhLgQ3Sg/7H+m5I5xyLJo54vizvwnvLRaQ/4noFaYLE3N/4otByRLeU
        O1mEtyNv7X4NgWfGzmdQ0ZE=
X-Google-Smtp-Source: ADFU+vtLUukSDpR6qCxADVGIk6FxacYCaf2ESN9kHLB694036g9VQPYauVxD8imcZJezCiTJswjfaA==
X-Received: by 2002:a5d:410a:: with SMTP id l10mr27637506wrp.380.1584272522014;
        Sun, 15 Mar 2020 04:42:02 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2510:d000:2c12:3438:7cb7:556d])
        by smtp.gmail.com with ESMTPSA id 9sm25268665wmx.32.2020.03.15.04.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 04:42:01 -0700 (PDT)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] media: am437x-vpfe: Make use of to_vpfe() to get a pointer to vpfe_device
Date:   Sun, 15 Mar 2020 11:41:46 +0000
Message-Id: <20200315114146.8404-1-prabhakar.csengg@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch makes use of to_vpfe() to get a pointer to vpfe_device

Signed-off-by: Lad Prabhakar <prabhakar.csengg@gmail.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index e14a2933144b..66079cc41f38 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -325,7 +325,7 @@ static void vpfe_ccdc_restore_defaults(struct vpfe_ccdc *ccdc)
 
 static int vpfe_ccdc_close(struct vpfe_ccdc *ccdc, struct device *dev)
 {
-	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
+	struct vpfe_device *vpfe = to_vpfe(ccdc);
 	u32 dma_cntl, pcr;
 
 	pcr = vpfe_reg_read(ccdc, VPFE_PCR);
@@ -349,7 +349,7 @@ static int vpfe_ccdc_close(struct vpfe_ccdc *ccdc, struct device *dev)
 
 static int vpfe_ccdc_set_params(struct vpfe_ccdc *ccdc, void __user *params)
 {
-	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
+	struct vpfe_device *vpfe = to_vpfe(ccdc);
 	struct vpfe_ccdc_config_params_raw raw_params;
 	int x;
 
@@ -505,7 +505,7 @@ vpfe_ccdc_config_black_compense(struct vpfe_ccdc *ccdc,
  */
 static void vpfe_ccdc_config_raw(struct vpfe_ccdc *ccdc)
 {
-	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
+	struct vpfe_device *vpfe = to_vpfe(ccdc);
 	struct vpfe_ccdc_config_params_raw *config_params =
 				&ccdc->ccdc_cfg.bayer.config_params;
 	struct ccdc_params_raw *params = &ccdc->ccdc_cfg.bayer;
@@ -610,7 +610,7 @@ static inline enum ccdc_buftype vpfe_ccdc_get_buftype(struct vpfe_ccdc *ccdc)
 
 static int vpfe_ccdc_set_pixel_format(struct vpfe_ccdc *ccdc, u32 pixfmt)
 {
-	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
+	struct vpfe_device *vpfe = to_vpfe(ccdc);
 
 	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%s\n",
 		 __func__, ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
@@ -742,7 +742,7 @@ static inline void vpfe_set_sdr_addr(struct vpfe_ccdc *ccdc, unsigned long addr)
 static int vpfe_ccdc_set_hw_if_params(struct vpfe_ccdc *ccdc,
 				      struct vpfe_hw_if_param *params)
 {
-	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
+	struct vpfe_device *vpfe = to_vpfe(ccdc);
 
 	ccdc->ccdc_cfg.if_type = params->if_type;
 
-- 
2.20.1

