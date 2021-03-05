Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF85432F2EA
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 19:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCESkU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 13:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhCESjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 13:39:53 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926ACC061763
        for <linux-media@vger.kernel.org>; Fri,  5 Mar 2021 10:39:41 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id e19so5415593ejt.3
        for <linux-media@vger.kernel.org>; Fri, 05 Mar 2021 10:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cnQkxEWf1/jtkQDwhzC/RNRYSHdN3zniN7xfiNIEH/g=;
        b=LMLFVrOEGn51sRs8V4YMad2+cDt8RA5s41ALA7xZSTNor06qKOThJTA6rFiLoRwATp
         XWD7BJajOkvb4kY5oOTptSr7TaVnRX+PAlwFdEHD5g61idaFed63kHbZvQg+SQDhoV1p
         C/Oo3OBDLNvRunWjxGXCcht8xhEEgEnqa2M1825Jy8MKmXr16MB2UMp+huaFlyJ2SLS2
         YdLgXfCFnvkdeslqO3IpOK5LxddG9BLMWmeJpiOhLn/K/gTUp35x1ov3LaBeapdjATe+
         TK3HzPDRHGDT7tdW6er0Y2+U5n66XXhteyyhZR9B68tcak74v3SvC6Npoj5oGzzyXYx0
         XF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cnQkxEWf1/jtkQDwhzC/RNRYSHdN3zniN7xfiNIEH/g=;
        b=fb5fN2Cm+MADuwAnWFJnox6XFwaDT4xtkgZakSG8AP7poXUaBY7B818lgfU4iD4vQu
         qPynLntUy1etEMeu21errO6hqZFO9yEbwXPSPFrHGzDecDosg6NhMtIOiY+Npph0r333
         Lrpp0sgH+021L8VTfViwzIKBGm8NfZCw106w50BgVXfsX0d1O0Aam4vK/RyuxEZCfUWF
         B9CUdlbi5mvA847SSkNBDgE6q0cHjRexuHBpMGJw6juiwf2XXgLxaQvhkSfOKI27Htel
         Ls3n5VTYGdaN3E7WYZMzP72Xgcvo2OpIbJ5dvF10XVYlNnTuVRZYoEEEYv02N7di0lEY
         SNGw==
X-Gm-Message-State: AOAM530bI/3h+GgVqSUlwZRsVQ5Rx6TSi0KI0QrZQqT8ibHfAAMj++bK
        2BbDeQW6Zo+q89f/jjUcdkk=
X-Google-Smtp-Source: ABdhPJzBaLPRZpXtKABYaswg2O212z146iHBthxlDQutr5KFQDi3h3XyDO9t51biut3VAu6DCsFcig==
X-Received: by 2002:a17:907:9e6:: with SMTP id ce6mr3468949ejc.207.1614969580342;
        Fri, 05 Mar 2021 10:39:40 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 10:39:39 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 4/7] media: hantro: imx: remove unused include
Date:   Fri,  5 Mar 2021 18:39:21 +0000
Message-Id: <20210305183924.1754026-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The current imx8 code does not use the jpeg encoder. Remove the
unnecessary include.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index cb1ac02c03d2..f36c1bd681ba 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -9,7 +9,6 @@
 #include <linux/delay.h>
 
 #include "hantro.h"
-#include "hantro_jpeg.h"
 #include "hantro_g1_regs.h"
 
 #define CTRL_SOFT_RESET		0x00
-- 
2.30.1

