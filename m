Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495253932A7
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235470AbhE0Pqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235184AbhE0Pqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:46:38 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F057C061574;
        Thu, 27 May 2021 08:45:04 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id b9so753621ejc.13;
        Thu, 27 May 2021 08:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UMiOHR1uiQc7x+1YMV+1TXAaL2wJozSwYNysKOYYojw=;
        b=hOQxrOhodHvnR2rNflHrUYZZ6TPJDeV7uT8ifxABB2J1lJJHUDuylUHAm+aMdZ2IaG
         Di8/RvxPf3HJI5mKX0dAAsCM6Ozb9aWy+Cm8SiuriYT0mZ9HXSSkd/+gS83IhNWZdsjS
         KyPXBwJiJnT6hDIpmTYQGd8R9vRpL1yOmWdUPMPBx1QRNZY/NnQiHx/aEYiNO0fEqEn0
         bze6ET3GzRMzfHy5UerQoqnf1INuEarHVTPE5JqdvGKypp9fPCIFfjMtGd4kvxVraNd+
         G8tGI/YPv8jIyquwfCA/I6qXGNaW47Wi8AyFneQ/HkPNatrRhA+5UK06dFJIAZvht5mA
         07CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UMiOHR1uiQc7x+1YMV+1TXAaL2wJozSwYNysKOYYojw=;
        b=IXTbJVjZrPvNlFHgWSiRqq1Jb/7VZs8G6wq+2HmcjPc8qpE76mVgDgAHV/OWXi99NX
         4z0eD2ebg63iG6S+shWNtAKbfq5JDQze/zZkuLRyos4IXbJfNMmphzkMBSAmsyiybTYN
         rfuMn39dClN0RCDFTeYPKYAHtFYRBpvEC9lwNmCCSrqTPj8HQF032+aGnDwIVIjL3dYX
         taZNxoL5drLEzLzo+stq89sNZjVMFjbuquFLa6Lev8XcLFyhORYM6XRUavr5Jb2+s5Zy
         PNnpRju5GdOqXSEY3/Ldq/hAapAqkVU5vrdjq9FVyPdSLoScHy2okwau3kG+S8qg++zK
         fgUQ==
X-Gm-Message-State: AOAM5308r/SRiFq3tg1DJYfDOL+XujWuWxmV4m/lTpHf+Vbr4QsX/4RW
        jvahm4WM1EQorRQKWPLTmw==
X-Google-Smtp-Source: ABdhPJwHWleKrSYu2vhp8oAd6rpoMECMYvmzR3SmWfWw8iqIfZ4V8Ky3PrKEn080sdYKrqP78jvLvg==
X-Received: by 2002:a17:906:1dd1:: with SMTP id v17mr4491098ejh.31.1622130303091;
        Thu, 27 May 2021 08:45:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:02 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Alex Bee <knaerzche@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/12] Add support for older Rockchip SoCs to V4L2 hantro and rkvdec drivers
Date:   Thu, 27 May 2021 17:44:43 +0200
Message-Id: <20210527154455.358869-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi list,

this series adds support for older Rockchip SoCs (RK3036, RK3066, RK3188
and RK322x) to the existing V4L2 video decoder/-encoder drivers - namely
hantro and rkvdec.
They can be used as-is or with very little modifications.

In preparation to that patches 1,8 and 9 add power-controller support for
RK3036 and RK322x, since both drivers rely on pm. The drivers for them 
exist already in the common Rockchip pm driver, they just haven't be added
to the device trees yet.

Changes in v2:
- reordered patches as suggested by Heiko
- fixed indentation and order issues in dt-bindings / DT patches
- added patch to reorder variants in hantro alphanumeric
- added patch that merges hantro platform drivers for Rockchip in one
- added missing DT patch for RK3036 (missed to submit with v1)
See individual patches for details about changes.

Thanks for your feedback,
Alex.

Alex Bee (12):
  dt-bindings: mfd: syscon: add Rockchip RK3036/RK3228 qos compatibles
  dt-bindings: media: rockchip-vpu: add new compatibles
  dt-bindings: media: rockchip-vdec: add RK3228 compatible
  media: hantro: reorder variants
  media: hantro: merge Rockchip platform drivers
  media: hantro: add support for Rockchip RK3066
  media: hantro: add support for Rockchip RK3036
  ARM: dts: rockchip: add power controller for RK3036
  ARM: dts: rockchip: add power controller for RK322x
  ARM: dts: rockchip: add vpu node for RK3036
  ARM: dts: rockchip: add vpu nodes for RK3066 and RK3188
  ARM: dts: rockchip: add vpu and vdec node for RK322x

 .../bindings/media/rockchip,vdec.yaml         |  10 +-
 .../bindings/media/rockchip-vpu.yaml          |  33 +-
 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 arch/arm/boot/dts/rk3036.dtsi                 |  72 +++
 arch/arm/boot/dts/rk3066a.dtsi                |   4 +
 arch/arm/boot/dts/rk3188.dtsi                 |   5 +
 arch/arm/boot/dts/rk322x.dtsi                 | 140 ++++-
 arch/arm/boot/dts/rk3xxx.dtsi                 |  12 +
 drivers/staging/media/hantro/Makefile         |   9 +-
 drivers/staging/media/hantro/hantro_drv.c     |   6 +-
 drivers/staging/media/hantro/hantro_hw.h      |  30 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  | 208 -------
 drivers/staging/media/hantro/rk3399_vpu_hw.c  | 222 --------
 ...jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} |  30 +-
 ...eg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} |  25 +-
 ...w_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} |   2 +-
 ...rk3399_vpu_regs.h => rockchip_vpu2_regs.h} |   6 +-
 .../staging/media/hantro/rockchip_vpu_hw.c    | 526 ++++++++++++++++++
 18 files changed, 848 insertions(+), 494 deletions(-)
 delete mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
 delete mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw.c
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} (87%)
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_mpeg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} (93%)
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} (99%)
 rename drivers/staging/media/hantro/{rk3399_vpu_regs.h => rockchip_vpu2_regs.h} (99%)
 create mode 100644 drivers/staging/media/hantro/rockchip_vpu_hw.c


base-commit: 5d765451c2409e63563fa6a3e8005bd03ab9e82f
-- 
2.27.0

