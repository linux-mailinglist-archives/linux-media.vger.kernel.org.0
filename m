Return-Path: <linux-media+bounces-19903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFB79A4325
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 18:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E87251F24186
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 16:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A9B200BA7;
	Fri, 18 Oct 2024 16:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eB9eTOCb"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4AF13BADF
	for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 16:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267351; cv=none; b=DoUX2CkfC3HeJA78dJaiBj3bIxMMNahlr1xKr1quxge4QutjYBwqHmGhSw2YxFQIlYO9/jxvWLASGyErH80GVhB6umHWbeIHyOUaBnjbwspMgKsHYWic+qJaHaHvttEslbGfoNMCpRxqlxiHVKl1wnqYW3FWYpTEz6rS/zTubVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267351; c=relaxed/simple;
	bh=OPSkAYRoP901D3yRcsJem91D9MN0fUbD+FwAftwbMO8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ydcvx82C2dTUKx3aLLXHHG+iDZw9Hlaopw1s5w6ZAu/0+WtNrEwoAKBRzwZ6PX+wbfEGA/ljX7Di/m14tDMcKBslLbn7J7o+WAwpIBIHBN6jvZ4HIqjpIXx8S4F0krQm8SBfST2fANc2fyx+IrzV3zd+umIDTMJg56hw4dnxjrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eB9eTOCb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729267348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ijCf6lKqnlQnUlCDVFFt7Jh8bQ9sTmRHD5CZvm8uUw=;
	b=eB9eTOCbgepNBNQyNEUvyWzvUoa7iUjfnU7Z+qwEziw+Y7QRtaNYaBeaW1kiMq+Wo67Lq1
	BOECcafeHfV0rcQxxlm1CBjkMcZ2nSSxMxbeizBu+ZqSEyFKPy67RzeFBW8kU59T3XQtRi
	bUgMe9UpGdi9bk978atHL65JvcDscrk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-bJaM-lrWPOO8cMW__uPpUw-1; Fri, 18 Oct 2024 12:02:27 -0400
X-MC-Unique: bJaM-lrWPOO8cMW__uPpUw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d4854fa0eso1308396f8f.2
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 09:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267345; x=1729872145;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ijCf6lKqnlQnUlCDVFFt7Jh8bQ9sTmRHD5CZvm8uUw=;
        b=PEB1aPnfD80m2ou+XKfflTNLNm0eCr5Qw1Z1W73jsESkL6ud71RiJKq8S/LulbXVKP
         lR1Xie+J5bGdBpUUnZKnB78Hc8wY7Mk3plnblM3IPUbuweT4oQzKquIqiGKm6QUYendO
         gFXO3azk+T30errc/bRoiVvtEJh7EuKX3phCiy3ehMTDCiFz66uZRzhffw/ES4E5dlKl
         caRWBRHeh7T9ySdPu8ia1sgcGOJRIuIp23XhgX+cNb6sUeyVdnJi5x383a59cj7KyOxx
         H7MTIRhwR5YIGS3Jl0fAHnrFwJHIyiOTFcmH5K9iLWzEGjntJBJXloOjX1qkd/IsOmug
         mI5g==
X-Forwarded-Encrypted: i=1; AJvYcCV1OOfZy6u0eOUOpdK/yHq66z1BGvGZHM/OkVtVazwGMCccuHnJRboBHtJdccrJQ3kBjmbBhYYqXwHbNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Bb8UG+1W0XJ3nl9CbRE5zNf331mih1n3f4QmUYu25LCOue/w
	cfSDqH9S6knWxZ1Bher+hWWN8vYcr89/4QxabTofmzB9mmZiUNLdK+bX9ACheNqsQUeha6W6ocZ
	357sBoXQwktoy233XYq12bzXx+lcRt7ifKDdvy+K2RiOppjvOWPomZJG+4P8a
X-Received: by 2002:a5d:6751:0:b0:37d:480f:9a6c with SMTP id ffacd0b85a97d-37eb4863233mr2625243f8f.25.1729267345471;
        Fri, 18 Oct 2024 09:02:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSs1eaxMRn30GU0vel+//Rph9VfVO9kNnZNT/e85t8OLXBDbOSYNXXsrpZww1XYw2Omx6LlQ==
X-Received: by 2002:a5d:6751:0:b0:37d:480f:9a6c with SMTP id ffacd0b85a97d-37eb4863233mr2625180f8f.25.1729267344903;
        Fri, 18 Oct 2024 09:02:24 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dfa:6500:de04:18f8:f776:727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf06d65asm2256542f8f.50.2024.10.18.09.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:02:24 -0700 (PDT)
Message-ID: <4f3327b93a718352c14fb20ee2d26c9eaa3e164a.camel@redhat.com>
Subject: Re: [PATCH v2 04/13] media: dvb_frontend: don't play tricks with
 underflow values
From: Philipp Stanner <pstanner@redhat.com>
To: Kees Cook <kees@kernel.org>, Mauro Carvalho Chehab
	 <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Kevin Hao <haokexin@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Kees Cook
	 <keescook@chromium.org>
Date: Fri, 18 Oct 2024 18:02:23 +0200
In-Reply-To: <4D0C7D12-C645-4766-B7B1-0B34B2129579@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
	 <8d6193ed8d53ce94d595cb431627bbc7783c0e4c.1729230718.git.mchehab+huawei@kernel.org>
	 <ab51f981844c700d4e66b366c8d2abde7c5947bf.camel@redhat.com>
	 <4D0C7D12-C645-4766-B7B1-0B34B2129579@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-10-18 at 07:37 -0700, Kees Cook wrote:
>=20
>=20
> On October 18, 2024 4:44:20 AM PDT, Philipp Stanner
> <pstanner@redhat.com> wrote:
> > On Fri, 2024-10-18 at 07:53 +0200, Mauro Carvalho Chehab wrote:
> > > fepriv->auto_sub_step is unsigned. Setting it to -1 is just a
> > > trick to avoid calling continue, as reported by Coverity.
> > >=20
> > > It relies to have this code just afterwards:
> > >=20
> > > 	if (!ready) fepriv->auto_sub_step++;
> > >=20
> > > Simplify the code by simply setting it to zero and use
> > > continue to return to the while loop.
> > >=20
> > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> >=20
> > Oh wow, back to the big-bang-commit ^^'
> >=20
> > So is this a bug or not? It seems to me that the uint underflows to
> > UINT_MAX, and then wrapps around to 0 again through the ++..
> >=20
> > I take the liberty of ++CCing Kees, since I heard him talk a lot
> > about
> > overflowing on Plumbers.
> >=20
> > If it's not a bug, I would not use "Fixes". If it is a bug, it
> > should
> > be backported to stable, agreed?
> >=20
> > Plus, is there a report-link somewhere by Coverty that could be
> > linked
> > with "Closes: "?
>=20
> Yeah, this is "avoid currently harmless overflow" fix. It is just
> avoiding depending on the wrapping behavior, which is an improvement
> but not really a "bug fix"; more a code style that will keep future
> work of making the kernel wrapping-safe.

Alright, then it shouldn't be backported, ack?
So I'd drop "Fixes:"

>=20
> >=20
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >=20
> > Anyways, this in my eyes does what it's intended to do:
> >=20
> > Reviewed-by: Philipp Stanner <pstanner@redhat.com>
> >=20
> > > ---
> > > =C2=A0drivers/media/dvb-core/dvb_frontend.c | 4 ++--
> > > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/media/dvb-core/dvb_frontend.c
> > > b/drivers/media/dvb-core/dvb_frontend.c
> > > index d48f48fda87c..c9283100332a 100644
> > > --- a/drivers/media/dvb-core/dvb_frontend.c
> > > +++ b/drivers/media/dvb-core/dvb_frontend.c
> > > @@ -443,8 +443,8 @@ static int
> > > dvb_frontend_swzigzag_autotune(struct
> > > dvb_frontend *fe, int check_wra
> > > =C2=A0
> > > =C2=A0		default:
> > > =C2=A0			fepriv->auto_step++;
> > > -			fepriv->auto_sub_step =3D -1; /* it'll be
> > > incremented to 0 in a moment */
> > > -			break;
> > > +			fepriv->auto_sub_step =3D 0;
> > > +			continue;
> > > =C2=A0		}
> > > =C2=A0
> > > =C2=A0		if (!ready) fepriv->auto_sub_step++;
> >=20
>=20
> But this change seems incomplete. The above line is no longer needed.

I haven't super duper intensively reviewed it, but wouldn't make that
statement =E2=80=93 all the other branches in the switch-case reach this li=
ne.
And auto_sub_step might be changed above in the if-check again if
lnb_drift has changed; and it is changed in the switch-case.

>=20
> And I actually think this could be refractored to avoid needing
> "ready" at all?

Could be. But that'd be indeed some work to get it right without
introducing a subtle bug, and Mauro just seems to want to fix a warning
he encountered on the way.

Thx
P.


>=20
> -Kees
>=20


