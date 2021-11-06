Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1D0446ECF
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 16:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234570AbhKFP5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 11:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbhKFP5g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Nov 2021 11:57:36 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7A8C061714;
        Sat,  6 Nov 2021 08:54:54 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id k1so12568430ilo.7;
        Sat, 06 Nov 2021 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nBcoZb4cANV3EfFk1jlOBnnvSvADPABY6nQqW9dTSxE=;
        b=FJmuv4f4v2wR4rm6As+zpSWSJORr++vMB3aFxmJjj1UUfufQ7cbFbwajKusW2ILhwA
         GDCGrTDvjvfHacZ2zWNy/LKu0TzA1vmUStLhTQ1mQaLNguF52x20l61EUJkybP76YDi5
         +E+6nE9s+ur87TDnVGox9dEZD2Hp6g9bny63zZexWplZKBUqMJBojFWcmVkWzsV43+4/
         iOYBjw3jQa1tv2cVOFnxvD1CTO35iKteo4v2heKCc1Z1RfYRrlld3xyHA2ybTtgmK5Mq
         nLssraQuK2791u748s1miSVG9NiMuUn1RuKMif1tTwkfFbHb/pbmykuZ6oU+b+7LRqRI
         9Viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nBcoZb4cANV3EfFk1jlOBnnvSvADPABY6nQqW9dTSxE=;
        b=BATceiKQfO0Xo/1fxQMz4QU49Bq8w6vORd9Zg8Wp8u4ntBMd9Z3fS5JzAVzELkSkMp
         pkKPTJG0q8U6+oPo5FF9xtBO9giuf26bq9AQRMlaTcHuMItXh7M8amzkbJdUfz9A061G
         Nh1iGKcmNwyLIJtscFZZyzQQlBReldRGDr6K6vlViAjs98HHyPNgXkg4ucnU009FFeNo
         npgrmOVCBpS1tk0ui7Yf37wRERix0ENCdOKmrfs2eSrhl/QSVP7clxPNuzSG6V9XKgm5
         /+64iR7KUqbC6Pz9U7y8Ho8FqGB57GrqYLThDTYzPfcCCC7lsgiTJQD8io85kOZTaygO
         xYbA==
X-Gm-Message-State: AOAM533UMc3kColQfMwY/qtJpXsrduoiqfuk+lP4stH1fKWDqwoqn7cD
        VYisHK2ZbOEbn3prA8btjEU=
X-Google-Smtp-Source: ABdhPJy+BiqbWNfyydrcutyDetwpsLA0bY1tGP2GgldxnjF3A4eVczGPjf0kgIiTo2s3QdyGSkSoCA==
X-Received: by 2002:a05:6e02:168c:: with SMTP id f12mr26512828ila.171.1636214093765;
        Sat, 06 Nov 2021 08:54:53 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:64ba:1c0f:6d36:c11d])
        by smtp.gmail.com with ESMTPSA id d2sm5718313ilg.77.2021.11.06.08.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 08:54:53 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        jagan@amarulasolutions.com, Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 5/5] arm64: defconfig: Enable OV5640
Date:   Sat,  6 Nov 2021 10:54:27 -0500
Message-Id: <20211106155427.753197-5-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211106155427.753197-1-aford173@gmail.com>
References: <20211106155427.753197-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Beacon EmbeddedWorks imx8mm development kit has a TD Next 5640
Camera.  Enable the OV5640 driver to use the camera.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  No Change

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

