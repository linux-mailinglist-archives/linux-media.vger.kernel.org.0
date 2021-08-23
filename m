Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00813F47BA
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 11:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhHWJi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 05:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbhHWJi3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 05:38:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF4BC061575
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 02:37:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E69362A5
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 11:37:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629711465;
        bh=mxklVLY2ZkysWhXXYsj4ebZ4qAzHeEI8J+b2x01jmxQ=;
        h=Date:From:To:Subject:From;
        b=uLKk5/KT12QZ5PpTJIZtDy5TkOwNobtO4MHVW55WC4xShurZ2ZucS8BXDruwg68eU
         G/IFnqt4j3CDMScsCfHTeq6YRmgLtEQyYyauHrLJ2BvE8QQjQs7NJWANs2Oo1epK5o
         K8ErFmMZvLQ8SAoPR/c+D9Q55DgMsl0Tv4n4dQCY=
Date:   Mon, 23 Aug 2021 12:37:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.16] uvcvideo v4l2-compliance fixes
Message-ID: <YSNsXylafQPuKH4H@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit d62cd4d277cc711f781a7bdec4109c6148529b25:

  media: uvcvideo: Remove unused including <linux/version.h> (2021-08-21 09:11:04 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/uvc-next-20210823

for you to fetch changes up to 2bc2b78476b4bc5690186c2b9a4dd565be6a9913:

  media: uvcvideo: Don't spam the log in uvc_ctrl_restore_values() (2021-08-23 12:31:04 +0300)

This contains a subset of "[PATCH v10 00/21] Fix v4l2-compliance errors"
as 17 out of the 21 patches are ready to go and don't need to be
delayed.

----------------------------------------------------------------
- uvcvideo v4l2-compliance fixes

----------------------------------------------------------------
Hans Verkuil (1):
      media: uvcvideo: Don't spam the log in uvc_ctrl_restore_values()

Ricardo Ribalda (16):
      media: v4l2-ioctl: Fix check_ext_ctrls
      media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
      media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
      media: v4l2-ioctl: S_CTRL output the right value
      media: uvcvideo: Remove s_ctrl and g_ctrl
      media: uvcvideo: Set capability in s_param
      media: uvcvideo: Return -EIO for control errors
      media: uvcvideo: refactor __uvc_ctrl_add_mapping
      media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
      media: uvcvideo: Use dev->name for querycap()
      media: uvcvideo: Set unique vdev name based in type
      media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
      media: uvcvideo: Use control names from framework
      media: uvcvideo: Check controls flags before accessing them
      media: uvcvideo: Set error_idx during ctrl_commit errors
      media: docs: Document the behaviour of uvcvideo driver

 .../userspace-api/media/v4l/vidioc-g-ctrl.rst      |   3 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   3 +
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |   4 -
 drivers/media/usb/uvc/uvc_ctrl.c                   | 260 ++++++++++++++++-----
 drivers/media/usb/uvc/uvc_driver.c                 |  15 +-
 drivers/media/usb/uvc/uvc_metadata.c               |   2 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   | 105 ++++-----
 drivers/media/usb/uvc/uvc_video.c                  |   5 +
 drivers/media/usb/uvc/uvcvideo.h                   |  17 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |  67 ++++--
 10 files changed, 317 insertions(+), 164 deletions(-)

-- 
Regards,

Laurent Pinchart
