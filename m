Return-Path: <linux-media+bounces-24351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11803A04668
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 17:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40823A69DD
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 16:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30541F63FC;
	Tue,  7 Jan 2025 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="lB9b6nPB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDA91F6695
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267363; cv=none; b=pTsKPcGPW3oKhJ8Q1uu2R6+GfhLQ0dlM5HtwJXvpgMADIVlRTpRyv5B9HOZ8aiY6aVIgBZcsHkUMvE6DPQrdsLpAyZ5NxcZ+rprd57KSIM16Zrt2iIw6PHy8z8KnXDQ07vPEp91APKu8KTTn03eAIZcJgFvtRQReUljjyLxZH48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267363; c=relaxed/simple;
	bh=KCtwF6vbca25t2bwwBZ4ELVCZXYEEAPsnYr6vKLfOqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJZ6G00ygFryvLhDgIm7m9Yia+aqu8uIgVCBrWbpj3lb+iH+nQCqDgeBcWVrAxpftmdWbiKYQpGwCD41+zwO80wbmWJOMZObNh5Qrge4xw/T/PmwjQr3RJHJS6Ov2Nute/VIs1DZHOlaGI91QW91Kt/Wx7vVsopaQ+5CabsvEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=lB9b6nPB; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e3a26de697fso21074695276.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 08:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736267357; x=1736872157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fc9TAWTYLPXygf26AxVFot53JgJe8sMA4p9Ceubb2BA=;
        b=lB9b6nPBFjqKByMswiiGhp7wUKQXtz+Dj+rmkzK+cyugl0FAoFpQruxEwURtrPKfit
         5jEIZ4O4zHUr13ZbfKBdzaq4e9gprjjTdFYJMq60bJTt0JkiITxo7NbuIgr/s5qo7MOX
         F5MbnvpiaKKJ2naFpwoa5FsRiWV7GOvzALGSGo16dTnE5euPr5L98rhrTz0/5P7MOoMg
         FS56p5Q0EkonPgMeeG4vzJj2a9xQnYw2BSjlXTMSy1xJ4GR38vFBa97icBJNwGdAumCF
         IEXpQKCRebLfAgMPfpfp+mYpzjmcAHHxkyVjTPtOaPU6xLeE8hCOuhZ3d/AEB7LK/bUZ
         GZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736267357; x=1736872157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fc9TAWTYLPXygf26AxVFot53JgJe8sMA4p9Ceubb2BA=;
        b=JbDRND+8csWGl3ddAuxyLim06SLoES3JBnl0rc5YpRQKLFU9y8+E28moXBaI1qYvEn
         RZ9H5/BimINdHf99+C0yeCXCbdbBCl4PcYTEaV1KbZRAHNdXwJrxeaiA6GIMRXHDDxBF
         nHsh+7TqxC8XrsDSdFS6jgiHVrBs3gQJB7oG9nq/JOIMZGBH5Mkr33Uns0AZ+dhU45YD
         h8J0nEn/DVshb1VfgtfOoivz+GndSgs71Fu19DTTGT3QzVHqDYXM/ON9NawLksF1fXQO
         H755TgnD1FXVnBOrg52V2iGKnIyxAkfzHNUiXNyO60YjO1K6JvIfcnvn5gG4Gr21aqV4
         S+jw==
X-Forwarded-Encrypted: i=1; AJvYcCXUjTvchDaejyK7UWfowUkH2diIYsMY3G2fCPptuLmVRcf7Dvhxi1CdIFFK9DM9hEpV3NrIVeJCUYPAwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpAHur3IBsEAnY6M4DfQs7RcpfdxSp2HcE6czMwS2/E+pQ30nY
	v7tYZvPa+UaEahfSrL6AGHkBaXjweURKy1u0nfbIGztYFWMch1ZM9y6bCCmcrjYMy0N8t5J6qMe
	F9+/yyo5P8aivLag6kbz+7YMhaft6y6bH5P51Eg==
X-Gm-Gg: ASbGncsmpplvA1lD/Nl9tQ8SYjuvpDicCrvLWuOzT0N19elSRTX1xKCWnuUiIRixtfB
	Zm8drvrdTUKDTpLdTO3qpM1ttqT7IvSHnzcBYUqYjR7AZeBp0iKTehUIGyXPm7Oymud+pXg==
X-Google-Smtp-Source: AGHT+IHE9JCAToCSl3COyvQMx5Y1P1UpkdQ9O+c29S+dQDMjILkfPa180zWfWuIGALyqsVOAyrBZX1J+I8N/WVKwvWM=
X-Received: by 2002:a05:690c:6711:b0:6e3:15ad:a560 with SMTP id
 00721157ae682-6f3f8110608mr487206047b3.12.1736267354719; Tue, 07 Jan 2025
 08:29:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
 <20241220-media-rpi-hevc-dec-v1-3-0ebcc04ed42e@raspberrypi.com>
 <d2f047cd-5c50-454f-95be-601edb79466d@collabora.com> <CAPY8ntBNse4Dq9E49QO3ipDbb+uMipe+MuLxW_Jpszu9gQgpww@mail.gmail.com>
 <cfa4e4ebd9015a291e513fc22ec70821976e56ce.camel@ndufresne.ca>
In-Reply-To: <cfa4e4ebd9015a291e513fc22ec70821976e56ce.camel@ndufresne.ca>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 7 Jan 2025 16:28:54 +0000
Message-ID: <CAPY8ntAxkdyngsCFfYNGNv6ObJU1PCMPvr_61R14a2H+dbZm2Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Robert Mader <robert.mader@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Jan 2025 at 20:52, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Le jeudi 02 janvier 2025 =C3=A0 12:52 +0000, Dave Stevenson a =C3=A9crit =
:
> > Hi Robert
> >
> > Resending this reply as replying from my phone before the Christmas
> > break sent it as HTML :-(
> >
> > On Sat, 21 Dec 2024 at 17:38, Robert Mader <robert.mader@collabora.com>=
 wrote:
> > >
> > > Hi, thanks for the patch.
> > >
> > > On 20.12.24 17:21, Dave Stevenson wrote:
> > >
> > > Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
> > > to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> > >  include/uapi/linux/videodev2.h       | 5 +++++
> > >  2 files changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> > > index 0304daa8471d..e510e375a871 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1377,7 +1377,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdes=
c *fmt)
> > >   case V4L2_PIX_FMT_NV16M: descr =3D "Y/UV 4:2:2 (N-C)"; break;
> > >   case V4L2_PIX_FMT_NV61M: descr =3D "Y/VU 4:2:2 (N-C)"; break;
> > >   case V4L2_PIX_FMT_NV12MT: descr =3D "Y/UV 4:2:0 (64x32 MB, N-C)"; b=
reak;
> > > + case V4L2_PIX_FMT_NV12MT_COL128: descr =3D "Y/CbCr 4:2:0 (128b cols=
)"; break;
> > >   case V4L2_PIX_FMT_NV12MT_16X16: descr =3D "Y/UV 4:2:0 (16x16 MB, N-=
C)"; break;
> > > + case V4L2_PIX_FMT_NV12MT_10_COL128: descr =3D "10-bit Y/CbCr 4:2:0 =
(128b cols)"; break;
> > >   case V4L2_PIX_FMT_P012M: descr =3D "12-bit Y/UV 4:2:0 (N-C)"; break=
;
> > >   case V4L2_PIX_FMT_YUV420M: descr =3D "Planar YUV 4:2:0 (N-C)"; brea=
k;
> > >   case V4L2_PIX_FMT_YVU420M: descr =3D "Planar YVU 4:2:0 (N-C)"; brea=
k;
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index e7c4dce39007..f8f97aa6a616 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -687,6 +687,11 @@ struct v4l2_pix_format {
> > >  #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /*=
 12  Y/CbCr 4:2:0 16x16 tiles */
> > >  #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2'=
) /* Y/CbCr 4:2:0 8x128 tiles */
> > >  #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', =
'2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> > > +#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /=
* 12  Y/CbCr 4:2:0 128 pixel wide column */
> > > +#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0'=
)
> > >
> > > Should these be upper-case Cs instead? So they compatible with the pr=
eviously used downstream values?
> >
> > No, this is deliberate.
> >
> > Downstream was using a single planar format, with extra complexity for
> > determining the chroma offset per column, and weird handling required
> > on bytesperline.
> > Having had discussions, switching to a multiplanar format (hence MT in
> > the name) removes those complexities and means we don't need to do
> > anything weird in the v4l2 format definitions.
> >
> > Reusing NC12 and NC30 fourccs will give us grief over backwards
> > compatibility, hence lower case for the new version.
> >
> > I have a patch on [1] that adds back in NC12 and NC30 for downstream
> > just so we don't break existing users, but see no point in upstreaming
> > that.
>
> Yes, I think its fair to avoid incompatibility there. Are there matching =
Mesa
> patches coming, since without that we are back to square one, where the f=
ormat
> remains unusable. NC12 have a matching (mainline) DRM_FORMAT_NV12
> DRM_FORMAT_MOD_BROADCOM_SAND128 pair. I believe a new modifier is needed =
and
> will serve both Nc12/30.

The current DRM_FORMAT_MOD_BROADCOM_SAND128 taking the column height
as the parameter is apparently contrary to how DRM modifiers are meant
to be used. You're not allowed to have a genuine runtime parameter in
there, and all potential values for parameters have to be listed out
in the in_formats blob.

I have a patch on [1] to add DRM_FORMAT_MOD_BROADCOM_SAND128(0) as a
modifier which then takes the height passed in to addFB2 to be the
column height. With luma and chroma now in independent buffers via the
multi-planar API, that solves the problem, and we don't need a new
modifier. I will submit that to dri-devel in the next week or so.

I've pinged Igalia to sort the equivalent Mesa patch for me.

 Dave

[1] https://github.com/6by9/linux/commits/rpi-6.12.y-hevc_dec patch
"drm/vc4: Add algorithmic handling for SAND". I can't give a hash as I
rebase that branch.


> Nicolas
>
> >
> > > P.S.: Coincidentally Gstreamer just landed support for NC12 in https:=
//gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7355 and ther=
e is also a link to experimental NC30 patches. So happy to see this series =
appear upstream :)
> >
> > Ooh, nice. I'll give it a test when I'm back in the office.
> >
> > Dave
> >
> > [1] https://github.com/6by9/linux/commits/rpi-6.12.y-hevc_dec/
> >
> > > + /* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in
> > > + * a 128 bytes / 96 pixel wide column */
> > > +
> > >
> > >  /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm=
 */
> > >  #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  =
BGBG.. GRGR.. */
> > >
> >
>

