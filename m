Return-Path: <linux-media+bounces-21082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0937C9C10EE
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 22:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B44271F2192D
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 21:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAA6218D6B;
	Thu,  7 Nov 2024 21:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LPEoxixV"
X-Original-To: linux-media@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5858E218313;
	Thu,  7 Nov 2024 21:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731014640; cv=none; b=Nrx90KxIFKpaD6IRKnI7bzWvINTlLHIp78IFQGcfkaVK3sUj0plwv/AsDmvA7CMEi1TWVmJ9xF5f36tYCJqgj3ab9wkOfYrL+UsEmyixcvP6kCBZ211FGz4WwH1ZRveSzxMip2BNhKRAoEKqTPJdFjKFE2rvQJ8i+fSJPCvB6Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731014640; c=relaxed/simple;
	bh=9LkBI3C6kD8JEl0wtx2VRjvRgTzIRnyR2AgW3nixLQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/zlJa8PnkREHDeeB7HwfCOsx32aWQSVwTmkyM6mjSQ3BYGFQwBaUumywabt8qp9RoDA8MQxpSnrxot96nlqrcVys6LPdnH7SIfyWIh/WvEle3PMuGY+Mo43T+XOn/QpX4UaP2U4pCkh0Zh09y9TuTEIYXso+FuGybaCQXfL5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LPEoxixV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=3pYTYYb1/To+QdfwUXIh4HFvD0hPTWesxwO7yD+UceQ=; b=LPEoxixVx1h+sI2xi7uE4kQwiD
	RfC13yFgeGed7ODGQutbaI09XspRgPleBbDnESvLfjl7IZlEC51YJVB58leFKBDZvZsRv6J203nqv
	WmGi2lu71l2NzQDM0EXpvDkOU7OnawZG8EFFrypmIMsee3xjWmk5TwBeIbyUMQWoqcd0fa3xhUZJ7
	A2UYHGHcLU4QgtqC6uJVQD4I/aCXl3b6pm2jX+yTBhEhwov3v4hyeLl5KJnjcItvP2dsZpKsrH4S4
	foeeTDT7CEUtIWWk3j4z+S6trc4nVp5Bx95nhhOH6uC8OO7GIq+cnZCdi10Z9v3Mvs+4OFwDHlaPS
	v4ujPg8w==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t99ys-00000007R39-2i5x;
	Thu, 07 Nov 2024 21:23:55 +0000
Message-ID: <c8b67896-b1d1-45fd-aab4-6ff8ce64a1e6@infradead.org>
Date: Thu, 7 Nov 2024 13:23:49 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: Add guides section for debugging
To: Jonathan Corbet <corbet@lwn.net>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mauro.chehab@linux.intel.com, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <20241028-media_docs_improve_v3-v1-1-2b1b486c223e@collabora.com>
 <87ldxu235z.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87ldxu235z.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/7/24 12:35 PM, Jonathan Corbet wrote:
> Sebastian Fricke <sebastian.fricke@collabora.com> writes:
> 
>> This idea was formed after noticing that new developers experience
>> certain difficulty to navigate within the multitude of different
>> debugging options in the Kernel and while there often is good
>> documentation for the tools, the developer has to know first that they
>> exist and where to find them.
>> Add a general debugging section to the Kernel documentation, as an
>> easily locatable entry point to other documentation and as a general
>> guideline for the topic.
>>
>> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>> ---
>>  Documentation/index.rst                            |   2 +
>>  .../driver_development_debugging_guide.rst         | 206 +++++++++++++++
>>  Documentation/process/debugging/general_advice.rst |  48 ++++
>>  Documentation/process/debugging/index.rst          |  21 ++
>>  .../debugging/userspace_debugging_guide.rst        | 278 +++++++++++++++++++++
>>  5 files changed, 555 insertions(+)
>>

You two have probably already gone over this, but I would not go
looking into Documentation/process/ at all for debugging advice.

IOW, I think that these docs belong somewhere else.


-- 
~Randy


