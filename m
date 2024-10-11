Return-Path: <linux-media+bounces-19416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 311BC99A158
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 12:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFE671F248DB
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 10:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6E22141AE;
	Fri, 11 Oct 2024 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yFe/fXVp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UkzzZStg"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A895212F19;
	Fri, 11 Oct 2024 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642534; cv=none; b=r6jA2DJnzddPOJ561EfPFOUEVpDM1jtfr/PGE3Nvb2JqcVWe9/D9IugQxdL9B3eq11zW03yOaG+FYe+WSE28SSKzxH2f9hNG0Ivob4voilKo2E5/8iDNQH9e7fEN40AocUrcvD2VHHtnovsaEfCPzxjgAKOwXmllv+BoHRxVTxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642534; c=relaxed/simple;
	bh=n2dykwx7gbvQ5P7NtNLvmsIxMhIL8DL8LeYsy23zh+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K90JylFDgUa4srtCmS+u9Slrxe976CO+ewHAgRpsq0GZGkGSv1WgoSIgr6/Y78e2d0SYQ/cBlgltmvkJRcgtqzx2pm4iMHnrb9bZ1SqGh/hlUnCD7ZIdVYU7q2539dzHWGZPgaxyMLava97WwqGlEJR6wEeu0/ypDFRX7bYXoEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yFe/fXVp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UkzzZStg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728642531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0XrvoDMfDJTWeWyJq5a1+cu3ixc+FF1gxxisWOHops=;
	b=yFe/fXVp2DKzgrnxTChr8L7vkdl808zUtbmH2JqAg2th2qyk2YqiZntzarOjiJJ9Q4iCqc
	c8cOR7m2+XUA5RB0RlT9IrFYvzIEADUD7aofhVGa00zjxu1xFAx9dspbiAJiff9n6lEjKT
	3PsP0Fc0ekJMiJPCSyyONGyNja9ssoaSfDB2ms28WpVMNmidcCRmBnW/8nRWzQNSW+/X1F
	m+n4X5eAeIaQBHK0RuuIhp16uYPcYnfbFXgoUYdShYoQuC3bP3oVkFITzxEKC5Zyss/e0w
	RJv911wrnCvc6imWUNMDazUUtqBHkFf0usv8fryEFeOW7Ydy9DZzHTAMBAo5fA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728642531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0XrvoDMfDJTWeWyJq5a1+cu3ixc+FF1gxxisWOHops=;
	b=UkzzZStgAzSR24kvtu8eCX6CA7mBN0E0/JLVL9iW88tV/pDCODR8ePcxK3JY32/TvQD1/K
	eXlaZFzNgDC83OCQ==
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, bigeasy@linutronix.de
Subject: Re: [PATCH v2 14/15] media: anysee: Fix link to outdated sleep
 function documentation
In-Reply-To: <ZwavtEHr_29NTvTg@localhost.localdomain>
References: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
 <20240911-devel-anna-maria-b4-timers-flseep-v2-14-b0d3f33ccfe0@linutronix.de>
 <ZwavtEHr_29NTvTg@localhost.localdomain>
Date: Fri, 11 Oct 2024 12:28:50 +0200
Message-ID: <8734l3vspp.fsf@somnus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Frederic Weisbecker <frederic@kernel.org> writes:

> Le Wed, Sep 11, 2024 at 07:13:40AM +0200, Anna-Maria Behnsen a =C3=A9crit=
 :
>> The TODO FIXME comment references the outdated lower limit for msleep()
>> function of 20ms. As this is not right and the proper documentation of
>> msleep() is now part of the function description, remove the old stuff a=
nd
>> point to the up to date documentation.
>>=20
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: linux-media@vger.kernel.org
>> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>> ---
>>  drivers/media/usb/dvb-usb-v2/anysee.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/media/usb/dvb-usb-v2/anysee.c b/drivers/media/usb/d=
vb-usb-v2/anysee.c
>> index 8699846eb416..b2f5db961245 100644
>> --- a/drivers/media/usb/dvb-usb-v2/anysee.c
>> +++ b/drivers/media/usb/dvb-usb-v2/anysee.c
>> @@ -55,10 +55,8 @@ static int anysee_ctrl_msg(struct dvb_usb_device *d,
>>=20=20
>>  	/* TODO FIXME: dvb_usb_generic_rw() fails rarely with error code -32
>>  	 * (EPIPE, Broken pipe). Function supports currently msleep() as a
>> -	 * parameter but I would not like to use it, since according to
>> -	 * Documentation/timers/timers-howto.rst it should not be used such
>> -	 * short, under < 20ms, sleeps. Repeating failed message would be
>> -	 * better choice as not to add unwanted delays...
>> +	 * parameter. Check msleep() for details. Repeating failed message wou=
ld
>> +	 * be better choice as not to add unwanted delays...
>
> Does the comment still matches any up-to-date worry? It passes 2000 ms wh=
ich is
> 2 seconds...

I had a closer look at it: dvb_usb_generic_rw() is no longer used. The
v2 interfaces are used anyway and this uses usleep_range() instead of
msleep().

I updated the patch and also talked to Sebastian. Will send an update
with v3 which removes and updates the comments.

> Thanks.
>
>>  	 * Fixing that correctly is one of those or both;
>>  	 * 1) use repeat if possible
>>  	 * 2) add suitable delay
>>=20
>> --=20
>> 2.39.2
>>=20

