Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704A943ACD1
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 09:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbhJZHOT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 03:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbhJZHOP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 03:14:15 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885CDC061767;
        Tue, 26 Oct 2021 00:11:51 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id om14so10210349pjb.5;
        Tue, 26 Oct 2021 00:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v5Jn6J7/l0TaCmJa3oToQu6cLShq8Ci4O48ykDgquPE=;
        b=FnMiD/yEd8r5STTgSNxpiErKAzGkF/Kko+aHtyxKURrP9GTpaI/otiknwLSlWcg8JA
         LauRUtiGqflJco+vkSMWqZ+jIY2i543gFniL0JzBmJzAbf425b1bm0dvANz1aNk032YQ
         +NxzBzKjW4bw81gjqFnYZ49UTRhAcHPylrZ8MVPeWIOSQTjW0FO2QVDWQwcPAgrPnmhP
         61xdfdR+yD07+ofRM93/9fGpbOt13g2ubXNOVeoYCmuezdufEgE/gryZB+21nCg67V/v
         KU60CwlRPCXxxnNMKoUyQFnoey+kXZ1Ox4MUQXGN4ozObwgmJKv9++tjvZQAcpOaM50a
         FKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v5Jn6J7/l0TaCmJa3oToQu6cLShq8Ci4O48ykDgquPE=;
        b=kIUmiWmhSpWdHnTm1rMK52mNjdi7dqc4ic9BcGnBqTbq4weeaF6SQwPy5/FgRDGnPD
         nD5Rvi5ywrX2y1ENxwaijfcXekFGS7TCmkrvB3YobjHmiibc61/ucSZbKuur6gvIf+tl
         bkVQWfR9QD8h2zWFv+X0gRviiiclk3YP0RlX7/X7DoKJcHT03on3r3aO1mXpPnx9UJp7
         asBhPDp5e2F3XPP3hi9MVGf/LcB8rDuWWO0v9aDm90mX5+irwn4T+j/xi4p9qDg7EkD2
         sS7HNrMJZekrdZl1Y6WXmpCwYrYzzxdEOSdO7PZXma0CquPSPkJpSdrMEuqEG3sH9HWq
         xs1g==
X-Gm-Message-State: AOAM531DYPdWxf6D1AtPqFbzPQofoNG6vVVtpROpSt7PsNDhMW7VqSK2
        AQKwq6iYno6fZO4C3zSfMunpTs4lvHrhccwU
X-Google-Smtp-Source: ABdhPJySkA2o4FFhQYEyzwSUb7PH8O6xeB8p+lh9tMMoJ2WfjXksxtulja+sI2x6eUDSlRNcfIJnHw==
X-Received: by 2002:a17:902:a5c2:b0:140:14bb:8efd with SMTP id t2-20020a170902a5c200b0014014bb8efdmr20876966plq.31.1635232311156;
        Tue, 26 Oct 2021 00:11:51 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:11:50 -0700 (PDT)
From:   Dillon Min <dillon.minfei@gmail.com>
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
        devicetree@vger.kernel.org, lkp@intel.com, kbuild-all@lists.01.org,
        llvm@lists.linux.dev
Subject: [PATCH v7 04/10] ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
Date:   Tue, 26 Oct 2021 15:11:16 +0800
Message-Id: <1635232282-3992-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
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

