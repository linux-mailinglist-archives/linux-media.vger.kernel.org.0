Return-Path: <linux-media+bounces-7788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D988AD32
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 19:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DE0E1F3E023
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 18:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03BE12CD84;
	Mon, 25 Mar 2024 17:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ljAlT8x2"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2CFD272
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 17:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388255; cv=none; b=Y0aAqRec8UAl9UlTOtBFa8S1VwwefDGQ/Y8j6xAUSHTBixkbHhQ9oGgz5mGW2BUOUMYw9EtGnYJBYBCMi5laP2oNLwXm3AZI5+nhZmlxjovxG2657c/56aZvYbDMYrXx+P0wJLxz5ONu9m6XrfvIrwMoI1ZcWpbL2VBtTvqPHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388255; c=relaxed/simple;
	bh=1uosoAYAWA4mEyw4+KgAlc8BiYnzY5IWKr45HsVlZ4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sN6ZLRSumDkEoraKyvst6Z/ecNcK8v+7IDODaz+Ti9mfLvWofgxqz6QeT4MSmkch6NeXH8ZosR2Qn7ayPmDGtqg8QvJf/gZbSy42L41vbHnbYwNM7AJFutboCaJeLYY4mtN0PzbOFfV8GEdwxwn9LUWtYsaooWQvpqTZ5mYNDeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ljAlT8x2; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711388251;
	bh=1uosoAYAWA4mEyw4+KgAlc8BiYnzY5IWKr45HsVlZ4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ljAlT8x2GH9taMb/umhMmwtP5r3WHnIQ5MoJxHCiemCwsiwaCBKl97QXPrAZYMe4D
	 Ku6/oZNIo2jfbf71jkyeprhB5vfVYDa6w2KFGkqmIFhbZa6wWGIf/wyt/dUUqKseG/
	 fbYI9EqAaLwO0epG9xV58LLPs3DUFr9rQh5cD7Qv/qba9dSCD6OyCh/Tmz0vNj7wQm
	 m6CMcEU96hKL+YfW5YlGTwlMSm7WFIPx+In/1dqt474434AX4p7LFpfI1lgabYosvc
	 QmsxIcVbG/7pygqZTM9hZmspWgS3ggfAEyS5N8VNYXCFzsv9uBcvgpghvAF41xbx+l
	 ftzJSDp7Lajog==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 521FC37810C0;
	Mon, 25 Mar 2024 17:37:31 +0000 (UTC)
Date: Mon, 25 Mar 2024 18:37:25 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.9] Various Mediatek VCodec fixes
Message-ID: <20240325173725.ydxv7o2xqgzpdtqm@basti-XPS-13-9310>
References: <20240315132549.vbhui74yxjg2t36v@basti-XPS-13-9310>
 <172268d7-f259-4098-bb0d-c33b9ee4a4e1@xs4all.nl>
 <20240325154432.w2zhseliz2m3dpwy@basti-XPS-13-9310>
 <73de97e4-a9ce-4e46-8718-7e51936a66c3@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <73de97e4-a9ce-4e46-8718-7e51936a66c3@xs4all.nl>

Hey Hans,
>>
>> On 25.03.2024 10:30, Hans Verkuil wrote:
>>> Hi Sebastian,
>>>
>>> Are these fixes for v6.9 or can these be merged for v6.10?
>>
>> I was hoping for them to land in 6.9 but if that doesn't work that is
>> fine for me as well.
>>
>>>
>>> Not all of these patches have a 'Fixes' tag, perhaps they should have it?
>>
>> No the tags are correct, do you want me to strictly only mix patches
>> with fixes tags or only patches without fixes tags?
>
>That's why I asked: if you want that all these patches go to v6.9, then I can
>apply them to our fixes branch and they will be passed on to Linus for
>6.9, but in that case it would be good to have Fixes tags.
>
>If all patches are OK to be merged for 6.10, then I can just apply them
>to our staging tree.
>
>Finally, if some are for 6.9 and some for 6.10 (presumably those patches
>without the Fixes tag), then I can split it up myself.
>
>In any case, I need to know what you want.

Alright, then please add all of them to 6.9, the two without the fixes
tags are not critical but that enable normal functionality, so I'd call
them important enough.

>
>Regards,
>
>	Hans

Greetings,
Sebastian

