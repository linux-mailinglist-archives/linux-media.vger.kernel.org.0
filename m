Return-Path: <linux-media+bounces-6602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FA2874187
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 21:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7588F1C20B81
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 20:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5864617551;
	Wed,  6 Mar 2024 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="2jeGq1yw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2071814F64
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709758007; cv=none; b=u5EdOaZlqzY+r9op5jS1Laq0eOud9BU5QFtBLrDYKneGNAufeB1wT5rultBYj8QnS4TYA0mR/Xq1orTxO5OHT70h1Ofg6OqJwsnzdJv1sMQUb7EhjA50nxY+WR5T47qYlvCGJD+jA0Md/8MG/7kbrE+WQ6BZuu0XLA8qiDvegPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709758007; c=relaxed/simple;
	bh=JE0sSGgVvL4wqpG1ts6Y3CC9hTuSwraM8b76r3cCkVU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hKrypns9jflObUCuVbReItFZs1j38gDDmsUXsZ7+paKBW+d0rqSgdVX4jmcnqO32Kxu5YlD3nB1Iee94q9CsuVkArw5L4IhM5ARlbx4H1rZlTGHm9r/O5hqHJUII051+uPlmt1lka0z0YkAaMh7uwl8tsIfkW2Na31D1BZDOlUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=2jeGq1yw; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78830bba6a4so12552185a.0
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 12:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1709758005; x=1710362805; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/PY5czdzTrZDN9x/Y/Ftpi/o5s2OHdkVqZVB6DmXN3M=;
        b=2jeGq1ywRZdFtDD4NRbyQEGdmaXpz+HiUH8bcVAYt5Jv2qSXYAoepxE9OJwNXRN/DV
         BS2Pv/8x331vufnQ6HOlDRFzJyrLy/fR8qPXjpbYPgoBrYH+Lhk5wia5Y9DYrBo7V3/0
         l39cJNrZz1MwAQFlxmUQ3hqhMiakDFrZ9Kfsnx4vsIct+Mm+DIM6n2nPh/IRDkV6C7la
         x+Tt1K+iPjN1lWf8wQyeF5yJFVi0ERbKwA7IvE5seJ+h5uwsRwUEqQjCY00e2WZiwP9A
         Ww3FjV53AJpo7B50Y7tP4v3JCm2aN8svTqAOSnFUZSRpIX7ZIYl665lx6PZv9GnnZS21
         36WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709758005; x=1710362805;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/PY5czdzTrZDN9x/Y/Ftpi/o5s2OHdkVqZVB6DmXN3M=;
        b=gwL8FrjEXOtVo5uTUwKivu7fbofibECPF2f2iLSk96fny0/ix/pyU90+CZfnp4d75M
         gKeQuCdMl8ED2SIFMMx43tCrhvp167brnEYFGfZVjUihP3bXnRxT5VZMWD4igv7/yLx8
         yx0GKfMbTtAYOmtM+htdkH58Bztq0qj0rBHTVnAEJLsBCzK5MsgGoUP3x1LPQAB+w96s
         PdgKXullHX84nqa+f8ZnMgCbwc2AfE4P4Uup0GVn6ea/O779fcnb9NPJ0So0qNLBagY/
         gqlrS7ed1lGVsFhZkbbg2l/Q0cQWqnp8nkjzxNes/A3QPalMAE4MnPVA7Dv8bvRmweNX
         Iz6A==
X-Forwarded-Encrypted: i=1; AJvYcCWkoN3pySrFh6/JTpTUyrggxc8u1Ull0Tn8y4cQvRn/rqkLl101TNpJDNH2Z3b8A22IbrjgDvZgDSgvvxPVxbBlaz0KY/qbA40qVkY=
X-Gm-Message-State: AOJu0Yxry4ZCjQdcKxIBAvlgoYQ2YqmvpgYF46Oj/YZG2GleDGYHjQyY
	Fu1dFxjnQkKlOJ9Ez9GS2xHXUNvH5bfz85mZHe0QWmdZYG8nEL7xlkJiNMttAI0=
X-Google-Smtp-Source: AGHT+IF3HBjd9pWaNvqxvKp8sejEgTFkFCeFe1/Wu1ilVWRzNV3b3s29HrYHSToKQIf5Q2CMgkfGdQ==
X-Received: by 2002:a05:620a:229:b0:785:b95c:a128 with SMTP id u9-20020a05620a022900b00785b95ca128mr5526424qkm.67.1709758005004;
        Wed, 06 Mar 2024 12:46:45 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:eba4::7a9])
        by smtp.gmail.com with ESMTPSA id u12-20020a05620a022c00b00788258a8888sm3881936qkm.48.2024.03.06.12.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 12:46:44 -0800 (PST)
Message-ID: <94c5a247565061e23e263af2e87f30fcd5998ab0.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 04/13] media: videodev2.h: Add a format for column
 YUV4:2:0 modes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maarten <maarten@rmail.be>, Raspberry Pi Kernel Maintenance
	 <kernel-list@raspberrypi.com>, linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Umang Jain
 <umang.jain@ideasonboard.com>,  Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Date: Wed, 06 Mar 2024 15:46:43 -0500
In-Reply-To: <4b40e309f619a2bb361f1b9de08f32fa@rmail.be>
References: <20240303152635.2762696-1-maarten@rmail.be>
	 <20240303152635.2762696-5-maarten@rmail.be>
	 <42bfe748423d0992d001ce23ec1cf209142c3739.camel@ndufresne.ca>
	 <4b40e309f619a2bb361f1b9de08f32fa@rmail.be>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,


Le mardi 05 mars 2024 =C3=A0 19:14 +0100, Maarten a =C3=A9crit=C2=A0:
[...]
> > > +=C2=A0=C2=A0=C2=A0 pixfmt-yuv411p
> > > +=C2=A0=C2=A0=C2=A0 pixfmt-nv12
> > > +=C2=A0=C2=A0=C2=A0 pixfmt-nv12m
> > > +=C2=A0=C2=A0=C2=A0 pixfmt-nv12mt
> > > +=C2=A0=C2=A0=C2=A0 pixfmt-nv12-col128
> > > +=C2=A0=C2=A0=C2=A0 pixfmt-nv16
> > > +=C2=A0=C2=A0=C2=A0 pixfmt-nv16m
> > > +=C2=A0=C2=A0=C2=A0 pixfmt-nv24
> >=20
> > Unrelated fixes should have their own patch.
>=20
> Ok, I guess I should file seperate patches for all of these? Or do you=
=20
> want me to not touch these others?

Cleanup patches are more then welcome, I haven't looked deeply what this on=
e is
about, just noticed it was not part of the changes, splitting is usually th=
e
recommended way.

>=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixfmt-m420
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c=20
> > > b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index f3584bc3e278..20c83a4c02d6 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1368,6 +1368,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdes=
c=20
> > > *fmt)
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_NV12MT:	descr =3D "Y/UV 4:2:0 (64x32 M=
B, N-C)";=20
> > > break;
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_NV12MT_16X16:	descr =3D "Y/UV 4:2:0 (1=
6x16 MB,=20
> > > N-C)"; break;
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_P012M:	descr =3D "12-bit Y/UV 4:2:0 (N=
-C)"; break;
> > > +	case V4L2_PIX_FMT_NV12_COL128:=C2=A0 descr =3D "Y/CbCr 4:2:0 (128b =
cols)";=20
> > > break;
> > > +	case V4L2_PIX_FMT_NV12_10_COL128: descr =3D "10-bit Y/CbCr 4:2:0 (1=
28b=20
> > > cols)"; break;
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_YUV420M:	descr =3D "Planar YUV 4:2:0 (=
N-C)"; break;
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_YVU420M:	descr =3D "Planar YVU 4:2:0 (=
N-C)"; break;
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_YUV422M:	descr =3D "Planar YUV 4:2:2 (=
N-C)"; break;
> > > diff --git a/include/uapi/linux/videodev2.h=20
> > > b/include/uapi/linux/videodev2.h
> > > index 1c9e1275c422..f93e341a1dd7 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -807,6 +807,10 @@ struct v4l2_pix_format {
> > > =C2=A0 #define V4L2_PIX_FMT_QC10C=C2=A0=C2=A0=C2=A0 v4l2_fourcc('Q', =
'1', '0', 'C') /*=20
> > > Qualcomm 10-bit compressed */
> > > =C2=A0 #define V4L2_PIX_FMT_AJPG=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc(=
'A', 'J', 'P', 'G') /*=20
> > > Aspeed JPEG */
> > > =C2=A0 #define V4L2_PIX_FMT_HEXTILE=C2=A0 v4l2_fourcc('H', 'X', 'T', =
'L') /*=20
> > > Hextile compressed */
> > > +#define V4L2_PIX_FMT_NV12_COL128 v4l2_fourcc('N', 'C', '1', '2') /*=
=20
> > > 12=C2=A0 Y/CbCr 4:2:0 128 pixel wide column */
> > > +#define V4L2_PIX_FMT_NV12_10_COL128 v4l2_fourcc('N', 'C', '3', '0')
> > > +								/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in
> > > +								 * a 128 bytes / 96 pixel wide column */
> > >=20
> > > =C2=A0 /* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 =
bits=20
> > > unused */
> > > =C2=A0 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', '=
b') /*=20
> > > IPU3 packed 10-bit BGGR bayer */
> >=20
> > Can you add this format to v4l2-common please?
>=20
> You're referring to the 4CC definitions, I assume?

./drivers/media/v4l2-core/v4l2-common.c is a library to centralize common c=
ode
like pixel format handling. This is mostly for raw pixel formats, I don't t=
hink
bayer fits well there (but someone would have to give it a thought). We
recommend adding new formats into that library and using that library so th=
at if
someone else needs to calculate strides and buffer size, they can do with t=
he
same code and avoid recurrent mistakes. If a mistake get made, we have a si=
ngle
place to fix.

Nicolas


