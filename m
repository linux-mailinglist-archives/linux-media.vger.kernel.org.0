Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C10138ADE7
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbhETMTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235199AbhETMSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:18:51 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C184C07A833;
        Thu, 20 May 2021 04:05:56 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 29so506513pgu.11;
        Thu, 20 May 2021 04:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BtleE6GQxgpd0gmHVoGAwwV3tquRsqLNfG32aGKdxb0=;
        b=ZDCEovbxbRTWtG4ojAEurfkc498/c5SZntfFZRfpO78JPAKgmYjMaDKZIYc8LAyEJP
         8m37QGuCkPvisKR9a3ZHMKWsIWTd7HoIhuAD6h2oqxND9ne+/Qr/zYbNkpXKmtpwpsbQ
         oFGatzMVLopHIo2tTjfvTWnZKtIMoId6T0gJUhAbq7Ut5ink0e6+uoCO1FqfQiofZPe9
         bZjCm65B3oMV9esCD1BGBJsxZ0rPSCWp0m//XxoLXjJUBqReF2g2PXN48M6c9lE51c8Z
         2cuUbhwhHVE5oYb1VmAKFLq3k3jlXERCeXwi+qqrkli+tMHzZSBVyhPHC48iCCzzJovD
         Yhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BtleE6GQxgpd0gmHVoGAwwV3tquRsqLNfG32aGKdxb0=;
        b=pRWBw1Kt3/4UuNAW7X+KEzxPDp8ql3cEV8BtiQ6nlhtZkmkZf/nQT3uYe1NEo1a5UP
         Rx2ay5It2LPJskRDPWMqIjH/Fgvbld4qbMrTmZy5EW5KJ/B39rd3Yd5Lio3tLRg7nkHB
         VEYME7MDShWLXQmQh6lvRj5RhC7h2WrDcfWYIrRCistMAePtca3hcHsnwUSuMXW10axd
         Ksh0x31q2mNaQnfbeotu4fPwZYLMGGj9mWMwvrEIepTGGcyto7qmyq/1IG57BiIIuyY+
         TNkzK/ZhfpR9PfyQZJlH3eib4RUnRm5eKFAp/ljdgkWzZR5xs527d4x+zKjIJXwXFxYi
         TBcw==
X-Gm-Message-State: AOAM533yzwoDsDRtjuwFmbiVtfQFreUiT1hZzhKSHfP1KhVaADt6M2wz
        q7yq467betWMNHXJl6tXYfc=
X-Google-Smtp-Source: ABdhPJzJIsYTXW9yeo5ybOMBP3kEaz9TT/qg5sFYXaINUh193mwT1LnN5PWZQtKk3+Q8Oi0vXuZPSw==
X-Received: by 2002:a62:384c:0:b029:2dd:423b:6e49 with SMTP id f73-20020a62384c0000b02902dd423b6e49mr4323847pfa.9.1621508755870;
        Thu, 20 May 2021 04:05:55 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 May 2021 04:05:55 -0700 (PDT)
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
Subject: [PATCH 5/7] ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
Date:   Thu, 20 May 2021 19:05:25 +0800
Message-Id: <1621508727-24486-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 2e1b3bbbe4b5..9cafe456d0d5 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -134,6 +134,10 @@
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

