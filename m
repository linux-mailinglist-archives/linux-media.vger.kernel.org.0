Return-Path: <linux-media+bounces-13586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D0790D961
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE8F21C248E8
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A54313DB98;
	Tue, 18 Jun 2024 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="gCCEbTr3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A686B74070
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 16:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728453; cv=none; b=d9fm39ZLKkHLhbkdjb6f5iPg8vW3iZmBt9h9YfCreR6U16+i9SAHbLRDIHOW644HOrHtQeDhCJLECDi3ZEp77DmYqlX+AV/h3cVllpmVxFQhKGZfzuaMsMAMCQtYnoPOyoBDozUVKck+JQTsec75AU2YLO4onAEusmQ4St2B/PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728453; c=relaxed/simple;
	bh=JwSJvOkZ9FK72lyrJf2XHFu9wWCzAyRi9vx/g3UaMRM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r79QGcIcFtAGjHOE/XggUJoRey55hl19NVDAmni9/f4JMvTHh8wxRXXx5fJ9pzjDf09UIqNS7JKqxT0mNtmcjijrXAbBVba/gtKgyFjMFByKI8Bt+4aC51dVMY7nuNX1cujLogmXJ4nuZsPUj2SilPEzBxw4ggmgdJofc6DLGfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=gCCEbTr3; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6b501a4344bso826166d6.3
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718728450; x=1719333250; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UyATPdua0xIvG9IEZTu2KPUCxjrD23ixmP+LULFeCqg=;
        b=gCCEbTr3uHSVavBggfirSoulSDm89IEDZTNmLhU3RVoZeBqnAlI/qGBUAR329w46Ns
         UOn+7ZaTgv2P2e20AgB6S/CkqGJLuYNh/EL+eGbckBNR1NG6jn09p40rRUGUPMPYZFwy
         5RrZM61CPPZXvaWDMvaWQxsOCKyW+xCD2K/DZ9LYXTTAJOomeEat0nuAc5eaCPtkXq1e
         /UvYb5Gpnkv6XBO4Sl67KLXmvVo3sxsZOzyoO38gepmPlMoOMTwzHSqKkt+OcL9sXQST
         2m8Cg52bjPywD/64H9fAyJ7zqvXuB36qXThHootCje1QO57bkXAAPV7rXHwNexK6G226
         e05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718728450; x=1719333250;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyATPdua0xIvG9IEZTu2KPUCxjrD23ixmP+LULFeCqg=;
        b=OjFkGbp00zNdI981dEDcoY66RhX3SPQtTOJ591zoVVFoJ3giDduuldaUAvD38UvNK3
         oNZVTi0kcO6OwkDzLcEeJNz/OAp6JF4DGE+kuuW7k/5j3KP5iVkh910N97eMezy1Q2Pe
         dhHM1b5/BJPtWMMNmSFpWjwyWRYH+GJbzwvNkcLvbF/jChKXII9gDHaqek7LCfJwVqG0
         Dh0VSFMUy04nKuQIsGEM31KuNfOrT5skhh8M96eYT5pYTaPpJHgBwyMo582IW8lEaEoC
         ZqA0fnsJJKrl8bbLKyJzWwl0dbeE5Np5mC8E261at02MDj/GSN5cmJ9e/aOw/G6mAwAu
         HV3w==
X-Forwarded-Encrypted: i=1; AJvYcCVnSGIDEixIrud9dhhfbN3JxkRCB0FyWNwpGv3TlGic7pje9bZlM+kps0hY324DY9o83sNhhbQdJ4LcKanCK45qqq72LmLFBcmEWFY=
X-Gm-Message-State: AOJu0YycdmXeNe/LxCnxQ9H0gj38jNfcINwelGdjApn33J/vzq1+a3kD
	/h1yO7aWbqBDqw9BpdOMi0RZzFRIPWkKkM/HOSty3rylgUbQ/hf3JdsPCQYfJMA=
X-Google-Smtp-Source: AGHT+IHobfGlJhLnHEFotyk1CGxdoLtB4S8IrrxZ0v/h08LqEqBMy+9LORb68TjsMWCIXoDBM5yDLA==
X-Received: by 2002:a05:6214:80c:b0:6b0:724a:6ed9 with SMTP id 6a1803df08f44-6b501e1e3acmr2439486d6.17.1718728450578;
        Tue, 18 Jun 2024 09:34:10 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5fb9::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5bf1f96sm68175396d6.12.2024.06.18.09.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 09:34:10 -0700 (PDT)
Message-ID: <0e8561108c4fc99291ad7cdc0c6af2dbb8e58f02.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Detlev Casanova <detlev.casanova@collabora.com>, Jianfeng Liu
	 <liujianfeng1994@gmail.com>
Cc: alchark@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org, 
	cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org, 
	didi.debian@cknow.org, dsimic@manjaro.org, gregkh@linuxfoundation.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, robh@kernel.org, sebastian.reichel@collabora.com
Date: Tue, 18 Jun 2024 12:34:07 -0400
In-Reply-To: <4302165.yKVeVyVuyW@arisu>
References: <4116468.VLH7GnMWUR@arisu>
	 <20240618121329.79936-1-liujianfeng1994@gmail.com>
	 <4302165.yKVeVyVuyW@arisu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le mardi 18 juin 2024 =C3=A0 08:39 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> On Tuesday, June 18, 2024 8:13:29 A.M. EDT Jianfeng Liu wrote:
> > Hi Detlev,
> >=20
> > On Fri, 14 Jun 2024 21:56:27 -0400, Detlev Casanova wrote:
> > > +		.frmsize =3D {
> > > +			.min_width =3D 16,
> > > +			.max_width =3D  65520,
> > > +			.step_width =3D 16,
> > > +			.min_height =3D 16,
> > > +			.max_height =3D  65520,
> > > +			.step_height =3D 16,
> > > +		},
> >=20
> > I think the min/max width/height are incorrect. From rockchip's TRM V1.=
0
> > Part1 page 374, supported image size is 64x64 to 65472x65472.
> i,
> Page 374 shows the sizes for h265. h264 is the next table, where 16x16 an=
d=20
> 65520x65520 is documented.

Just a theory, but 64x64 looks like Mali GPU requirement to me. Can you giv=
e
more details how it fails exactly ?

Meanwhile, if fluster suite does not exercise it already, we can craft a st=
ream
to verify the its decodes fine. We also have issues in rkvdec were the driv=
er
reports CAPTURE queue constraints for OUTPUT formats.

Nicolas

>=20
> > And my
> > chromium can't use rkvdec2 because min width/height are set to 16, whic=
h
> >=20
> > will cause error at here in rkvdec2_h264_validate_sps:
> > > +	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
> > > +	    height > ctx->coded_fmt.fmt.pix_mp.height)
> > > +		return -EINVAL;
> >=20
> > width is 16, height is 32 while ctx->coded_fmt.fmt.pix_mp.width and
> > ctx->coded_fmt.fmt.pix_mp.height are both 16.
>=20
> Maybe
>=20
> if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> 	height *=3D 2;
>=20
> is causing issues in this case, I can check.
>=20
> > After changing them to 64 my chromium can use rkvdec2 to decode h264
> > videos now.
> >=20
> > Anyway many thanks to your amazing work!
> >=20
> > Best regards,
> > Jianfeng
>=20


