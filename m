Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6987B2BA502
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 09:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbgKTIpj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 03:45:39 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47017 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726540AbgKTIpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 03:45:39 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id g22rk0jMKlmd2g22ukPY95; Fri, 20 Nov 2020 09:45:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1605861935; bh=6EH4PqwZPk9IMXSYMtDLQwBdMsn31/5+ABhTv7Zzje0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sGttvou/Ty4q843QVhgoFAnkesfYl3HOI1UibgCdk9I08UG6rOfOABL0xqDwYSLLk
         SZdGkIpDCCTJIzvHlO2rVyDV3qnCoaV10F6UlMf/YdhkgendNBlbReU3+s2AwOMen/
         wpl1RBoiXyv9Pk126s/f+CtoNJEoMtiZwBXI8qC9HnWryLMo9LM5I5BSOXDWKPK74t
         o7vikan7E8ER/MwimcgIobaieiuvxgudkoV9i6mm52OTYqbLarJBhIbc9qDjmYl5Fc
         rWXVP4gC2n2AEdwURtRf0f37As3+kksr5wdsdSrCUJmIwkgNn14PlpYy5masColwDg
         NmnBacsMfcXHA==
Subject: Re: [PATCH v3 00/13] Stateless H.264 de-staging
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20201118184700.331213-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c8323b33-d79c-4ea4-ce58-1fb5fdbee3d4@xs4all.nl>
Date:   Fri, 20 Nov 2020 09:45:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201118184700.331213-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEsvsyPApO+mUJRnKmXOHmz6zP76FbZBroPTXgZRsfRQb4K0jaAFjZGUYTIU0nhLGskLIFfiMk9hqeezMTGmDDVxK5tkb974pUWADUCYxy1omN07Qr6d
 i0XzuwfDt/BgviXmYMUdhU2Ti0BxkGgYiAb6YGoBayx10ZnrZIfZQ6ghGhjDbQadhzyN0A0psNYsZpfghvBvnlexf22SCg7XqU23bzTm34m8v+jsPpwqXzgE
 Q3aRn7V5fjqKLCIoNCPj7DHBEI/incXmtr9Uhny1fgMiNRlybb4EawxFH94DYVVeqRHKE9/5KU+a0aWTUHZxht3GVJGG6C3jOc651wheKqXKI2T4kW5tgXmD
 xC3KX/WInhtZx0C9SnQ474g0jzLeiVqDjOH1xtdnz9rDXip6hJYq5uj6iBmsphlXsh4U3TMAHB9xYZ0gRkdPnMQZc13y5GeG8ntkUnXyc/sv5s8474hckINM
 7XbRVn3/W2SoWKo2XeeiXHD9DOmKMlx8dPek4xSjhBuL3sJTj1BrlCLiuQY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/11/2020 19:46, Ezequiel Garcia wrote:
> Now that H.264 stateless controls are solid, we can get it
> out of staging.
> 
> Following some guidelines from Hans, this series creates a
> new stateless control class for the stable codec controls to land.
> 
> While here, I'm including a patch from Jonas adding profiles
> and levels to Rkvdec, and also made a similar fix for Cedrus.
> 
> This series was tested on a i.MX8MQ EVK board, using GStreamer:
> 
> https://gitlab.freedesktop.org/ezequielgarcia/gst-plugins-bad/-/commits/h264_stable_uapi
> 
> In case someone wants to give this a test.
> 
> Here's compliance output, with today's master branch:
> 
> commit 11da65eee7a271bba3f21d8117cdac428fe3a91e (HEAD -> master, origin/master, origin/HEAD)
> Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Date:   Sat Nov 14 13:41:14 2020 +0100
> 
>     v4l2-ctl: clean up control value printing
> 
> v4l2-compliance 1.19.0GIT_COMMIT_CNT, 64 bits, 64-bit time_t
> v4l2-compliance SHA: GIT_SHA GIT_COMMIT_DATE

I think you need to run bootstrap.sh and configure again. It should look
something like this:

v4l2-compliance 1.21.0-4682, 64 bits, 64-bit time_t
v4l2-compliance SHA: 11da65eee7a2 2020-11-14 12:41:14

Anyway, that doesn't matter for the remainder of the output.

Regards,

	Hans

> 
> Compliance test for hantro-vpu device /dev/video0:
> 
> Driver Info:
> 	Driver name      : hantro-vpu
> 	Card type        : nxp,imx8mq-vpu-dec
> 	Bus info         : platform: hantro-vpu
> 	Driver version   : 5.10.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : hantro-vpu
> 	Model            : hantro-vpu
> 	Serial           : 
> 	Bus info         : platform: hantro-vpu
> 	Media version    : 5.10.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 5.10.0
> Interface Info:
> 	ID               : 0x0300000c
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000001 (1)
> 	Name             : nxp,imx8mq-vpu-dec-source
> 	Function         : V4L2 I/O
> 	Pad 0x01000002   : 0: Source
> 	  Link 0x02000008: to remote pad 0x1000004 of entity 'nxp,imx8mq-vpu-dec-proc': Data, Enabled, Immutable
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> 	test invalid ioctls: OK
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 11 Private Controls: 1
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK
> 
> Total for hantro-vpu device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 0
> 
> Thanks,
> Ezequiel
> 
> v3:
>   * Dropped level control from Cedrus, as agreed.
>   * Add support for H264 stateless controls in std_log and std_validate_compound.
>   * Added a ctrl debug error message, to help debug validation issues.
>   * Style minor fixes as requested by Hans.
> v2:
>   * Split destage changes in several patches so it's easier to review.
>   * Added missing changes to drivers/media/v4l2-core/v4l2-ctrls.c.
>   * Renamed V4L2_CID_CODEC_CX2341X_ and V4L2_CID_MPEG_MFC51_
>   * Moved the compatibility macros for MPEG to the end of the header.
> 
> Ezequiel Garcia (12):
>   media: ctrls: Add validate failure debug message
>   media: cedrus: h264: Support profile controls
>   media: Rename stateful codec control macros
>   media: Clean stateless control includes
>   media: uapi: h264: Add profile_idc macros
>   media: controls: Validate H264 stateless controls
>   media: controls: Add the stateless codec control class
>   media: uapi: Move parsed H264 pixel format out of staging
>   media: uapi: Move the H264 stateless control types out of staging
>   media: controls: Log H264 stateless controls in .std_log
>   media: uapi: move H264 stateless controls out of staging
>   media: docs: Move the H264 stateless codec uAPI
> 
> Jonas Karlman (1):
>   media: rkvdec: h264: Support profile and level controls
> 
>  .../userspace-api/media/v4l/common.rst        |   1 +
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++
>  .../media/v4l/ext-ctrls-codec.rst             | 696 +--------------
>  .../media/v4l/extended-controls.rst           |   8 +-
>  .../media/v4l/pixfmt-compressed.rst           |  21 +-
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   6 +-
>  drivers/media/common/cx2341x.c                |   4 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 153 +++-
>  drivers/staging/media/hantro/hantro_drv.c     |  26 +-
>  drivers/staging/media/hantro/hantro_h264.c    |   8 +-
>  drivers/staging/media/hantro/hantro_hw.h      |   4 +-
>  drivers/staging/media/rkvdec/rkvdec-h264.c    |   8 +-
>  drivers/staging/media/rkvdec/rkvdec.c         |  39 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  43 +-
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  12 +-
>  include/media/fwht-ctrls.h                    |   2 +-
>  include/media/h264-ctrls.h                    |  34 +-
>  include/media/hevc-ctrls.h                    |  10 +-
>  include/media/mpeg2-ctrls.h                   |   4 +-
>  include/media/v4l2-ctrls.h                    |   1 -
>  include/media/v4l2-h264.h                     |   2 +-
>  include/media/vp8-ctrls.h                     |   2 +-
>  include/uapi/linux/v4l2-controls.h            | 795 +++++++++++++-----
>  include/uapi/linux/videodev2.h                |   8 +
>  27 files changed, 1542 insertions(+), 1025 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> 

