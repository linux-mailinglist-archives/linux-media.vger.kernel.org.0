Return-Path: <linux-media+bounces-19855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A619A3D70
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DF2B1C20B66
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 11:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7641D86CD;
	Fri, 18 Oct 2024 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IISmiJoB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA3C4207A
	for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729251867; cv=none; b=rmOa6exvcsYfJercpQCM/tSCZJSjtz1lHG0mq/ttcj91PEZLkaVjtHHZocqeK6kXIVaAidA4R05G3yusKrp557wxbd41M0KAgle5VTK0HHUxwBcbP4xTG6JE/RiNugHQ5Gif1rqhibdfoGiOUC3oQc+1jYPBTcqheJdwRV4++2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729251867; c=relaxed/simple;
	bh=YPmbLkjhoSCx7Ka93jvwOwfbPUE1z48V2d4w/a9xZyg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fnkmYVXMwjqvXZIFwdX9/xUXJwAn/WPKeQSkNTm8KG7bf6XCjYCp/71wYp3bUzDLG8PLIYpwVNpVWlWNTn9TTmC+PuPkaPYb1mcUOUCOIH8m1pJWATLJH/yRMaInS9Rt5JrVQnSm6jdFnaQrVowtPgMt3vy8u2PGs680jKX+Cjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IISmiJoB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729251865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlu6bqFSROl2zXVvkaXLKd26K3gvldoDh8YudQBsgb0=;
	b=IISmiJoBAMuTWpAtWY1BSvVypFrHvTYqscSdaHgFckCO9F3C7oCbEZvX8dOqGQF1go7S8k
	A0nFFTpLoUTTRlHo5QcG+AAYoLoS2Kg/noDtBl47jWaMMhQEIe8t5XqAR568sBCmlqNOAr
	BytpxNkyL8aJCrtvoBdjri4dt2UjuwY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-khw7ZRP5OiaZHyhCEIqhrg-1; Fri, 18 Oct 2024 07:44:23 -0400
X-MC-Unique: khw7ZRP5OiaZHyhCEIqhrg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43163a40ee0so3068645e9.0
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 04:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729251862; x=1729856662;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hlu6bqFSROl2zXVvkaXLKd26K3gvldoDh8YudQBsgb0=;
        b=WKzycNjamE/OX8YEgFV5X4CPgrpDKUypiMVeYrn3VQTcnHc0Y16F0v0yUJvGrMhh9n
         FHIFfMwjlvceR87E8fj4JcD8bh0xxU1RyBwhLPfPDjzYdNOk7neO78qi9w7th6P3++n4
         qtZbNttE5geRDQACjKVs5z3ce5mWldgF+utc0q49oRueF+HTghslpKtV2uz1jopugPu5
         JtXKZRDDlFHOJ5n0LG8QTjlBkmWdgSve+KLllKMq41cxMqyXoI2QGMaQ/pKBJBbFYAl7
         8/GYBuv9OW2hiwkINdc9tB8wCF5DAeX1gDCogfxXg8TobY7zWq6ix9Twk0FA/twRscqz
         VdFA==
X-Forwarded-Encrypted: i=1; AJvYcCUoyTOf/M40ZNeqW0MRf29VeQdtqF/VGxTpTirX4aXmGkpM98Mdx+nYl1PUquczA4P88vNRUXb9Jkr7gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwANub6lhp3lBjwMK5T4otFFfB8KkwiXVAutq75HQXV/M66van
	asmJl7Dk9NCJIipG1pFA5j/Bz+0caUzWhK8KAnohPzxCQ+rlKC7n54IPqmX/rJPU81U8dqV/yUJ
	2UofzZgB6afFojrQuyAi3CT6kXOtDwtFx6w7z3ikWuhHemjYPuPQPAEbMsuYo
X-Received: by 2002:a05:600c:1d27:b0:431:4e25:fe26 with SMTP id 5b1f17b1804b1-4316169742fmr13710875e9.27.1729251861887;
        Fri, 18 Oct 2024 04:44:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiEer9ZpdYNq8qEEDZmN8/HtafItHRlxeS8dPJ/aHfakFzmlopU8rrHb/idJHOFD5P4NATjQ==
X-Received: by 2002:a05:600c:1d27:b0:431:4e25:fe26 with SMTP id 5b1f17b1804b1-4316169742fmr13710725e9.27.1729251861475;
        Fri, 18 Oct 2024 04:44:21 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf056418sm1727731f8f.34.2024.10.18.04.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 04:44:21 -0700 (PDT)
Message-ID: <ab51f981844c700d4e66b366c8d2abde7c5947bf.camel@redhat.com>
Subject: Re: [PATCH v2 04/13] media: dvb_frontend: don't play tricks with
 underflow values
From: Philipp Stanner <pstanner@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Kevin Hao <haokexin@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Kees Cook
	 <keescook@chromium.org>
Date: Fri, 18 Oct 2024 13:44:20 +0200
In-Reply-To: <8d6193ed8d53ce94d595cb431627bbc7783c0e4c.1729230718.git.mchehab+huawei@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
	 <8d6193ed8d53ce94d595cb431627bbc7783c0e4c.1729230718.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-10-18 at 07:53 +0200, Mauro Carvalho Chehab wrote:
> fepriv->auto_sub_step is unsigned. Setting it to -1 is just a
> trick to avoid calling continue, as reported by Coverity.
>=20
> It relies to have this code just afterwards:
>=20
> 	if (!ready) fepriv->auto_sub_step++;
>=20
> Simplify the code by simply setting it to zero and use
> continue to return to the while loop.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Oh wow, back to the big-bang-commit ^^'

So is this a bug or not? It seems to me that the uint underflows to
UINT_MAX, and then wrapps around to 0 again through the ++..

I take the liberty of ++CCing Kees, since I heard him talk a lot about
overflowing on Plumbers.

If it's not a bug, I would not use "Fixes". If it is a bug, it should
be backported to stable, agreed?

Plus, is there a report-link somewhere by Coverty that could be linked
with "Closes: "?

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Anyways, this in my eyes does what it's intended to do:

Reviewed-by: Philipp Stanner <pstanner@redhat.com>

> ---
> =C2=A0drivers/media/dvb-core/dvb_frontend.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/dvb-core/dvb_frontend.c
> b/drivers/media/dvb-core/dvb_frontend.c
> index d48f48fda87c..c9283100332a 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -443,8 +443,8 @@ static int dvb_frontend_swzigzag_autotune(struct
> dvb_frontend *fe, int check_wra
> =C2=A0
> =C2=A0		default:
> =C2=A0			fepriv->auto_step++;
> -			fepriv->auto_sub_step =3D -1; /* it'll be
> incremented to 0 in a moment */
> -			break;
> +			fepriv->auto_sub_step =3D 0;
> +			continue;
> =C2=A0		}
> =C2=A0
> =C2=A0		if (!ready) fepriv->auto_sub_step++;


