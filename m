Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE9B5F3019
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 14:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJCMTW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 08:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiJCMTV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 08:19:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CF438466
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 05:19:20 -0700 (PDT)
Received: from desky.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 592E7440;
        Mon,  3 Oct 2022 14:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664799559;
        bh=VMwLNh1cjBxkG/n5NeQMkPBd7pVk/Yo+RnXxj9aMbPw=;
        h=From:To:Cc:Subject:Date:From;
        b=d2npNWfMksCtvG34c1uHCOAsQEpL68cFMeLW6su6Cz7DcHeAb+tVb7we/m84JZ7w1
         7SDqMjuIACBWPUR5O+P8lfLgnaCHtw+EBKBTEt49RA9aQsHs9PVWQsRJxTpI/UCnpa
         LTe5GHhBdREIQnXwNiucscNYj3vg/fSj46SodWWI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v15 00/19] v4l: routing and streams support
Date:   Mon,  3 Oct 2022 15:18:33 +0300
Message-Id: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is v15 of the streams series. The v14 can be found from:

https://lore.kernel.org/all/20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com/

My work branch with additional drivers can be found from:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git streams/work-v15

And there's also the v4l-utils series v2 to add support to v4l2-ctl and
media-ctl:

https://lore.kernel.org/all/20220714132116.132498-1-tomi.valkeinen@ideasonboard.com/

This series is based on top of linux-media-stage, and this series is now
smaller as many patches from v14 have been merged.

Changes in v15:

media: v4l2-subdev: Sort includes
- New patch

media: add V4L2_SUBDEV_CAP_STREAMS
- Small refactor to use 'streams_subdev' variable

media: Documentation: Add GS_ROUTING documentation
- Improve error code descriptions

media: subdev: Add [GS]_ROUTING subdev ioctls and operations
- Return E2BIG when there are too many routes in VIDIOC_SUBDEV_S_ROUTING
- Use plain bitshift in the uapi header instead of _BITUL()
- V4L2_SUBDEV_ROUTE_FL_SOURCE is now bit 1, so if you have userspace which uses V4L2_SUBDEV_ROUTE_FL_SOURCE, you need to recompile

media: subdev: add v4l2_subdev_set_routing helper()
- Check for overflow in v4l2_subdev_set_routing()

media: subdev: add stream based configuration
- Fix compilation for !CONFIG_VIDEO_V4L2_SUBDEV_API or !CONFIG_MEDIA_CONTROLLER

media: subdev: use streams in v4l2_subdev_link_validate()
- Modify link validation to use 64bit streams-mask instead of collecting stream IDs into allocated arrays. This simplifies the functions quite a bit.

 Tomi


Jacopo Mondi (2):
  media: Documentation: Add GS_ROUTING documentation
  media: subdev: Add for_each_active_route() macro

Laurent Pinchart (5):
  media: subdev: Add [GS]_ROUTING subdev ioctls and operations
  media: subdev: add v4l2_subdev_routing_validate() helper
  media: v4l2-subdev: Add v4l2_subdev_state_xlate_streams() helper
  media: v4l2-subdev: Add subdev .(enable|disable)_streams() operations
  media: v4l2-subdev: Add v4l2_subdev_s_stream_helper() function

Sakari Ailus (1):
  media: Add stream to frame descriptor

Tomi Valkeinen (11):
  media: v4l2-subdev: Sort includes
  media: add V4L2_SUBDEV_FL_STREAMS
  media: add V4L2_SUBDEV_CAP_STREAMS
  media: subdev: add v4l2_subdev_has_pad_interdep()
  media: subdev: add v4l2_subdev_set_routing helper()
  media: Documentation: add multiplexed streams documentation
  media: subdev: add stream based configuration
  media: subdev: use streams in v4l2_subdev_link_validate()
  media: subdev: add "opposite" stream helper funcs
  media: subdev: add streams to v4l2_subdev_get_fmt() helper function
  media: subdev: add v4l2_subdev_set_routing_with_fmt() helper

 .clang-format                                 |   1 +
 .../driver-api/media/v4l2-subdev.rst          |   8 +
 .../userspace-api/media/v4l/dev-subdev.rst    | 175 ++++
 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../v4l/vidioc-subdev-enum-frame-interval.rst |   5 +-
 .../v4l/vidioc-subdev-enum-frame-size.rst     |   5 +-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      |   5 +-
 .../media/v4l/vidioc-subdev-g-crop.rst        |   5 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
 .../v4l/vidioc-subdev-g-frame-interval.rst    |   5 +-
 .../media/v4l/vidioc-subdev-g-routing.rst     | 155 +++
 .../media/v4l/vidioc-subdev-g-selection.rst   |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  25 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 991 +++++++++++++++++-
 include/media/v4l2-subdev.h                   | 377 +++++++
 include/uapi/linux/v4l2-subdev.h              |  83 +-
 16 files changed, 1801 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
2.34.1

