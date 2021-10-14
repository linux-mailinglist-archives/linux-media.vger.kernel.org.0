Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA74E42D6F1
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhJNK1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhJNK1W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:27:22 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7289AC06174E;
        Thu, 14 Oct 2021 03:25:18 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id f5so5071633pgc.12;
        Thu, 14 Oct 2021 03:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qlIjua7EzzlWfNKFnvLiSDvXnVEOxFzRdk3SXOU8E2c=;
        b=c20GPHZ27ma0xaD1YWE8QpEYvYFVqb6a9/kdv8A5Ps+j82AqpDsN76l+NV4YbeWfPl
         w037TDKjmjfMhoQSJ+Y/K8K3Ev7fM26sYybKhgqjRw3kJEJXqkEPRyZOf/9Z+WPS97Go
         TlH361+xeqfV0Mkm7s/XXIolATnP1T7JQ0EF8i4Vt6Yrebq5OyLPAPVSV4EO1dqxRfhc
         f6+VXP779fcrKjMATybRgVBIxViOIzkQ3Yf/X4AL8qhvnzISnMCJ0eBEUbrqrEixVBlH
         UPpIjtynJcslapKndOyV95aU6o27huoodGwgwMi/eCQ83YH2Gv9afnv408mavAnsp6Pg
         Sbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qlIjua7EzzlWfNKFnvLiSDvXnVEOxFzRdk3SXOU8E2c=;
        b=ZCq7xTRsdGjeJ+EJmUss+MORHtJUIaf5Yq3XeyTR6cP++nIaso/5FOzz881XXBp6th
         O7vr+RyH+sWpq9k8OwrooCLBFH3+pMCZ2wv5C0mmtPr/azqTUgwJ2wOWudPlzQcBMu/H
         BPOWfXbpvhfHn4JvwBjbA7f9gY2cckzrdwbPBDQoKCYTN5VuIld+EtuxrnxTPr4oJoT8
         fzTuDkmof7A1DdZNqaCt29wtkVvC/mNFOtFA+LzZIqiJX0mpuLtkBPVAbtNvaRBWiXXz
         EPZcDslOUrXhb+Ef6IqlYHbAD5ydEfYocjk1ldY4mI5R9Lp5OJGrB+g/g+M3qrZBAAkx
         mkZA==
X-Gm-Message-State: AOAM531bFgyKmQ6BCzQhnA8Xz/M4PcdMvXCDMLwv7kB94lw+krvb0kJb
        bOTllO6tu9+lexJIuVSgK2Q=
X-Google-Smtp-Source: ABdhPJwr/VaPTK3XZxFWTLKcnjgAte5R7jgVEPQzhe/vi7U7MgGrAahbpF7hSZ7lNm+yny2FyDi3NQ==
X-Received: by 2002:a62:ea04:0:b0:44c:7370:e6d8 with SMTP id t4-20020a62ea04000000b0044c7370e6d8mr4652456pfh.18.1634207117968;
        Thu, 14 Oct 2021 03:25:17 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id ip10sm2105939pjb.40.2021.10.14.03.25.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 03:25:17 -0700 (PDT)
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
Subject: [PATCH v4 1/8] media: admin-guide: add stm32-dma2d description
Date:   Thu, 14 Oct 2021 18:24:59 +0800
Message-Id: <1634207106-7632-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

add stm32-dma2d description for dma2d driver

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v4: no change.

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

