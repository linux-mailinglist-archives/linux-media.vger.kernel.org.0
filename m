Return-Path: <linux-media+bounces-1306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A394D7FCDCA
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 05:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BFDC1C2104D
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 04:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C6B6ADC;
	Wed, 29 Nov 2023 04:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SPvxAzUi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA3C1AE
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 20:17:35 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54b0310f536so939308a12.0
        for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 20:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701231452; x=1701836252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZzuVjJtlnAafrGnIlhuyzTMjINdeQbe2IGSLVE2qCI=;
        b=SPvxAzUi+vT+NqZfuXZuGIacAeirhF28NP5E+7tCxJi1cWoPPNRLUnheGHmy2B/J7T
         wGnBdkSFIGIsTj5rYyqYSFG/K/iKKi2nWwSVhjL7UWX2Enhy6aU9BHrVS/6aOVm/8JpE
         LLlhmT3E7FrXUd5G01kWM7lf+SE9z5LmhpoF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701231452; x=1701836252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZzuVjJtlnAafrGnIlhuyzTMjINdeQbe2IGSLVE2qCI=;
        b=iUB8Q24e2m8jIF2NFMXqCgxMwM8leRWmCgGzPhyTNgVIbeJI8E1DZfUacVsf8g4b3E
         itEhmVFylvObLxjRJ8CCzvrEQHATphGwo7Qqo+FPoX7bPPqP7l8xi/A19VDGy03uXOUn
         XHr7DUn6jWBzhs48g0+e3XXxYTJon0lb/97TIWVVS/P6OXkzSgNVV+wxHiZeE9W2JVha
         COImT25eI9O/XlcL5MxJcFhOrC60Q53L06PTtY2sDwt/+01qoAmwRllPNAzRR5coMGcO
         P2pIuat8DMf9fz1XYO5r37LLB3b0QjpUOIlFgWd8MVq02mck6fL5VgWhsZgVQG4KmiQ1
         pl5w==
X-Gm-Message-State: AOJu0YyDbEQWs+pfQUCgF6PD8yoCCqp9plt3AyhXispfqMA2UtYlBSUA
	/MjEnYs9x2Ktx5CK28ujp1gcJAJepLOGEmnNqfq/yb8o
X-Google-Smtp-Source: AGHT+IGB+P6owAKiT8TAFRolqqm+MMgSO6X7xy219DTBVYmQWgsbPTtbeH3+xAW7XBq0lEz2ahcbng==
X-Received: by 2002:a50:fa8f:0:b0:54b:5a7:1435 with SMTP id w15-20020a50fa8f000000b0054b05a71435mr13572805edr.4.1701231452318;
        Tue, 28 Nov 2023 20:17:32 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id cw13-20020a056402228d00b0054b651ce8a1sm2943573edb.45.2023.11.28.20.17.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 20:17:31 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-332ddd8e0bdso261379f8f.0
        for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 20:17:31 -0800 (PST)
X-Received: by 2002:adf:f10d:0:b0:332:cae1:dd5 with SMTP id
 r13-20020adff10d000000b00332cae10dd5mr13790346wro.34.1701231450791; Tue, 28
 Nov 2023 20:17:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-8-benjamin.gaignard@collabora.com> <20231127170700.GC31314@pendragon.ideasonboard.com>
 <6fa1ec09-3e30-475e-9718-29d23586753e@collabora.com> <CAAFQd5DCVTLpPoKSp_OA6fe_Hqt-oV7=AsCZWSmkJORvLSgUiw@mail.gmail.com>
 <995eb6c2-cc7f-4217-bc37-4ab1a32f36ee@collabora.com>
In-Reply-To: <995eb6c2-cc7f-4217-bc37-4ab1a32f36ee@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 29 Nov 2023 13:17:09 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bv5kc9TfNM5CkKowvaoRndTmkmU6+0LyCG8YbOKy=hxQ@mail.gmail.com>
Message-ID: <CAAFQd5Bv5kc9TfNM5CkKowvaoRndTmkmU6+0LyCG8YbOKy=hxQ@mail.gmail.com>
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

On Tue, Nov 28, 2023 at 7:26=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 28/11/2023 =C3=A0 10:35, Tomasz Figa a =C3=A9crit :
> > On Tue, Nov 28, 2023 at 6:31=E2=80=AFPM Benjamin Gaignard
> > <benjamin.gaignard@collabora.com> wrote:
> >>
> >> Le 27/11/2023 =C3=A0 18:07, Laurent Pinchart a =C3=A9crit :
> >>> Hi Benjamin,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Mon, Nov 27, 2023 at 05:54:06PM +0100, Benjamin Gaignard wrote:
> >>>> 'min_buffers_needed' is suppose to be used to indicate the number
> >>>> of buffers needed by DMA engine to start streaming.
> >>>> imx8-isi driver doesn't use DMA engine and just want to specify
> >>> What do you mean, "doesn't use DMA engine" ? The ISI surely has DMA
> >>> engines :-)
> >> I have done assumption on drivers given if they use or dma_* functions=
.
> > I suspect the use of vb2_dma_sg_plane_desc() and
> > vb2_dma_contig_plane_dma_addr() may be more correlated to whether
> > there is a DMA involved or not. Usually V4L2 drivers don't really have
> > to deal with the DMA API explicitly, because the vb2 framework handles
> > most of the work.
>
> Unfortunately isn't not true either, for example verisilicon driver use
> these function but doesn't need DMA engine.

That sounds weird. Why would a driver that doesn't have a DMA engine
need to obtain a scatterlist or the DMA address of the buffer?

> I haven't found yet a 100% criteria to decide if driver use or not DMA en=
gine
> so I plan to fix case by case given maintainers remarks.

Yeah, there probably wouldn't be a way that would give one a 100%
certainty, although I'd still insist that the two functions I
mentioned should be close to that. Of course a driver can use those
functions for some queues, while other queues would be pure software
queues, e.g. for some metadata - a simple grep is not enough. Is that
perhaps the case for the verisilicon driver?

Best regards,
Tomasz

>
> Regards,
> Benjamin
>
> >
> > Best regards,
> > Tomasz
> >
> >> I have considers that all PCI drivers are using DMA engine and
> >> I don't know the design for each drivers so I hope to get this informa=
tion
> >> from maintainers and fix that in v2.
> >> If imx8-isi driver needs a minimum number of buffers before start stre=
aming
> >> I will do a v2 and use min_dma_buffers_needed instead.
> >>
> >> Regards,
> >> Benjamin
> >>
> >>>> the minimum number of buffers to allocate when calling VIDIOC_REQBUF=
S.
> >>>> That 'min_reqbufs_allocation' field purpose so use it.
> >>>>
> >>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >>>> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>>> CC: Shawn Guo <shawnguo@kernel.org>
> >>>> CC: Sascha Hauer <s.hauer@pengutronix.de>
> >>>> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> >>>> CC: Fabio Estevam <festevam@gmail.com>
> >>>> CC: NXP Linux Team <linux-imx@nxp.com>
> >>>> ---
> >>>>    drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/=
drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >>>> index 49bca2b01cc6..81673ff9084b 100644
> >>>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >>>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >>>> @@ -1453,7 +1453,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe=
 *pipe,
> >>>>       q->mem_ops =3D &vb2_dma_contig_memops;
> >>>>       q->buf_struct_size =3D sizeof(struct mxc_isi_buffer);
> >>>>       q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >>>> -    q->min_buffers_needed =3D 2;
> >>>> +    q->min_reqbufs_allocation =3D 2;
> >>>>       q->lock =3D &video->lock;
> >>>>       q->dev =3D pipe->isi->dev;
> >>>>

