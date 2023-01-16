Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1350B66BF8B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 14:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbjAPNS0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 08:18:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjAPNR4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 08:17:56 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6815F3ABB
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 05:16:31 -0800 (PST)
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by lahtoruutu.iki.fi (Postfix) with ESMTPS id DFF5D1B0007F
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 15:16:28 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1673874988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=lzFq2ugiYgi7HI3Ix0bQXNNFwZMTPlYffm/oqXKNm/w=;
        b=RDz1SGPDITwHH4bsejRxlryL3d7L4ffNZgoJYTLJTQChNii6/CiFIn2PUmcrEhY5BAB2HK
        iZCEq+m5f752HVaiN3aAjd80LHWjQG0A33AVtdz60d+zReYAPGHdXVKvHaVKZB5vxxv4sJ
        NGtgZs0zOJ2vDpt/3wV4akPE+otIcH1WbOo2eJYVMyEw75ooDY3KcOU7cfTzGi3LJx8i/4
        Mo9NF0uCA4OJ86QGlcFblpeNl/JHdD4HWOfPPxstMDPuNFVj6ueP3O4mez633MOsHech0r
        RsLhiFElLtNd5kvGZr9x6mGv2Mgd6EMCEVJU8x/fVZIR5OUO9h6HKulDZV490A==
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id C8F0620059;
        Mon, 16 Jan 2023 15:16:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1673874982;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=lzFq2ugiYgi7HI3Ix0bQXNNFwZMTPlYffm/oqXKNm/w=;
        b=xL2E2KKJcNnZCHR7HV8k5TM8I4U0lrKWvwNCkywxvF2V5/8FuDdKesvhc60bP0OPbw8q89
        EJ8Nax008q+b5VBwbZq4qm5IiKcvMg+B0Qe/ZoIAlNg8S6nfc67SsJaVutKD//GHxKFrZv
        5zvqcLHVzv9gi1E4BmhJhHO3AG3Z3gk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1673874982;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=lzFq2ugiYgi7HI3Ix0bQXNNFwZMTPlYffm/oqXKNm/w=;
        b=PVjmxALi358pivUFeZvE6cbQ82+7uYy4BhqC1SPNiZq+d/kWv7kf4BnU2RlKONHkSSRtNj
        R3Q6tMRUsKymiUyy6PgnTD+7vC/HglL+jzVnLOB5ilD8ogk/nqdZ9Mk67Qcwm+7+PNgFLn
        /U0BUwEKG+NfwCd+YW+JpsD0gJzm7wU=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1673874982; a=rsa-sha256; cv=none;
        b=G3EzbccnPg3cId4NdDUf8mUKykZj7Q2SyxCn5dggNdwOdsYWwDRvPT+ETMZAnEMIHWKoIQ
        3zUzjYsk2Wgf+2REJ4arakU1yOXy3qzMLiymr/ARmPflLphh9VkziWhCFOXdUqATHXrzw/
        HL3ft0r2aKfB84qbjfrbDiUfThVSJCw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5DF5B634C91;
        Mon, 16 Jan 2023 15:16:22 +0200 (EET)
Date:   Mon, 16 Jan 2023 15:16:22 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     tomi.valkeinen@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: [GIT PULL FOR 6.3 v2] V4L2 streams support
Message-ID: <Y8VOJs7v1/Oogum7@valkosipuli.retiisi.eu>
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

since v1:

- Fix documentation build and compile warnings.

Please pull.


The following changes since commit 6599e683db1bf22fee74302c47e31b9a42a1c3d2:

  Merge tag 'v6.2-rc1' into media_tree (2022-12-28 16:07:44 +0000)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/streams-6.3-2-signed

for you to fetch changes up to 314a1ebb85475f982dc18069558ed6d3e64f2866:

  media: Documentation: Update documentation for streams (2023-01-16 12:27:08 +0200)

----------------------------------------------------------------
Streams for v6.3

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
 drivers/media/v4l2-core/v4l2-subdev.c              | 1002 +++++++++++++++++++-
 include/media/v4l2-subdev.h                        |  377 ++++++++
 include/uapi/linux/v4l2-subdev.h                   |   74 +-
 16 files changed, 1786 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst

-- 
Kind regards,

Sakari Ailus
