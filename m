Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8AE56A115
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 13:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235433AbiGGLeY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 07:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235430AbiGGLeX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 07:34:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EB62FFC8
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 04:34:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09BD8D00
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 13:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657193660;
        bh=dcgg/F4Vpyt6WTJTjAv+OsJfObVTUi7y+zC/JanjN24=;
        h=Date:From:To:Subject:From;
        b=p6ehVVfTPhgnetGpnS5LvH/kG0JWRQeOWsIZMIXZ/DCvn3sckhEf6igkPY0thkKaZ
         Flk8IgZN2T1uPGew83Fz9DPVRIAAFSwc/aKYQ5+a4byYTwEKphRNey1mCIoaB8q5SC
         Cg03wmCe/vJAVIWmZMKWUvmByPM68UMtMIwx4E0s=
Date:   Thu, 7 Jul 2022 14:33:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.20] Prepare destaging of imx7-media-csi
Message-ID: <YsbEoobPgKoYcZUs@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit a111daf0c53ae91e71fd2bfe7497862d14132e3e:

  Linux 5.19-rc3 (2022-06-19 15:06:47 -0500)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/imx7-next-20220707

for you to fetch changes up to 9807fbcb3a46df948d19111c1a1edac8ee9e1883:

  staging: media: imx: imx7-media-csi: Drop usage of shared helpers (2022-07-07 14:33:17 +0300)

----------------------------------------------------------------
Prepare destaging of imx7-media-csi

----------------------------------------------------------------
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
      staging: media: imx: imx7-media-csi: Import imx_media_dev_init() helper
      staging: media: imx: imx7-media-csi: Embed imx_media_dev in imx7_csi
      staging: media: imx: imx7-media-csi: Drop imx_media_add_video_device call
      staging: media: imx: imx7-media-csi: Don't initialize unused fields
      staging: media: imx: imx7-media-csi: Inline imx_media_pipeline_pad()
      staging: media: imx: imx7-media-csi: Import imx_media_pipeline_set_stream()
      staging: media: imx: imx7-media-csi: Avoid unnecessary casts
      staging: media: imx: imx7-media-csi: Inline pipeline start/stop
      staging: media: imx: imx7-media-csi: Fold imx_media_dev into imx7_csi
      staging: media: imx: imx7-media-csi: Decouple from imx_media_buffer
      staging: media: imx: imx7-media-csi: Fold imx_media_video_dev into imx7_csi
      staging: media: imx: imx7-media-csi: Store imx7_csi in drv data
      staging: media: imx: imx7-media-csi: Decouple from imx_media_dma_buf
      staging: media: imx: imx7-media-csi: Decouple from shared macros
      staging: media: imx: imx7-media-csi: Drop error message on alloc failure
      staging: media: imx: imx7-media-csi: Import format helpers
      staging: media: imx: imx7-media-csi: Replace ipu_color_space with bool yuv field
      staging: media: imx: imx7-media-csi: Drop IC support from imx7_csi_try_colorimetry()
      staging: media: imx: imx7-media-csi: Drop IPU-only formats
      staging: media: imx: imx7-media-csi: Drop unsupported YUV and RGB formats
      staging: media: imx: imx7-media-csi: Make default formats consistent
      staging: media: imx: imx7-media-csi: Define macro for default mbus code
      staging: media: imx: imx7-media-csi: Simplify default mbus code in try_fmt
      staging: media: imx: imx7-media-csi: Drop YUV/RGB/BAYER format selectors
      staging: media: imx: imx7-media-csi: Drop unneeded imx7_csi_pixfmt fields
      staging: media: imx: imx7-media-csi: Inline imx7_csi_init_mbus_fmt()
      staging: media: imx: imx7-media-csi: Simplify default format in try_fmt
      staging: media: imx: imx7-media-csi: Fix list of supported formats
      staging: media: imx: imx7-media-csi: Add V4L2_PIX_FMT_Y14 support
      staging: media: imx: imx7-media-csi: Drop unneeded pixel format validation
      staging: media: imx: imx7-media-csi: Inline imx7_csi_enum_pixel_formats()
      staging: media: imx: imx7-media-csi: Drop V4L2 events support
      staging: media: imx: imx7-media-csi: Drop usage of shared helpers

Paul Elder (2):
      staging: media: imx: imx7-media-csi: Move misc init out of probe()
      staging: media: imx: imx7-media-csi: Remove imx_media_of_add_csi

 drivers/staging/media/imx/imx7-media-csi.c | 1381 ++++++++++++++++++++++++----
 1 file changed, 1183 insertions(+), 198 deletions(-)

-- 
Regards,

Laurent Pinchart
