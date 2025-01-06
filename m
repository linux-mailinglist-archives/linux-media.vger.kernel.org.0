Return-Path: <linux-media+bounces-24305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C4AA031A1
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 21:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCE191886FA5
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 20:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E091E00AC;
	Mon,  6 Jan 2025 20:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="SgQB9l4C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14F4165F1F
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736196764; cv=none; b=vGEmsgniCdJevPRLHQV/uGXQntRKg/HdNmdNtzUVdRSA8CM68Czsagkhe9qkMFcADhBqoRYz45s2RJrSPov2FigvbL2/OOOLk00rjG2b3BfRlaHctQHMVPkRh9Ziw73JsIXQGAfI5T65jKnPYl+62w1TGFYFxAgsxvMXsEmjKyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736196764; c=relaxed/simple;
	bh=hamObcPRLcptZyajp4n+VlcmLi4gURsFRoN2VusT1jI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JIwCN1VuSn3hvwkzCLyLCx0+Wyh+nud1PiDvkfKcSUT5n7NW4nc3AgpiCIS+EgkO9+gya3ka19k7+mnXjobTrdr1IN2lf3GladSzTXtWqbOOdeKuLk5BcBbvf96AX2bcwfM+m9BIrJLutT9zGmKb7f+3UQNppGim/nun6oWQwCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=SgQB9l4C; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d88cb85987so121375416d6.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 12:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736196761; x=1736801561; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=giG6Xr6qKpnwxFJ2rgydlTUajc1DsU8QvRnJMssmFGk=;
        b=SgQB9l4CDFVaQn/iBs06b1Qx9vLW9aJSQFPWQFKwsh9NmF+m+KMx6iEfQyf4nJa/BY
         HW9rW+77omOnwd/gS755/oaq5vx0mPV5h4VpB7AvDaBmo2TgLxgqqY32yB9xym5R1O2v
         yArsvEOaK7P2a+Hax0ow49lD4u79U9LbFW49V8G43HAEY4KRwT0MJ0GWsep4ZoKWujTw
         hgt/sY0m7XI7ogEwJfvukYz9puBzCcM2u8Vbfo6h+0yb3qnetoOBC2qK0iMjlpcbBhyR
         DalnYo7VKZAbgcRiQAbK6nllqYoyXS2WKMgPOQ8tHkYcmt5f+jQePXKib7CX4r7g/XJg
         oJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736196761; x=1736801561;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=giG6Xr6qKpnwxFJ2rgydlTUajc1DsU8QvRnJMssmFGk=;
        b=UpAZZbvI/Ahsgv7oVqF9tZj17OD1ALaVjc+GYyrCoj9AoQlW1/YagjdF4cByr6erDH
         HFiKks82vqfRhDbRAow5g9DbUwYsOTzN+SRiBSPvq3U52qqzA7wjGCOU4HZYnr3dPpAT
         Jna/gSd++EZRKZnb+ojnX77iIYiZFKjYB0PMTV2/Nnfd1PzoRAG534ntDxL80gZrYbBz
         9Ce+FMEwY2UxM9yqMezBAXibSDurGt+2keSk0bkgJV4qrjljYO66h+d/Qz2/9JFtzIOU
         ydGUo1i5jXUhd9OQo3oYzzJQOefJQukxxM5QBt8rbABWoKsPzHWr4f9zeHNED3j9tIJ7
         PxUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGzR3L48AFZ7ZNMJMHQVXQAaGKOn6v5KWVc9jpfpQo2kYvBlBfdKc48jZRC/ZtNvq5AovDCjq7zSdAzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFlx5AYl5Fud6gUZ5Be63Nf4uVpu3vpPVyM0dBtgai8oJSosqs
	MjYz2Ir/s5FKKNs8OPBuiemEqwGuSI7o420IjLNubvpMkyaxNnmXTI7TYQT50no=
X-Gm-Gg: ASbGncvBfwuMai6GVKk+vzBdd7m69lJ9qGBzqwaLczDJlNpjGWLpFK7NkdB8S+VkImG
	4nFV5Hspm1YsH8v2iORDUCZzQ3lD4N6klNXVIpGoCIGYnLhTYgLKFjiZn9gKmeInqzxeT2m1XPb
	6KNaxekSh98KPxJmbxWjC8ZobgfwfmYcBMmwzjVniXEot5wsxXtCiaKto4avjW/cuF9TV2qk0Ki
	HVXXWh8KUF/3RbFnnyvrtDZSbOKHBNP1j1V6/rUKx4uhjAGhWZtCHa3xg==
X-Google-Smtp-Source: AGHT+IEIInkPocHyFdCklKrx/YmrGw+uUM4krY58O8WCdt8yNm1sL3igRegISVWjyVZhUSTTP71cpw==
X-Received: by 2002:a05:6214:3b8a:b0:6d8:8a0b:db25 with SMTP id 6a1803df08f44-6df8e8be44bmr11681446d6.21.1736196761471;
        Mon, 06 Jan 2025 12:52:41 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d5aabsm174516886d6.108.2025.01.06.12.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:52:41 -0800 (PST)
Message-ID: <cfa4e4ebd9015a291e513fc22ec70821976e56ce.camel@ndufresne.ca>
Subject: Re: [PATCH 3/7] media: ioctl: Add pixel formats NV12MT_COL128 and
 NV12MT_10_COL128
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Robert Mader
	 <robert.mader@collabora.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 06 Jan 2025 15:52:40 -0500
In-Reply-To: <CAPY8ntBNse4Dq9E49QO3ipDbb+uMipe+MuLxW_Jpszu9gQgpww@mail.gmail.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
	 <20241220-media-rpi-hevc-dec-v1-3-0ebcc04ed42e@raspberrypi.com>
	 <d2f047cd-5c50-454f-95be-601edb79466d@collabora.com>
	 <CAPY8ntBNse4Dq9E49QO3ipDbb+uMipe+MuLxW_Jpszu9gQgpww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 02 janvier 2025 =C3=A0 12:52 +0000, Dave Stevenson a =C3=A9crit=C2=
=A0:
> Hi Robert
>=20
> Resending this reply as replying from my phone before the Christmas
> break sent it as HTML :-(
>=20
> On Sat, 21 Dec 2024 at 17:38, Robert Mader <robert.mader@collabora.com> w=
rote:
> >=20
> > Hi, thanks for the patch.
> >=20
> > On 20.12.24 17:21, Dave Stevenson wrote:
> >=20
> > Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
> > to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.
> >=20
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> >  include/uapi/linux/videodev2.h       | 5 +++++
> >  2 files changed, 7 insertions(+)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-=
core/v4l2-ioctl.c
> > index 0304daa8471d..e510e375a871 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1377,7 +1377,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc =
*fmt)
> >   case V4L2_PIX_FMT_NV16M: descr =3D "Y/UV 4:2:2 (N-C)"; break;
> >   case V4L2_PIX_FMT_NV61M: descr =3D "Y/VU 4:2:2 (N-C)"; break;
> >   case V4L2_PIX_FMT_NV12MT: descr =3D "Y/UV 4:2:0 (64x32 MB, N-C)"; bre=
ak;
> > + case V4L2_PIX_FMT_NV12MT_COL128: descr =3D "Y/CbCr 4:2:0 (128b cols)"=
; break;
> >   case V4L2_PIX_FMT_NV12MT_16X16: descr =3D "Y/UV 4:2:0 (16x16 MB, N-C)=
"; break;
> > + case V4L2_PIX_FMT_NV12MT_10_COL128: descr =3D "10-bit Y/CbCr 4:2:0 (1=
28b cols)"; break;
> >   case V4L2_PIX_FMT_P012M: descr =3D "12-bit Y/UV 4:2:0 (N-C)"; break;
> >   case V4L2_PIX_FMT_YUV420M: descr =3D "Planar YUV 4:2:0 (N-C)"; break;
> >   case V4L2_PIX_FMT_YVU420M: descr =3D "Planar YVU 4:2:0 (N-C)"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index e7c4dce39007..f8f97aa6a616 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -687,6 +687,11 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 1=
2  Y/CbCr 4:2:0 16x16 tiles */
> >  #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') =
/* Y/CbCr 4:2:0 8x128 tiles */
> >  #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2=
') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> > +#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /* =
12  Y/CbCr 4:2:0 128 pixel wide column */
> > +#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
> >=20
> > Should these be upper-case Cs instead? So they compatible with the prev=
iously used downstream values?
>=20
> No, this is deliberate.
>=20
> Downstream was using a single planar format, with extra complexity for
> determining the chroma offset per column, and weird handling required
> on bytesperline.
> Having had discussions, switching to a multiplanar format (hence MT in
> the name) removes those complexities and means we don't need to do
> anything weird in the v4l2 format definitions.
>=20
> Reusing NC12 and NC30 fourccs will give us grief over backwards
> compatibility, hence lower case for the new version.
>=20
> I have a patch on [1] that adds back in NC12 and NC30 for downstream
> just so we don't break existing users, but see no point in upstreaming
> that.

Yes, I think its fair to avoid incompatibility there. Are there matching Me=
sa
patches coming, since without that we are back to square one, where the for=
mat
remains unusable. NC12 have a matching (mainline) DRM_FORMAT_NV12=20
DRM_FORMAT_MOD_BROADCOM_SAND128 pair. I believe a new modifier is needed an=
d
will serve both Nc12/30.

Nicolas

>=20
> > P.S.: Coincidentally Gstreamer just landed support for NC12 in https://=
gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7355 and there =
is also a link to experimental NC30 patches. So happy to see this series ap=
pear upstream :)
>=20
> Ooh, nice. I'll give it a test when I'm back in the office.
>=20
> Dave
>=20
> [1] https://github.com/6by9/linux/commits/rpi-6.12.y-hevc_dec/
>=20
> > + /* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in
> > + * a 128 bytes / 96 pixel wide column */
> > +
> >=20
> >  /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm *=
/
> >  #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BG=
BG.. GRGR.. */
> >=20
>=20


