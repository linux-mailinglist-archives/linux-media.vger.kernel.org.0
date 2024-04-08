Return-Path: <linux-media+bounces-8847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F2189C36C
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 15:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6DE61C221AB
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 13:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F39A7D3EC;
	Mon,  8 Apr 2024 13:35:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2BC7CF29
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712583306; cv=none; b=NQPvp2j0jQYq9b21txvtcp6RF1qwxNX/0Dhl5j2q7q7oITNcjSI5sPM68yfCGdYDp51uzuENnDx2JHEeFKI5IY/bf6Qe8nEoDmR2TJYTfiZCUpSIsayEOZpVvsLXGQj6JcdF1O8Q37YdzPAmTmwc+cXOOz4LhXk+Tm5OKDMp4Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712583306; c=relaxed/simple;
	bh=MKEJkIg+7b5Q63SxsKbj/le6LRd0RObiYTnv/jfJonE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XvYB/ABn3O0lLocJYVhY9X/0ksNKIMUQ8j7YNOBRuxcXQA0QlXmcZLkVedlRUiAhqiA5kzVfatSxmNRcdo6SlKGCbeDx08lVfE7I0KlXQmlpntBYcQaOP+cSRNMIOozf7DMB1nn8AiRKhyQOxI1u7efzVAnhhZow5LTNVOjU9yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F87C433C7;
	Mon,  8 Apr 2024 13:35:04 +0000 (UTC)
Message-ID: <dc025dd5-e151-49a9-b2c0-1a5764a08723@xs4all.nl>
Date: Mon, 8 Apr 2024 15:35:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR v6.10] Add imx-asrc m2m audio rate control driver
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Mauro Carvalho Chehab <maurochehab@gmail.com>
References: <369cc35b-9625-4512-bb7a-7d5ccfe28e5c@xs4all.nl>
 <20240321155754.66681c24@coco.lan>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240321155754.66681c24@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Shengjiu,

On 21/03/2024 15:57, Mauro Carvalho Chehab wrote:
> Em Tue, 19 Mar 2024 16:15:35 +0100
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> Hi Mauro,
>>
>> This adds support for the imx-asrc m2m audio rate control driver. Most of these
>> patches add support for the new v4l-audioX device nodes and related types,
>> and adding support for fixed point control types.
>>
>> The ASoC patches have been acked by Mark Brown.
>>
>> It also adds a vim2m-audio test driver so we can test the v4l-audio infrastructure.
>>
>> Since V4L2 is fourcc-based all the way, directly using snd_pcm_format_t values
>> is not an option: fourcc's are expected to be printable characters, and it is
>> pretty much certain that there are applications that show it like that to the
>> end-user. The utilities in v4l-utils certainly do, and it is in fact a
>> perfectly reasonable thing to do. So instead we map the snd_pcm_format_t value
>> to a fourcc with v4l2_audfmt_to_fourcc and map it back with v4l2_fourcc_to_audfmt.
> 
> I still think that this can cause maintenance burden to sync up changes
> from fourcc to snd_pcm_format_t for no good reason, as any apps that will
> be working with this will require changes anyway to support the new
> devnodes and ioctls.

I will need more time to dig into this. I was on vacation for over a week, and
after that I was very busy. This needs more time from me.

But I haven't forgotten this, and it is on my todo list!

Regards,

	Hans

> 
> With regards to printable fourcc values, it doesn't seem the best for audio.
> I mean, for V4L2, when we had fourcc introduced, the formats were:
> 
> 	RGB3
> 	BGR3
> 	YUYV
> 	...
> 
> so, just printing them as ASCII would make sense, but those days were
> gone a very long time ago, as now we have fourccs like:
> 
> 	pBCC
> 
> Which you can't really know what it means, except by looking on its
> definition:
> 
> 	#define V4L2_PIX_FMT_SBGGR12P v4l2_fourcc('p', 'B', 'C', 'C')
> 
> For audio, even today's proposal makes no sense to be printed as
> ASCII. See, it is a lot clearer if userspace would print:
> 
> 	"PCM A-LAW"	# for ITU-T G711 A-law 8-bit encoding
> 	"PCM μ-LAW"	# for ITU-T G711 μ-law 8-bit encoding
> 	"PCM S8"	# for low-quality s8 encoding
> 	...
> 	"PCM S32_LE"
> 	...
> 
> than any obfuscated fourccs:
> 
> 	"AUAL"		# currently missing at V4L2 proposal patch
> 	"AUML"		# currently missing at V4L2 proposal patch
> 	"AU00"
> 	...
> 	"AU10"
> 	...
> 
> Besides that, there were never any warranty that fourccs are printable
> at the media subsystem. I might be wrong but I guess we even used some
> unprintable ones in the past.
> 
> 
> So, the argument that new apps that will support audio will need to
> receive a fourcc instead of snd_pcm_format_t sounds bogus to me.
> 
> Also, the current proposal misses lots of already-existing codes at
> snd_pcm_format_t.
> 
> 
>>
>> This PR is using v15 of the patch series:
>>
>> https://patchwork.linuxtv.org/project/linux-media/list/?series=12460
>>
>> And the corresponding v4l-utils patch series is here:
>>
>> https://patchwork.linuxtv.org/user/todo/linux-media/?series=12074
>>
>> Regards,
>>
>> 	Hans
>>
>> The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:
>>
>>   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/hverkuil/media_tree.git tags/br-audio
>>
>> for you to fetch changes up to af06c8792653c42d1f126505ec9180255091d94e:
>>
>>   media: vim2m-audio: add virtual driver for audio memory to memory (2024-03-19 15:55:38 +0100)
>>
>> ----------------------------------------------------------------
>> Tag branch
>>
>> ----------------------------------------------------------------
>> Hans Verkuil (1):
>>       media: v4l2-ctrls: add support for fraction_bits
>>
>> Shengjiu Wang (15):
>>       ASoC: fsl_asrc: define functions for memory to memory usage
>>       ASoC: fsl_easrc: define functions for memory to memory usage
>>       ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
>>       ASoC: fsl_asrc: register m2m platform device
>>       ASoC: fsl_easrc: register m2m platform device
>>       media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
>>       media: v4l2: Add audio capture and output support
>>       media: uapi: Define audio sample format fourcc type
>>       media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
>>       media: uapi: Add audio rate controls support
>>       media: uapi: Declare interface types for Audio
>>       media: uapi: Add an entity type for audio resampler
>>       media: vivid: add fixed point test controls
>>       media: imx-asrc: Add memory to memory driver
>>       media: vim2m-audio: add virtual driver for audio memory to memory
>>
>>  Documentation/userspace-api/media/mediactl/media-types.rst    |   11 +
>>  Documentation/userspace-api/media/v4l/buffer.rst              |    6 +
>>  Documentation/userspace-api/media/v4l/common.rst              |    1 +
>>  Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst   |   71 +++
>>  Documentation/userspace-api/media/v4l/devices.rst             |    1 +
>>  Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst |   59 +++
>>  Documentation/userspace-api/media/v4l/pixfmt-audio.rst        |  100 ++++
>>  Documentation/userspace-api/media/v4l/pixfmt.rst              |    1 +
>>  Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst     |    2 +
>>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  |    4 +
>>  Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst        |    4 +
>>  Documentation/userspace-api/media/v4l/vidioc-querycap.rst     |    3 +
>>  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst    |   11 +-
>>  Documentation/userspace-api/media/videodev2.h.rst.exceptions  |    3 +
>>  MAINTAINERS                                                   |   17 +
>>  drivers/media/common/videobuf2/videobuf2-v4l2.c               |    4 +
>>  drivers/media/platform/nxp/Kconfig                            |   13 +
>>  drivers/media/platform/nxp/Makefile                           |    1 +
>>  drivers/media/platform/nxp/imx-asrc.c                         | 1256 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/media/test-drivers/Kconfig                            |   10 +
>>  drivers/media/test-drivers/Makefile                           |    1 +
>>  drivers/media/test-drivers/vim2m-audio.c                      |  793 ++++++++++++++++++++++++++++++++
>>  drivers/media/test-drivers/vivid/vivid-core.h                 |    2 +
>>  drivers/media/test-drivers/vivid/vivid-ctrls.c                |   26 ++
>>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c                 |    9 +
>>  drivers/media/v4l2-core/v4l2-ctrls-api.c                      |    1 +
>>  drivers/media/v4l2-core/v4l2-ctrls-core.c                     |   93 +++-
>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                     |   10 +
>>  drivers/media/v4l2-core/v4l2-dev.c                            |   21 +
>>  drivers/media/v4l2-core/v4l2-ioctl.c                          |   66 +++
>>  drivers/media/v4l2-core/v4l2-mem2mem.c                        |   13 +-
>>  include/media/v4l2-ctrls.h                                    |   13 +-
>>  include/media/v4l2-dev.h                                      |    2 +
>>  include/media/v4l2-ioctl.h                                    |   34 ++
>>  {sound/soc/fsl => include/sound}/fsl_asrc_common.h            |   60 +++
>>  include/uapi/linux/media.h                                    |    2 +
>>  include/uapi/linux/v4l2-controls.h                            |    9 +
>>  include/uapi/linux/videodev2.h                                |   50 +-
>>  sound/soc/fsl/fsl_asrc.c                                      |  144 ++++++
>>  sound/soc/fsl/fsl_asrc.h                                      |    4 +-
>>  sound/soc/fsl/fsl_asrc_dma.c                                  |    2 +-
>>  sound/soc/fsl/fsl_easrc.c                                     |  233 ++++++++++
>>  sound/soc/fsl/fsl_easrc.h                                     |    6 +-
>>  43 files changed, 3145 insertions(+), 27 deletions(-)
>>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
>>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
>>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst
>>  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
>>  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
>>  rename {sound/soc/fsl => include/sound}/fsl_asrc_common.h (60%)
>>
> 


