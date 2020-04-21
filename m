Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135E11B24A8
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 13:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgDULKD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 07:10:03 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53085 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726018AbgDULKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 07:10:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Qqmkjk2DXlKa1QqmojznmT; Tue, 21 Apr 2020 13:09:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587467394; bh=Hz2cf57PR0hERoAxOPXeJ66yZu93AB+vsIJ0KeB+o9A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AlBciSD+6FetGViu+GB93JX+C3nnd5Oq1lwZsU8OYGUQ821NndNaqcjzz9vqK/HBi
         KSPNVNybeuLtfC4YwGsE8JwAZoppFNRdK4jjEimk2ah34bKbgXN1smZ3F4Sum45GRZ
         MoMQ6F0JU6Dr0lG5d4hvJ6RkSkT7x0dovpNrm7ny2w2zQPywzeLYz82hWcsgmi2Uvs
         tIesagx524WJOT3ijB4X2Nzn6N2vQHv5xZosgInOsjwpbvWDOtc9ZWvfuDPzQGOUSA
         o7RGBIxiwg3tmLGrAuNiKn7dvu4X412H/hFY5n1VtONgdlA5iLRHXxSJEeKjAAx0FN
         3RPZqiPDfP0Qg==
Subject: Re: [RFC PATCH v8 0/9] Add Tegra driver for video capture
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5c44beca-4016-6e4f-01bb-e38480bfc34b@xs4all.nl>
Date:   Tue, 21 Apr 2020 13:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMnDi18xmUvdJfy2XtOTEMDsy+VYt0pICDpjG2RIYDIFmYOS2iE5nByoXFESZk6mMR1H3XzyDEXBF3XXCYF3xFI9U0t/2z1vQQjyIdVnwb+YtP6SLIoN
 iXJ8zO7a0/8aZ1+6+8nFn/9BK/n5qFFUmaUTHOPEQpu2bJq36qbpC4cGRRmPerR2sngzMn2v8sk0Z4/EuO1yeldGeBmjHuVzX1k73G0BJXqpWBeRKUaJJnHL
 rpMv5CQOFFu0FxWS7VYoID0C+uffIw+eg/zgaT0ShC1HB+k/ntuG+2L2O2urY3sxA9oA/6c0/LND2u3X7YQ81nt2Fx5UZDD91GkblWtNx6BEXMHAlodIlNjQ
 INXBRWPhg2Qm8rVrEUmmMecodquvX0XbxvUflebyhFDOrlBHRJLdGq/I6B3HklAdfK5uqfA2IbWXbCVFFMfnvae6ILNQgnpUyuNWZ6+szzp0x/Ru6jtb3OBF
 Vn3bRdIS+8i4D5xFfCCWIEqInY5or9WtDJvma1hQTgH5nzvYfbIGLuSaWxU2sgb0ZjuWXz3dzvi1HdpR2x4r2sf3Xa1B091/6UfPjwxwEe8WmMwIsi8m5RF8
 n0A=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

On 21/04/2020 02:11, Sowjanya Komatineni wrote:
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

I'm ready to merge this v8. Looking at the series I should only merge
patches 6 and 7, all other patches go through different subsystems, right?

Regards,

	Hans

> 
> [v8]:	Includes,
> 	- minor change to use device managed allocation fo vi and csi for now.
> 	  May need to change back to non device managed allocation later when
> 	  support for direct host1x client driver unbind and bind is added.
> 
> [v7]:	Includes,
> 	- v6 feedback
> 	- moved registering v4l2 nodes and creating tpg media links to happen
> 	  after both host1x client inits so during direct host1x client driver
> 	  unbind and bind order of client unregister/register will not impact.
> 	- All channels resources and freeing happens during v4l2 device release
> 	  callback.
> 	- module unload/load works with below host1x bus driver fix.
> 	  http://patchwork.ozlabs.org/patch/1268191/
> 
> [v6]:	Includes,
> 	- v5 feedback
> 	- fix for csi_tpg clock parent
> 	- fix to free channel resources in video device release callback
> 	  for registered video devices as resource might still be in use
> 	  when application holds handle to it during driver unbind.
> 	- added blanking intervals based on resolution and bpp for csi
> 	  internal tpg.
> 	- added implementation for subdev pad ops enum_frame_size and
> 	  enum_frame_interval.
> 
> [v5]:	Includes,
> 	- v4 feedback
> 	- fix for venc powergate mc reset order.
> 	- fix to have unbind and bind work during v4l2-ctl sleep and streaming.
> 
> [v4]:	Includes,
> 	- v3 feedback changes and some improvements
> 	- Fixes tegra_channel_buffer struct to use v4l2 buffer as first
> 	  member. This also fixes crash of unable to handle kernel write
> 	  to read-only memory.
> 	- Uses separate host1x sync ids for frame start and memory write
> 	  ack as single sync id for both can cause sync loss between exact
> 	  frame start and memory write ack events.
> 	- Uses client managed host1x syncpoints.
> 	- Includes fix to increment syncpoint counter to match cached value
> 	  to synchronize in case of timeouts or missed hardware triggers.
> 	- Frame start and memory write ack syncpoint FIFO's are of size 2.
> 	  So, updated capture logic to avoid adding more than 2 sync point
> 	  condition requests to FIFOs to avoid overflow.
> 	- Implemented PM ops for runtime suspend and resume along with generic
> 	  power domains to allow proper power gate and ungate sequencing along
> 	  with MC VI flush during power gate.
> 	- Fixed Tegra210 device tree sor power domain clocks.
> 	- Added missing reset-cells to mc node.
> 
> [v3]:	Includes,
> 	- video device node handling set/get formats of all devices
> 	  in the pipeline.
> 	- Removed subdev nodes.
> 	- Fixed frame sync timeout issue due to CSI clocks not properly
> 	  set for corresponding blocks.
> 	- uses minimum 3 buffers to be queued to fixed memory race between
> 	  DMA writes and userspace reads causing kernel hang reporting
> 	  kernel write to read-only memory.
> 	- Improved capture threads and done threads to avoid possible
> 	  race conditions and added recovery in case of frame sync timeout.
> 	- Passes all the V4L compliance tests.
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
> Sowjanya Komatineni (9):
>   arm64: tegra: Fix sor powergate clocks and reset
>   arm64: tegra: Add reset-cells to mc
>   dt-bindings: clock: tegra: Add clk id for CSI TPG clock
>   clk: tegra: Add Tegra210 CSI TPG clock gate
>   dt-binding: tegra: Add VI and CSI bindings
>   media: tegra: Add Tegra210 Video input driver
>   MAINTAINERS: Add Tegra Video driver section
>   dt-bindings: reset: Add ID for Tegra210 VI reset
>   arm64: tegra: Add Tegra VI CSI support in device tree
> 
>  .../display/tegra/nvidia,tegra20-host1x.txt        |   73 +-
>  MAINTAINERS                                        |   10 +
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   10 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   52 +-
>  drivers/clk/tegra/clk-tegra210.c                   |    7 +
>  drivers/staging/media/Kconfig                      |    2 +
>  drivers/staging/media/Makefile                     |    1 +
>  drivers/staging/media/tegra/Kconfig                |   13 +
>  drivers/staging/media/tegra/Makefile               |    8 +
>  drivers/staging/media/tegra/TODO                   |   10 +
>  drivers/staging/media/tegra/common.h               |  262 +++++
>  drivers/staging/media/tegra/csi.c                  |  605 +++++++++++
>  drivers/staging/media/tegra/csi.h                  |  149 +++
>  drivers/staging/media/tegra/tegra210.c             |  709 ++++++++++++
>  drivers/staging/media/tegra/tegra210.h             |  190 ++++
>  drivers/staging/media/tegra/vi.c                   | 1123 ++++++++++++++++++++
>  drivers/staging/media/tegra/vi.h                   |   85 ++
>  drivers/staging/media/tegra/video.c                |  151 +++
>  drivers/staging/media/tegra/video.h                |   31 +
>  include/dt-bindings/clock/tegra210-car.h           |    2 +-
>  include/dt-bindings/reset/tegra210-car.h           |    1 +
>  21 files changed, 3477 insertions(+), 17 deletions(-)
>  create mode 100644 drivers/staging/media/tegra/Kconfig
>  create mode 100644 drivers/staging/media/tegra/Makefile
>  create mode 100644 drivers/staging/media/tegra/TODO
>  create mode 100644 drivers/staging/media/tegra/common.h
>  create mode 100644 drivers/staging/media/tegra/csi.c
>  create mode 100644 drivers/staging/media/tegra/csi.h
>  create mode 100644 drivers/staging/media/tegra/tegra210.c
>  create mode 100644 drivers/staging/media/tegra/tegra210.h
>  create mode 100644 drivers/staging/media/tegra/vi.c
>  create mode 100644 drivers/staging/media/tegra/vi.h
>  create mode 100644 drivers/staging/media/tegra/video.c
>  create mode 100644 drivers/staging/media/tegra/video.h
> 
> 
> v4l2-compliance SHA: 81e45d957c4db39397f893100b3d2729ef39b052, 32 bits, 32-bit time_t
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
>           Link 0x02000007: from remote pad 0x1000006 of entity 'tpg-0': Data, Enabled
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
>         test VIDIOC_G/S_PARM: OK
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
>         ID               : 0x0300000b
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000009 (9)
>         Name             : 54080000.vi-output-1
>         Function         : V4L2 I/O
>         Pad 0x0100000a   : 0: Sink
>           Link 0x0200000f: from remote pad 0x100000e of entity 'tpg-1': Data, Enabled
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
>         test VIDIOC_G/S_PARM: OK
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
>         ID               : 0x03000013
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000011 (17)
>         Name             : 54080000.vi-output-2
>         Function         : V4L2 I/O
>         Pad 0x01000012   : 0: Sink
>           Link 0x02000017: from remote pad 0x1000016 of entity 'tpg-2': Data, Enabled
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
>         test VIDIOC_G/S_PARM: OK
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
>         ID               : 0x0300001b
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000019 (25)
>         Name             : 54080000.vi-output-3
>         Function         : V4L2 I/O
>         Pad 0x0100001a   : 0: Sink
>           Link 0x0200001f: from remote pad 0x100001e of entity 'tpg-3': Data, Enabled
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
>         test VIDIOC_G/S_PARM: OK
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
>         ID               : 0x03000023
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000021 (33)
>         Name             : 54080000.vi-output-4
>         Function         : V4L2 I/O
>         Pad 0x01000022   : 0: Sink
>           Link 0x02000027: from remote pad 0x1000026 of entity 'tpg-4': Data, Enabled
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
>         test VIDIOC_G/S_PARM: OK
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
>         ID               : 0x0300002b
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000029 (41)
>         Name             : 54080000.vi-output-5
>         Function         : V4L2 I/O
>         Pad 0x0100002a   : 0: Sink
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
>         test VIDIOC_G/S_PARM: OK
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
> 

