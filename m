Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8DDE578D01
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 23:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236153AbiGRVls (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 17:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbiGRVlr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 17:41:47 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A74CC22
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 14:41:44 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-10bffc214ffso27491183fac.1
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 14:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kktUO5T6Wssd6a5a3+ng7z+stZxvsY2qgIiI9KzLp2Q=;
        b=s4Qc1EShSX6KpR3GYmVpLtb3kFIJp00AG4pvgu0ttzdwozx4aIxhF6BAyDZOA34hL6
         e8SpJak8X8jQQrUlmacafQ+qZrhPPLh2uOK9bubnlgXnuNdv7c9IRNVztzaKlVSfwzx6
         eOetW1Ohn9jNrazMh15H0AbamSgz1uXoSvKeKVmMETSKfQt38W9690wGlj1k+GA9/GYJ
         akzNyYG2toDwZxkWVWUK2utqMYB6cdCXVmwbDyNq61lEBObpWXZ4MYP5JHSmyvYZVQbj
         D/L+NR3gBPY39Zdo5nAdYAnAuT6gYflpEs5mxaMPL6B4BI8LOms5MJ9eDFb2fHJdIZ3y
         UOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kktUO5T6Wssd6a5a3+ng7z+stZxvsY2qgIiI9KzLp2Q=;
        b=4qkx8a5lBcI3zPaOBYGqXL2tgiR+4zb3UMBW85Y/eSx+5Q3NQLPJ2j8gKufKGXP3Ej
         8YuVGtelMudhYtrbNwEmvtDIVW9IlMU4Nc1kwK70l2Am6Ytk+U3t5VG4moFpw9vQGJ8+
         UUGcPLzQsfoMT7tR7+oak/kq1DBZwSQxNYKXMJ4+ufjjBozP15NvC7ylh0tFQ0OBhsxr
         TBhfIJxRoDze0YrULpuVZZSW6AFeP3FIhwn/lHJ7Coa5y9sFdXLPdAEDRfxLnrYsVCTq
         OjoOWZ1MaKhIzWy5n7NvotiGEHa751xMeSPqys7CGCoudff47GgYTV1qo+jmFGL7Mlko
         61ng==
X-Gm-Message-State: AJIora/omfjVBYvxzQwE93u7wxzgmYVcEiKtWccKroxNvg0d9HcsTxBY
        jYTFxC4rj2TmjjPaIh3yS8zST/racIvdnT35
X-Google-Smtp-Source: AGRyM1uMcAayZy7tpMum2Ht5eGK6Lo9TVBzsvqMQNtVjKshlsp7ozmO6+87sVtxVS5LYRuxveeHlWw==
X-Received: by 2002:a05:6808:23d4:b0:337:e764:90eb with SMTP id bq20-20020a05680823d400b00337e76490ebmr17714817oib.205.1658180503478;
        Mon, 18 Jul 2022 14:41:43 -0700 (PDT)
Received: from zeta-build.. ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id a39-20020a056870a1a700b0010490c6b552sm6781283oaf.35.2022.07.18.14.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 14:41:42 -0700 (PDT)
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Chris Healy <cphealy@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] media: destage Hantro VPU driver
Date:   Mon, 18 Jul 2022 18:41:21 -0300
Message-Id: <20220718214123.73275-1-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Hantro mainline driver has been used in production
since several years and was only kept as a staging driver
due the stateless CODEC controls.

Now that all the stateless CODEC controls have been moved
out of staging, graduate the driver as well.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 MAINTAINERS                                                 | 2 +-
 drivers/media/platform/Kconfig                              | 1 +
 drivers/media/platform/Makefile                             | 1 +
 .../media/hantro => media/platform/verisilicon}/Kconfig     | 6 +++++-
 .../media/hantro => media/platform/verisilicon}/Makefile    | 0
 .../media/hantro => media/platform/verisilicon}/hantro.h    | 0
 .../hantro => media/platform/verisilicon}/hantro_drv.c      | 0
 .../media/hantro => media/platform/verisilicon}/hantro_g1.c | 0
 .../platform/verisilicon}/hantro_g1_h264_dec.c              | 0
 .../platform/verisilicon}/hantro_g1_mpeg2_dec.c             | 0
 .../hantro => media/platform/verisilicon}/hantro_g1_regs.h  | 0
 .../platform/verisilicon}/hantro_g1_vp8_dec.c               | 0
 .../media/hantro => media/platform/verisilicon}/hantro_g2.c | 0
 .../platform/verisilicon}/hantro_g2_hevc_dec.c              | 0
 .../hantro => media/platform/verisilicon}/hantro_g2_regs.h  | 0
 .../platform/verisilicon}/hantro_g2_vp9_dec.c               | 0
 .../platform/verisilicon}/hantro_h1_jpeg_enc.c              | 0
 .../hantro => media/platform/verisilicon}/hantro_h1_regs.h  | 0
 .../hantro => media/platform/verisilicon}/hantro_h264.c     | 0
 .../hantro => media/platform/verisilicon}/hantro_hevc.c     | 0
 .../media/hantro => media/platform/verisilicon}/hantro_hw.h | 0
 .../hantro => media/platform/verisilicon}/hantro_jpeg.c     | 0
 .../hantro => media/platform/verisilicon}/hantro_jpeg.h     | 0
 .../hantro => media/platform/verisilicon}/hantro_mpeg2.c    | 0
 .../hantro => media/platform/verisilicon}/hantro_postproc.c | 0
 .../hantro => media/platform/verisilicon}/hantro_v4l2.c     | 0
 .../hantro => media/platform/verisilicon}/hantro_v4l2.h     | 0
 .../hantro => media/platform/verisilicon}/hantro_vp8.c      | 0
 .../hantro => media/platform/verisilicon}/hantro_vp9.c      | 0
 .../hantro => media/platform/verisilicon}/hantro_vp9.h      | 0
 .../hantro => media/platform/verisilicon}/imx8m_vpu_hw.c    | 0
 .../platform/verisilicon}/rockchip_vpu2_hw_h264_dec.c       | 0
 .../platform/verisilicon}/rockchip_vpu2_hw_jpeg_enc.c       | 0
 .../platform/verisilicon}/rockchip_vpu2_hw_mpeg2_dec.c      | 0
 .../platform/verisilicon}/rockchip_vpu2_hw_vp8_dec.c        | 0
 .../platform/verisilicon}/rockchip_vpu2_regs.h              | 0
 .../hantro => media/platform/verisilicon}/rockchip_vpu_hw.c | 0
 .../hantro => media/platform/verisilicon}/sama5d4_vdec_hw.c | 0
 .../hantro => media/platform/verisilicon}/sunxi_vpu_hw.c    | 0
 drivers/staging/media/Kconfig                               | 2 --
 drivers/staging/media/Makefile                              | 1 -
 drivers/staging/media/hantro/TODO                           | 2 --
 42 files changed, 8 insertions(+), 7 deletions(-)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/Kconfig (91%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/Makefile (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_drv.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_h264_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_mpeg2_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_regs.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g1_vp8_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_hevc_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_regs.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_g2_vp9_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_jpeg_enc.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h1_regs.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_h264.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hevc.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_hw.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_jpeg.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_mpeg2.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_postproc.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_v4l2.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp8.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/hantro_vp9.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/imx8m_vpu_hw.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_h264_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_jpeg_enc.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_mpeg2_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_hw_vp8_dec.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu2_regs.h (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/rockchip_vpu_hw.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/sama5d4_vdec_hw.c (100%)
 rename drivers/{staging/media/hantro => media/platform/verisilicon}/sunxi_vpu_hw.c (100%)
 delete mode 100644 drivers/staging/media/hantro/TODO

diff --git a/MAINTAINERS b/MAINTAINERS
index fee2ac9a98f4..07ed4aaf545d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8686,7 +8686,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
 F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
 F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
-F:	drivers/staging/media/hantro/
+F:	drivers/media/platform/verisilicon/
 
 HARD DRIVE ACTIVE PROTECTION SYSTEM (HDAPS) DRIVER
 M:	Frank Seidel <frank@f-seidel.de>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index f1056ceaf5a8..a9334263fa9b 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -81,6 +81,7 @@ source "drivers/media/platform/samsung/Kconfig"
 source "drivers/media/platform/st/Kconfig"
 source "drivers/media/platform/sunxi/Kconfig"
 source "drivers/media/platform/ti/Kconfig"
+source "drivers/media/platform/verisilicon/Kconfig"
 source "drivers/media/platform/via/Kconfig"
 source "drivers/media/platform/xilinx/Kconfig"
 
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index a881e97bae95..a91f42024273 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -24,6 +24,7 @@ obj-y += samsung/
 obj-y += st/
 obj-y += sunxi/
 obj-y += ti/
+obj-y += verisilicon/
 obj-y += via/
 obj-y += xilinx/
 
diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/media/platform/verisilicon/Kconfig
similarity index 91%
rename from drivers/staging/media/hantro/Kconfig
rename to drivers/media/platform/verisilicon/Kconfig
index 0172a6822ec2..e65b836b9d78 100644
--- a/drivers/staging/media/hantro/Kconfig
+++ b/drivers/media/platform/verisilicon/Kconfig
@@ -1,7 +1,11 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
+
+comment "Verisilicon media platform drivers"
+
 config VIDEO_HANTRO
 	tristate "Hantro VPU driver"
 	depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || ARCH_SUNXI || COMPILE_TEST
+	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select MEDIA_CONTROLLER_REQUEST_API
diff --git a/drivers/staging/media/hantro/Makefile b/drivers/media/platform/verisilicon/Makefile
similarity index 100%
rename from drivers/staging/media/hantro/Makefile
rename to drivers/media/platform/verisilicon/Makefile
diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/media/platform/verisilicon/hantro.h
similarity index 100%
rename from drivers/staging/media/hantro/hantro.h
rename to drivers/media/platform/verisilicon/hantro.h
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_drv.c
rename to drivers/media/platform/verisilicon/hantro_drv.c
diff --git a/drivers/staging/media/hantro/hantro_g1.c b/drivers/media/platform/verisilicon/hantro_g1.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_g1.c
rename to drivers/media/platform/verisilicon/hantro_g1.c
diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_g1_h264_dec.c
rename to drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
rename to drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
diff --git a/drivers/staging/media/hantro/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
similarity index 100%
rename from drivers/staging/media/hantro/hantro_g1_regs.h
rename to drivers/media/platform/verisilicon/hantro_g1_regs.h
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_g1_vp8_dec.c
rename to drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
diff --git a/drivers/staging/media/hantro/hantro_g2.c b/drivers/media/platform/verisilicon/hantro_g2.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_g2.c
rename to drivers/media/platform/verisilicon/hantro_g2.c
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_g2_hevc_dec.c
rename to drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/media/platform/verisilicon/hantro_g2_regs.h
similarity index 100%
rename from drivers/staging/media/hantro/hantro_g2_regs.h
rename to drivers/media/platform/verisilicon/hantro_g2_regs.h
diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_g2_vp9_dec.c
rename to drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
rename to drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
diff --git a/drivers/staging/media/hantro/hantro_h1_regs.h b/drivers/media/platform/verisilicon/hantro_h1_regs.h
similarity index 100%
rename from drivers/staging/media/hantro/hantro_h1_regs.h
rename to drivers/media/platform/verisilicon/hantro_h1_regs.h
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/media/platform/verisilicon/hantro_h264.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_h264.c
rename to drivers/media/platform/verisilicon/hantro_h264.c
diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/media/platform/verisilicon/hantro_hevc.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_hevc.c
rename to drivers/media/platform/verisilicon/hantro_hevc.c
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
similarity index 100%
rename from drivers/staging/media/hantro/hantro_hw.h
rename to drivers/media/platform/verisilicon/hantro_hw.h
diff --git a/drivers/staging/media/hantro/hantro_jpeg.c b/drivers/media/platform/verisilicon/hantro_jpeg.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_jpeg.c
rename to drivers/media/platform/verisilicon/hantro_jpeg.c
diff --git a/drivers/staging/media/hantro/hantro_jpeg.h b/drivers/media/platform/verisilicon/hantro_jpeg.h
similarity index 100%
rename from drivers/staging/media/hantro/hantro_jpeg.h
rename to drivers/media/platform/verisilicon/hantro_jpeg.h
diff --git a/drivers/staging/media/hantro/hantro_mpeg2.c b/drivers/media/platform/verisilicon/hantro_mpeg2.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_mpeg2.c
rename to drivers/media/platform/verisilicon/hantro_mpeg2.c
diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_postproc.c
rename to drivers/media/platform/verisilicon/hantro_postproc.c
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_v4l2.c
rename to drivers/media/platform/verisilicon/hantro_v4l2.c
diff --git a/drivers/staging/media/hantro/hantro_v4l2.h b/drivers/media/platform/verisilicon/hantro_v4l2.h
similarity index 100%
rename from drivers/staging/media/hantro/hantro_v4l2.h
rename to drivers/media/platform/verisilicon/hantro_v4l2.h
diff --git a/drivers/staging/media/hantro/hantro_vp8.c b/drivers/media/platform/verisilicon/hantro_vp8.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_vp8.c
rename to drivers/media/platform/verisilicon/hantro_vp8.c
diff --git a/drivers/staging/media/hantro/hantro_vp9.c b/drivers/media/platform/verisilicon/hantro_vp9.c
similarity index 100%
rename from drivers/staging/media/hantro/hantro_vp9.c
rename to drivers/media/platform/verisilicon/hantro_vp9.c
diff --git a/drivers/staging/media/hantro/hantro_vp9.h b/drivers/media/platform/verisilicon/hantro_vp9.h
similarity index 100%
rename from drivers/staging/media/hantro/hantro_vp9.h
rename to drivers/media/platform/verisilicon/hantro_vp9.h
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
similarity index 100%
rename from drivers/staging/media/hantro/imx8m_vpu_hw.c
rename to drivers/media/platform/verisilicon/imx8m_vpu_hw.c
diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
similarity index 100%
rename from drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c
rename to drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
similarity index 100%
rename from drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
rename to drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_mpeg2_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_mpeg2_dec.c
similarity index 100%
rename from drivers/staging/media/hantro/rockchip_vpu2_hw_mpeg2_dec.c
rename to drivers/media/platform/verisilicon/rockchip_vpu2_hw_mpeg2_dec.c
diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
similarity index 100%
rename from drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
rename to drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
diff --git a/drivers/staging/media/hantro/rockchip_vpu2_regs.h b/drivers/media/platform/verisilicon/rockchip_vpu2_regs.h
similarity index 100%
rename from drivers/staging/media/hantro/rockchip_vpu2_regs.h
rename to drivers/media/platform/verisilicon/rockchip_vpu2_regs.h
diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
similarity index 100%
rename from drivers/staging/media/hantro/rockchip_vpu_hw.c
rename to drivers/media/platform/verisilicon/rockchip_vpu_hw.c
diff --git a/drivers/staging/media/hantro/sama5d4_vdec_hw.c b/drivers/media/platform/verisilicon/sama5d4_vdec_hw.c
similarity index 100%
rename from drivers/staging/media/hantro/sama5d4_vdec_hw.c
rename to drivers/media/platform/verisilicon/sama5d4_vdec_hw.c
diff --git a/drivers/staging/media/hantro/sunxi_vpu_hw.c b/drivers/media/platform/verisilicon/sunxi_vpu_hw.c
similarity index 100%
rename from drivers/staging/media/hantro/sunxi_vpu_hw.c
rename to drivers/media/platform/verisilicon/sunxi_vpu_hw.c
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 421ce9dbf44c..2b8ad4cc8ac5 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -24,8 +24,6 @@ source "drivers/staging/media/atomisp/Kconfig"
 
 source "drivers/staging/media/av7110/Kconfig"
 
-source "drivers/staging/media/hantro/Kconfig"
-
 source "drivers/staging/media/imx/Kconfig"
 
 source "drivers/staging/media/ipu3/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 950e96f10aad..a12d0bb9dca3 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -8,7 +8,6 @@ obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
 obj-$(CONFIG_VIDEO_STKWEBCAM)	+= stkwebcam/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
-obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
diff --git a/drivers/staging/media/hantro/TODO b/drivers/staging/media/hantro/TODO
deleted file mode 100644
index 8483ff482146..000000000000
--- a/drivers/staging/media/hantro/TODO
+++ /dev/null
@@ -1,2 +0,0 @@
-The V4L controls for the HEVC CODEC are not yet part of the stable uABI,
-we are keeping this driver in staging until the HEVC uABI has been merged.
-- 
2.34.3

