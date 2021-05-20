Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9065538ADD1
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235572AbhETMSz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235553AbhETMSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:18:43 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F67AC07A822;
        Thu, 20 May 2021 04:05:38 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id e17so1482779pfl.5;
        Thu, 20 May 2021 04:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0oFfIWOdrNxxHDeBLAkvWpJ2lIKRgTWmgVtZro160nA=;
        b=NgzNWH/sWTyfspG523F3M89WfHPNXWnk/w5kyeLxo7FcaM+DuOjyCZbUk3FbfITIkI
         eXM5D7qbkqyA5IULgS2k4qu1LImkHPUUKnX8KyMyXc4UWFtgi3/UrsSqKPI1YKXBeafC
         yumG1AhjmP13RjNkrXNiNx8mJC3TCJb4Y3Z1jwLNWCRUPOxviTuGyLDSMw1EHGyjLfSI
         fQ6UFlKhtMtlh0+RtMANy6gCOVNBsO9O1OAWNYdc8A+S8hRSAnpkBEPFZDF2SJZUdnL+
         HZs/K5ZVpzR86VO3Inhw/89ynPrZIaV22i19X8Qen6DI491cd9rJJFVWgkQzK+YiNAdt
         X0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0oFfIWOdrNxxHDeBLAkvWpJ2lIKRgTWmgVtZro160nA=;
        b=me20e6Ln27AmW20z3cd09oS/bA+/1PHU56ng3e9mKfNijh9kuFCU9fMnk8Wqkip1jQ
         qr2rAFqkQ3IVQ8YrmhDi/OdzaMGdSaS1TqaPe8LqbzdzskSxenqGDEOy3CEhi0v8sxdC
         1SuSrmaOhqXpuuFaBZGc6qpy5gbhnk553vDF4nv0YbJemU1A3+wyPPxwyEdKHsiSnhMC
         I9CE+sN6/wvEinMq0/Ki4vdkSLZhXIzD2jTH1fDZQC8UAkfgGC8l2CTbNui27m6K8mBZ
         ynBTg9gB+HuRgzY0F5+rthpoRK+QiY61XIRzszdLrezimMEl34V36H6UguMf8Pvqp/S3
         JqPg==
X-Gm-Message-State: AOAM531c1ducbM5p3igi5QwIKKSiYvxUKRzdRJO3qTLr/V2hYr3ikB8z
        AExYzdBZudNUspqOWBIY0fk=
X-Google-Smtp-Source: ABdhPJwNSLnDX2NgTftaUo9jI4/HhJwLnQlxnfQwRUGa/5PdBWI9rxfBNoSJccRirWl2S1GSdeTn7g==
X-Received: by 2002:a63:f443:: with SMTP id p3mr3993109pgk.378.1621508738022;
        Thu, 20 May 2021 04:05:38 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 May 2021 04:05:37 -0700 (PDT)
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
Subject: [PATCH 1/7] media: admin-guide: add stm32-dma2d description
Date:   Thu, 20 May 2021 19:05:21 +0800
Message-Id: <1621508727-24486-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

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

