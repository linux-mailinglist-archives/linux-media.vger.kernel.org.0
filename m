Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECEB5B05F8
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 16:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiIGODF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 10:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiIGODE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 10:03:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4079174DF1
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 07:03:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVvdr-0004C4-Ac; Wed, 07 Sep 2022 16:02:59 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVvdn-004S1D-Sa; Wed, 07 Sep 2022 16:02:57 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVvdo-009yg8-ES; Wed, 07 Sep 2022 16:02:56 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v8 0/4] usb: gadget: uvc: use configfs entries for negotiation and v4l2 VIDIOCS
Date:   Wed,  7 Sep 2022 16:02:50 +0200
Message-Id: <20220907140254.2378109-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series improves the uvc video gadget by parsing the configfs
entries. With the configfs data, the driver now is able to negotiate the
format with the usb host in the kernel and also exports the supported
frames/formats/intervals via the v4l2 VIDIOC interface.

The uvc userspace stack is also under development. One example is an generic
v4l2uvcsink gstreamer elemnt, which is currently under discussion. [1]

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1304

With the libusbgx library [1] used by the gadget-tool [2] it is now also
possible to fully describe the configfs layout of the uvc gadget with scheme
files.

[2] https://github.com/linux-usb-gadgets/libusbgx/pull/61/commits/53231c76f9d512f59fdc23b65cd5c46b7fb09eb4

[3] https://github.com/linux-usb-gadgets/gt/tree/master/examples/systemd

The bigger picture of these patches is to provide a more versatile interface to
the uvc gadget. The goal is to simply start a uvc-gadget with the following
commands:

$ gt load uvc.scheme
$ gst-launch v4l2src ! v4l2uvcsink

--

v1: https://lore.kernel.org/linux-usb/20210530222239.8793-1-m.grzeschik@pengutronix.de/
v2: https://lore.kernel.org/linux-usb/20211117004432.3763306-1-m.grzeschik@pengutronix.de/
v3: https://lore.kernel.org/linux-usb/20211117122435.2409362-1-m.grzeschik@pengutronix.de/
v4: https://lore.kernel.org/linux-usb/20211205225803.268492-1-m.grzeschik@pengutronix.de/
v5: https://lore.kernel.org/linux-usb/20211209084322.2662616-1-m.grzeschik@pengutronix.de/
v6: https://lore.kernel.org/linux-usb/20220105115527.3592860-1-m.grzeschik@pengutronix.de/
v7: https://lore.kernel.org/linux-usb/20220608105748.139922-1-m.grzeschik@pengutronix.de/

Regards,
Michael

Michael Grzeschik (4):
  media: v4l: move helper functions for fractions from uvc to v4l2-common
  media: uvcvideo: move uvc_format_desc to common header
  usb: gadget: uvc: add VIDIOC function
  usb: gadget: uvc: add format/frame handling code

 drivers/media/usb/uvc/uvc_ctrl.c        |   1 +
 drivers/media/usb/uvc/uvc_driver.c      | 290 +----------------
 drivers/media/usb/uvc/uvc_v4l2.c        |  14 +-
 drivers/media/usb/uvc/uvcvideo.h        | 147 ---------
 drivers/media/v4l2-core/v4l2-common.c   |  86 +++++
 drivers/usb/gadget/function/f_uvc.c     | 270 +++++++++++++++-
 drivers/usb/gadget/function/uvc.h       |  39 ++-
 drivers/usb/gadget/function/uvc_queue.c |   3 +-
 drivers/usb/gadget/function/uvc_v4l2.c  | 413 +++++++++++++++++++++---
 drivers/usb/gadget/function/uvc_video.c |  71 +++-
 include/media/v4l2-common.h             |   4 +
 include/media/v4l2-uvc.h                | 359 ++++++++++++++++++++
 12 files changed, 1196 insertions(+), 501 deletions(-)
 create mode 100644 include/media/v4l2-uvc.h

-- 
2.30.2

