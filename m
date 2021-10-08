Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4275D4267CF
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239816AbhJHKc2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239652AbhJHKc0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:32:26 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060ACC061765;
        Fri,  8 Oct 2021 03:30:25 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id m21so2664419pgu.13;
        Fri, 08 Oct 2021 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=W+wytSR0PH1/4yPeQFTyssJnKJVMVbzdE/AdZsuZR3M=;
        b=KKziDLqrhKOFfLQbFvNcL9pI7NP89A/Rg3PKEisfhdx77MZkiANWMElHnq4xeUDhAO
         60w5IYFSHB3z1WnhUspXC6SLC6k/hmEQ3DBoKDZSh6hU+at8m94cItQqiSLOjniZ3z+X
         3MUL1zdBxEXoe0aD0oSZRyEEAWo91SxFCkA1WPXrjS/tZr2GCgBRalYmvTRd3yFCEBin
         5N7Ur+p8Am3NBP03tfBhBODIgRZfFpWBjUARYOLL2CjRAWqmdWYUdSGwrwWUVOlgiuTO
         NupTrhvQWiz+MipodDoQBeBd/ngNhCVTS27YKOW6ZQPciuCm9mVX5usRerLjJgYZp+Ct
         aj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=W+wytSR0PH1/4yPeQFTyssJnKJVMVbzdE/AdZsuZR3M=;
        b=cNm/TmV5/V0QEEaYaazZzqq1hB7eoX/ZCJisnGKVg7pHzQUdmBDVJ/MSFK3QkJfhcH
         mBmGOW5rWpRlJTHAIXtpe5VCTeMEntOm/uPxNwzyhUoW2rp8YlhucVxTRZZkaOYCULpX
         BLWBDjh6q382fbC35To457c3AJmSWFGFRXcTMxMhWaubC9bVuVfzos0WmMeGhVGht3kD
         31nEY6hhkts5fnc6iWDdWreTGFf8PQMuKmX3l4xAEQHXOaXazejdvCEvDbjft50fxfM2
         LsX1+Jgx0FmdoXad6Y9pzfLBXhyUdK0XBnUV7qy32H5fHWh0vQDkqLnTibTVoTwQV61F
         x6xQ==
X-Gm-Message-State: AOAM530YzjcQTUWxnR8xu9guQ+5cuXZ4gZjByd+p1CwG/FSlyeloen9L
        wQ7UpVOl0py/BIe+U2dYL+w=
X-Google-Smtp-Source: ABdhPJwVQg2QQsEuWmOcgcJ6zhRhQqkDeqWGYlPofw6AkJEjdDvpsDCJ1+xkzFMAlfA+LFOArVDw8Q==
X-Received: by 2002:aa7:9203:0:b0:44c:aa4f:5496 with SMTP id 3-20020aa79203000000b0044caa4f5496mr9535011pfo.60.1633689024589;
        Fri, 08 Oct 2021 03:30:24 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 03:30:24 -0700 (PDT)
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
Subject: [PATCH v3 1/8] media: admin-guide: add stm32-dma2d description
Date:   Fri,  8 Oct 2021 18:30:05 +0800
Message-Id: <1633689012-14492-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

add stm32-dma2d description for dma2d driver

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v3: no change

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

