Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960332963E6
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 19:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369288AbgJVRrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 13:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369281AbgJVRrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 13:47:23 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BEAC0613CE;
        Thu, 22 Oct 2020 10:47:23 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id n6so3543702wrm.13;
        Thu, 22 Oct 2020 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lpJOF/BOpUDwhpTSwmF/7JRrywChTu+z2nyDcUw7Tfk=;
        b=gKeLXQTMv19Fqgdqdaa5GLce9N1RcxFKLMYVoVpplJa/OUsq/Vt/YZ8oPB93sVlp6E
         5/Jda5QKpZT2GrCjN75dGNwNfQ3ke1GFh5JE47zAEYkq55VTI8JOsGnwoWV2O01uSzjX
         oOxOO34PUBiucQuZmE2IV3RKKySSGne0rJeWIjBXiO+ACN522XAukKxDb/9aYN2dLUnS
         /GExnH9euh7cgTcVFo8pyqU6Ek571Wg8eXYqNwOevODPXaxkxfnWP1gQuoFfnMmTasRn
         zfKfDjK0Iyy5vm1twZxID4SLzxBeJKJUpU31XApN6CFQ0gyijeKKjCitMWsU+LzONrtx
         eHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lpJOF/BOpUDwhpTSwmF/7JRrywChTu+z2nyDcUw7Tfk=;
        b=WcuKt+QTDRA3KMPl/ehnSDSHM+L+5JumL8rUSY24FQw0HgB/aoApwywi2iEzNaqyBn
         BflQZPfXLsGLWYr3Ov+g+jW5h+HLqXWGeUccMDFLEHljrLmkA70znhBtbQC7Ozke16ex
         Cx/Z1TD9FvBbWSAfGaFINmMjQanzE1TAhuF3LGKalqzlTY88YhFP47+SoN7PFJFjHRDg
         cadAXEP6JNSuihGnEGiJ4lOzTVeV498uz0MKEka4jKof+B00+/wwan9OOj1wL9ZLFlDi
         xDke1diJfyPvKIM6BNqzRwAYLGBui2V4QWPsXFOkjVlXxH92aXHQixcaQGhA1klwDwRn
         rIIQ==
X-Gm-Message-State: AOAM532RtghksrtnMJe2p3A8v3n3cuYsZOM46CNRQS8BptAWcZys5Y4v
        DrHinRmVJkpgCwFiextrGH4=
X-Google-Smtp-Source: ABdhPJxrDhXXWKowm2XfRzuRu+N5k3eIZxpjYVZWoEQWmMaLeHZ2zSH1IHlA4s6JdgZCaBx2beP8Yg==
X-Received: by 2002:adf:d0cf:: with SMTP id z15mr4187395wrh.213.1603388841695;
        Thu, 22 Oct 2020 10:47:21 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u202sm5368355wmu.23.2020.10.22.10.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 10:47:21 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robert.foss@linaro.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 5/7] media: camss: csiphy-3ph: Add support for SDM630/660
Date:   Thu, 22 Oct 2020 19:47:04 +0200
Message-Id: <20201022174706.8813-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022174706.8813-1-kholk11@gmail.com>
References: <20201022174706.8813-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The CSIPHY on SDM630/660 needs a slightly longer T_HS_CLK_MISS
configuration on lanes CFG4.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 2e65caf1ecae..97cb9de85031 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2016-2018 Linaro Ltd.
  */
 
+#include "camss.h"
 #include "camss-csiphy.h"
 
 #include <linux/delay.h>
@@ -21,6 +22,7 @@
 #define CSIPHY_3PH_LNn_CFG3(n)			(0x008 + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG4(n)			(0x00c + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS	0xa4
+#define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS_660	0xa5
 #define CSIPHY_3PH_LNn_CFG5(n)			(0x010 + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG5_T_HS_DTERM		0x02
 #define CSIPHY_3PH_LNn_CFG5_HS_REC_EQ_FQ_INT	0x50
@@ -198,7 +200,10 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	val = CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG;
 	writel_relaxed(val, csiphy->base + CSIPHY_3PH_LNn_CFG1(l));
 
-	val = CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS;
+	if (csiphy->camss->version == CAMSS_660)
+		val = CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS_660;
+	else
+		val = CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS;
 	writel_relaxed(val, csiphy->base + CSIPHY_3PH_LNn_CFG4(l));
 
 	val = CSIPHY_3PH_LNn_MISC1_IS_CLKLANE;
-- 
2.28.0

