Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B77143ACC0
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 09:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbhJZHOC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 03:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbhJZHN6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 03:13:58 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DDF0C061243;
        Tue, 26 Oct 2021 00:11:35 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id z11so1740911plg.8;
        Tue, 26 Oct 2021 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d7vVyS9haFy4U5/m3XJ2lTxXqjjSqdtOiBYvow20ymM=;
        b=F1lkbzanIYEeyg198jRuVYlN6ThMJHFUk5EmlSopk2yVveb4aeMDnj2vO9ZZa78bXn
         kYVnUBPrHxLVPDkolc1fgILbJa5Ocd+vhhR0JLULCqnY8JVzw2w0rRx+KuwbzCxp0GQt
         3HZjtAZq8b++k3wk7BnBDb4/+1Q6nM1JJ7v2c+mQ1tbGdJxdoR3SV5VXSSiwsqyUs2Rp
         dHWIrxIpeN8rC2K/R9NJ56rGVL82VHD4WEMubsGIyal+tEAIqOCw3dev5OrN7DOOw3at
         7iPFd00yiyS4Wn0Tg/jBC2dO51+48pz04/hOvpDR2v05X85OymtLayXviaKqG8vZtCYj
         SMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d7vVyS9haFy4U5/m3XJ2lTxXqjjSqdtOiBYvow20ymM=;
        b=wuZemasz1cKivpw4AYPGrSY3ZWr0HzqdqqRgWFV7BvguKGXaFD1uasmIFGWx5/AHd6
         eXJDvLUrDO7CIi3qy+DDzJ1LbDD1b6XqO+oBuHvWsYUmLzwyJ1rOFmQrp+uNmVhuL/Tw
         VoZwffx70+Rkdd7wUzjs5auCq0vc/DKwFNTVUXXkYcGkhuX3abp+PEE2pApIjlQdKFOr
         pjSyssznniYcph0BevJ/Zqc5wRLqJrMZlwSak/8b+ei+B/FQODWKozc1I77A0vYBNMtN
         oPRLXoLEDKMrvQjJ5/ByTAYIh3RuX8uOYJhC5AlPHxSYu1xmsEte7IRmXWNhecFyF51i
         0rtA==
X-Gm-Message-State: AOAM532rQNxmKxywZ7v7+R9x51ZSbRXD94W0lfppaKGlcCl67Jfa2ayq
        urDBtUvdFWN+uudiEDkR+cA=
X-Google-Smtp-Source: ABdhPJx2umfrgoaYiA5DKlzeNXcdI9wmyCHXDMiz2LZ5vi0M6iFBpsIoC4Gsd+uJkw1S6GwuLzSa+A==
X-Received: by 2002:a17:90b:4a07:: with SMTP id kk7mr26475946pjb.37.1635232294959;
        Tue, 26 Oct 2021 00:11:34 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:11:34 -0700 (PDT)
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
Subject: [PATCH v7 01/10] media: admin-guide: add stm32-dma2d description
Date:   Tue, 26 Oct 2021 15:11:13 +0800
Message-Id: <1635232282-3992-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

add stm32-dma2d description for dma2d driver

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
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

