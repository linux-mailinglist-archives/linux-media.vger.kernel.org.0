Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B80B14267DE
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239930AbhJHKch (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239911AbhJHKce (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:32:34 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED292C061755;
        Fri,  8 Oct 2021 03:30:39 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id oa12-20020a17090b1bcc00b0019f715462a8so7446289pjb.3;
        Fri, 08 Oct 2021 03:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Je7GFIaoe/1MpS2xrn6D1lOO7y+dAVRD95NUMf/V3zs=;
        b=W3psoaO7j99aZioi+//I535eoTtWeVxgqX9OOWNU1jRH8p2nhP9PXXVumd1RUKvROf
         WwFPu7/L7lg5ACpMA/zRM/gWThPt1EpLUf+0sCzYAdXmWBZX7jt+uuIeoNU96sNce1/0
         dpDYb3KnBYvIH8q3j0FwWUTzIGx9V6XjK2/hAOSWlOr8pio5elJcjC/b/D0twaTjjfML
         UnbRd9i4vwkMFxPmofbKOd+JbwOVfwaUy/397DGHdQXANjblt6rzqii9C8YvBZ8QEReW
         jfOUlbRzzz9W8jqftJyMfFSGJaWC6m6ofEAWxZCHYgq82YFBL1Kdb987IuoO89Bbj6er
         JULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Je7GFIaoe/1MpS2xrn6D1lOO7y+dAVRD95NUMf/V3zs=;
        b=NYNZYa0cW4tY1O0ocfjngwFijfIV1QvVUkQw8Q3QQXdBaG4UD4DOk5tROtbQt3LB4e
         c2/m+hpBYuZJ6/4d4xrJV19q0bTtwh09uwLqNlkT8tKuVoDnwLLDOR+rQRj1IKOPw7wL
         V7R3ATqzEkQEoehl0jDtsHDfwylgR4LcaAYisclFKM+6jr2cgoIuEoVTk8D+zuhANY+I
         KWjVVg/qyA+wery6POBA1ehzOePErl2JjNmXlF+gqh30yIgqQ+MP2JA3FzRDAVMuDd2/
         kf1IQeZwuAraGNbyseiQpbkQi9f/mmZ8mJvLBZhrx1wt66gLddjDvbdooq6Zw5AleWof
         9v3w==
X-Gm-Message-State: AOAM530u7KIHoNs6gUylFXOVPMOv/kvl89c97VgrkXsZjaBisfQ3pajV
        nWlfNCMtOkvUYj50aPIsBro=
X-Google-Smtp-Source: ABdhPJwoOKyB0Fx9ftLPP0D1VaXGs1oDZ7DxpKJbY5v3qnWYR5NxGJgzD1dDHTRblqUr2TRVqrwnZg==
X-Received: by 2002:a17:902:c193:b0:13e:8e77:6c82 with SMTP id d19-20020a170902c19300b0013e8e776c82mr8767786pld.29.1633689039547;
        Fri, 08 Oct 2021 03:30:39 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 03:30:39 -0700 (PDT)
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
Subject: [PATCH v3 4/8] ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
Date:   Fri,  8 Oct 2021 18:30:08 +0800
Message-Id: <1633689012-14492-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v3: no change

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

