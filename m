Return-Path: <linux-media+bounces-11826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2BA8CD548
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 16:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C887B23D0F
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 14:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8057314B945;
	Thu, 23 May 2024 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="VQzAyuei"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A3A1E892;
	Thu, 23 May 2024 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716472973; cv=none; b=N2aPWe54iRnPqJSo6Pb9sKicXsmfRjvSyfVxa8hirx+c0+eyGl7ADzLwVCJyxk+fbAwkQSC9D4Q8h1CiWvNFQExY8icH9LPd+M0VAqABjdaLdwG4sLvqwy2knXS6QDDr0XutW/x6zxRxUWzw0WuPuZSpWN29TfjiBqwSJd36YRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716472973; c=relaxed/simple;
	bh=fbgaxrv1Zh4iR2Ow+D7HOwa6CnKsy9QA0D7kuV0ROwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0xev+4Ax3X9fuYNCx9yT1dmeQQv+sqnY9YIOiIl5wdX1s79uXwW9te8eq6iR7BS38DFgkcLtEIj9AV6kIVVFwTaHNYYkHmwcHjAe2QPmy0Cdt1FjtSPS1rBmuhwVKAzIukL1l2+p6j6WGqGukOXR+/fo3w20KWhn1n4DGmT/bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VQzAyuei; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716472947; x=1717077747; i=markus.elfring@web.de;
	bh=fbgaxrv1Zh4iR2Ow+D7HOwa6CnKsy9QA0D7kuV0ROwQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VQzAyueid3cWnvEB2xuZy5hR/Ztp057fM22jo+6L3rm0wS5bWrn4jDoPnbYrF3SI
	 Lpx7Hd5aoywIHLN3I+M6KjUBnIuOaC1jKCae9zG8Z6dZpgS5mr4Wx9CZmXHlwZIJ/
	 grJ/3GWiOi/e+SSeuCnQAEGiaM3MpH0KQwW9QROH3kIljTSSYc8sfmrEk3y3KkHXG
	 bTbI+H7/kwC4noatniion2vvIFX49YimdL05m2dFDUmsmhqdLYceEjO0P7g8I3fg2
	 ZRITjQ8aKiXJvBl2JIAwuzPr5QjvAs0DfqCFPMyBIeeJ+glKv5uYxl8ZgA1Lmdbmn
	 kxY+dhLXEG+7TEwosA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N9cHX-1sdgWM0EiL-015cNC; Thu, 23
 May 2024 16:02:27 +0200
Message-ID: <dfd94898-fabb-4089-8c04-42c2917f22dc@web.de>
Date: Thu, 23 May 2024 16:02:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dvb_ca_en50221: Fix a bug for detecting CI MODULE
To: YongSu Yoo <yongsuyoo0215@gmail.com>, linux-media@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <v4bel@theori.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, yongsu.yoo@lge.com
References: <20240308121021.1732-1-yongsuyoo0215@gmail.com>
 <f5272fc5-8d79-4717-9ad8-c503d8abda87@web.de>
 <CANXPkT59y5k_DXgk6DDHbGuR6aqwLN1ugeLhFrEmk=c246i9zg@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CANXPkT59y5k_DXgk6DDHbGuR6aqwLN1ugeLhFrEmk=c246i9zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1bsWcTPNCtxj98h2JDFU+8KOBxntYaFXabD8H6gAAic9rzEk8/w
 KwUcW7ST7xklvzWp6eG/r+fTMIUYOnMDcWtqkXyjJLt5OgVh617sU7YDpAIP0lZrTqTB3SJ
 Uze+WOPLJvYfcoDPQ59S6kxzXqQhe02ElY8db0sFlaSMS9F2Z70gda+Ua0YJxQ70N1yK/6h
 lDw5tC+86IRf0XWQkldIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Apd9wtQUyYQ=;cbhDbZnEGRIp0gjSS02Apj9uGQq
 n7Clsma8FDvEwc7sdK1n2ulSIQ0EAlR0Ae+HdHUA131uzEiDxn7oWJ7uRuGmWlHo+DP4J4kv4
 Qja72LIc/fL7WPuyfrBGVx3JKipyt+upfbAhqf9ZltcXoUocUrs7RqT4gY1rf0i68Sks/KZYp
 mZEnDzOgM4JT3hPt0nvUbY7K8u6AdcyqU7x5B+a9exCLCnRK2G7JjkvNbJ0kLJnuU/5FabRRc
 KDgueVUMNuTEGBWAP8hfvn7O2Wy4qlRktEK+bxG3s60BzmvU6LEaJV43BUJdE8+yezi15SZy6
 AFZW97HjEMyBKhGCi8V/ZHeisuerx+EuEwiwR3ej5kJblV1RMGn/BRoAcZAKH+6nYXt41EySW
 W4OTySCwTM3sHbHksEusrxzBvSaB7OenS+xWzp5qMXVnbLz9nGfotp4/0Zeim0JGpYPrDLfcP
 UstPFuVzNjr02WsiT2di4kg9oXuycxceQEgzYIdwq1hnGQumPqpEZ7/24IJNMhzdU3SszRr66
 +yCiqp7kpQojUOVZqUmSd5XQbXNiyvRBgRSo2wj15sEqC6eqLRkEn6mqvSb1fXOA63cGdLqyn
 QWi2RbbK1l8KLXd7IgXNfj5Fu2h0/yr8SsCE5Rt7nbgI4CTJeY9g/CjtGMsLpWAsBlmB+vidQ
 73AxFBl8AKpaSUsDqXBcL657PFAMilI3EZYF4COuDqgmc6N0RyfmzgI0IWeK++oChNSIxhz+m
 oloqCE6FdrhEH0jCH6zfujE5FqLXVvsFWSXvHMAX9fm6DXrlQqSvRVHqCan3mGrAYXb4op1oR
 KoiNP9rlWI9pq7ShaWWGMBUcbuz9mPOMZZ9CiS48+d6N8=

> 1. What is the "typo" ?

Please take another look at opportunities for spell checking
also in commit messages.

>>>> =E2=80=A6 right informtion. =E2=80=A6 a Bug. =E2=80=A6


> 2. Can you take some examples which show the "Imperative wording" ?

I hope that you can take published guidance better into account
(instead of the wording =E2=80=9CWe fix this bug.=E2=80=9D in the discusse=
d changelog).
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9#n94


> 3. Can you give me some examples for adding "Fixes" ?

An other tag specification might be more appropriate
than the following suggestion.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9#n145

Fixes: a75aa90c7c2f ("media: dvb_ca_en50221: Used a helper variable")


Regards,
Markus

