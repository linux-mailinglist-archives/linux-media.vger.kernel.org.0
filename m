Return-Path: <linux-media+bounces-1194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DAD7FB5F7
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F5211C2106D
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 09:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8413949F89;
	Tue, 28 Nov 2023 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KDh3+BdH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90214DA
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 01:36:13 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a00b056ca38so696085666b.2
        for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 01:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701164172; x=1701768972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gn4UB1lK5iWfBPlsVj0cmidPsZvNY1ecgwO2dUiuTUo=;
        b=KDh3+BdHyKsVGepfyaAiW45JL3m3G+bitGeBQTFkjxh00xRKuBZDsqWvymSNQ/8hQQ
         yV56ZuoQo/hW3ltN4Fnu/bibHDM6XTj8IgJ8F8Ge0xcu8rNd5+3GIRYgVfQU7Hcc1Xp4
         FdCWp351Egv2hYaCOnvadSjqWjTfGvspI6Gcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701164172; x=1701768972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gn4UB1lK5iWfBPlsVj0cmidPsZvNY1ecgwO2dUiuTUo=;
        b=UeNHHrw5oTMWrHqi3UAoTGaMV8MB71/1FH34GoJH6XnC1gBlBfdpFnYErqGNmVdcBE
         Pq2UEVHd6n8cPIB6xaozjexygkZuo05cNYkHrEvR1jVm7lY7ddyMfYZiHB2P3CWKoETw
         UwwYi2JXsTz2BcIJEzH67mCoLs2WnK0EX8fs7thx337Iwd1Fzz2Xcxv9oZMGZOD5iSUk
         UQ1z4X2MlRUH9VNZoEY/npn7s7EGY3tc39nCnuaunqDpt6HedKdb7u062BDOOlfCLY5t
         93EbXSLunaNTRJebyLDGoBD92ooGcYSeqRLqPelj85BQ+uC6yCfr+3kDUpwub7JqwC3O
         00kg==
X-Gm-Message-State: AOJu0YyhL4veL9jaXnrZvlwV3Yce9mNMYX8HfEBYREmtf4m9YeSF+xqX
	wjsREy+lLiFrVoUQLgsS4zxkxUDWLmzMXx/fBOQOAtbG
X-Google-Smtp-Source: AGHT+IH1wCoyB75kegT9SJ9N0lNcj7tPd0/WX+wtkB/Wmkf0hUePpukezZNQohWSEhgjHPr/B8H85w==
X-Received: by 2002:a17:906:298c:b0:a11:b67f:e3a3 with SMTP id x12-20020a170906298c00b00a11b67fe3a3mr2648442eje.8.1701164171668;
        Tue, 28 Nov 2023 01:36:11 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id h18-20020a1709063b5200b009fdd2c6d042sm6750051ejf.148.2023.11.28.01.36.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:36:11 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-332d5c852a0so3271908f8f.3
        for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 01:36:11 -0800 (PST)
X-Received: by 2002:adf:fcc8:0:b0:32d:a495:a9b7 with SMTP id
 f8-20020adffcc8000000b0032da495a9b7mr9105847wrs.61.1701164171112; Tue, 28 Nov
 2023 01:36:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-8-benjamin.gaignard@collabora.com> <20231127170700.GC31314@pendragon.ideasonboard.com>
 <6fa1ec09-3e30-475e-9718-29d23586753e@collabora.com>
In-Reply-To: <6fa1ec09-3e30-475e-9718-29d23586753e@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 28 Nov 2023 18:35:51 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DCVTLpPoKSp_OA6fe_Hqt-oV7=AsCZWSmkJORvLSgUiw@mail.gmail.com>
Message-ID: <CAAFQd5DCVTLpPoKSp_OA6fe_Hqt-oV7=AsCZWSmkJORvLSgUiw@mail.gmail.com>
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

On Tue, Nov 28, 2023 at 6:31=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 27/11/2023 =C3=A0 18:07, Laurent Pinchart a =C3=A9crit :
> > Hi Benjamin,
> >
> > Thank you for the patch.
> >
> > On Mon, Nov 27, 2023 at 05:54:06PM +0100, Benjamin Gaignard wrote:
> >> 'min_buffers_needed' is suppose to be used to indicate the number
> >> of buffers needed by DMA engine to start streaming.
> >> imx8-isi driver doesn't use DMA engine and just want to specify
> > What do you mean, "doesn't use DMA engine" ? The ISI surely has DMA
> > engines :-)
>
> I have done assumption on drivers given if they use or dma_* functions.

I suspect the use of vb2_dma_sg_plane_desc() and
vb2_dma_contig_plane_dma_addr() may be more correlated to whether
there is a DMA involved or not. Usually V4L2 drivers don't really have
to deal with the DMA API explicitly, because the vb2 framework handles
most of the work.

Best regards,
Tomasz

> I have considers that all PCI drivers are using DMA engine and
> I don't know the design for each drivers so I hope to get this informatio=
n
> from maintainers and fix that in v2.
> If imx8-isi driver needs a minimum number of buffers before start streami=
ng
> I will do a v2 and use min_dma_buffers_needed instead.
>
> Regards,
> Benjamin
>
> >
> >> the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
> >> That 'min_reqbufs_allocation' field purpose so use it.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> CC: Shawn Guo <shawnguo@kernel.org>
> >> CC: Sascha Hauer <s.hauer@pengutronix.de>
> >> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> >> CC: Fabio Estevam <festevam@gmail.com>
> >> CC: NXP Linux Team <linux-imx@nxp.com>
> >> ---
> >>   drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >> index 49bca2b01cc6..81673ff9084b 100644
> >> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> >> @@ -1453,7 +1453,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *=
pipe,
> >>      q->mem_ops =3D &vb2_dma_contig_memops;
> >>      q->buf_struct_size =3D sizeof(struct mxc_isi_buffer);
> >>      q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >> -    q->min_buffers_needed =3D 2;
> >> +    q->min_reqbufs_allocation =3D 2;
> >>      q->lock =3D &video->lock;
> >>      q->dev =3D pipe->isi->dev;
> >>

