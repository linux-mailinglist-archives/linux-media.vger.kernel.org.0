Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD27450BA27
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 16:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448500AbiDVOfT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 10:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448244AbiDVOfS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 10:35:18 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60E25A59F
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 07:32:25 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id v65so4507693oig.10
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HiChs3D+6qqhb/tDDEDk808nQE2g7vQtb57EVCbhRhc=;
        b=R/rt/jmFQVKGP9R9P+YsVbMRHnsWfkA0g5yzW9PmFlOnfqGRCaB3B0qZlfaRsNqAgE
         rC253Q+ndklV7KMkXHkI5MKssHy+DM8YMKBkzWTj0G6oiujiyZ4YKWVZ+J5PFCudlvvV
         8Sh+u8G5CtBopHPaN0Y1f29mT1WVESSFOd6vhKZ4z4p4ol82dOXF8AIOC2gjpqVMXRoP
         E+tKGKCdSHlgzKWNDYg9sjmNCIqejkyqXjvN1KTcNCyJL0plfuWpf+PYjbekT5ZSZa1c
         bJn3UpFxigDLwcjgFOB2cx2XsO0Co2HbLVVeQ0GYPir4tF9qbqoa1Ta4pCRa7t2ETwux
         rreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HiChs3D+6qqhb/tDDEDk808nQE2g7vQtb57EVCbhRhc=;
        b=jr2Ssb5aN50xxXF2AmnPbqhjLW6AvwvHz5F06c8IW9uyoqfnlh26flpO7L206FZspi
         +FFQ8Jv5u1v/ed/4/g1hEN5GO+jHZxjaPyem78qDrlvT8GfqBi4/MoqLDwrcThq6L7FD
         jrEFIhTpmn+G8DDrCREZdYSFy7yrD6Oi39jgOvYE5Y4rZEHKWxX/oh5/892sSORs7rhH
         N1qQpsb7MjRLNJz43CEhV5T3G6G6TWOi5kA5YUiBs3OwG457z+m3tc0vb2HudKo5selj
         jV5bZ2km+r5i12i3Zw5ps1u1/R4y7wX8jCWHCl3FW+2NipCJzt6k3WXVbEzoc54DFgaD
         FacQ==
X-Gm-Message-State: AOAM532ymK8OrCGFg1NcV4/I8AJUV91E48tg8EVto4lxveIJs6M9bMn8
        6iuQ9Z/o9ZBZmykwkGTIUF8MfRUYsws=
X-Google-Smtp-Source: ABdhPJwaGQqjczl2N6nXDe1pF4vqnM9r6HPCZhDvYYWNMV9qodX64G4IcbMmfvYNZpkS8TplADXybA==
X-Received: by 2002:a05:6808:1805:b0:323:a81:bdff with SMTP id bh5-20020a056808180500b003230a81bdffmr2378919oib.7.1650637945187;
        Fri, 22 Apr 2022 07:32:25 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:9f29:454f:1c77:1b6b])
        by smtp.gmail.com with ESMTPSA id j17-20020a056808119100b00322e1b61907sm801850oil.35.2022.04.22.07.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 07:32:24 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     mchehab@kernel.org
Cc:     laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com,
        linux-media@vger.kernel.org, agust@denx.de,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] media: platform: video-viu: Do not select it by default
Date:   Fri, 22 Apr 2022 11:31:30 -0300
Message-Id: <20220422143130.1697636-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422143130.1697636-1-festevam@gmail.com>
References: <20220422143130.1697636-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

The video viu driver is not a vital one for booting purposes.

Remove the unneeded 'default y' option.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/media/platform/nxp/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index a0810df751dc..1ac0a6e91111 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -20,7 +20,6 @@ config VIDEO_VIU
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV && (PPC_MPC512x || COMPILE_TEST) && I2C
 	select VIDEOBUF_DMA_CONTIG
-	default y
 	help
 	  Support for Freescale VIU video driver. This device captures
 	  video data, or overlays video on DIU frame buffer.
-- 
2.25.1

