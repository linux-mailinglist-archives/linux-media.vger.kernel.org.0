Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC79151F48
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 18:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbgBDRWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 12:22:09 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:48679 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727334AbgBDRWJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Feb 2020 12:22:09 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud9.xs4all.net with ESMTPA
        id z1tiiuSKA2Mf2z1tlibWSl; Tue, 04 Feb 2020 18:22:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580836926; bh=G56I1cMPCBYQC0WzXcqOnQys1Coj8Ew5DO83q+FDt2w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=V1wVjJEsLqGTy7KEnHzJGu4e3rkzqflxXqb09372QnjktjhSrnopKXS+TAaM6TeYB
         a4GS53hYN3ETuz3Yf8pq3A/meHujnsSxPk1peBFSaQfaXvhKYRHnu4FKz0Mg7dc6uR
         yOqN/nlzpPjaS4EdLI09Qsm9DgkrW6RMwwym4QmlksOQFZTzEOabS/eKAzBaldxisX
         WbLLAw65ZSqaiZPsfjYwZphiVuEMuROKjkOv4tYScdVWBHRMK0Cl5jz3gyTHybusbQ
         fGzJQa6kLosT+6Dmt6TJH5Vj5VmxxK/+86NjWPtsCqpriyXOFz+PZxYByMgkXN29cu
         fDIfmG+NVdm4Q==
Subject: Re: [RFC PATCH v1 0/5] Add Tegra driver for video capture
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <098ac46f-fe13-f215-b9a4-aa8d01395592@xs4all.nl>
 <6c3d2557-8982-37bf-810a-6d9faad9e5a4@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9c4775f2-8188-43f4-1de1-56620fad2e7c@xs4all.nl>
Date:   Tue, 4 Feb 2020 18:22:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6c3d2557-8982-37bf-810a-6d9faad9e5a4@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOv5n5FzV0yBs9P+EL/MnegkfwsTm+MoLqOBT6agWrm/I7ECFvQkBnzX4sd943DFKa+vtdf0OAmGBwqEpg6Uh7UzcWRl1Dcg+D3CK0nh1K9G6nQkpXYh
 r1YPQVrCMgfncAnt/lb0d7k69Pg1a+E5i+uir8nbHpqlyv9FxCzzAq4fQVjjcdX0hflYcTmy5mZ3yAS02446Ad9yM7dvAFmWJaiWtA0sK/VRzBgKmoLdtzwt
 HHENN/ps5JsJ6xiPKkrPYD29BQrOpH2Y0QfDBRpYNb21ZsQ2TEuXAg4lWjTirGqhmyGh0A98UX0Kb+kZ9lj1cL/gn54KmGEg1SIOokgjt6AIU0doey5VOPvU
 wIXGcF3wUwEpzxC/iPQMN8Az09bmwrJwsLqhIKZ6qdiSunBzJrWzu9JHx+LUw/4sfAEFvfXeatynjoMGDwfewaTJWbNzBtwIQMuH8i3DEqHDLUonlls=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/4/20 5:42 PM, Sowjanya Komatineni wrote:
> 
> On 2/4/20 4:53 AM, Hans Verkuil wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
>>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>>> generator (TPG) capture.
>>>
>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>
>>> This series has TPG support only where it creates hard media links
>>> between CSI subdevice and VI video device without device graphs.
>>>
>>> v4l2-compliance results are available below the patch diff.
>>>
>>> [v0]: Includes,
>>>        - Adds CSI TPG clock to Tegra210 clock driver
>>>        - Host1x video driver with VI and CSI clients.
>>>        - Support for Tegra210 only.
>>>        - VI CSI TPG support with hard media links in driver.
>>>        - Video formats supported by Tegra210 VI
>>>        - CSI TPG supported video formats
>>>
>>>
>>> Sowjanya Komatineni (5):
>>>    dt-bindings: clock: tegra: Add clk id for CSI TPG clock
>>>    clk: tegra: Add Tegra210 CSI TPG clock gate
>>>    dt-binding: tegra: Add VI and CSI bindings
>>>    media: tegra: Add Tegra Video input driver for Tegra210
>>>    arm64: tegra: Add Tegra VI CSI suppport in device tree
>>>
>>>   .../display/tegra/nvidia,tegra20-host1x.txt        |  10 +-
>>>   arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   8 +
>>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  31 +-
>>>   drivers/clk/tegra/clk-tegra210.c                   |   7 +
>>>   drivers/staging/media/Kconfig                      |   2 +
>>>   drivers/staging/media/Makefile                     |   1 +
>>>   drivers/staging/media/tegra/Kconfig                |  12 +
>>>   drivers/staging/media/tegra/Makefile               |  11 +
>>>   drivers/staging/media/tegra/TODO                   |  10 +
>>>   drivers/staging/media/tegra/csi.h                  | 111 ++++
>>>   drivers/staging/media/tegra/csi2_fops.c            | 335 +++++++++++
>>>   drivers/staging/media/tegra/csi2_fops.h            |  15 +
>>>   drivers/staging/media/tegra/host1x-video.c         | 120 ++++
>>>   drivers/staging/media/tegra/host1x-video.h         |  33 ++
>>>   drivers/staging/media/tegra/mc_common.h            | 131 +++++
>>>   drivers/staging/media/tegra/tegra-channel.c        | 628 +++++++++++++++++++++
>>>   drivers/staging/media/tegra/tegra-core.c           | 111 ++++
>>>   drivers/staging/media/tegra/tegra-core.h           | 125 ++++
>>>   drivers/staging/media/tegra/tegra-csi.c            | 380 +++++++++++++
>>>   drivers/staging/media/tegra/tegra-vi.c             | 351 ++++++++++++
>>>   drivers/staging/media/tegra/tegra-vi.h             | 101 ++++
>>>   drivers/staging/media/tegra/vi2_fops.c             | 364 ++++++++++++
>>>   drivers/staging/media/tegra/vi2_fops.h             |  15 +
>>>   drivers/staging/media/tegra/vi2_formats.h          | 119 ++++
>>>   drivers/staging/media/tegra/vi2_registers.h        | 194 +++++++
>>>   include/dt-bindings/clock/tegra210-car.h           |   2 +-
>>>   26 files changed, 3224 insertions(+), 3 deletions(-)
>>>   create mode 100644 drivers/staging/media/tegra/Kconfig
>>>   create mode 100644 drivers/staging/media/tegra/Makefile
>>>   create mode 100644 drivers/staging/media/tegra/TODO
>>>   create mode 100644 drivers/staging/media/tegra/csi.h
>>>   create mode 100644 drivers/staging/media/tegra/csi2_fops.c
>>>   create mode 100644 drivers/staging/media/tegra/csi2_fops.h
>>>   create mode 100644 drivers/staging/media/tegra/host1x-video.c
>>>   create mode 100644 drivers/staging/media/tegra/host1x-video.h
>>>   create mode 100644 drivers/staging/media/tegra/mc_common.h
>>>   create mode 100644 drivers/staging/media/tegra/tegra-channel.c
>>>   create mode 100644 drivers/staging/media/tegra/tegra-core.c
>>>   create mode 100644 drivers/staging/media/tegra/tegra-core.h
>>>   create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>>   create mode 100644 drivers/staging/media/tegra/vi2_fops.c
>>>   create mode 100644 drivers/staging/media/tegra/vi2_fops.h
>>>   create mode 100644 drivers/staging/media/tegra/vi2_formats.h
>>>   create mode 100644 drivers/staging/media/tegra/vi2_registers.h
>>>
>>>
>>> v4l2-compliance SHA: e7402fb758fd106955c3b7d5a5e961d1cb606f4a, 32 bits, 32-bit time_t
>>>
>>> Compliance test for tegra-video device /dev/video0:
>> Since this driver creates a /dev/media0 device you should test with:
>>
>> v4l2-compliance -m0 -s10: that tests everything found in the media topology.
>>
>> It finds a few issues in the media topology itself:
>>
>> ----------------------------------------------------------------------------
>> $ v4l2-compliance -M0
>> v4l2-compliance SHA: 5af0730d06247a2de487abf2e00e70b156f1fb82, 64 bits, 64-bit time_t
>>
>> Compliance test for host1x_video device /dev/media0:
>>
>> Media Driver Info:
>>          Driver name      : host1x_video
>>          Model            : NVIDIA Tegra Video Input Device
>>          Serial           :
>>          Bus info         :
>>          Media version    : 5.5.0
>>          Hardware revision: 0x00000003 (3)
>>          Driver version   : 5.5.0
>>
>> Required ioctls:
>>                  warn: v4l2-test-media.cpp(52): empty bus_info
>>          test MEDIA_IOC_DEVICE_INFO: OK
>>
>> Allow for multiple opens:
>>          test second /dev/media0 open: OK
>>                  warn: v4l2-test-media.cpp(52): empty bus_info
>>          test MEDIA_IOC_DEVICE_INFO: OK
>>          test for unlimited opens: OK
>>
>> Media Controller ioctls:
>>                  fail: v4l2-test-media.cpp(117): function == MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN
>>                  fail: v4l2-test-media.cpp(203): checkFunction(ent.function, true)
>>          test MEDIA_IOC_G_TOPOLOGY: FAIL
>>                  fail: v4l2-test-media.cpp(390): num_data_links != num_links
>>          test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL
>>          test MEDIA_IOC_SETUP_LINK: OK
>>          test invalid ioctls: OK
>>
>> Total for host1x_video device /dev/media0: 8, Succeeded: 6, Failed: 2, Warnings: 2
>> ----------------------------------------------------------------------------
>>
>> Note: the -M0 option tests just /dev/media0 without testing any of the devices
>> mentioned in the topology. Use -m0 for that.
> OK
>> I see a lot of spam in the kernel log:
>>
>> [  484.362145] tegra-vi 54080000.vi: TPG mode is set to Black/White Direct Mode
>> [  486.147937] tegra-csi 54080838.csi: using Tegra default WIDTH X HEIGHT (1920x1080)
>> [  486.155499] tegra-csi 54080838.csi: using Tegra default RAW10 video format
>> [  486.162403] tegra-csi 54080838.csi: using Tegra default RAW10 video format
>>
>> Change that to dev_dbg or delete altogether.
> 
> ok, removed TPG mode message in v2.
> 
> Other above messages are to log using default format when requested 
> format is not supported by TPG mode.
> 
> Will change them to dev_dbg.
> 
>>
>> I also noticed that changing the test pattern while streaming did not seem to have
>> any effect until I stop and restart streaming. Is that a limitation of the HW or of
>> the driver?
> 
> Do you mean changing test pattern mode of different channel while other 
> channels are streaming?

No, from the same channel. E.g. v4l2-ctl --stream-mmap, then do from another
console 'v4l2-ctl -c test-pattern=1'.

It depends on the hardware whether or not you can change the test pattern
while streaming. But it is nice for testing if this is possible.

> 
> In v1, pg mode from handler is stored in vi which is common for all 
> channels.
> 
> So, v2 has change to use channel specific pg mode rather than common 
> mode for all channels.

That sounds better. You want independent test patterns for each channel
if possible.

Regards,

	Hans

> 
>>
>> Note that the RGB pixelformat appears to be incorrect: it is set to RGB32 but it
>> should be BGR32. Actually, it should be XBGR32 since there is no alpha channel
>> present (I think). RGB32 and BGR32 are deprecated in favor of RGBX/A and X/ABGR.
>>
>> Regards,
>>
>>          Hans
> Will fix it.
>>> Driver Info:
>>>          Driver name      : tegra-video
>>>          Card type        : 54080000.vi-output-0
>>>          Bus info         : platform:54080000.vi:0
>>>          Driver version   : 5.5.0
>>>          Capabilities     : 0x85200001
>>>                  Video Capture
>>>                  Read/Write
>>>                  Streaming
>>>                  Extended Pix Format
>>>                  Device Capabilities
>>>          Device Caps      : 0x05200001
>>>                  Video Capture
>>>                  Read/Write
>>>                  Streaming
>>>                  Extended Pix Format
>>> Media Driver Info:
>>>          Driver name      : host1x_video
>>>          Model            : NVIDIA Tegra Video Input Device
>>>          Serial           :
>>>          Bus info         :
>>>          Media version    : 5.5.0
>>>          Hardware revision: 0x00000003 (3)
>>>          Driver version   : 5.5.0
>>> Interface Info:
>>>          ID               : 0x03000003
>>>          Type             : V4L Video
>>> Entity Info:
>>>          ID               : 0x00000001 (1)
>>>          Name             : 54080000.vi-output-0
>>>          Function         : V4L2 I/O
>>>          Pad 0x01000002   : 0: Sink
>>>            Link 0x0200001b: from remote pad 0x100001a of entity 'tpg-0': Data, Enabled
>>>
>>> Required ioctls:
>>>          test MC information (see 'Media Driver Info' above): OK
>>>          test VIDIOC_QUERYCAP: OK
>>>
>>> Allow for multiple opens:
>>>          test second /dev/video0 open: OK
>>>          test VIDIOC_QUERYCAP: OK
>>>          test VIDIOC_G/S_PRIORITY: OK
>>>          test for unlimited opens: OK
>>>
>>>          test invalid ioctls: OK
>>> Debug ioctls:
>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>          test VIDIOC_G/S/ENUMINPUT: OK
>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>          Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls (Input 0):
>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>          test VIDIOC_QUERYCTRL: OK
>>>          test VIDIOC_G/S_CTRL: OK
>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>          Standard Controls: 2 Private Controls: 0
>>>
>>> Format ioctls (Input 0):
>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>          test VIDIOC_G_FMT: OK
>>>          test VIDIOC_TRY_FMT: OK
>>>          test VIDIOC_S_FMT: OK
>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>          test Cropping: OK (Not Supported)
>>>          test Composing: OK (Not Supported)
>>>          test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls (Input 0):
>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>
>>> Buffer ioctls (Input 0):
>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>          test VIDIOC_EXPBUF: OK
>>>          test Requests: OK (Not Supported)
>>>
>>> Test input 0:
>>>
>>> Streaming ioctls:
>>>          test read/write: OK
>>>          test blocking wait: OK
>>>          test MMAP (no poll): OK
>>>          test MMAP (select): OK
>>>          test MMAP (epoll): OK
>>>          test USERPTR (no poll): OK (Not Supported)
>>>          test USERPTR (select): OK (Not Supported)
>>>          test DMABUF: Cannot test, specify --expbuf-device
>>>
>>> Total for tegra-video device /dev/video0: 53, Succeeded: 53, Failed: 0, Warnings: 0
>>>

