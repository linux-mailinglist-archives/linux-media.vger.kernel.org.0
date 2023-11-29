Return-Path: <linux-media+bounces-1311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B77FD11A
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 09:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFE89282D59
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 08:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01C911CB9;
	Wed, 29 Nov 2023 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ndl7uYYZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8D7210C
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 00:39:49 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c9c30c7eafso427361fa.0
        for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 00:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701247187; x=1701851987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwR1qGVD5UuieDG2qJJImYrNn7TWBJoCLLLYl7IcSxI=;
        b=ndl7uYYZQrdH08eb6FhzYl/hsSmgKrIAiHpdOixuiFQirtLa3tM39+eEVpQM/TnnKj
         V3zRUHAC7ApmtTfYqfUQTi5DrAnX0hefYPC1JEb1vQATh3cE5sA013OQj1LNtC3GxND9
         cJF6iT+0sY2A2JfjgnjPGKT9KKtCiJPAoB1YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701247187; x=1701851987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwR1qGVD5UuieDG2qJJImYrNn7TWBJoCLLLYl7IcSxI=;
        b=bJUQQf5PDdCndflez1KrVIshRe8rpUwKIlsZ8RblZsuE9887ddQGUzVdIW9SUgiiyn
         Gj0t6lIelq0ld/iYobhkjPXIeWydjDP/WsEtpbJTaSfkkAPeK0CCbGJKVHLgHuUHjbf2
         TSRN4OvdGhezvpeT8vJpo7dmGR5bIyuGcm59y1OtuVdxQTOAka3gQGxWaRjLMsmKnszA
         NOVdxwEbt2zV1g8p+xw5qvN7QaTw6gTCPbxgRbZTK0AusbNT7YJvwA2bmj7QNB0E/iMN
         V8YGlAKfitURHJzA3yd2f8rykca1fCgnBl2jzEXmX1FVYbY3gHa175eb/8Ks7r/SRuWw
         N4ug==
X-Gm-Message-State: AOJu0Yzm/rUJGifgjh5XDCkhieuWrQQG1AjAXsh2izZ23udeCf2fxXGe
	HY9yGSHkbP/8KZVHrjt50UYGQZvpCxhUzwBJnttmWamA
X-Google-Smtp-Source: AGHT+IGHUzvPOuNkMRlWAR5IQc0iKPx+UOgsUFGv5UCN5DfwkACFWxdj/qvDlWKeGh3+yS15PyYMPA==
X-Received: by 2002:a05:6512:2246:b0:50b:c870:f455 with SMTP id i6-20020a056512224600b0050bc870f455mr39322lfu.1.1701247186603;
        Wed, 29 Nov 2023 00:39:46 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id n7-20020a170906378700b009b2cc87b8c3sm7625823ejc.52.2023.11.29.00.39.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 00:39:46 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3331974c2d2so168996f8f.2
        for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 00:39:46 -0800 (PST)
X-Received: by 2002:adf:f88c:0:b0:319:7c0f:d920 with SMTP id
 u12-20020adff88c000000b003197c0fd920mr11878172wrp.57.1701247185816; Wed, 29
 Nov 2023 00:39:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-8-benjamin.gaignard@collabora.com> <20231127170700.GC31314@pendragon.ideasonboard.com>
 <6fa1ec09-3e30-475e-9718-29d23586753e@collabora.com> <CAAFQd5DCVTLpPoKSp_OA6fe_Hqt-oV7=AsCZWSmkJORvLSgUiw@mail.gmail.com>
 <995eb6c2-cc7f-4217-bc37-4ab1a32f36ee@collabora.com> <CAAFQd5Bv5kc9TfNM5CkKowvaoRndTmkmU6+0LyCG8YbOKy=hxQ@mail.gmail.com>
 <b68b3fa5-a152-4b23-9451-61a89530512c@collabora.com>
In-Reply-To: <b68b3fa5-a152-4b23-9451-61a89530512c@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 29 Nov 2023 17:39:25 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DXhDtcfjgds6qu2YZXkkcvJdygkvtFknrHRGRC5oRHkA@mail.gmail.com>
Message-ID: <CAAFQd5DXhDtcfjgds6qu2YZXkkcvJdygkvtFknrHRGRC5oRHkA@mail.gmail.com>
Subject: Re: [PATCH 07/55] media: imx8-isi: Stop abusing of min_buffers_needed field
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hverkuil@xs4all.nl, 
	mchehab@kernel.org, m.szyprowski@samsung.com, matt.ranostay@konsulko.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, kernel@collabora.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 5:28=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 29/11/2023 =C3=A0 05:17, Tomasz Figa a =C3=A9crit :
> > On Tue, Nov 28, 2023 at 7:26=E2=80=AFPM Benjamin Gaignard
> > <benjamin.gaignard@collabora.com> wrote:
> >>
> >> Le 28/11/2023 =C3=A0 10:35, Tomasz Figa a =C3=A9crit :
> >>> On Tue, Nov 28, 2023 at 6:31=E2=80=AFPM Benjamin Gaignard
> >>> <benjamin.gaignard@collabora.com> wrote:
> >>>> Le 27/11/2023 =C3=A0 18:07, Laurent Pinchart a =C3=A9crit :
> >>>>> Hi Benjamin,
> >>>>>
> >>>>> Thank you for the patch.
> >>>>>
> >>>>> On Mon, Nov 27, 2023 at 05:54:06PM +0100, Benjamin Gaignard wrote:
> >>>>>> 'min_buffers_needed' is suppose to be used to indicate the number
> >>>>>> of buffers needed by DMA engine to start streaming.
> >>>>>> imx8-isi driver doesn't use DMA engine and just want to specify
> >>>>> What do you mean, "doesn't use DMA engine" ? The ISI surely has DMA
> >>>>> engines :-)
> >>>> I have done assumption on drivers given if they use or dma_* functio=
ns.
> >>> I suspect the use of vb2_dma_sg_plane_desc() and
> >>> vb2_dma_contig_plane_dma_addr() may be more correlated to whether
> >>> there is a DMA involved or not. Usually V4L2 drivers don't really hav=
e
> >>> to deal with the DMA API explicitly, because the vb2 framework handle=
s
> >>> most of the work.
> >> Unfortunately isn't not true either, for example verisilicon driver us=
e
> >> these function but doesn't need DMA engine.
> > That sounds weird. Why would a driver that doesn't have a DMA engine
> > need to obtain a scatterlist or the DMA address of the buffer?
>
> Just because the hardware needs the physical address of the buffer to acc=
ess it.
>

Right, and the part of the hardware that accesses the memory is called
a DMA engine.

> >
> >> I haven't found yet a 100% criteria to decide if driver use or not DMA=
 engine
> >> so I plan to fix case by case given maintainers remarks.
> > Yeah, there probably wouldn't be a way that would give one a 100%
> > certainty, although I'd still insist that the two functions I
> > mentioned should be close to that. Of course a driver can use those
> > functions for some queues, while other queues would be pure software
> > queues, e.g. for some metadata - a simple grep is not enough. Is that
> > perhaps the case for the verisilicon driver?
>
> Verisilicon hardware block doesn't have IOMMU so it needs the physical
> addresses of all the buffers it use (input buffer, reference frame buffer=
s, etc...).
> No DMA engine involved here it is just how the hardware is working.

I think we need to clarify what you mean by DMA engine. If it's
basically a standalone hardware block that does the DMA for another
hardware block, i.e. such as the standalone DMA engines under
drivers/dma, then I'd like to ask what the relation is between using
an external DMA engine and min_buffers_needed.

> Expect functions like dma_release_channel() or being in PCI directory,
> I don't have found any magical way to know if a driver needs a minimum nu=
mber of buffers before start streaming.
> I can only read the code and do assumptions for the other cases.
> I hope maintainers, like Laurent or you, will answer to this question for=
 each driver.
>

In theory that could work too, so hopefully we can achieve that. Some
drivers may not have very active maintainers... And other maintainers
who never worked with such drivers are as suited to read the code and
guess the expected state as you. That said, let's make sure that
everyone involved does their best, without pushing the task around.

Best regards,
Tomasz

> Regards,
> Benjamin
>
> >
> > Best regards,
> > Tomasz
> >
> >> Regards,
> >> Benjamin
> >>
> >>> Best regards,
> >>> Tomasz
> >>>
> >>>> I have considers that all PCI drivers are using DMA engine and
> >>>> I don't know the design for each drivers so I hope to get this infor=
mation
> >>>> from maintainers and fix that in v2.
> >>>> If imx8-isi driver needs a minimum number of buffers before start st=
reaming
> >>>> I will do a v2 and use min_dma_buffers_needed instead.
> >>>>
> >>>> Regards,
> >>>> Benjamin
> >>>>
> >>>>>> the minimum number of buffers to allocate when calling VIDIOC_REQB=
UFS.
> >>>>>> That 'min_reqbufs_allocation' field purpose so use it.
> >>>>>>
> >>>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >>>>>> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>>> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>>>>> CC: Shawn Guo <shawnguo@kernel.org>
> >>>>>> CC: Sascha Hauer <s.hauer@pengutronix.de>
> >>>>>> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> >>>>>> CC: Fabio Estevam <festevam@gmail.com>
> >>>>>> CC: NXP Linux Team <linux-imx@nxp.com>
> >>>>>> ---
> >>>>>>     drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
> >>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c =
b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >>>>>> index 49bca2b01cc6..81673ff9084b 100644
> >>>>>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >>>>>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >>>>>> @@ -1453,7 +1453,7 @@ int mxc_isi_video_register(struct mxc_isi_pi=
pe *pipe,
> >>>>>>        q->mem_ops =3D &vb2_dma_contig_memops;
> >>>>>>        q->buf_struct_size =3D sizeof(struct mxc_isi_buffer);
> >>>>>>        q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >>>>>> -    q->min_buffers_needed =3D 2;
> >>>>>> +    q->min_reqbufs_allocation =3D 2;
> >>>>>>        q->lock =3D &video->lock;
> >>>>>>        q->dev =3D pipe->isi->dev;
> >>>>>>

