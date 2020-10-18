Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD8F291773
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 14:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgJRMwr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 08:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgJRMwn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 08:52:43 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5680EC061755;
        Sun, 18 Oct 2020 05:52:43 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a72so7674878wme.5;
        Sun, 18 Oct 2020 05:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mk53SMtrY/476AfCM072ZnRA4FPzReZ1Jt+P5uLpHj8=;
        b=HXQS4pJd2njf5pE9/t8IyPGmr2N/gR1UZ2jfPkkb71RAHzKnStJmpjp5KMD5jI/Ag5
         pf+MVdhUG5cE0m1BtjOIDfQIQjrBSlaRwOMf1dDG+pbd1VoX7zbmilDnovSgCfrLyZji
         I/bA22jfIrSSnI1uJIWG2X7smrQHYVlvWY9ZE+HfOqNeRlhgHxsnaKpvg/+G9RYaQDzC
         6LNHGIejni0qXpar8IM555iX77y9P2TmVGTiCSigDiZusZTVH1QHqu/0h+7H9BQt9bTy
         xCpG5/uc11AKVlsRc5WDTOiTT6gsHnBzlGY+i55icVjqob43y4Y8ckG47At9Uus7Lr3E
         ZQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mk53SMtrY/476AfCM072ZnRA4FPzReZ1Jt+P5uLpHj8=;
        b=iFODa5BlgbsBHszbtCBwrm5FmkCzQ++GPvYOYcLnO78HTLFqKFEktrGwXpLtJ1V9mL
         /V4LJXVFyv1OMorQ7WuNP/Q6XasMINt2/2daIMZTwrYN+zXPgcxnHQ3SNWa1wp3qdjZ5
         /hwx2IEiNNPTDdL9Lmk/8V/5nj3jz6HJezKbRDqXT4sngYEvK/0AuTwDfVHRVVrWROmb
         C0amFwtaZ/uNVASMfv5Tp4D0C9VXcrMuWgYG8weHhxNw1Eus0CtNaV9KRYZlwaWRFeqO
         3c9cBqtmXT4sy8mHSea40InTSnrp3Aaxqp6bWCIe6agiGOg7u2XruUQuhcZuu5mqmFzs
         cgdA==
X-Gm-Message-State: AOAM533FpbV9KKI4xD+ajBqXbrtZtMXnPz1r2e4w8AJ2g0yvgVqTGYxu
        XUCE5kj78en+NYYbMWqCYz4ujo1o3fxsZBmN
X-Google-Smtp-Source: ABdhPJxaQjmsR9hLED+JfoZTcda+HNin0qPa2fRsbtDoNO+AAAPI15LOcVWos7Mpc+UXv6bqsHrwXw==
X-Received: by 2002:a05:600c:2211:: with SMTP id z17mr13406939wml.92.1603025561914;
        Sun, 18 Oct 2020 05:52:41 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u2sm11940158wme.1.2020.10.18.05.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:52:41 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 1/6] media: camss: csiphy-3ph: Add support for SDM630/660
Date:   Sun, 18 Oct 2020 14:52:32 +0200
Message-Id: <20201018125237.16717-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018125237.16717-1-kholk11@gmail.com>
References: <20201018125237.16717-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The CSIPHY on SDM630/660 needs a slightly longer T_HS_CLK_MISS
configuration on lanes CFG4.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
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

