Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA10843314A
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 10:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234755AbhJSIpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 04:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234730AbhJSIpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 04:45:47 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACA9C061765;
        Tue, 19 Oct 2021 01:43:35 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id f5so18677615pgc.12;
        Tue, 19 Oct 2021 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h7PwAA40r7NAb/5FPeOofbMWfGdgtuL0HMPeau8hiKs=;
        b=f9BYB/zy0ezsm9GvxRsGFCm3tzHvyxphbpqvMbikWQZuxNqBYcAyHo1QbaFfgWXmoH
         Cpo6CxcVglX4DeZpRJGlniTbsu346xZVt+aI5GbxezOsBeuMLuvEyn1AJF8HgvI3REgc
         tmUVcHDWbD0rBV4cJN4s977jRVesLXrsbjNzTwW4qOIZUQLQmJenSOe/BgLk2Rc2maB8
         4NP5LY/4C/24wm+zuevlf/VaI51oyF1WGM78ZVKr6Rgtj1swmW4WEMfYcLYkfxXRyO9H
         du5SUiPRseqhEdEbxEuX+PE3ZciqjELGWavs1PhIzF5QkXTXbGGJD8pMkkyzkN9icGhn
         WW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h7PwAA40r7NAb/5FPeOofbMWfGdgtuL0HMPeau8hiKs=;
        b=KIUbZ+hkxNNsBtaWPLYCnAIZ500iRIc7+rN92l98msRBcWrZ4sPFvwNEt4wGWA5TN3
         NwYsJI68hHI4Wc8Pj10ZqwGjA5telsAMalWSQ6kziLkPm4YZfqlzIsGSziaX6LkH3A9D
         Tv5b86eaYDK3V7+cGdZCbJ5dgwbveSUvRL7ToMcPO586qTQ4BltJ2PCwUnOxt6xxG4Hb
         yIeovmzam1MCOH+zyJXAmD8jKFbtMGv1Dk3M1p52utafdT/qKOFt4z/BDVeArIJiGYt0
         4h4+EqKqGJhWyY0MPrAbeSSgPDrtvo1BtMfVvg+9l66HMJpGXTT3n0g8y80Mm4RUCB6w
         Pe9Q==
X-Gm-Message-State: AOAM533jIIuV31RH0pGLWCuTLyl61MF6RZ2zG11a/ZSFPNUEOXQ4Qa7r
        TV7vzRrOb2W/3MIsQceiDMc=
X-Google-Smtp-Source: ABdhPJzKB3aEIRNO6YSO8LmXbk5VwNRtkkuZG53AggCZmIQ0r3UksdSPW1ndqT3alCgCZkgJ5PADMQ==
X-Received: by 2002:a05:6a00:1309:b0:44d:4d1e:c930 with SMTP id j9-20020a056a00130900b0044d4d1ec930mr34064397pfu.65.1634633014561;
        Tue, 19 Oct 2021 01:43:34 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.43.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:43:34 -0700 (PDT)
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
        devicetree@vger.kernel.org
Subject: [PATCH v6 01/10] media: admin-guide: add stm32-dma2d description
Date:   Tue, 19 Oct 2021 16:43:14 +0800
Message-Id: <1634633003-18132-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

add stm32-dma2d description for dma2d driver

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: no change.

 Documentation/admin-guide/media/platform-cardlist.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/media/platform-cardlist.rst b/Documentation/admin-guide/media/platform-cardlist.rst
index 261e7772eb3e..ac73c4166d1e 100644
--- a/Documentation/admin-guide/media/platform-cardlist.rst
+++ b/Documentation/admin-guide/media/platform-cardlist.rst
@@ -60,6 +60,7 @@ s5p-mfc            Samsung S5P MFC Video Codec
 sh_veu             SuperH VEU mem2mem video processing
 sh_vou             SuperH VOU video output
 stm32-dcmi         STM32 Digital Camera Memory Interface (DCMI)
+stm32-dma2d        STM32 Chrom-Art Accelerator Unit
 sun4i-csi          Allwinner A10 CMOS Sensor Interface Support
 sun6i-csi          Allwinner V3s Camera Sensor Interface
 sun8i-di           Allwinner Deinterlace
-- 
2.7.4

