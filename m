Return-Path: <linux-media+bounces-38128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B84A2B0BC67
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 08:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8069C189B0AA
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 06:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430B425A2B4;
	Mon, 21 Jul 2025 06:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNqJs2Na"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53DE253B5C
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 06:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753078680; cv=none; b=ud8BNQ4COYv2dGkZqXpaZ/6htMWQ4sM9uRid2ckF3dUIc/fdH72r3rHio9UyTtUxcqFgkiMtpDLQhCTxeQEhJbPYBFMkiUNsCcnKtYKJqI9sDKuhTpThQF1GMReo1cwZGImGg1U5OdPgEHtO5yyKWHB5RDum/mvhipEsyGrHlTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753078680; c=relaxed/simple;
	bh=iMefM2o3LUwyiapBJi7cxYSxajZ9WLbUcC8Flx/olfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=S8y2h5UYouJzM+1AeKOe2m91Zm9a7/IO7a0JQnfi/iggMG429TyMmh6gEVxvoPxU2ixKuxRoIjJSn2Ant/8UOI4ZaFpCmqbCTmFd8DE1LdXc1FARP4CqLjpDx9z6of2e2KTWYQESFbdNmW67N3BFGvcjCEGyZJwE0jSy0sroSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNqJs2Na; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D19FC4CEF1;
	Mon, 21 Jul 2025 06:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753078680;
	bh=iMefM2o3LUwyiapBJi7cxYSxajZ9WLbUcC8Flx/olfU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ZNqJs2NakYm3I9ZCWCPJiE7CIWcsg3b3VhWrW/S2yCsbCkEzDuivCndJnUO8ivZHS
	 1fYCLtLwbh3abdanzw2reDo3JJ+SlxwsfOPWk3W/EBJYGufy0H4DRfPJUHhssMCsLM
	 MdJVfRGASyvJqRFt6KGosKj8FfoZRUkYEM4dHxrIyjvEkIrCQgGb9neoMKmyxrKmLT
	 ojTJyryokOx+o2S/qQXMOhctQ2xkVmCeeEJxE8clXg4JHb4vxRSPlweHWwkhCO2YOV
	 cIrUrK+d0DGjoTVlbZGnQbbzK+plERqQHovHhm1YhEqy436uDJa4iCOzcdeLPfnrDi
	 ZSLSEwuOFaMjw==
Message-ID: <9e863578-23c5-44ef-aeed-560c5c64f7c8@kernel.org>
Date: Mon, 21 Jul 2025 08:17:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: cec: extron-da-hd-4k-plus: drop external-module make
 commands
To: Randy Dunlap <rdunlap@infradead.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
References: <20250719005942.2769713-1-rdunlap@infradead.org>
 <687afeed.050a0220.3aa8f2.1836@mx.google.com>
 <f31f468a-7708-4359-bfa2-31b16c159429@infradead.org>
 <64c36427-0c1f-49c9-85e2-8c803e804d70@kernel.org>
 <02525806-ce90-4c98-ab5d-bc414820936b@infradead.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil+cisco@kernel.org>
In-Reply-To: <02525806-ce90-4c98-ab5d-bc414820936b@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2025 18:50, Randy Dunlap wrote:
> 
> 
> On 7/20/25 2:22 AM, Hans Verkuil wrote:
>> On 19/07/2025 22:38, Randy Dunlap wrote:
>>> Hi,
>>>
>>> On 7/18/25 7:11 PM, Patchwork Integration wrote:
>>>> Dear Randy Dunlap:
>>>>
>>>> Thanks for your patches! Unfortunately the Media CI robot detected some
>>>> issues:
>>>>
>>>> # Test media-patchstyle:./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch media style
>>>> ERROR: Commit 056f2821b631df2b94d3b017fd1e1eef918ed98d found in the stable tree, but stable@vger.kernel.org not in Cc:
>>>
>>> OK, will add that.
>>>
>>>> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc hverkuil (Cc: Hans Verkuil <hverkuil@kernel.org>
>>>> Cc: Hans Verkuil <hverkuil@xs4all.nl>)
>>>> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc mchehab (Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>)
>>>> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc linux-media (Cc: linux-media@vger.kernel.org)

Ah, this error message isn't clear that it is about the Cc tag, that should be clarified.

>>>
>>> Why these complaints? In Docmentation/driver-api/media/maintainer-entry-profile.html
>>> I see:
>>>
>>>   Patches for the media subsystem must be sent to the media mailing list
>>>   at linux-media@vger.kernel.org as plain text only e-mail. Emails with
>>>   HTML will be automatically rejected by the mail server. It could be wise
>>>   to also copy the sub-maintainer(s).
>>>
>>> OK, so according to this, I can Cc: (or should that be To: ?)
>>> hverkuil@kernel.org and drop the copy to hverkuil@xs4all.nl.
>>> Is that correct? Should I send a copy to Hans or not?
>>> It's unclear (conflicting advice).
>>>
>>> And I can drop Mauro's email address since the delegated sub-maintainer
>>> can take care of it.
>>
>> You can CC us in the mail header, but adding Cc: tags for the mailinglist and the media maintainers
>> is overkill. Calling it an ERROR is probably over the top as well, it's more a warning. We're
>> still fine-tuning those automatic messages.
> 
> Ah, so it's the tags that are the issue. Thanks for the explanation.
> 
>> In any case, thank you for the patch, I think it accidentally ended up in the Makefile because
>> for quite some time this driver was carried out-of-tree and I forgot to delete it when I
>> mainlined it.
> 
> Sure :)
> Do I need to send a v2 of the patch?

Yes please.

Regards,

	Hans

