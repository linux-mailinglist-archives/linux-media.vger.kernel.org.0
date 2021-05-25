Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E2B39052B
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhEYPYX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbhEYPYW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:24:22 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8667C061574;
        Tue, 25 May 2021 08:22:50 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id l1so47948208ejb.6;
        Tue, 25 May 2021 08:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rJhAY+6M6l3lkNZ5wHTPFgZbqVZ72qbN/7DTJLowWC4=;
        b=D/LO853/p6Nl37MX49Fv/VQHdZCSBjh0mK2hmYEGzTVGI7snRZimKGM834bmy4vYTj
         dZFlcoOPLWyfmzdu3Zqh6IaluSV7CBbOMicdhaqDmjd7J34UUpk2g+IjgpFokjxIDecH
         gF89kI6Q2YpxP7PjrAa81O9MnaZPR8QDCfYxngngpXVO2TjDLUjlDus4+/DcwHh4jO2w
         nV3lxcssUfiUCrYwhWoEPg77KPE/YU27CRg8DRNd2wiPzg2CwokxnwsMLqE4QaCjQ7at
         RFDWwKKhDEjXvladAm3hbPOZkZTZ57qJ8CY6Ck5kfDFel+YVdV/s+O6x9POV53uO2DQQ
         iZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rJhAY+6M6l3lkNZ5wHTPFgZbqVZ72qbN/7DTJLowWC4=;
        b=kge4KfvR43t7WW94M0LHWJzkyX3Lyo6Y5rKM5l1wq7JNfYTC9C62QZUIdUEnxVETl9
         DdRKeBMA2I/9nOc4iuQUpW07e+ZynzCVUglG3Y+9eVWv56XqvbK2enG/JB+Oy8HYdhwn
         FwLI/AoWlRnjRaMVGVxA18S/8R2RhwD6L0Wg6fVy+WvVv05la1Rf8m9fmyVae0s3s4Sg
         /2XlBDW/qoXR7919qdGIllDjFuTK11fJ3uYD1utSQo53gNQfRT8CZa2qApiZttuPW4wt
         h/vV81HfiIsZiwLb/iGpIKNw3p4zSKuACg9nj6K85ZrhqCLKgccw+5xuZSHveKaVrBnv
         0jAA==
X-Gm-Message-State: AOAM532h7BjZTOEa85QB5IueBanC7eLKEQPD1oSgy56RzLtwN+naCqRm
        kbVVErx5oU/86N1Y/fLnfA==
X-Google-Smtp-Source: ABdhPJzn83Td5nrvizOLNmEZVYvMJ+nRANBC4XkmMo16bcPJDx0FE2Y1K6MCW69SZLYQ5kRroa8O8w==
X-Received: by 2002:a17:906:f20e:: with SMTP id gt14mr28847790ejb.368.1621956169435;
        Tue, 25 May 2021 08:22:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:48 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 00/10] Add support for older Rockchip SoCs to V4L2 hantro and rkvdec drivers
Date:   Tue, 25 May 2021 17:22:15 +0200
Message-Id: <20210525152225.154302-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
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

In preparation to that patches 1-3 add power-controller support for RK3036
and RK322x, since both drivers rely on pm. The drivers for them exist
already in the common Rockchip pm driver, they just haven't be added to
the device trees yet.

Thanks for your feedback,
Alex.

Alex Bee (10):
  ARM: dts: rockchip: add power controller for RK322x
  ARM: dts: rockchip: add power controller for RK3036
  dt-bindings: mfd: syscon: add Rockchip RK3036/RK3228 qos compatibles
  media: hantro: add support for Rockchip RK3066
  media: hantro: add support for Rockchip RK3036
  ARM: dts: rockchip: add vpu nodes for RK3066 and RK3188
  ARM: dts: rockchip: add vpu node for RK322x
  media: dt-bindings: media: rockchip-vpu: add new compatibles
  ARM: dts: rockchip: add vdec node for RK322x
  media: dt-bindings: media: rockchip-vdec: add RK3228 compatible

 .../bindings/media/rockchip,vdec.yaml         |  10 +-
 .../bindings/media/rockchip-vpu.yaml          |  33 +++-
 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 arch/arm/boot/dts/rk3036.dtsi                 |  51 ++++++
 arch/arm/boot/dts/rk3066a.dtsi                |   4 +
 arch/arm/boot/dts/rk3188.dtsi                 |   5 +
 arch/arm/boot/dts/rk322x.dtsi                 | 139 ++++++++++++++-
 arch/arm/boot/dts/rk3xxx.dtsi                 |  12 ++
 drivers/staging/media/hantro/hantro_drv.c     |   2 +
 drivers/staging/media/hantro/hantro_hw.h      |   2 +
 drivers/staging/media/hantro/rk3288_vpu_hw.c  | 165 ++++++++++++++++++
 11 files changed, 414 insertions(+), 11 deletions(-)


base-commit: 5d765451c2409e63563fa6a3e8005bd03ab9e82f
-- 
2.27.0

