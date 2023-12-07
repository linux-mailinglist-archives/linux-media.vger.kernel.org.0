Return-Path: <linux-media+bounces-1900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 316CA808FF4
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 19:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 937A8B20E22
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 18:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2AC4E61E;
	Thu,  7 Dec 2023 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="AJyY+Uur"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E091711
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 10:33:41 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4259a275fa9so1668211cf.2
        for <linux-media@vger.kernel.org>; Thu, 07 Dec 2023 10:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1701974020; x=1702578820; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GZWhK495VLeN7TNOf6swobaME2YnrmvMGk89MvaYBHI=;
        b=AJyY+UurD2VyzWSnIyramL1wrfCzPSmNBHI+QAzXXvOPvucYNpbhreZo8Irf6rWwW7
         /mAIhUo6ZJ/G6Dk5OwiTEzXtEJ4ZjzORjilsErCoJ88VsZbj/pX0Fs1/i5QjQfDkKvbq
         CdWxWXOZ/BNoLK9K5uez7XJLVSg1ea3Mc7WfmHCJjypfE3xsTQlBFDEcfJmIEu1iSOqM
         ShZQPG9+5iHzFqnF5bcZZPTQEXZNBzrAxdth7yqvyKE1NMJsShR1zCsdreeGbl82TIAj
         BAIAqbHdAVFQKSxmCleOhhHPl1qWYZymd5cHXo/k8nlxIQTViGczkxX+peucwFG+Ew3R
         jugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701974020; x=1702578820;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZWhK495VLeN7TNOf6swobaME2YnrmvMGk89MvaYBHI=;
        b=Lz6FqoXt8JjbqPC0pbopzYEbQ+chDDUflUd1FCHrapamBxTu2l8aTmrbgiuHnYEmOW
         7x2QuMR7VnoSc7uhqfKqTJMNP1gGsPleO7FbCkRyqEJ6hBb1vwliVP1orofjesFPYa6X
         5Gh1D6C3UNDjS8AoQd5UIANnvgne2UacK6IEfxzMaUl8+askQoqqHfNOQbtcHkA35XIB
         /UOiUcdPttT9PTQb5o5ijSrSDJ6EFdHKO5FmjLk0EcvMJCXjkdDSU7shSaHnc1NecItn
         I0cffrin644gHb53Bql0+oOWE5VfRGvHM3voLaeKKKmS9Usjd6PvVb09P85P5FIkwhDR
         WBHw==
X-Gm-Message-State: AOJu0YxvXtfjWbf1ogWsjrsrjz8j3NPbk80JTu9CIsULZvNhx2vpsLbP
	5I13v4ED/KAOxuci6iV/HTISk3ruTHKdcDQxy53lAg==
X-Google-Smtp-Source: AGHT+IF44G4vo91Pehf9E6Xdpq+8M9mRAYJujL+Kh9cNIlF92TI6vHzDWOvzVRMCx1+2PXWbmtxP1Q==
X-Received: by 2002:ac8:570b:0:b0:425:4043:41c7 with SMTP id 11-20020ac8570b000000b00425404341c7mr3133948qtw.115.1701974020565;
        Thu, 07 Dec 2023 10:33:40 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:b5c::7a9])
        by smtp.gmail.com with ESMTPSA id j15-20020ac8664f000000b004255e0e5962sm131926qtp.50.2023.12.07.10.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 10:33:40 -0800 (PST)
Message-ID: <3ab3f9ea25d222c0b27e1b76f80c1abe76d27def.camel@ndufresne.ca>
Subject: Re: [PATCH 07/55] media: imx8-isi: Stop abusing of
 min_buffers_needed field
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomasz Figa
	 <tfiga@chromium.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, hverkuil@xs4all.nl,
  mchehab@kernel.org, m.szyprowski@samsung.com, matt.ranostay@konsulko.com, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, kernel@collabora.com, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>
Date: Thu, 07 Dec 2023 13:33:38 -0500
In-Reply-To: <20231128103117.GF31314@pendragon.ideasonboard.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
	 <20231127165454.166373-8-benjamin.gaignard@collabora.com>
	 <20231127170700.GC31314@pendragon.ideasonboard.com>
	 <6fa1ec09-3e30-475e-9718-29d23586753e@collabora.com>
	 <CAAFQd5DCVTLpPoKSp_OA6fe_Hqt-oV7=AsCZWSmkJORvLSgUiw@mail.gmail.com>
	 <20231128103117.GF31314@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 28 novembre 2023 =C3=A0 12:31 +0200, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> On Tue, Nov 28, 2023 at 06:35:51PM +0900, Tomasz Figa wrote:
> > On Tue, Nov 28, 2023 at 6:31=E2=80=AFPM Benjamin Gaignard wrote:
> > > Le 27/11/2023 =C3=A0 18:07, Laurent Pinchart a =C3=A9crit :
> > > > Hi Benjamin,
> > > >=20
> > > > Thank you for the patch.
> > > >=20
> > > > On Mon, Nov 27, 2023 at 05:54:06PM +0100, Benjamin Gaignard wrote:
> > > > > 'min_buffers_needed' is suppose to be used to indicate the number
> > > > > of buffers needed by DMA engine to start streaming.
> > > > > imx8-isi driver doesn't use DMA engine and just want to specify
> > > > What do you mean, "doesn't use DMA engine" ? The ISI surely has DMA
> > > > engines :-)
> > >=20
> > > I have done assumption on drivers given if they use or dma_* function=
s.
> >=20
> > I suspect the use of vb2_dma_sg_plane_desc() and
> > vb2_dma_contig_plane_dma_addr() may be more correlated to whether
> > there is a DMA involved or not. Usually V4L2 drivers don't really have
> > to deal with the DMA API explicitly, because the vb2 framework handles
> > most of the work.
>=20
> And this is anyway not related to DMA at all, but to the logic each
> driver implements when it deals with buffers. There's a lower chance a
> USB driver driver will have a hard requirement for more than one buffer
> compared to an AMBA/platform/PCI device driver, but at the end of the
> day, each driver needs to be analyzed individually to check what they
> require. Benjamin, I think you'll have some more homework to do :-)

Personally, I disagree that we should blindly patch drivers and actually ch=
ange
the framework behaviour. A patch that simply take what we have, and make it=
 so a
human reader now understand what is going on should be acceptable. Maintain=
ers
or developer that have access to the hardware should be making this judgmen=
t now
that the current behaviour is visible, modify and test it.

Asking to eye review drivers and change their behaviour without any test be=
ing
conducted will certainly cause regressions. I don't believe this is the rig=
ht
approach. Refactoring the code, making an effort to not change the behaviou=
r
during refactoring does make more sense to me.

regards,
Nicolas

>=20
> > > I have considers that all PCI drivers are using DMA engine and
> > > I don't know the design for each drivers so I hope to get this inform=
ation
> > > from maintainers and fix that in v2.
> > > If imx8-isi driver needs a minimum number of buffers before start str=
eaming
> > > I will do a v2 and use min_dma_buffers_needed instead.
> > >=20
> > > > > the minimum number of buffers to allocate when calling VIDIOC_REQ=
BUFS.
> > > > > That 'min_reqbufs_allocation' field purpose so use it.
> > > > >=20
> > > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com=
>
> > > > > CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > > > CC: Shawn Guo <shawnguo@kernel.org>
> > > > > CC: Sascha Hauer <s.hauer@pengutronix.de>
> > > > > CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > > CC: Fabio Estevam <festevam@gmail.com>
> > > > > CC: NXP Linux Team <linux-imx@nxp.com>
> > > > > ---
> > > > >   drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c=
 b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > > index 49bca2b01cc6..81673ff9084b 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > > @@ -1453,7 +1453,7 @@ int mxc_isi_video_register(struct mxc_isi_p=
ipe *pipe,
> > > > >      q->mem_ops =3D &vb2_dma_contig_memops;
> > > > >      q->buf_struct_size =3D sizeof(struct mxc_isi_buffer);
> > > > >      q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > > > > -    q->min_buffers_needed =3D 2;
> > > > > +    q->min_reqbufs_allocation =3D 2;
> > > > >      q->lock =3D &video->lock;
> > > > >      q->dev =3D pipe->isi->dev;
> > > > >=20
>=20


