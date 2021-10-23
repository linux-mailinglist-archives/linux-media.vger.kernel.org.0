Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BDD438546
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 22:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbhJWUiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 16:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbhJWUiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 16:38:02 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFE2C061714;
        Sat, 23 Oct 2021 13:35:42 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id 3so5740930ilq.7;
        Sat, 23 Oct 2021 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S9jupzanivgTCvIkGDW6h4LgyrrV3Rj+0P0NfjPpEN8=;
        b=l6JEkJB7vJ6uWGNouTmlI12JZGU2xH6KQJB7Z3f1nOqC0S7Fja8v/CvL5xa8Qino+y
         1YrAqt7LahVkMIEhG+37g1al+mhtqHhi+bYSY0ArCtByX7gUga6xJmVfAKbw0b5PcUYi
         cowrEEADeGyFJzawLKvxsEyISQNZW3my2HzPMj8gx9sqc9SjUoU9KEyGm2tihIDWMdWt
         CvH4cewGYbtoyjlRKL2BrQ62eIC0Sm9qCpSEckoEOjPlj1XR7xomrbZ8Dy9UfW5Srejg
         CjlqsAfZ0WCXUDYQXXAvTpdmROxu+TTdGdpjdAJGelyBDY35ekYVZIzxf2EiW5v6xMsQ
         78cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S9jupzanivgTCvIkGDW6h4LgyrrV3Rj+0P0NfjPpEN8=;
        b=eu0NAESDAjwny63TSe7pDIJLdmsP2qRTLYiEBZyNWkIuZrGscYhKAsrXSEaH+mbKa0
         VjA6Tkl5gokkFuocDGu4kRQ3Do0S5hfs9w4cLLC+4zoLxcwh5UqicQdtuRXHyoMTqCDj
         YmfLQNDbrnIHY8EZ+UU3YOOi7UXLVfHyrvhpP2h1nkq7Un7qyQ0xlVmC1RBqe6aur7qu
         RXr8tZR7YfQ7hza4Ou6Ew6mKKBOPm07PybUe5eXM1SN71nV0tVMbDLE3G3TiWD4kuhre
         bix1v4BYNb4VBilH4ZVZV/4k9ZQ2YTjmxiGIAQxbucC/Dj8WidYh/zZmN/HUvAnYsXzJ
         Cjag==
X-Gm-Message-State: AOAM532OU/uSE0H2IysrAySonBNW4WbXQarZHdWFij7ggP/zbNeXjxGH
        vbpjCmI0JQZvjdHPtqppIec=
X-Google-Smtp-Source: ABdhPJwsDxpTTl/DENPhF927l2Jzmq+wLWWfKntDUjaXu0DNktWdtN0jMbTyyChWrBMI791Mu2nsIg==
X-Received: by 2002:a92:dcc1:: with SMTP id b1mr4862590ilr.210.1635021342068;
        Sat, 23 Oct 2021 13:35:42 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:1534:f270:7127:bc0a])
        by smtp.gmail.com with ESMTPSA id i5sm6128678ilj.49.2021.10.23.13.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:35:41 -0700 (PDT)
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
Subject: [RFC V2 2/5] arm64: defconfig: Enable VIDEO_IMX_MEDIA
Date:   Sat, 23 Oct 2021 15:34:53 -0500
Message-Id: <20211023203457.1217821-3-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023203457.1217821-1-aford173@gmail.com>
References: <20211023203457.1217821-1-aford173@gmail.com>
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
index d04cdfc7daa4..6be8fb8248d5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -955,6 +955,7 @@ CONFIG_MFD_CROS_EC_DEV=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
 CONFIG_VIDEO_HANTRO=m
+CONFIG_VIDEO_IMX_MEDIA=m
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=y
-- 
2.25.1

