Return-Path: <linux-media+bounces-11450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D28C5BFD
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 21:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92D931C21D4F
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 19:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38F818132A;
	Tue, 14 May 2024 19:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="dmf7h2mk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83127181318
	for <linux-media@vger.kernel.org>; Tue, 14 May 2024 19:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715716752; cv=none; b=B3WRb6kfGW8/dPxi3FjjK0n+qb7oprhcqbzmagAKnJyE3U1FrePpuehi7orru/cJnOZ6f2EMvn3TCBtCuvvJ8oJ3vpeNw93rZQmyoxbmGvB6zMyKU+KGqb+k9+n/wIQOKaDI6AbpegZlZatoQjhzhIG/ZpWPpuGF2QQ8SbuZb0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715716752; c=relaxed/simple;
	bh=FfBq4QqQrtwuN3KM/MzvHW/lDpe+7StAMESrxCSJ2tE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uAsi0PQhI0O2zO2ZbtR6hxDgSDEDvjVF2zXtDMhjFDBVjG14eAXJyZdUBrtgv/xANYEBmOb2dT2TUolAqSRO+uQ5oFx3F0yKvDxRzEfyo3A+ARzMo9nxKSWwPwB2svxMVmh+bINZ98AVIbPHhisgj2oMVyG7b71GlL4FTjYZ7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=dmf7h2mk; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-47efc592d9fso1761042137.0
        for <linux-media@vger.kernel.org>; Tue, 14 May 2024 12:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1715716749; x=1716321549; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/xZ0WCMxWXf6SCbKz4ExR4IGiDhvg8ahEfUt+oFqQ+U=;
        b=dmf7h2mkxz1kls4SmXQBin/9b5uMFiIFFc9g0mxgMRlbUA+oZQ9BfNhyxKRDXL0N0V
         BpINKANCgANufRBdY8JOhXcHjnpvy2CG2ZWLumK4DQnWTFF+L0EXXVVTl4ftXmUmF/ac
         yziiP37YeEGsCqvoLJZSAMlxtQJnHTtRK8/1kQjnLGl9I8rBufGlWT5AFUaj/an/giid
         T7gznCbGyWU+6llel3zYAjJuiuWob1MdKHZLEYpfmufmmvUvl9r3i8r310XaWt0GNkgp
         KzCC53J6aciHHdYR96vwuFSNm8gChYlerAz0I8zvV+dz3T3j4+0ci3HSCgwjR8ERGoKH
         +t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715716749; x=1716321549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/xZ0WCMxWXf6SCbKz4ExR4IGiDhvg8ahEfUt+oFqQ+U=;
        b=ejmxfLcYqtjkrSamCelq+WKvPIMCUinPKH/dDTPtN8jus9kIDnk1XPJAOhboUOTTK+
         M/GPwZkO6ReqaffelTosuokXtzvQUAB20qF4/nZPLw2BzPXRpb/JL2Za9Oln7YfWo4nf
         M/xBB6EqCQ9rDoh45+TAPsXWKj9xMMvffhvb1hxhSf+VnKppnmYfEVUd1bUxP8gkBKj0
         TKLIeXSL9i6WREG/1OoTYxMp1VnRU5FRe+nm2IwGse+/0m16wsMfJTutQQjFlqGYVWrk
         wMzpUI83gXNEQ2JzL+6+Bq468U4lKgQ+irpihP1JZ+8dYlKfJvdG+Fk80ltYinwT6WGN
         4j+A==
X-Gm-Message-State: AOJu0Yz8HcDH6PYwPKnNSXBzp8CLGLLDhnezRSmE9+veGyk3sqSEC6FH
	3emvwSVz8ti42f6WO9ce21JlgtB2guH7i8MvxFN+VbvAB8jA6s+My1cMo42JzEE=
X-Google-Smtp-Source: AGHT+IG+IWhlEvoUTCqaHfj6q+ZQ4VlFYRPUioIxvLtt1oL0T/VaVy8uDa8faCwoKCS9gujmxh3OyQ==
X-Received: by 2002:a05:6102:dd3:b0:47e:f679:51e2 with SMTP id ada2fe7eead31-48077dcae4cmr14690722137.10.1715716749407;
        Tue, 14 May 2024 12:59:09 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6448::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1d9161sm56391496d6.120.2024.05.14.12.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 12:59:08 -0700 (PDT)
Message-ID: <0cc8518fc56ef8e8ca31b170314603a6ced04ee7.camel@ndufresne.ca>
Subject: Re: [PATCH v3 4/4] media: chips-media: wave5: Support YUV422 raw
 pixel-formats on the encoder.
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, Nas Chung
	 <nas.chung@chipsnmedia.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "sebastian.fricke@collabora.com"
	 <sebastian.fricke@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,  "lafley.kim"
 <lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>, 
 "jackson.lee@chipnsmedia.com" <jackson.lee@chipnsmedia.com>
Date: Tue, 14 May 2024 15:59:07 -0400
In-Reply-To: <SE1P216MB1303BCEBEEFD39066A031C31ED182@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240430013900.187-1-nas.chung@chipsnmedia.com>
	 <20240430013900.187-5-nas.chung@chipsnmedia.com>
	 <131cf8a5ac97ac800e19205c5d2b5359ac266de3.camel@ndufresne.ca>
	 <SE1P216MB1303BCEBEEFD39066A031C31ED182@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

sorry for the delay

Le jeudi 02 mai 2024 =C3=A0 04:55 +0000, jackson.lee a =C3=A9crit=C2=A0:
> Hi Nicolas
>=20
> > -----Original Message-----
> > From: Nicolas Dufresne <nicolas@ndufresne.ca>
> > Sent: Thursday, May 2, 2024 4:46 AM
> > To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
> > sebastian.fricke@collabora.com
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> > hverkuil@xs4all.nl; lafley.kim <lafley.kim@chipsnmedia.com>; b-brnich@t=
i.com;
> > jackson.lee@chipnsmedia.com; jackson.lee <jackson.lee@chipsnmedia.com>
> > Subject: Re: [PATCH v3 4/4] media: chips-media: wave5: Support YUV422 r=
aw
> > pixel-formats on the encoder.
> >=20
> > Hi Nas,
> >=20
> > Le mardi 30 avril 2024 =C3=A0 10:39 +0900, Nas Chung a =C3=A9crit=C2=A0=
:
> > > From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
> > >=20
> > > Add support for the YUV422P, NV16, NV61, YUV422M, NV16M, NV61M raw pi=
xel-
> > formats to the Wave5 encoder.
> > > All these formats have a chroma subsampling ratio of 4:2:2 and theref=
ore
> > require a new image size calculation as the driver previously only hand=
led a
> > ratio of 4:2:0.
> >=20
> > Same here, run check-patch, before sending your next version, it should=
 tell
> > you that this message is not indented properly.
> >=20
> > >=20
> > > Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> > > Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> > > ---
> > >  .../chips-media/wave5/wave5-vpu-enc.c         | 59 +++++++++++++++++=
--
> > >  1 file changed, 54 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > index 75d230df45f6..0d6bec4e28d1 100644
> > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > @@ -66,6 +66,24 @@ static const struct vpu_format
> > enc_fmt_list[FMT_TYPES][MAX_FMTS] =3D {
> > >  			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21M,
> > >  			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
> > >  		},
> > > +		{
> > > +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV422P,
> > > +		},
> > > +		{
> > > +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV16,
> > > +		},
> > > +		{
> > > +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV61,
> > > +		},
> > > +		{
> > > +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV422M,
> > > +		},
> > > +		{
> > > +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV16M,
> > > +		},
> > > +		{
> > > +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV61M,
> > > +		},
> > >  	}
> > >  };
> > >=20
> > > @@ -109,13 +127,30 @@ static int start_encode(struct vpu_instance *in=
st,
> > u32 *fail_res)
> > >  	struct vb2_v4l2_buffer *dst_buf;
> > >  	struct frame_buffer frame_buf;
> > >  	struct enc_param pic_param;
> > > -	u32 stride =3D ALIGN(inst->dst_fmt.width, 32);
> > > -	u32 luma_size =3D (stride * inst->dst_fmt.height);
> > > -	u32 chroma_size =3D ((stride / 2) * (inst->dst_fmt.height / 2));
> > > +	u32 stride =3D inst->src_fmt.plane_fmt[0].bytesperline;
> > > +	u32 luma_size =3D (stride * inst->src_fmt.height);
> > > +	u32 chroma_size =3D 0;
> > >=20
> > >  	memset(&pic_param, 0, sizeof(struct enc_param));
> > >  	memset(&frame_buf, 0, sizeof(struct frame_buffer));
> > >=20
> > > +	if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV420 ||
> > > +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV420M)
> > > +		chroma_size =3D luma_size / 4;
> > > +	else if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
> > > +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21 ||
> > > +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12M ||
> > > +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21M)
> > > +		chroma_size =3D luma_size / 2;
> > > +	else if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV422P ||
> > > +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV422M)
> > > +		chroma_size =3D luma_size / 2;
> > > +	else if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16 ||
> > > +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61 ||
> > > +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16M ||
> > > +		 inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61M)
> > > +		chroma_size =3D luma_size;
> > > +
> >=20
> > I'm still unhappy to see all the supported format having to be listed a=
gain
> > here, this is error prone and a maintenance burden. In general, what I =
would
> > do is (and this is simplified to the subset of format we support):
> >=20
> > // might want to bug on that the info->pixel_encoding =3D=3D V4L2_PIXEL=
_ENC_YUV
> > // if you believe some RGB or bayer formats could be added in the futur=
e and
> > // want the devs to notice. I've ignored fractional bytes-per-pixel val=
ues as
> > // we don't use that, but another bugon if there is a chance the firmwa=
re //
> > will=C2=A0support more complex packing.
> >=20
> > info =3D v4l2_format_info(inst->src_fmt.pixelformat);
> > if (info->mem_planes =3D=3D 1) {
> > 	luma_size =3D stride * inst->dst_fmt.height;
> > 	chroma_size =3D luma_size * info->bpp[1] / (info->hdiv * info->vdiv) }
> > else {
> > 	luma_size =3D inst->src_fmt.plane_fmt[0].sizeimage;
> > 	chroma_size =3D inst->src_fmt.plane_fmt[1].sizeimage;
> > }
> >=20
> > Or something similar that works ... (untested code above)
> >=20
> > >  	dst_buf =3D v4l2_m2m_next_dst_buf(m2m_ctx);
> > >  	if (!dst_buf) {
> > >  		dev_dbg(inst->dev->dev, "%s: No destination buffer found\n",
> > > __func__); @@ -501,11 +536,15 @@ static int wave5_vpu_enc_s_fmt_out(s=
truct
> > file *file, void *fh, struct v4l2_form
> > >  	}
> > >=20
> > >  	if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
> > > -	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12M) {
> > > +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12M ||
> > > +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16 ||
> > > +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16M) {
> > >  		inst->cbcr_interleave =3D true;
> > >  		inst->nv21 =3D false;
> > >  	} else if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21 ||
> > > -		   inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21M) {
> > > +		   inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21M ||
> > > +		   inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61 ||
> > > +		   inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61M) {
> > >  		inst->cbcr_interleave =3D true;
> >=20
> > This can be simplified to (avoiding enumerating formats):
> >=20
> > 	inst->cbcr_interleave =3D (info->comp_planes =3D=3D 2) ? true : false;
> >=20
> > >  		inst->nv21 =3D true;
> >=20
> > Could be something to add into the info in the future, but for now this=
 is
> > list of formats is needed. Would be a lot more efficient with a switch,=
 but
> > not a hot path so not making this mandatory.
> >=20
>=20
> Switch(pixel_format) {
> Case V4L2_PIX_FMT_NV21:
> Case V4L2_PIX_FMT_NV21M:
> Case V4L2_PIX_FMT_NV61:
> Case V4L2_PIX_FMT_NV61M:
> 	inst->nv21 =3D true;
> Default:
> 	inst->nv21 =3D false;
> }
>=20
> What you are saying is that to set the nv21 variable(using switch) ?

Yes, it seems easier to maintain to me.

>=20
>=20
>=20
> > >  	} else {
> > > @@ -1102,6 +1141,16 @@ static void wave5_set_enc_openparam(struct
> > enc_open_param *open_param,
> > >  	u32 num_ctu_row =3D ALIGN(inst->dst_fmt.height, 64) / 64;
> > >  	u32 num_mb_row =3D ALIGN(inst->dst_fmt.height, 16) / 16;
> > >=20
> > > +	if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV422P ||
> > > +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16 ||
> > > +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61 ||
> > > +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_YUV422M ||
> > > +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV16M ||
> > > +	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV61M)
> > > +		open_param->src_format =3D FORMAT_422;
> > > +	else
> > > +		open_param->src_format =3D FORMAT_420;
> >=20
> > Can be simplified to:
> >=20
> > if (info->hdiv =3D=3D 2 && info->vdiv =3D=3D 2)
> > 	open_param->src_format =3D FORMAT_422;
> > else if (info->hdiv =3D=3D 2 && info->vdiv =3D=3D 1)
> > 	open_param->src_format =3D FORMAT_420;
> >=20
>=20
> I think the above codes should be changed like below.(we should swap the =
values of the src_format variable.)
>=20
>  if (info->hdiv =3D=3D 2 && info->vdiv =3D=3D 2)
>  	open_param->src_format =3D FORMAT_420;
>  else if (info->hdiv =3D=3D 2 && info->vdiv =3D=3D 1)
>  	open_param->src_format =3D FORMAT_422;
>=20

Good catch.

>=20
> > > +
> > >  	open_param->wave_param.gop_preset_idx =3D PRESET_IDX_IPP_SINGLE;
> > >  	open_param->wave_param.hvs_qp_scale =3D 2;
> > >  	open_param->wave_param.hvs_max_delta_qp =3D 10;
> >=20
> > regards,
> > Nicolas


