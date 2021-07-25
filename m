Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3D53D5098
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 01:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhGYWdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 18:33:49 -0400
Received: from www.linuxtv.org ([130.149.80.248]:49708 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhGYWds (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 18:33:48 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1m7nK5-005Jb8-Kc; Sun, 25 Jul 2021 23:14:17 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1m7nOn-0004KP-Ur; Sun, 25 Jul 2021 23:19:10 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.15] Camera sensor, async and documentation patches (#75977)
Date:   Sun, 25 Jul 2021 23:19:09 +0000
Message-Id: <20210725231909.16596-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725223621.GB3@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210725223621.GB3@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/127109/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20210725223621.GB3@valkosipuli.retiisi.eu

gpg: Signature made Sun 25 Jul 2021 08:39:10 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key


Build aborted due to a fatal error:
FAILED: patch patch patches/0018-v4l-async-Rename-async-nf-functions-clean-up-long-li.patch doesn't apply:
Applying patch patches/0018-v4l-async-Rename-async-nf-functions-clean-up-long-li.patch
patching file Documentation/driver-api/media/v4l2-subdev.rst
patching file drivers/media/i2c/max9286.c
patching file drivers/media/i2c/st-mipid02.c
patching file drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
patching file drivers/media/platform/am437x/am437x-vpfe.c
patching file drivers/media/platform/atmel/atmel-isc-base.c
patching file drivers/media/platform/atmel/atmel-isi.c
patching file drivers/media/platform/atmel/atmel-sama5d2-isc.c
Hunk #1 succeeded at 512 (offset 17 lines).
Hunk #2 succeeded at 531 (offset 17 lines).
patching file drivers/media/platform/atmel/atmel-sama7g5-isc.c
patching file drivers/media/platform/cadence/cdns-csi2rx.c
patching file drivers/media/platform/davinci/vpif_capture.c
patching file drivers/media/platform/exynos4-is/media-dev.c
patching file drivers/media/platform/marvell-ccic/cafe-driver.c
patching file drivers/media/platform/marvell-ccic/mcam-core.c
patching file drivers/media/platform/marvell-ccic/mmp-driver.c
patching file drivers/media/platform/omap3isp/isp.c
patching file drivers/media/platform/pxa_camera.c
patching file drivers/media/platform/qcom/camss/camss.c
patching file drivers/media/platform/rcar-vin/rcar-core.c
patching file drivers/media/platform/rcar-vin/rcar-csi2.c
patching file drivers/media/platform/rcar_drif.c
patching file drivers/media/platform/renesas-ceu.c
patching file drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
patching file drivers/media/platform/stm32/stm32-dcmi.c
patching file drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
patching file drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
patching file drivers/media/platform/ti-vpe/cal.c
Hunk #1 succeeded at 781 (offset 88 lines).
Hunk #2 FAILED at 705.
Hunk #3 succeeded at 805 (offset 88 lines).
Hunk #4 succeeded at 814 (offset 88 lines).
1 out of 4 hunks FAILED -- rejects in file drivers/media/platform/ti-vpe/cal.c
patching file drivers/media/platform/video-mux.c
patching file drivers/media/platform/xilinx/xilinx-vipp.c
patching file drivers/media/v4l2-core/v4l2-async.c
patching file drivers/media/v4l2-core/v4l2-fwnode.c
patching file drivers/staging/media/imx/imx-media-csi.c
patching file drivers/staging/media/imx/imx-media-dev-common.c
patching file drivers/staging/media/imx/imx-media-dev.c
patching file drivers/staging/media/imx/imx-media-of.c
patching file drivers/staging/media/imx/imx6-mipi-csi2.c
patching file drivers/staging/media/imx/imx7-media-csi.c
patching file drivers/staging/media/imx/imx7-mipi-csis.c
patching file drivers/staging/media/tegra-video/vi.c
patching file include/media/v4l2-async.h
patching file include/media/v4l2-fwnode.h
Patch patches/0018-v4l-async-Rename-async-nf-functions-clean-up-long-li.patch does not apply (enforce with -f)

