Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD023C9B65
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240486AbhGOJ1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240399AbhGOJ1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:27:33 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FD1C061760;
        Thu, 15 Jul 2021 02:24:40 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id k20so5443646pgg.7;
        Thu, 15 Jul 2021 02:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mCcTQBeV0g268A2M9TPD/9QxrKalElJIkYLfh3ClvtQ=;
        b=D99wtn8wtJqlxMGxhop5T2Yo3g3c/yFYlIdtnEENUOdBj+MCucLhXkpDFur5az+DH4
         Qr1IbFzcUgyShr/hoOTrAFeRmBWTr2q5+JdZBdzYDip+Iz01z1AnsubHGLd8MLG+m5rW
         jWsj+39Tr94sIAIlQyAkaJp+0BxhzapuXGsvkqN+gJ/qumSzRX6TdsNQz+Xy/dJsYLSd
         NJrRISx3+A3+BGbjZQkJ/S3Lxx+0Cp8KNQOgmuNk70TdvkHPAQC5X9yZ/H5CaTe5iPUe
         wshmHgfvp9op32oU3OABpXoAp0HPL+jzlCxX2TYUDaDQawP2qp/0qD2NodPnF6KsqCqb
         RFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mCcTQBeV0g268A2M9TPD/9QxrKalElJIkYLfh3ClvtQ=;
        b=e84eFbLQ5GZBxqnibPKTBuy9Jxnq/ZShL7IKbEJEs0svJAn2l42Nez8TRmWbcRjub3
         PVI1FR7WrtNLZjGp4nA6prGk9cSJcnwlFw1KX8tlO48IHwHMfWzBELgvHOdkgp8z4mM7
         XK7hT4kqzFPCNSl5nZytjOJX4z73lHC6v1lMBhHKB5qIVE0TDh14WMpF0+dxRdtZHtLg
         +eQLBUuGgzdpEdKeFcvD2hvs9pnfs2aV+eWZyZcm34bCjU3X34AUoiSPucms/APlyJ/b
         7a/r/51DRElziOrfemIPKhe6vjlUldoWsIcYWZh7UUFaUDuPrBk8KG5hvTWCJwEqOYI4
         /Aiw==
X-Gm-Message-State: AOAM533tkdQqAlIx1txKyh2UiRD++SDlTeBxQKBKckX7UqisnsodZVhZ
        0EO9ODVUnFurGfPpTj8a/1E=
X-Google-Smtp-Source: ABdhPJyq2IMUZzj4mXVdAOMYq+8wYB3Ec3J9hZefg1LJkBMlIRND2+2geTj9ctMba06OJhb/muIpRQ==
X-Received: by 2002:a63:1215:: with SMTP id h21mr3546057pgl.173.1626341079670;
        Thu, 15 Jul 2021 02:24:39 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.24.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:24:39 -0700 (PDT)
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
Date:   Thu, 15 Jul 2021 17:24:10 +0800
Message-Id: <1626341068-20253-2-git-send-email-dillon.minfei@gmail.com>
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

