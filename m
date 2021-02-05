Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD4B310998
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 11:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhBEKzU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 05:55:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbhBEKxG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 05:53:06 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46239C0698DD
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 02:45:25 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id a1so7144586wrq.6
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 02:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fUGwtlmgXSNtLs4jeYoyMy0OUjwWufxEelxvIP0w1pA=;
        b=Fwx1ouohDc1t1SRm9bp+trJ4XgAH3o7xsafjqV8b3Z8BSs756P7sNCFXezdm+oIYEI
         1LzOAiYEi+yiOCxpqno4ZeEsNAqi+Nh/dwKU78S6R1oCjsivIrNO8HgfsoT9pJ1OjJ7e
         JKEqgDe4l5a1f7yfz3WXlAd8CDZa0LzSO523xHV68YrOnqQSmp2OD94YDz6AusIsE0ce
         EAAdKhmGiJ+HbqbjZl7IuyRb6CHTVG2iu6e/4uEBiY/PtLkgw4ODHU25u96w7GhlYM1i
         ixzulomlgu5/0ZZkIVlEpymV1wlpo84KNks75nbunUNfvMxrEU4xO+otpS/e2ndtUn7D
         Dzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fUGwtlmgXSNtLs4jeYoyMy0OUjwWufxEelxvIP0w1pA=;
        b=glJaxc/ch3/JGlZ1PtuC3uYawaFcqHuF4plOAZxtNFu3pylUChHa8324CZr6xm8hzL
         Y2cGyO3tRlu9yWuFyvRS7fUQ7Rag6R8sx/2Gg4Qd9fXcmK1Acjr2sdxaXmLZKA50UD/g
         57BKHOh2zyoIMb7kfrqEIHbU+l5BO+o/9wvKpMjz7ikK1SFQsFg874+My10/YgBHBV0m
         4/z+vBwxPHaOrK9zTG/N6gsLjfnFSA5UNeFSQWsTnrvszG0OGPtpbLgYbsAAUbuNpVbg
         md1xFqwEhXxrmZMUKaQD1p7oHN6aeA+p9VMuuyUuGFsVuTkpQyEEwNWnQAu4cbhxRKcz
         QZdQ==
X-Gm-Message-State: AOAM533x9INVo+azyNh3uenWfOxglAz1mau+pgcvmy2IJWoXjAkWWg2l
        pw7FrZT536Ep0pY6KzdI/qXTdA==
X-Google-Smtp-Source: ABdhPJwTcctxZeQ/VmfTFSbXLstzOjpQA92T6jyVM+woDgkju33ipwaN46VApTeLxaZTphfjXZb1Tw==
X-Received: by 2002:a5d:6305:: with SMTP id i5mr4270526wru.314.1612521924035;
        Fri, 05 Feb 2021 02:45:24 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:38fd:e0db:ea01:afc8])
        by smtp.gmail.com with ESMTPSA id u4sm11300233wrr.37.2021.02.05.02.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:45:23 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v4 18/22] MAINTAINERS: Change CAMSS documentation to use dtschema bindings
Date:   Fri,  5 Feb 2021 11:44:10 +0100
Message-Id: <20210205104414.299732-19-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210205104414.299732-1-robert.foss@linaro.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Due to the complexity of describing multiple hardware generations
in one document, switch to using separate dt-bindings.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cdf1556c6007..7c5a494d9113 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14686,7 +14686,7 @@ M:	Todor Tomov <todor.too@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-F:	Documentation/devicetree/bindings/media/qcom,camss.txt
+F:	Documentation/devicetree/bindings/media/*camss*
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
-- 
2.27.0

