Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0233A715F
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 23:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232621AbhFNVe5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 17:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhFNVe5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 17:34:57 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9292C061574;
        Mon, 14 Jun 2021 14:32:53 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id h11-20020a05600c350bb02901b59c28e8b4so339148wmq.1;
        Mon, 14 Jun 2021 14:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mSLFpqCFvhFn8KCCGqKAz67zbpuQJXU2DAY29FvcEiI=;
        b=JcqGS/5o2IR20zU/dai2yiHCFg8fo8eaIQzOmhqGqG2IuzmOD1BENSwkGvpIXuqMIS
         RCaKL9BAPoaJOJkfSx2gVL2DKk6W6psnz/HblWMENOhywll6McxJsdRCYgJ88a521qRI
         1PDE5Wz2z9EXL7iQwmIpU5MIV3+unrWYQ8mgDJp0kSydpBG7E0a1CPQmAmr5NBZWGMmp
         DntGesjULn3FNaGxFxA4XCFJHxHW2XWKKVXJlRuQQlQJCiPTzEsamBlgWfGRt/isjdGP
         SL4K55mH7CHiAXdodZNueITpL3PjJmTQL555vBznN+n1hmiMMvLBG3694NyNhoUFI3Ns
         uXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mSLFpqCFvhFn8KCCGqKAz67zbpuQJXU2DAY29FvcEiI=;
        b=AHzPeJfQ9mdzs7PSnYQxHh1ChH0TbViHQc/r4vNQ+3PQuE5IqqkTQx+0JH2aWaz1+l
         Uiw4o/I6OFea99blfDrDVXrXWQHGacOeVUhEIaHzoMX4l0UzY6L2z/5Km6Oa31pNEtBL
         Syq1rK9RKA9aIkCl4FyXQTIAONp4/U/1jto2Hbglssccn83uRBss51WUG+UjEfVwXHO4
         RXByI4WnRF25O2DQLAQVAL5ASmu2MS6IK0gBRoNpg2CeyOn5gotqTeq5LIdlHKFMRqBm
         Fqd5ZlL/qGu2pDZAGlXQ3VfjpQ6fKUCGR0oAMyisZtQSEE+7bH/dyNnEPOtl6WDChv36
         SyWw==
X-Gm-Message-State: AOAM5330f8Cdtmjyza2n9bTY3tsXFpBUAlxSX7r/E3x2qnXvrrKwNZSj
        DXdAHiPBKlxdEi5CtCqDVw==
X-Google-Smtp-Source: ABdhPJxoFf74Xcs042qLAxcjBYXgiLQWokLs1r14gREF+IVR+8p4FTNQ2GYH/EHuLNt/doSFg24O2w==
X-Received: by 2002:a05:600c:a45:: with SMTP id c5mr1246082wmq.153.1623706372451;
        Mon, 14 Jun 2021 14:32:52 -0700 (PDT)
Received: from localhost.localdomain ([91.67.75.139])
        by smtp.googlemail.com with ESMTPSA id g23sm989525wmk.3.2021.06.14.14.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 14:32:51 -0700 (PDT)
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
Subject: [PATCH v3 0/6] Add support for older Rockchip SoCs to V4L2 hantro and rkvdec drivers
Date:   Mon, 14 Jun 2021 23:32:09 +0200
Message-Id: <20210614213215.99389-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi list,

this is v3 of series, that adds support for older Rockchip SoCs (RK3036,
RK3066, RK3188 and RK322x) to the existing V4L2 video decoder/-encoder
drivers - namely hantro and rkvdec.
They can be used as-is or with very little modifications.

In preparation to that previous versions added power-controller support for
RK3036 and RK322x, since both drivers rely on pm. The drivers for them
exist already in the common Rockchip pm driver, they just haven't been
added to the device trees yet.
Those patches have been applied already.

This is a basically a rebase of the patches that should get merged in
media_tree.
Please pick the DT patches, which are not applied yet from v2.

Changes in v3:
- rebased on current media_tree
- collected Reviewd-tags from v2 

Changes in v2:
- reordered patches as suggested by Heiko
- fixed indentation and order issues in dt-bindings / DT patches
- added patch to reorder variants in hantro alphanumeric
- added patch that merges hantro platform drivers for Rockchip in one
- added missing DT patch for RK3036 (missed to submit with v1)

See individual patches for details about changes.

Thanks for your feedback,
Alex.

Alex Bee (6):
  dt-bindings: media: rockchip-vpu: add new compatibles
  dt-bindings: media: rockchip-vdec: add RK3228 compatible
  media: hantro: reorder variants
  media: hantro: merge Rockchip platform drivers
  media: hantro: add support for Rockchip RK3066
  media: hantro: add support for Rockchip RK3036

 .../bindings/media/rockchip,vdec.yaml         |  10 +-
 .../bindings/media/rockchip-vpu.yaml          |  33 +-
 drivers/staging/media/hantro/Makefile         |   9 +-
 drivers/staging/media/hantro/hantro_drv.c     |   6 +-
 drivers/staging/media/hantro/hantro_hw.h      |  32 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  | 208 -------
 drivers/staging/media/hantro/rk3399_vpu_hw.c  | 222 --------
 ...jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} |  30 +-
 ...eg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} |  25 +-
 ...w_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} |   2 +-
 ...rk3399_vpu_regs.h => rockchip_vpu2_regs.h} |   6 +-
 .../staging/media/hantro/rockchip_vpu_hw.c    | 526 ++++++++++++++++++
 12 files changed, 616 insertions(+), 493 deletions(-)
 delete mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
 delete mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw.c
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} (87%)
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_mpeg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} (94%)
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} (99%)
 rename drivers/staging/media/hantro/{rk3399_vpu_regs.h => rockchip_vpu2_regs.h} (99%)
 create mode 100644 drivers/staging/media/hantro/rockchip_vpu_hw.c


base-commit: 45040f675041956ad763f9ef139ecee3647aa8bb
-- 
2.27.0

