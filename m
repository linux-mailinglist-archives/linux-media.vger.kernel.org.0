Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51EC3C9B76
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240831AbhGOJ1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240755AbhGOJ1u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:27:50 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0BEC06175F;
        Thu, 15 Jul 2021 02:24:57 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y4so4609855pfi.9;
        Thu, 15 Jul 2021 02:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hAPQ7MKC9CHG6U3K/a3TvqmDvmez6ZMEcoHbCxgEOYg=;
        b=RU5JO/5JT50O87i5qjL6PPpeR4S8f7aBaV40CK2Ig650nzh1ioiShfkh2YZIlIrNIw
         mlLfHlPTRn7pWYh+Puw8EXHuSlrZvEA+qcKtqi5uRzwTjT4oz8R4sALdLuZdumS7ivMz
         YNhm7uXfS0LQvUCaIAPwUgBUiINJjCMMTWQQBAapyGS0iyqT9QSWDAWyL4sBaw3HmCiV
         +poiNPPghEP9jRl1FjDnew/lAQcAKZMa6ce8qeFMBaS9cjlv2x2Eg7X1m8z1dQTcft77
         NrzopgrDfOJNriUHLrlY1CEg+AodoLP7fbWX17QrI0c8XV2FhIx9e1PrnxtkmdpzxJTr
         Ly5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hAPQ7MKC9CHG6U3K/a3TvqmDvmez6ZMEcoHbCxgEOYg=;
        b=h0pwlw1Vq1sEW9Ighld9ViOSONhlXVvG5WM+XxhYiDQAcvKlDo8JhDX0X7cu//qHSv
         0JtlFXSkeSiP5afvWPL6utb/IyxG3DlA9+jFX/6dcwZHxfVq9CHXUjUFk9lvRSC07n3A
         eojCN5QNRRRH7sHFO3kMm8PY4PyLnzenjfJnFx8IhUj9pKVTRoac8NMU3BPdDfX8W7vr
         tHpCLyYz5R3Q4AARGhkl3eRXSXM0ay9p3gMvib489zqoHvtCBo/YM7ZnISwKgcGw814P
         tMvo1Zc6q8rdDYEY7kHucS5S20awLTVixEI6gz6+U9dmeAQD21yBvRURofnOpEh414OI
         koKQ==
X-Gm-Message-State: AOAM531vhpBM/bGzuE2NNr7nqm93XxPvS2x6WV6f5SGgB94H27l1p2na
        zl0K1+0W4w0QydQjmvfgcFo=
X-Google-Smtp-Source: ABdhPJy/sqa6q3dA18rowkJ+YNSG9VF4aJd0H2sayqnU6BCWe1UhWNsvZGKkI9NKM5GwuwUNiP7Djg==
X-Received: by 2002:a63:5117:: with SMTP id f23mr3609877pgb.200.1626341097486;
        Thu, 15 Jul 2021 02:24:57 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.24.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:24:57 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v2 5/9] ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
Date:   Thu, 15 Jul 2021 17:24:14 +0800
Message-Id: <1626341068-20253-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: no change

 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 8c982ae79f43..da2f80e73f43 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -132,6 +132,10 @@
 	clock-frequency = <8000000>;
 };
 
+&dma2d {
+	status = "okay";
+};
+
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.7.4

