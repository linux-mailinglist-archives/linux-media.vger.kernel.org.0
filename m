Return-Path: <linux-media+bounces-38116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDEBB0B4FE
	for <lists+linux-media@lfdr.de>; Sun, 20 Jul 2025 12:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83C013A9055
	for <lists+linux-media@lfdr.de>; Sun, 20 Jul 2025 10:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB9A1F3FEC;
	Sun, 20 Jul 2025 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="HFkg5/qW"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB112A930;
	Sun, 20 Jul 2025 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753008528; cv=none; b=Uie7xdpPHBkwqxJ81y8HXT1EGYie4MmJIGaS2Nj5Uur4/UwUoWI93Axt6Wz2Kdq/Qnt1qpC6IOhr+jwCn6SkAQnF/7RNh61gju909Wpoe4HJ64FtuWn4nlp5eFLdk0hysXO4I738TRFDfgLPzmayPIbOfwXM2wckQnzkU9dtnQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753008528; c=relaxed/simple;
	bh=3vf6kLA2FGDKCKK64SJlqLN+i7DHzQVm4J7Oh8QNNJA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=XzueTCqW/zKdBNimwVQ30iJ5+xUYWk8MOyANZQYSCGHgfDJi4DnmeW5PTGKZ+eyFhmS0RLS3CE1TIK0M3Q/9VTjVXbDaaXA0EvXqabD/ZV4KaxOsZWHQeoBLMvueggXVFoqwqlfQBS2kQ4h0iE+IwFhcZFmNZid5qWjDvxXciUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=HFkg5/qW; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1753008517; x=1753613317; i=markus.elfring@web.de;
	bh=aA5timwUCm5Xwh0XYd8SGw5OVrVpvS3KNBI5CZ1yDtM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HFkg5/qW/3xtT8oWfn+S7fUf3uaC4ntTUkZOzQxp61ldNyRdMsT2Ms8AUYhlOr99
	 TW0qf0ak9YL1o6Gi/+9DD0oOWVYNEiFeyscutXryAp94O41sOcSMhLvNmcJFAO4bp
	 WsVNIjtQ18NGa9CMG7qTj4RqRe52tjYAjKIaI9cE56zmnRWtxSM/1UtczJyeBrnbP
	 arERe3MaRWy8b8FNIHF+kIwQ6xdmcqXgwJJJ8wgM+ZNqHbaUYQEvMP0d8H7brU3/v
	 rtwplJa8MpvxR3qwjM0oDttLaBYxJr4MQQhB816LD/R0H7XETt4zYAaQdKglj4N9W
	 WrX6v/W3OndID03New==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.216]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MV2OY-1uCT5v29UE-00NTYy; Sun, 20
 Jul 2025 12:48:37 +0200
Message-ID: <54d3ec28-0e6c-4e9b-bd93-966efe649054@web.de>
Date: Sun, 20 Jul 2025 12:48:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Darshan Rathod <darshanrathod475@gmail.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250718145149.3180-1-darshanrathod475@gmail.com>
Subject: Re: [PATCH v2] media: b2c2: flexcop-eeprom: Fix assignment and
 missing return in MAC check
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250718145149.3180-1-darshanrathod475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gtcbqYfaaWCTDJOv9Px9qJjvqAV6mJsPDNBKe6xrSL5ayp4NaKd
 S+Q2Z5Om4nPweguDx7kzATV6lboPC7s4Mwei/bnOEsuQfjivh9VM9hpoj4/Xud1iX4Rm/g2
 Jm+uOXZacXyDH81FJqS1OpRKTLYcbpYhIaeFlGh8YvxyYXgxfB9YrSjOW6jjfN+0GxC0HyQ
 MM0tfyxYjr5IjB9Sw/oOA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ir+6XlBGFXk=;sbcn3KS1fbl9c20Fvph9Eil/dLN
 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
 PmEN8=

> Fixes a coding style violation and build error in
> `flexcop_eeprom_check_mac_addr()`.

Will it be more desirable to separate some adjustments?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16-rc6#n81



>                                    The function contained
> an invalid assignment in an if-condition and was missing
> a return at the end of a non-void function.

I find this information inappropriate.


=E2=80=A6
> ---
>  drivers/media/common/b2c2/flexcop-eeprom.c | 15 +++++++++------
=E2=80=A6

How do you think about to improve your version management?
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16-rc6#n784


=E2=80=A6
> @@ -135,12 +135,15 @@ int flexcop_eeprom_check_mac_addr(struct flexcop_d=
evice *fc, int extended)
>  	u8 buf[8];
>  	int ret =3D 0;
> =20
> -	if ((ret =3D flexcop_eeprom_lrc_read(fc,0x3f8,buf,8,4)) =3D=3D 0) {
> +	ret =3D flexcop_eeprom_lrc_read(fc, 0x3f8, buf, 8, 4);
> +
> +	if (ret =3D=3D 0) {

Would you like to use the following code variant?

	int ret =3D flexcop_eeprom_lrc_read(fc, 0x3f8, buf, 8, 4);


=E2=80=A6
> +			ret =3D ret =3D -EINVAL;
=E2=80=A6

Why do you present a duplicate assignment for this variable?

Regards,
Markus

