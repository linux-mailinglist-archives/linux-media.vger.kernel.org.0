Return-Path: <linux-media+bounces-12087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA5E8D1B60
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 14:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59D7428348A
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 12:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2E716D9DB;
	Tue, 28 May 2024 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ACr2K2eA"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A116D4FD;
	Tue, 28 May 2024 12:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716899736; cv=none; b=AWEg1Fmc4O3UHxA1Vp1X09gnjfzAeDyTT/0RBi8ENX87E52Ct2kJ/f3j49+8fhRo1/GC3YlPeTleKhZu/rP0FSVLe4iAlIJxjL28STC7AjbICCXpzeKTGhrkkQBfYGs/+YfSQ8oBszTZTXLnWsoznYbIoQ98d4npKnqu0cfdw0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716899736; c=relaxed/simple;
	bh=vTQPFxcOsTHxGRqAdJFPPFa+Rb8dSXj7HjENu91SDyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sVTC78ttM44rgqL38+lDKGTdJEpf+jMP6HksQZhP01YuRj5BAijwIicGVgLxxrlRxXDWOmwPer/GA4UAHjVOI8kIso6YJbanP2SYQKOph8UzdgjHnOfxxPK80aiulp0F0cJo5QIaGVzf5BxqJCoLuZs883Qkzsfv2opbHdSYPSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ACr2K2eA; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716899714; x=1717504514; i=markus.elfring@web.de;
	bh=vTQPFxcOsTHxGRqAdJFPPFa+Rb8dSXj7HjENu91SDyI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ACr2K2eAeyTIVkV9Vcu+9u/8VT+q+ib95KwOaCJ4moCnwqInR8b+UnW67zXyWvel
	 V64Hj8odu1G/0YXwP8ICDYY63jPRMheTYwBjreGsdr4sBH1ZXzYcUL4fZQ12moQ6u
	 La4kByvDuCkhO7uNZ7f+C9O90hvQMvr2CW3KcVf1+8+aG9yWAvn8GxJ7IxDumi1QW
	 sL7/1Wo0lQ/qhNZTJnILJ3gwwra5j1hMdrZFlvZFn32Y7zC1JJNWmIVsKcSZ/AWvt
	 mkwsnsPgY/q6RgziixDN/bgOj/kt5byuDDT0N6PGQsmXEjO5RrZTWahQO7D8hgG+O
	 /QGiV1taOrmecuNjEg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N79NA-1sYrlO1GaC-00yBen; Tue, 28
 May 2024 14:35:14 +0200
Message-ID: <044e1b22-83ab-4abe-8d7a-04edf038868b@web.de>
Date: Tue, 28 May 2024 14:35:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: dvb_ca_en50221: Add a returing EBUSY logic into CA_RESET
To: YongSu Yoo <yongsuyoo0215@gmail.com>, linux-media@vger.kernel.org
Cc: Hyunwoo Kim <v4bel@theori.io>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20240308121338.1983-1-yongsuyoo0215@gmail.com>
 <eda2a849-c23a-4624-85da-78a2fdef4fe9@web.de>
 <CANXPkT5ggr8VbYdRy+uSnfHxDRES5arJJ8p+ist1CBTm-1xaUQ@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CANXPkT5ggr8VbYdRy+uSnfHxDRES5arJJ8p+ist1CBTm-1xaUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:7EvkIcrFfYAwUvzeJLbnHp2lP/rlbZybFeFB/C+3kTjCC+lgYc5
 f6EJZ2hk0AIX0j/LpOwLcWputW6roeYz8R9sqCBFbOdZgaWf4BCOgNJCgvE7DtjCE1dpO87
 INb+0eUcCBCaOYY04xjCbXBwd34vckogcVtmRxkkFIk9Ljv5Q94oiMOQaSDvI6ILJxAJUlq
 jv8i2FFbZq3FM9BIq3vhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LIg5BihYShU=;FY3DpcWkUt3dvZ1PmOEelVxjEO2
 QGp7pXuKEmx+HwEOnzNbf6v1kyXsRO63fzh4I1BSjYMPOee+9hOlTi59cqiEeAz4DgveZrcI2
 uojo5mM6jes7Z4y+NIWSDablgO2QON0uYnp5Bdc8vqmoQpfFkLyS+QfFeAQmxV0NNjC9lY4Xp
 8MOaXkT1pZkV9X2QihMjLIP0yGR/OSHsoEYKf7Vr9rg/yJJn0yIwoIZU/SDKOYCtR0soRyHgX
 CdG44W/11xg6wp5nsZTcFmTayoj8g08D8NAV14M99dLZPR6MhlHUEwv33MFPZqDxNkgLfLPTT
 p3RGhbUfY/vcOM0ERF/RbZrUdiAdfB83a3M1dUTRlvp5VyKgDl+qb9OAi5y4ZmG531ns787GW
 DBppQPqehzbr37yRHZHXPo8JtlCTiRIxABvC7lXAuXh+tzPCsPmU7y/o5YVyKfl6Zdm4YSlyG
 UUlI89bMLI3KXvRWYTnSBkIm1XpwCsuFCPSstsoL0+UeTgx43GIylht8/z6pqM8DIL+Y8jQ00
 diBTnvRItbL0dWX+K+KgWvrdgtgsf7yrvfUK3i6y3s640V2xet3CN5SVCpdDT470HGOIaJ1LJ
 Q4nMZNscyUsmLUb5kwKqwJYc3jzkyPDS7xRIfHMLjLYNEnvdLqD9Qbn2CNZLiewhPjBznrZ2x
 YQqcFJhsMZmHqBAAfwGVAQ/lE8Xj2TlFNC7nI6Z0agwEgOWV26yMwcyjgbqRAl3Boc8FFh3oU
 nwEklyR+q9I0bskZxQyi+RHBxD5i38cCNwwu/DJq5rwGI6ekrH9DrwdQG9qCtfwM9YJ5NTRla
 tSXRwyPaK2XE+BYOJComdAXk+JtIRGt+IvYeo5NmqGWVI=

> In response to what you suggested, is it OK if I use Gmail

It depends on a proper configuration of preferred message tools.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/email-clients.rst?h=v6.10-rc1#n341


> and attach a new patch ?

Unlikely.

You may respond with subsequent patch versions which contain hopefully
a more appropriate summary phrase and improved change descriptions.

Regards,
Markus

