Return-Path: <linux-media+bounces-41060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4293EB35582
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 09:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 35FF04E3DAC
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 07:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2F92FF15B;
	Tue, 26 Aug 2025 07:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bDlaKt5H"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10EA2FA0F2;
	Tue, 26 Aug 2025 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756192902; cv=none; b=XxQJNiAntclTDABPTyDl4ARRxV6hfFBRX+32PoFNOqwP2TPQRTUqFL/ilMNB4HmrTnQtlaxx0eEFWqP8PwCgbYjtOSt3ZaLMsI1UKw/8QoO7QAMvgL9M+3Mwpp9a/jz2QuQkFiDmLEfxrpAhzARxLwZOQSi3W2kpvfm86gCfw6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756192902; c=relaxed/simple;
	bh=i9eZzXa6KNHsPr+uB9jBvv363QVy+ueLLm5amG82YCg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZQIlQF854jgrF6dpecWKgsA97JEGru2+vqy8dDXXqxuSAMkPwLIhlV/9KApNESE7QvoHR2GUXYvdj02bD1yOiCXannqQHpVzkVA4Tov2cmMre/mpa6Ln/T0n6KkZua/EuQM4wUS9rxMISdkqvTHiNJh64xcTnhT6o3HjD5x8sRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bDlaKt5H; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756192890;
	bh=i9eZzXa6KNHsPr+uB9jBvv363QVy+ueLLm5amG82YCg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bDlaKt5HGTigVAMo8SQWZMLxSCsdTBbxy1FFve3ERMUnRaZQDtT4Su9J2DorGKRzU
	 pYp52LtKuLHj5kr2IjHSZMfShM6j//t3R3ExXg/C89xfhEQfBuMB7vNXvPOmKikW5T
	 PWPz6lD2yWzexSz8Voea3cndIpFqNbd/N5UZ7NKWcygCYk7po1QNuemROopvR5AsfT
	 onja315lge7W2f/kmR+yP0YcfU/9lYqa78o/HU4BjPVRCPoKGoNzlKmArvIxzK1pu5
	 K1erBWYyBEytD6AjooE/kg4e1EAt48+rDy1coPu76+s7Shv1lSILZcgMwBcUQrzrYf
	 vb45ajH3RtCWA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8F85cf092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F11D17E011A;
	Tue, 26 Aug 2025 09:21:30 +0200 (CEST)
Message-ID: <442c8ed533e01af213c5fae2dad5ad317872d4d1.camel@collabora.com>
Subject: Re: [PATCH] media: i2c: vgxy61: Report stream using frame
 descriptors
From: Julien Massot <julien.massot@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: kernel@collabora.com, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 26 Aug 2025 09:21:29 +0200
In-Reply-To: <aJ7N8tAqEp5KSTGN@kekkonen.localdomain>
References: <20250704-vgxy61-frame-desc-v1-1-0e62b9c4e260@collabora.com>
	 <aJ7N8tAqEp5KSTGN@kekkonen.localdomain>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sakari,

On Fri, 2025-08-15 at 06:04 +0000, Sakari Ailus wrote:
> Hi Julien,
>=20
> On Fri, Jul 04, 2025 at 11:28:24AM +0200, Julien Massot wrote:
> > Add support for .get_frame_desc() to report CSI-2 virtual channel
> > and data type information. This allows CSI-2 receivers to properly
> > interpret the stream without inferring the data type from the pixel
> > format.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0drivers/media/i2c/vgxy61.c | 16 ++++++++++++++++
> > =C2=A01 file changed, 16 insertions(+)
> >=20
> > diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
> > index
> > 5b0479f3a3c0592be430cefe5a1ab9a76812ba84..44d6c8d8fbf8d6182e42d44e129b
> > c45945ee0da5 100644
> > --- a/drivers/media/i2c/vgxy61.c
> > +++ b/drivers/media/i2c/vgxy61.c
> > @@ -1181,6 +1181,21 @@ static int vgxy61_s_stream(struct v4l2_subdev
> > *sd, int enable)
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > +static int vgxy61_get_frame_desc(struct v4l2_subdev *sd, unsigned int
> > pad,
> > +				 struct v4l2_mbus_frame_desc *fd)
> > +{
> > +	struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> > +
> > +	fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > +	fd->num_entries =3D 1;
> > +	fd->entry[0].pixelcode =3D sensor->fmt.code;
> > +	fd->entry[0].stream =3D 0;
> > +	fd->entry[0].bus.csi2.vc =3D 0;
> > +	fd->entry[0].bus.csi2.dt =3D get_data_type_by_code(sensor-
> > >fmt.code);
> > +
> > +	return 0;
> > +}
> > +
> > =C2=A0static int vgxy61_set_fmt(struct v4l2_subdev *sd,
> > =C2=A0			=C2=A0 struct v4l2_subdev_state *sd_state,
> > =C2=A0			=C2=A0 struct v4l2_subdev_format *format)
> > @@ -1402,6 +1417,7 @@ static const struct v4l2_subdev_pad_ops
> > vgxy61_pad_ops =3D {
> > =C2=A0	.set_fmt =3D vgxy61_set_fmt,
> > =C2=A0	.get_selection =3D vgxy61_get_selection,
> > =C2=A0	.enum_frame_size =3D vgxy61_enum_frame_size,
> > +	.get_frame_desc =3D vgxy61_get_frame_desc,
> > =C2=A0};
> > =C2=A0
> > =C2=A0static const struct v4l2_subdev_ops vgxy61_subdev_ops =3D {
> >=20
>=20
> I guess this is correct as such, but does it provide any information
> that
> isn't already available? I.e. I wouldn't add it just for the sake of it.
Perhaps, I missed something. Without the get_frame_desc the CSI receiver
have to infers the datatype based on the pixel format.

I made this patch because some CSI receivers, such as the upcoming GMSL2
framework are relying on the frame desc to update its routing table.
So, it will only support sensors implementing the get_frame_desc function.

Regards,
Julien

