Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 103F76C7E01
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 13:26:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbjCXM0p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 08:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjCXM0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 08:26:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612D61A971
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 05:26:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED58A62A8B
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 12:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9ECBC433D2;
        Fri, 24 Mar 2023 12:26:41 +0000 (UTC)
Message-ID: <040e5999-21f8-5e1d-f8cd-176173abffa3@xs4all.nl>
Date:   Fri, 24 Mar 2023 13:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ming Qian <ming.qian@nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] imx-jpeg: Add support for 12 bit extended jpeg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4i

for you to fetch changes up to dee124e49dc4393485630f31632bcc4ce5f2a466:

  media: imx-jpeg: Encoder add support for 12bit jpeg (2023-03-24 12:08:59 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ming Qian (10):
      media: Add P012 and P012M video format
      media: Add Y012 video format
      media: Add Y212 v4l2 format info
      media: Add YUV48_12 video format
      media: Add BGR48_12 video format
      media: Add ABGR64_12 video format
      media: imx-jpeg: Refine the function mxc_jpeg_find_format
      media: imx-jpeg: Clear slot next desc ptr if config error
      media: imx-jpeg: Decoder add support for 12bit jpeg
      media: imx-jpeg: Encoder add support for 12bit jpeg

 Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst |  28 ++++++
 Documentation/userspace-api/media/v4l/pixfmt-rgb.rst        |  42 +++++++++
 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst   |  15 ++++
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst |  94 ++++++++++++++++++++
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c           |  19 +++-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h           |   5 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c              | 326 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/media/v4l2-core/v4l2-common.c                       |   6 ++
 drivers/media/v4l2-core/v4l2-ioctl.c                        |   6 ++
 include/uapi/linux/videodev2.h                              |   8 ++
 10 files changed, 523 insertions(+), 26 deletions(-)
