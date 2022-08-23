Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEA959EB82
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 20:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbiHWSyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 14:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbiHWSyA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 14:54:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F49696D9
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 10:19:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 636602B3;
        Tue, 23 Aug 2022 19:18:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661275125;
        bh=49xrcDCLNlgNRSAc2wESf7BFtB31vRQ1ZmEo/buMFZc=;
        h=From:To:Cc:Subject:Date:From;
        b=YWzv3GDYWf1z/l75hrGq8+C01OiGK2VLakd1HfpUUNMeX/TCfang/7xS2jWC1IGl/
         N6H1KY/gKqIY5Tg/Dns9zazik1bh12QN00kDxM2b8t2cjwANmFgECnp/kUQ6shmkrf
         TLxn7G2lVvYZG4U5hwcZBqJWmHKS/Psmj93FZYxU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 0/9] media: rkisp1: Fix and improve color space support
Date:   Tue, 23 Aug 2022 20:18:31 +0300
Message-Id: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series fixes and improves color space support in the rkisp1
driver.

The first two patches initialize the color space fields to default
values on the ISP subdev video sink and source pads, and allow setting
the color space on the ISP sink pad (this has no influence on the ISP
configuration, and only serves to propagate the correct color space on
the pipeline).

Patch 3/9 fixes a bug in the ISP source pad configuration, which allowed
setting a Bayer output format with a YUV input format, a clearly invalid
configuration. Patch then 4/9 mimicks patch 2/9 by allowing setting of
color space fields on the source pad.

The next three patches configure the RGB to YUV matrix (in the CSM
module) using the ISP source pad YCbCr encoding. Patch 5/9 fixes a small
bug in color space handling that resulted in the sink pad quantization
controlling the ISP output, instead of using the source pad
quantization. Patch 6/9 is a small internal API refactoring, and finally
patch 7/9 handles the CSM configuration.

Patches 8/9 and 9/9 mimick 1/9 and 2/9 for the resizer subdevs, allowing
propagation of the color space along the pipeline.

If anyone is curious about how the matrix coefficients of patch 7/9 have
been computed, see the script posted in [1] that will be merged in
libcamera.

[1] https://lists.libcamera.org/pipermail/libcamera-devel/2022-August/033183.html

Laurent Pinchart (9):
  media: rkisp1: Initialize color space on ISP sink and source pads
  media: rkisp1: Allow setting color space on ISP sink pad
  media: rkisp1: Fix source pad format configuration
  media: rkisp1: Allow setting all color space fields on ISP source pad
  media: rkisp1: Configure quantization using ISP source pad
  media: rkisp1: Don't pass the quantization to rkisp1_csm_config()
  media: rkisp1: Configure CSM based on YCbCr encoding
  media: rkisp1: Initialize color space on resizer sink and source pads
  media: rkisp1: Allow setting color space on resizer sink pad

 .../platform/rockchip/rkisp1/rkisp1-common.h  |   5 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 139 ++++++++++++++++--
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 105 +++++++++----
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  45 +++++-
 4 files changed, 249 insertions(+), 45 deletions(-)

-- 
Regards,

Laurent Pinchart

