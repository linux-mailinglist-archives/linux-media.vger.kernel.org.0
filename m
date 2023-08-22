Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7A3478384A
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 05:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbjHVDIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 23:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjHVDIY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 23:08:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D122F185
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 20:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692673701; x=1724209701;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Ls07CNmR2ckxWd4yyGhD0bmBjcevzYsiB4BsMBZleSo=;
  b=cE1tle0J/oNR6ahaQ4HzFQJdM6qyJ0VePp+VxmgJSV6mzmzb5Q4WKBgO
   t2vUE5eYMG9fRj16IDQ2kUUMsR/X2Vk7cssqMcrLK4M46Joucrusf+cQC
   3E3mlnrAPOEOgLwW0QFaSeh/Ng12r67xvQCyBSp8OwGbF70EslKVEJkNe
   VXLvinXlyIi0QBa0dnbvYdqntM7DMgt78rfd98MAloVx8KERzvzsuPZUn
   9orf+OrmYy1QQ1dE4ckTsVw+iJElP5eaBPPO5GJiI9MvnezpkSwvJcpIN
   HJ8OaMdMd5FKLfkg6DH+l9nlUmBr5GK501ybOyAPz3cV0TCKJWvKmqWOe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377516965"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="377516965"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 20:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="712994036"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="712994036"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 20:08:18 -0700
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
To:     Claus Stovgaard <claus.stovgaard@gmail.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
 <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
 <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
 <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <8c47de74-a08f-2adc-537d-e30b42cdb45b@linux.intel.com>
Date:   Tue, 22 Aug 2023 11:05:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Claus,

On 8/21/23 6:07 PM, Claus Stovgaard wrote:
> Bingbu
> 
> On Mon, 2023-08-21 at 08:55 +0200, Claus Stovgaard wrote:
>> Bingbu
>>
>> On Mon, 2023-08-21 at 14:22 +0800, Bingbu Cao wrote:
>>>
>>> Claus,
>>>
>>>
>>> On 8/21/23 11:14 AM, Bingbu Cao wrote:
>>>
>>>
>>> I see that the ivsc driver has not been in master branch. Before
>>> that,
>>> could you try several hack to check whether camera can work on
>>> master?
>>>
>>> https://github.com/bingbucao/linux/commits/ipu_dev
>>>
>>> 7ebff51284d9 media: ov01a10: hack ivsc to make camera can work
>>> 01cc9f3d1b61 i2c: ljca: Call acpi_dev_clear_dependencies()
>>> 92e5d122e105 vsc: Defer firmware loading to avoid long probing time
>>> 5f5d5f0df06b driver: ivsc: add intel ivsc driver
>>> 0f4819dec533 Revert "gpio: Add support for Intel LJCA USB GPIO
>>> driver"
>>
>> Thanks for your quick reply.
>>
>> I was missing understanding of ivsc when I wrote the mail yesterday.
>> Got some basic understanding yesterday after I wrote, and big thanks
>> for confirming it, and also thanks for your ipu_dev branch. Has just
>> cloned it, and is building as I write.
>>
>> Just fyi, I was trying to hack something together yesterday, and got
>> further, but not yet working.
>>
>> My hack was to combine the out-of-tree ivsc drivers and firmware from
>>
>> * https://github.com/intel/ivsc-firmware.git
>> * https://github.com/intel/ivsc-driver.git
>>
>> Though noticed that I need some changes to the sensor driver so was
>> also building all the drivers from ipu6-drivers (with minor changes
>> to
>> get_pages) as out-of-tree modules.
>>
>> * https://github.com/intel/ipu6-drivers.git 
>>
>> Here I used everything beside media/pci/*.ko files. I could see the
>> sensor and got further, but was missing the last.
>>
>> Looking forward to try your branch. Looks much cleaner, and would be
>> nice to get working :)
>>
> 
> I got it to work on Dell XPS 9320.
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

Firstly, thanks for your work. I just noticed that we remove the
userptr buffer support before, that means yavta '-u' will not be
supported. So I think you can try to remove '-u' to see whether it
can work. I will update the documentation in next version.

For Dell XPS 9320, we still have some work to make IPU work with
Intel VSC(upstreaming). My current hack on github is not offical.
But it can help people on 9320 to verify the camera before
everything ready. :)

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
> 
> /Claus
> 

-- 
Best regards,
Bingbu Cao
