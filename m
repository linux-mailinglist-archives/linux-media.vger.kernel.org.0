Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B32440F872
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244801AbhIQM7T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244821AbhIQM7S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:59:18 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEF3C061767
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:57:56 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id g16so15035167wrb.3
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TmSUd1g256AwM6GPkCVL8KzZlMuiVA8rcald4HgLdWY=;
        b=Vojsq/qATfqaLlBx4GBlzY1M3WQZBkET3/mYiL3HkeYBMyHzWtJbjHthyfck3N2imY
         cOchlbwuXK/iJL6FTVNRR4N6LsDzg5ueKC6Q/busloEZbIggqb55XCgGJc5u+W6/q1Sc
         C3F2brFPLgR81rImVQ/fzY1R8cBgz8gBVfsLVqJeh3G9HxBG0VqAwdbdGikzpDS42CE9
         ofZWBpM1Dyv1TFNfej7D0ZCxUYMFOKLR0gPEgxl3cicBjY9FSggM8IL0jVct8KiT/Ctm
         6Dr2o3sqhUQ9wRKHM2Se+EoGr+ehAxcbcAFY6nNObaZgFuVZTxRftv90jKjlNW6Xwtc/
         fmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TmSUd1g256AwM6GPkCVL8KzZlMuiVA8rcald4HgLdWY=;
        b=r6ot0Rkv8bNbPPnbJyL5WfuijTo9szVKCd7dR/7bjoIPsdmzwJCBq964b5UuROYGl2
         Tl5/TDB+CVkfDXsG/KHklJF399AZcYFzijMJS8JIprtvT1saM+XYmzExe06SHZMEaFib
         IRmysSBpFbJTnbb3F8hQbxOYY5byJT1SZu67wSnmgzePYOyPjtxov4jjFFutQN4J3N+9
         jZcewYodFj2yd7RbbcXt4N6r2Z/OZ7uNAn4kSDYmZ+fe1RA1AvLXnqEnqnGWlQbXF7BG
         y3iQzJfx+YjlmkHGCgO22X8o+JayWoDLVgQxtPk2MceXpgEOAu4qYJ3Ka8WYxn2FS2zC
         +dbQ==
X-Gm-Message-State: AOAM531tVF89u87P0DCjbQN526GppgyjhyZQkSWN0pXJVS4yzmc8BQit
        8dDtWzBCbhsErmNQRFCGMCcBWg==
X-Google-Smtp-Source: ABdhPJwUld7Y82YW6Rc8Pz69DPxiv4IUt7DfWDhYwTVj5a1Rbt107Ifh+5ZTcTCPWcgP4Ahl8EgU4Q==
X-Received: by 2002:adf:b781:: with SMTP id s1mr11968492wre.165.1631883474593;
        Fri, 17 Sep 2021 05:57:54 -0700 (PDT)
Received: from localhost.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f3sm6358636wmj.28.2021.09.17.05.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:57:53 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        matthias.bgg@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        sumit.semwal@linaro.org
Cc:     christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, khilman@baylibre.com,
        gpain@baylibre.com, Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 0/4]  Add a DRM driver to support AI Processing Unit (APU)
Date:   Fri, 17 Sep 2021 14:59:41 +0200
Message-Id: <20210917125945.620097-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds a DRM driver that implements communication between the CPU and an
APU.
This uses VirtIO buffer to exchange messages.
For the data, we allocate a GEM object and map it using IOMMU to make it
available to the APU.
The driver is relatively generic, and should work with any SoC implementing
hardware accelerator for AI if they use support remoteproc and VirtIO.

For the people interested by the firmware or userspace library,
the sources are available here:
https://github.com/BayLibre/open-amp/tree/v2020.01-mtk/apps/examples/apu

This RFC is a rewrite of a previous RFC that was not using DRM:
https://patchwork.kernel.org/project/linux-remoteproc/cover/20200930115350.5272-1-abailon@baylibre.com/

Alexandre Bailon (4):
  dt-bindings: Add bidings for mtk,apu-drm
  DRM: Add support of AI Processor Unit (APU)
  rpmsg: Add support of AI Processor Unit (APU)
  ARM64: mt8183-pumpkin: Add the APU DRM device

 .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |   6 +
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/apu/Kconfig                   |  10 +
 drivers/gpu/drm/apu/Makefile                  |   7 +
 drivers/gpu/drm/apu/apu_drm_drv.c             | 238 +++++++
 drivers/gpu/drm/apu/apu_gem.c                 | 232 +++++++
 drivers/gpu/drm/apu/apu_internal.h            |  89 +++
 drivers/gpu/drm/apu/apu_sched.c               | 634 ++++++++++++++++++
 drivers/rpmsg/Kconfig                         |  10 +
 drivers/rpmsg/Makefile                        |   1 +
 drivers/rpmsg/apu_rpmsg.c                     | 184 +++++
 include/drm/apu_drm.h                         |  59 ++
 include/uapi/drm/apu_drm.h                    | 106 +++
 15 files changed, 1617 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
 create mode 100644 drivers/gpu/drm/apu/Kconfig
 create mode 100644 drivers/gpu/drm/apu/Makefile
 create mode 100644 drivers/gpu/drm/apu/apu_drm_drv.c
 create mode 100644 drivers/gpu/drm/apu/apu_gem.c
 create mode 100644 drivers/gpu/drm/apu/apu_internal.h
 create mode 100644 drivers/gpu/drm/apu/apu_sched.c
 create mode 100644 drivers/rpmsg/apu_rpmsg.c
 create mode 100644 include/drm/apu_drm.h
 create mode 100644 include/uapi/drm/apu_drm.h

-- 
2.31.1

