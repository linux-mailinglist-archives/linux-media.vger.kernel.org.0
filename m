Return-Path: <linux-media+bounces-38115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C63CB0B490
	for <lists+linux-media@lfdr.de>; Sun, 20 Jul 2025 11:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9E1617B3DD
	for <lists+linux-media@lfdr.de>; Sun, 20 Jul 2025 09:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4071DE8A4;
	Sun, 20 Jul 2025 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0223asZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE491C3C11
	for <linux-media@vger.kernel.org>; Sun, 20 Jul 2025 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753003340; cv=none; b=elxl/eICu7DMdgZETfneva4/h4omGTGpQp+SCMwYiquBZojazaaeX5bV+LQwgeSTkKpV516cDvXD3mr6UD4vK+19VVvkolAozVmTCMTXmufsdhgODc1nlScf3l6f0R1RmM2TwqHKP1712SbkDN5ctQh87ltRrLB2SAyItE6sxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753003340; c=relaxed/simple;
	bh=Ysjx91NUoJWU5Etl0T0LPFyPCfb3I6G/fUP5bKwkCyU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=UktFSaMX+eevI5lpGgWxlOtVAeo5d9sMC5LARQ+o8pXprNOLRrQcGwIzaJ4+6m36zLpMyxq8d38USzNt++5lEF11lH3fOUQUZTlIYpU0xLVN6+so1vEoe0l3Mu3OMhP53R9jo+Gy2bROsJnSTmNdvqf9kxw+25XZxDYNmrFTJhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0223asZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0D0C4CEE7;
	Sun, 20 Jul 2025 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753003338;
	bh=Ysjx91NUoJWU5Etl0T0LPFyPCfb3I6G/fUP5bKwkCyU=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=U0223asZzhIFp9+zqpJoNRiFHVTBbRKlzNUFHiPU+u0sKWZ3cllcYsjssZjRDU0xj
	 9of2V60Mkz6mFPNQCrrvo5udXVm+//d508BVbWtyockfIQlUJ///1m4NWRno2wdjly
	 Ql08JpfFNtPD4LX3Njaquh2IpKeT/Nn38PYCALE944pPX4oqdhPE4K5Fi4Rkwnfsz/
	 WVNfC10w7nzuYa7Stl/oz8ZquQSuhKdIqxH0CuG4EiMNcIfMSvbUPU1Q1m9HqSJK/k
	 i+0Z81VXivTIUq7LSJkSVFzm3eldDvoOw39t3IIIkLsGaW6eSt/sxJRwCdYtaJ5g2g
	 E0BR3ZEFohhjg==
Message-ID: <64c36427-0c1f-49c9-85e2-8c803e804d70@kernel.org>
Date: Sun, 20 Jul 2025 11:22:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: media: cec: extron-da-hd-4k-plus: drop external-module make
 commands
To: Randy Dunlap <rdunlap@infradead.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
References: <20250719005942.2769713-1-rdunlap@infradead.org>
 <687afeed.050a0220.3aa8f2.1836@mx.google.com>
 <f31f468a-7708-4359-bfa2-31b16c159429@infradead.org>
Content-Language: en-US, nl
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <f31f468a-7708-4359-bfa2-31b16c159429@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/07/2025 22:38, Randy Dunlap wrote:
> Hi,
> 
> On 7/18/25 7:11 PM, Patchwork Integration wrote:
>> Dear Randy Dunlap:
>>
>> Thanks for your patches! Unfortunately the Media CI robot detected some
>> issues:
>>
>> # Test media-patchstyle:./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch media style
>> ERROR: Commit 056f2821b631df2b94d3b017fd1e1eef918ed98d found in the stable tree, but stable@vger.kernel.org not in Cc:
> 
> OK, will add that.
> 
>> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc hverkuil (Cc: Hans Verkuil <hverkuil@kernel.org>
>> Cc: Hans Verkuil <hverkuil@xs4all.nl>)
>> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc mchehab (Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>)
>> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc linux-media (Cc: linux-media@vger.kernel.org)
> 
> Why these complaints? In Docmentation/driver-api/media/maintainer-entry-profile.html
> I see:
> 
>   Patches for the media subsystem must be sent to the media mailing list
>   at linux-media@vger.kernel.org as plain text only e-mail. Emails with
>   HTML will be automatically rejected by the mail server. It could be wise
>   to also copy the sub-maintainer(s).
> 
> OK, so according to this, I can Cc: (or should that be To: ?)
> hverkuil@kernel.org and drop the copy to hverkuil@xs4all.nl.
> Is that correct? Should I send a copy to Hans or not?
> It's unclear (conflicting advice).
> 
> And I can drop Mauro's email address since the delegated sub-maintainer
> can take care of it.

You can CC us in the mail header, but adding Cc: tags for the mailinglist and the media maintainers
is overkill. Calling it an ERROR is probably over the top as well, it's more a warning. We're
still fine-tuning those automatic messages.

In any case, thank you for the patch, I think it accidentally ended up in the Makefile because
for quite some time this driver was carried out-of-tree and I forgot to delete it when I
mainlined it.

Regards,

	Hans

> 
> Thanks for guidance.
> 
>>
>>
>>
>> Please fix your series, and upload a new version. If you have a patchwork
>> account, do not forget to mark the current series as Superseded.
>>
>> For more details, check the full report at:
>> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/80828975/artifacts/report.htm .
>>
>>
>>
>> Best regards, and Happy Hacking!
>> Media CI robot on behalf of the linux-media community.
>>
>> ---
>> Check the latest rules for contributing your patches at:
>> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>>
>> If you believe that the CI is wrong, kindly open an issue at
>> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
>> to this message.
>>
> 


