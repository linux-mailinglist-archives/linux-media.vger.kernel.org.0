Return-Path: <linux-media+bounces-5165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4E8854F2D
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 17:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17C561C224DE
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 16:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CC8604CB;
	Wed, 14 Feb 2024 16:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b="bom7zw32"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.damsy.net (mail.damsy.net [85.90.245.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4620A604AA;
	Wed, 14 Feb 2024 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.90.245.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707929694; cv=none; b=oiVJooyr2W8agYRXpySkB78O81qrisXbLuTrH8YErbqkav/P7JBqHPIEq3V27pOrW64AIm26L0ohUz0ygRI0DZFPBrnG8RfYQFPd7nUXfIwhfk4z36Wp3fEg+3td9TwXf3IrMCdjIBLZMr5aDkjyeYLfgN3D1nXHA9BdiuGZoug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707929694; c=relaxed/simple;
	bh=g/kxWZe49evQ9fXPrBwG290l6vZLeGrk5CcEjO7UbcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J3iWboP2/dz4aCmE2LAtX9f+WBxpmxu6ULtSpNovn8k0EbBZc30P8NfhIUSIN1A7POJti1NHYipR3QMQFmMe8atvGQQobXBopzZlUHY4lqVhAr4EQsb+bhmJIQsQe/WeWEz9t/+yQX0hUEizYoqz/MjiCvNpTX9AegV6OUKIOqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=damsy.net; spf=pass smtp.mailfrom=damsy.net; dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b=bom7zw32; arc=none smtp.client-ip=85.90.245.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=damsy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=damsy.net
Message-ID: <645c241d-21ae-4b03-82e0-84eac1355269@damsy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=damsy.net; s=201803;
	t=1707929689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nboMYgNDy9pIH3TJ4ZbKU0pYFKnkSMT1bkJGnsLyAY=;
	b=bom7zw32pw8EoI/diDAPtBDqNqg2+pOmnom/tAJUIZQtXdqMGASvlqnKbRkkb+4uHVjMJw
	PRr/eUK6Z2pHq5QDVv4IKWUMpH/SY0kzZpxVizw1eNnc7VAbimrcU9a9gYYBCFy6aAAyB9
	JQZ7fnBX6zI7Bcwymv4EdUOsRI2ar6rpLpu2GiqDQu8aEo5y0P01idDCmYDDMkfDt+PHrG
	eT+hV8GUX2Wv568vs7TJ7NHpmyjGXy4Ja+/8dRG9ryLHFvHx+vucwoGM5OE1eyjNobZGNf
	9HRTFIhbdUAdNdFyqb9kS95IXv2PQVW0O95GfXmlPyW5QNDU7fmX1FT4A2mdRg==
Date: Wed, 14 Feb 2024 17:54:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/6] tracing, dma-buf: add a trace_dma_fence_sync_to
 event
Content-Language: fr
To: Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
 <137e8d79-bf19-4782-918e-0c09b029e3aa@amd.com>
 <20240214101041.2fbf9b87@gandalf.local.home>
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20240214101041.2fbf9b87@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/02/2024 à 16:10, Steven Rostedt a écrit :
> On Wed, 14 Feb 2024 13:00:16 +0100
> Christian König <christian.koenig@amd.com> wrote:
> 
>>> +DEFINE_EVENT(dma_fence_from, dma_fence_sync_to,
>>
>> For a single event you should probably use TRACE_EVENT() instead of
>> declaring a class. A class is only used if you have multiple events with
>> the same parameters.
> 
> FYI, TRACE_EVENT() is actually defined as:
> 
> #define TRACE_EVENT(name, proto, args, tstruct, assign, print) \
> 	DECLARE_EVENT_CLASS(name,			       \
> 			     PARAMS(proto),		       \
> 			     PARAMS(args),		       \
> 			     PARAMS(tstruct),		       \
> 			     PARAMS(assign),		       \
> 			     PARAMS(print));		       \
> 	DEFINE_EVENT(name, name, PARAMS(proto), PARAMS(args));
> 
> So basically, you could really just declare one TRACE_EVENT() and add
> DEFINE_EVENT()s on top of it ;)
> 
> I never recommended that because I thought it would be confusing.


Thanks Steve and Christian for your feedback.

I'm integrating your suggestions in my branch and will re-send the series
after more testing.


Pierre-Eric


> 
> -- Steve

