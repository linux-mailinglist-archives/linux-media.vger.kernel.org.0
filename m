Return-Path: <linux-media+bounces-26237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E98EBA38BE8
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 20:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACD7416C575
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 19:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF22235C03;
	Mon, 17 Feb 2025 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="AwXU7UGa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92838235368
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739819160; cv=none; b=S61jK6J5K6efVwzAcn5/TM9OZV91MUXlnV/MlpdpqBqpvPP1QZS2NNmciVX100j8auyuNkdIsLJUM1lM5R1fc8IOBeOBPAoxzpHxl21HrFNiqGOgC6COWly8gdTzz6nrPpAy7rLUG5UxbyJUoENnG3/HkyPnn3bj/ycCRPEPXic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739819160; c=relaxed/simple;
	bh=Uy7bfvJw8RlrpKRU07EJtsulfSTJvkw2tGDv9Ubp5YA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TRcd84C4XhmoTbzuX0xF+LLUNT5rH3wlPjQznGzkFGP0gbDI/4rOlr12NRuKGFfMi7C0lPBSklKO6Rps+MR6mAT8vc0tYdAQl/nmH3uEEjDftua7bkdflKRi4toe1T2+1ayYjpmPB+1J80p9wa2i1CKfkLn4+nQuEEN60F8iTpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=AwXU7UGa; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so40774946d6.1
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 11:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1739819157; x=1740423957; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Uy7bfvJw8RlrpKRU07EJtsulfSTJvkw2tGDv9Ubp5YA=;
        b=AwXU7UGaEjCu7kqwDKIyGDUz5K1Lcfzy/9DQvhznjKzLwRMZe7j7EVN5fPMShvR3kR
         7ZbI60SkHFmNuTmz0ee3TV9Q4Pm0GNrKohFbLd4S+XLNQfNeepHRcEsUIo571Raj9YJd
         epPimQnPq3TT2l3JDm7kNzpDGzLoVr2xmXsWlmdjJVXCqJc09PdHGIGqx7sCjOy1+MMv
         y1jBWfKrsnrbHs90FA7tPZA0dT5wV6mr1BeccA/dbGJTmAsLCAzwI7q+Fb+KgNAitZbw
         CERuR46ZocH9YFJ2lahPL7n5pLvIuSjv/p5SZ1Wa6Zz35+Ft8FVuK887ceviuC66jK1S
         XU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739819157; x=1740423957;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uy7bfvJw8RlrpKRU07EJtsulfSTJvkw2tGDv9Ubp5YA=;
        b=fQw/rX7sm2Cx6agyPm6E5qWQqqIv8QAkHJKvsZkTChoLDtcc0NOLNW84IKC9ovwS8Y
         oT56ETKWEZuzD0B/r5c4uJmtltnZ6BH9Tu7GLXhGfseXwVkSCgPFwRIfzOJqtjc/PVqp
         QEyi5WN2RDEjaN22lQDrbVx/yA1jSXh2UtRkR5cig1gW8ILJZBaqEzyE7BTmx/MatLjp
         jbUkkXYIHfGYcPweieQl6XIYP/6uyA+y125MDrfjQC6dcaPoyOiX/Mj+v4KzY7tJQOqQ
         srMBnZWWIrxjsRR/0lQ/ohCRWfMKN8W3TTcEmR4CRKhS+GHK7rZzRtaOM843uuSbvbdi
         FMWA==
X-Forwarded-Encrypted: i=1; AJvYcCX+v9oFSQk5OVyU3dANt1D+genQp7iNX9IYfPpJr/wvUcxLTxeopTy/q1YO5+gzreyZv6BD+c2uFNMlDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjNp6absBFJJi8h3A/bNgUVzRUo+G1M9mQn2sHoTOe9GXFF7OY
	7YRdup0aZAhP2hSIcNHllrW8A6uQmshc2h7e0ar5Tk/pAUO0UOazvNRfGpGrJR7Eof6UJZPxQzB
	Q55yaBw==
X-Gm-Gg: ASbGncvt1rTfgM4uFrmPrY1RbpdgdmsvWVJmWsUa6hrodc6WLBmV1t0i/yiCxIGZhjC
	fu8v4sBr9zmfKj6r96L6hy3+C+Om3dM+0XqnN2IbbDZ8ihw3HXK34k4RoehIOx8lvj0NKLOQiOs
	CvmZ+1zut70WtVVEkjuLKTD1+jLCgEsy866/QMtsdALEdplKVxDK6H9J3W16ZpWbouGo+kQ+zs5
	Q+HsjiJmxHV+I/sVPtd0qRgJOGboTIZZD6XjeaUMzaGLvdxhbO2Y6nW0r5YIuKOz6U7P1I0L8T0
	JQgXdtwlSX5rdsU5a4eS
X-Google-Smtp-Source: AGHT+IEVm/qS8+sAATqG7F8AY8HUtPRh48UpSTxbzNVblwHmHFMMVNsMAAF36/Tu7KZHT09P+riDEA==
X-Received: by 2002:ad4:5f0a:0:b0:6d3:fa03:23f1 with SMTP id 6a1803df08f44-6e66ccc1141mr151009216d6.13.1739819157370;
        Mon, 17 Feb 2025 11:05:57 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07c6081cesm565863485a.29.2025.02.17.11.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:05:56 -0800 (PST)
Message-ID: <d110f23a34f86f5a79e22aec9d27e047d363d20f.camel@ndufresne.ca>
Subject: Re: Questions about image size listed in VIDIOC_ENUM_FMT
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Zhaoxuan Zhai
	 <zhai.zhaoxuan@canonical.com>, linux-media@vger.kernel.org, Ethan Hsieh
	 <ethan.hsieh@canonical.com>, jianhui.lee@canonical.com, 
	guoqing.jiang@canonical.com, hverkuil@xs4all.nl
Date: Mon, 17 Feb 2025 14:05:55 -0500
In-Reply-To: <20250214164019.GB19466@pendragon.ideasonboard.com>
References: <96f6dff1-f5c7-4fab-94e1-47004dd916a6@canonical.com>
	 <3bd7482f-e41d-41df-9d25-08cb62d5d0db@canonical.com>
	 <Z67r76Fg-SOEbOJf@valkosipuli.retiisi.eu>
	 <4ab514ea0a365c758bbbc46382ad97ebc487d150.camel@ndufresne.ca>
	 <20250214164019.GB19466@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 14 f=C3=A9vrier 2025 =C3=A0 18:40 +0200, Laurent Pinchart a =C3=
=A9crit=C2=A0:
> On Fri, Feb 14, 2025 at 09:57:08AM -0500, Nicolas Dufresne wrote:
> > Le vendredi 14 f=C3=A9vrier 2025 =C3=A0 07:08 +0000, Sakari Ailus a =C3=
=A9crit=C2=A0:
> > > Hi Zhaoxuan,
> > >=20
> > > On Fri, Feb 14, 2025 at 12:19:23PM +0800, Zhaoxuan Zhai wrote:
> > > > Hi all,
> > > >=20
> > > > Sorry I made a mistake. It should be VIDIOC_ENUM_FRAMESIZES instead=
 of
> > > > VIDIOC_ENUM_FMT. I'm sorry for the mistake.
> > > >=20
> > > > =E5=9C=A8 2025/2/14 12:08, Zhaoxuan Zhai =E5=86=99=E9=81=93:
> > > > > Hi all,
> > > > >=20
> > > > > We are working on a camera driver. We plan to use v4l2 interface =
to send
> > > > > image data to users. We have a question we'd like to ask.
> > > > >=20
> > > > > The situation we are facing is as follows.
> > > > >=20
> > > > > We have an image processing unit that can process raw data collec=
ted by
> > > > > the sensor into the V4L2_PIX_FMT_NV12M format and send it to the =
user.
> > > > >=20
> > > > > However, due to the requirements of the V4L2_PIX_FMT_NV12M format=
, the
> > > > > width and height of the image must be divisible by 16.
> > > > >=20
> > > > > For example, when the sensor provides an image size of 2104x1560,=
 after
> > > > > NV12M encoding, it should be pading to=C2=A0 2112x1566. But the a=
dditional 8
> > > > > rows and 8 columns are padded with 0s and contain no actual conte=
nt.
> > > > >=20
> > > > > So, we would like to ask, in this case, what size should we list =
in
> > > > > VIDIOC_ENUM_FMT? Should it be the actual image size with content,
> > > > > 2104x1560, or the padded size, 2112x1566?"
> > >=20
> > > I'd say the actual image size (i.e. where you have pixel data). The
> > > sizeimage field needs to reflect the padding and the user needs to be=
 aware
> > > how the data is laid out in memory.
> >=20
> > I'd be happy to see spec clarification in this regard. I also think
> > that image size is best.
>=20
> Which part of the spec do you think should be clarified ? I've always
> thought that ENUM_FMT should report the image dimensions, with padding
> being reported through bytesperline and sizeimage. Is there a place
> where we say something else ? If so that should indeed be fixed.

When I read [0] and I don't seen note that explains the expectated
relationship between the results of that enumeration and the SELECTION
API.

That also makes me notice that there is not "queue type" specified,
which if not well documented will be ambiguous in M2M drivers.
Generally codec have more stuff specified, but for scalers, that feels
like a slight concern.

>=20
> > For NV12M, you can absorb the padding in per plane bytesperline /
> > sizeimage of the v4l2_format structure. That means the enumerated size
> > will match the format. Though, for NV12 (single plane) you'd have to
> > set at least the padded height and implement the SELECTION API to
> > return the cropping area.
>=20
> NV12 is indeed ambiguous, as vertical padding reported by sizeimage
> could be just at the end of the image, or split between planes.

The only way to use NV12 is to have the second plane at exactly
byteperline * height (which is true for all drivers, they have no
choices). But then, when a height padding is used it will endup being
returned by the S_FMT call, but also cropped by the selection API.

I believe the general idea is that the enum_frmsize describes the
display size (or applied to the bitstream/output queue perhaps). I
didn't re-read that part, perhaps this part is all right, but rather
complex, since you then enumerate the results of the combination of
S_FMT + SELECTION. Let me know what you think.

>=20
> > In practice, for application point of view, it would all have been
> > easier if the v4l2_format was always padded width/height, with the
> > display dimension explicitly provided. But I'm pretty sure upstream
> > drivers implement a mix.
> >=20
> > > Also cc Hans.
>=20

[0] https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/vidioc-enu=
m-framesizes.html?highlight=3Denum_framesize

