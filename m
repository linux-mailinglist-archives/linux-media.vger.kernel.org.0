Return-Path: <linux-media+bounces-36901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D49AFA595
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 15:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83228178A55
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 13:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8781231A21;
	Sun,  6 Jul 2025 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVrAd/gl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2C11E3769;
	Sun,  6 Jul 2025 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751809563; cv=none; b=oLGSsVGLjStRaXa4e2PTkmT8owCVmA7ozgcwv+K85HVzBZeqafyF4SMyAa2a5e+AXj3cEXXi7GvpWsv0BUTlqNbO+r16iDNRYGimpwmqhnqVXUwzwS62pRaZTz/ShO71UkKjqG1xnVJS4AzLHmPJVv3EyS3NlRiXdbxOxMwT2us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751809563; c=relaxed/simple;
	bh=4PyPV4ihbtb4N17V5FIt8RMbHEy8VxELoPK9bhcf3MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTzrsH9YPd9psP9itymya+EbIbzk5SsL3rthK986XwYWPIXLTCDkBDnHKJ4YNMFxnupk+C3BfKCGTTg6RWlf0W8SG10CMxbC4EdgamsL1KN3oXTbZy2Yf0AkmpHB47iNvjrYbepXuH4bGD737PGYNCHcT7uHyIl8iA42NSu3+BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVrAd/gl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C15CC4CEED;
	Sun,  6 Jul 2025 13:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751809562;
	bh=4PyPV4ihbtb4N17V5FIt8RMbHEy8VxELoPK9bhcf3MQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iVrAd/gl4sIKZ7mQ7To7euAR6f0QKH3/qVEpW/EkU3F7UnMbzkcteZnKSxGpl9ULU
	 mylsU2TicLm/SUBHPWj7e8kaooV5OmmRnrG1XGYOC92vtim/s9LTEX/s8XeFKjhHKL
	 6GjJrd9fjzdl16R7fgtIie6QfKH1FLr0+3VDqvdVopEIuNUPcyXcs6Cd0FfQUwAJrL
	 8X3M27qX7OV2P9LY+e5nko7ox1B3FOdf2yLCNeaocaFLz5NzL3kH3Oq59BSFXyDTOe
	 muWhEfmJSLkq4mn7uoLCyFwjIIhZwk6wZ1mqPCGtOTDvYM6l5r8YkFDejtAYfPNvlO
	 +4mVgRWEo6S2A==
Message-ID: <16059b45-3875-4541-afc4-aaa48dfeb618@kernel.org>
Date: Sun, 6 Jul 2025 15:45:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/23] media: atomisp: gc0310: Switch to
 {enable,disable}_streams
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-15-hdegoede@redhat.com>
 <aCsZTV6XuPiqCReu@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aCsZTV6XuPiqCReu@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 19-May-25 1:43 PM, Andy Shevchenko wrote:
> On Sat, May 17, 2025 at 01:40:57PM +0200, Hans de Goede wrote:
>> Switch from s_stream() to enable_streams() and disable_streams() pad
>> operations. They are preferred and required for streams support.
> 
> ...
> 
> (side note: that cleanup.h may help with locking as well)
> 
>> +	ret = pm_runtime_get_sync(&client->dev);
>> +	if (ret)
>> +		goto error_power_down;
> 
> Hmm... Don't you want rather to have pm_runtime_resume_and_get()?

Ack I've fixed this while merging the series into
my media-atomisp branch for the upcoming atomisp pull-req
for 6.17 .

Regards,

Hans


