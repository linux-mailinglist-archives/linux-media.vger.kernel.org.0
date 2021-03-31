Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C177A35058D
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 19:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234325AbhCaRfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 13:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbhCaRf2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 13:35:28 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24732C061574;
        Wed, 31 Mar 2021 10:35:28 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id v4so20465959wrp.13;
        Wed, 31 Mar 2021 10:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TAPXDo2+mkNk79YuRIAXULFMjD5KTMr/lWvkWqA4+1E=;
        b=stvE07WNFpemIRbE4Ip0VoK5Xx9dVP/funJZN4jEAm/Xtt3WCaDgS/GLrY4RicIVYZ
         BSm2N+Ovv+6vGyC+ivaQ6qp+BoVeOK+XHwk2epo5ddaT1BzXAAcLIDzBziVq4OB84IiS
         6o3fv/NQICkRcg/d3ibHz/CE27qREKNTqak/IWn9R8Vv/0G3u3E/EGOAaDV8/y6JUPtk
         8aZ8+xIVMn5fZ3kZ90vFl4FjYOeI1aTnUw0LFr38g37vAP8X2oVQTrVGsBtQd/dtlX1u
         AjZxdTDYMT7HflZk+ydnEVhyqjpINB8e1kXgOGG8MLIft8C7mAtwW3MUpgHRn7ww2/8B
         jXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TAPXDo2+mkNk79YuRIAXULFMjD5KTMr/lWvkWqA4+1E=;
        b=lWaJYLUopjFk+1vc7UOLDLuNpWJVXlGAkwYTx93MCdvCX3JAlrUBMlKEKen9ljpyRx
         MTtcDMk4sw9y+vooiO9lcPSsAOTV7l3QlYWcjgCsVM+TbjZFuA1aINEOQ3s0AYNmxYW9
         9t67I0WGiJMcuP6FbfzczoFnTioDoXePRT2XAaL9NRnIISWJ//UMSWFZruH74UjL53w9
         8Kp5AAFCyjcNWi8o/1/x5DnZO5aPUWLYKhQ/9RL+PQNSQCVb/y72WVgetOLgfI+Bx84r
         jSNr99zLy4wh+hmRLxdZDjgpwR5ihQ+3EB7G9SYAW0TivolqhANVM+grYBUVDr6/WQlp
         J0cQ==
X-Gm-Message-State: AOAM533ly9Z9fCS4KkzFoWW9It4WpA6wwUT/Yd2JUHnANwsgyyZRuaYL
        SvfwIVdtDJ4kgrvmcj1ZTNcnnEul3rOKmA==
X-Google-Smtp-Source: ABdhPJw98G3oWdvzMzNi24NxWbWQqvC2WBZMAqARfpo293f38WxSz4rf5owNvmb3WiqoP+KrPaGmnQ==
X-Received: by 2002:a5d:4532:: with SMTP id j18mr4893655wra.239.1617212126955;
        Wed, 31 Mar 2021 10:35:26 -0700 (PDT)
Received: from arch-x1c3.. ([2a00:5f00:102:0:6e1d:cfb9:fb12:552d])
        by smtp.gmail.com with ESMTPSA id 12sm4714200wmw.43.2021.03.31.10.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 10:35:26 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v3 0/9] Microchip SAMA5D4 VPU support et al
Date:   Wed, 31 Mar 2021 18:35:11 +0100
Message-Id: <20210331173520.184191-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This is hopefully the final revision, adding support for the Microchip
SAMA5D4 VPU, which it based on the Hantro G1.

For more details, please see the v2 cover letter.
https://lore.kernel.org/linux-media/20210311154055.3496076-1-emil.l.velikov@gmail.com

Changes since v2:
 - Added RB (thanks Eze)
 - Added AB (thanks Nicolas)
 - Reworked Hantro driver to support modules lacking irq/clk name
   (thanks RobH and Eze)
 - Dropped defconfig patches - merged separatelly (thanks Nicolas)

Note: patches 6/9, 7/9 and 9/9 need reviews. Everything else has been
covered already.

Thanks
Emil

Emil Velikov (9):
  media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
  media: hantro: imx: reuse MB_DIM define
  media: hantro: imx: remove duplicate dec_base init
  media: hantro: imx: remove unused include
  media: hantro: introduce hantro_g1.c for common API
  media: hantro: add fallback handling for single irq/clk
  media: dt-bindings: Document SAMA5D4 VDEC bindings
  media: hantro: add initial SAMA5D4 support
  ARM: dts: sama5d4: enable Hantro G1 VDEC

 .../media/microchip,sama5d4-vdec.yaml         |  59 +++++++++
 arch/arm/boot/dts/sama5d4.dtsi                |   7 ++
 drivers/staging/media/hantro/Kconfig          |  10 +-
 drivers/staging/media/hantro/Makefile         |   4 +
 drivers/staging/media/hantro/hantro_drv.c     |  27 +++-
 drivers/staging/media/hantro/hantro_g1.c      |  39 ++++++
 .../media/hantro/hantro_g1_mpeg2_dec.c        |   5 +-
 drivers/staging/media/hantro/hantro_hw.h      |   4 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  27 +---
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  36 +-----
 .../staging/media/hantro/sama5d4_vdec_hw.c    | 117 ++++++++++++++++++
 11 files changed, 273 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
 create mode 100644 drivers/staging/media/hantro/hantro_g1.c
 create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c

-- 
2.31.1

