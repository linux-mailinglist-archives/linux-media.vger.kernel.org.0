Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C944F5929DC
	for <lists+linux-media@lfdr.de>; Mon, 15 Aug 2022 08:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241099AbiHOGww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Aug 2022 02:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiHOGwv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Aug 2022 02:52:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E4C1B7A6
        for <linux-media@vger.kernel.org>; Sun, 14 Aug 2022 23:52:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3148A48F;
        Mon, 15 Aug 2022 08:52:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660546368;
        bh=uf3APt0sRKjQSCO0zctZGynyGISSZToO4UD4cU0cDJo=;
        h=From:To:Cc:Subject:Date:From;
        b=c3rylOC8d9a9hu0/X/CtSHcyNIGPNFcJayOSUNGlgQFBPzz0WYhFuP3SEBHzC3YSR
         HsHuqHyFh70igsljUkp7zNTncv+dSPZ9iznWbkxeWZn0cJfi2Sm2LlLMUTSCmSEOL1
         mDfura3UFKQlAY0sAzaLNmLYnRxhKgbrodpPSQec=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH 0/7] media: rkisp1: Fix and improve color space support
Date:   Mon, 15 Aug 2022 09:52:28 +0300
Message-Id: <20220815065235.23797-1-laurent.pinchart@ideasonboard.com>
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

Patch 3/7 fixes a bug in the ISP source pad configuration, which allowed
setting a Bayer output format with a YUV input format, a clearly invalid
configuration. Patch then 4/7 mimicks patch 2/7 by allowing setting of
color space fields on the source pad.

The last three patches configure the RGB to YUV matrix (in the CSM
module) using the ISP source pad YCbCr encoding. Patch 5/7 fixes a small
bug in color space handling that resulted in the sink pad quantization
controlling the ISP output, instead of using the source pad
quantization. Patch 6/7 is a small internal API refactoring, and finally
patch 7/7 handles the CSM configuration.

If anyone is curious about how the matrix coefficients of patch 7/7 have
been computed, see the script posted in [1] that will be merged in
libcamera.

[1] https://lists.libcamera.org/pipermail/libcamera-devel/2022-August/033183.html

Laurent Pinchart (7):
  media: rkisp1: Initialize color space on sink and source pads
  media: rkisp1: Allow setting color space on ISP sink pad
  media: rkisp1: Fix source pad format configuration
  media: rkisp1: Allow setting all color space fields on ISP source pad
  media: rkisp1: Configure quantization using ISP source pad
  media: rkisp1: Don't pass the quantization to rkisp1_csm_config()
  media: rkisp1: Configure CSM based on YCbCr encoding

 .../platform/rockchip/rkisp1/rkisp1-common.h  |   5 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 139 ++++++++++++++++--
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 105 +++++++++----
 3 files changed, 207 insertions(+), 42 deletions(-)

-- 
Regards,

Laurent Pinchart

