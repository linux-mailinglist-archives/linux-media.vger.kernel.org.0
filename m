Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84EF3521491
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238928AbiEJMDM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233692AbiEJMDK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75F3165AB
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:12 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AB14824;
        Tue, 10 May 2022 13:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183950;
        bh=znKOnW5DcqLMT8bFMMoINNY9WM5rEJCjpMdpXf5v+rw=;
        h=From:To:Cc:Subject:Date:From;
        b=eeq7smbayk60Wfi6+KKDizZtI11nTitTH0JY2Xq35lDd5noFO/s4DgEwSDRb0ldMs
         eIbQgGcpQ6CczUU2dSuLCrq5igQGP3TgbHwywBjGpT92Jbs8P8KtjPaFSCSQaJptiF
         xfChI8SaZ7IyTt+7dHQfYrQbEEc7t5AfuK4huTUM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 00/50] staging: media: imx: Prepare destaging of imx7-media-csi
Date:   Tue, 10 May 2022 14:58:09 +0300
Message-Id: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series prepares the imx7-media-csi for destaging by
decoupling it from the helpers shared with the i.MX6 IPUv3.

The strategy Paul and I have followed is to import copies of helper code
and, refactor it within the imx7-media-csi driver, and repeat until no
more shared helpers are used. There is still room for refactoring and
simplification of the imx7-media-csi driver, but I believe it is now in
a state clean enough to be moved out of staging.

The series also includes a few fixes or improvements in supported
formats that are now made possible thanks to this refactoring. See
patches 45/50 and 46/50 for details.

The code size has grown as a result. This is partly offset by code in
the shared helpers that can be removed or simplified, but I haven't
starting working on that. The helpers are now used for the i.MX6 IPUv3
only, so I will leave this exercise to anyone who would be interested in
destaging that driver as well.

Some of the items in the TODO file related to the imx7-media-csi driver
have been addressed. The two remaining items are frame interval monitor
support and restricting the list of supported formats to the SoC
version. The former isn't a destaging blocker in my opinion, as the
feature can be added later if desired (and frame interval monitoring
should then be moved to the V4L2 core). I believe the latter could also
be addressed after destaging the driver, but in any case, this is a
discussion for a future destaging series (which may come as soon as this
one is accepted).

Alexander, this also could greatly simplify your "[PATCH v3 0/8]
imx7/imx8mm media / csi patches" series.

Laurent Pinchart (48):
  staging: media: imx: imx7-media-csi: Initialize locks early on
  staging: media: imx: imx7-media-csi: Split imx_media_dev from probe()
  staging: media: imx: imx7-media-csi: Import notifier helpers
  staging: media: imx: imx7-media-csi: Drop duplicate link creation
  staging: media: imx: imx7-media-csi: Drop the imx_media notifier
  staging: media: imx: imx7-media-csi: Don't populate vdev lists
  staging: media: imx: imx7-media-csi: Drop unused frame_interval
  staging: media: imx: imx7-media-csi: Move format init to probe time
  staging: media: imx: imx7-media-csi: Import video device helpers
  staging: media: imx: imx7-media-csi: Drop legacy video device support
  staging: media: imx: imx7-media-csi: Drop unused controls support
  staging: media: imx: imx7-media-csi: Reorganize imx7_csi structure
  staging: media: imx: imx7-media-csi: Fold capture_priv into imx7_csi
  staging: media: imx: imx7-media-csi: Ensure consistent function prefix
  staging: media: imx: imx7-media-csi: Don't set subdev group id
  staging: media: imx: imx7-media-csi: Import imx_media_dev_init()
    helper
  staging: media: imx: imx7-media-csi: Embed imx_media_dev in imx7_csi
  staging: media: imx: imx7-media-csi: Drop imx_media_add_video_device
    call
  staging: media: imx: imx7-media-csi: Don't initialize unused fields
  staging: media: imx: imx7-media-csi: Inline imx_media_pipeline_pad()
  staging: media: imx: imx7-media-csi: Import
    imx_media_pipeline_set_stream()
  staging: media: imx: imx7-media-csi: Avoid unnecessary casts
  staging: media: imx: imx7-media-csi: Inline pipeline start/stop
  staging: media: imx: imx7-media-csi: Fold imx_media_dev into imx7_csi
  staging: media: imx: imx7-media-csi: Decouple from imx_media_buffer
  staging: media: imx: imx7-media-csi: Fold imx_media_video_dev into
    imx7_csi
  staging: media: imx: imx7-media-csi: Store imx7_csi in drv data
  staging: media: imx: imx7-media-csi: Decouple from imx_media_dma_buf
  staging: media: imx: imx7-media-csi: Decouple from shared macros
  staging: media: imx: imx7-media-csi: Drop error message on alloc
    failure
  staging: media: imx: imx7-media-csi: Import format helpers
  staging: media: imx: imx7-media-csi: Replace ipu_color_space with bool
    yuv field
  staging: media: imx: imx7-media-csi: Drop IC support from
    imx7_csi_try_colorimetry()
  staging: media: imx: imx7-media-csi: Drop IPU-only formats
  staging: media: imx: imx7-media-csi: Drop unsupported YUV and RGB
    formats
  staging: media: imx: imx7-media-csi: Make default formats consistent
  staging: media: imx: imx7-media-csi: Define macro for default mbus
    code
  staging: media: imx: imx7-media-csi: Simplify default mbus code in
    try_fmt
  staging: media: imx: imx7-media-csi: Drop YUV/RGB/BAYER format
    selectors
  staging: media: imx: imx7-media-csi: Drop unneeded imx7_csi_pixfmt
    fields
  staging: media: imx: imx7-media-csi: Inline imx7_csi_init_mbus_fmt()
  staging: media: imx: imx7-media-csi: Simplify default format in
    try_fmt
  staging: media: imx: imx7-media-csi: Fix list of supported formats
  staging: media: imx: imx7-media-csi: Add V4L2_PIX_FMT_Y14 support
  staging: media: imx: imx7-media-csi: Drop unneeded pixel format
    validation
  staging: media: imx: imx7-media-csi: Inline
    imx7_csi_enum_pixel_formats()
  staging: media: imx: imx7-media-csi: Drop V4L2 events support
  staging: media: imx: imx7-media-csi: Drop usage of shared helpers

Paul Elder (2):
  staging: media: imx: imx7-media-csi: Move misc init out of probe()
  staging: media: imx: imx7-media-csi: Remove imx_media_of_add_csi

 drivers/staging/media/imx/imx7-media-csi.c | 1370 +++++++++++++++++---
 1 file changed, 1172 insertions(+), 198 deletions(-)


base-commit: c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a
-- 
Regards,

Laurent Pinchart

