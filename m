Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64BED722EB0
	for <lists+linux-media@lfdr.de>; Mon,  5 Jun 2023 20:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbjFESaa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jun 2023 14:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbjFESa3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jun 2023 14:30:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3044CD
        for <linux-media@vger.kernel.org>; Mon,  5 Jun 2023 11:30:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156242094.26.openmobile.ne.jp [126.156.242.94])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84854E4
        for <linux-media@vger.kernel.org>; Mon,  5 Jun 2023 20:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685989802;
        bh=tGobFrWSOT3WLYgY929uYRon/ALWcr3HYXaKH17Vj8U=;
        h=Date:From:To:Subject:From;
        b=WYaxHS9Y0koNqPoy0arSdt9FdGBAeqjU1ysjFegnel2jg4did6H6UEMYQZtO+Yet+
         yslZq57J5DTDymXVibplji7qT5IbPcEzAXzjdRcQglOEXxnpKDlQyDEG4UUSsH52xu
         n/zxKzwdGao5l/cxGiwAosMNgwx8q/JMezu3Cfa0=
Date:   Mon, 5 Jun 2023 21:30:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.5] uvcvideo changes
Message-ID: <20230605183025.GA22339@pendragon.ideasonboard.com>
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

The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:

  Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-uvc-next-20230606

for you to fetch changes up to 9bfc8e4d0972d3732bd8c6038c2bf1636780d727:

  media: uvcvideo: Constify descriptor buffers (2023-06-05 18:39:47 +0300)

Please note that this pull request is based on v6.4-rc5 as it depends on
a fix that was merged in that version.

----------------------------------------------------------------
Miscellaneous uvcvideo changes:

- Support for more Intel RealSense devices
- Small cleanups and constifications
- Drop duplicate device

----------------------------------------------------------------
Dmitry Perchanov (2):
      media: uapi: v4l: Intel metadata format update
      media: uvcvideo: Enable Intel RealSense metadata for devices

Laurent Pinchart (7):
      media: uvcvideo: Rename uvc_streaming 'format' field to 'formats'
      media: uvcvideo: Rename uvc_format 'frame' field to 'frames'
      media: uvcvideo: Use clamp() to replace manual implementation
      media: uvcvideo: Reorganize format descriptor parsing
      media: uvcvideo: Increment intervals pointer at end of parsing
      media: uvcvideo: Constify formats, frames and intervals
      media: uvcvideo: Constify descriptor buffers

Sakari Ailus (1):
      Revert "media: uvcvideo: Limit power line control for Acer EasyCamera"

 .../userspace-api/media/v4l/pixfmt-meta-d4xx.rst   |  55 +++++++--
 drivers/media/usb/uvc/uvc_driver.c                 | 137 ++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c                   |  79 ++++++------
 drivers/media/usb/uvc/uvc_video.c                  |  20 +--
 drivers/media/usb/uvc/uvcvideo.h                   |  12 +-
 5 files changed, 208 insertions(+), 95 deletions(-)


-- 
Regards,

Laurent Pinchart
