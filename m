Return-Path: <linux-media+bounces-31308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B36AA0C32
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 14:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA8C73B4AEB
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D5C2C375B;
	Tue, 29 Apr 2025 12:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Dn7mn+UJ"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A44A2C17A7;
	Tue, 29 Apr 2025 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931118; cv=pass; b=VQDvyATm6/Cuebb/jdvw7T+lPSqyG9tSukNKmwF4xpvo8zeU6c5abrE6eNuZoXWSkBoOVFZHQ+ooWJBOmiw3mqawvJPTXy2H6O7uYeWZQ+zhhSzMmErTO68ZYV9MKLGekKJ3miVr+5v3wvovH16gssJ1dsHAYJlKdVYigKItSA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931118; c=relaxed/simple;
	bh=DEQeFsMbhzlHPT/Sx8vc3XKjQ6HtI/zCWH8m7IsAtG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gN+I+mkdVP3aozmgAIt4hw4bW09e8BYipPuzWBJsF6AQhT/6i62S9VllIvgL1NJqxCFdeB91+NnM1wmqymmPPbXxErs6u8nBfTv2g4Q8BNnN3Erk0VBs1wOFotnYC3tndAiKcTsue24c4GJ6QPVaF0Jrwtb44esEf5ltU0VhcMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=Dn7mn+UJ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1745931096; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LP4S9htb/tdPQTA3dqPD4Eu5tvwNdQS9ERqyw4qzqIOVSFZWqRLPR3P03Uqp20uF0+wyoQMIBoe7NlNfw4gts3e4KQafXgjKYpt/Jb+jVD3vhgmMTRgOUMxxxJGRYiozBNE/zbvwOD7yAPKHApCUHE0FsRMFEHzdUH5ci4SFTI0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745931096; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wAqddgCvCAXmKLXb0X53fyiZ4qXPPUZR54/Xu7bltQs=; 
	b=DAyh9eHU8Fl/fxMo2EBlE00D71Yb1Wiwc1Yb0lkBwAOQRu5ZFUBq7oLbqmPEKmwqg2qqHLM4j5uejbanXByLdLyN3+hg3/xYbJEfykwpJd+rr75d7OzjoaZYQdaTBDihqjJ5tQfHS+iQuYUnhA90irck6RFMBkSOhTsHgPN+UY4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745931096;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=wAqddgCvCAXmKLXb0X53fyiZ4qXPPUZR54/Xu7bltQs=;
	b=Dn7mn+UJnXsXb8xFEEs9Tsu9KdhEDs9rWgBgndz7C+uX1fPse/Zq2PDJRV5pytYY
	UCoZKhbdT4o/doQlSseVlwKcvtREcpR92n8HIxk/ehXiTv5QVgDhyM3X7HK6faheHDQ
	+0XElXoFKUZsOUWkV6VbmneN1WisJojwYPztEMEY=
Received: by mx.zohomail.com with SMTPS id 1745931094377930.5836650113462;
	Tue, 29 Apr 2025 05:51:34 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] media: verisilicon: Free post processor buffers on error
Date: Tue, 29 Apr 2025 08:51:32 -0400
Message-ID: <2782084.mvXUDI8C0e@earth>
In-Reply-To: <d901822b2710a2d642f1372fbfb53f99f1e60b2e.camel@collabora.com>
References:
 <20250425192447.227063-1-detlev.casanova@collabora.com>
 <d901822b2710a2d642f1372fbfb53f99f1e60b2e.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

On Monday, 28 April 2025 13:25:59 EDT Nicolas Dufresne wrote:
> Le vendredi 25 avril 2025 =C3=A0 15:24 -0400, Detlev Casanova a =C3=A9cri=
t :
> > When initializing the post processor, it allocates the same number of
>=20
> What do you think reworking as:
>=20
>   During initialization, the post processor allocates the same number of
>=20
> > buffers as the buf queue.
> > As the init function is called in streamon(), if an allocation fails,
> > streamon will return an error and streamoff() will not be called, keepi=
ng
> > all post processor buffers allocated.
> >=20
> > To avoid that, all post proc buffers are freed in case of an allocation
> > error.
> >=20
> > Fixes: 26711491a807 ("media: verisilicon: Refactor postprocessor to sto=
re
> > more buffers") Signed-off-by: Detlev Casanova
> > <detlev.casanova@collabora.com>
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> If you are fine with the suggestion, I can make the changes while
> applying.

Yes, that's goot for me.

Detlev.

> > ---
> >  drivers/media/platform/verisilicon/hantro_postproc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c
> > b/drivers/media/platform/verisilicon/hantro_postproc.c index
> > c435a393e0cb7..9f559a13d409b 100644
> > --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> > +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> > @@ -250,8 +250,10 @@ int hantro_postproc_init(struct hantro_ctx *ctx)
> > =20
> >  	for (i =3D 0; i < num_buffers; i++) {
> >  		ret =3D hantro_postproc_alloc(ctx, i);
> > -		if (ret)
> > +		if (ret) {
> > +			hantro_postproc_free(ctx);
> >  			return ret;
> > +		}
> >  	}
> > =20
> >  	return 0;





