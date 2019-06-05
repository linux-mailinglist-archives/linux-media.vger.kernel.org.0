Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC5736609
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 22:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfFEUxq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 16:53:46 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:44677 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfFEUxq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 16:53:46 -0400
Received: by mail-qk1-f193.google.com with SMTP id w187so101648qkb.11
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 13:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=2rS9f8hE9ROo6nwBfE1F6E3//U/EXMHnwah8/B5pybA=;
        b=hpcRRCXvP6XuO3QZjMq0lXbZWPUBhccZHCM4RSNTeRpvYbz+xru5cOohrelN/QX9Bl
         jWREAFANtnuswYVsw0ZriA0t2udKFOBysu7orGhvSGNS2TmnSh1AEOwh0y/gfye0JFOi
         DNxyXSobUAN5sGuJmItaJuGXYyeOXKa0YYSfFtxMxb8kX/LdMK0c0vre0uxEpFrlCGJY
         7IRpkXkrZeCgG0eGcKmMnCxEd/S54KOJiwLJnK4qbHKGsfMyoSyf7PnAh/tDTwfbnDbF
         PkXU5nhGQit+zf6uLqOnMn+a2Vv0KcWcJFNW0iUpqbcUOknozHPb8Ez3dTQI87LwbABL
         F3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2rS9f8hE9ROo6nwBfE1F6E3//U/EXMHnwah8/B5pybA=;
        b=AMkZSWCaJl/avjGqDKBiTY2n/4T1mfe1AYYXsm1NFnHGRUfEe4i324zuD4G/Fo53S6
         JHqM4qSvBIMpyYS4+5uZhQPmnrPwehdNBvkNvw5Argt6DVppH63k69cnd5QyWHwveaa7
         iXqI58vCI021y84TabF8kKXWgt8tuzB1bnALpnrlyiYX/hgF32FhVNwWx5ismiA60haT
         3oGXMK4qU7R5oxpE/+OW4S2f3xHGliNUbKAy8bgUv5yZodQfXl25vJvCLGPUxeqRSWum
         yPX7Oj777JsgJjoBPpG6jJkcDxGsWMdZXeErbu/0j+Kl1nwqzQjEmvBBkGw5MSihV0wi
         LV/w==
X-Gm-Message-State: APjAAAUrkpn+qGt5ZfYzdj2WYd4RW4Kjg3wvPrOgfan+xwRLHL8dxXM/
        ZQlRxv86mdaNPxRNa4q2fKA=
X-Google-Smtp-Source: APXvYqzA+A8z7F/5B9GPvleGpRuWAOOtkRN4V/iuO3NXyssMM+JxJTnjWxu5+XwLs5slm9/HcugE2g==
X-Received: by 2002:a37:6708:: with SMTP id b8mr32817232qkc.141.1559768024827;
        Wed, 05 Jun 2019 13:53:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id k54sm14382215qtk.54.2019.06.05.13.53.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 13:53:44 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        rdunlap@infradead.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, javierm@redhat.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] Revert "media: staging/imx: Allow driver to build if COMPILE_TEST is enabled"
Date:   Wed,  5 Jun 2019 17:53:33 -0300
Message-Id: <20190605205333.2481-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 020bc7354a6e ("media: staging/imx: Allow driver to build
if COMPILE_TEST is enabled") incorrectly assumed that the imx media
driver had no build time dependency with IMX_IPUV3_CORE.

Building on x86_64 without IMX_IPUV3_CORE causes lots of build errors
such as:

ld: drivers/staging/media/imx/imx-media-internal-sd.o: in function `imx_media_register_ipu_internal_subdevs':
imx-media-internal-sd.c:(.text+0xd1): undefined reference to `ipu_get_num'
ld: drivers/staging/media/imx/imx-ic-common.o: in function `imx_media_ic_register':
imx-ic-common.c:(.text+0xec): undefined reference to `ipu_get_num'

All these definitions come from the imx ipu3 core driver, so make
sure that imx media depends on IMX_IPUV3_CORE.

This reverts commit 020bc7354a6ebec980e0aedf5bedf57b42f93aca.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index ad3d7df6bb3c..4c726345dc25 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_IMX_MEDIA
 	tristate "i.MX5/6 V4L2 media core driver"
 	depends on ARCH_MXC || COMPILE_TEST
-	depends on MEDIA_CONTROLLER && VIDEO_V4L2 && (IMX_IPUV3_CORE || COMPILE_TEST)
+	depends on MEDIA_CONTROLLER && VIDEO_V4L2 && IMX_IPUV3_CORE
 	depends on VIDEO_V4L2_SUBDEV_API
 	depends on HAS_DMA
 	select VIDEOBUF2_DMA_CONTIG
-- 
2.17.1

