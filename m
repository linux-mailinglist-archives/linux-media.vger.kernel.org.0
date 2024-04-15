Return-Path: <linux-media+bounces-9410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B658A56AC
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 17:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93A59B20C24
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 15:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815C94BA94;
	Mon, 15 Apr 2024 15:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="Q3MaPRE1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936EF29414
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.110.109.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713195768; cv=none; b=cDT1+gP6zdTfTxZspD9+bRooraMQlQXus9JWD15I4AkSsBg+freSKDC3lv3ZLeq6vvV+20WfNvV/WSEY3GyfV8TbOJe8L+llV1Xu3ZqTcicNbOqJPXSDJ5A6tRofR1xSsK4MS5n+5u+hLs0JNeqz7NW9/2V47n9WKxoZas9C2iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713195768; c=relaxed/simple;
	bh=fwixS4nFBF1jNtEMQEKZ/7kqdaGWx06GVfLH7Qx1JZM=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=fMqZJOD+gtenheJB7W2ofznDxQMoY9UwvK2yjVciXnR5JSaOGY3Y8bURVQk1o84jsj3bix2axPRIr8/Pu+eL/SzebU/li7W7wWK7bNakfRmOQ667E/K2NmkbcQuWdJBWvlEo5onQBgWdlgzh28IstQzY9xw6WVW/gnZSs2Ota3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=Q3MaPRE1; arc=none smtp.client-ip=84.110.109.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id EEFED44004B;
	Mon, 15 Apr 2024 18:42:33 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1713195754;
	bh=fwixS4nFBF1jNtEMQEKZ/7kqdaGWx06GVfLH7Qx1JZM=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=Q3MaPRE1vyRTl9ny96uVxXeDR6uBYb4HoMYbTcD2+0EvpntNpYqnvc6H9cpCEDjJM
	 7k5sJRl/acc0qJOUztsw+6fWCXSu8racocXWCTtfC1U4ZYUjbu2HQmBUZV+HaPa6bj
	 9SIl/ZzLrJznr3qSIlVZ1E4S+wHB+923SzcJxyhr4nXAAVvVdWgHty2IsJKEptvzcE
	 OOEMyVpLpETH4o15W1b9Q0uDbZEOBe5NPeKJjQbmArm7+lfK1833HvLhnqVRVofkNn
	 NMUSA0auWkRTVEcSn/yzB5oaNv1caexHj+8Dk8bCyIxX8GQqZAVT//XXJBWS2+gxmY
	 s5cUEgmtB9hkw==
References: <d242a446258e34b2db8990561e51f145df748f83.1713100057.git.baruch@tkos.co.il>
 <cba06e6f-06cb-4b0e-88df-d25d278fb4f2@amd.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Baruch Siach <baruch@tkos.co.il>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] doc: dma-buf: fix grammar typo
Date: Mon, 15 Apr 2024 18:40:25 +0300
In-reply-to: <cba06e6f-06cb-4b0e-88df-d25d278fb4f2@amd.com>
Message-ID: <8734rmws2b.fsf@tarshish>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Mon, Apr 15 2024, Christian K=C3=B6nig wrote:
> Am 14.04.24 um 15:07 schrieb Baruch Siach:
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>   Documentation/driver-api/dma-buf.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver=
-api/dma-buf.rst
>> index 0c153d79ccc4..29abf1eebf9f 100644
>> --- a/Documentation/driver-api/dma-buf.rst
>> +++ b/Documentation/driver-api/dma-buf.rst
>> @@ -77,7 +77,7 @@ consider though:
>>     the usual size discover pattern size =3D SEEK_END(0); SEEK_SET(0). E=
very other
>>     llseek operation will report -EINVAL.
>>   -  If llseek on dma-buf FDs isn't support the kernel will report -ESPI=
PE
>> for all
>> +  If llseek on dma-buf FDs isn't supported the kernel will report -ESPI=
PE for all
>
> Looks valid of hand, but checkpatch.pl complains about 2 errors (missing
> commit message for example) and a warning.
>
> Please fix and resend.

I only get the checkpatch.pl output listed below with one warning. What
parameters do you use?

WARNING: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 8 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplac=
e.

Commit d242a446258e ("doc: dma-buf: fix grammar typo") has style problems, =
please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

Thanks,
baruch

--=20
                                                     ~. .~   Tk Open Systems
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

