Return-Path: <linux-media+bounces-26162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9396A360D7
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 15:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 776801894EDE
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 14:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C8E266581;
	Fri, 14 Feb 2025 14:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="o3jLUM0C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A672F265CA9
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545032; cv=none; b=QagcQvoJyL+2PmBL8tZrXYrnzI7AZIKDtA9fNkTkUAj/1ugX39VmGH5z207Jj+5qJ674iHJOJJXV6ugfIB/LYoML+vJ5ZXlVGKNuXGnY911UuZqNv2p1qgRdGzGqoYr4aBR+EwrpAtKDzRprCVwdpktLu4QTR2kIVlCMILxYozo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545032; c=relaxed/simple;
	bh=eU6JtANmazyXVQUGhwEapzH6oqwLhuW0FlYA2qfVcdY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GmCdnaa7TRNY0peNQ/uZvqlO67wYm/dcR6KJwmw4hYV4B2HBnS9awvsuutduejR4MPFyJvQKQNflGIrkM4GsbQYjRVS2L96Cku+i8G0zCmSXoFRwBqv/lKiYcKWSs7iZ9xrzvTzeo5TT70Ubye1J8AE4idhUd+fIEYTqoM8niFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=o3jLUM0C; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c0893f9aa6so16804685a.1
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 06:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1739545029; x=1740149829; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eU6JtANmazyXVQUGhwEapzH6oqwLhuW0FlYA2qfVcdY=;
        b=o3jLUM0CrDJxyBr2TSGvs0IvIFQI2D5VWQlkU9O2yMRoB3vZVEuJqHMiru0AP5QRrP
         HlWG1yk5AsIg+wkCnCn+vAlXt53uctMIEfbv+87UqzMtU0oXXS1+uktAdOtl3a3IRrm5
         PVnpAaHdIYn7fofFb6yD0/Nn3ZaW8HRq4hq2TXyFvKJmHkn3chv8LllzwQVUQfwkyl22
         WYax9HTJY+EqI+T60bKRsy104YsB5YFCxCd7VKp2o19v5oRhrwQmTm2RrxYzr4sAbJjo
         ScViT7ZEQjtZSygCrhQUiUVUGO5azizUfLRsUdkUTf3yd8+h6KzgtBkJzpz+H3nqWiAd
         c0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545029; x=1740149829;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eU6JtANmazyXVQUGhwEapzH6oqwLhuW0FlYA2qfVcdY=;
        b=EO44dJuE1O40FHMh9LUwX0r++ziq/S0VamuCl+ByeXcqAJdAJo3uY+u92LJtsTkEXk
         qebWXgJ6L7kEgmQy+uaJ7LQkS8/dJ/0Nrv9WTeFyiEnD0tMmVN3dLYujZY0kmNJba8uE
         C8PbRJngAuj2MipAtr1BtFCI0NUGyYkCTVE+xBVVWkrxndGdU8ThP5NmGo49GT35P2C/
         gVV9IUtrgxNahJbnKCfI/6bncD54oU7OCX9GI+k5GzDxx9muw6iwtq1iD3elOa7+SC+9
         lDd4uwWC5ZpZYiuja5rf2QVd70PpeUWt23OKDqy4KzA28yfNW7IIdvFI2a8qaFISlxqL
         aw+g==
X-Gm-Message-State: AOJu0Yxf7ech92CXrtTiPvVCbZqd4KGJXrPxZbKl/jaSDoipGI1Al79J
	Sewg0e9yygE5ZnYTKo/ZSrN0cVFsno9cEqY5yEGD+3Tm4pRctAbWPwsiZNVP0eE=
X-Gm-Gg: ASbGncs4V3fQssdSRvbgHpVDUJ6B2THwoTr9fRrUJvUY3YyR3L8aWPmITHPW+GkhGLg
	t+IRQCalkOgcslZ59HDiJOWo4rXDVhkISyr+BJtI+lwVG05DF2k2cbNmb5X3dLxa5ChvghgCYOg
	AClSV9DkQQxl+NaRxbNkQHLPr9HKuEYkYKXgUxj6ubmehMc6Qd8XMaUMFkGG/wm8ygzxeQ3OZuB
	JoW+3HvzByOtjaC7MW4TIl/xbmjYJ2kqTLCFKnGyOEVKp85dSNrawnOWlgRHy106B+9Ntgh2PD/
	NjiYtL9R5PDyG0eXfCSq
X-Google-Smtp-Source: AGHT+IHc54MVXc09B6FjnGCHQbrSmPd0nRl3xcqLsHp3d1WrlZjMlXcCYiOnwXusV0xluoD+NgGdYw==
X-Received: by 2002:a05:620a:17a4:b0:7c0:7b3b:e5fd with SMTP id af79cd13be357-7c07b3be6bdmr989117785a.15.1739545029365;
        Fri, 14 Feb 2025 06:57:09 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07c6087d3sm212281185a.45.2025.02.14.06.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:57:08 -0800 (PST)
Message-ID: <4ab514ea0a365c758bbbc46382ad97ebc487d150.camel@ndufresne.ca>
Subject: Re: Questions about image size listed in VIDIOC_ENUM_FMT
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sakari Ailus <sakari.ailus@iki.fi>, Zhaoxuan Zhai
	 <zhai.zhaoxuan@canonical.com>
Cc: linux-media@vger.kernel.org, Ethan Hsieh <ethan.hsieh@canonical.com>, 
	jianhui.lee@canonical.com, guoqing.jiang@canonical.com, hverkuil@xs4all.nl
Date: Fri, 14 Feb 2025 09:57:08 -0500
In-Reply-To: <Z67r76Fg-SOEbOJf@valkosipuli.retiisi.eu>
References: <96f6dff1-f5c7-4fab-94e1-47004dd916a6@canonical.com>
	 <3bd7482f-e41d-41df-9d25-08cb62d5d0db@canonical.com>
	 <Z67r76Fg-SOEbOJf@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 14 f=C3=A9vrier 2025 =C3=A0 07:08 +0000, Sakari Ailus a =C3=A9c=
rit=C2=A0:
> Hi Zhaoxuan,
>=20
> On Fri, Feb 14, 2025 at 12:19:23PM +0800, Zhaoxuan Zhai wrote:
> > Hi all,
> >=20
> > Sorry I made a mistake. It should be VIDIOC_ENUM_FRAMESIZES instead of
> > VIDIOC_ENUM_FMT. I'm sorry for the mistake.
> >=20
> > =E5=9C=A8 2025/2/14 12:08, Zhaoxuan Zhai =E5=86=99=E9=81=93:
> > > Hi all,
> > >=20
> > > We are working on a camera driver. We plan to use v4l2 interface to s=
end
> > > image data to users. We have a question we'd like to ask.
> > >=20
> > > The situation we are facing is as follows.
> > >=20
> > > We have an image processing unit that can process raw data collected =
by
> > > the sensor into the V4L2_PIX_FMT_NV12M format and send it to the user=
.
> > >=20
> > > However, due to the requirements of the V4L2_PIX_FMT_NV12M format, th=
e
> > > width and height of the image must be divisible by 16.
> > >=20
> > > For example, when the sensor provides an image size of 2104x1560, aft=
er
> > > NV12M encoding, it should be pading to=C2=A0 2112x1566. But the addit=
ional 8
> > > rows and 8 columns are padded with 0s and contain no actual content.
> > >=20
> > > So, we would like to ask, in this case, what size should we list in
> > > VIDIOC_ENUM_FMT? Should it be the actual image size with content,
> > > 2104x1560, or the padded size, 2112x1566?"
>=20
> I'd say the actual image size (i.e. where you have pixel data). The
> sizeimage field needs to reflect the padding and the user needs to be awa=
re
> how the data is laid out in memory.

I'd be happy to see spec clarification in this regard. I also think
that image size is best.

For NV12M, you can absorb the padding in per plane bytesperline /
sizeimage of the v4l2_format structure. That means the enumerated size
will match the format. Though, for NV12 (single plane) you'd have to
set at least the padded height and implement the SELECTION API to
return the cropping area.

In practice, for application point of view, it would all have been
easier if the v4l2_format was always padded width/height, with the
display dimension explicitly provided. But I'm pretty sure upstream
drivers implement a mix.

Nicolas

>=20
> Also cc Hans.
>=20


