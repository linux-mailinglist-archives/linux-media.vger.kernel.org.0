Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E03F7D6AFB
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 14:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234591AbjJYMPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 08:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbjJYMPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 08:15:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FAF2C1
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 05:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698236138; x=1729772138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WabHAD4busd1z1bidWgD7edRvbWlU8Js8ByHWHH3kmM=;
  b=e2taHDBngFNnYneUcQIlGFLOXECsRxd4OgSUVtwGbHsKu4sQsdlmaCHA
   agreT8ZKhOclxdGlsXDClind5ABvv7QI9TaQgRTBDwES7Nc7Dzz58W+pb
   6bCnxlzB9mEDe/WZRVuvsnvsq8KT9dRqEDq83Dt2Z+V0G1Dy4cDifw3UF
   uajdqv1i456mbmUymw5/O5+l2d7PBStEa2YOZ0JI+pcWzlT93Lx9MmZIz
   DiJL0o6Q+BVuQWgouufKZXYG6+NODt4Pwqz6bFwqEh1HYDuA5oDEJPGPp
   crYaQykZFdteFbEjlkLZomfpnUqufG5xw7vZ9sLH6jfD1St+RP7JAg1dp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="387110842"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="387110842"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 05:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="762431512"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="762431512"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 05:15:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2F5B111F82E;
        Wed, 25 Oct 2023 15:15:31 +0300 (EEST)
Date:   Wed, 25 Oct 2023 12:15:31 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 14/15] Documentation: add Intel IPU6 ISYS driver
 admin-guide doc
Message-ID: <ZTkG40snprJhk8UW@kekkonen.localdomain>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-15-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024112924.3934228-15-bingbu.cao@intel.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Tue, Oct 24, 2023 at 07:29:23PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> This document mainly describe the functionality of IPU6 and
> IPU6 isys driver, and gives an example that how user can do
> imaging capture with tools.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  Documentation/admin-guide/media/ipu6-isys.rst |  159 +++
>  .../admin-guide/media/ipu6_isys_graph.svg     |  338 +++++
>  .../admin-guide/media/ipu6_isys_multi.svg     | 1124 +++++++++++++++++
>  .../admin-guide/media/v4l-drivers.rst         |    1 +
>  4 files changed, 1622 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
>  create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
>  create mode 100644 Documentation/admin-guide/media/ipu6_isys_multi.svg
> 
> diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/admin-guide/media/ipu6-isys.rst
> new file mode 100644
> index 000000000000..fb4d355e1522
> --- /dev/null
> +++ b/Documentation/admin-guide/media/ipu6-isys.rst
> @@ -0,0 +1,159 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: <isonum.txt>
> +
> +===============================================================
> +Intel Image Processing Unit 6 (IPU6) Input System driver
> +===============================================================

Too many '='s.

> +
> +Copyright |copy| 2023 Intel Corporation
> +
> +Introduction
> +============
> +
> +This file documents the Intel IPU6 (6th generation Image Processing Unit)
> +Input System (MIPI CSI2 receiver) drivers located under
> +drivers/media/pci/intel/ipu6.
> +
> +The Intel IPU6 can be found in certain Intel Chipsets but not in all SKUs:
> +
> +* TigerLake
> +* JasperLake
> +* AlderLake
> +* RaptorLake
> +* MeteorLake
> +
> +Intel IPU6 is made up of two components - Input System (ISYS) and Processing
> +System (PSYS).
> +
> +The Input System mainly works as MIPI CSI2 receiver which receives and
> +processes the imaging data from the sensors and outputs the frames to memory.
> +
> +There are 2 driver modules - intel_ipu6 and intel_ipu6_isys. intel_ipu6 is an
> +IPU6 common driver which does PCI configuration, firmware loading and parsing,
> +firmware authentication, DMA mapping and IPU-MMU (internal Memory mapping Unit)
> +configuration. intel_ipu6_isys implements V4L2, Media Controller and V4L2
> +sub-device interfaces. The IPU6 ISYS driver supports camera sensors connected
> +to the IPU6 ISYS through V4L2 sub-device sensor drivers.
> +
> +.. Note:: See Documentation/driver-api/media/drivers/ipu6.rst for more
> +	  information about the IPU6 hardware.

A direct reference would be nice.

> +
> +
> +Input system driver
> +===================
> +
> +The input System driver mainly configures CSI2 DPHY, constructs the firmware
> +stream configuration, sends commands to firmware, gets response from hardware
> +and firmware and then returns buffers to user.
> +The ISYS is represented as several V4L2 sub-devices - 'Intel IPU6 CSI2 $port',
> +which provide V4L2 subdev interfaces to the user space, there are also several
> +video nodes for each CSI-2 stream capture - 'Intel IPU6 ISYS capture $num' which
> +provide interface to user to set formats, queue buffers and streaming.
> +
> +.. kernel-figure::  ipu6_isys_graph.svg
> +   :alt: ipu6 isys media graph without multiple streams support
> +
> +   ipu6 isys media graph without multiple streams support
> +
> +.. kernel-figure::  ipu6_isys_multi.svg
> +   :alt: ipu6 isys media graph with multiple streams support
> +
> +   ipu6 isys media graph with multiple streams support

Is there a reason for having links from the CSI-2 receivers' source pads to
multiple video nodes? Isn't a single one enough?

> +
> +Capturing frames by IPU6 ISYS
> +------------------------------------
> +
> +IPU6 ISYS is used to capture frames from the camera sensors connected to the
> +CSI2 ports. The supported input formats of ISYS are listed in table below:
> +
> +.. tabularcolumns:: |p{0.8cm}|p{4.0cm}|p{4.0cm}|
> +
> +.. flat-table::
> +    :header-rows: 1
> +
> +    * - IPU6 ISYS supported input formats
> +
> +    * - RGB565, RGB888
> +
> +    * - UYVY8, YUYV8
> +
> +    * - RAW8, RAW10, RAW12
> +
> +Here is an example of IPU6 ISYS raw capture on Dell XPS 9315 laptop. On this
> +machine, ov01a10 sensor is connected to IPU ISYS CSI2 port 2, which can
> +generate images at sBGGR10 with resolution 1280x800.
> +
> +Using the media controller APIs, we can configure ov01a10 sensor by
> +media-ctl [#f1]_ and yavta [#f2]_ to transmit frames to IPU6 ISYS.
> +
> +.. code-block:: none
> +
> +    # Example 1 capture frame from ov01a10 camera sensor
> +    # This example assumes /dev/media0 as the IPU ISYS media device
> +    export MDEV=/dev/media0
> +
> +    # Establish the link for the media devices using media-ctl
> +    media-ctl -d $MDEV -l "\"ov01a10 3-0036\":0 -> \"Intel IPU6 CSI2 2\":0[1]"
> +
> +    # Set the format for the media devices
> +    media-ctl -d $MDEV -V "ov01a10:0 [fmt:SBGGR10/1280x800]"
> +    media-ctl -d $MDEV -V "Intel IPU6 CSI2 2:0 [fmt:SBGGR10/1280x800]"
> +    media-ctl -d $MDEV -V "Intel IPU6 CSI2 2:1 [fmt:SBGGR10/1280x800]"
> +
> +Once the media pipeline is configured, desired sensor specific settings
> +(such as exposure and gain settings) can be set, using the yavta tool.
> +
> +e.g
> +
> +.. code-block:: none
> +
> +    # and that ov01a10 sensor is connected to i2c bus 3 with address 0x36
> +    export SDEV=$(media-ctl -d $MDEV -e "ov01a10 3-0036")
> +
> +    yavta -w 0x009e0903 400 $SDEV
> +    yavta -w 0x009e0913 1000 $SDEV
> +    yavta -w 0x009e0911 2000 $SDEV
> +
> +Once the desired sensor settings are set, frame captures can be done as below.
> +
> +e.g
> +
> +.. code-block:: none
> +
> +    yavta --data-prefix -u -c10 -n5 -I -s 1280x800 --file=/tmp/frame-#.bin \
> +          -f SBGGR10 $(media-ctl -d $MDEV -e "Intel IPU6 ISYS Capture 0")
> +
> +With the above command, 10 frames are captured at 1280x800 resolution with
> +sBGGR10 format. The captured frames are available as /tmp/frame-#.bin files.
> +
> +Here is another example of IPU6 ISYS RAW and metadata capture from camera
> +sensor ov2740 on Lenovo X1 Yoga laptop.
> +
> +.. code-block:: none
> +
> +    media-ctl -l "\"ov2740 14-0036\":0 -> \"Intel IPU6 CSI2 1\":0[1]"
> +    media-ctl -l "\"Intel IPU6 CSI2 1\":1 -> \"Intel IPU6 ISYS Capture 0\":0[5]"
> +    media-ctl -l "\"Intel IPU6 CSI2 1\":2 -> \"Intel IPU6 ISYS Capture 1\":0[5]"
> +
> +    # set routing
> +    media-ctl -v -R "\"Intel IPU6 CSI2 1\" [0/0->1/0[1],0/1->2/1[1]]"
> +
> +    media-ctl -v "\"Intel IPU6 CSI2 1\":0/0 [fmt:SGRBG10/1932x1092]"
> +    media-ctl -v "\"Intel IPU6 CSI2 1\":0/1 [fmt:GENERIC_8/97x1]"
> +    media-ctl -v "\"Intel IPU6 CSI2 1\":1/0 [fmt:SGRBG10/1932x1092]"
> +    media-ctl -v "\"Intel IPU6 CSI2 1\":2/1 [fmt:GENERIC_8/97x1]"
> +
> +    CAPTURE_DEV=$(media-ctl -e "Intel IPU6 ISYS Capture 0")
> +    ./yavta --data-prefix -c100 -n5 -I -s1932x1092 --file=/tmp/frame-#.bin \
> +    -f SGRBG10 ${CAPTURE_DEV}
> +
> +    CAPTURE_META=$(media-ctl -e "Intel IPU6 ISYS Capture 1")
> +    ./yavta --data-prefix -c100 -n5 -I -s97x1 -B meta-capture \
> +    --file=/tmp/meta-#.bin -f GENERIC_8 ${CAPTURE_META}
> +
> +References
> +==========
> +
> +.. [#f1] https://git.ideasonboard.org/?p=media-ctl.git;a=summary
> +.. [#f2] https://git.ideasonboard.org/yavta.git

-- 
Regards,

Sakari Ailus
