Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 558F97828D6
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 14:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbjHUMTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 08:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjHUMTF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 08:19:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7514CBE
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 05:19:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1278D741;
        Mon, 21 Aug 2023 14:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692620265;
        bh=5KePzG/O6w2+kgYF+Cw6Wne+11R+x1O3yUf15F9o78c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nb5Hc8I43DSrMfzq7Y7nQMjt769Ym+AHomV31xSMtM2zd88IWeofXbSHGRU8+7P1U
         qkKarptW5ucxNEjWKky7g02HEgaU+mdCFcr7frSnp1LGFvU0TSyiPkt9YOWkGSjVlH
         SY0q2OO4Ije0HCqVIXespKSZOD3mq+Qx6gTRECrM=
Date:   Mon, 21 Aug 2023 15:19:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Claus Stovgaard <claus.stovgaard@gmail.com>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
Message-ID: <20230821121908.GD10135@pendragon.ideasonboard.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
 <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
 <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
 <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Claus,

On Mon, Aug 21, 2023 at 12:07:59PM +0200, Claus Stovgaard wrote:
> On Mon, 2023-08-21 at 08:55 +0200, Claus Stovgaard wrote:
> > On Mon, 2023-08-21 at 14:22 +0800, Bingbu Cao wrote:
> > > 
> > > Claus,
> > > 
> > > 
> > > On 8/21/23 11:14 AM, Bingbu Cao wrote:
> > > 
> > > 
> > > I see that the ivsc driver has not been in master branch. Before
> > > that,
> > > could you try several hack to check whether camera can work on
> > > master?
> > > 
> > > https://github.com/bingbucao/linux/commits/ipu_dev
> > > 
> > > 7ebff51284d9 media: ov01a10: hack ivsc to make camera can work
> > > 01cc9f3d1b61 i2c: ljca: Call acpi_dev_clear_dependencies()
> > > 92e5d122e105 vsc: Defer firmware loading to avoid long probing time
> > > 5f5d5f0df06b driver: ivsc: add intel ivsc driver
> > > 0f4819dec533 Revert "gpio: Add support for Intel LJCA USB GPIO
> > > driver"
> > 
> > Thanks for your quick reply.
> > 
> > I was missing understanding of ivsc when I wrote the mail yesterday.
> > Got some basic understanding yesterday after I wrote, and big thanks
> > for confirming it, and also thanks for your ipu_dev branch. Has just
> > cloned it, and is building as I write.
> > 
> > Just fyi, I was trying to hack something together yesterday, and got
> > further, but not yet working.
> > 
> > My hack was to combine the out-of-tree ivsc drivers and firmware from
> > 
> > * https://github.com/intel/ivsc-firmware.git
> > * https://github.com/intel/ivsc-driver.git
> > 
> > Though noticed that I need some changes to the sensor driver so was
> > also building all the drivers from ipu6-drivers (with minor changes
> > to
> > get_pages) as out-of-tree modules.
> > 
> > * https://github.com/intel/ipu6-drivers.git 
> > 
> > Here I used everything beside media/pci/*.ko files. I could see the
> > sensor and got further, but was missing the last.
> > 
> > Looking forward to try your branch. Looks much cleaner, and would be
> > nice to get working :)
> 
> I got it to work on Dell XPS 9320.

I'm glad to hear this ! Even if PSYS support will be needed to make the
IPU6 truly usable, it is a very nice step in the right direction.

Would you be interested in adding initial support for the IPU6 in
libcamera ? :-) Given that only the ISYS is currently available, and
given the simplicity of the hardware, it may be as easy as a single line
addition.

> With some minor changes compared to your guide in Documentation/admin-
> guide/media/ipu6-isys.rst
> 
> [root@xps-1 ]# uname -a
> Linux xps-1 6.5.0-rc7-g7ebff51284d9 #1 SMP PREEMPT_DYNAMIC Mon Aug 21
> 09:02:20 CEST 2023 x86_64 GNU/Linux
> 
> [root@xps-1 ]# media-ctl -d /dev/media0 -p | tail -n10
> 
> - entity 2149: ov01a10 16-0036 (1 pad, 1 link)
>                type V4L2 subdev subtype Sensor flags 0
>                device node name /dev/v4l-subdev4
>         pad0: Source
>                 [fmt:SBGGR10_1X10/1280x800 field:none colorspace:raw
>                  crop.bounds:(0,0)/1296x816
>                  crop:(8,8)/1280x800]
>                 -> "Intel IPU6 CSI2 2":0 []
> 
> So i2c is 16-0036 - and we use it for setup like your guide.
> 
> export MDEV=/dev/media0
> 
> media-ctl -d $MDEV -l "\"ov01a10 17-0036\":0 -> \"Intel IPU6 CSI2
> 2\":0[1]"
> 
> media-ctl -d $MDEV -V "\"ov01a10 17-0036\":0 [fmt:SBGGR10/1280x800]"
> media-ctl -d $MDEV -V "\"Intel IPU6 CSI2 2\":0 [fmt:SBGGR10/1280x800]"
> media-ctl -d $MDEV -V "\"Intel IPU6 CSI2 2\":1 [fmt:SBGGR10/1280x800]"
> 
> media-ctl -d $MDEV -l "\"ov01a10 17-0036\":0 -> \"Intel IPU6 CSI2
> 2\":0[1]"
> media-ctl -d $MDEV -l "\"Intel IPU6 CSI2 2\":1 ->\"Intel IPU6 ISYS
> Capture 0\":0[5]"
> 
> Though yavta does not work in the way as described in the guide.
> 
> [root@xps-1 ]# yavta --data-prefix -u -c10 -n5 -I -s 1280x800 --
> file=/tmp/frame-#.bin -f SBGGR10 /dev/video0
> Device /dev/video0 opened.
> Device `ipu6' on `PCI:0000:00:05.0' (driver 'isys') supports video,
> capture, with mplanes.
> Video format set: SBGGR10 (30314742) 1280x800 field none, 1 planes: 
>  * Stride 2560, buffer size 2050560
> Video format: SBGGR10 (30314742) 1280x800 field none, 1 planes: 
>  * Stride 2560, buffer size 2050560
> Unable to request buffers: Invalid argument (22).
> 
> 
> So I changed to use v4l2-ctl
> 
> [root@xps-1 ]# v4l2-ctl -d /dev/video0 --set-fmt-video
> width=1280,height=800,pixelformat=BG10 --stream-mmap --stream-count=1 -
> -stream-to=frame.bin
> 
> With this I created raw data in BG10 format, and later used a small
> python script with numpy and opencv to look at the data.
> 
> #!/usr/bin/env python3
> # Demosaicing Bayer Raw image
> 
> import cv2
> import numpy as np
> 
> width = 1280
> height = 800
> 
> with open("frame.bin", "rb") as rawimg:
>     # Read the bayer data
>     data = np.fromfile(rawimg, np.uint16, width * height)
>     bayer = np.reshape(data, (height, width))
> 
>     # Just a offset gain to be able to see something
>     for x in range(0, len(bayer)):
>         for y in range(0, len(bayer[0])):
>             bayer[x, y] = (bayer[x,y] << 8)
> 
>     rgb = cv2.cvtColor(bayer, cv2.COLOR_BayerBGGR2RGB)
> 
>     cv2.imshow('rgb', rgb)
>     cv2.waitKey()
>     cv2.destroyAllWindows()
> 
> 
> Thanks for the help, and now we know what is needed to make it work on
> top of yesterdays rc7

-- 
Regards,

Laurent Pinchart
