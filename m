Return-Path: <linux-media+bounces-49065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ADACCB500
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 11:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AF733012756
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 10:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2316533CEA0;
	Thu, 18 Dec 2025 10:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBZyg3z+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB9033CEBF;
	Thu, 18 Dec 2025 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766052766; cv=none; b=WLLZeD4PNSEjdWJ/tPV+mbY+fdVC76uSI/Kpkf8DUFNCnQH6Jtl+NTUhUktdL3WOc4XMZ7iKmA+fPuBE0doTWaxXmHLGwYlCVFafZ36T0gP56auMrcNx0PkiHiY1khFA57H9m65ADE7simbuahzb+WzRIyg96P0XEzvRMvSxgi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766052766; c=relaxed/simple;
	bh=SXv7/CChtg+veUFY2FOAVOi9sIz/SkLoMXxvPciPXqM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u6OxKi+SFCeIEZffZp0c8hUM0SE0Kz87sLpcRa4UaydR5nk7CzkCh5DJ6PLisuR2zRXZQND6+XWRz3U3l0T6zB2br4Di8mad7i+T6NrTIfEcqiV6VGCT4QnCoDU7VY2fAOekNNdZYMvLkAiI5OV3qGYcc/0TwiBqdbMU3kGlD74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBZyg3z+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69BCC113D0;
	Thu, 18 Dec 2025 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766052765;
	bh=SXv7/CChtg+veUFY2FOAVOi9sIz/SkLoMXxvPciPXqM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=gBZyg3z+UR2aWeUXEE24gqSoyEuuCtbz1uBEuJb3LnU170oz1wSEAB+9FCZL7kQ+F
	 Vi6BiMfm+yDOllvK14OeaqE+hll89AeI9JHwEF9RwLOCac8Ez1G09hBcy5zQxzKE0m
	 VWLFnQxcBvfkNkroGQDfMYxOF9snR6/5fGwt8lKHalIHxanl/hGJxMZC+EiJd6xBLu
	 lqmsEOhQ4kY/kfiC2CIpsjsxSKI7g0fDZ7CZRMCw9ZcmVYlNEl+oGD3phySMfEVAK3
	 MQXEnfkHcrlJSdISOdKDNHFtsWS+pOdHbShYb/wz0cW0rMCL+3C3b1Y3uMtknYEPSe
	 nKxDHyT8eDpgA==
Message-ID: <18f85697-358c-480c-89a0-8559f600f62d@kernel.org>
Date: Thu, 18 Dec 2025 11:12:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 0/7] rust: add initial v4l2 support
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Frederic Laing <frederic.laing.development@gmail.com>
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, alex.gaynor@gmail.com,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, gary@garyguo.net, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 lossin@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
 <266b9b35-aed1-4c2f-9fd1-4da349876ac5@gmail.com>
 <73B8194B-4E21-4E5D-99AA-54CD273858B4@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <73B8194B-4E21-4E5D-99AA-54CD273858B4@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/12/2025 15:35, Daniel Almeida wrote:
> Hi Frederic,
> 
>> On 16 Dec 2025, at 14:03, Frederic Laing <frederic.laing.development@gmail.com> wrote:
>>
>> Hi all,
>>
>> I’m new to contributing to the kernel and was reading through this thread. I would like to ask about the current status of this patch set. Is anyone still actively working on it?
>>
>> If it’s unmaintained at the moment, I’d be happy to take over and work on addressing the review comments and resubmitting an updated version.
>>
>> In case you're wondering why I am interested; I am currently working on camera software that utilizes the Microsoft Kinect 360 and V2 camera variants. Luckily there is already `drivers/media/usb/gspca/kinect.c` but it has some errors (like reporting invalid frame rates for color data) and design flaws that makes it impossible to stream depth and color data from a single device at the same time. I already got a new user space driver working in rust and would like to upstream it to the kernel to replace the older kinect driver written in C.
>>
>> Thanks for your time,
>> Frederic Laing
> 
> I did not hear anything from the media people so far.
> 
> Mauro, Hans?

Speaking only for myself, there still isn't the time available for me at least
to support rust. We also need to get the multicommitter model started, which
is only pending on the documentation right now. That really should have been
done this year, and I really hope we can finish that early next year. We
need that up and running.

Basically the situation is unchanged from 2 (?) years ago: too much to do, not
enough time.

I don't see this changing for me for 2026.

Regards,

	Hans

