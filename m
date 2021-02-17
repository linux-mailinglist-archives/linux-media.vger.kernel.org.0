Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A87B31D82B
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 12:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhBQLYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 06:24:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbhBQLX0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 06:23:26 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FADC061794
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:00 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id do6so11019388ejc.3
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oxEhFanRiIwaURE1Asj018eMvsFp7g2C+jPywv6JQCM=;
        b=qCnnaF2OLkh0pa1oFwRs9lNbWKszkZlb/pZFSqn57LaXPWCs1/+i9jiBoLv8om4ALg
         UBpJuep9RiRwlzULpDC5wQuwcsQXKWXr7t89CYyWV9PNdCSUwqS36/hKvO5DTa4p8Ff7
         1jP/u8279PvD2fT8tVAZLe9etWpA+iJ2l7WCDQ14grRzrHCUX/AAQGHTnPyNeOwtRlPy
         /C8g6B2Tqc4FKj5maDlqLAXEpfErHC64x+GsSN3HJ9S1fjDYfQw6k/bHupqN4JBfeutl
         +5zbTh2vquc2Y5INni8djti63ivnIpodUfj7fj422g3q+GDBBimi7GoCF10O+XjS1XVC
         wSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oxEhFanRiIwaURE1Asj018eMvsFp7g2C+jPywv6JQCM=;
        b=d9hUoN6mSx35aaZzHhz4p3uJbniuYLSVQv9FBlhRF/qLqyFfi5Jjf3+0fZpoaj46Cy
         JSlN23kt13OzttBtDecRVdSJgLQNG+hPz2cYOd5pwjiawT67dZIdPNKoGO6ek3ImNNtw
         owxi3nAp7H/zzqsfBnZizvil20I6rlALmYcd/I88FAaiQyDYQbwWUKSnwD141T1bxeEO
         DmJEbEFg3uU+W8Riz83HXvR6CrVE8xX/lmsQAhKMl0CPCQuCb367Epk93ZGuG+5cPwf6
         BA3JA2w0ZHZv7U7HtpL/N4ZCibbvUTKjzFDHS5MgtAjIQ8Z5We0oa9OHiGNUMICQck6L
         NsXw==
X-Gm-Message-State: AOAM533oTFfJGFxq9ja+pYkqVTXGSBIIQZH6GTNQUKsbLWHs8s9wtAU5
        37Er3Y6vyHK9xvsGFXPUO6hVGQ==
X-Google-Smtp-Source: ABdhPJwzW155uV1Lp/nync0xOTDYo+Lh9zvYNam1FD9gxnoxVEHlm82NLq1x7ctrELhgndK7Ip6bXQ==
X-Received: by 2002:a17:906:380b:: with SMTP id v11mr13514242ejc.183.1613560919007;
        Wed, 17 Feb 2021 03:21:59 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:21:58 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v5 02/22] media: camss: Fix vfe_isr comment typo
Date:   Wed, 17 Feb 2021 12:21:02 +0100
Message-Id: <20210217112122.424236-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210217112122.424236-1-robert.foss@linaro.org>
References: <20210217112122.424236-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Comment refers to ISPIF, but this is incorrect. Only
the VFE interrupts are handled by this function.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1
 - Bjorn: Add r-b


 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 174a36be6f5d..a1b56b89130d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -922,7 +922,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index b5704a2f119b..84c33b8f9fe3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1055,7 +1055,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
-- 
2.27.0

