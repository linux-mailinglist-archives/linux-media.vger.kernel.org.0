Return-Path: <linux-media+bounces-38118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59737B0B708
	for <lists+linux-media@lfdr.de>; Sun, 20 Jul 2025 18:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06FA31894258
	for <lists+linux-media@lfdr.de>; Sun, 20 Jul 2025 16:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EDE21D3F6;
	Sun, 20 Jul 2025 16:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OD2+7HgH"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31591917F1
	for <linux-media@vger.kernel.org>; Sun, 20 Jul 2025 16:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753030242; cv=none; b=RU2IwyjH6nox2iTmG0rDMhaPMT941ydWyJfwi7aqcupE8wz5OzmkRuD/tmOvynxRoApeJ41SSpJ9DByKjmHWwen2/kTIi3vE/kWgnzTjwE5kJsOQKNG0pYp/FlhUfhBQusiNcoCv3wlMkHef9kFTPrGGDKcHzjAIv2U4lhdBqyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753030242; c=relaxed/simple;
	bh=YFOx2KpcuIBxF1v9ETwxcVP/eejLS5xNWbujz8E76HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KLR3z28why0ij+/l+uWJqHO2tHfErRAGo3PpOZUz4AMDroBsiCYRNpThfXheG5kJfBIe33d9f8MJMcSJ10ekecLXjNE81x0p8HHRPYeycGf7C4L3rTlPWaKM+HzRKX5BaAnlr6cqj1EG+M1ZpZTbBDdiGAio2Z4vHuWRojpCn30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OD2+7HgH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=lMq8UaLBdjtl+1gmr/b16CXzAnafwHNqx+YlYuhkNhI=; b=OD2+7HgHTg7qjqFTMVTEoG/v9g
	mxBGoOTrON9apJcRxOy4OZPNz9OBBIM2Hj/Wff9gnAPJOI8ZTq5b2Ptd5anN5t3OVgLjY+NRq/KQR
	cEqVEcD6czlJIjZVTxqYWy+5t+nUASzsGHf6wG/oM+TaUJkLEc6HBGBYtUK2wOvmVqnXQki8FnAe7
	3786eLTIeuLjC0qv507g2wCJ9oGHyo2/0RF2K1hgyF1DPmXse2zIuUog1NO+hiOUz9NmLtZ0iy/5Y
	wbLOsqZo8ne+VPuLEgTdPaxHEo05hpCpz93HoO5H2LelMSYw5Fr/079E03dOJhN/ZSkwldmdOWJbt
	NCYQOj/A==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udXFE-0000000FWQz-1cHD;
	Sun, 20 Jul 2025 16:50:36 +0000
Message-ID: <02525806-ce90-4c98-ab5d-bc414820936b@infradead.org>
Date: Sun, 20 Jul 2025 09:50:35 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: cec: extron-da-hd-4k-plus: drop external-module make
 commands
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
References: <20250719005942.2769713-1-rdunlap@infradead.org>
 <687afeed.050a0220.3aa8f2.1836@mx.google.com>
 <f31f468a-7708-4359-bfa2-31b16c159429@infradead.org>
 <64c36427-0c1f-49c9-85e2-8c803e804d70@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <64c36427-0c1f-49c9-85e2-8c803e804d70@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/20/25 2:22 AM, Hans Verkuil wrote:
> On 19/07/2025 22:38, Randy Dunlap wrote:
>> Hi,
>>
>> On 7/18/25 7:11 PM, Patchwork Integration wrote:
>>> Dear Randy Dunlap:
>>>
>>> Thanks for your patches! Unfortunately the Media CI robot detected some
>>> issues:
>>>
>>> # Test media-patchstyle:./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch media style
>>> ERROR: Commit 056f2821b631df2b94d3b017fd1e1eef918ed98d found in the stable tree, but stable@vger.kernel.org not in Cc:
>>
>> OK, will add that.
>>
>>> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc hverkuil (Cc: Hans Verkuil <hverkuil@kernel.org>
>>> Cc: Hans Verkuil <hverkuil@xs4all.nl>)
>>> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc mchehab (Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>)
>>> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc linux-media (Cc: linux-media@vger.kernel.org)
>>
>> Why these complaints? In Docmentation/driver-api/media/maintainer-entry-profile.html
>> I see:
>>
>>   Patches for the media subsystem must be sent to the media mailing list
>>   at linux-media@vger.kernel.org as plain text only e-mail. Emails with
>>   HTML will be automatically rejected by the mail server. It could be wise
>>   to also copy the sub-maintainer(s).
>>
>> OK, so according to this, I can Cc: (or should that be To: ?)
>> hverkuil@kernel.org and drop the copy to hverkuil@xs4all.nl.
>> Is that correct? Should I send a copy to Hans or not?
>> It's unclear (conflicting advice).
>>
>> And I can drop Mauro's email address since the delegated sub-maintainer
>> can take care of it.
> 
> You can CC us in the mail header, but adding Cc: tags for the mailinglist and the media maintainers
> is overkill. Calling it an ERROR is probably over the top as well, it's more a warning. We're
> still fine-tuning those automatic messages.

Ah, so it's the tags that are the issue. Thanks for the explanation.

> In any case, thank you for the patch, I think it accidentally ended up in the Makefile because
> for quite some time this driver was carried out-of-tree and I forgot to delete it when I
> mainlined it.

Sure :)
Do I need to send a v2 of the patch?

Thanks.
-- 
~Randy


