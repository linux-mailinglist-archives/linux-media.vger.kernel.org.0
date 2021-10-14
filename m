Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7EC542D700
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbhJNK1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbhJNK1h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:27:37 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA89C06174E;
        Thu, 14 Oct 2021 03:25:33 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id oa12-20020a17090b1bcc00b0019f715462a8so4415875pjb.3;
        Thu, 14 Oct 2021 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Kx7tv1rBkw8DYQ/KOQZm+xfGgLpEtL5qGF7IydRoTQ4=;
        b=odyox3Hdfso6cThPmxhQsELofUohRkumvKUVwGDONKl6XJBgBq0Nu3DnYJPpHMOn7N
         KLJhX33idpW0L6YHd2Nk3fQ9n7cKKIOMOc/HCZF3UseHjjKk66Te4ximVm9fTIbUkb/z
         Cl2Qfc0O8l2prQQJtWDi9++PgDcIdUqMy1+qk/2n5i3HHoi4uLHAky0zIZ2hUC1Z4gxj
         v6O/vCDE7IgqG9OrV85medv629eM7fJJZeXISqEJ+TldSgkjs8jzdz7pnnNj94m8wn72
         FZjJTQ0oRWqzmp+QQ3wmaaHdk2WXYv7uUtKf6LodCoPCz3rp8NDRDdJ/zAIQQIWsqPXi
         Pt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Kx7tv1rBkw8DYQ/KOQZm+xfGgLpEtL5qGF7IydRoTQ4=;
        b=xk7Y+KT3sBq7Nhut866SWhuo/jRtJNxUly3sMeOQcHbaruVoGGzQ383xLJl8tOX8pi
         bLAfExMIU2jCMH20Bixp71cM+G6hsQjZjbOo89UMdjYeoEj+Ant9F7kf65cLK4b2i3VR
         onu28UXXvvM9JhFYvHk8BRp2KJFSdsGBnd0REKEaz9RSsz9qchwgYILapTbLIRtvFe2S
         tgPryDIP/Z64QXGIkMAq3Rn+dtBE8ChHTsfu3Bg8Vb/nvKH8lgeavmEoxjXgoYH0Owhm
         GuyfECt/8IFuo/Q6BEtC2mG3ZumtlXZzVGwdGxi0yGxVXzH4VPGkvNZP4FJNI3+v/S8x
         0bNA==
X-Gm-Message-State: AOAM530cAXI3Ot2jVFvgWzM3m6AOJE3LEZ46Dqc912Xc5zVsWiOTrsT8
        iYTJpRXIktnN5GPzE3Yi9YE=
X-Google-Smtp-Source: ABdhPJyeUZOfEEYvhIzWnXhQQ5u2kAOZWHJkWR/DmVPxo5ivQ8lXBAiVo/uzr1vHRT51wloiviWd8Q==
X-Received: by 2002:a17:902:e313:b0:13f:1866:aa86 with SMTP id q19-20020a170902e31300b0013f1866aa86mr4112465plc.55.1634207132637;
        Thu, 14 Oct 2021 03:25:32 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id ip10sm2105939pjb.40.2021.10.14.03.25.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 03:25:32 -0700 (PDT)
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
Subject: [PATCH v4 4/8] ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
Date:   Thu, 14 Oct 2021 18:25:02 +0800
Message-Id: <1634207106-7632-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v4: no change.

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

