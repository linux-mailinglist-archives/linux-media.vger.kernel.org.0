Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F193C9B9F
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238771AbhGOJ2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240977AbhGOJ2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:28:18 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06DBC0613DD;
        Thu, 15 Jul 2021 02:25:24 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t9so5467876pgn.4;
        Thu, 15 Jul 2021 02:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mCcTQBeV0g268A2M9TPD/9QxrKalElJIkYLfh3ClvtQ=;
        b=Hx12agFbmL8htX+dr539NiSOb1OzLWj+QjnX8mUQBWVX6ExO4WMMYR1MKn7hnSjzMM
         rFv17izWcpK1xoNuzf3G0fvNjo1g88292HTPJZenvZP+1xaIbMcyQmL/HblJ4AdRYjCE
         pQel4PvXS016GiSh3kl7uo4n+AkSqDbZ0NSV/W/gGG32Zc+kExFz98iyYTk1rkIK3gNe
         s8qXkWAfTylADMyMIljPZBckRn6bC7+C0vf6zoejQ+PapzxhvmaN8IAfHJ4nap8gMXno
         Ii1ZlqXXG7BYgkoFY6TTZEKsO96BIPyGDbD8tzYAzf4SunPtdh7ClKc6qhGSAokCQreM
         DR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mCcTQBeV0g268A2M9TPD/9QxrKalElJIkYLfh3ClvtQ=;
        b=Hri6rTz9JdjWyIcu+tqJNMDdIlt28UmdigjCk7Q5vm4IOMnLCJrflGwz2OKMFfXCUD
         EZIeYHVDA/7peOLzr20SN38ShQEvtZECVfmZ335j/+LXGG8yVpgr8tyLt7AJ13H6BHFy
         F7J0tj/vkLPpkBlY56XTYitkAibDfKLIDfC8UDPEDeU+koysQgIRzyGN9rfQIaHjF2vH
         2mx+1txRml61k2eb0dirBD9O/xevlu1ASLRyAmjhte81LKzVpXWokLhtOCCofLuqxYDT
         q6UFnDkeiumvxdA7neVlK5ymic65APVpJm8eOposUhy9GPbIeDQFwh5TDqjfHexeriqk
         U1zg==
X-Gm-Message-State: AOAM533x4fYoHHKoIkXjNbqi5+jgmO8MHVdjPfM9hHpxIbJFW85vIajc
        EHDOexuO7zJ2Tt5Otm0K+AA=
X-Google-Smtp-Source: ABdhPJxMJxo14DoKAz5WkwKvBVs4O2DW4zPJOjE/luIJX85eXMwUytMX8KL2Zyku97hm8pr46j1iNA==
X-Received: by 2002:aa7:85da:0:b029:329:aacc:333e with SMTP id z26-20020aa785da0000b0290329aacc333emr3579809pfn.60.1626341124469;
        Thu, 15 Jul 2021 02:25:24 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:25:24 -0700 (PDT)
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
Subject: [PATCH v2 1/9] media: admin-guide: add stm32-dma2d description
Date:   Thu, 15 Jul 2021 17:24:20 +0800
Message-Id: <1626341068-20253-12-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

add stm32-dma2d description for dma2d driver

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: no change

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

