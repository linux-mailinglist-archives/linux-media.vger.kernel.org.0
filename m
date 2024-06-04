Return-Path: <linux-media+bounces-12527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2748FB1B9
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 14:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58CF81F25236
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 12:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A062145B16;
	Tue,  4 Jun 2024 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hNzqwvjb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF214535F
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502632; cv=none; b=MATAOCz1GoSryrY8s1RNhTIW59NU7xGXN7UKHKX6wvdc9Eadmptx4Lxeg7Z/GI7t19seTex7/R1XFyGGl9nzqk5QC4pc40Co9rSQqs0RtVoZJb7kKVz3Fxu7qMIccW3JebhtsTVQr7ep7Vk/J7GmbXSO10sSlr3jT9nLBxclqsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502632; c=relaxed/simple;
	bh=lbW98pXXi/IwBOmnhJne7IZnzCe8gwu/3o29EQBn+6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G2kGPyX0G4Ix22RKN4Vhdpv/UIHHBdthRBuFJi+9D0rqzHwVLDmk0IZqnreLnIJHmqNkujEWSAxt9LXyv6Z+a0B5KAYSH+wuhCske/HrGbqXY39REx3YKFOvpZaWKt5sZxctku+8sIg3BR1xW/k0v/o5s7iJf/ce2rODkX0cJas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hNzqwvjb; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7ead8882735so183045739f.3
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2024 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717502627; x=1718107427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XF3IKapM62Yo4QpSi50yWO693liwntqwiPWvlss1/0=;
        b=hNzqwvjbgbUfz9BJM39Zmgmza3hbMPe/b05hxpNSzhfMjdydXjnadPfXCcvfeSI5PP
         Mz9OR4Oi7ZABuHZxMAZBTOaAbbQS+xBsgOlWQ3XGsTo0MHKNFIHDsZFjyrCH0ek/LVBX
         GEOTMU0/rahn61F6MyCkRH3k3+oE1xVrQcwtgoKjWjBrvsrKBwMC+i9V0P0lYdKhrMKX
         Ab6+V5THVLcTkroUSyVqhPSizxc1MnKNJSXVlfylPR824P5iyC5HsD+uXv9j8qr939Kv
         cgvhyaURPFgZvrNYPtKrEXXCSq0C46PNmR52pRnbciUrhBSEV086ZaXZusCzhKpCpt0k
         KqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717502627; x=1718107427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XF3IKapM62Yo4QpSi50yWO693liwntqwiPWvlss1/0=;
        b=oZrHHzl78L0DkIfqIpsggsPneM1ukF/VGBYDNeq9QcV4sTzY0KtbCXjEBAQOGdWVC3
         eYwKfCmdUIaRfQz/Z9Rq7iXx0zwo0jjFW53yfhj4XAsT6+0AQZ2zhvIAWkTPUwhAG6qu
         CbaTGoWAdLkRntcMa7tKdC5m9YvJEs116Ujv+mXFiqP+lrm3vKIFZdIVCf0CdBJJ5Swb
         wb5Zfkn70P2qTMQHE401vNm1mOnqkGzLcZ4q9hfgaDvnn2hPxUpwqVUPgp/b61cAQuYm
         5aD3a3wmsm8Yzkb9qclVgtlbl3E8oLDYyV7uRtPdWN/eaBi3ES1AqbeUnohK5ibmXrxs
         9nsA==
X-Forwarded-Encrypted: i=1; AJvYcCV/IXjzrj613tV8gPjbqNWba62QrUXoRoma4AAqNTp5D5Ei2njanZnJ3na0ycYLAn65nR9mjvbyh7vaNfeLESfo46f2WNGlj94CiHc=
X-Gm-Message-State: AOJu0YyPlFCjudQ+G6JQg1R1BFkbK+UiScOFTIH9fyeUycujBgHv9XYy
	gflIgdrlk6y1ZKMJkyZJIkeKNNwww04xOStdHez1lUmWvZkjl1S7xen5cTBXcnFXCNwoJDldKqk
	6aTL1zRFI/UJaZ/ozh7DB+adaMnHyaHZT3yYq
X-Google-Smtp-Source: AGHT+IFoQbvoChHxIbkH1nt+S2Obc3DQrj63cIqjMYUAQMUy5lcprzqSH6cilJ+0rMgt5SqakxEk8zdvPli+CcY+27Y=
X-Received: by 2002:a05:6602:1490:b0:7e1:6952:3479 with SMTP id
 ca18e2360f4ac-7eafff31da1mr1493586839f.13.1717502626896; Tue, 04 Jun 2024
 05:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com> <20240507155413.266057-2-panikiel@google.com>
 <c5f40d46-9e8d-40f9-82ee-83013dbc134e@xs4all.nl> <CAM5zL5reA_nyt0FfmE2+eFESq6JdHJ8Z1wCp1zEsvLECeOx3mA@mail.gmail.com>
 <fee56d57-ae17-4001-8f22-bd32ce74c8af@xs4all.nl>
In-Reply-To: <fee56d57-ae17-4001-8f22-bd32ce74c8af@xs4all.nl>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Tue, 4 Jun 2024 14:03:35 +0200
Message-ID: <CAM5zL5qbfMnjrBqaF7gw1XfiiFpCF4QTVTvO9ZMPmNFiHJDvDg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] media: Add Chameleon v3 video interface driver
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org, 
	robh+dt@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 4:56=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all.=
nl> wrote:
>
> On 03/06/2024 16:32, Pawe=C5=82 Anikiel wrote:
> > On Mon, Jun 3, 2024 at 9:57=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4=
all.nl> wrote:
> >>
> >> On 07/05/2024 17:54, Pawe=C5=82 Anikiel wrote:
> >>> Add v4l2 driver for the video interface present on the Google
> >>> Chameleon v3. The Chameleon v3 uses the video interface to capture
> >>> a single video source from a given HDMI or DP connector and write
> >>> the resulting frames to memory.
> >>>
> >>> Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> >>> ---
> >>>  drivers/media/platform/Kconfig             |   1 +
> >>>  drivers/media/platform/Makefile            |   1 +
> >>>  drivers/media/platform/google/Kconfig      |  13 +
> >>>  drivers/media/platform/google/Makefile     |   3 +
> >>>  drivers/media/platform/google/chv3-video.c | 891 +++++++++++++++++++=
++
> >>>  5 files changed, 909 insertions(+)
> >>>  create mode 100644 drivers/media/platform/google/Kconfig
> >>>  create mode 100644 drivers/media/platform/google/Makefile
> >>>  create mode 100644 drivers/media/platform/google/chv3-video.c
> >>>
> >>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/=
Kconfig
> >>> index 91e54215de3a..b82f7b142b85 100644
> >>> --- a/drivers/media/platform/Kconfig
> >>> +++ b/drivers/media/platform/Kconfig
> >>> @@ -69,6 +69,7 @@ source "drivers/media/platform/aspeed/Kconfig"
> >>>  source "drivers/media/platform/atmel/Kconfig"
> >>>  source "drivers/media/platform/cadence/Kconfig"
> >>>  source "drivers/media/platform/chips-media/Kconfig"
> >>> +source "drivers/media/platform/google/Kconfig"
> >>>  source "drivers/media/platform/intel/Kconfig"
> >>>  source "drivers/media/platform/marvell/Kconfig"
> >>>  source "drivers/media/platform/mediatek/Kconfig"
> >>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform=
/Makefile
> >>> index 3296ec1ebe16..f7067eb05f76 100644
> >>> --- a/drivers/media/platform/Makefile
> >>> +++ b/drivers/media/platform/Makefile
> >>> @@ -12,6 +12,7 @@ obj-y +=3D aspeed/
> >>>  obj-y +=3D atmel/
> >>>  obj-y +=3D cadence/
> >>>  obj-y +=3D chips-media/
> >>> +obj-y +=3D google/
> >>>  obj-y +=3D intel/
> >>>  obj-y +=3D marvell/
> >>>  obj-y +=3D mediatek/
> >>> diff --git a/drivers/media/platform/google/Kconfig b/drivers/media/pl=
atform/google/Kconfig
> >>> new file mode 100644
> >>> index 000000000000..9674a4c12e2d
> >>> --- /dev/null
> >>> +++ b/drivers/media/platform/google/Kconfig
> >>> @@ -0,0 +1,13 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only
> >>> +
> >>> +config VIDEO_CHAMELEONV3
> >>> +     tristate "Google Chameleon v3 video driver"
> >>> +     depends on V4L_PLATFORM_DRIVERS
> >>> +     depends on VIDEO_DEV
> >>> +     select VIDEOBUF2_DMA_CONTIG
> >>> +     select V4L2_FWNODE
> >>> +     help
> >>> +       v4l2 driver for the video interface present on the Google
> >>> +       Chameleon v3. The Chameleon v3 uses the video interface to
> >>> +       capture a single video source from a given HDMI or DP connect=
or
> >>> +       and write the resulting frames to memory.
> >>> diff --git a/drivers/media/platform/google/Makefile b/drivers/media/p=
latform/google/Makefile
> >>> new file mode 100644
> >>> index 000000000000..cff06486244c
> >>> --- /dev/null
> >>> +++ b/drivers/media/platform/google/Makefile
> >>> @@ -0,0 +1,3 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only
> >>> +
> >>> +obj-$(CONFIG_VIDEO_CHAMELEONV3) +=3D chv3-video.o
> >>> diff --git a/drivers/media/platform/google/chv3-video.c b/drivers/med=
ia/platform/google/chv3-video.c
> >>> new file mode 100644
> >>> index 000000000000..6e782484abaf
> >>> --- /dev/null
> >>> +++ b/drivers/media/platform/google/chv3-video.c
> >>> @@ -0,0 +1,891 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +/*
> >>> + * Copyright 2023-2024 Google LLC.
> >>> + * Author: Pawe=C5=82 Anikiel <panikiel@google.com>
> >>> + */
> >>> +
> >>> +#include <linux/delay.h>
> >>> +#include <linux/dma-mapping.h>
> >>> +#include <linux/interrupt.h>
> >>> +#include <linux/kernel.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/of.h>
> >>> +#include <linux/platform_device.h>
> >>> +#include <linux/v4l2-dv-timings.h>
> >>> +#include <linux/videodev2.h>
> >>> +#include <media/v4l2-ctrls.h>
> >>> +#include <media/v4l2-device.h>
> >>> +#include <media/v4l2-dv-timings.h>
> >>> +#include <media/v4l2-event.h>
> >>> +#include <media/v4l2-fwnode.h>
> >>> +#include <media/v4l2-ioctl.h>
> >>> +#include <media/videobuf2-dma-contig.h>
> >>> +
> >>> +#define DEVICE_NAME  "chv3-video"
> >>> +
> >>> +#define VIDEO_EN                     0x00
> >>> +#define VIDEO_EN_BIT                 BIT(0)
> >>> +#define VIDEO_HEIGHT                 0x04
> >>> +#define VIDEO_WIDTH                  0x08
> >>> +#define VIDEO_BUFFERA                        0x0c
> >>> +#define VIDEO_BUFFERB                        0x10
> >>> +#define VIDEO_BUFFERSIZE             0x14
> >>> +#define VIDEO_RESET                  0x18
> >>> +#define VIDEO_RESET_BIT                      BIT(0)
> >>> +#define VIDEO_ERRORSTATUS            0x1c
> >>> +#define VIDEO_IOCOLOR                        0x20
> >>> +#define VIDEO_DATARATE                       0x24
> >>> +#define VIDEO_DATARATE_SINGLE                0x0
> >>> +#define VIDEO_DATARATE_DOUBLE                0x1
> >>> +#define VIDEO_PIXELMODE                      0x28
> >>> +#define VIDEO_PIXELMODE_SINGLE               0x0
> >>> +#define VIDEO_PIXELMODE_DOUBLE               0x1
> >>> +#define VIDEO_SYNCPOLARITY           0x2c
> >>> +#define VIDEO_DMAFORMAT                      0x30
> >>> +#define VIDEO_DMAFORMAT_8BPC         0x0
> >>> +#define VIDEO_DMAFORMAT_10BPC_UPPER  0x1
> >>> +#define VIDEO_DMAFORMAT_10BPC_LOWER  0x2
> >>> +#define VIDEO_DMAFORMAT_12BPC_UPPER  0x3
> >>> +#define VIDEO_DMAFORMAT_12BPC_LOWER  0x4
> >>> +#define VIDEO_DMAFORMAT_16BPC                0x5
> >>> +#define VIDEO_DMAFORMAT_RAW          0x6
> >>> +#define VIDEO_DMAFORMAT_8BPC_PAD     0x7
> >>> +#define VIDEO_VERSION                        0x34
> >>> +#define VIDEO_VERSION_CURRENT                0xc0fb0001
> >>> +
> >>> +#define VIDEO_IRQ_MASK               0x8
> >>> +#define VIDEO_IRQ_CLR                0xc
> >>> +#define VIDEO_IRQ_ALL                0xf
> >>> +#define VIDEO_IRQ_BUFF0              BIT(0)
> >>> +#define VIDEO_IRQ_BUFF1              BIT(1)
> >>> +#define VIDEO_IRQ_RESOLUTION BIT(2)
> >>> +#define VIDEO_IRQ_ERROR              BIT(3)
> >>> +
> >>> +struct chv3_video {
> >>> +     struct device *dev;
> >>> +     void __iomem *iobase;
> >>> +     void __iomem *iobase_irq;
> >>> +
> >>> +     struct v4l2_device v4l2_dev;
> >>> +     struct vb2_queue queue;
> >>> +     struct video_device vdev;
> >>> +     struct v4l2_pix_format pix_fmt;
> >>> +     struct v4l2_dv_timings timings;
> >>> +     u32 bytes_per_pixel;
> >>> +
> >>> +     struct v4l2_ctrl_handler ctrl_handler;
> >>> +     struct v4l2_async_notifier notifier;
> >>> +     struct v4l2_subdev *subdev;
> >>> +     int subdev_source_pad;
> >>> +
> >>> +     u32 sequence;
> >>> +     bool writing_to_a;
> >>> +
> >>> +     struct list_head bufs;
> >>> +     spinlock_t bufs_lock;
> >>> +
> >>> +     struct mutex video_lock;
> >>> +};
> >>> +
> >>> +struct chv3_video_buffer {
> >>> +     struct vb2_v4l2_buffer vb;
> >>> +     struct list_head link;
> >>> +};
> >>> +
> >>> +struct chv3_video_config {
> >>> +     u32 pixelformat;
> >>> +     u32 bytes_per_pixel;
> >>> +     u32 dmaformat;
> >>> +};
> >>> +
> >>> +static void chv3_video_set_format_resolution(struct chv3_video *vide=
o, u32 width, u32 height)
> >>> +{
> >>> +     video->pix_fmt.width =3D width;
> >>> +     video->pix_fmt.height =3D height;
> >>> +     video->pix_fmt.bytesperline =3D width * video->bytes_per_pixel;
> >>> +     video->pix_fmt.sizeimage =3D video->pix_fmt.bytesperline * heig=
ht;
> >>> +}
> >>> +
> >>> +/*
> >>> + * The video interface has hardware counters which expose the width =
and
> >>> + * height of the current video stream. It can't reliably detect if t=
he stream
> >>> + * is present or not, so this is only used as a fallback in the case=
 where
> >>> + * we don't have access to the receiver hardware.
> >>> + */
> >>> +static int chv3_video_query_dv_timings_fallback(struct chv3_video *v=
ideo,
> >>> +                                             struct v4l2_dv_timings =
*timings)
> >>> +{
> >>> +     u32 width, height;
> >>> +
> >>> +     width  =3D readl(video->iobase + VIDEO_WIDTH);
> >>> +     height =3D readl(video->iobase + VIDEO_HEIGHT);
> >>> +     if (width =3D=3D 0 || height =3D=3D 0)
> >>> +             return -ENOLINK;
> >>> +
> >>> +     memset(timings, 0, sizeof(*timings));
> >>> +     timings->type =3D V4L2_DV_BT_656_1120;
> >>> +     timings->bt.width  =3D width;
> >>> +     timings->bt.height =3D height;
> >>> +     timings->bt.pixelclock =3D width * height * 24;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int chv3_video_query_dv_timings(struct chv3_video *video, str=
uct v4l2_dv_timings *timings)
> >>> +{
> >>> +     if (video->subdev) {
> >>> +             return v4l2_subdev_call(video->subdev, pad, query_dv_ti=
mings,
> >>> +                                     video->subdev_source_pad, timin=
gs);
> >>> +     } else {
> >>> +             return chv3_video_query_dv_timings_fallback(video, timi=
ngs);
> >>> +     }
> >>
> >> I would move the contents of chv3_video_query_dv_timings_fallback() to=
 this
> >> function and drop the old fallback function. It makes more sense if it=
 is all
> >> in the same function.
> >>
> >>> +}
> >>> +
> >>> +static const struct v4l2_dv_timings_cap chv3_video_fallback_dv_timin=
gs_cap =3D {
> >>> +     .type =3D V4L2_DV_BT_656_1120,
> >>> +     .bt =3D {
> >>> +             .min_width =3D 640,
> >>> +             .max_width =3D 7680,
> >>> +             .min_height =3D 480,
> >>> +             .max_height =3D 4320,
> >>> +             .min_pixelclock =3D 25000000,
> >>> +             .max_pixelclock =3D 1080000000,
> >>> +             .standards =3D V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_D=
MT |
> >>> +                     V4L2_DV_BT_STD_CVT | V4L2_DV_BT_STD_GTF,
> >>> +             .capabilities =3D V4L2_DV_BT_CAP_PROGRESSIVE |
> >>> +                     V4L2_DV_BT_CAP_REDUCED_BLANKING |
> >>> +                     V4L2_DV_BT_CAP_CUSTOM,
> >>> +     },
> >>> +};
> >>> +
> >>> +static int chv3_video_enum_dv_timings_fallback(struct chv3_video *vi=
deo,
> >>> +                                            struct v4l2_enum_dv_timi=
ngs *timings)
> >>> +{
> >>> +     return v4l2_enum_dv_timings_cap(timings, &chv3_video_fallback_d=
v_timings_cap,
> >>> +                                     NULL, NULL);
> >>> +}
> >>> +
> >>> +static int chv3_video_dv_timings_cap_fallback(struct chv3_video *vid=
eo,
> >>> +                                           struct v4l2_dv_timings_ca=
p *cap)
> >>> +{
> >>> +     *cap =3D chv3_video_fallback_dv_timings_cap;
> >>> +
> >>> +     return 0;
> >>> +}
> >>
> >> Same for these two fallback functions: move them to the functions that=
 calls them.
> >>
> >>> +
> >>> +static void chv3_video_apply_dv_timings(struct chv3_video *video)
> >>> +{
> >>> +     struct v4l2_dv_timings timings;
> >>> +     int res;
> >>> +
> >>> +     res =3D chv3_video_query_dv_timings(video, &timings);
> >>> +     if (res)
> >>> +             return;
> >>> +
> >>> +     video->timings =3D timings;
> >>> +     chv3_video_set_format_resolution(video, timings.bt.width, timin=
gs.bt.height);
> >>> +}
> >>> +
> >>> +static int chv3_video_querycap(struct file *file, void *fh, struct v=
4l2_capability *cap)
> >>> +{
> >>> +     strscpy(cap->driver, DEVICE_NAME, sizeof(cap->driver));
> >>> +     strscpy(cap->card, "Chameleon v3 video", sizeof(cap->card));
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int chv3_video_g_fmt_vid_cap(struct file *file, void *fh, str=
uct v4l2_format *fmt)
> >>> +{
> >>> +     struct chv3_video *video =3D video_drvdata(file);
> >>> +
> >>> +     fmt->fmt.pix =3D video->pix_fmt;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int chv3_video_enum_fmt_vid_cap(struct file *file, void *fh, =
struct v4l2_fmtdesc *fmt)
> >>> +{
> >>> +     struct chv3_video *video =3D video_drvdata(file);
> >>> +
> >>> +     if (fmt->index !=3D 0)
> >>> +             return -EINVAL;
> >>> +
> >>> +     fmt->flags =3D 0;
> >>> +     fmt->pixelformat =3D video->pix_fmt.pixelformat;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int chv3_video_g_input(struct file *file, void *fh, unsigned =
int *index)
> >>> +{
> >>> +     *index =3D 0;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int chv3_video_s_input(struct file *file, void *fh, unsigned =
int index)
> >>> +{
> >>> +     if (index !=3D 0)
> >>> +             return -EINVAL;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int chv3_video_enum_input(struct file *file, void *fh, struct=
 v4l2_input *input)
> >>> +{
> >>> +     if (input->index !=3D 0)
> >>> +             return -EINVAL;
> >>> +
> >>> +     strscpy(input->name, "input0", sizeof(input->name));
> >>
> >> This name is not terribly user friendly. Is it possible to determine a=
 more human
> >> readable name? E.g. "DP1", "DP2", etc. Something that matches labeling=
 on the Chameleon
> >> board.
> >
> > The driver would require some board-specific instance info to
> > determine if the video interface is connected to DP1, DP2, or the
> > auxiliary decoder (or something entirely different if this IP was used
> > on a different board). I don't see an easy way to determine such a
> > human readable name, unfortunately.
>
> It is possible, but it requires adding a connector to video pipeline in t=
he device tree.
> See e.g. Documentation/devicetree/bindings/display/connector/dp-connector=
.yaml and
> Documentation/devicetree/bindings/media/i2c/tvp5150.txt.

I am using connectors in the device tree, actually. See the last
commit of this patchset. However, it's not connected directly - the
video interface is connected to the DP receiver which is then
connected to the connector.

>
> While connectors are used in drm, in the media subsytem only the tvp5150 =
driver ever
> used it for analog video inputs.
>
> The connectors have a label, and that can be used to fill in the input na=
me.
>
> It is worth checking if this would work without too much effort, but if n=
ot, then
> at least change the "input0" string to something like "Video Input".

In order to read the connector label, the video interface driver would
have to make some assumptions about the incoming pipeline, e.g. figure
out which port of the decoder dt node is the input (how? just assume
it's port 0?). Do you see a good way to deal with that?


>
> >
> >>
> >>> +     input->type =3D V4L2_INPUT_TYPE_CAMERA;
> >>> +     input->capabilities =3D V4L2_IN_CAP_DV_TIMINGS;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int chv3_video_g_edid(struct file *file, void *fh, struct v4l=
2_edid *edid)
> >>> +{
> >>> +     struct chv3_video *video =3D video_drvdata(file);
> >>> +     int res;
> >>> +
> >>> +     if (!video->subdev)
> >>> +             return -ENOTTY;
> >>> +
> >>> +     if (edid->pad !=3D 0)
> >>> +             return -EINVAL;
> >>> +
> >>> +     edid->pad =3D video->subdev_source_pad;
> >>> +     res =3D v4l2_subdev_call(video->subdev, pad, get_edid, edid);
> >>> +     edid->pad =3D 0;
> >>> +
> >>> +     return res;
> >>> +}
> >>> +
> >>> +static int chv3_video_s_edid(struct file *file, void *fh, struct v4l=
2_edid *edid)
> >>> +{
> >>> +     struct chv3_video *video =3D video_drvdata(file);
> >>> +     int res;
> >>> +
> >>> +     if (!video->subdev)
> >>> +             return -ENOTTY;
> >>> +
> >>> +     if (edid->pad !=3D 0)
> >>> +             return -EINVAL;
> >>> +
> >>> +     edid->pad =3D video->subdev_source_pad;
> >>> +     res =3D v4l2_subdev_call(video->subdev, pad, set_edid, edid);
> >>> +     edid->pad =3D 0;
> >>> +
> >>> +     return res;
> >>> +}
> >>> +
> >>> +static int chv3_video_s_dv_timings(struct file *file, void *fh, stru=
ct v4l2_dv_timings *timings)
> >>> +{
> >>> +     struct chv3_video *video =3D video_drvdata(file);
> >>> +
> >>> +     if (v4l2_match_dv_timings(&video->timings, timings, 0, false))
> >>> +             return 0;
> >>> +
> >>> +     if (vb2_is_busy(&video->queue))
> >>> +             return -EBUSY;
> >>
> >> This should be moved to after the next 'if'.
> >>
> >>> +
> >>> +     if (!v4l2_valid_dv_timings(timings, &chv3_video_fallback_dv_tim=
ings_cap, NULL, NULL))
> >>> +             return -ERANGE;
> >>> +
> >>> +     video->timings =3D *timings;
> >>> +     chv3_video_set_format_resolution(video, timings->bt.width, timi=
ngs->bt.height);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int chv3_video_g_dv_timings(struct file *file, void *fh, stru=
ct v4l2_dv_timings *timings)
> >>> +{
> >>> +     struct chv3_video *video =3D video_drvdata(file);
> >>> +
> >>> +     *timings =3D video->timings;
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int chv3_video_vidioc_query_dv_timings(struct file *file, voi=
d *fh,
> >>> +                                           struct v4l2_dv_timings *t=
imings)
> >>> +{
> >>> +     struct chv3_video *video =3D video_drvdata(file);
> >>> +
> >>> +     return chv3_video_query_dv_timings(video, timings);
> >>> +}
> >>> +
> >>> +static int chv3_video_enum_dv_timings(struct file *file, void *fh,
> >>> +                                   struct v4l2_enum_dv_timings *timi=
ngs)
> >>> +{
> >>> +     struct chv3_video *video =3D video_drvdata(file);
> >>> +     int res;
> >>> +
> >>> +     if (timings->pad !=3D 0)
> >>> +             return -EINVAL;
> >>> +
> >>> +     if (video->subdev) {
> >>> +             timings->pad =3D video->subdev_source_pad;
> >>> +             res =3D v4l2_subdev_call(video->subdev, pad, enum_dv_ti=
mings, timings);
> >>> +             timings->pad =3D 0;
> >>> +             return res;
> >>> +     } else {
> >>> +             return chv3_video_enum_dv_timings_fallback(video, timin=
gs);
> >>
> >> It is much easier to read if the contents of chv3_video_enum_dv_timing=
s_fallback
> >> is moved here.
> >>
> >>> +     }
> >>> +}
> >>> +
> >>> +static int chv3_video_dv_timings_cap(struct file *file, void *fh, st=
ruct v4l2_dv_timings_cap *cap)
> >>> +{
> >>> +     struct chv3_video *video =3D video_drvdata(file);
> >>> +     int res;
> >>> +
> >>> +     if (cap->pad !=3D 0)
> >>> +             return -EINVAL;
> >>> +
> >>> +     if (video->subdev) {
> >>> +             cap->pad =3D video->subdev_source_pad;
> >>> +             res =3D v4l2_subdev_call(video->subdev, pad, dv_timings=
_cap, cap);
> >>> +             cap->pad =3D 0;
> >>> +             return res;
> >>> +     } else {
> >>> +             return chv3_video_dv_timings_cap_fallback(video, cap);
> >>
> >> Ditto.
> >>
> >>> +     }
> >>> +}
> >>> +
> >>> +static int chv3_video_subscribe_event(struct v4l2_fh *fh,
> >>> +                                   const struct v4l2_event_subscript=
ion *sub)
> >>> +{
> >>> +     switch (sub->type) {
> >>> +     case V4L2_EVENT_SOURCE_CHANGE:
> >>> +             return v4l2_src_change_event_subscribe(fh, sub);
> >>> +     }
> >>> +
> >>> +     return v4l2_ctrl_subscribe_event(fh, sub);
> >>> +}
> >>> +
> >>> +static const struct v4l2_ioctl_ops chv3_video_v4l2_ioctl_ops =3D {
> >>> +     .vidioc_querycap =3D chv3_video_querycap,
> >>> +
> >>> +     .vidioc_enum_fmt_vid_cap =3D chv3_video_enum_fmt_vid_cap,
> >>> +     .vidioc_g_fmt_vid_cap =3D chv3_video_g_fmt_vid_cap,
> >>> +     .vidioc_s_fmt_vid_cap =3D chv3_video_g_fmt_vid_cap,
> >>> +     .vidioc_try_fmt_vid_cap =3D chv3_video_g_fmt_vid_cap,
> >>> +
> >>> +     .vidioc_enum_input =3D chv3_video_enum_input,
> >>> +     .vidioc_g_input =3D chv3_video_g_input,
> >>> +     .vidioc_s_input =3D chv3_video_s_input,
> >>> +     .vidioc_g_edid =3D chv3_video_g_edid,
> >>> +     .vidioc_s_edid =3D chv3_video_s_edid,
> >>> +
> >>> +     .vidioc_reqbufs =3D vb2_ioctl_reqbufs,
> >>> +     .vidioc_create_bufs =3D vb2_ioctl_create_bufs,
> >>> +     .vidioc_querybuf =3D vb2_ioctl_querybuf,
> >>> +     .vidioc_prepare_buf =3D vb2_ioctl_prepare_buf,
> >>> +     .vidioc_expbuf =3D vb2_ioctl_expbuf,
> >>> +     .vidioc_qbuf =3D vb2_ioctl_qbuf,
> >>> +     .vidioc_dqbuf =3D vb2_ioctl_dqbuf,
> >>> +     .vidioc_streamon =3D vb2_ioctl_streamon,
> >>> +     .vidioc_streamoff =3D vb2_ioctl_streamoff,
> >>> +
> >>> +     .vidioc_s_dv_timings =3D chv3_video_s_dv_timings,
> >>> +     .vidioc_g_dv_timings =3D chv3_video_g_dv_timings,
> >>> +     .vidioc_query_dv_timings =3D chv3_video_vidioc_query_dv_timings=
,
> >>> +     .vidioc_enum_dv_timings =3D chv3_video_enum_dv_timings,
> >>> +     .vidioc_dv_timings_cap =3D chv3_video_dv_timings_cap,
> >>> +
> >>> +     .vidioc_subscribe_event =3D chv3_video_subscribe_event,
> >>> +     .vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> >>> +};
> >>> +
> >>> +static int chv3_video_queue_setup(struct vb2_queue *q,
> >>> +                               unsigned int *nbuffers, unsigned int =
*nplanes,
> >>> +                               unsigned int sizes[], struct device *=
alloc_devs[])
> >>> +{
> >>> +     struct chv3_video *video =3D vb2_get_drv_priv(q);
> >>> +
> >>> +     if (*nplanes) {
> >>> +             if (sizes[0] < video->pix_fmt.sizeimage)
> >>> +                     return -EINVAL;
> >>> +             return 0;
> >>> +     }
> >>> +     *nplanes =3D 1;
> >>> +     sizes[0] =3D video->pix_fmt.sizeimage;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +/*
> >>> + * There are two address registers: BUFFERA and BUFFERB. The device
> >>> + * alternates writing between them (i.e. even frames go to BUFFERA, =
odd
> >>> + * ones to BUFFERB).
> >>> + *
> >>> + *  (buffer queue) >     QUEUED ---> QUEUED ---> QUEUED ---> ...
> >>> + *                       BUFFERA     BUFFERB
> >>> + *  (hw writing to this) ^
> >>> + *                (and then to this) ^
> >>> + *
> >>> + * The buffer swapping happens at irq time. When an irq comes, the n=
ext
> >>> + * frame is already assigned an address in the buffer queue. This gi=
ves
> >>> + * the irq handler a whole frame's worth of time to update the buffe=
r
> >>> + * address register.
> >>> + */
> >>> +
> >>> +static dma_addr_t chv3_video_buffer_dma_addr(struct chv3_video_buffe=
r *buf)
> >>> +{
> >>> +     return vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> >>> +}
> >>> +
> >>> +static void chv3_video_start_frame(struct chv3_video *video, struct =
chv3_video_buffer *buf)
> >>> +{
> >>> +     video->writing_to_a =3D 1;
> >>> +     writel(chv3_video_buffer_dma_addr(buf), video->iobase + VIDEO_B=
UFFERA);
> >>> +     writel(VIDEO_EN_BIT, video->iobase + VIDEO_EN);
> >>> +}
> >>> +
> >>> +static void chv3_video_next_frame(struct chv3_video *video, struct c=
hv3_video_buffer *buf)
> >>> +{
> >>> +     u32 reg =3D video->writing_to_a ? VIDEO_BUFFERB : VIDEO_BUFFERA=
;
> >>> +
> >>> +     writel(chv3_video_buffer_dma_addr(buf), video->iobase + reg);
> >>> +}
> >>> +
> >>> +static int chv3_video_start_streaming(struct vb2_queue *q, unsigned =
int count)
> >>> +{
> >>> +     struct chv3_video *video =3D vb2_get_drv_priv(q);
> >>> +     struct chv3_video_buffer *buf;
> >>> +     unsigned long flags;
> >>> +
> >>> +     video->sequence =3D 0;
> >>> +     writel(video->pix_fmt.sizeimage, video->iobase + VIDEO_BUFFERSI=
ZE);
> >>> +
> >>> +     spin_lock_irqsave(&video->bufs_lock, flags);
> >>> +     buf =3D list_first_entry_or_null(&video->bufs, struct chv3_vide=
o_buffer, link);
> >>> +     if (buf) {
> >>> +             chv3_video_start_frame(video, buf);
> >>> +             if (!list_is_last(&buf->link, &video->bufs))
> >>> +                     chv3_video_next_frame(video, list_next_entry(bu=
f, link));
> >>> +     }
> >>> +     spin_unlock_irqrestore(&video->bufs_lock, flags);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static void chv3_video_stop_streaming(struct vb2_queue *q)
> >>> +{
> >>> +     struct chv3_video *video =3D vb2_get_drv_priv(q);
> >>> +     struct chv3_video_buffer *buf;
> >>> +     unsigned long flags;
> >>> +
> >>> +     writel(0, video->iobase + VIDEO_EN);
> >>> +
> >>> +     spin_lock_irqsave(&video->bufs_lock, flags);
> >>> +     list_for_each_entry(buf, &video->bufs, link)
> >>> +             vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> >>> +     INIT_LIST_HEAD(&video->bufs);
> >>> +     spin_unlock_irqrestore(&video->bufs_lock, flags);
> >>> +}
> >>> +
> >>> +static void chv3_video_buf_queue(struct vb2_buffer *vb)
> >>> +{
> >>> +     struct chv3_video *video =3D vb2_get_drv_priv(vb->vb2_queue);
> >>> +     struct vb2_v4l2_buffer *v4l2_buf =3D to_vb2_v4l2_buffer(vb);
> >>> +     struct chv3_video_buffer *buf =3D container_of(v4l2_buf, struct=
 chv3_video_buffer, vb);
> >>> +     bool first, second;
> >>> +     unsigned long flags;
> >>> +
> >>> +     spin_lock_irqsave(&video->bufs_lock, flags);
> >>> +     first =3D list_empty(&video->bufs);
> >>> +     second =3D list_is_singular(&video->bufs);
> >>> +     list_add_tail(&buf->link, &video->bufs);
> >>> +     if (vb2_is_streaming(vb->vb2_queue)) {
> >>
> >> This should be vb2_start_streaming_called().
> >>
> >> It does not matter all that much in this driver, since VIDIOC_STREAMON=
 will
> >> also call start_streaming, even if there are no buffers queued since t=
he
> >> vb2_queue min_queued_buffers field is 0. But if that ever changes, the=
n
> >> vb2_start_streaming_called() is the right call here.
> >
> > Okay, I see. Should the other use of vb2_is_streaming() within this
> > file be replaced as well?
>
> No, the other one is OK.
>
> >
> >>
> >>> +             if (first)
> >>> +                     chv3_video_start_frame(video, buf);
> >>> +             else if (second)
> >>> +                     chv3_video_next_frame(video, buf);
> >>> +     }
> >>> +     spin_unlock_irqrestore(&video->bufs_lock, flags);
> >>> +}
> >>> +
> >>> +static const struct vb2_ops chv3_video_vb2_ops =3D {
> >>> +     .queue_setup =3D chv3_video_queue_setup,
> >>> +     .wait_prepare =3D vb2_ops_wait_prepare,
> >>> +     .wait_finish =3D vb2_ops_wait_finish,
> >>> +     .start_streaming =3D chv3_video_start_streaming,
> >>> +     .stop_streaming =3D chv3_video_stop_streaming,
> >>> +     .buf_queue =3D chv3_video_buf_queue,
> >>> +};
> >>> +
> >>> +static int chv3_video_open(struct file *file)
> >>> +{
> >>> +     struct chv3_video *video =3D video_drvdata(file);
> >>> +     int res;
> >>> +
> >>> +     mutex_lock(&video->video_lock);
> >>> +     res =3D v4l2_fh_open(file);
> >>> +     if (!res) {
> >>> +             if (v4l2_fh_is_singular_file(file))
> >>> +                     chv3_video_apply_dv_timings(video);
> >>> +     }
> >>> +     mutex_unlock(&video->video_lock);
> >>> +
> >>> +     return res;
> >>> +}
> >>> +
> >>> +static const struct v4l2_file_operations chv3_video_v4l2_fops =3D {
> >>> +     .owner =3D THIS_MODULE,
> >>> +     .open =3D chv3_video_open,
> >>> +     .release =3D vb2_fop_release,
> >>> +     .unlocked_ioctl =3D video_ioctl2,
> >>> +     .mmap =3D vb2_fop_mmap,
> >>> +     .poll =3D vb2_fop_poll,
> >>> +};
> >>> +
> >>> +static void chv3_video_frame_irq(struct chv3_video *video)
> >>> +{
> >>> +     struct chv3_video_buffer *buf;
> >>> +
> >>> +     spin_lock(&video->bufs_lock);
> >>> +
> >>> +     buf =3D list_first_entry_or_null(&video->bufs, struct chv3_vide=
o_buffer, link);
> >>> +     if (!buf)
> >>> +             goto empty;
> >>> +     list_del(&buf->link);
> >>> +
> >>> +     vb2_set_plane_payload(&buf->vb.vb2_buf, 0, video->pix_fmt.sizei=
mage);
> >>> +     buf->vb.vb2_buf.timestamp =3D ktime_get_ns();
> >>> +     buf->vb.sequence =3D video->sequence++;
> >>> +     buf->vb.field =3D V4L2_FIELD_NONE;
> >>> +     vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> >>> +
> >>> +     buf =3D list_first_entry_or_null(&video->bufs, struct chv3_vide=
o_buffer, link);
> >>> +     if (buf) {
> >>> +             video->writing_to_a =3D !video->writing_to_a;
> >>> +             if (!list_is_last(&buf->link, &video->bufs))
> >>> +                     chv3_video_next_frame(video, list_next_entry(bu=
f, link));
> >>> +     } else {
> >>> +             writel(0, video->iobase + VIDEO_EN);
> >>> +     }
> >>> +empty:
> >>> +     spin_unlock(&video->bufs_lock);
> >>> +}
> >>> +
> >>> +static void chv3_video_error_irq(struct chv3_video *video)
> >>> +{
> >>> +     if (vb2_is_streaming(&video->queue))
> >>> +             vb2_queue_error(&video->queue);
> >>> +}
> >>> +
> >>> +static void chv3_video_resolution_irq(struct chv3_video *video)
> >>> +{
> >>> +     static const struct v4l2_event event =3D {
> >>> +             .type =3D V4L2_EVENT_SOURCE_CHANGE,
> >>> +             .u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION,
> >>> +     };
> >>> +
> >>> +     v4l2_event_queue(&video->vdev, &event);
> >>> +     chv3_video_error_irq(video);
> >>> +}
> >>> +
> >>> +static irqreturn_t chv3_video_isr(int irq, void *data)
> >>> +{
> >>> +     struct chv3_video *video =3D data;
> >>> +     unsigned int reg;
> >>> +
> >>> +     reg =3D readl(video->iobase_irq + VIDEO_IRQ_CLR);
> >>> +     if (!reg)
> >>> +             return IRQ_NONE;
> >>> +
> >>> +     if (reg & VIDEO_IRQ_BUFF0)
> >>> +             chv3_video_frame_irq(video);
> >>> +     if (reg & VIDEO_IRQ_BUFF1)
> >>> +             chv3_video_frame_irq(video);
> >>> +     if (reg & VIDEO_IRQ_RESOLUTION)
> >>> +             chv3_video_resolution_irq(video);
> >>> +     if (reg & VIDEO_IRQ_ERROR) {
> >>> +             dev_warn(video->dev, "error: 0x%x\n",
> >>> +                      readl(video->iobase + VIDEO_ERRORSTATUS));
> >>> +             chv3_video_error_irq(video);
> >>> +     }
> >>> +
> >>> +     writel(reg, video->iobase_irq + VIDEO_IRQ_CLR);
> >>> +
> >>> +     return IRQ_HANDLED;
> >>> +}
> >>> +
> >>> +static int chv3_video_check_version(struct chv3_video *video)
> >>> +{
> >>> +     u32 version;
> >>> +
> >>> +     version =3D readl(video->iobase + VIDEO_VERSION);
> >>> +     if (version !=3D VIDEO_VERSION_CURRENT) {
> >>> +             dev_err(video->dev,
> >>> +                     "wrong hw version: expected %x, got %x\n",
> >>> +                     VIDEO_VERSION_CURRENT, version);
> >>> +             return -ENODEV;
> >>> +     }
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static void chv3_video_init_timings_and_format(struct chv3_video *vi=
deo,
> >>> +                                            const struct chv3_video_=
config *config)
> >>> +{
> >>> +     struct v4l2_pix_format *pix =3D &video->pix_fmt;
> >>> +     struct v4l2_dv_timings timings =3D V4L2_DV_BT_CEA_1920X1080P60;
> >>> +
> >>> +     video->timings =3D timings;
> >>> +     video->bytes_per_pixel =3D config->bytes_per_pixel;
> >>> +
> >>> +     pix->pixelformat =3D config->pixelformat;
> >>> +     pix->field =3D V4L2_FIELD_NONE;
> >>> +     pix->colorspace =3D V4L2_COLORSPACE_SRGB;
> >>> +     chv3_video_set_format_resolution(video, timings.bt.width, timin=
gs.bt.height);
> >>> +}
> >>> +
> >>> +#define notifier_to_video(nf) container_of(nf, struct chv3_video, no=
tifier)
> >>> +
> >>> +static int chv3_video_async_notify_bound(struct v4l2_async_notifier =
*notifier,
> >>> +                                      struct v4l2_subdev *subdev,
> >>> +                                      struct v4l2_async_connection *=
asc)
> >>> +{
> >>> +     struct chv3_video *video =3D notifier_to_video(notifier);
> >>> +     int pad;
> >>> +
> >>> +     pad =3D media_entity_get_fwnode_pad(&subdev->entity, asc->match=
.fwnode,
> >>> +                                       MEDIA_PAD_FL_SOURCE);
> >>> +     if (pad < 0)
> >>> +             return pad;
> >>> +
> >>> +     video->subdev =3D subdev;
> >>> +     video->subdev_source_pad =3D pad;
> >>> +
> >>> +     video->v4l2_dev.ctrl_handler =3D subdev->ctrl_handler;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static void chv3_video_async_notify_unbind(struct v4l2_async_notifie=
r *notifier,
> >>> +                                        struct v4l2_subdev *subdev,
> >>> +                                        struct v4l2_async_connection=
 *asc)
> >>> +{
> >>> +     struct chv3_video *video =3D notifier_to_video(notifier);
> >>> +
> >>> +     vb2_video_unregister_device(&video->vdev);
> >>> +}
> >>> +
> >>> +static int chv3_video_async_notify_complete(struct v4l2_async_notifi=
er *notifier)
> >>> +{
> >>> +     struct chv3_video *video =3D notifier_to_video(notifier);
> >>> +
> >>> +     return video_register_device(&video->vdev, VFL_TYPE_VIDEO, -1);
> >>> +}
> >>> +
> >>> +static const struct v4l2_async_notifier_operations chv3_video_async_=
notify_ops =3D {
> >>> +     .bound =3D chv3_video_async_notify_bound,
> >>> +     .unbind =3D chv3_video_async_notify_unbind,
> >>> +     .complete =3D chv3_video_async_notify_complete,
> >>> +};
> >>> +
> >>> +static int chv3_video_fallback_init(struct chv3_video *video)
> >>> +{
> >>> +     int res;
> >>> +
> >>> +     video->subdev =3D NULL;
> >>> +     video->subdev_source_pad =3D 0;
> >>> +
> >>> +     v4l2_ctrl_handler_init(&video->ctrl_handler, 1);
> >>> +     v4l2_ctrl_new_std(&video->ctrl_handler, NULL,
> >>> +                       V4L2_CID_DV_RX_POWER_PRESENT, 0, 1, 0, 0);
> >>> +     res =3D video->ctrl_handler.error;
> >>> +     if (res)
> >>> +             goto handler_free;
> >>> +
> >>> +     video->v4l2_dev.ctrl_handler =3D &video->ctrl_handler;
> >>> +
> >>> +     res =3D video_register_device(&video->vdev, VFL_TYPE_VIDEO, -1)=
;
> >>> +     if (res)
> >>> +             goto handler_free;
> >>> +
> >>> +     return 0;
> >>> +
> >>> +handler_free:
> >>> +     v4l2_ctrl_handler_free(&video->ctrl_handler);
> >>> +
> >>> +     return res;
> >>> +}
> >>> +
> >>> +static int chv3_video_fwnode_init(struct chv3_video *video)
> >>> +{
> >>> +     struct v4l2_async_connection *asc;
> >>> +     struct fwnode_handle *endpoint;
> >>> +     int res;
> >>> +
> >>> +     endpoint =3D fwnode_graph_get_next_endpoint(dev_fwnode(video->d=
ev), NULL);
> >>> +     if (!endpoint)
> >>> +             return -EINVAL;
> >>> +
> >>> +     v4l2_async_nf_init(&video->notifier, &video->v4l2_dev);
> >>> +
> >>> +     asc =3D v4l2_async_nf_add_fwnode_remote(&video->notifier, endpo=
int,
> >>> +                                           struct v4l2_async_connect=
ion);
> >>> +     fwnode_handle_put(endpoint);
> >>> +
> >>> +     if (IS_ERR(asc))
> >>> +             return PTR_ERR(asc);
> >>> +
> >>> +     video->notifier.ops =3D &chv3_video_async_notify_ops;
> >>> +     res =3D v4l2_async_nf_register(&video->notifier);
> >>> +     if (res) {
> >>> +             v4l2_async_nf_cleanup(&video->notifier);
> >>> +             return res;
> >>> +     }
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int chv3_video_probe(struct platform_device *pdev)
> >>> +{
> >>> +     struct chv3_video *video;
> >>> +     const struct chv3_video_config *config;
> >>> +     int res;
> >>> +     int irq;
> >>> +
> >>> +     video =3D devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);
> >>> +     if (!video)
> >>> +             return -ENOMEM;
> >>> +     video->dev =3D &pdev->dev;
> >>> +     platform_set_drvdata(pdev, video);
> >>> +
> >>> +     config =3D device_get_match_data(video->dev);
> >>> +
> >>> +     /* map register space */
> >>> +     video->iobase =3D devm_platform_ioremap_resource(pdev, 0);
> >>> +     if (IS_ERR(video->iobase))
> >>> +             return PTR_ERR(video->iobase);
> >>> +
> >>> +     video->iobase_irq =3D devm_platform_ioremap_resource(pdev, 1);
> >>> +     if (IS_ERR(video->iobase_irq))
> >>> +             return PTR_ERR(video->iobase_irq);
> >>> +
> >>> +     /* check hw version */
> >>> +     res =3D chv3_video_check_version(video);
> >>> +     if (res)
> >>> +             return res;
> >>> +
> >>> +     /* setup interrupts */
> >>> +     irq =3D platform_get_irq(pdev, 0);
> >>> +     if (irq < 0)
> >>> +             return -ENXIO;
> >>> +     res =3D devm_request_irq(&pdev->dev, irq, chv3_video_isr, 0, DE=
VICE_NAME, video);
> >>> +     if (res)
> >>> +             return res;
> >>> +
> >>> +     /* initialize v4l2_device */
> >>> +     res =3D v4l2_device_register(&pdev->dev, &video->v4l2_dev);
> >>> +     if (res)
> >>> +             return res;
> >>> +
> >>> +     /* initialize vb2 queue */
> >>> +     video->queue.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
> >>> +     video->queue.io_modes =3D VB2_MMAP | VB2_DMABUF;
> >>> +     video->queue.dev =3D &pdev->dev;
> >>> +     video->queue.lock =3D &video->video_lock;
> >>> +     video->queue.ops =3D &chv3_video_vb2_ops;
> >>> +     video->queue.mem_ops =3D &vb2_dma_contig_memops;
> >>> +     video->queue.drv_priv =3D video;
> >>> +     video->queue.buf_struct_size =3D sizeof(struct chv3_video_buffe=
r);
> >>> +     video->queue.timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTO=
NIC;
> >>> +     res =3D vb2_queue_init(&video->queue);
> >>> +     if (res)
> >>> +             goto error;
> >>> +
> >>> +     /* initialize video_device */
> >>> +     strscpy(video->vdev.name, DEVICE_NAME, sizeof(video->vdev.name)=
);
> >>> +     video->vdev.fops =3D &chv3_video_v4l2_fops;
> >>> +     video->vdev.ioctl_ops =3D &chv3_video_v4l2_ioctl_ops;
> >>> +     video->vdev.lock =3D &video->video_lock;
> >>> +     video->vdev.release =3D video_device_release_empty;
> >>> +     video->vdev.device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_S=
TREAMING;
> >>> +     video->vdev.v4l2_dev =3D &video->v4l2_dev;
> >>> +     video->vdev.queue =3D &video->queue;
> >>> +     video_set_drvdata(&video->vdev, video);
> >>> +
> >>> +     if (device_get_named_child_node(&pdev->dev, "port"))
> >>> +             res =3D chv3_video_fwnode_init(video);
> >>> +     else
> >>> +             res =3D chv3_video_fallback_init(video);
> >>> +     if (res)
> >>> +             goto error;
> >>> +
> >>> +     /* initialize rest of driver struct */
> >>> +     INIT_LIST_HEAD(&video->bufs);
> >>> +     spin_lock_init(&video->bufs_lock);
> >>> +     mutex_init(&video->video_lock);
> >>> +
> >>> +     chv3_video_init_timings_and_format(video, config);
> >>> +
> >>> +     /* initialize hw */
> >>> +     writel(VIDEO_RESET_BIT, video->iobase + VIDEO_RESET);
> >>> +     writel(VIDEO_DATARATE_DOUBLE, video->iobase + VIDEO_DATARATE);
> >>> +     writel(VIDEO_PIXELMODE_DOUBLE, video->iobase + VIDEO_PIXELMODE)=
;
> >>> +     writel(config->dmaformat, video->iobase + VIDEO_DMAFORMAT);
> >>> +
> >>> +     writel(VIDEO_IRQ_ALL, video->iobase_irq + VIDEO_IRQ_MASK);
> >>> +
> >>> +     return 0;
> >>> +
> >>> +error:
> >>> +     v4l2_device_unregister(&video->v4l2_dev);
> >>> +
> >>> +     return res;
> >>> +}
> >>> +
> >>> +static void chv3_video_remove(struct platform_device *pdev)
> >>> +{
> >>> +     struct chv3_video *video =3D platform_get_drvdata(pdev);
> >>> +
> >>> +     /* disable interrupts */
> >>> +     writel(0, video->iobase_irq + VIDEO_IRQ_MASK);
> >>> +
> >>> +     if (video->subdev) {
> >>> +             /* notifier is initialized only in non-fallback mode */
> >>> +             v4l2_async_nf_unregister(&video->notifier);
> >>> +             v4l2_async_nf_cleanup(&video->notifier);
> >>> +     } else {
> >>> +             /* ctrl handler is initialized only in fallback mode */
> >>> +             v4l2_ctrl_handler_free(&video->ctrl_handler);
> >>> +     }
> >>> +
> >>> +     v4l2_device_unregister(&video->v4l2_dev);
> >>> +}
> >>> +
> >>> +static const struct chv3_video_config chv3_video_it =3D {
> >>> +     .pixelformat =3D V4L2_PIX_FMT_BGRX32,
> >>> +     .bytes_per_pixel =3D 4,
> >>> +     .dmaformat =3D VIDEO_DMAFORMAT_8BPC_PAD,
> >>> +};
> >>> +
> >>> +static const struct chv3_video_config chv3_video_dp =3D {
> >>> +     .pixelformat =3D V4L2_PIX_FMT_RGB24,
> >>> +     .bytes_per_pixel =3D 3,
> >>> +     .dmaformat =3D VIDEO_DMAFORMAT_8BPC,
> >>> +};
> >>> +
> >>> +static const struct of_device_id chv3_video_match_table[] =3D {
> >>> +     { .compatible =3D "google,chv3-video-it-1.0", .data =3D &chv3_v=
ideo_it },
> >>> +     { .compatible =3D "google,chv3-video-dp-1.0", .data =3D &chv3_v=
ideo_dp },
> >>> +     { },
> >>> +};
> >>> +
> >>> +static struct platform_driver chv3_video_platform_driver =3D {
> >>> +     .probe =3D chv3_video_probe,
> >>> +     .remove_new =3D chv3_video_remove,
> >>> +     .driver =3D {
> >>> +             .name =3D DEVICE_NAME,
> >>> +             .of_match_table =3D chv3_video_match_table,
> >>> +     },
> >>> +};
> >>> +
> >>> +module_platform_driver(chv3_video_platform_driver);
> >>> +
> >>> +MODULE_AUTHOR("Pawe=C5=82 Anikiel <panikiel@google.com>");
> >>> +MODULE_DESCRIPTION("Google Chameleon v3 video interface driver");
> >>> +MODULE_LICENSE("GPL");
> >>
> >> Regards,
> >>
> >>         Hans
>
> Regards,
>
>         Hans

