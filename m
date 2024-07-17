Return-Path: <linux-media+bounces-15096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AD99341AF
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 19:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CFBE283A8E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 17:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7E81836C4;
	Wed, 17 Jul 2024 17:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="TU4LIztg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7498118308A
	for <linux-media@vger.kernel.org>; Wed, 17 Jul 2024 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721238607; cv=none; b=URRzwZKjrFVl2emNJmbUX2KSgUEEQVMss1bgqo99i9nykGeUVoS6s/+U9Vmdjs6oONf1p6brRZTf6E5jCOY/VDK1NcfA1V9UuuRsFTCJsJXeI991WpbRyY2I3uMvMf/g2S9+4/LJ6nIfusOA5h3DtlwxBU1lWpMxEHRBlOsP5Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721238607; c=relaxed/simple;
	bh=/s6XMzqpGd9ftYxjnOIQ/2Q/7UT5lai3haBTDFdi7TY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OGqxBQu+JO5KewlhMVpcuSw0L9nmxzmT6+mP7t0MUUINQzbZ2ereyPp7AHcrQyqzTdgf+Y2W8fvDGxIHvPJpItUq/zadoaTtrSLLXmy+DBD1TDSTIX/y+2HrM3UTZ7WFuVfueHQESKlFYeLgm9FRJxU5KlybX7XXqQssxduZmDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=TU4LIztg; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-44f6700addcso23092771cf.2
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2024 10:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1721238604; x=1721843404; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dvAbFoA1HdmfmF/eRf5+KvV8rS9lCxREHi50gOT2zaw=;
        b=TU4LIztgFQwZgGiPifyiRwlmQ3WLGDknmKLnDeu6oglws45k3Cf42KJ1irY/9axIV7
         NqNjOG5HfRYui9wwbgBvtK5qHODaunw/q3ytKVBRU2lO4ezgZYRnJHJMggDfafo7CEl9
         TSJllUnCQj8wGNpPx+zZom5CZ1ZZfe+KbdskroIxJTul57vkKZppTEesbstGgnNWoA4Y
         cIZhakuMV4kEtmTI5jDR+OuNjEOlckBR9YO0rgARqeTn++vXFuv4TuN0fW5M90k6SylO
         854dsC9R68OPpu6oGETjBrW1jhbIed3QwgdY1DNKFTRBDi31fAdII1IQAV3Z62BCQ+7q
         I8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721238604; x=1721843404;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dvAbFoA1HdmfmF/eRf5+KvV8rS9lCxREHi50gOT2zaw=;
        b=B2CvTV/Q0ZkYYvQSHZtcWVQ+EiA7j8IWgHTcieMrMOZXufMjxQEuXgwFPwY9hO3pP8
         iJl6oTuSnwDdA/PZNM52XjGw0w+XRzw+fe1Li44XQaFtjFdQ4rsqJVdtebgDktETQsu0
         +Le0FWzR+R3WeXCaqT76gP1M9BxGyjXVpzZkCH7m2t2JvISrAgbZKa2QYx3gO5jV4SMP
         DgZEBtcCV30wQFp/COB2/iwjpOae152cRjA0PND9Sf9BIVg5F1y4wAfiFfjSj+YiWX/7
         1L1IpPVVbOJHh+3Ytl/xgCDXTsPh9n6HdqlhZD3lmeSVgaaPt19uEBDeicOPsjlCHb9N
         R2fQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+ShK57WynJiRFajKOb1+hmRlpADioWbjTAx5P7MvKinVVpO3Rv4sZnKtiLL4teIzUBm+k7sL6wLRD9rcB18XDjpp23rdParclPLw=
X-Gm-Message-State: AOJu0YwRDEo9GILoiUjSxGlslqGWaHHnwp7t6OHhetcBFRgZ7aGJCpxa
	jcyD5CTMysYVkOuPzmkXB0i/Cjht3DfBuzPKs3rBrOhIy2XYITJ9J9PmwWcwJM8=
X-Google-Smtp-Source: AGHT+IEfOIRv5HYoKQsceLcUZprEY8WHpJblW/JHP3NJBcp+Gf7Sr+8BNF2h+qxfTOulzVNJCm016g==
X-Received: by 2002:ac8:590b:0:b0:447:e375:1ca6 with SMTP id d75a77b69052e-44f86754699mr32833561cf.52.1721238604247;
        Wed, 17 Jul 2024 10:50:04 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:6720::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83eccesm50462681cf.87.2024.07.17.10.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 10:50:03 -0700 (PDT)
Message-ID: <c8358d79bd51a9bfa5116b33ae5e7766b95d344d.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
 hverkuil-cisco@xs4all.nl,  linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-rockchip@lists.infradead.org,
 kernel@collabora.com
Date: Wed, 17 Jul 2024 13:50:03 -0400
In-Reply-To: <ok2a4ubzka6rhzyj2c5op73ij7pw35g6e75whc2jjget62fatx@zka2ewyt3kfv>
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
	 <20240717131430.159727-2-benjamin.gaignard@collabora.com>
	 <2kbxr3hkjbcnaqescxmlcerziixg72icqpug6wa25eeggy2pnj@vqmxe4ojcwml>
	 <dfc292f8-0014-4bf4-9429-31f729a176cd@collabora.com>
	 <ok2a4ubzka6rhzyj2c5op73ij7pw35g6e75whc2jjget62fatx@zka2ewyt3kfv>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi

Le mercredi 17 juillet 2024 =C3=A0 16:04 +0200, Jacopo Mondi a =C3=A9crit=
=C2=A0:
> Hi Benjamin
>=20
> On Wed, Jul 17, 2024 at 03:44:24PM GMT, Benjamin Gaignard wrote:
> >=20
> > Le 17/07/2024 =C3=A0 15:20, Jacopo Mondi a =C3=A9crit=C2=A0:
> > > Hi Benjamin
> > >=20
> > > On Wed, Jul 17, 2024 at 03:14:29PM GMT, Benjamin Gaignard wrote:
> > > > Add new flags to enumerate all pixels formats when calling VIDIOC_E=
NUM_FMT ioctl.
> > > > When this V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag is set drivers must
> > > > ignore the configuration and return the hardware supported pixel
> > > > formats for the specified queue.
> > > > To distinguish this particular enumeration case V4L2_FMT_FLAG_ALL_F=
ORMATS
> > > > flag must be set by the drivers to highlight support of this featur=
e
> > > > to user space applications.
> > > > This will permit to discover which pixel formats are supported
> > > > without setting codec-specific information so userland can more eas=
ily
> > > > know if the driver suits its needs well.
> > > > The main target are stateless decoders so update the documentation
> > > > about how to use this flag.
> > > >=20
> > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > ---
> > > > changes in version 4:
> > > > - Explicitly document that the new flags are targeting mem2mem devi=
ces.
> > > >=20
> > > >   .../userspace-api/media/v4l/dev-stateless-decoder.rst |  6 ++++++
> > > >   .../userspace-api/media/v4l/vidioc-enum-fmt.rst       | 11 ++++++=
+++++
> > > >   .../userspace-api/media/videodev2.h.rst.exceptions    |  2 ++
> > > >   drivers/media/v4l2-core/v4l2-ioctl.c                  |  3 +++
> > > >   include/uapi/linux/videodev2.h                        |  2 ++
> > > >   5 files changed, 24 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-stateless-de=
coder.rst b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
> > > > index 35ed05f2695e..b0b657de910d 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.r=
st
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.r=
st
> > > > @@ -58,6 +58,12 @@ Querying capabilities
> > > >        default values for these controls being used, and a returned=
 set of formats
> > > >        that may not be usable for the media the client is trying to=
 decode.
> > > >=20
> > > > +   * If the ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS`` flag is set the dri=
ver must enumerate
> > > > +     all the supported formats without taking care of codec-depend=
ent controls
> > > > +     set on the ``OUTPUT`` queue. To indicate that the driver has =
take care of this
> > > > +     flag it must set ``V4L2_FMT_FLAG_ALL_FORMATS`` flag for each =
format while
> > > > +     enumerating.
> > > > +
> > > >   3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect =
supported
> > > >      resolutions for a given format, passing desired pixel format i=
n
> > > >      :c:type:`v4l2_frmsizeenum`'s ``pixel_format``.
> > > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.=
rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > > > index 3adb3d205531..15bc2f59c05a 100644
> > > > --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > > > @@ -234,6 +234,17 @@ the ``mbus_code`` field is handled differently=
:
> > > >   	valid. The buffer consists of ``height`` lines, each having ``wi=
dth``
> > > >   	Data Units of data and the offset (in bytes) between the beginni=
ng of
> > > >   	each two consecutive lines is ``bytesperline``.
> > > > +    * - ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS``
> > > > +      - 0x0400
> > > > +      - Set by userland applications to enumerate all possible pix=
el formats
> > > > +        without taking care of any OUTPUT or CAPTURE queue configu=
ration.
> > > > +        This flag is relevant only for mem2mem devices.
> > > > +    * - ``V4L2_FMT_FLAG_ALL_FORMATS``
> > > > +      - 0x0800
> > > > +      - Set by the driver to indicated that format have been enume=
rated because
> > > > +        :ref:`V4L2_FMT_FLAG_ENUM_ALL_FORMATS <v4l2-pix-fmt-flag-se=
t-csc>` has
> > > > +        been set by the userland application.
> > > > +        This flag is relevant only for mem2mem devices.
> > > Thanks, however I think this can be wrapper on the previous line
> >=20
> > ok
> >=20
> > >=20
> > > >   Return Value
> > > >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exce=
ptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > > index bdc628e8c1d6..7a3a1e9dc055 100644
> > > > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > > @@ -216,6 +216,8 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtd=
esc-flags
> > > >   replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
> > > >   replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
> > > >   replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
> > > > +replace define V4L2_FMT_FLAG_ENUM_ALL_FORMATS fmtdesc-flags
> > > > +replace define V4L2_FMT_FLAG_ALL_FORMATS fmtdesc-flags
> > > >=20
> > > >   # V4L2 timecode types
> > > >   replace define V4L2_TC_TYPE_24FPS timecode-type
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v=
4l2-core/v4l2-ioctl.c
> > > > index 4c76d17b4629..5785a98b6ba2 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > @@ -1569,6 +1569,7 @@ static int v4l_enum_fmt(const struct v4l2_ioc=
tl_ops *ops,
> > > >   	int ret =3D check_fmt(file, p->type);
> > > >   	u32 mbus_code;
> > > >   	u32 cap_mask;
> > > > +	u32 flags;
> > > >=20
> > > >   	if (ret)
> > > >   		return ret;
> > > > @@ -1578,8 +1579,10 @@ static int v4l_enum_fmt(const struct v4l2_io=
ctl_ops *ops,
> > > >   		p->mbus_code =3D 0;
> > > >=20
> > > >   	mbus_code =3D p->mbus_code;
> > > > +	flags =3D p->flags & V4L2_FMT_FLAG_ENUM_ALL_FORMATS;
> > > >   	memset_after(p, 0, type);
> > > >   	p->mbus_code =3D mbus_code;
> > > > +	p->flags =3D flags;
> > > Won't this set V4L2_FMT_FLAG_ENUM_ALL_FORMATS (if present) in the
> > > flags returned to userspace ? Shouldn't be drivers to set
> > > V4L2_FMT_FLAG_ALL_FORMATS instead ?
> >=20
> > memset_after zeroed flags field so we need this to send V4L2_FMT_FLAG_E=
NUM_ALL_FORMATS
> > flag to drivers. Return it to userspace is a side effect but I don't th=
at is problem
> > since it set it anyway.
> >=20
>=20
> Ok, if the expectation is that the flag is preserved through the ioctl
> call, this is fine with me

I might be missing something other similar features are explicitly advertis=
ed by
drivers. This way, the generic layer can keep or clear the flag based of if=
 its
supported. The fact the flag persist the ioctl() or not endup having a usef=
ul
semantic.

Could we do the same?

>=20
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>=20
> > >=20
> > > >   	switch (p->type) {
> > > >   	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vi=
deodev2.h
> > > > index fe6b67e83751..b6a5da79ba21 100644
> > > > --- a/include/uapi/linux/videodev2.h
> > > > +++ b/include/uapi/linux/videodev2.h
> > > > @@ -886,6 +886,8 @@ struct v4l2_fmtdesc {
> > > >   #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
> > > >   #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> > > >   #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
> > > > +#define V4L2_FMT_FLAG_ENUM_ALL_FORMATS		0x0400
> > > > +#define V4L2_FMT_FLAG_ALL_FORMATS		0x0800
> > > >=20
> > > >   	/* Frame Size and frame rate enumeration */
> > > >   /*
> > > > --
> > > > 2.43.0
> > > >=20
> > > >=20
> > > _______________________________________________
> > > Kernel mailing list -- kernel@mailman.collabora.com
> > > To unsubscribe send an email to kernel-leave@mailman.collabora.com
> > > This list is managed by https://mailman.collabora.com
>=20


