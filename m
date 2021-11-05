Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FCC446458
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 14:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhKENph (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 09:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233017AbhKENpg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 09:45:36 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC66C061714;
        Fri,  5 Nov 2021 06:42:57 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id n128so10724872iod.9;
        Fri, 05 Nov 2021 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6DnJaZejjY7YGe416zQO8xP6uy0r2CR+DYTO7evqJCs=;
        b=lgQMPgtN3ciqhxYSE7CONAKA4Z39z9EhyjV6TvHxbgtzdODg9Gq56jgvKP+OaJVL5J
         sGfl78z+78CujrieYJo2tgkEgJi4sSEYe6F4tllHbZWSspYp48bqjvo3PM4T+sdzdLFu
         CxeQXvXFVE3hHuIYsvLtdJj+sZvBO5MQ0RDokomOZC+PWa2OFdq4CbgppbaOA8i9GYAQ
         /UIMi8C98WhGoYe9NxqXxJETmz3GiWoYpdxCN73ARt/XU4YecAo52//kMS6q6ioElUwf
         0V+PWl7HsO4GGxFlv8zTWkriBM4R93UDHC6zDQ7upOgW/JJM0n5HY4IvyQNFYlWCt0bg
         q13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6DnJaZejjY7YGe416zQO8xP6uy0r2CR+DYTO7evqJCs=;
        b=2k50y+HHOwq/Y1T3Yyr6/mfQkHM7Cg8xLuWrYQrXv2o/TjjbaaoA3dMYR81MbeCOos
         Rsf8nUxSY5Z7K6TYt49tsIB7yhuAZYeyhcptQiw/8vlqsx1mghvzVJC3sRPX/PWGmdyw
         oJc27MxhjpN7SMuEzGtc56Jb/ZNnXrKtYdlM8ibLXHmJPdc+TIEt5pPFiVrgED7jqC0C
         cTvmz54W4/JXhoBQ/JU8v6zzjcO2fgMZW1aEk4m/wTo+cbg+7W1CgZhbTJN22f+q2Tgx
         jgFHLk7q0MlnSK9tTb02aEWhJp15KXxDUe6Xo+w8/VqMeSHrPZ1VqSGkqAOvXQK5v8gt
         9gQA==
X-Gm-Message-State: AOAM532cikkoXh+bytUU2T385Kr3Wo9kmoUMvqn+hZfg04o03m4f1jQc
        zKLmC19/smi4r3ix0CluQFw=
X-Google-Smtp-Source: ABdhPJwLlg0veKa0TrQOcgkCplFB2aVy7GIdxoXuy989hQkB7x/PRNCebsTw0gIvc27bBPGbbaLB6A==
X-Received: by 2002:a05:6638:3048:: with SMTP id u8mr9042902jak.103.1636119776617;
        Fri, 05 Nov 2021 06:42:56 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id j15sm4537909ile.65.2021.11.05.06.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:42:55 -0700 (PDT)
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
Subject: [PATCH 3/5] arm64: defconfig: Enable VIDEO_IMX_MEDIA
Date:   Fri,  5 Nov 2021 08:42:26 -0500
Message-Id: <20211105134228.731331-3-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105134228.731331-1-aford173@gmail.com>
References: <20211105134228.731331-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To use a camera, the CSIS and CSI drivers need to be enabled with
VIDEO_IMX_MEDIA.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e2b9bdd702..bc261cf2ef5a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -958,6 +958,7 @@ CONFIG_MFD_CROS_EC_DEV=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
 CONFIG_VIDEO_HANTRO=m
+CONFIG_VIDEO_IMX_MEDIA=m
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=y
-- 
2.32.0

