Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809022F1208
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 13:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729832AbhAKMBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 07:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729807AbhAKMBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 07:01:00 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3A1C061794
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 04:00:19 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id n26so24323859eju.6
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 04:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OW8w9+OK+kpGhqgXSAht9uVN2nF9YMGSL1tUgT2Bs9Q=;
        b=EsRDrUhPpM9Is+P0DCnamaarnKSYq4o/vGbyGa2dwsoNGwSuZQv+XKTDZG4dMbpNB4
         037pSOoUXYDTFHieNWTc5SA+PnkRZSgzQNjC86cOdGvWWFQVQBPKNd9rn76m8UjnVM5k
         45nJNTd2h52DJShEnava1+XA+8GCGkdhI2NfjtAx+F8xxEMJR7r4ieiIU1hY6dowbo+m
         FjE2stb5DY8wAUTk5o2GIxTE5/6z6k6I42efmjz3QD0DWS36+1w/Ut4ejRlRM2KDNCU1
         SGP5oQSeJmT94MqKq9sGjaGGJZIKTYaGO6ESRhVUenOvRdqpXhebaCFktULZpX4W0FXV
         R3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OW8w9+OK+kpGhqgXSAht9uVN2nF9YMGSL1tUgT2Bs9Q=;
        b=TjQI8TaZqZlsFemXVQwLEU4QU9uIfnRTAVMTOEHyhQYou4YVuzj8eU0iXTpu1XkeRv
         jZDfH+c6mnV2qOoXG90kSuP7DykhVbGMdSkEkt1h/FbW+PTD68Dypr5MunbVxmg+Jhd4
         W+Q4js6CawNIl8fG3HIbC0lMwKYvrr7OCuAd1NWRLW0HTvHcMVJsWKGiXGI6eFQ5sVLI
         VpmKyMC7O3nNAk+hGNwKOzKiZAbiRo1tddL3UtDJR8zasSZcxgjXotEAgdsuXLHTfXHm
         f66IfnCJvhpdO/v2qY0brgYO9L+t4YF33JGKi9e0+8EH19VP1HXZ7IEmocbXEQzvNpcC
         6bTQ==
X-Gm-Message-State: AOAM531oXNKdb0yR00zS75tSZGxtOAzXugfyI9/9QoQ9t/QCPe7VC9Xi
        fP92sbmXq9DjzSPcMAp1LUgQNA==
X-Google-Smtp-Source: ABdhPJw8sahUMcOxodYfKP6KQePGGZK0sOT4LELPBVUvL0IWKI6ubgbWuu7t0cSieKXrj3kUtPrfXw==
X-Received: by 2002:a17:906:3883:: with SMTP id q3mr10475752ejd.160.1610366417997;
        Mon, 11 Jan 2021 04:00:17 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:fe7e:1742:34f2:8721])
        by smtp.gmail.com with ESMTPSA id t15sm7680427eds.38.2021.01.11.04.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 04:00:17 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     dongchun.zhu@mediatek.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dongchun Zhu <Dongchun.Zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@google.com>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2] media: ov8856: Configure sensor for GRBG Bayer for all modes
Date:   Mon, 11 Jan 2021 12:59:30 +0100
Message-Id: <20210111115930.117393-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The previously added modes 3264x2448 & 1632x1224 are actually
configuring the sensor for BGGR mode, this is an issue since
the mode that is exposed through V4L incorrectly is set as GRBG.

This patch fixes the issue by configuring the sensor to always
output GRBG Bayer formatted frames.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Suggested-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v1:
 - Sakari: Added mode information to ov8856_mode struct
 - Sakari: enum_mbus_code updated

Changes since v2:
 - Andrey: Switched approach to changing the sensor configuration
   to yield identical Bayer modes for all modes


 drivers/media/i2c/ov8856.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 2f4ceaa80593..8a355135c7db 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -428,7 +428,7 @@ static const struct ov8856_reg mode_3264x2448_regs[] = {
 	{0x3810, 0x00},
 	{0x3811, 0x04},
 	{0x3812, 0x00},
-	{0x3813, 0x02},
+	{0x3813, 0x01},
 	{0x3814, 0x01},
 	{0x3815, 0x01},
 	{0x3816, 0x00},
@@ -821,7 +821,7 @@ static const struct ov8856_reg mode_1632x1224_regs[] = {
 	{0x3810, 0x00},
 	{0x3811, 0x02},
 	{0x3812, 0x00},
-	{0x3813, 0x02},
+	{0x3813, 0x01},
 	{0x3814, 0x03},
 	{0x3815, 0x01},
 	{0x3816, 0x00},
-- 
2.27.0

