Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41AC0337822
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbhCKPlb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234249AbhCKPlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:41:14 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE385C061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:13 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id d139-20020a1c1d910000b029010b895cb6f2so13063045wmd.5
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MLfi50uYgnTaoRAwVdM8rA06MiTyx2y/gOOhlp7gAUM=;
        b=mElIjjBS5Gwjfkc14YbmdXNf9qs87wJ08dzZObe5fEyfu0me0PGjGxeJriDc/LxJAx
         aZhvoX4Jjzk+ElUgr3rZR4iEMxYhbjK77G5WaPa3j6ekfFBXflFj2uPVj8HZeePjtfGt
         cV+5Qh00VDY9mhPo4zY+/c/rigmRJgH2ZW2N9yL5+BCaSlBtYqBTMNz47ZKG6TDGSJRj
         u2gYxNoAfgI4LUNmsfDqa/OAlCSgk1yN2l7DbEK756jaRk3TXOGiGbjVDBXaxTRlhvE9
         wIoJOF9SXRQk+Wc9uTryeQKg18VW3UyfNKQxrI62YKBgeu2PFOCgodCjnnSN/DpKEWHW
         GkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MLfi50uYgnTaoRAwVdM8rA06MiTyx2y/gOOhlp7gAUM=;
        b=mQtWxccfYbKhnDtUgk5MxbpNmKOsSrNmH+Q5OW2L5J/JxsoMOudKcqntMcHzVWSGcD
         SN1035BiDW7m0eZkSPC/Ytvj/gN5ImZlDPnqIjdZCPIHHQ1l7cRkwul4/PVquvoAOtwT
         xUw8RIk/C78b3vQgW3+A6dT2n8JF6M4Zb7HLvNmTgAcxHeYMP8EZy1EV4btHTRPGIubi
         SWVfaUchpspwA8xeQQJkMIelpZngxZIO8vJk2yMivkECwF5TGjx81P5Cb/hqV6KeuC7t
         lXlPGq0eLM6A3glfdFvh155A8TXmj2yOh8M+Bon15BaDQSWUFVyQFkcsgCFpF0QOwdzf
         w0oQ==
X-Gm-Message-State: AOAM533JYBNgeH284dYuPdSAcaq+V2hWsQSjwswVcyOmY6lkYi9BtM+w
        FUaQl7zsMJGcyxDkC4XQjbM=
X-Google-Smtp-Source: ABdhPJylGQtM/x2x9fB8CpajlovzBFYcjziolbH7jjBKfsNn5FDHoIgzRKDtgrT22KZ4yv/3YPHtag==
X-Received: by 2002:a1c:5f89:: with SMTP id t131mr8527466wmb.173.1615477272567;
        Thu, 11 Mar 2021 07:41:12 -0800 (PST)
Received: from arch-x1c3.. ([2a00:5f00:102:0:b16d:9752:8f38:7d6b])
        by smtp.gmail.com with ESMTPSA id a17sm4008547wmj.9.2021.03.11.07.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:41:12 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     emil.l.velikov@gmail.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/10] ARM: configs: at91: sama5: enable the Hantro G1 engine
Date:   Thu, 11 Mar 2021 15:40:55 +0000
Message-Id: <20210311154055.3496076-11-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The SoC features a Hantro G1 compatible engine. Enable it by default, so
people can make use of it.

Keep it a module, as suggested by Nicolas

Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
v2
 - Split out of larger patch (Eze)
 - Build it as module (Nicolas)
---
 arch/arm/configs/sama5_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index a5f274e39753..5bcf16aecf2f 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -200,6 +200,9 @@ CONFIG_RTC_DRV_AT91RM9200=y
 CONFIG_DMADEVICES=y
 CONFIG_AT_HDMAC=y
 CONFIG_AT_XDMAC=y
+CONFIG_STAGING=y
+CONFIG_STAGING_MEDIA=y
+CONFIG_VIDEO_HANTRO=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
 CONFIG_AT91_ADC=y
-- 
2.30.1

