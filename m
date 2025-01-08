Return-Path: <linux-media+bounces-24469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3247BA06551
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 20:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB89A1888EBE
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 19:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEF4200BB2;
	Wed,  8 Jan 2025 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="v/9yAl2o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39584202C4A
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 19:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736364436; cv=none; b=Yg5aLhATfIQOV6NSIGMG2cLdbJhJerJkRkewx/dQYsreZpE5lfjuvfR2ng4zB6nwlYIcxVobJRF8Xhj7Yv0gEjWHA2jayzbSW6QjqEe/af4gODknLrF0RZKVlcxa5aFSmcer4iMcmT0sjEi9OhnOgkft8dth+y/rF/U/5DTOVsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736364436; c=relaxed/simple;
	bh=84ZmJSv1caD6D/jt4wyJpInJAtrq6IZcfS64omIrHHc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pUO/D14H1u+i84QPVDW7trPgIssDIrxx4jcoBtdv9RLoYYZ1VroQkKnFREjCmDmaVtgr6HPctv2ScCe6C/6K+cnujypFuymbhaYd9e06D4dFSz6PdUq+otqd41Kj59ECKMh1ZKlmmdkeiDGxzoMGB1bEMzxvZlpcIYJmbxjejd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=v/9yAl2o; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4679eacf2c5so796431cf.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 11:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736364434; x=1736969234; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SrTGXGCBiyGP6a+D4EJggND3etK0dx/lyg/0RMVHQ5Q=;
        b=v/9yAl2oombnd551mSTOIzItAOdWThGD8WTk2ajoWSEdi5O3+dFj12jJSMJp/gZ3k3
         QWqkWSmp6D4yz8z5T9lTN401yCEzK2ajMCBJbuVIFyiU5Es4TG9KZOzMv3Q8nmphEf82
         ItC0tooDoigoXz7a68RCOEX2bQyc789OFKfyTUfK4RJtRu6ffmh8axqBxmf7UIFG5G7t
         bQ+WgIyTomTjPY91djkYVq5ckFSi3hOViuC5woM0mHuAiKrBbEW/Y9Jg9pIJfgG6/AN0
         P0tqGY9HqAaB62wHcv0EPHy86XyqukqLxSQkrvmUfHLhmjFTOZCxzqIZGZWDMdHgGTnA
         OlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736364434; x=1736969234;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SrTGXGCBiyGP6a+D4EJggND3etK0dx/lyg/0RMVHQ5Q=;
        b=RVpfZh/kcXYf5aDx12mdX5tTiw5sp9y1yaum1FAxrB1DwaAs3YEyesH9Fg4UjyqUE3
         /x3Ts3TDOvfO3BrwXAZo73lqzzuEWY+epkpoFULgS9Q532EA6Lh3fEQmJPDaSSEsIcTF
         XZgnSA1Ev1Jgwv0zw7bdhN55HcywfobI6XqRof1wGrH20n0Ck9zz6X4dHVvQhZRHgR1u
         vXoOEqsPKBaQb+ITm6Q8gaBxrdTQKku5Ubt2tfB46dzEztXNqswm4qz5Rqfb07p38yfm
         2jv0srwUtzd5CCENeaJNywWk8HBlcRqXy+kH7+8MivMyahXNx+z1D+fdDyCAVmCBAFuv
         gsgw==
X-Forwarded-Encrypted: i=1; AJvYcCVn51IJuJbyUE/r3C0SltRsnT8yEFIxsvWxODXVg17SkpWWz7QA/Iu54is3YAy6gdLhvOfZt/V01QXZUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzftsF3679QWfv2ognnwT699LmqTMgEC8rDcwUCf9CfBh3LdBD
	f55Qk1gbnSanjFNl1pSW90i0MOVm1SETwJuz5BJMvGaQizMU0cdGhStXNwo3dNc=
X-Gm-Gg: ASbGncvO6eMJWxq9e2RY30vzCvx/ix/IpmbEbNG8EMdpqYWgf1z3O132GQTJ6ZgJohL
	3UH1A/5VhWv6kI68FsV9xXn9azGQ0iHD/RCZHn/UffyBiz0K5WFxLCs6hPiUQjvOAo8DhmDrpiV
	gSg1Z8RJ6ERkGtA2XCmGp5ys13T+HgR+NMnRfcYNbLa413uo/viKou1e5Utn+DifReotI2o73oj
	pv86du7cACBAKHSsHo1x15AWT+JwzHMNN16lTRJOMP5ZiRPQL/Sjavn7Q==
X-Google-Smtp-Source: AGHT+IEVsh5b+f9rl+imumXRYarnxs0UAANtEbjwwx8u4RslGUqLSeYw1okTg4zAdTKMfolaIUZn7Q==
X-Received: by 2002:ac8:5a48:0:b0:467:5712:a69a with SMTP id d75a77b69052e-46c7102fcb6mr57216581cf.29.1736364434132;
        Wed, 08 Jan 2025 11:27:14 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6a61cfsm199597601cf.44.2025.01.08.11.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:27:13 -0800 (PST)
Message-ID: <052597884ce9e32bd68203081f8b28a957eb5255.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: amphion: Support display delay for Hevc
 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Wed, 08 Jan 2025 14:27:12 -0500
In-Reply-To: <6fcdd612-0f1e-42bd-b171-6f1d70790ffd@oss.nxp.com>
References: <20241219015146.706482-1-ming.qian@oss.nxp.com>
	 <86d9eb915432c6b070f7c7f524973e9a363de76e.camel@ndufresne.ca>
	 <6fcdd612-0f1e-42bd-b171-6f1d70790ffd@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 07 janvier 2025 =C3=A0 09:29 +0800, Ming Qian(OSS) a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
>=20
> On 2025/1/7 6:16, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > nit: use capital HEVC in the subject
> >=20
>=20
> I'll fix it in the v2 patch
>=20
> > Le jeudi 19 d=C3=A9cembre 2024 =C3=A0 10:51 +0900, Ming Qian a =C3=A9cr=
it :
> > > The amphion decoder firmware v1.9.0 supports display delay 0 for
> > > hevc format, then driver can enable this feature.
> >=20
> > nit: HEVC
> >=20
> > I think this added "feature" hides a bug you haven't fixed in this patc=
h.
> >=20
> >=20
> >          v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
> >                            V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE=
,
> >                            0, 1, 1, 0);
> >=20
> > With the control registered this way, 0 is the default, and the range o=
f 0-1.
> > But from your commit message, this is only supported from firmware 1.9.=
0 and up.
> > I think the patch should basically adjust the min and def values accord=
ing to
> > the detected firmware version.
> >=20
> > This might actually be more complex, aka per CODEC, and for that you ma=
y want to
> > use v4l2_ctrl_config structure.
> >=20
> > Nicolas
> >=20
>=20
> Thanks for the tip.
> By the way, how to define different ctrl values for each CODEC format?
> Is it reasonable to new a ctrl after set capture format?
> Or can we change the min/max value after set capture format?

Very good question, I clearly didn't think through my reply. Seems fine to =
leave
it that way. Per-codec, would mean having multiple CID, which is not your f=
ault
it has been combined.

Nicolas

>=20
> Thanks,
> Ming
>=20
> >=20
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > >   drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++---
> > >   1 file changed, 11 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/me=
dia/platform/amphion/vpu_malone.c
> > > index 5c6b2a841b6f..8f4aa48b2d65 100644
> > > --- a/drivers/media/platform/amphion/vpu_malone.c
> > > +++ b/drivers/media/platform/amphion/vpu_malone.c
> > > @@ -332,6 +332,8 @@ struct vpu_dec_ctrl {
> > >   	u32 buf_addr[VID_API_NUM_STREAMS];
> > >   };
> > >  =20
> > > +static const struct malone_padding_scode *get_padding_scode(u32 type=
, u32 fmt);
> > > +
> > >   u32 vpu_malone_get_data_size(void)
> > >   {
> > >   	return sizeof(struct vpu_dec_ctrl);
> > > @@ -654,8 +656,10 @@ static int vpu_malone_set_params(struct vpu_shar=
ed_addr *shared,
> > >   		hc->jpg[instance].jpg_mjpeg_interlaced =3D 0;
> > >   	}
> > >  =20
> > > -	hc->codec_param[instance].disp_imm =3D params->display_delay_enable=
 ? 1 : 0;
> > > -	if (malone_format !=3D MALONE_FMT_AVC)
> > > +	if (params->display_delay_enable &&
> > > +	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format)=
)
> > > +		hc->codec_param[instance].disp_imm =3D 1;
> > > +	else
> > >   		hc->codec_param[instance].disp_imm =3D 0;
> > >   	hc->codec_param[instance].dbglog_enable =3D 0;
> > >   	iface->dbglog_desc.level =3D 0;
> > > @@ -1024,6 +1028,7 @@ static const struct malone_padding_scode paddin=
g_scodes[] =3D {
> > >   	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
> > >   	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x=
0}},
> > >   	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x=
0}},
> > > +	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x2=
0}},
> > >   };
> > >  =20
> > >   static const struct malone_padding_scode padding_scode_dft =3D {0x0=
, 0x0};
> > > @@ -1058,8 +1063,11 @@ static int vpu_malone_add_padding_scode(struct=
 vpu_buffer *stream_buffer,
> > >   	int ret;
> > >  =20
> > >   	ps =3D get_padding_scode(scode_type, pixelformat);
> > > -	if (!ps)
> > > +	if (!ps) {
> > > +		if (scode_type =3D=3D SCODE_PADDING_BUFFLUSH)
> > > +			return 0;
> > >   		return -EINVAL;
> > > +	}
> > >  =20
> > >   	wptr =3D readl(&str_buf->wptr);
> > >   	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + str=
eam_buffer->length)
> >=20


