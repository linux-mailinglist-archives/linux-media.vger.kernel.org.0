Return-Path: <linux-media+bounces-22290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2B9DC07D
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43D65B21EEF
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 08:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488D015EFA0;
	Fri, 29 Nov 2024 08:26:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C5D15D5B6
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 08:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732868793; cv=none; b=q7l/jytgaLramBVgRYMHrpwrqPX1NE25qrTvNIdk42Y+onlGHxS7kycX0ogOgPr1cBe+ISJYW6OdIG0rfRNnxftGaaD7cCjCSq1xhxroXVlRMGkEtE7Bq4rnID2GHsKPyJZuD6gzk7QgWyImvvnXGwD0LkUWp7ffsi0xLmvpWjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732868793; c=relaxed/simple;
	bh=60XrRRD428znBlx4ei41Zdu4ob0K/YZBv/6eUAwxXfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOUJ+3UjeuuS/dpT5KIhk0EhsUjkoXHS9FrLjHkdaHw7Q8mc5DAKwz4zXuNXdrUx7fsynazMkTiLSB1rYMxvtccALMt7NIbf7w1xKxWjIOmyEM96PUzdP6krGp6longAY0C3YpU7Cnrjaj88jkh0HttlKknkg+1M78GuwaqaSwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7F2C4CECF;
	Fri, 29 Nov 2024 08:26:33 +0000 (UTC)
Message-ID: <7d7355f4-ee73-41a6-9d62-f15cb5135e41@xs4all.nl>
Date: Fri, 29 Nov 2024 09:26:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: cec: include linux/debugfs.h and linux/seq_file.h
 where needed
To: Jani Nikula <jani.nikula@intel.com>, linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20241127095308.3149411-1-jani.nikula@intel.com>
 <87plme78hm.fsf@intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <87plme78hm.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/11/2024 09:24, Jani Nikula wrote:
> On Wed, 27 Nov 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>> Having cec.h include linux/debugfs.h leads to all users of all cec
>> headers include and depend on debugfs.h and its dependencies for no
>> reason. Drop the include from cec.h, and include debugfs.h and
>> seq_file.h where needed.
>>
>> Sort all the modified include lists while at it.
>>
>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>

That email no longer exists. Just use hverkuil@xs4all.nl or
hansverk@cisco.com, either works, but I prefer my private email.

Regards,

	Hans

>> Cc: linux-media@vger.kernel.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> ---
>>
>> Depends on commit ae19ba915eb7 ("drm/i915/display: include
>> media/cec-notifier.h and linux/debugfs.h where needed")
> 
> I'll resend after -rc1 and some backmerges.
> 
> BR,
> Jani.
> 


