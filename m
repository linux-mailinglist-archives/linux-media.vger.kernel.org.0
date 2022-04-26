Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5E1850FB1F
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 12:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349254AbiDZKh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 06:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349246AbiDZKgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 06:36:52 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 26 Apr 2022 03:20:14 PDT
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E31701EC5B
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 03:20:14 -0700 (PDT)
X-KPN-MessageId: 40b9cbec-c54a-11ec-92d5-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 40b9cbec-c54a-11ec-92d5-005056abbe64;
        Tue, 26 Apr 2022 12:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:mime-version:message-id:subject:to:from:date;
        bh=7FobbueBEyUHJox7St9JINoJzdYJmkbqIloT+4cyAnw=;
        b=D0ufBA0kAzwaMMWZsqz6xtda+2iT6AOxw2Ql86dQyZ/Gy/WH6v6MjZq1nTHaGeOpUUZFy4H++bdRk
         PJUT161eb1EoSjjlLsQHrMi/uwwnbadJIUEm9mNzelL3vrf+pjL+fUkcpGrQomgwE1ctxf8F7dlqt5
         1QZc3hs6TBBLtABgzTlCj4FC6rJKLbW/AZmgquRV0XFnTx2Y1HLQ7jjj33GpKpkzBsG7e8BKuU2l45
         w1x+VxrnkS8Ik+pZR70dfS7tOdPKGst2ffhm3wpkMJIKLljmBHoL/0PXOqMS50L2lL8h/g+JBIjlUD
         MLhKoMOMI6BAHJ8xC/PLt6sj5IiZEwg==
X-KPN-MID: 33|h/ePQhF0UDwknF8Np1aShl4zcTBpAFDPgjI24DZEeYzk/Ycwjg7H+Vuz2DG0DXL
 m2ClHoS9eLTshqyCJFtL6FAJPpAYc+rX//qY7pWJHGas=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|4QklVS1wEZIVPRU2vOPa37CdsXvRIkaNMTKz40t5aYhU77f5u7ezg7ID5RFcchf
 rcdEKBGkaD8nG3BM7ps0lsw==
X-Originating-IP: 89.8.154.252
Received: from [127.0.0.1] (telia-59089a-252.connect.netcom.no [89.8.154.252])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 4f4ed920-c54a-11ec-99a3-005056abf0db;
        Tue, 26 Apr 2022 12:19:10 +0200 (CEST)
Date:   Tue, 26 Apr 2022 12:19:07 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Nas Chung <nas.chung@chipsnmedia.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v7 0/6] staging: media: wave5: add wave5 codec driver
User-Agent: K-9 Mail for Android
In-Reply-To: <9b1cece1-98b3-7126-1f05-d010ea2b098e@chipsnmedia.com>
References: <075dc19b-d7f5-3939-f736-766ed0aaad84@xs4all.nl> <9b1cece1-98b3-7126-1f05-d010ea2b098e@chipsnmedia.com>
Message-ID: <8E33AFB1-CDAE-49B7-BFDB-257B035F8524@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Yes, v8 is fine=2E

Hans

On April 26, 2022 11:53:15 AM GMT+02:00, Nas Chung <nas=2Echung@chipsnmedi=
a=2Ecom> wrote:
>Hi, Hans,
>
>> On 25/04/2022 12:16, Nas Chung wrote:
>>> The wave5 codec is a stateful encoder/decoder=2E
>>> It is found on the J721S2 SoC, JH7100 SoC, ssd202d SoC=2E Etc=2E=2E
>>> But current test report is based on J721S2 SoC=2E
>>>
>>> The driver currently supports V4L2_PIX_FMT_HEVC, V4L2_PIX_FMT_H264=2E
>>>
>>> This driver has so far been tested on J721S2 EVM board and pre-silicon=
 FPGA=2E
>>>
>>> Testing on J721S2 EVM board shows it working fine both decoder and enc=
oder=2E
>>> The driver is successfully working with gstreamer v4l2 good-plugin wit=
hout any modification=2E
>>>
>>> Testing on FPGA also shows it working fine, though the FPGA uses polle=
d interrupts and copied buffers between the host and it's on board RAM=2E
>>>
>>> The wave5 driver will be updated to support various EXT_CTRL encoder i=
nterface=2E
>> Please note that for some unknown reason neither v6 nor v7 ever reached=
 the
>> linux-media mailinglist=2E Can you try to repost, this time just to the=
 mailinglist
>> and with a CC to me?
>>
>> I have seen this problem before but it was never clear why linux-media =
would
>> reject it=2E If you have an alternative email address you can email fro=
m, then
>> you can try that as well=2E
>
>I think my email client have a problem=2E
>I will change the email client and repost it with the latest version test=
 report=2E
>Should i rename it for PATCH V8?
>
>Thanks=2E
>Nas=2E
>
>>
>>> v4l2-compliance tests from J721S2:
>>>
>>> # v4l2-compliance -d0
>>> v4l2-compliance SHA: not available, 64 bits
>> You must compile v4l2-compliance from the v4l-utils git repo=2E You can=
 tell because
>> the SHA will be shown=2E That way I can be certain you tested with the =
latest
>> v4l2-compliance=2E
>>
>>> Compliance test for vpu-dec device /dev/video0:
>>>
>>> Driver Info:
>>>         Driver name      : vpu-dec
>>>         Card type        : vpu-dec
>>>         Bus info         : platform:vpu-dec
>>>         Driver version   : 5=2E10=2E100
>> 5=2E10 is really quite old, is it possible to test with a newer kernel?
>>
>> Regards,
>>
>>	Hans
>>
>>>         Capabilities     : 0x84204000
>>>                 Video Memory-to-Memory Multiplanar
>>>                 Streaming
>>>                 Extended Pix Format
>>>                 Device Capabilities
>>>         Device Caps      : 0x04204000
>>>                 Video Memory-to-Memory Multiplanar
>>>                 Streaming
>>>                 Extended Pix Format
>>>         Detected Stateful Decoder
>>>
>>> Required ioctls:
>>>         test VIDIOC_QUERYCAP: OK
>>>
>>> Allow for multiple opens:
>>>         test second /dev/video0 open: OK
>>>         test VIDIOC_QUERYCAP: OK
>>>         test VIDIOC_G/S_PRIORITY: OK
>>>         test for unlimited opens: OK
>>>
>>> Debug ioctls:
>>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls:
>>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>         test VIDIOC_QUERYCTRL: OK
>>>         test VIDIOC_G/S_CTRL: OK
>>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>         Standard Controls: 2 Private Controls: 1
>>>
>>> Format ioctls:
>>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>>         test VIDIOC_G_FMT: OK
>>>         test VIDIOC_TRY_FMT: OK
>>>         test VIDIOC_S_FMT: OK
>>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>         test Cropping: OK (Not Supported)
>>>         test Composing: OK
>>>         test Scaling: OK
>>>
>>> Codec ioctls:
>>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>         test VIDIOC_(TRY_)DECODER_CMD: OK
>>>
>>> Buffer ioctls:
>>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>         test VIDIOC_EXPBUF: OK
>>>         test Requests: OK (Not Supported)
>>>
>>> Total for vpu-dec device /dev/video0: 44, Succeeded: 44, Failed: 0, Wa=
rnings: 0
>>>
>>> # v4l2-compliance -d1
>>> v4l2-compliance SHA: not available, 64 bits
>>>
>>> Compliance test for vpu-enc device /dev/video1:
>>>
>>> Driver Info:
>>>         Driver name      : vpu-enc
>>>         Card type        : vpu-enc
>>>         Bus info         : platform:vpu-enc
>>>         Driver version   : 5=2E10=2E100
>>>         Capabilities     : 0x84204000
>>>                 Video Memory-to-Memory Multiplanar
>>>                 Streaming
>>>                 Extended Pix Format
>>>                 Device Capabilities
>>>         Device Caps      : 0x04204000
>>>                 Video Memory-to-Memory Multiplanar
>>>                 Streaming
>>>                 Extended Pix Format
>>>         Detected Stateful Encoder
>>>
>>> Required ioctls:
>>>         test VIDIOC_QUERYCAP: OK
>>>
>>> Allow for multiple opens:
>>>         test second /dev/video1 open: OK
>>>         test VIDIOC_QUERYCAP: OK
>>>         test VIDIOC_G/S_PRIORITY: OK
>>>         test for unlimited opens: OK
>>>
>>> Debug ioctls:
>>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls:
>>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>         test VIDIOC_QUERYCTRL: OK
>>>         test VIDIOC_G/S_CTRL: OK
>>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>         Standard Controls: 15 Private Controls: 0
>>>
>>> Format ioctls:
>>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>                 warn: =2E=2E/=2E=2E/=2E=2E/v4l-utils-1=2E18=2E1/utils/=
v4l2-compliance/v4l2-test-formats=2Ecpp(1320): S_PARM is supported for buft=
ype 2, but not for ENUM_FRAMEINTERVALS
>>>                 warn: =2E=2E/=2E=2E/=2E=2E/v4l-utils-1=2E18=2E1/utils/=
v4l2-compliance/v4l2-test-formats=2Ecpp(1320): S_PARM is supported for buft=
ype 10, but not for ENUM_FRAMEINTERVALS
>>>         test VIDIOC_G/S_PARM: OK
>>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>>         test VIDIOC_G_FMT: OK
>>>         test VIDIOC_TRY_FMT: OK
>>>         test VIDIOC_S_FMT: OK
>>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>         test Cropping: OK
>>>         test Composing: OK (Not Supported)
>>>         test Scaling: OK
>>>
>>> Codec ioctls:
>>>         test VIDIOC_(TRY_)ENCODER_CMD: OK
>>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>
>>> Buffer ioctls:
>>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>         test VIDIOC_EXPBUF: OK
>>>         test Requests: OK (Not Supported)
>>>
>>> Total for vpu-enc device /dev/video1: 44, Succeeded: 44, Failed: 0, Wa=
rnings: 2
>>>
>>> changes since v6:
>>>
>>> * update TODO file
>>> * get sram info from device tree
>>>
>>> changes since v5:
>>>
>>> * support NV12/NV21 pixelformat for encoder and decoder
>>> * handle adnormal exit and EOS
>>>
>>> changes since v4:
>>>
>>> * refactor functions in wave5-hw and fix bug reported by Daniel Palmer
>>> * rename functions and variables to better names
>>> * change variable types such as replacing s32 with u32 and int with bo=
ol as appropriate
>>>
>>> changes since v3:
>>>
>>> * Fixing all issues commented by Dan Carpenter
>>> * Change file names to have wave5- prefix
>>> * In wave5_vpu_probe, enable the clocks before reading registers, as c=
ommented from Daniel Palmer
>>> * Add more to the TODO list,
>>>
>>> changes since v2:
>>>
>>> Main fixes includes:
>>> * change the yaml and dirver code to support up to 4 clks (instead of =
one)
>>> * fix Kconfig format
>>> * remove unneeded cast,
>>> * change var types
>>> * change var names, func names
>>> * checkpatch fixes
>>>
>>> changes since v1:
>>>
>>> Fix chanes due to comments from Ezequiel and Dan Carpenter=2E Main fix=
es inclueds:
>>> * move all files to one dir 'wave5'
>>> * replace private error codes with standart error codes
>>> * fix extra spaces
>>> * various checkpatch fixes
>>> * replace private 'DPRINTK' macro with standart 'dev_err/dbg =2E=2E'
>>> * fix error handling
>>> * add more possible fixes to the TODO file
>>>
>>>
>>> Dafna Hirschfeld (1):
>>>   staging: media: wave5: Add the vdi layer
>>>
>>> Nas Chung (3):
>>>   staging: media: wave5: Add vpuapi layer
>>>   staging: media: wave5: Add the v4l2 layer
>>>   staging: media: wave5: Add TODO file
>>>
>>> Robert Beckett (2):
>>>   dt-bindings: media: staging: wave5: add yaml devicetree bindings
>>>   media: wave5: Add wave5 driver to maintainers file
>>>
>>>  =2E=2E=2E/bindings/staging/media/cnm,wave=2Eyaml      |   73 +
>>>  MAINTAINERS                                   |    9 +
>>>  drivers/staging/media/Kconfig                 |    2 +
>>>  drivers/staging/media/Makefile                |    1 +
>>>  drivers/staging/media/wave5/Kconfig           |   12 +
>>>  drivers/staging/media/wave5/Makefile          |   10 +
>>>  drivers/staging/media/wave5/TODO              |   34 +
>>>  drivers/staging/media/wave5/wave5-hw=2Ec        | 3405 ++++++++++++++=
+++
>>>  drivers/staging/media/wave5/wave5-regdefine=2Eh |  655 ++++
>>>  drivers/staging/media/wave5/wave5-vdi=2Ec       |  260 ++
>>>  drivers/staging/media/wave5/wave5-vdi=2Eh       |   81 +
>>>  drivers/staging/media/wave5/wave5-vpu-dec=2Ec   | 1385 +++++++
>>>  drivers/staging/media/wave5/wave5-vpu-enc=2Ec   | 1532 ++++++++
>>>  drivers/staging/media/wave5/wave5-vpu=2Ec       |  381 ++
>>>  drivers/staging/media/wave5/wave5-vpu=2Eh       |   73 +
>>>  drivers/staging/media/wave5/wave5-vpuapi=2Ec    | 1049 +++++
>>>  drivers/staging/media/wave5/wave5-vpuapi=2Eh    | 1144 ++++++
>>>  drivers/staging/media/wave5/wave5-vpuconfig=2Eh |   91 +
>>>  drivers/staging/media/wave5/wave5-vpuerror=2Eh  |  455 +++
>>>  drivers/staging/media/wave5/wave5=2Eh           |   82 +
>>>  20 files changed, 10734 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/staging/media/cn=
m,wave=2Eyaml
>>>  create mode 100644 drivers/staging/media/wave5/Kconfig
>>>  create mode 100644 drivers/staging/media/wave5/Makefile
>>>  create mode 100644 drivers/staging/media/wave5/TODO
>>>  create mode 100644 drivers/staging/media/wave5/wave5-hw=2Ec
>>>  create mode 100644 drivers/staging/media/wave5/wave5-regdefine=2Eh
>>>  create mode 100644 drivers/staging/media/wave5/wave5-vdi=2Ec
>>>  create mode 100644 drivers/staging/media/wave5/wave5-vdi=2Eh
>>>  create mode 100644 drivers/staging/media/wave5/wave5-vpu-dec=2Ec
>>>  create mode 100644 drivers/staging/media/wave5/wave5-vpu-enc=2Ec
>>>  create mode 100644 drivers/staging/media/wave5/wave5-vpu=2Ec
>>>  create mode 100644 drivers/staging/media/wave5/wave5-vpu=2Eh
>>>  create mode 100644 drivers/staging/media/wave5/wave5-vpuapi=2Ec
>>>  create mode 100644 drivers/staging/media/wave5/wave5-vpuapi=2Eh
>>>  create mode 100644 drivers/staging/media/wave5/wave5-vpuconfig=2Eh
>>>  create mode 100644 drivers/staging/media/wave5/wave5-vpuerror=2Eh
>>>  create mode 100644 drivers/staging/media/wave5/wave5=2Eh

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
