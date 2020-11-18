Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF1F2B8021
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 16:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgKRPJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 10:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgKRPJP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 10:09:15 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59EDAC0613D4
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 07:09:13 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id ay21so2367603edb.2
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 07:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5O6PhL2XzKsVs6MG0Rv+d1ChvZq2IY8A5i6hZR8gMaE=;
        b=ZOvGmzfcIlpCmAoflCb1vh8Dt0hctRv+foPvliwyI6JArwWGzr8MLGKyfQTWAsoAaj
         3Q2K3tRXCWhJAsRtwbP71592z23K/Z61qJ4cGWUE48FK28QZwZl5gLHg402qDG1GNQmD
         RsdaxQ90u9jmA6p4wYhRpKb85Zcrc7UCpPS5GHiY9Gar0Av9LXWOtbdgxDcKzHlhx7zp
         rlDtZoXQ7baH1hlrjze8OVxnQaKPSRXCOHoifYMiPt8psMDTLF6p7ngRrGpYm7t7mtne
         OABVO/405geegMLYAc4Av6rrSDvXtDDGuGcbpEjizBw079GGisr7XxXSa52ECEW9waAr
         0yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5O6PhL2XzKsVs6MG0Rv+d1ChvZq2IY8A5i6hZR8gMaE=;
        b=ixAKv3oBiTNU98Z5csxAPufB+MSqsUXOZquXP5Z3+/uhLT6yx5J9toupX2+SMR5P+X
         NxWlte9OhlLaxbGy83hPaM+vaSmMOZmeF/bsIo/mD3YW08HiiKnJ/5fRF/ep2zIjKhZv
         /cIpLNX20NgbKltUp2wDtgpK6BPCSQJOTL/D3+xQGLxA50kGVxew5LKi2ss44yLEH5C7
         wTKRxjU1rpuhGvwSLwyiq4Qf7bX1TB4GrCM0FoEfVmXvjSnu8tnyllY/7P++QNV/fdpV
         h8BB6RjoN6GC189b1QrjmJyba8Hn/kIRHUsTTC/hHEmfpvVv7CZkf/l/WaKwvhU6EtI5
         zXdQ==
X-Gm-Message-State: AOAM530fAxHKKKYIzqFRU/Q18WpfceOfYryowmLv9UaKE13l9JQtXl9w
        1CJvRxvt9hLwBASwM6HRfr/xGGgquGZQHw==
X-Google-Smtp-Source: ABdhPJwKd9aAQx6LBaJhEc4dfeheLaDqZIVnuBTS+tzRBSSQUvESejuhhD9GMuGJRaFb6/PK9M1a/Q==
X-Received: by 2002:a50:fe02:: with SMTP id f2mr26098740edt.97.1605712151597;
        Wed, 18 Nov 2020 07:09:11 -0800 (PST)
Received: from localhost (p200300d1ff00040030b369bc8529b5e6.dip0.t-ipconnect.de. [2003:d1:ff00:400:30b3:69bc:8529:b5e6])
        by smtp.gmail.com with ESMTPSA id a10sm13586654edn.77.2020.11.18.07.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:09:10 -0800 (PST)
Date:   Wed, 18 Nov 2020 16:09:09 +0100
From:   Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        ezequiel@vanguardiasur.com.ar, heiko@sntech.de
Subject: Re: Working with the OV13850 camera sensor on the NanoPC-T4
Message-ID: <20201118150909.yltdxstmg5v3qz2z@basti.Speedport_W_724V_Typ_A_05011603_06_001>
References: <20201115111002.d7x2a4ephofohd7o@basti.Speedport_W_724V_Typ_A_05011603_06_001>
 <CAAEAJfAeHVx0xpDKj=jEnt3zq_SwxT5Y-ccJ7rPJgm0K0WFUMg@mail.gmail.com>
 <8daa1bf3-bca1-594e-f0ce-692ede0aac2d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <8daa1bf3-bca1-594e-f0ce-692ede0aac2d@collabora.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[RESEND with all CC Email addresses]

On 16.11.2020 08:31, Helen Koike wrote:
>Hi Sebastian,

Hey Helen,

just wanted to leave a quick thank you for your advice!
I have left a few remarks below.

>
>On 11/15/20 3:41 PM, Ezequiel Garcia wrote:
>> On Sun, 15 Nov 2020 at 08:11, Sebastian Fricke
>> <sebastian.fricke.linux@gmail.com> wrote:
>>>
>>> Hello,
>>>
>>
>> Hello Sebastian,
>>
>> Let me first add my colleagues Helen and Dafna, who maintain this driver,
>> and who will surely yell if I stop making sense here.
>>
>>> I am currently trying to get the OV13850 camera sensor
>>> (https://www.friendlyarm.com/index.php?route=product/product&product_id=228) to work on my friendlyElec NanoPC-T4.
>>>
>>> I have problems with connecting the RkISP1 ISP to the OV13850 sensor and I am not sure,
>>> where the problem could be. The device tree seems to load correctly and
>>> I can detect the sensor as a device on the i2c bus:
>>>
>>> root@nanopct4:~# cat /sys/bus/i2c/devices/1-0010/name
>>> ov13850
>>>
>>
>> OK, good start :-)
>>
>>> And the driver module is loaded as well:
>>>
>>> root@nanopct4:~# lsmod | grep ov13850
>>> ov13850                28672  0
>>> v4l2_fwnode            28672  2 rockchip_isp1,ov13850
>>> videodev              266240  9 rockchip_vdec,v4l2_fwnode,rockchip_isp1,videobuf2_v4l2,hantro_vpu,rockchip_rga,videobuf2_common,v4l2_mem2mem,ov13850
>>> mc                     61440  8 rockchip_vdec,videodev,rockchip_isp1,videobuf2_v4l2,hantro_vpu,videobuf2_common,v4l2_mem2mem,ov13850
>>>
>>> The driver reports using dummy regulators instead of the requested ones,
>>> I am not sure yet if this is part of the problem, as the driver doesn't
>>> bail out after requesting the regulators. But from what I currently
>>> understand, these warnings mean that for some reason my system didn't
>>> map these regulators but acts as if they were there.
>>>
>>> More info below, I hope that someone can help to find the error I made,
>>> thanks in advance!
>>>
>>> -----------------------------
>>>
>>> I attached the two patches I created:
>>> 1. For the device tree I combined a patch from Helen Koike (which is not merged yet),
>>>    where she adds the isp0 to the rk3399.dtsi file, with my addition which
>>>    activates the mipi_dphy_rx0, adds the camera sensor to i2c1 and
>>>    connects the pads of the ISP with the sensor. I followed the
>>>    documentation for the ISP part and got most of the camera sensor
>>>    parts from the BSP Kernel:
>>>    (https://github.com/friendlyarm/kernel-rockchip/blob/nanopi4-linux-v4.4.y/arch/arm64/boot/dts/rockchip/rk3399-nanopi4-rkisp1.dtsi#L52).
>
>If you take a look at this patch:
>
>    https://patchwork.linuxtv.org/project/linux-media/patch/20201020193850.1460644-10-helen.koike@collabora.com/
>
>You'll see that the dts of the isp has
>
>ports {
>    port@0 {
>        ...
>    }
>}
>
>which differ from the patch you attached, and I guess this is why your
>sensor is not being detected by the rkisp1 driver.
>
>Please check:
>
>    https://git.linuxtv.org/media_tree.git/tree/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>

This was exactly the problem. Thank you very much!

>>> 2. I ported the driver from the BSP kernel of friendlyElec:
>>>    (https://github.com/friendlyarm/kernel-rockchip/blob/nanopi4-linux-v4.4.y/drivers/media/i2c/ov13850.c)
>>>    I changed a few lines in order to have the module compile correctly.
>>>    ```
>>>     +#include <linux/compat.h>
>>>     -       sd->entity.type = MEDIA_ENT_T_V4L2_SUBDEV_SENSOR;
>>>     -       ret = media_entity_init(&sd->entity, 1, &ov13850->pad, 0);
>>>     +       sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
>>>     +       ret = media_entity_pads_init(&sd->entity, 1, &ov13850->pad);
>>>     ```
>>>
>>
>> Keep in mind that, with some exceptions, the upstream community
>> doesn't provide much help with downstream/vendor kernels.
>>
>>> ----------------------------------------
>>>
>>> I was able to create an armbian image for the media_tree (https://git.linuxtv.org/media_tree.git/):
>>
>> Ah, upstream is better :-)
>>
>>> root@nanopct4:~# uname -a
>>> Linux nanopct4 5.10.0-rc1-rockchip64 #trunk SMP PREEMPT Fri Nov 13 15:08:05 CET 2020 aarch64 GNU/Linux
>>>
>>> When I boot up the board I can spot the following messages in the kernel
>>> log:
>>> [    7.216307] ov13850 1-0010: driver version: 00.01.01
>>> [    7.216322] ov13850 1-0010: could not get module information!
>>> [    7.216565] ov13850 1-0010: supply avdd not found, using dummy regulator
>>> [    7.216761] ov13850 1-0010: supply dovdd not found, using dummy regulator
>>> [    7.216846] ov13850 1-0010: supply dvdd not found, using dummy regulator
>>> [    7.219535] ov13850 1-0010: Detected OV00d850 sensor, REVISION 0xb1
>>
>> OK, good.
>>
>> I can be wrong (since I haven't looked at your driver) but this
>> usually indicates
>> your sensor is powered and properly configured to at least read
>> some CHIP_ID register.
>>
>> The regulators are likely always-on in your sensor module,
>> so maybe probably that's why it works.
>>
>> See for instance arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
>> for an example of how regulators can be declared. There are other ways,
>> it's just an example.
>>
>>> ...
>>> [    7.352292] rockchip_isp1: module is from the staging directory, the quality is unknown, you have been warned.
>>> ...
>>> [    7.356178] rkisp1 ff910000.isp0: Adding to iommu group 4
>>> ...
>>> [    7.357637] rkisp1: registered rkisp1_mainpath as /dev/video0
>>> [    7.357816] rkisp1: registered rkisp1_selfpath as /dev/video1
>>>
>>> ----------------------------------------
>>>
>>> And this command (try to stream 50 frames from video1 which the mainpath
>>> on the RkISP1):
>>> root@nanopct4:~# v4l2-ctl --stream-to /home/basti/test.raw --stream-mmap 50 -d /dev/video0 --verbose
>>>
>>> I get this output:
>>> VIDIOC_STREAMON returned -1 (No such device)
>>>
>>> And this kernel log message:
>>> [16939.667867] rkisp1 ff910000.isp0: No link between isp and sensor
>>>
>>
>> This error seems useful. It would indicate your sensor is not
>> connected (software-connected) to the ISP.
>>
>> See below.
>>
>>> -----------------------------------------
>>>
>>> Here is the output for media-ctl -p:
>>>
>>> Media controller API version 5.10.0
>>>
>>> Media device information
>>> ------------------------
>>> driver          rkisp1
>>> model           rkisp1
>>> serial
>>> bus info        platform:rkisp1
>>> hw revision     0x0
>>> driver version  5.10.0
>>>
>>> Device topology
>>> - entity 1: rkisp1_isp (4 pads, 4 links)
>>>             type V4L2 subdev subtype Unknown flags 0
>>>             device node name /dev/v4l-subdev0
>>>         pad0: Sink
>>>                 [fmt:SRGGB10_1X10/800x600 field:none
>>>                  crop.bounds:(0,0)/800x600
>>>                  crop:(0,0)/800x600]
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> Note that here the rkisp1_isp entity sink pad 0
>> should be connected to the bayer sensor, but it
>> seems not connected to anything.
>>
>> I can be wrong, but I don't see your sensor
>> appearing anywhere in the topology.
>>
>> See for instance, the example in the driver
>> documentation:
>>
>> https://www.kernel.org/doc/html/latest/admin-guide/media/rkisp1.html
>
>Just to complement what Ezequiel mentioned, to better understand, you can
>check the topology with
>
>    media-ctl --print-dot
>
>and copy the results to https://dreampuf.github.io/GraphvizOnline/
>
>You'll see there is no sensor connected in pad 0 of the rkisp1_isp node.
>

Cool website didn't know it exists

>>
>> And note the section where the topology is set, connecting
>> the imx219 sensor to rkisp1_isp sink pad0:
>>
>> "media-ctl" "-d" "platform:rkisp1" "-l" "'imx219 4-0010':0 ->
>> 'rkisp1_isp':0 [1]"
>>
>> So I would say you are very much on the right track,
>> but you still need a bit more work to construct the capture pipeline.
>>
>> Not sure if this helps, or makes things more complicated, but instead
>> of  v4l2-ctl, I would personally start with libcamera, and work from there.
>>
>> Cheers,
>> Ezequiel
>>
>After correcting the topology, you should configure the stream as indicated
>in the docs:
>
>    https://www.kernel.org/doc/html/latest/admin-guide/media/rkisp1.html#capturing-video-frames-example
>

It is difficult to spot anything on the video, as it is super dark but
this works. My current efforts are focused on getting to work on the
RkISP1 IPAs so I hope to change this to the better soon. ;)

>Or use libamera with, for instance:
>
>    cam -c 1 -C
>

This sadly didn't work directly, the libcamera pipeline handler has to
be fixed as it has a maximum resolution of 4032x3024, while not
configuring the output resolution of the sensor correctly:
(This was pointed out by Laurent Pinchart on the libcamera IRC, I will try to fix this.)

basti@nanopct4:~$ LIBCAMERA_LOG_LEVELS=0 cam -c 1 -C
[0:10:02.777886361] [2102] DEBUG IPAProxy ipa_proxy.cpp:290 Registered proxy "IPAProxyLinux"
[0:10:02.778607938] [2102] DEBUG IPAProxy ipa_proxy.cpp:290 Registered proxy "IPAProxyThread"
[0:10:02.782258408] [2102] DEBUG IPAModule ipa_module.cpp:330 ipa_rkisp1.so: IPA module /usr/local/lib/aarch64-linux-gnu/libcamera/ipa_rkisp1.so is signed
[0:10:02.783011777] [2102] DEBUG IPAManager ipa_manager.cpp:238 Loaded IPA module '/usr/local/lib/aarch64-linux-gnu/libcamera/ipa_rkisp1.so'
[0:10:02.788297608] [2102] DEBUG IPAModule ipa_module.cpp:330 ipa_rpi.so: IPA module /usr/local/lib/aarch64-linux-gnu/libcamera/ipa_rpi.so is signed
[0:10:02.789237642] [2102] DEBUG IPAManager ipa_manager.cpp:238 Loaded IPA module '/usr/local/lib/aarch64-linux-gnu/libcamera/ipa_rpi.so'
[0:10:02.790346258] [2102] DEBUG IPAModule ipa_module.cpp:330 ipa_vimc.so: IPA module /usr/local/lib/aarch64-linux-gnu/libcamera/ipa_vimc.so is signed
[0:10:02.790817587] [2102] DEBUG IPAManager ipa_manager.cpp:238 Loaded IPA module '/usr/local/lib/aarch64-linux-gnu/libcamera/ipa_vimc.so'
[0:10:02.791825287] [2102]  INFO Camera camera_manager.cpp:293 libcamera v0.0.0+2030-d14a3f8a
[0:10:02.792881987] [2103] DEBUG Camera camera_manager.cpp:105 Starting camera manager
[0:10:02.817883446] [2103] DEBUG DeviceEnumerator device_enumerator.cpp:223 New media device "hantro-vpu" created from /dev/media2
[0:10:02.818795772] [2103] DEBUG DeviceEnumerator device_enumerator_udev.cpp:94 Defer media device /dev/media2 due to 2 missing dependencies
[0:10:02.823322693] [2103] DEBUG DeviceEnumerator device_enumerator_udev.cpp:319 All dependencies for media device /dev/media2 found
[0:10:02.823521900] [2103] DEBUG DeviceEnumerator device_enumerator.cpp:251 Added device /dev/media2: hantro-vpu
[0:10:02.825636174] [2103] DEBUG DeviceEnumerator device_enumerator.cpp:223 New media device "rkvdec" created from /dev/media1
[0:10:02.825903630] [2103] DEBUG DeviceEnumerator device_enumerator_udev.cpp:94 Defer media device /dev/media1 due to 1 missing dependencies
[0:10:02.827886364] [2103] DEBUG DeviceEnumerator device_enumerator_udev.cpp:319 All dependencies for media device /dev/media1 found
[0:10:02.828109487] [2103] DEBUG DeviceEnumerator device_enumerator.cpp:251 Added device /dev/media1: rkvdec
[0:10:02.830667966] [2103] DEBUG DeviceEnumerator device_enumerator.cpp:223 New media device "rkisp1" created from /dev/media0
[0:10:02.832361952] [2103] DEBUG DeviceEnumerator device_enumerator_udev.cpp:94 Defer media device /dev/media0 due to 7 missing dependencies
[0:10:02.844721516] [2103] DEBUG DeviceEnumerator device_enumerator_udev.cpp:319 All dependencies for media device /dev/media0 found
[0:10:02.844916639] [2103] DEBUG DeviceEnumerator device_enumerator.cpp:251 Added device /dev/media0: rkisp1
[0:10:02.846288920] [2103] DEBUG Camera camera_manager.cpp:148 Found registered pipeline handler 'PipelineHandlerIPU3'
[0:10:02.847350869] [2103] DEBUG Camera camera_manager.cpp:148 Found registered pipeline handler 'PipelineHandlerRPi'
[0:10:02.847648075] [2103] DEBUG Camera camera_manager.cpp:148 Found registered pipeline handler 'PipelineHandlerRkISP1'
[0:10:02.848204862] [2103] DEBUG DeviceEnumerator device_enumerator.cpp:311 Successful match for media device "rkisp1"
[0:10:02.849379686] [2103] DEBUG V4L2 v4l2_videodevice.cpp:577 /dev/video3[cap]: Opened device platform:rkisp1: rkisp1: rkisp1_stats
[0:10:02.849756516] [2103] DEBUG V4L2 v4l2_videodevice.cpp:577 /dev/video4[out]: Opened device platform:rkisp1: rkisp1: rkisp1_params
[0:10:02.850229304] [2103] DEBUG V4L2 v4l2_videodevice.cpp:577 /dev/video1[cap]: Opened device platform:rkisp1: rkisp1: rkisp1
[0:10:02.850775591] [2103] DEBUG V4L2 v4l2_videodevice.cpp:577 /dev/video2[cap]: Opened device platform:rkisp1: rkisp1: rkisp1
[0:10:02.883320946] [2103] DEBUG IPAManager ipa_manager.cpp:316 IPA module /usr/local/lib/aarch64-linux-gnu/libcamera/ipa_rkisp1.so signature is valid
[0:10:02.888229655] [2103] DEBUG Camera camera_manager.cpp:160 Pipeline handler "PipelineHandlerRkISP1" matched
[0:10:02.888665694] [2103] DEBUG Camera camera_manager.cpp:148 Found registered pipeline handler 'SimplePipelineHandler'
[0:10:02.888949483] [2103] DEBUG Camera camera_manager.cpp:148 Found registered pipeline handler 'PipelineHandlerUVC'
[0:10:02.889104648] [2103] DEBUG Camera camera_manager.cpp:148 Found registered pipeline handler 'PipelineHandlerVimc'
Using camera /base/i2c@ff110000/ov13850@10
[0:10:02.891430671] [2102] DEBUG Camera camera.cpp:771 streams configuration: (0) 1920x1920-NV12
[0:10:02.892222831] [2102]  INFO Camera camera.cpp:830 configuring streams: (0) 1920x1920-NV12
[0:10:02.893203989] [2103] DEBUG MediaDevice media_device.cpp:808 /dev/media0[rkisp1]: rkisp1_isp[2] -> rkisp1_resizer_mainpath[0]: 0
[0:10:02.893346613] [2103] DEBUG MediaDevice media_device.cpp:808 /dev/media0[rkisp1]: rkisp1_isp[2] -> rkisp1_resizer_selfpath[0]: 0
[0:10:02.893470862] [2103] DEBUG MediaDevice media_device.cpp:808 /dev/media0[rkisp1]: ov13850 1-0010[0] -> rkisp1_isp[0]: 0
[0:10:02.893602111] [2103] DEBUG RkISP1 rkisp1.cpp:997 Enabling link from sensor 'ov13850 1-0010' to ISP
[0:10:02.893698360] [2103] DEBUG MediaDevice media_device.cpp:808 /dev/media0[rkisp1]: ov13850 1-0010[0] -> rkisp1_isp[0]: 1
[0:10:02.893819401] [2103] DEBUG MediaDevice media_device.cpp:808 /dev/media0[rkisp1]: rkisp1_isp[2] -> rkisp1_resizer_mainpath[0]: 1
[0:10:02.893921775] [2103] DEBUG RkISP1 rkisp1.cpp:684 Configuring sensor with 4224x3136-SBGGR10_1X10
[0:10:02.894077815] [2103] DEBUG RkISP1 rkisp1.cpp:690 Sensor configured with 4224x3136-SBGGR10_1X10
[0:10:02.894252231] [2103] DEBUG RkISP1 rkisp1.cpp:701 ISP input pad configured with 4032x3024-SBGGR10_1X10
[0:10:02.894355771] [2103] DEBUG RkISP1 rkisp1.cpp:705 Configuring ISP output pad with 4032x3024-YUYV8_2X8
[0:10:02.894458729] [2103] DEBUG RkISP1 rkisp1.cpp:711 ISP output pad configured with 800x600-YUYV8_2X8
[0:10:02.894572770] [2103] DEBUG RkISP1 rkisp1_path.cpp:120 Configured main resizer input pad with 800x600-YUYV8_2X8
[0:10:02.894674560] [2103] DEBUG RkISP1 rkisp1_path.cpp:126 Configuring main resizer output pad with 1920x1920-YUYV8_2X8
[0:10:02.894781893] [2103] DEBUG RkISP1 rkisp1_path.cpp:144 Configured main resizer output pad with 1920x1920-YUYV8_1_5X8
[0:10:02.915852010] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1137 /dev/video1[cap]: 4 buffers requested.
[0:10:02.917560871] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1137 /dev/video1[cap]: 0 buffers requested.
[0:10:02.918685528] [2102] DEBUG Camera camera.cpp:967 Starting capture
[0:10:02.919501021] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1137 /dev/video4[out]: 4 buffers requested.
[0:10:02.921160591] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1137 /dev/video3[cap]: 4 buffers requested.
[0:10:02.923722570] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1137 /dev/video1[cap]: 4 buffers requested.
[0:10:02.923808902] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1350 /dev/video1[cap]: Prepared to import 4 buffers
[0:10:02.923921193] [2103] ERROR V4L2 v4l2_subdevice.cpp:285 'ov13850 1-0010': Unable to get rectangle 1 on pad 0: Inappropriate ioctl for device
[0:10:02.924034067] [2103] ERROR CameraSensor camera_sensor.cpp:513 'ov13850 1-0010': Failed to construct camera sensor info: the camera sensor does not report the active area
[0:10:02.924062650] [2103]  WARN RkISP1 rkisp1.cpp:906 Camera sensor information not available
[0:10:02.924368606] [2103]  INFO IPARkISP1 rkisp1.cpp:115 Exposure: 4-3324 Gain: 16-248
[0:10:02.924925977] [2103] DEBUG Timer timer.cpp:105 Starting timer 0xffffb0015ea0: deadline 0:10:02.929769061
[0:10:02.925217932] [2103] DEBUG Event event_dispatcher_poll.cpp:217 timeout 0.004577378
Capture until user interrupts by SIGINT
[0:10:02.925964885] [2103] DEBUG Event event_dispatcher_poll.cpp:217 timeout 0.003814385
[0:10:02.926044509] [2103] DEBUG Event event_dispatcher_poll.cpp:217 timeout 0.003727469
[0:10:02.926105758] [2103] DEBUG Event event_dispatcher_poll.cpp:217 timeout 0.003665928
[0:10:02.926152716] [2103] DEBUG Event event_dispatcher_poll.cpp:217 timeout 0.003618970
[0:10:02.930000060] [2103] DEBUG Timer timer.cpp:105 Starting timer 0xffffb0015ea0: deadline 0:10:02.935715803
[0:10:02.930041184] [2103] DEBUG Event event_dispatcher_poll.cpp:217 timeout 0.005677244
[0:10:02.935862511] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video4[out]: Queueing buffer 0
[0:10:02.935981802] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video3[cap]: Queueing buffer 0
[0:10:02.936049759] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video1[cap]: Queueing buffer 0
[0:10:02.936136967] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video4[out]: Queueing buffer 1
[0:10:02.936177508] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video3[cap]: Queueing buffer 1
[0:10:02.936212508] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video1[cap]: Queueing buffer 1
[0:10:02.936276091] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video4[out]: Queueing buffer 2
[0:10:02.936310799] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video3[cap]: Queueing buffer 2
[0:10:02.936344049] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video1[cap]: Queueing buffer 2
[0:10:02.936418131] [2103] ERROR V4L2 v4l2_videodevice.cpp:1443 /dev/video1[cap]: Failed to queue buffer 2: Broken pipe
[0:10:02.936458673] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video4[out]: Queueing buffer 3
[0:10:02.936493089] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video3[cap]: Queueing buffer 3
[0:10:02.936526922] [2103] DEBUG V4L2 v4l2_videodevice.cpp:1439 /dev/video1[cap]: Queueing buffer 3
[0:10:02.936584963] [2103] ERROR V4L2 v4l2_videodevice.cpp:1443 /dev/video1[cap]: Failed to queue buffer 3: Broken pipe
^CExiting

>
>I hope this helps.
>Regards,
>Helen

Greetings,
Sebastian
