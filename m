Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE3F43854E
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 22:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbhJWUiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 16:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbhJWUiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 16:38:05 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345E6C061714;
        Sat, 23 Oct 2021 13:35:46 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id h10so8264722ilq.3;
        Sat, 23 Oct 2021 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M2kws/8h5A47SW8z23Mmx2Z5/tBmFNdnsEpgnc/EWks=;
        b=cevxLD5Jw0iOV6nl46aI+O5+GY2nR3aTbUJW3ScAAXtJ/tBuzOLTmOzrsRyuumIiQ1
         SGAVwRWUOFKgjspArTPHksdPiP8SjZyBBVXslc7oVn+3mmbsCah3V5+eGE/BueCu9A57
         yMsAEZyrY2hbLwvhS/sMTdbTnNbvR6KBW3BHz7i/NmZ6jVIpCzA2TfHqOmPuLJPZ5d3b
         RKywjgJSSS1K3fyk3jaxgntu3E3yBP0ywlDWhnCz8M8SOIvsBNkvFxS64HZiEzB1mIou
         cMdWjuOa9jmwfgn6W2bl7x4fwHQmwVZTJsnHpLPQBWIri0ZCwJOXuuBvKxCOonJBoai5
         BLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M2kws/8h5A47SW8z23Mmx2Z5/tBmFNdnsEpgnc/EWks=;
        b=nTeNzhtI4+WwdC3fgv4G+R79QnYe0PL7kFZTyKfiJU+6M+4IDeEEhtuvblAq+t7gfD
         +hWz3+9bqIHDgJ9IobX7xzYtCcRnIj/0hODxGu4lNwS0904AYZMJ1XIfdZQ1H4OHgC6s
         6m+U/bYjpVDYYNggRBi0U0hjPuWQdYtpuSjrcsRkO3iLgv8MGPnBz4rrBaP3YL8NxNOT
         +3EyRFftYA4usbnuJDd2yRvgaY/XNLZdPg7lCeCE0YTMfjrjX0C/WN58zpGXiiFIMwCv
         kcYEOQFwcKttYUixC1hC38IobC17qbuKgraBCtTWGmBTgNhgtoBM5FOOQKfbuvZRnb+I
         a7kg==
X-Gm-Message-State: AOAM5309F52NWjoh1m97IZEqi5Lo/kmQ3BRcduJX2jRXkaym4k6uTySJ
        UoWWan/iUc4ozBPMHwtalDCtn0IafuTlZQ==
X-Google-Smtp-Source: ABdhPJxMwTHhdQAspLxNKsxNcd1WQAXjG+v8/ytAkNBnt26kZGVqshM304hhub7pcncigAEE6nFYyQ==
X-Received: by 2002:a05:6e02:1788:: with SMTP id y8mr4880773ilu.75.1635021345603;
        Sat, 23 Oct 2021 13:35:45 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:1534:f270:7127:bc0a])
        by smtp.gmail.com with ESMTPSA id i5sm6128678ilj.49.2021.10.23.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:35:45 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        cstevens@beaconembedded.com, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC V2 4/5] arm64: defconfig: Enable OV5640
Date:   Sat, 23 Oct 2021 15:34:55 -0500
Message-Id: <20211023203457.1217821-5-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023203457.1217821-1-aford173@gmail.com>
References: <20211023203457.1217821-1-aford173@gmail.com>
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
index 6be8fb8248d5..6030fa71bcbd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -665,6 +665,7 @@ CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_IMX219=m
+CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_DRM=m
-- 
2.25.1

