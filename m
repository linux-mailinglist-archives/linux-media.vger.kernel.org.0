Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2604305EEF
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 16:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235200AbhA0PAX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 10:00:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234936AbhA0O7Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 09:59:25 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19325C0698CE
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 06:50:56 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id by1so3076754ejc.0
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 06:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nFs6/+FJLSG4qiE+8mi/knnWkI+pTLrRTmRKqckIc2s=;
        b=hd1mh8gYK1RwgzW2L15xq02Av7309MM6uTE+v0nO2GviHUWV3irNx8c15stTufEgbi
         CwHYOrrJ7rrUD99eiGGfR8AIAjgb3+IJgHXS2/9d+8lbVfVKByIInv5LDsmhUMNBwFtp
         KytOHGn4iPBGcQFibFl4UWQl00fgY9oAHmRiGqtKL3q3XG9WiuMKqm+NvW3fX3Q/6eyQ
         VZFcZ/APwMEeDZ9QLESALGTHWPx/JWKfOaX4oGscvkJl4EHlG0xt7g2PCKUNtP+QeT6N
         p7TEtq+6xGxWsmY0e8Nx7PaDERhKcAZOEhCjj1A9zzPV7+fMCjd1NKc53ZkzCwKeJ3jc
         aoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nFs6/+FJLSG4qiE+8mi/knnWkI+pTLrRTmRKqckIc2s=;
        b=a2C2fuWSy7ydsPLCDZ9idEWB84t3ks4q73UfNGJwchjmyPuZ1kp7ulrAVzmXWGsO/L
         F5gMsJYpfib03Vlyi1JjP62DpUApJvmyQB47FTwrqCqB/iC5gamynJTN1SojJNYjUb6u
         hVxU7JOztWQ9XNJnf9DNw8YZFZzy7bdoeN6L4/1mgMeSVFgqaZW8/Es8N1nyzH2mDJb3
         LZGhiGbVog2CY7Ypse7/xcKgvgMZwSeOH31zyFKllOH4BCpBsorKlT0ewYqW1PankfUS
         oxxSR2wbPap7oekDcNJ1wxEoP6EkV1dARyH1bOseK/Hu2f1NfqG/wzdO8UzcjSJgc2uF
         4RNA==
X-Gm-Message-State: AOAM533arBYSCRU3jLHoTRNoP8WCbgJbSbbgJspouA+QeKEI5c0FePtn
        waOVh5REQ/OjuGbr6W/4QiECRA==
X-Google-Smtp-Source: ABdhPJyKcbmo0PHWuscXbWUwe4Eth9/79uYklKTUReSnYEgk33Ei/B49Y3uJyhg7bUL6j2x3fk8xAA==
X-Received: by 2002:a17:906:58c8:: with SMTP id e8mr7105703ejs.475.1611759054838;
        Wed, 27 Jan 2021 06:50:54 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:62e7:589a:1625:7acc])
        by smtp.gmail.com with ESMTPSA id ah12sm947799ejc.70.2021.01.27.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:50:53 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v3 19/22] arm64: defconfig: Build Qcom CAMSS as module
Date:   Wed, 27 Jan 2021 15:49:27 +0100
Message-Id: <20210127144930.2158242-20-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127144930.2158242-1-robert.foss@linaro.org>
References: <20210127144930.2158242-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Build camera ISP driver as a module.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 838301650a79..cb224d2af6a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -640,6 +640,7 @@ CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_SDR_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_OV5645=m
-- 
2.27.0

