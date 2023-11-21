Return-Path: <linux-media+bounces-666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B57F28A6
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 10:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACF1E1C21555
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 09:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C59938F95;
	Tue, 21 Nov 2023 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E121FA7
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 09:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA178C433C8;
	Tue, 21 Nov 2023 09:22:50 +0000 (UTC)
Message-ID: <71ce6d8b-90c2-4ef6-9883-129861dcab02@xs4all.nl>
Date: Tue, 21 Nov 2023 10:22:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/14] Add audio support in v4l2 framework
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1700552255-5364-1-git-send-email-shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <1700552255-5364-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/11/2023 08:37, Shengjiu Wang wrote:
> Audio signal processing also has the requirement for memory to
> memory similar as Video.
> 
> This asrc memory to memory (memory ->asrc->memory) case is a non
> real time use case.
> 
> User fills the input buffer to the asrc module, after conversion, then asrc
> sends back the output buffer to user. So it is not a traditional ALSA playback
> and capture case.
> 
> It is a specific use case,  there is no reference in current kernel.
> v4l2 memory to memory is the closed implementation,  v4l2 current
> support video, image, radio, tuner, touch devices, so it is not
> complicated to add support for this specific audio case.
> 
> Because we had implemented the "memory -> asrc ->i2s device-> codec"
> use case in ALSA.  Now the "memory->asrc->memory" needs
> to reuse the code in asrc driver, so the first 3 patches is for refining
> the code to make it can be shared by the "memory->asrc->memory"
> driver.
> 
> The main change is in the v4l2 side, A /dev/vl4-audioX will be created,
> user applications only use the ioctl of v4l2 framework.
> 
> Other change is to add memory to memory support for two kinds of i.MX ASRC
> module.
> 
> changes in v10
> - remove FIXED_POINT type
> - change code base on media: v4l2-ctrls: add support for fraction_bits
> - fix issue reported by kernel test robot
> - remove module_alias

Note that I still need a patch for vivid adding a fixed point test control.

I think I want two controls: one INTEGER Q16 and one INTEGER64 Q63 (a nice
corner case).

Regards,

	Hans

> 
> changes in v9:
> - add MEDIA_ENT_F_PROC_AUDIO_RESAMPLER.
> - add MEDIA_INTF_T_V4L_AUDIO
> - add media controller support
> - refine the vim2m-audio to support 8k<->16k conversion.
> 
> changes in v8:
> - refine V4L2_CAP_AUDIO_M2M to be 0x00000008
> - update doc for FIXED_POINT
> - address comments for imx-asrc
> 
> changes in v7:
> - add acked-by from Mark
> - separate commit for fixed point, m2m audio class, audio rate controls
> - use INTEGER_MENU for rate,  FIXED_POINT for rate offset
> - remove used fmts
> - address other comments for Hans
> 
> changes in v6:
> - use m2m_prepare/m2m_unprepare/m2m_start/m2m_stop to replace
>   m2m_start_part_one/m2m_stop_part_one, m2m_start_part_two/m2m_stop_part_two.
> - change V4L2_CTRL_TYPE_ASRC_RATE to V4L2_CTRL_TYPE_FIXED_POINT
> - fix warning by kernel test rebot
> - remove some unused format V4L2_AUDIO_FMT_XX
> - Get SNDRV_PCM_FORMAT from V4L2_AUDIO_FMT in driver.
> - rename audm2m to viaudm2m.
> 
> changes in v5:
> - remove V4L2_AUDIO_FMT_LPCM
> - define audio pixel format like V4L2_AUDIO_FMT_S8...
> - remove rate and format in struct v4l2_audio_format.
> - Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE controls
> - updata document accordingly.
> 
> changes in v4:
> - update document style
> - separate V4L2_AUDIO_FMT_LPCM and V4L2_CAP_AUDIO_M2M in separate commit
> 
> changes in v3:
> - Modify documents for adding audio m2m support
> - Add audio virtual m2m driver
> - Defined V4L2_AUDIO_FMT_LPCM format type for audio.
> - Defined V4L2_CAP_AUDIO_M2M capability type for audio m2m case.
> - with modification in v4l-utils, pass v4l2-compliance test.
> 
> changes in v2:
> - decouple the implementation in v4l2 and ALSA
> - implement the memory to memory driver as a platfrom driver
>   and move it to driver/media
> - move fsl_asrc_common.h to include/sound folder
> 
> Shengjiu Wang (14):
>   ASoC: fsl_asrc: define functions for memory to memory usage
>   ASoC: fsl_easrc: define functions for memory to memory usage
>   ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
>   ASoC: fsl_asrc: register m2m platform device
>   ASoC: fsl_easrc: register m2m platform device
>   media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
>   media: v4l2: Add audio capture and output support
>   media: uapi: Define audio sample format fourcc type
>   media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
>   media: uapi: Add audio rate controls support
>   media: uapi: Declare interface types for Audio
>   media: uapi: Add an entity type for audio resampler
>   media: imx-asrc: Add memory to memory driver
>   media: vim2m-audio: add virtual driver for audio memory to memory
> 
>  .../media/mediactl/media-types.rst            |   11 +
>  .../userspace-api/media/v4l/buffer.rst        |    6 +
>  .../userspace-api/media/v4l/common.rst        |    1 +
>  .../media/v4l/dev-audio-mem2mem.rst           |   71 +
>  .../userspace-api/media/v4l/devices.rst       |    1 +
>  .../media/v4l/ext-ctrls-audio-m2m.rst         |   41 +
>  .../userspace-api/media/v4l/pixfmt-audio.rst  |   87 ++
>  .../userspace-api/media/v4l/pixfmt.rst        |    1 +
>  .../media/v4l/vidioc-enum-fmt.rst             |    2 +
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |    4 +
>  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
>  .../media/v4l/vidioc-querycap.rst             |    3 +
>  .../media/videodev2.h.rst.exceptions          |    3 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
>  drivers/media/platform/nxp/Kconfig            |   13 +
>  drivers/media/platform/nxp/Makefile           |    1 +
>  drivers/media/platform/nxp/imx-asrc.c         | 1264 +++++++++++++++++
>  drivers/media/test-drivers/Kconfig            |   11 +
>  drivers/media/test-drivers/Makefile           |    1 +
>  drivers/media/test-drivers/vim2m-audio.c      |  799 +++++++++++
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |    9 +
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   10 +
>  drivers/media/v4l2-core/v4l2-dev.c            |   21 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   66 +
>  drivers/media/v4l2-core/v4l2-mem2mem.c        |   13 +-
>  include/media/v4l2-dev.h                      |    2 +
>  include/media/v4l2-ioctl.h                    |   34 +
>  .../fsl => include/sound}/fsl_asrc_common.h   |   60 +
>  include/uapi/linux/media.h                    |    2 +
>  include/uapi/linux/v4l2-controls.h            |    9 +
>  include/uapi/linux/videodev2.h                |   41 +
>  sound/soc/fsl/fsl_asrc.c                      |  144 ++
>  sound/soc/fsl/fsl_asrc.h                      |    4 +-
>  sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
>  sound/soc/fsl/fsl_easrc.c                     |  233 +++
>  sound/soc/fsl/fsl_easrc.h                     |    6 +-
>  36 files changed, 2977 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst
>  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
>  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
>  rename {sound/soc/fsl => include/sound}/fsl_asrc_common.h (60%)
> 


