Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43C56673A1
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 14:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbjALNwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 08:52:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjALNwu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 08:52:50 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6814FCCF
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 05:52:49 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkv67ytyxtq-05sj69vvy-3.rev.dnainternet.fi [IPv6:2001:14ba:4475:b040:1383:7fec:bcfa:ec62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 9D4F01B001DE;
        Thu, 12 Jan 2023 15:52:46 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1673531566;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=ybVvIxXi9A0CE71GXRpUptJLeMJ8S05kBLLA3Gr9i4I=;
        b=qBBwfuC0HlNjBzO9D56eTypuAI1pdV50+vR17STZIQw1PUdu/SVOHRVdrKdHgLzf1jY33y
        lMXhp0/ZUrmZTHvRd27/347kt3or57OYXzy3n2YI31FHl6Rgg7SfoDlO+eJ67jxrolUGpS
        tVTkI3UD7nOSJDSHK8IOPA5CZky02CBt+/LvouULQaQ1OOjVW4PNsXnkloP/fUYDbrNSPO
        KtM9qKtzgtEHtG4HnArRf2NFdZnu8IoiKH7IyM2E4xb+2qhQmqKpMQmZS5AQUSddOJ0u4C
        QVAVu+jv77SSK35oO7NeEIBxQU53ggodxMnCrttuwEyBtee1bTdVLxxN608hbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1673531566;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=ybVvIxXi9A0CE71GXRpUptJLeMJ8S05kBLLA3Gr9i4I=;
        b=GfNobQDDtjTABOT9Eh8OsVjRn9GU4rHOVcoSlFaUAh9rA98Y/YOnOohiyDr/F/d1UXpDDl
        +Z816IFrJbZUmyIoMp2hwqOsFgH78u2hvFiv6mSnTPn1zubeMlmDPMG7BvLWMUcSI+7Y/p
        2Ac0f3Q8NiqV228h/S+OCW1YNd+Jysri8RanIPV0wRfHAt2wq+4s4kD/Ef3jVM/owJ/MC1
        wl/ZJ3fU+EYjtiZ0i559VE/uA2bi1QhkJhawwwCCErWrKOQlWJNNXcq+KF4rwpVOGZYzlo
        fs4tWkZi2BZX5p/EKDsPtHeP9cUhqAb1MI3S5NapmtS6W/UDWq7JXajKjRkKvg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1673531566; a=rsa-sha256;
        cv=none;
        b=dgqIxHaeOVqgIV5MmQCiIyvvEaaIPETpPgvF0CIWc3I9ISXSRRIsDRb/IaWHlwBnl5XP7U
        x+OLWNv2zvOr8WEEkX0A7BX0UTKeyzCrsGI4c+YkA5p+ZqmUho6dysBVBcqS8sNNSvi+SZ
        Vz6ZIN3Oap32n/U72jfvX4eZ65TpCTx0ASFPzOflxZfVlSimpiAEfLQu2S14zEOP4ojltK
        DvSjCs5cYH9nv5Mjzp5YQ01czI3t70stWOR3kO7hMjjkfNBRrlgGuOcSOrpwhQ6h4V0Bcf
        tGy25LWzgZB2EhT9DUJwk2yWy8DvSXgv0uqa3VNGolrrgD1Z4lcou5VSRFaeeQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 316CA634C91;
        Thu, 12 Jan 2023 15:52:46 +0200 (EET)
Date:   Thu, 12 Jan 2023 15:52:46 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     tomi.valkeinen@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: [GIT PULL FOR 6.3] V4L2 streams support
Message-ID: <Y8AQrlr3sR2itMcC@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This set contains support for multiple streams over a single MC link, a set
that has been out of tree for more than five years, has worked on by more
than five people in their turns. I think it is now ready for upstream.

Source sub-devices with multiple streams aren't supported yet but the
intent is to add the support soon.

Using the new APII requires setting v4l2_subdev_enable_streams_api in
drivers/media/v4l2-core/v4l2-subdev.c to true, so no new API is exposed to
the user space quite yet. The intent is also to change this soon, possibly
for 6.3 but may well slip to 6.4.

Please pull.


The following changes since commit 6599e683db1bf22fee74302c47e31b9a42a1c3d2:

  Merge tag 'v6.2-rc1' into media_tree (2022-12-28 16:07:44 +0000)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/streams-6.3-signed

for you to fetch changes up to 544460242d995547fae963141fd4101579969191:

  media: Documentation: Update documentation for streams (2023-01-12 15:36:16 +0200)

----------------------------------------------------------------
V4L2 streams for 6.3

----------------------------------------------------------------
Jacopo Mondi (2):
      media: Documentation: Add GS_ROUTING documentation
      media: subdev: Add for_each_active_route() macro

Laurent Pinchart (5):
      media: subdev: Add [GS]_ROUTING subdev ioctls and operations
      media: subdev: add v4l2_subdev_routing_validate() helper
      media: v4l2-subdev: Add v4l2_subdev_state_xlate_streams() helper
      media: v4l2-subdev: Add subdev .(enable|disable)_streams() operations
      media: v4l2-subdev: Add v4l2_subdev_s_stream_helper() function

Sakari Ailus (2):
      media: Add stream to frame descriptor
      media: Documentation: Update documentation for streams

Tomi Valkeinen (12):
      media: v4l2-subdev: Sort includes
      media: add V4L2_SUBDEV_FL_STREAMS
      media: add V4L2_SUBDEV_CAP_STREAMS
      media: subdev: Require code change to enable [GS]_ROUTING
      media: subdev: add v4l2_subdev_has_pad_interdep()
      media: subdev: add v4l2_subdev_set_routing helper()
      media: Documentation: add multiplexed streams documentation
      media: subdev: add stream based configuration
      media: subdev: use streams in v4l2_subdev_link_validate()
      media: subdev: add "opposite" stream helper funcs
      media: subdev: add streams to v4l2_subdev_get_fmt() helper function
      media: subdev: add v4l2_subdev_set_routing_with_fmt() helper

 .clang-format                                      |    1 +
 Documentation/driver-api/media/v4l2-subdev.rst     |    8 +
 .../userspace-api/media/v4l/dev-subdev.rst         |  166 ++++
 .../userspace-api/media/v4l/user-func.rst          |    1 +
 .../v4l/vidioc-subdev-enum-frame-interval.rst      |    5 +-
 .../media/v4l/vidioc-subdev-enum-frame-size.rst    |    5 +-
 .../media/v4l/vidioc-subdev-enum-mbus-code.rst     |    5 +-
 .../media/v4l/vidioc-subdev-g-crop.rst             |    5 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst              |    5 +-
 .../media/v4l/vidioc-subdev-g-frame-interval.rst   |    5 +-
 .../media/v4l/vidioc-subdev-g-routing.rst          |  147 +++
 .../media/v4l/vidioc-subdev-g-selection.rst        |    5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   25 +-
 drivers/media/v4l2-core/v4l2-subdev.c              | 1000 +++++++++++++++++++-
 include/media/v4l2-subdev.h                        |  377 ++++++++
 include/uapi/linux/v4l2-subdev.h                   |   74 +-
 16 files changed, 1784 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
Kind regards,

Sakari Ailus
