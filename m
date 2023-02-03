Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4DC689311
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 10:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbjBCJGV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 04:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbjBCJGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 04:06:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364A1875A4
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 01:06:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA0AD890
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 10:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675415175;
        bh=zFhB1r4kuUh7523l1JjmIRUfuSGKRMJ4gDy9AxGLevQ=;
        h=Date:From:To:Subject:From;
        b=P9OPi5pwPZXmSHaB3aw9RZJ16HHd9tTlwgEYBsQ53jgbB0Ugzv9r+YZEdfREdGml7
         zrusmvjeKvgThJfAFmkg4ECGbjfa7IlKYomhhz1kPxJpdDVeRrVW+zeVfFRQ8KKf5H
         bpO1wtRMY3xSnPTqJ2ZBoXJG6SLfqKvyuvfu5GM0=
Date:   Fri, 3 Feb 2023 11:06:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.2] imx7-media-csi changes
Message-ID: <Y9zOhQfN09AGh8GT@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-imx-csi-next-20230203

for you to fetch changes up to d27d7dbc84be0679816b66f49dac00542c3a80a3:

  media: imx: imx7-media-csi: Use V4L2 subdev active state (2023-02-03 11:03:19 +0200)

----------------------------------------------------------------
imx7-media-csi driver cleanups

----------------------------------------------------------------
Laurent Pinchart (8):
      media: imx: imx7-media-csi: Drop imx7_csi.cc field
      media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()
      media: imx: imx7-media-csi: Drop unneeded check when starting streaming
      media: imx: imx7-media-csi: Drop unneeded src_sd check
      media: imx: imx7-media-csi: Drop unneeded pad checks
      media: imx: imx7-media-csi: Cleanup errors in imx7_csi_async_register()
      media: imx: imx7-media-csi: Zero format struct before calling .get_fmt()
      media: imx: imx7-media-csi: Use V4L2 subdev active state

 drivers/media/platform/nxp/imx7-media-csi.c | 235 +++++++++-------------------
 1 file changed, 70 insertions(+), 165 deletions(-)

-- 
Regards,

Laurent Pinchart
