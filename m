Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C318716148A
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 15:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgBQO03 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 09:26:29 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:60889 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727421AbgBQO03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 09:26:29 -0500
Received: from [IPv6:2001:420:44c1:2577:3074:af58:17a5:9c72]
 ([IPv6:2001:420:44c1:2577:3074:af58:17a5:9c72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3hLojaiKE8i433hLsjXJRS; Mon, 17 Feb 2020 15:26:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581949584; bh=iuawYef/a+moHnBz+IQJfA8t+KB6paIkH0Ruy/SDSr4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jn8qEqi7PFf7bMA2oTn5p1tSrvvgAOtGmO/BMNz3E01CDECfg66zk1oTP9C365U+S
         K5iV3UX5ghWWO8sanndfhgRS6xBbAaYsTcCpzXNLcORB4bAl8XmRYPv0eALxemKm62
         mbX1yQ4kO70bb4tysSQLMXRx1StMNcgDZLPF2hhRpkp+j+1r5idMJ/ZQYa5kLRntE7
         2wzslV5J0Bz5nTSc6gAAn4z87+gibCB3WSVfr/K5nyCechXCDOIPfJ81IsAs9NyAIs
         WbQl8hz5eZeX4EjEk5aD2DDKM5SOJvFhjLavZQRa3BN+P4oacZWUk5u76GpLnvPUR9
         5yNNKC67aH1MQ==
Subject: Re: [RFC PATCH v3 0/6] Add Tegra driver for video capture
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        helen.koike@collabora.com, sboyd@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e425f874-6842-b222-00f4-a6562b79aaaf@xs4all.nl>
Date:   Mon, 17 Feb 2020 15:26:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHV/uQORUs67pQuvVqA2Mw615VfvfSW8y0il/nnKZsUgrXLqgyXzMeqEydx4nt2PrqnvnYE224F+Y3TPbg3RTQXmx4NzYf/c59EOIlFBMHEy9eAq+FG8
 /U6WgvDrTzbIa0cpPn4hjLfrpDWewVzSLXuQM1KyBm2MnK3acOv/FOrmndSfQK/CbYllpk3TarymGsPMl5WU0aoX1v98DQQE+84VZjzgvckWP8/C5IYk6UH1
 mwpTwWZUPu7s/I/9kPhegpvQUconCTnnG/jL/xxFaFlXLuYd7+XYZ8ErqtsK9Egxd1z1whVd5u4e5wkJ78eclwgk81e/u1XewXfXtFUTdvfvosnmdWE1EIFM
 lIZ36QJeukca4bPd5T3JuTaTiuuPG02zP37rk8+HHLz3WcqGHgKcC4whInjTD3pU2u33M8gwS82Jst2o47Qr3p9E7xp2sznhrr/Rpnhb2CyWv8k6V2XH80SF
 Wkg/mtg2DdIDCXbteqdDuKrHuAhOrCJsqH7NjO/kY44y7FoxFp20XdJtslmu1j1DJvDaBJZHeRxEl5BMd6M1Fe79g4JkcE0fw9ezAJP6CGEGsbp+2q3NWmkU
 ed43GF12iHKfRODEheGZIAOskpIahwHKTYSFH7RLfHYvA+Y6knRl1vOqm5zPnxhyP+g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/14/20 7:23 PM, Sowjanya Komatineni wrote:
> This series adds Tegra210 VI and CSI driver for built-in test pattern
> generator (TPG) capture.
> 
> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
> CSI port is one-to-one mapped to VI channel for video capture.
> 
> This series has TPG support only where it creates hard media links
> between CSI subdevice and VI video device without device graphs.
> 
> v4l2-compliance results are available below the patch diff.
> 
> [v3]:	Includes,
> 	- video device node handling set/get formats of all devices
> 	  in the pipeline.
> 	- Removed subdev nodes.
> 	- Fixed frame sync timeout issue due to CSI clocks not properly
> 	  set for corresponding blocks.
> 	- Uses minimum 3 buffers to be queued to fixed memory race between
> 	  DMA writes and userspace reads causing kernel hang reporting
> 	  kernel write to read-only memory.
> 	- updated capture thread to wakeup done thread for MW_ACK wait only
> 	  on receiving frame start. This also avoid possible race b/w frames
> 	  FS and done thread waiting for previous frame MW_ACK when previous
> 	  frame FS timeouts.
> 	- Added VI CSI recovery incase of frame sync timeout to have it clean
> 	  for next streaming.
> 	- Passes all the V4L compliance tests.

FYI: I no longer crash with v3 :-)

So that's a very good news.

I also tested dmabuf:

sudo modprobe vivid allocators=1
v4l2-ctl -d6 -i3 -v width=1920,height=1080,pixelformat=NV16
v4l2-compliance -m0 -s10 -e6 -f -a

and that too passed successfully.

Regards,

	Hans

> 
> [v2]:	Includes,
> 	- v0 feedback
> 	- Merged files to have Tegra specific separately
> 	- Moved CSI device as child to VI as Tegra210 CSI is
> 	  part of VI sharing same host interface and register
> 	  space.
> 	- Added link_validate for format validation.
> 	- Fixes for passing v4l2-compliance for media, video,
> 	  and subdevices.
> 
> [v1]:	Includes,
> 	- Adds CSI TPG clock to Tegra210 clock driver
> 	- Host1x video driver with VI and CSI clients.
> 	- Support for Tegra210 only.
> 	- VI CSI TPG support with hard media links in driver.
> 	- Video formats supported by Tegra210 VI
> 	- CSI TPG supported video formats
> 
> 
> 
> Sowjanya Komatineni (6):
>   dt-bindings: clock: tegra: Add clk id for CSI TPG clock
>   clk: tegra: Add Tegra210 CSI TPG clock gate
>   dt-binding: tegra: Add VI and CSI bindings
>   media: tegra: Add Tegra210 Video input driver
>   MAINTAINERS: Add Tegra Video driver section
>   arm64: tegra: Add Tegra VI CSI support in device tree
> 
>  .../display/tegra/nvidia,tegra20-host1x.txt        |   55 +-
>  MAINTAINERS                                        |   10 +
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   10 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   36 +-
>  drivers/clk/tegra/clk-tegra210.c                   |    7 +
>  drivers/staging/media/Kconfig                      |    2 +
>  drivers/staging/media/Makefile                     |    1 +
>  drivers/staging/media/tegra/Kconfig                |   10 +
>  drivers/staging/media/tegra/Makefile               |    8 +
>  drivers/staging/media/tegra/TODO                   |   10 +
>  drivers/staging/media/tegra/tegra-common.h         |  239 +++++
>  drivers/staging/media/tegra/tegra-csi.c            |  374 +++++++
>  drivers/staging/media/tegra/tegra-csi.h            |  115 +++
>  drivers/staging/media/tegra/tegra-vi.c             | 1019 ++++++++++++++++++++
>  drivers/staging/media/tegra/tegra-vi.h             |   79 ++
>  drivers/staging/media/tegra/tegra-video.c          |  118 +++
>  drivers/staging/media/tegra/tegra-video.h          |   32 +
>  drivers/staging/media/tegra/tegra210.c             |  767 +++++++++++++++
>  drivers/staging/media/tegra/tegra210.h             |  190 ++++
>  include/dt-bindings/clock/tegra210-car.h           |    2 +-
>  20 files changed, 3074 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/staging/media/tegra/Kconfig
>  create mode 100644 drivers/staging/media/tegra/Makefile
>  create mode 100644 drivers/staging/media/tegra/TODO
>  create mode 100644 drivers/staging/media/tegra/tegra-common.h
>  create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>  create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>  create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>  create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>  create mode 100644 drivers/staging/media/tegra/tegra-video.c
>  create mode 100644 drivers/staging/media/tegra/tegra-video.h
>  create mode 100644 drivers/staging/media/tegra/tegra210.c
>  create mode 100644 drivers/staging/media/tegra/tegra210.h
> 
> 
> 
> ./v4l2-compliance -m0 -s10
> v4l2-compliance SHA: e7402fb758fd106955c3b7d5a5e961d1cb606f4a, 32 bits, 32-bit time_t
> 
> Compliance test for tegra-video device /dev/media0:
> 
> Media Driver Info:
>         Driver name      : tegra-video
>         Model            : NVIDIA Tegra Video Input Device
>         Serial           : 
>         Bus info         : platform:54080000.vi
>         Media version    : 5.6.0
>         Hardware revision: 0x00000003 (3)
>         Driver version   : 5.6.0
> 
> Required ioctls:
>         test MEDIA_IOC_DEVICE_INFO: OK
> 
> Allow for multiple opens:
>         test second /dev/media0 open: OK
>         test MEDIA_IOC_DEVICE_INFO: OK
>         test for unlimited opens: OK
> 
> Media Controller ioctls:
>         test MEDIA_IOC_G_TOPOLOGY: OK
>         Entities: 12 Interfaces: 6 Pads: 12 Links: 12
>         test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>         test MEDIA_IOC_SETUP_LINK: OK
>         test invalid ioctls: OK
> 
> Total for tegra-video device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for tegra-video device /dev/video0:
> 
> Driver Info:
>         Driver name      : tegra-video
>         Card type        : 54080000.vi-output-0
>         Bus info         : platform:54080000.vi
>         Driver version   : 5.6.0
>         Capabilities     : 0x85200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x05200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : tegra-video
>         Model            : NVIDIA Tegra Video Input Device
>         Serial           : 
>         Bus info         : platform:54080000.vi
>         Media version    : 5.6.0
>         Hardware revision: 0x00000003 (3)
>         Driver version   : 5.6.0
> Interface Info:
>         ID               : 0x03000003
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000001 (1)
>         Name             : 54080000.vi-output-0
>         Function         : V4L2 I/O
>         Pad 0x01000002   : 0: Sink
>           Link 0x0200001b: from remote pad 0x100001a of entity 'tpg-0': Data, Enabled
> 
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
> 
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK
>         test blocking wait: OK
>         test MMAP (no poll): OK                           
>         test MMAP (select): OK                            
>         test MMAP (epoll): OK                             
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for tegra-video device /dev/video0: 53, Succeeded: 53, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for tegra-video device /dev/video1:
> 
> Driver Info:
>         Driver name      : tegra-video
>         Card type        : 54080000.vi-output-1
>         Bus info         : platform:54080000.vi
>         Driver version   : 5.6.0
>         Capabilities     : 0x85200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x05200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : tegra-video
>         Model            : NVIDIA Tegra Video Input Device
>         Serial           : 
>         Bus info         : platform:54080000.vi
>         Media version    : 5.6.0
>         Hardware revision: 0x00000003 (3)
>         Driver version   : 5.6.0
> Interface Info:
>         ID               : 0x03000007
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000005 (5)
>         Name             : 54080000.vi-output-1
>         Function         : V4L2 I/O
>         Pad 0x01000006   : 0: Sink
>           Link 0x0200001f: from remote pad 0x100001e of entity 'tpg-1': Data, Enabled
> 
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
> 
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK
>         test blocking wait: OK
>         test MMAP (no poll): OK                           
>         test MMAP (select): OK                            
>         test MMAP (epoll): OK                             
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for tegra-video device /dev/video1: 53, Succeeded: 53, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for tegra-video device /dev/video2:
> 
> Driver Info:
>         Driver name      : tegra-video
>         Card type        : 54080000.vi-output-2
>         Bus info         : platform:54080000.vi
>         Driver version   : 5.6.0
>         Capabilities     : 0x85200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x05200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : tegra-video
>         Model            : NVIDIA Tegra Video Input Device
>         Serial           : 
>         Bus info         : platform:54080000.vi
>         Media version    : 5.6.0
>         Hardware revision: 0x00000003 (3)
>         Driver version   : 5.6.0
> Interface Info:
>         ID               : 0x0300000b
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000009 (9)
>         Name             : 54080000.vi-output-2
>         Function         : V4L2 I/O
>         Pad 0x0100000a   : 0: Sink
>           Link 0x02000023: from remote pad 0x1000022 of entity 'tpg-2': Data, Enabled
> 
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video2 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
> 
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK
>         test blocking wait: OK
>         test MMAP (no poll): OK                           
>         test MMAP (select): OK                            
>         test MMAP (epoll): OK                             
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for tegra-video device /dev/video2: 53, Succeeded: 53, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for tegra-video device /dev/video3:
> 
> Driver Info:
>         Driver name      : tegra-video
>         Card type        : 54080000.vi-output-3
>         Bus info         : platform:54080000.vi
>         Driver version   : 5.6.0
>         Capabilities     : 0x85200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x05200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : tegra-video
>         Model            : NVIDIA Tegra Video Input Device
>         Serial           : 
>         Bus info         : platform:54080000.vi
>         Media version    : 5.6.0
>         Hardware revision: 0x00000003 (3)
>         Driver version   : 5.6.0
> Interface Info:
>         ID               : 0x0300000f
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000000d (13)
>         Name             : 54080000.vi-output-3
>         Function         : V4L2 I/O
>         Pad 0x0100000e   : 0: Sink
>           Link 0x02000027: from remote pad 0x1000026 of entity 'tpg-3': Data, Enabled
> 
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video3 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
> 
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK
>         test blocking wait: OK
>         test MMAP (no poll): OK                           
>         test MMAP (select): OK                            
>         test MMAP (epoll): OK                             
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for tegra-video device /dev/video3: 53, Succeeded: 53, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for tegra-video device /dev/video4:
> 
> Driver Info:
>         Driver name      : tegra-video
>         Card type        : 54080000.vi-output-4
>         Bus info         : platform:54080000.vi
>         Driver version   : 5.6.0
>         Capabilities     : 0x85200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x05200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : tegra-video
>         Model            : NVIDIA Tegra Video Input Device
>         Serial           : 
>         Bus info         : platform:54080000.vi
>         Media version    : 5.6.0
>         Hardware revision: 0x00000003 (3)
>         Driver version   : 5.6.0
> Interface Info:
>         ID               : 0x03000013
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000011 (17)
>         Name             : 54080000.vi-output-4
>         Function         : V4L2 I/O
>         Pad 0x01000012   : 0: Sink
>           Link 0x0200002b: from remote pad 0x100002a of entity 'tpg-4': Data, Enabled
> 
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video4 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
> 
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK
>         test blocking wait: OK
>         test MMAP (no poll): OK                           
>         test MMAP (select): OK                            
>         test MMAP (epoll): OK                             
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for tegra-video device /dev/video4: 53, Succeeded: 53, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for tegra-video device /dev/video5:
> 
> Driver Info:
>         Driver name      : tegra-video
>         Card type        : 54080000.vi-output-5
>         Bus info         : platform:54080000.vi
>         Driver version   : 5.6.0
>         Capabilities     : 0x85200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x05200001
>                 Video Capture
>                 Read/Write
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : tegra-video
>         Model            : NVIDIA Tegra Video Input Device
>         Serial           : 
>         Bus info         : platform:54080000.vi
>         Media version    : 5.6.0
>         Hardware revision: 0x00000003 (3)
>         Driver version   : 5.6.0
> Interface Info:
>         ID               : 0x03000017
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000015 (21)
>         Name             : 54080000.vi-output-5
>         Function         : V4L2 I/O
>         Pad 0x01000016   : 0: Sink
>           Link 0x0200002f: from remote pad 0x100002e of entity 'tpg-5': Data, Enabled
> 
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video5 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
> 
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK
>         test blocking wait: OK
>         test MMAP (no poll): OK                           
>         test MMAP (select): OK                            
>         test MMAP (epoll): OK                             
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for tegra-video device /dev/video5: 53, Succeeded: 53, Failed: 0, Warnings: 0
> 
> Grand Total for tegra-video device /dev/media0: 326, Succeeded: 326, Failed: 0, Warnings: 0
> 

