Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9B901549CC
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 17:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbgBFQ6E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 11:58:04 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13091 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgBFQ6D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 11:58:03 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3c457d0000>; Thu, 06 Feb 2020 08:57:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Feb 2020 08:57:58 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Feb 2020 08:57:58 -0800
Received: from [10.2.167.216] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Feb
 2020 16:57:57 +0000
Subject: Re: [RFC PATCH v2 0/6] Add Tegra driver for video capture
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1580937806-17376-1-git-send-email-skomatineni@nvidia.com>
 <e455f767-ccf1-7707-51df-f37a40a44f9a@xs4all.nl>
 <69dfbac3-ec21-3f8e-1e9b-63cb117e2dea@nvidia.com>
 <782ee810-1858-ce1f-3be2-46d657a33227@collabora.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <cdb80b61-5f56-cf06-88f9-70954179cafc@nvidia.com>
Date:   Thu, 6 Feb 2020 08:57:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <782ee810-1858-ce1f-3be2-46d657a33227@collabora.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581008253; bh=R1THBG4zt0mt12PThKnWHUTXMh7XELDpQBgoblqWGIw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=klkzux8znx0cZspTR1VSBdnGgowddAJsyWmuVrZYYk1VFN2OGanJSF3f6pNEl1aMc
         TU66RAnSuCXjtf5fm1asVbTBUE+hKqJooxekkxXC78s/Bu2eWJpKaw5vEC85xaU7EQ
         IoSDpAtRB2h8qdNvM2GKe4mC445OjacRvSsAbaaET3oVHPdwsQhbpn3G8BBabBqL5T
         ws/5PUyuQk3HQOWr/U1kApyTVyQF5iqGdMRBcvOwV1crfSET3fJEyYXhMleVurf7fn
         D5S5+1yG/A0Rg4tcl19SrGkIQd4C/95dBX7w4JjPb+E+KpNoqAWf6pOYFRd1L50At9
         5yPN/KvG1essg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/6/20 8:54 AM, Helen Koike wrote:
> External email: Use caution opening links or attachments
>
>
> On 2/6/20 1:51 PM, Sowjanya Komatineni wrote:
>> On 2/6/20 4:01 AM, Hans Verkuil wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 2/5/20 10:23 PM, Sowjanya Komatineni wrote:
>>>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>>>> generator (TPG) capture.
>>>>
>>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>>
>>>> This series has TPG support only where it creates hard media links
>>>> between CSI subdevice and VI video device without device graphs.
>>> Hmm, I tried this series and as soon as I ran 'v4l2-ctl --stream-mmap' =
(first
>>> thing I did after booting up the Jetson TX1) I got this in the kernel l=
og:
>>>
>>> [=C2=A0 184.867368] video4linux video0: MW_ACK_DONE syncpoint timeout: =
-11
>>> [=C2=A0 184.867373] video4linux video0: frame start syncpt timeout: -11
>>> [=C2=A0 184.879460] video4linux video0: TEGRA_VI_CSI_ERROR_STATUS 0x000=
00000
>>> [=C2=A0 184.886507] video4linux video0: TEGRA_VI_CFG_VI_INCR_SYNCPT_ERR=
OR 0x00000000
>>> [=C2=A0 184.896306] tegra-csi 54080838.csi: TEGRA_CSI_PIXEL_PARSER_STAT=
US 0x00004031
>>> [=C2=A0 184.906103] tegra-csi 54080838.csi: TEGRA_CSI_CIL_STATUS 0x0000=
0000
>>> [=C2=A0 184.914428] tegra-csi 54080838.csi: TEGRA_CSI_CILX_STATUS 0x000=
00000
>>> [=C2=A0 185.699375] video4linux video0: MW_ACK_DONE syncpoint timeout: =
-11
>>>
>>> Running v4l2-compliance -m0 -s10 after boot will just hang and I see a =
single
>>>
>>> [=C2=A0=C2=A0 40.354218] video4linux video0: MW_ACK_DONE syncpoint time=
out: -11
>>>
>>> in the kernel log.
>> I tried several times and somehow couldn't see this. Will do more testin=
g...
>>> This still uses the three patches from Thierry, I just replaced the old
>>> v1 patches with the new v2 and rebased everything to the latest mainlin=
e
>>> code.
>>>
>>> I also noticed the new /dev/v4l-subdev devices.
>>>
>>> There are two ways to create video drivers: either as a straightforward
>>> video pipeline where all configuration is done through the video device
>>> node: e.g. setting the format with S_FMT will configure the whole pipel=
ine,
>>> including sensors etc. for that format.
>>>
>>> The other method is one where userspace has to configure the whole pipe=
line,
>>> configuring not just the video device but also the v4l-subdev devices t=
hat
>>> are part of that pipeline. In addition, you can typically change routin=
g
>>> in the topology using the media device.
>>>
>>> The advantage is full control, the disadvantage is that it is much more
>>> work in userspace and that you will need to support this driver in the
>>> libcamera framework.
>>>
>>> Now, this driver is just a simple video pipeline where you capture the
>>> video to memory. There is no need to make things complex. Unless NVIDIA
>>> plans to open up more of their camera pipeline. Complex camera pipeline=
s
>>> DO need this advanced functionality.
>>>
>>> Regards,
>>>
>>>           Hans
>> v1 configures S_FMT for whole pipeline (video, sensors thru subdevices) =
thru video device node.
>>
>> But based on Helen feedback for v1, removed it from video S_FMT and adde=
d link_validate in v2.
> I mentioned because in v1 you were already exposing the channels with V4L=
2_SUBDEV_FL_HAS_DEVNODE,
> which were exposing get/set_fmt in the csi subdevice.
> I can be wrong, but if I understand correctly, or you configure all the p=
ads through the
> video node, or you expose all the subdevices and let userspace to configu=
re them, not a mix.
>
> Regards,
> Helen

Removing subdevice nodes is easier. But I was referring to your v1 feedback

"entities formats should be independent, it is up to link_validate
to check formats between entities.
The capture shouldn't change the format of the subdevice"

If we all agree to have video node do all pipeline formats, which is=20
what I have in v1, will revert to that in v3.


>> With this user space has to configure so had to create nodes for subdevi=
ce nodes also.
>>
>> Please confirm if we want to stick with doing S_FMT configuration for co=
mplete pipeline from video device node.
>>
>> Will change back in v3.
>>
>>>> v4l2-compliance results are available below the patch diff.
>>>>
>>>> [v1]: Includes,
>>>>         - v0 feedback
>>>>         - Merged files to have Tegra specific separately
>>>>         - Moved CSI device as child to VI as Tegra210 CSI is
>>>>           part of VI sharing same host interface and register
>>>>           space.
>>>>         - Added link_validate for format validation.
>>>>         - Fixes for passing v4l2-compliance for media, video,
>>>>           and subdevices.
>>>>
>>>> [v0]: Includes,
>>>>         - Adds CSI TPG clock to Tegra210 clock driver
>>>>         - Host1x video driver with VI and CSI clients.
>>>>         - Support for Tegra210 only.
>>>>         - VI CSI TPG support with hard media links in driver.
>>>>         - Video formats supported by Tegra210 VI
>>>>         - CSI TPG supported video formats
>>>>
>>>>
>>>> Sowjanya Komatineni (6):
>>>>     dt-bindings: clock: tegra: Add clk id for CSI TPG clock
>>>>     clk: tegra: Add Tegra210 CSI TPG clock gate
>>>>     dt-binding: tegra: Add VI and CSI bindings
>>>>     media: tegra: Add Tegra210 Video input driver
>>>>     MAINTAINERS: Add Tegra Video driver section
>>>>     arm64: tegra: Add Tegra VI CSI suppport in device tree
>>>>
>>>>    .../display/tegra/nvidia,tegra20-host1x.txt        |=C2=A0 55 +-
>>>>    MAINTAINERS                                        |=C2=A0 10 +
>>>>    arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |=C2=A0=C2=A0 8 =
+
>>>>    arch/arm64/boot/dts/nvidia/tegra210.dtsi           |=C2=A0 36 +-
>>>>    drivers/clk/tegra/clk-tegra210.c                   |=C2=A0=C2=A0 7 =
+
>>>>    drivers/staging/media/Kconfig                      |=C2=A0=C2=A0 2 =
+
>>>>    drivers/staging/media/Makefile                     |=C2=A0=C2=A0 1 =
+
>>>>    drivers/staging/media/tegra/Kconfig                |=C2=A0 10 +
>>>>    drivers/staging/media/tegra/Makefile               |=C2=A0=C2=A0 8 =
+
>>>>    drivers/staging/media/tegra/TODO                   |=C2=A0 10 +
>>>>    drivers/staging/media/tegra/tegra-common.h         | 237 +++++
>>>>    drivers/staging/media/tegra/tegra-csi.c            | 374 ++++++++
>>>>    drivers/staging/media/tegra/tegra-csi.h            | 116 +++
>>>>    drivers/staging/media/tegra/tegra-vi.c             | 998 ++++++++++=
+++++++++++
>>>>    drivers/staging/media/tegra/tegra-vi.h             |=C2=A0 82 ++
>>>>    drivers/staging/media/tegra/tegra-video.c          | 118 +++
>>>>    drivers/staging/media/tegra/tegra-video.h          |=C2=A0 32 +
>>>>    drivers/staging/media/tegra/tegra210.c             | 698 ++++++++++=
++++
>>>>    drivers/staging/media/tegra/tegra210.h             | 190 ++++
>>>>    include/dt-bindings/clock/tegra210-car.h           |=C2=A0=C2=A0 2 =
+-
>>>>    20 files changed, 2984 insertions(+), 10 deletions(-)
>>>>    create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>    create mode 100644 drivers/staging/media/tegra/Makefile
>>>>    create mode 100644 drivers/staging/media/tegra/TODO
>>>>    create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>>>    create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>>>    create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>>>    create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>>>    create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>>>    create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>>>    create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>
>>>> ./v4l2-compliance -m0 -s10
>>>> v4l2-compliance SHA: e7402fb758fd106955c3b7d5a5e961d1cb606f4a, 32 bits=
, 32-bit time_t
>>>>
>>>> Compliance test for tegra-video device /dev/media0:
>>>>
>>>> Media Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Model            : NVIDIA Tegra Video Input Device
>>>>           Serial           :
>>>>           Bus info         : platform:54080000.vi
>>>>           Media version    : 5.5.0
>>>>           Hardware revision: 0x00000003 (3)
>>>>           Driver version   : 5.5.0
>>>>
>>>> Required ioctls:
>>>>           test MEDIA_IOC_DEVICE_INFO: OK
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/media0 open: OK
>>>>           test MEDIA_IOC_DEVICE_INFO: OK
>>>>           test for unlimited opens: OK
>>>>
>>>> Media Controller ioctls:
>>>>           test MEDIA_IOC_G_TOPOLOGY: OK
>>>>           Entities: 12 Interfaces: 12 Pads: 12 Links: 18
>>>>           test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>>>>           test MEDIA_IOC_SETUP_LINK: OK
>>>>           test invalid ioctls: OK
>>>>
>>>> Total for tegra-video device /dev/media0: 8, Succeeded: 8, Failed: 0, =
Warnings: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for tegra-video device /dev/video0:
>>>>
>>>> Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Card type        : 54080000.vi-output-0
>>>>           Bus info         : platform:54080000.vi
>>>>           Driver version   : 5.5.0
>>>>           Capabilities     : 0x85200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>>                   Device Capabilities
>>>>           Device Caps      : 0x05200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>> Media Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Model            : NVIDIA Tegra Video Input Device
>>>>           Serial           :
>>>>           Bus info         : platform:54080000.vi
>>>>           Media version    : 5.5.0
>>>>           Hardware revision: 0x00000003 (3)
>>>>           Driver version   : 5.5.0
>>>> Interface Info:
>>>>           ID               : 0x03000003
>>>>           Type             : V4L Video
>>>> Entity Info:
>>>>           ID               : 0x00000001 (1)
>>>>           Name             : 54080000.vi-output-0
>>>>           Function         : V4L2 I/O
>>>>           Pad 0x01000002   : 0: Sink
>>>>             Link 0x0200001b: from remote pad 0x100001a of entity 'tpg-=
0': Data, Enabled
>>>>
>>>> Required ioctls:
>>>>           test MC information (see 'Media Driver Info' above): OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/video0 open: OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>           test VIDIOC_G/S_PRIORITY: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls (Input 0):
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>           test VIDIOC_QUERYCTRL: OK
>>>>           test VIDIOC_G/S_CTRL: OK
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 2 Private Controls: 0
>>>>
>>>> Format ioctls (Input 0):
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK
>>>>           test VIDIOC_TRY_FMT: OK
>>>>           test VIDIOC_S_FMT: OK
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK
>>>>
>>>> Codec ioctls (Input 0):
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls (Input 0):
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>           test VIDIOC_EXPBUF: OK
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Test input 0:
>>>>
>>>> Streaming ioctls:
>>>>           test read/write: OK
>>>>           test blocking wait: OK
>>>>           test MMAP (no poll): OK
>>>>           test MMAP (select): OK
>>>>           test MMAP (epoll): OK
>>>>           test USERPTR (no poll): OK (Not Supported)
>>>>           test USERPTR (select): OK (Not Supported)
>>>>           test DMABUF: Cannot test, specify --expbuf-device
>>>>
>>>> Total for tegra-video device /dev/video0: 53, Succeeded: 53, Failed: 0=
, Warnings: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for tegra-video device /dev/video1:
>>>>
>>>> Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Card type        : 54080000.vi-output-1
>>>>           Bus info         : platform:54080000.vi
>>>>           Driver version   : 5.5.0
>>>>           Capabilities     : 0x85200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>>                   Device Capabilities
>>>>           Device Caps      : 0x05200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>> Media Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Model            : NVIDIA Tegra Video Input Device
>>>>           Serial           :
>>>>           Bus info         : platform:54080000.vi
>>>>           Media version    : 5.5.0
>>>>           Hardware revision: 0x00000003 (3)
>>>>           Driver version   : 5.5.0
>>>> Interface Info:
>>>>           ID               : 0x03000007
>>>>           Type             : V4L Video
>>>> Entity Info:
>>>>           ID               : 0x00000005 (5)
>>>>           Name             : 54080000.vi-output-1
>>>>           Function         : V4L2 I/O
>>>>           Pad 0x01000006   : 0: Sink
>>>>             Link 0x0200001f: from remote pad 0x100001e of entity 'tpg-=
1': Data, Enabled
>>>>
>>>> Required ioctls:
>>>>           test MC information (see 'Media Driver Info' above): OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/video1 open: OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>           test VIDIOC_G/S_PRIORITY: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls (Input 0):
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>           test VIDIOC_QUERYCTRL: OK
>>>>           test VIDIOC_G/S_CTRL: OK
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 2 Private Controls: 0
>>>>
>>>> Format ioctls (Input 0):
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK
>>>>           test VIDIOC_TRY_FMT: OK
>>>>           test VIDIOC_S_FMT: OK
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK
>>>>
>>>> Codec ioctls (Input 0):
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls (Input 0):
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>           test VIDIOC_EXPBUF: OK
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Test input 0:
>>>>
>>>> Streaming ioctls:
>>>>           test read/write: OK
>>>>           test blocking wait: OK
>>>>           test MMAP (no poll): OK
>>>>           test MMAP (select): OK
>>>>           test MMAP (epoll): OK
>>>>           test USERPTR (no poll): OK (Not Supported)
>>>>           test USERPTR (select): OK (Not Supported)
>>>>           test DMABUF: Cannot test, specify --expbuf-device
>>>>
>>>> Total for tegra-video device /dev/video1: 53, Succeeded: 53, Failed: 0=
, Warnings: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for tegra-video device /dev/video2:
>>>>
>>>> Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Card type        : 54080000.vi-output-2
>>>>           Bus info         : platform:54080000.vi
>>>>           Driver version   : 5.5.0
>>>>           Capabilities     : 0x85200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>>                   Device Capabilities
>>>>           Device Caps      : 0x05200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>> Media Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Model            : NVIDIA Tegra Video Input Device
>>>>           Serial           :
>>>>           Bus info         : platform:54080000.vi
>>>>           Media version    : 5.5.0
>>>>           Hardware revision: 0x00000003 (3)
>>>>           Driver version   : 5.5.0
>>>> Interface Info:
>>>>           ID               : 0x0300000b
>>>>           Type             : V4L Video
>>>> Entity Info:
>>>>           ID               : 0x00000009 (9)
>>>>           Name             : 54080000.vi-output-2
>>>>           Function         : V4L2 I/O
>>>>           Pad 0x0100000a   : 0: Sink
>>>>             Link 0x02000023: from remote pad 0x1000022 of entity 'tpg-=
2': Data, Enabled
>>>>
>>>> Required ioctls:
>>>>           test MC information (see 'Media Driver Info' above): OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/video2 open: OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>           test VIDIOC_G/S_PRIORITY: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls (Input 0):
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>           test VIDIOC_QUERYCTRL: OK
>>>>           test VIDIOC_G/S_CTRL: OK
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 2 Private Controls: 0
>>>>
>>>> Format ioctls (Input 0):
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK
>>>>           test VIDIOC_TRY_FMT: OK
>>>>           test VIDIOC_S_FMT: OK
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK
>>>>
>>>> Codec ioctls (Input 0):
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls (Input 0):
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>           test VIDIOC_EXPBUF: OK
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Test input 0:
>>>>
>>>> Streaming ioctls:
>>>>           test read/write: OK
>>>>           test blocking wait: OK
>>>>           test MMAP (no poll): OK
>>>>           test MMAP (select): OK
>>>>           test MMAP (epoll): OK
>>>>           test USERPTR (no poll): OK (Not Supported)
>>>>           test USERPTR (select): OK (Not Supported)
>>>>           test DMABUF: Cannot test, specify --expbuf-device
>>>>
>>>> Total for tegra-video device /dev/video2: 53, Succeeded: 53, Failed: 0=
, Warnings: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for tegra-video device /dev/video3:
>>>>
>>>> Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Card type        : 54080000.vi-output-3
>>>>           Bus info         : platform:54080000.vi
>>>>           Driver version   : 5.5.0
>>>>           Capabilities     : 0x85200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>>                   Device Capabilities
>>>>           Device Caps      : 0x05200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>> Media Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Model            : NVIDIA Tegra Video Input Device
>>>>           Serial           :
>>>>           Bus info         : platform:54080000.vi
>>>>           Media version    : 5.5.0
>>>>           Hardware revision: 0x00000003 (3)
>>>>           Driver version   : 5.5.0
>>>> Interface Info:
>>>>           ID               : 0x0300000f
>>>>           Type             : V4L Video
>>>> Entity Info:
>>>>           ID               : 0x0000000d (13)
>>>>           Name             : 54080000.vi-output-3
>>>>           Function         : V4L2 I/O
>>>>           Pad 0x0100000e   : 0: Sink
>>>>             Link 0x02000027: from remote pad 0x1000026 of entity 'tpg-=
3': Data, Enabled
>>>>
>>>> Required ioctls:
>>>>           test MC information (see 'Media Driver Info' above): OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/video3 open: OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>           test VIDIOC_G/S_PRIORITY: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls (Input 0):
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>           test VIDIOC_QUERYCTRL: OK
>>>>           test VIDIOC_G/S_CTRL: OK
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 2 Private Controls: 0
>>>>
>>>> Format ioctls (Input 0):
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK
>>>>           test VIDIOC_TRY_FMT: OK
>>>>           test VIDIOC_S_FMT: OK
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK
>>>>
>>>> Codec ioctls (Input 0):
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls (Input 0):
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>           test VIDIOC_EXPBUF: OK
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Test input 0:
>>>>
>>>> Streaming ioctls:
>>>>           test read/write: OK
>>>>           test blocking wait: OK
>>>>           test MMAP (no poll): OK
>>>>           test MMAP (select): OK
>>>>           test MMAP (epoll): OK
>>>>           test USERPTR (no poll): OK (Not Supported)
>>>>           test USERPTR (select): OK (Not Supported)
>>>>           test DMABUF: Cannot test, specify --expbuf-device
>>>>
>>>> Total for tegra-video device /dev/video3: 53, Succeeded: 53, Failed: 0=
, Warnings: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for tegra-video device /dev/video4:
>>>>
>>>> Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Card type        : 54080000.vi-output-4
>>>>           Bus info         : platform:54080000.vi
>>>>           Driver version   : 5.5.0
>>>>           Capabilities     : 0x85200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>>                   Device Capabilities
>>>>           Device Caps      : 0x05200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>> Media Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Model            : NVIDIA Tegra Video Input Device
>>>>           Serial           :
>>>>           Bus info         : platform:54080000.vi
>>>>           Media version    : 5.5.0
>>>>           Hardware revision: 0x00000003 (3)
>>>>           Driver version   : 5.5.0
>>>> Interface Info:
>>>>           ID               : 0x03000013
>>>>           Type             : V4L Video
>>>> Entity Info:
>>>>           ID               : 0x00000011 (17)
>>>>           Name             : 54080000.vi-output-4
>>>>           Function         : V4L2 I/O
>>>>           Pad 0x01000012   : 0: Sink
>>>>             Link 0x0200002b: from remote pad 0x100002a of entity 'tpg-=
4': Data, Enabled
>>>>
>>>> Required ioctls:
>>>>           test MC information (see 'Media Driver Info' above): OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/video4 open: OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>           test VIDIOC_G/S_PRIORITY: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls (Input 0):
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>           test VIDIOC_QUERYCTRL: OK
>>>>           test VIDIOC_G/S_CTRL: OK
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 2 Private Controls: 0
>>>>
>>>> Format ioctls (Input 0):
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK
>>>>           test VIDIOC_TRY_FMT: OK
>>>>           test VIDIOC_S_FMT: OK
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK
>>>>
>>>> Codec ioctls (Input 0):
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls (Input 0):
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>           test VIDIOC_EXPBUF: OK
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Test input 0:
>>>>
>>>> Streaming ioctls:
>>>>           test read/write: OK
>>>>           test blocking wait: OK
>>>>           test MMAP (no poll): OK
>>>>           test MMAP (select): OK
>>>>           test MMAP (epoll): OK
>>>>           test USERPTR (no poll): OK (Not Supported)
>>>>           test USERPTR (select): OK (Not Supported)
>>>>           test DMABUF: Cannot test, specify --expbuf-device
>>>>
>>>> Total for tegra-video device /dev/video4: 53, Succeeded: 53, Failed: 0=
, Warnings: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for tegra-video device /dev/video5:
>>>>
>>>> Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Card type        : 54080000.vi-output-5
>>>>           Bus info         : platform:54080000.vi
>>>>           Driver version   : 5.5.0
>>>>           Capabilities     : 0x85200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>>                   Device Capabilities
>>>>           Device Caps      : 0x05200001
>>>>                   Video Capture
>>>>                   Read/Write
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>> Media Driver Info:
>>>>           Driver name      : tegra-video
>>>>           Model            : NVIDIA Tegra Video Input Device
>>>>           Serial           :
>>>>           Bus info         : platform:54080000.vi
>>>>           Media version    : 5.5.0
>>>>           Hardware revision: 0x00000003 (3)
>>>>           Driver version   : 5.5.0
>>>> Interface Info:
>>>>           ID               : 0x03000017
>>>>           Type             : V4L Video
>>>> Entity Info:
>>>>           ID               : 0x00000015 (21)
>>>>           Name             : 54080000.vi-output-5
>>>>           Function         : V4L2 I/O
>>>>           Pad 0x01000016   : 0: Sink
>>>>             Link 0x0200002f: from remote pad 0x100002e of entity 'tpg-=
5': Data, Enabled
>>>>
>>>> Required ioctls:
>>>>           test MC information (see 'Media Driver Info' above): OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/video5 open: OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>           test VIDIOC_G/S_PRIORITY: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls (Input 0):
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>           test VIDIOC_QUERYCTRL: OK
>>>>           test VIDIOC_G/S_CTRL: OK
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 2 Private Controls: 0
>>>>
>>>> Format ioctls (Input 0):
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK
>>>>           test VIDIOC_TRY_FMT: OK
>>>>           test VIDIOC_S_FMT: OK
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK
>>>>
>>>> Codec ioctls (Input 0):
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls (Input 0):
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>           test VIDIOC_EXPBUF: OK
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Test input 0:
>>>>
>>>> Streaming ioctls:
>>>>           test read/write: OK
>>>>           test blocking wait: OK
>>>>           test MMAP (no poll): OK
>>>>           test MMAP (select): OK
>>>>           test MMAP (epoll): OK
>>>>           test USERPTR (no poll): OK (Not Supported)
>>>>           test USERPTR (select): OK (Not Supported)
>>>>           test DMABUF: Cannot test, specify --expbuf-device
>>>>
>>>> Total for tegra-video device /dev/video5: 53, Succeeded: 53, Failed: 0=
, Warnings: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for device /dev/v4l-subdev0:
>>>>
>>>>
>>>> Required ioctls:
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/v4l-subdev0 open: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls:
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>           test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 0 Private Controls: 0
>>>>
>>>> Format ioctls:
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supp=
orted)
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK (Not Supported)
>>>>           test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>           test VIDIOC_S_FMT: OK (Not Supported)
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK (Not Supported)
>>>>
>>>> Codec ioctls:
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls:
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>           test VIDIOC_EXPBUF: OK (Not Supported)
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Total for device /dev/v4l-subdev0: 41, Succeeded: 41, Failed: 0, Warni=
ngs: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for device /dev/v4l-subdev1:
>>>>
>>>>
>>>> Required ioctls:
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/v4l-subdev1 open: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls:
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>           test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 0 Private Controls: 0
>>>>
>>>> Format ioctls:
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supp=
orted)
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK (Not Supported)
>>>>           test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>           test VIDIOC_S_FMT: OK (Not Supported)
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK (Not Supported)
>>>>
>>>> Codec ioctls:
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls:
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>           test VIDIOC_EXPBUF: OK (Not Supported)
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Total for device /dev/v4l-subdev1: 41, Succeeded: 41, Failed: 0, Warni=
ngs: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for device /dev/v4l-subdev2:
>>>>
>>>>
>>>> Required ioctls:
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/v4l-subdev2 open: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls:
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>           test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 0 Private Controls: 0
>>>>
>>>> Format ioctls:
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supp=
orted)
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK (Not Supported)
>>>>           test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>           test VIDIOC_S_FMT: OK (Not Supported)
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK (Not Supported)
>>>>
>>>> Codec ioctls:
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls:
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>           test VIDIOC_EXPBUF: OK (Not Supported)
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Total for device /dev/v4l-subdev2: 41, Succeeded: 41, Failed: 0, Warni=
ngs: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for device /dev/v4l-subdev3:
>>>>
>>>>
>>>> Required ioctls:
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/v4l-subdev3 open: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls:
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>           test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 0 Private Controls: 0
>>>>
>>>> Format ioctls:
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supp=
orted)
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK (Not Supported)
>>>>           test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>           test VIDIOC_S_FMT: OK (Not Supported)
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK (Not Supported)
>>>>
>>>> Codec ioctls:
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls:
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>           test VIDIOC_EXPBUF: OK (Not Supported)
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Total for device /dev/v4l-subdev3: 41, Succeeded: 41, Failed: 0, Warni=
ngs: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for device /dev/v4l-subdev4:
>>>>
>>>>
>>>> Required ioctls:
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/v4l-subdev4 open: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls:
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>           test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 0 Private Controls: 0
>>>>
>>>> Format ioctls:
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supp=
orted)
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK (Not Supported)
>>>>           test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>           test VIDIOC_S_FMT: OK (Not Supported)
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK (Not Supported)
>>>>
>>>> Codec ioctls:
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls:
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>           test VIDIOC_EXPBUF: OK (Not Supported)
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Total for device /dev/v4l-subdev4: 41, Succeeded: 41, Failed: 0, Warni=
ngs: 0
>>>> ----------------------------------------------------------------------=
----------
>>>> Compliance test for device /dev/v4l-subdev5:
>>>>
>>>>
>>>> Required ioctls:
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/v4l-subdev5 open: OK
>>>>           test for unlimited opens: OK
>>>>
>>>>           test invalid ioctls: OK
>>>> Debug ioctls:
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls:
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>           test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 0 Private Controls: 0
>>>>
>>>> Format ioctls:
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supp=
orted)
>>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK (Not Supported)
>>>>           test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>           test VIDIOC_S_FMT: OK (Not Supported)
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK (Not Supported)
>>>>
>>>> Codec ioctls:
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls:
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>           test VIDIOC_EXPBUF: OK (Not Supported)
>>>>           test Requests: OK (Not Supported)
>>>>
>>>> Total for device /dev/v4l-subdev5: 41, Succeeded: 41, Failed: 0, Warni=
ngs: 0
>>>>
>>>> Grand Total for tegra-video device /dev/media0: 572, Succeeded: 572, F=
ailed: 0, Warnings: 0
>>>>
