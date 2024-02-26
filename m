Return-Path: <linux-media+bounces-5947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF33786770D
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 14:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65828285D4F
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 13:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402AA1292ED;
	Mon, 26 Feb 2024 13:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="IunMvEZv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809531292C0
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 13:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708955100; cv=none; b=es2Vf+3Msy5RD+xpq1luI3jDckqq1P50k2RKc8/xmEIZwj0WRhAR+zlidag8y7YbqawERf4A1S0gVm78DptSzdeMzoGbU0x1Q1Tj+NXpQcbnipqSU89wjxXIfPCl1ddZ6p5Z0IhilVx54uNo+m7TDtFEEV5j4kkH4kWQ+2sQ0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708955100; c=relaxed/simple;
	bh=VMg8+Ea3uqFa0H9NyTpNUvxdZPN52+B8XlGqOd/rdyI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JeuK9IVGuazpUJKjVHvtxnHHaKyecSPJu9Mvna74ySL9QFY2RWO6RK9kf4MJS2Rqb89qP6Sn8dwwfxyZkq80MkgjzPZcgKa0tAKJuzaX6Lf4WVoifz/oimNabm6PwPQb1aLxxEIlaaHrrwJO2jagWHFm9oifoY31zf6Ebnqprvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=IunMvEZv; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-68fb7928970so9941376d6.2
        for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 05:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708955096; x=1709559896; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMg8+Ea3uqFa0H9NyTpNUvxdZPN52+B8XlGqOd/rdyI=;
        b=IunMvEZvuHaQe9v4s6GMKY2lU/U0JldThaOvZ8g2y5RNHRP2xDcUFkFnyBOTnJtznY
         4o9uznLrud6qZJvA5EU1DuXy7VZZ9qlop8AYAXMoj1KZfUlB7b6wVN7hLPvm0KbtwfYw
         IxgyI72xW7KPsJQvmOryJqm8d3NxC63Jn9noRUaAQU107BNFLfIRkZiONv0k5JAAY2sO
         EGeo6CwcKGrvu/yFewqbjeskP+IQaMZVrEtfoFV8LK1Dl6oHnM2UcCrs1kuVFp8v9mFn
         vf9Ae5EDp2NcZAPm2XH/97+ELXBseEKhqdluIVdZOuBY88Qji9MljEe8bWNHZ+DXxjdw
         hXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708955096; x=1709559896;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMg8+Ea3uqFa0H9NyTpNUvxdZPN52+B8XlGqOd/rdyI=;
        b=SS/AwLx6XcQCBsv2sl5Nt68csyU05NT85UAA6vfqdKsU0tsmlRTGzmkqS5WUPrGQdD
         YAJQxkQKcu8r+lU3PFc9pIw0Lu3z7oJXxqNr8qwJUL+qEBb5W+v+fxVabStdVKgHvpVp
         Y+3eIdb7ak64oyJOKscIPp9drf8zObjQws9+oJMRnRhboelrddTT83AYk3TN3pCnseQA
         B6rDfr7qs9ohZTT2PZ5tMDOMTD6C6ZUUNKGZViTNWQ5IEqpFas5Epuh+n/zFk4goXHte
         DEoQA5hQAwSaMSY+ZEe3jel9Ky8/LARop4OI/uWnaDnRKVK+0kVTVNSwL74PNiBIsWBH
         kOLA==
X-Forwarded-Encrypted: i=1; AJvYcCVuzG1TvhYKrlXBM04PKhwCkfk6lyyqdkfCxC4hIboPS8kId0plEHcp6/i1o3v6QjWCIMHAIOpHzbuvIo5nUI0xYon+ztSRffQenh0=
X-Gm-Message-State: AOJu0Yz8cyQRfXYBjRBy8PrO0ckzmHYQ8gDm5lQLKDbEXQVsmpovU3ow
	l5DzTV0DtJf+mwC2uJIMgfeNq9nxhQop2I/wq12u4nBxK6L0/auORnyeiEIVuJY=
X-Google-Smtp-Source: AGHT+IH/8ZEOeK9MYTO1k4GLjMqQxDXvjaSDIW+jfCGs38uRWmqvGfIAwoyuKUTn9N9g/LTYAOsp+A==
X-Received: by 2002:ad4:5dcf:0:b0:68f:2a5e:4fa5 with SMTP id m15-20020ad45dcf000000b0068f2a5e4fa5mr7751172qvh.11.1708955096410;
        Mon, 26 Feb 2024 05:44:56 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id op10-20020a056214458a00b0068ff8d75a90sm2170842qvb.19.2024.02.26.05.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 05:44:56 -0800 (PST)
Message-ID: <e1d574984ce4c6f11f87b01997708aca120c6691.camel@ndufresne.ca>
Subject: Re: [PATCH 1/5] media: chips-media: wave5: Convert to platform
 remove callback returning void
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jackson Lee
	 <jackson.lee@chipsnmedia.com>, Nas Chung <nas.chung@chipsnmedia.com>, 
	kernel@pengutronix.de, linux-media@vger.kernel.org, Sebastian Fricke
	 <sebastian.fricke@collabora.com>
Date: Mon, 26 Feb 2024 08:44:55 -0500
In-Reply-To: <i5fqdbsn2xq7hq5rtgz6mfmbftn5liijdrb3f2ck7h2zeofaow@ybscvafh7zre>
References: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
	 <dfcaf3d23ea35655d8b3a9254ee00f40c20c95c4.1708692946.git.u.kleine-koenig@pengutronix.de>
	 <f88a238f96215aef5a05d9d532c199eaea82883e.camel@ndufresne.ca>
	 <8cd8e8cc64458b93cd25b1f44a2a143e60084499.camel@ndufresne.ca>
	 <i5fqdbsn2xq7hq5rtgz6mfmbftn5liijdrb3f2ck7h2zeofaow@ybscvafh7zre>
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

Le samedi 24 f=C3=A9vrier 2024 =C3=A0 09:52 +0100, Uwe Kleine-K=C3=B6nig a =
=C3=A9crit=C2=A0:
> Hello Nicolas,
>=20
> [reordered the mail a bit to give understandable context.]
>=20
> On Fri, Feb 23, 2024 at 01:20:59PM -0500, Nicolas Dufresne wrote:
> > Le vendredi 23 f=C3=A9vrier 2024 =C3=A0 13:19 -0500, Nicolas Dufresne a=
 =C3=A9crit=C2=A0:
> > > maybe its already been discussed but ...
> > >=20
> > > Le vendredi 23 f=C3=A9vrier 2024 =C3=A0 13:59 +0100, Uwe Kleine-K=C3=
=B6nig a =C3=A9crit=C2=A0:
> > > > The .remove() callback for a platform driver returns an int which m=
akes
> > > > many driver authors wrongly assume it's possible to do error handli=
ng by
> > > > returning an error code. However the value returned is ignored (apa=
rt
> > > > from emitting a warning) and this typically results in resource lea=
ks.
> > > >=20
> > > > To improve here there is a quest to make the remove callback return
> > > > void. In the first step of this quest all drivers are converted to
> > > > .remove_new(), which already returns void. Eventually after all dri=
vers
> > > > are converted, .remove_new() will be renamed to .remove().
> > >=20
> > > What if we have another screw up ? remove_new_new ? Why not just remo=
ve the int
> > > across the tree instead ? Or perhaps its a two step plane ?
> >=20
> > Please ignore my comment, sorry for the noise.
>=20
> Is that an Ack? :-)

You have my:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Ideally I would have liked to see Nas or Jackson sends their Ack as they ar=
e
maintaining that driver. But I'll leave that to Sebastian and Hans to decid=
e.

Nicolas

>=20
> Best regards
> Uwe
>=20


