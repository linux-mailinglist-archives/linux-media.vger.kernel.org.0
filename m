Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC9417826C7
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 12:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbjHUKII (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 06:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjHUKIH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 06:08:07 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06768CA
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 03:08:03 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52713d2c606so4062406a12.2
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 03:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692612481; x=1693217281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r+pvkaR4lr38D/eQRCMg7VkAwGocXERlO9rWjhhFH9g=;
        b=RnO3Uwoz2wlfPvcGE2mJ3ZWRFJxmbdprop+JDK/H5Y73g4a4Ps43HJjwGQ/IHyx8uu
         iRHlJ6OIYZ4GzElYks1N+lBWM6j2gPjjwgjvw1wVaPrO7Ekv32hYotrGJwPnf6iPwrpG
         MfHngP3de1r4Tevp7cDNZ3qlqCGds7iBwu5N9eDnX54CjrT2qImIfXUShFh/wOx7J4nv
         hB2WbQ6X2VTJ3wspT3mdSwyXLyKr7a9TVKCr1er6c4lU+49Ad+A3PXc7nytIOazAPmVn
         VNzUaJTGYTFc5bwmfhTmQWmLjLJNN3C8OG3P2ksRI3cqsPWO4DDYbmf9DrksqJyFX6/D
         l0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692612481; x=1693217281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r+pvkaR4lr38D/eQRCMg7VkAwGocXERlO9rWjhhFH9g=;
        b=TXq5vhg/8ixexvgl661lOtBOXHvAV2S313uXjH80uQ5oP4kU9eJUiFkRPskSBwYycb
         Y5BD9WGzVVeJOvAtZEdgdRMfGp0oDMW6NKMfBwiZwYjznNNNZtNRhCeaN0AuxV68p42M
         wISDX8cPaaMOs4e25lRVj3Qir/Ywg/l4P3JMWN25S2jYls7EyeiS1Rzg/zH+R7Hprs+A
         IQyhp/HGZKCXrzAF5mfUIa+GO4ydkwzASxVuEeuf3bcaPl5ypQS6CAmQtuD14l2y9NQo
         OVNkLsY9FAXWCCYjGAILwxzr+WNUbuuqXqgb2nTyoiUmT+93x/qhc+gizcuKwc5ZK12c
         zFEQ==
X-Gm-Message-State: AOJu0YzTyt8KFfFcD+kT8KhfpZOPCets0NL/jMMxcJfuuBcZZcP0kArE
        uBKhYh6lt1dv21dMmdtEaTJCiNYJ/vsJLg==
X-Google-Smtp-Source: AGHT+IGx20afAdbZ/GQR5pkMSJNWq87COvBdY4QVmWs4xtegWokPp169pzHLBKz263+1IqnzkOuoUQ==
X-Received: by 2002:aa7:d4cc:0:b0:523:d8bf:3298 with SMTP id t12-20020aa7d4cc000000b00523d8bf3298mr4314094edr.17.1692612481216;
        Mon, 21 Aug 2023 03:08:01 -0700 (PDT)
Received: from [192.168.1.70] ([87.52.106.165])
        by smtp.gmail.com with ESMTPSA id r10-20020aa7cfca000000b00521f4ee396fsm5747181edy.12.2023.08.21.03.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 03:08:00 -0700 (PDT)
Message-ID: <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
From:   Claus Stovgaard <claus.stovgaard@gmail.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Date:   Mon, 21 Aug 2023 12:07:59 +0200
In-Reply-To: <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
         <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
         <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
         <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bingbu

On Mon, 2023-08-21 at 08:55 +0200, Claus Stovgaard wrote:
> Bingbu
>=20
> On Mon, 2023-08-21 at 14:22 +0800, Bingbu Cao wrote:
> >=20
> > Claus,
> >=20
> >=20
> > On 8/21/23 11:14 AM, Bingbu Cao wrote:
> >=20
> >=20
> > I see that the ivsc driver has not been in master branch. Before
> > that,
> > could you try several hack to check whether camera can work on
> > master?
> >=20
> > https://github.com/bingbucao/linux/commits/ipu_dev
> >=20
> > 7ebff51284d9 media: ov01a10: hack ivsc to make camera can work
> > 01cc9f3d1b61 i2c: ljca: Call acpi_dev_clear_dependencies()
> > 92e5d122e105 vsc: Defer firmware loading to avoid long probing time
> > 5f5d5f0df06b driver: ivsc: add intel ivsc driver
> > 0f4819dec533 Revert "gpio: Add support for Intel LJCA USB GPIO
> > driver"
>=20
> Thanks for your quick reply.
>=20
> I was missing understanding of ivsc when I wrote the mail yesterday.
> Got some basic understanding yesterday after I wrote, and big thanks
> for confirming it, and also thanks for your ipu_dev branch. Has just
> cloned it, and is building as I write.
>=20
> Just fyi, I was trying to hack something together yesterday, and got
> further, but not yet working.
>=20
> My hack was to combine the out-of-tree ivsc drivers and firmware from
>=20
> * https://github.com/intel/ivsc-firmware.git
> * https://github.com/intel/ivsc-driver.git
>=20
> Though noticed that I need some changes to the sensor driver so was
> also building all the drivers from ipu6-drivers (with minor changes
> to
> get_pages) as out-of-tree modules.
>=20
> * https://github.com/intel/ipu6-drivers.git=C2=A0
>=20
> Here I used everything beside media/pci/*.ko files. I could see the
> sensor and got further, but was missing the last.
>=20
> Looking forward to try your branch. Looks much cleaner, and would be
> nice to get working :)
>=20

I got it to work on Dell XPS 9320.
With some minor changes compared to your guide in Documentation/admin-
guide/media/ipu6-isys.rst

[root@xps-1 ]# uname -a
Linux xps-1 6.5.0-rc7-g7ebff51284d9 #1 SMP PREEMPT_DYNAMIC Mon Aug 21
09:02:20 CEST 2023 x86_64 GNU/Linux

[root@xps-1 ]# media-ctl -d /dev/media0 -p | tail -n10

- entity 2149: ov01a10 16-0036 (1 pad, 1 link)
               type V4L2 subdev subtype Sensor flags 0
               device node name /dev/v4l-subdev4
        pad0: Source
                [fmt:SBGGR10_1X10/1280x800 field:none colorspace:raw
                 crop.bounds:(0,0)/1296x816
                 crop:(8,8)/1280x800]
                -> "Intel IPU6 CSI2 2":0 []

So i2c is 16-0036 - and we use it for setup like your guide.

export MDEV=3D/dev/media0

media-ctl -d $MDEV -l "\"ov01a10 17-0036\":0 -> \"Intel IPU6 CSI2
2\":0[1]"

media-ctl -d $MDEV -V "\"ov01a10 17-0036\":0 [fmt:SBGGR10/1280x800]"
media-ctl -d $MDEV -V "\"Intel IPU6 CSI2 2\":0 [fmt:SBGGR10/1280x800]"
media-ctl -d $MDEV -V "\"Intel IPU6 CSI2 2\":1 [fmt:SBGGR10/1280x800]"

media-ctl -d $MDEV -l "\"ov01a10 17-0036\":0 -> \"Intel IPU6 CSI2
2\":0[1]"
media-ctl -d $MDEV -l "\"Intel IPU6 CSI2 2\":1 ->\"Intel IPU6 ISYS
Capture 0\":0[5]"

Though yavta does not work in the way as described in the guide.

[root@xps-1 ]# yavta --data-prefix -u -c10 -n5 -I -s 1280x800 --
file=3D/tmp/frame-#.bin -f SBGGR10 /dev/video0
Device /dev/video0 opened.
Device `ipu6' on `PCI:0000:00:05.0' (driver 'isys') supports video,
capture, with mplanes.
Video format set: SBGGR10 (30314742) 1280x800 field none, 1 planes:=20
 * Stride 2560, buffer size 2050560
Video format: SBGGR10 (30314742) 1280x800 field none, 1 planes:=20
 * Stride 2560, buffer size 2050560
Unable to request buffers: Invalid argument (22).


So I changed to use v4l2-ctl

[root@xps-1 ]# v4l2-ctl -d /dev/video0 --set-fmt-video
width=3D1280,height=3D800,pixelformat=3DBG10 --stream-mmap --stream-count=
=3D1 -
-stream-to=3Dframe.bin

With this I created raw data in BG10 format, and later used a small
python script with numpy and opencv to look at the data.

#!/usr/bin/env python3
# Demosaicing Bayer Raw image

import cv2
import numpy as np

width =3D 1280
height =3D 800

with open("frame.bin", "rb") as rawimg:
    # Read the bayer data
    data =3D np.fromfile(rawimg, np.uint16, width * height)
    bayer =3D np.reshape(data, (height, width))

    # Just a offset gain to be able to see something
    for x in range(0, len(bayer)):
        for y in range(0, len(bayer[0])):
            bayer[x, y] =3D (bayer[x,y] << 8)

    rgb =3D cv2.cvtColor(bayer, cv2.COLOR_BayerBGGR2RGB)

    cv2.imshow('rgb', rgb)
    cv2.waitKey()
    cv2.destroyAllWindows()


Thanks for the help, and now we know what is needed to make it work on
top of yesterdays rc7

/Claus
