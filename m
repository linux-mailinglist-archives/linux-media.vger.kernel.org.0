Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9920B40F884
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244950AbhIQM7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244990AbhIQM7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:59:24 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E80C0613D5
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:58:02 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id f62-20020a1c1f41000000b0030b42643f72so1827538wmf.3
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plrOrvIZM2TLyxiMQcIWBN+4lREuMv3pRG/Sh7a1xC8=;
        b=A1XyPdxcOquLxN0aX50A1ZFpsIYqi3fOAj7lTpkAapmpB6s0I7t5BtLQBntoT5o/gC
         LTk3U5iGqZXV00d7UWu1zJeHwNQUIaZQXm49I9GxJIR/4y18GU6Nvyoikkh2w2l4zgcp
         B3UYoAnqDqm9GVkUY9hqfwcQPouBjXs+iZX47NO/QJ/t4wb1kggMVtkvmAtzd4qzJFRW
         7nWbDttoNJXmYKodYdihre5foSUAr0yPacNcyWtLspR5zCXh9y8npouXY1dRxKM6UQcn
         WZ3a9DrYMmZAVwaW7QgPnDaW9jP4k2Ex3PG5EKtnNHZgrO8bzEd2qcrTOZ99BSIM62Lu
         8eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plrOrvIZM2TLyxiMQcIWBN+4lREuMv3pRG/Sh7a1xC8=;
        b=oW8Y7p4W4GcHQQ/RIsAa3Kk6PVGw/jFuGjyeFH3IJGaPhXSf4FkOOJIsEHVP5SDcMF
         W5DQ2WqGHfMnWGU2YT+4UuKmD+mz7aX9d6z04LOMpGWRRt92ZNiYImCoVd08k6hHy/Jr
         BE5TxMzkwZhU1u9rjLsgCBEOU5/JmdVpi2hTWq2YRo3WuySRT3kBfj1vtxa6pFkef2H9
         VN3NuPRMFZhNGKcJB4XQMBCGjQk/ygCGQkSZ0WUCA+RWWjZMMcctdYck4cfZEe2xIeJg
         5l2pqkUngttSGKmagko+kBDy5ffFlm+w1bXKT+/rz9R3bsEVF5HI6SPPNL2VG4gyfm6R
         tCng==
X-Gm-Message-State: AOAM532czuL7BX2p8cLuCdBtaaR004BPvPOJje2jQAdcAFEl62vxS76G
        2HkVOnwVYvML8MlMIxRXeSl9lA==
X-Google-Smtp-Source: ABdhPJxTbG15Mr23ALcQTVgBRPbbO7jTynJgRBVrKM9JKm3YI/iNB4vjrE9aSV9fhOwwMUSmYbl5Hw==
X-Received: by 2002:a7b:c086:: with SMTP id r6mr10257667wmh.46.1631883480653;
        Fri, 17 Sep 2021 05:58:00 -0700 (PDT)
Received: from localhost.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f3sm6358636wmj.28.2021.09.17.05.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:58:00 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        matthias.bgg@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        sumit.semwal@linaro.org
Cc:     christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, khilman@baylibre.com,
        gpain@baylibre.com, Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 4/4] ARM64: mt8183-pumpkin: Add the APU DRM device
Date:   Fri, 17 Sep 2021 14:59:45 +0200
Message-Id: <20210917125945.620097-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917125945.620097-1-abailon@baylibre.com>
References: <20210917125945.620097-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This add the APU DRM device to pumkpin.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 7fbed2b7bc6f8..c540dbfe30151 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -98,6 +98,12 @@ ntc {
 		pulldown-ohm = <0>;
 		io-channels = <&auxadc 0>;
 	};
+
+	apu_drm@0 {
+		compatible = "mediatek,apu-drm";
+		remoteproc = <&apu0>, <&apu1>;
+		iova = <0 0x60000000 0 0x10000000>;
+	};
 };
 
 &auxadc {
-- 
2.31.1

