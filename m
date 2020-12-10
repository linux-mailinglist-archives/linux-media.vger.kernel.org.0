Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39AB2D5B36
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 14:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389050AbgLJNGz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388785AbgLJNGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:06:53 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E603CC0613CF
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 05:06:12 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id v14so4597085wml.1
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 05:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=MvY912RWx6rTb9lL0fJIKIT+TnVFd3v8zDXpn2uKY5I=;
        b=bwEHXGEAvlU3UhLzWbZOcuoa+ZYATU2zkMnxN/1DTvXoTHwkMup9peoTzQU+oZWJ1O
         HoVzzzIBPKDiQlrvkdsTMwDJoK9+sRQueQ2fn0XJPzBJ4Euv/Kk9iLLfD18SNd1JeS8E
         MsvfjMyYKrjoErnRKGoH0eHMxeYN45AXOyYXcl6Gj6qMJgaNz4vy+ed0WRV+bnWe1szV
         6hDdLzBOIZs7bwZQRkNeZvIrUzJbpQ4m88+U2l8xRNOeommbFns75DeUDp+BT6YLlBCk
         SnB1aOzOXkcYlJ+HcPtKrGw6cmwBpksiWnaK2VzDtPGWsAhH19M670kYKg3xoK9D5vRz
         Zzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=MvY912RWx6rTb9lL0fJIKIT+TnVFd3v8zDXpn2uKY5I=;
        b=GY7euDrAs5AsB99+YYTKTX30WWtbeXBVFU+MDbLuWIg3ZIORPSSB5l+QDcs7A0tJs+
         +PpIknWMwe8x1KBxj52KkmkfvON6nEFZ8JRcgrpPNbhajW3YN3j2xUVYCCQz26zOUNy8
         OW7xuXx1iHXvjhWT1wenfKlfWyrmSmRD9KYTUT2XyBTxXcdxn/7G3zoxhblbVbnqGXz7
         PsWQ1xhSwq/s4+GOZp/N2HFZyKzPrr2WjvJrQ7JaZPjORJayx8tTB+o/1te79vxkTYGL
         Ec8Vkq3uuxCJNNVYBUCrY4PNPv8HLWlMyxm12Gs1+3fqRm56VUOgq8733ebsjUWht+Ti
         Cb4g==
X-Gm-Message-State: AOAM532lnO+02kp0wbM9i/dU1xlnMTv2gicS5ZnabXtvY8mIZlfixWwL
        +yrspg1QTsywpz2dkwouvjs=
X-Google-Smtp-Source: ABdhPJyEEpHffY9Q5Krk8hCjBEZT/+rZBlMN4r1qOgGE5YFhRL5wU5Gqo6n3aeTWg7LOeZTfmR3WuA==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr7941442wmc.10.1607605571475;
        Thu, 10 Dec 2020 05:06:11 -0800 (PST)
Received: from localhost (p200300db7f1e259370017fe6741275de.dip0.t-ipconnect.de. [2003:db:7f1e:2593:7001:7fe6:7412:75de])
        by smtp.gmail.com with ESMTPSA id r128sm9989195wma.5.2020.12.10.05.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:06:10 -0800 (PST)
Date:   Thu, 10 Dec 2020 14:06:08 +0100
From:   Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com
Subject: Re: [PATCH] media: rkisp1: Add the enum_frame_size ioctl
Message-ID: <20201210130608.3a3xuj74ettphhn3@basti.Speedport_W_724V_Typ_A_05011603_06_001>
Reply-To: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
References: <20201206053935.24028-1-sebastian.fricke.linux@gmail.com>
 <f430e612-0583-9ee2-3d91-349e90bdfe20@collabora.com>
 <20201207180128.35o7rezfm3yoavdd@basti.Speedport_W_724V_Typ_A_05011603_06_001>
 <3ee37e40-73e8-d150-3a6a-9609163b6147@collabora.com>
 <20201210050350.lmawuqz6m4tnvckl@basti.Speedport_W_724V_Typ_A_05011603_06_001>
 <6a3819fd-5e7a-383e-db1c-9f8650a95faa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a3819fd-5e7a-383e-db1c-9f8650a95faa@collabora.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10.12.2020 09:06, Helen Koike wrote:
>
>
>On 12/10/20 2:03 AM, Sebastian Fricke wrote:
>> On 09.12.2020 11:22, Helen Koike wrote:
>>> Hi Sebastian,
>>>
>>> On 12/7/20 3:01 PM, Sebastian Fricke wrote:
>>>> On 07.12.2020 08:33, Helen Koike wrote:
>>>>> Hi Sebastian,
>>>>>
>>>>> Thanks for your patch.
>>>>
>>>> Hello Helen,
>>>>
>>>> I am very grateful for your review.
>>>>
>>>>>
>>>>> On 12/6/20 2:39 AM, Sebastian Fricke wrote:
>>>>>> Implement the VIDIOC_SUBDEV_ENUM_FRAME_SIZE ioctl, check if the mbus
>>>>>> code is valid for the given pad. This call is not available for the
>>>>>> parameter or metadata pads of the RkISP1.
>>>>>>
>>>>>> Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
>>>>>> ---
>>>>>>
>>>>>> I have tested this patch with the following script:
>>>>>> https://github.com/initBasti/Linux_kernel_media_tree_fork/commit/efc4b399cff53fb36fadde999594961a3d84073e
>>>>>>
>>>>>> The results on my NanoPC-T4 (Linux nanopct4 5.10.0-rc6-rockchip64):
>>>>>>
>>>>>> pad 0 = RKISP1_ISP_PAD_SINK_VIDEO
>>>>>> pad 1 = RKISP1_ISP_PAD_SINK_PARAMS
>>>>>> pad 2 = RKISP1_ISP_PAD_SOURCE_VIDEO
>>>>>> pad 3 = RKISP1_ISP_PAD_SOURCE_STATS
>>>>>>
>>>>>> basti@nanopct4:~$ python3 rkisp1_enum_frame_size_test.py
>>>>>> TEST  0: pad 0 - code 0x300f - size 32x32 - 4032x3024
>>>>>> TEST  1: pad 0 - code 0x3007 - size 32x32 - 4032x3024
>>>>>> TEST  2: pad 0 - code 0x300e - size 32x32 - 4032x3024
>>>>>> TEST  3: pad 0 - code 0x300a - size 32x32 - 4032x3024
>>>>>> TEST  4: pad 0 - code 0x3012 - size 32x32 - 4032x3024
>>>>>> TEST  5: pad 0 - code 0x3008 - size 32x32 - 4032x3024
>>>>>> TEST  6: pad 0 - code 0x3010 - size 32x32 - 4032x3024
>>>>>> TEST  7: pad 0 - code 0x3011 - size 32x32 - 4032x3024
>>>>>> TEST  8: pad 0 - code 0x3014 - size 32x32 - 4032x3024
>>>>>> TEST  9: pad 0 - code 0x3001 - size 32x32 - 4032x3024
>>>>>> TEST 10: pad 0 - code 0x3013 - size 32x32 - 4032x3024
>>>>>> TEST 11: pad 0 - code 0x3002 - size 32x32 - 4032x3024
>>>>>> TEST 12: pad 0 - code 0x2011 - size 32x32 - 4032x3024
>>>>>> TEST 13: pad 0 - code 0x2012 - size 32x32 - 4032x3024
>>>>>> TEST 14: pad 0 - code 0x200f - size 32x32 - 4032x3024
>>>>>> TEST 15: pad 0 - code 0x2010 - size 32x32 - 4032x3024
>>>>>> TEST 16: pad 1 - code 0x7001 - size /
>>>>>> TEST 17: pad 2 - code 0x2008 - size 32x32 - 4032x3024
>>>>>> TEST 18: pad 2 - code 0x300f - size 32x32 - 4032x3024
>>>>>> TEST 19: pad 2 - code 0x3007 - size 32x32 - 4032x3024
>>>>>> TEST 20: pad 2 - code 0x300e - size 32x32 - 4032x3024
>>>>>> TEST 21: pad 2 - code 0x300a - size 32x32 - 4032x3024
>>>>>> TEST 22: pad 2 - code 0x3012 - size 32x32 - 4032x3024
>>>>>> TEST 23: pad 2 - code 0x3008 - size 32x32 - 4032x3024
>>>>>> TEST 24: pad 2 - code 0x3010 - size 32x32 - 4032x3024
>>>>>> TEST 25: pad 2 - code 0x3011 - size 32x32 - 4032x3024
>>>>>> TEST 26: pad 2 - code 0x3014 - size 32x32 - 4032x3024
>>>>>> TEST 27: pad 2 - code 0x3001 - size 32x32 - 4032x3024
>>>>>> TEST 28: pad 2 - code 0x3013 - size 32x32 - 4032x3024
>>>>>> TEST 29: pad 2 - code 0x3002 - size 32x32 - 4032x3024
>>>>>> TEST 30: pad 3 - code 0x7001 - size /
>>>>>> TEST 31: pad 0 - code 0xdead - size / (test with an invalid media bus code)
>>>>>> TEST 32: pad 6 - code 0x300f - size / (test with an invalid pad)
>>>>>> TEST 33: pad 0 - code 0x2008 - size / (test with a format that is not supported by the pad)
>>>>>> TEST 34: pad 2 - code 0x2010 - size / (test with a format that is not supported by the pad)
>>>>>
>>>>> Could you please also run v4l2-compliance ?
>>>>
>>>> Yes, it finished without errors here is the output.
>>>>
>>>> Greetings,
>>>> Sebastian
>>>>
>>>> ---
>>>>
>>>> basti@nanopct4:~$ v4l2-compliance v4l2-compliance 1.21.0-4683, 64 bits, 64-bit time_t
>>>> v4l2-compliance SHA: 0aee9991e0c0 2020-12-01 09:48:02
>>>
>>> Thanks for running the test.
>>>
>>>>
>>>> Compliance test for rkisp1 device /dev/video0:
>>>
>>>
>>> This is only testing video0 (rkisp1-capture) but enum_frame_size is in the isp node.
>>> Please run v4l2-compliance in the isp node as well. iirc you can use the -m option
>>> to test the whole tree.
>>
>> Oh, thanks a lot for pointing me to that test, as it actually reports
>> errors. :(
>> I am just not sure if these errors are problematic as pad 0 & pad 2
>> work as intended, while pad 1 & pad 3 report errors.
>> My goal would actually be if they report that they don't support the
>> FRAMESIZES.
>> What do you think?
>
>Try returning -ENOTTY to indicate it isn't supported:
>https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/gen-errors.html?highlight=enotty

Ah great, I will include that in v3. Do you think that v2 requires any
other changes? Because if that is not the case, I can create v3 this
afternoon.

Thank you and greetings,
Sebastian

>
>>
>> basti@nanopct4:~$ v4l2-compliance -d /dev/v4l-subdev0
>> ...
>> Compliance test for rkisp1 device /dev/v4l-subdev0:
>>
>> Media Driver Info:
>>     Driver name      : rkisp1
>>     Model            : rkisp1
>>     Serial           :     Bus info         : platform:rkisp1
>>     Media version    : 5.10.0
>>     Hardware revision: 0x00000000 (0)
>>     Driver version   : 5.10.0
>> Interface Info:
>>     ID               : 0x0300002c
>>     Type             : V4L Sub-Device
>> Entity Info:
>>     ID               : 0x00000001 (1)
>>     Name             : rkisp1_isp
>>     Function         : Video Pixel Formatter
>>     Pad 0x01000002   : 0: Sink, Must Connect
>>       Link 0x0200001e: from remote pad 0x100001d of entity 'ov13850 1-0010': Data, Enabled
>>     Pad 0x01000003   : 1: Sink
>>       Link 0x02000028: from remote pad 0x1000019 of entity 'rkisp1_params': Data, Enabled, Immutable
>>     Pad 0x01000004   : 2: Source
>>       Link 0x02000020: to remote pad 0x1000007 of entity 'rkisp1_resizer_mainpath': Data, Enabled
>>       Link 0x02000024: to remote pad 0x100000a of entity 'rkisp1_resizer_selfpath': Data, Enabled
>>     Pad 0x01000005   : 3: Source
>>       Link 0x0200002a: to remote pad 0x1000015 of entity 'rkisp1_stats': Data, Enabled, Immutable
>>
>> Required ioctls:
>>     test MC information (see 'Media Driver Info' above): OK
>>
>> Allow for multiple opens:
>>     test second /dev/v4l-subdev0 open: OK
>>     test for unlimited opens: OK
>>
>>     test invalid ioctls: OK
>> Debug ioctls:
>>     test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>     test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>     Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>     Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>     test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>     test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>     test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>     test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>     test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>     test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>     test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>     test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 1):
>>         fail: v4l2-test-subdevs.cpp(139): doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse)
>>         fail: v4l2-test-subdevs.cpp(240): ret && ret != ENOTTY
>>     test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
>>         fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
>>         fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
>>     test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>>     test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>         fail: v4l2-test-subdevs.cpp(139): doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse)
>>         fail: v4l2-test-subdevs.cpp(240): ret && ret != ENOTTY
>>     test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
>>         fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
>>         fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
>>     test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>>     test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>     test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 2):
>>     test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>     test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>     test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>     test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>     test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>     test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>     test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 3):
>>         fail: v4l2-test-subdevs.cpp(139): doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse)
>>         fail: v4l2-test-subdevs.cpp(240): ret && ret != ENOTTY
>>     test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
>>         fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
>>         fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
>>     test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>>     test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>         fail: v4l2-test-subdevs.cpp(139): doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse)
>>         fail: v4l2-test-subdevs.cpp(240): ret && ret != ENOTTY
>>     test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
>>         fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
>>         fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
>>     test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>>     test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>     test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>     test VIDIOC_QUERYCTRL: OK (Not Supported)
>>     test VIDIOC_G/S_CTRL: OK (Not Supported)
>>     test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>     Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>     test VIDIOC_G/S_PARM: OK (Not Supported)
>>     test VIDIOC_G_FBUF: OK (Not Supported)
>>     test VIDIOC_G_FMT: OK (Not Supported)
>>     test VIDIOC_TRY_FMT: OK (Not Supported)
>>     test VIDIOC_S_FMT: OK (Not Supported)
>>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>     test Cropping: OK (Not Supported)
>>     test Composing: OK (Not Supported)
>>     test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>     test VIDIOC_EXPBUF: OK (Not Supported)
>>     test Requests: OK (Not Supported)
>>
>> Total for rkisp1 device /dev/v4l-subdev0: 70, Succeeded: 62, Failed: 8, Warnings: 0
>>
>>
>>>
>>> Regards,
>>> Helen
>>>
>>>>
>>>> Driver Info:
>>>>     Driver name      : rkisp1
>>>>     Card type        : rkisp1
>>>>     Bus info         : platform:rkisp1
>>>>     Driver version   : 5.10.0
>>>>     Capabilities     : 0xa4201000
>>>>         Video Capture Multiplanar
>>>>         Streaming
>>>>         Extended Pix Format
>>>>         Device Capabilities
>>>>     Device Caps      : 0x24201000
>>>>         Video Capture Multiplanar
>>>>         Streaming
>>>>         Extended Pix Format
>>>> Media Driver Info:
>>>>     Driver name      : rkisp1
>>>>     Model            : rkisp1
>>>>     Serial           :
>>>>     Bus info         : platform:rkisp1
>>>>     Media version    : 5.10.0
>>>>     Hardware revision: 0x00000000 (0)
>>>>     Driver version   : 5.10.0
>>>> Interface Info:
>>>>     ID               : 0x0300000d
>>>>     Type             : V4L Video
>>>> Entity Info:
>>>>     ID               : 0x0000000c (12)
>>>>     Name             : rkisp1_mainpath
>>>>     Function         : V4L2 I/O
>>>>     Pad 0x0100000f   : 0: Sink
>>>>       Link 0x02000022: from remote pad 0x1000008 of entity 'rkisp1_resizer_mainpath': Data, Enabled, Immutable
>>>>
>>>> Required ioctls:
>>>>     test MC information (see 'Media Driver Info' above): OK
>>>>     test VIDIOC_QUERYCAP: OK
>>>>
>>>> Allow for multiple opens:
>>>>     test second /dev/video0 open: OK
>>>>     test VIDIOC_QUERYCAP: OK
>>>>     test VIDIOC_G/S_PRIORITY: OK
>>>>     test for unlimited opens: OK
>>>>
>>>>     test invalid ioctls: OK
>>>> Debug ioctls:
>>>>     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>     test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>     test VIDIOC_G/S/ENUMINPUT: OK
>>>>     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>     Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>     Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>     test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls (Input 0):
>>>>     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>     test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>     test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>     test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>     Standard Controls: 0 Private Controls: 0
>>>>
>>>> Format ioctls (Input 0):
>>>>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>     test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>     test VIDIOC_G_FBUF: OK (Not Supported)
>>>>     test VIDIOC_G_FMT: OK
>>>>     test VIDIOC_TRY_FMT: OK
>>>>     test VIDIOC_S_FMT: OK
>>>>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>     test Cropping: OK (Not Supported)
>>>>     test Composing: OK (Not Supported)
>>>>     test Scaling: OK
>>>>
>>>> Codec ioctls (Input 0):
>>>>     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls (Input 0):
>>>>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>     test VIDIOC_EXPBUF: OK
>>>>     test Requests: OK (Not Supported)
>>>>
>>>> Total for rkisp1 device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 0
>>>>
>>>>>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 39 +++++++++++++++++++
>>>>>>  1 file changed, 39 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>>>>>> index 889982d8ca41..fa7540155d71 100644
>>>>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>>>>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>>>>>> @@ -599,6 +599,44 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
>>>>>>
>>>>>>      return -EINVAL;
>>>>>>  }
>>>>>
>>>>> Please add a new line here
>>>>>
>>>>>> +static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
>>>>>> +                      struct v4l2_subdev_pad_config *cfg,
>>>>>> +                      struct v4l2_subdev_frame_size_enum *fse)
>>>>>> +{
>>>>>> +    int i;
>>>>>
>>>>> unsigned
>>>>>
>>>>>> +    bool code_match = false;
>>>>>> +
>>>>>> +    if (fse->pad == RKISP1_ISP_PAD_SINK_PARAMS ||
>>>>>> +        fse->pad == RKISP1_ISP_PAD_SOURCE_STATS)
>>>>>> +        return -EINVAL;
>
>I mean here.
>
>Regards,
>Helen
>
>>>>>
>>>>>
>>>>>
>>>>>> +
>>>>>> +    if (fse->index > 0)> +        return -EINVAL;
>>>>>> +
>>>>>> +    for (i = 0; i < ARRAY_SIZE(rkisp1_isp_formats); i++) {
>>>>>> +        const struct rkisp1_isp_mbus_info *fmt = &rkisp1_isp_formats[i];
>>>>>
>>>>> Can't you use function rkisp1_isp_mbus_info_get() ?
>>>>>
>>>>> Check how rkisp1_isp_set_src_fmt() checks for a valid mbus code.
>>>>>
>>>>> Thanks
>>>>> Helen
>>>>>
>>>>>> +
>>>>>> +        if (fmt->mbus_code == fse->code) {
>>>>>> +            code_match = true;
>>>>>> +            if (!(fmt->direction & RKISP1_ISP_SD_SINK) &&
>>>>>> +                fse->pad == RKISP1_ISP_PAD_SINK_VIDEO)
>>>>>> +                return -EINVAL;
>>>>>> +            if (!(fmt->direction & RKISP1_ISP_SD_SRC) &&
>>>>>> +                fse->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
>>>>>> +                return -EINVAL;
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    if (!code_match)
>>>>>> +        return -EINVAL;
>>>>>> +
>>>>>> +    fse->min_width = RKISP1_ISP_MIN_WIDTH;
>>>>>> +    fse->max_width = RKISP1_ISP_MAX_WIDTH;
>>>>>> +    fse->min_height = RKISP1_ISP_MIN_HEIGHT;
>>>>>> +    fse->max_height = RKISP1_ISP_MAX_HEIGHT;
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>>
>>>>>>  static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
>>>>>>                    struct v4l2_subdev_pad_config *cfg)
>>>>>> @@ -880,6 +918,7 @@ static int rkisp1_subdev_link_validate(struct media_link *link)
>>>>>>
>>>>>>  static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
>>>>>>      .enum_mbus_code = rkisp1_isp_enum_mbus_code,
>>>>>> +    .enum_frame_size = rkisp1_isp_enum_frame_size,
>>>>>>      .get_selection = rkisp1_isp_get_selection,
>>>>>>      .set_selection = rkisp1_isp_set_selection,
>>>>>>      .init_cfg = rkisp1_isp_init_config,
>>>>>>
