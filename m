Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1EF430F8F
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 07:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhJRFHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 01:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhJRFHc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 01:07:32 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D21C06176C;
        Sun, 17 Oct 2021 22:05:16 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id t11so10371569plq.11;
        Sun, 17 Oct 2021 22:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PzGkUsbLWrD/fizVl6QbcWER2UnDlXJ5Kvt3KlRxinw=;
        b=iJkleu9vPyrl+MLBEf1JKcbvSB5unQ9NbyHJ7fzqtoXdt6FOXerNLXhD31ERZAcNDN
         0fejkyn1dAbqJntVNSqWJ+a9FBKjKIcywdXKLKWcUMv/ilPOUVj3/NPXIm2NA0U+iQNd
         N6PUa2NI3iVYNPmlUM4x31yvfSniA0IAMVj9490PmmoU5UmGN1/5YRWrqQcqnx0cp5mU
         GyYQdZDM6ywVao6Xw+3EzfM0zzIKHU8QfXAzCeXeB3tDDSjaa/vfZqgewmBpurh+iHgb
         vVWRoQPDNCq//24Fc9QhCJ+k3jBGL4SEYDu7N2NNhTuGvr3wQETrVJIdKdI+9TIXA99K
         GKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PzGkUsbLWrD/fizVl6QbcWER2UnDlXJ5Kvt3KlRxinw=;
        b=ypgYAyHIrBb2Br4T3vn1ckbOXsgQC55Go4Oc2yFpBfcv2RXz5EnReJsmbrKVU/WOgp
         Uv3YuUYm8VwwMQv7Svbld1D/Ou3JxBS1/Gkn7aCx+PDERinBsQemDUF0pRArM8IkQa9B
         tpxOkjS6h3f3Z/JqwzdIOxRrHqoWYL/94TcKMQmq3wTayt3JrGDjuymJV6qSX757/S0P
         QyCyhXcSQcTADpKWIVAjjekeWzmjOl8meAzACRLAZlHxMwoPZPDFMYNVbt6qB57pxFrA
         21KAdDjTHS1idTmeyJ7c+qDZ80gt4f7U19GYULJudaFCfK2Fn7T+oA+VAh1GZ0kqM6i1
         vUXg==
X-Gm-Message-State: AOAM531JweQez87yr349og3w09aG+oZTZZtTSV4K5v+ptLqUrcoN1Y12
        bt0qfJSlpOpze0dCJGO6nok=
X-Google-Smtp-Source: ABdhPJzFIGL/C3R/Jx+goNAzsN41+4QdhLrtABR4a7qLxtm7YYYOXpSVS7AYDqWe/lbixFNQSl9fwQ==
X-Received: by 2002:a17:902:ce85:b0:13f:9678:ecd2 with SMTP id f5-20020a170902ce8500b0013f9678ecd2mr15598799plg.39.1634533515562;
        Sun, 17 Oct 2021 22:05:15 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 22:05:15 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v5 04/10] ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
Date:   Mon, 18 Oct 2021 13:04:42 +0800
Message-Id: <1634533488-25334-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v5: no change.

 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 30905ce672a0..ba26a3375b0d 100644
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

