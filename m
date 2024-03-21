Return-Path: <linux-media+bounces-7482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8A7885B3B
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 15:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BE781F21359
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 14:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D986285959;
	Thu, 21 Mar 2024 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RurAOfm2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6184A5A
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711033080; cv=none; b=nkKV9jIIiRw0Mar1QTBhZDjmzCAgD+tTuwYJC2t9L3rSgQXGj7DWAfq9BW482ZE62ztkr7Tpn348O7Jr3zHdBDrNc690VYzoCMndpEK8KeIqtLrx0XmFUFFXoEm3CIP8l49NnmJEfOQ/77bcKhpXSHy7XcAkB8hcVeX1/O2ZyKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711033080; c=relaxed/simple;
	bh=zE1l5i3GYqT9+OTq30G/9cW0V+10eNMvs5g0u//D3+w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtjUsULIb6XzXDDEY/v7KE8caGNx5p9vvXMgDu2bll+/Tcnu6NTdlSanPSBONrXsi8B4CHyniu6GMtjD7HBX6jB/jeM9XXn0em+aiVRjWc0hC7cVUXmxYAJfFVbk0zcacLck5Zawin+2oOp6zmuic+Fl3CZs+tG91DyZzrpKEko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RurAOfm2; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56bcbad7ee2so863816a12.1
        for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711033077; x=1711637877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGnp9paSrZv1dQoKAyRCnIkFZlRhhX7Zz0E1MQGq9XA=;
        b=RurAOfm2iK4j4qBXZzelpY9iz7+/XbtlZty+0PpexzbKIapyvL6GRMeiJNVPK8naaP
         qDpfcvf5uzVHooKIjAr3iO0DLOlHcmPIUM9aKkWlHyfc0pureEmvUFDZ79P88cSkJY4B
         2r7+hTF/Pyjuz6SD8Bk7Ok7AOuZ11pkqE2b9dQNgSBxSW/aFAO6EL2zx/2ow8l+eH+56
         fvxvCY6DWBJlTfkTg5QI7bLF0xVLy4Vi/58K+TTjKWv0cr9vHHytF+LfF2ZMDmzmc4p9
         BRLnXfbY2VE7LH8iUb+SKSXgDwuKvG3SRq36VpKAMUSt2MGmSWP7GL1Kz3HVuq6qmXNc
         hV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711033077; x=1711637877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGnp9paSrZv1dQoKAyRCnIkFZlRhhX7Zz0E1MQGq9XA=;
        b=QRZwWPkXSthTSlme4KBxl3cWehhAVRcjvEFsMPRy8J3ltF20UVkdYOc4+2ZGnDX4mp
         3Xf0EZqCnYa55AX6jr14gRMha/qeD64/5daeVGsZkTTu2Tk3craD4eX0il4V6wHlVfeq
         isSLGFNfijCu3+rCE9SfgKsiJk7PaS1nD5/paftnzufPOoD31NtOVjObwe6YKQAwmLDo
         51shbNGkNPWAzLPoUo0/N1Gcye+s8uz4CMhAAIyp/bvF/MxzNhCzO8d8IkOulMgzRssQ
         bE90C1n8rqJwa4ZNgT0Wn9cy/TCk3fykT9Ir+aJh1XRIXN9tbvjQtlTQONaiCeVqOz5a
         X0MA==
X-Gm-Message-State: AOJu0Yz85wRFd1ITGM6hVJSLvtxiZLn4PG23n4MpOy0omWjLHVb7zXwS
	cJxiLrKf14ncwCb378vh0h++WR2S+co5HqphJwV3Ck+3sScDwCsZyTymyHY6bRo=
X-Google-Smtp-Source: AGHT+IECpA6Q9nFP+AP+PI/SMSHoVZrz38ZSpkIRxMqHluLT5vxT7+lZAhznzGRXkNhgm74eRFVu+A==
X-Received: by 2002:a05:6402:2483:b0:568:d7fe:a857 with SMTP id q3-20020a056402248300b00568d7fea857mr7078184eda.11.1711033076440;
        Thu, 21 Mar 2024 07:57:56 -0700 (PDT)
Received: from coco.lan ([95.90.155.68])
        by smtp.gmail.com with ESMTPSA id cb4-20020a0564020b6400b005663b0d7243sm8187572edb.83.2024.03.21.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 07:57:56 -0700 (PDT)
Date: Thu, 21 Mar 2024 15:57:54 +0100
From: Mauro Carvalho Chehab <maurochehab@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Subject: Re: [GIT PULL FOR v6.10] Add imx-asrc m2m audio rate control driver
Message-ID: <20240321155754.66681c24@coco.lan>
In-Reply-To: <369cc35b-9625-4512-bb7a-7d5ccfe28e5c@xs4all.nl>
References: <369cc35b-9625-4512-bb7a-7d5ccfe28e5c@xs4all.nl>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 19 Mar 2024 16:15:35 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Hi Mauro,
>=20
> This adds support for the imx-asrc m2m audio rate control driver. Most of=
 these
> patches add support for the new v4l-audioX device nodes and related types,
> and adding support for fixed point control types.
>=20
> The ASoC patches have been acked by Mark Brown.
>=20
> It also adds a vim2m-audio test driver so we can test the v4l-audio infra=
structure.
>=20
> Since V4L2 is fourcc-based all the way, directly using snd_pcm_format_t v=
alues
> is not an option: fourcc's are expected to be printable characters, and i=
t is
> pretty much certain that there are applications that show it like that to=
 the
> end-user. The utilities in v4l-utils certainly do, and it is in fact a
> perfectly reasonable thing to do. So instead we map the snd_pcm_format_t =
value
> to a fourcc with v4l2_audfmt_to_fourcc and map it back with v4l2_fourcc_t=
o_audfmt.

I still think that this can cause maintenance burden to sync up changes
from fourcc to snd_pcm_format_t for no good reason, as any apps that will
be working with this will require changes anyway to support the new
devnodes and ioctls.

With regards to printable fourcc values, it doesn't seem the best for audio.
I mean, for V4L2, when we had fourcc introduced, the formats were:

	RGB3
	BGR3
	YUYV
	...

so, just printing them as ASCII would make sense, but those days were
gone a very long time ago, as now we have fourccs like:

	pBCC

Which you can't really know what it means, except by looking on its
definition:

	#define V4L2_PIX_FMT_SBGGR12P v4l2_fourcc('p', 'B', 'C', 'C')

For audio, even today's proposal makes no sense to be printed as
ASCII. See, it is a lot clearer if userspace would print:

	"PCM A-LAW"	# for ITU-T G711 A-law 8-bit encoding
	"PCM =CE=BC-LAW"	# for ITU-T G711 =CE=BC-law 8-bit encoding
	"PCM S8"	# for low-quality s8 encoding
	...
	"PCM S32_LE"
	...

than any obfuscated fourccs:

	"AUAL"		# currently missing at V4L2 proposal patch
	"AUML"		# currently missing at V4L2 proposal patch
	"AU00"
	...
	"AU10"
	...

Besides that, there were never any warranty that fourccs are printable
at the media subsystem. I might be wrong but I guess we even used some
unprintable ones in the past.


So, the argument that new apps that will support audio will need to
receive a fourcc instead of snd_pcm_format_t sounds bogus to me.

Also, the current proposal misses lots of already-existing codes at
snd_pcm_format_t.


>=20
> This PR is using v15 of the patch series:
>=20
> https://patchwork.linuxtv.org/project/linux-media/list/?series=3D12460
>=20
> And the corresponding v4l-utils patch series is here:
>=20
> https://patchwork.linuxtv.org/user/todo/linux-media/?series=3D12074
>=20
> Regards,
>=20
> 	Hans
>=20
> The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acab=
db:
>=20
>   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-audio
>=20
> for you to fetch changes up to af06c8792653c42d1f126505ec9180255091d94e:
>=20
>   media: vim2m-audio: add virtual driver for audio memory to memory (2024=
-03-19 15:55:38 +0100)
>=20
> ----------------------------------------------------------------
> Tag branch
>=20
> ----------------------------------------------------------------
> Hans Verkuil (1):
>       media: v4l2-ctrls: add support for fraction_bits
>=20
> Shengjiu Wang (15):
>       ASoC: fsl_asrc: define functions for memory to memory usage
>       ASoC: fsl_easrc: define functions for memory to memory usage
>       ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
>       ASoC: fsl_asrc: register m2m platform device
>       ASoC: fsl_easrc: register m2m platform device
>       media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
>       media: v4l2: Add audio capture and output support
>       media: uapi: Define audio sample format fourcc type
>       media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
>       media: uapi: Add audio rate controls support
>       media: uapi: Declare interface types for Audio
>       media: uapi: Add an entity type for audio resampler
>       media: vivid: add fixed point test controls
>       media: imx-asrc: Add memory to memory driver
>       media: vim2m-audio: add virtual driver for audio memory to memory
>=20
>  Documentation/userspace-api/media/mediactl/media-types.rst    |   11 +
>  Documentation/userspace-api/media/v4l/buffer.rst              |    6 +
>  Documentation/userspace-api/media/v4l/common.rst              |    1 +
>  Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst   |   71 +++
>  Documentation/userspace-api/media/v4l/devices.rst             |    1 +
>  Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst |   59 +++
>  Documentation/userspace-api/media/v4l/pixfmt-audio.rst        |  100 ++++
>  Documentation/userspace-api/media/v4l/pixfmt.rst              |    1 +
>  Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst     |    2 +
>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  |    4 +
>  Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst        |    4 +
>  Documentation/userspace-api/media/v4l/vidioc-querycap.rst     |    3 +
>  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst    |   11 +-
>  Documentation/userspace-api/media/videodev2.h.rst.exceptions  |    3 +
>  MAINTAINERS                                                   |   17 +
>  drivers/media/common/videobuf2/videobuf2-v4l2.c               |    4 +
>  drivers/media/platform/nxp/Kconfig                            |   13 +
>  drivers/media/platform/nxp/Makefile                           |    1 +
>  drivers/media/platform/nxp/imx-asrc.c                         | 1256 +++=
++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/test-drivers/Kconfig                            |   10 +
>  drivers/media/test-drivers/Makefile                           |    1 +
>  drivers/media/test-drivers/vim2m-audio.c                      |  793 +++=
+++++++++++++++++++++++++++++
>  drivers/media/test-drivers/vivid/vivid-core.h                 |    2 +
>  drivers/media/test-drivers/vivid/vivid-ctrls.c                |   26 ++
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c                 |    9 +
>  drivers/media/v4l2-core/v4l2-ctrls-api.c                      |    1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c                     |   93 +++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                     |   10 +
>  drivers/media/v4l2-core/v4l2-dev.c                            |   21 +
>  drivers/media/v4l2-core/v4l2-ioctl.c                          |   66 +++
>  drivers/media/v4l2-core/v4l2-mem2mem.c                        |   13 +-
>  include/media/v4l2-ctrls.h                                    |   13 +-
>  include/media/v4l2-dev.h                                      |    2 +
>  include/media/v4l2-ioctl.h                                    |   34 ++
>  {sound/soc/fsl =3D> include/sound}/fsl_asrc_common.h            |   60 +=
++
>  include/uapi/linux/media.h                                    |    2 +
>  include/uapi/linux/v4l2-controls.h                            |    9 +
>  include/uapi/linux/videodev2.h                                |   50 +-
>  sound/soc/fsl/fsl_asrc.c                                      |  144 +++=
+++
>  sound/soc/fsl/fsl_asrc.h                                      |    4 +-
>  sound/soc/fsl/fsl_asrc_dma.c                                  |    2 +-
>  sound/soc/fsl/fsl_easrc.c                                     |  233 +++=
+++++++
>  sound/soc/fsl/fsl_easrc.h                                     |    6 +-
>  43 files changed, 3145 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2m=
em.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-audio=
-m2m.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst
>  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
>  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
>  rename {sound/soc/fsl =3D> include/sound}/fsl_asrc_common.h (60%)
>=20


