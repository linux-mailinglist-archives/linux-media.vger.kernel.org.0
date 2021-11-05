Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3BC144645E
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 14:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233179AbhKENpt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 09:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233062AbhKENpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 09:45:43 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61C7C06120C;
        Fri,  5 Nov 2021 06:43:01 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id r3so9259083iod.6;
        Fri, 05 Nov 2021 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GVr9UbvBqKhMKqrCL+QAuy1UOuRrPQt/vqzzfEWHG9U=;
        b=QdkMVgCl4s70IFXnwLkwMw7vnMfI5woUZFGqI38zfO4AGEO9ZzBNg1O4jtQTqjIcaD
         OU/udSKAPnulFYLQpNaURYUgFf6/A3fN9CvzzK+oE5+V+C2NcisjY1X1R5xG5vpyvqPi
         w6eTpGNdzgTSUJL34d9i2LdB6uPcs6jAmf8no9j0amLCNOe/dY+hm5lDYEamQsNLUVnj
         f7VcailRea2wt3yZFL5zTQbZ3PqdF9XScx5kN0cnxvYG7PAksEbCoEi38e804/0KZhIt
         wSXoosIsxypT5uIgbCFA2uK0KNY68h1GPb8HkYlYEb5FfL9plN3FLgpSr4aXlZ+AP3lA
         5mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GVr9UbvBqKhMKqrCL+QAuy1UOuRrPQt/vqzzfEWHG9U=;
        b=zS3m+aToIfGImjl7s/69I290bVJsA/AYGMho+z+pCI+iROL8HDgsQaUZwHDZSi8JbB
         dyUOM/gSzlojwP1bjjkViA2Ded9+ZpgTkVh1JJ37MpyJ0IJdEWqsaqJ7tb72gkW6WMLy
         CKwRcahkBB9xx2V0ugLichCHahz6AMc+39jysvGCXKtHFU290vXHrFl4ngATR+dEt++8
         jLapbXMyRzf0UivW1sSJR6NValoNVpDLm2nkdhwtFwyPIpmlCsDMvh6jfbRakoAkQrK8
         MjZlOfKW9yvsozau2RD/0KhOVQsIS2OEq9mCVMnzZufV+mEtB2mvPlpbyLlf9yzvG9HX
         61QQ==
X-Gm-Message-State: AOAM532VLknJW98LByV0/pFDGzInhNhvlxV+y6Wd5mZceyIDeuWAcmVf
        S2SsNYsGqse4XU++/3H0lSw=
X-Google-Smtp-Source: ABdhPJyaCp0y/ZZ7VWLi4RArSfHIskr9dm2tjm8AgcgrqcqwpOgP3hG0AEAXLuOyOaJIGWnhJda75g==
X-Received: by 2002:a5d:9b86:: with SMTP id r6mr42742226iom.50.1636119781060;
        Fri, 05 Nov 2021 06:43:01 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id j15sm4537909ile.65.2021.11.05.06.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:43:00 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: defconfig: Enable OV5640
Date:   Fri,  5 Nov 2021 08:42:28 -0500
Message-Id: <20211105134228.731331-5-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105134228.731331-1-aford173@gmail.com>
References: <20211105134228.731331-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Beacon EmbeddedWorks imx8mm development kit has a TD Next 5640
Camera.  Enable the OV5640 driver to use the camera.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index bc261cf2ef5a..4c1eb9aae5e5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -668,6 +668,7 @@ CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_IMX219=m
+CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_DRM=m
-- 
2.32.0

