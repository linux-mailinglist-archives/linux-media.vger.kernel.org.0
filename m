Return-Path: <linux-media+bounces-13935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4079126A7
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 15:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F5591F26B6C
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 13:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159A2155CA4;
	Fri, 21 Jun 2024 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JxgGvYQx"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BAB153BD2;
	Fri, 21 Jun 2024 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976423; cv=none; b=PGAx2iAvo18wmlA+R7ct1CP4J/OdSLfLg9gX8Fa46UMkm6UtRiOg1tVUzSQcQN0zYc+MCNcibzCnGSO7oQ1urNKqQRbQoOF5x0N7+9U0+1ae8nsT84XR1YZKTU1K8rS3odXtI8MvNpBrZwZN9ctap/v/JAyebhLjtI7s1KIvplI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976423; c=relaxed/simple;
	bh=osld6dK3jXn9QfIFzrfdCXJj+wgJTV1og7IU+S2Vsr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dj1UAzTRYQAH7JRH4JY6Bg3+F91qmSxN7T3fOuU89P9e9I9gELMifx0kgcVSvCL0GAGAZYnaJXVlnM604KehcNsaXjtTsRsaWL+dckPd6Gt8fMJ/MbI33iHmSUaZLajf2aScGQJbzV4RfJtTfXGma5TmWVG+7dfa0SivwIhjjbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JxgGvYQx; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718976420;
	bh=osld6dK3jXn9QfIFzrfdCXJj+wgJTV1og7IU+S2Vsr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxgGvYQxSjR6XDCF8N//FsUZaEWtBizAcw48r40ry1BYk+990Kb6YJ85wmYo2nqr7
	 XF1NicpZRH6FuchNagMoT2k54vpdFpfckwDYiUD07aou4vNrdv2leQwRSnJg113pm9
	 gU7xf+G1xjTLCxCWx9bID2HO4YRyVkvS63HVyR90Cm6WJLZoLqiY1Kjh1dP3KRdLNK
	 5EZqsFzioieJ8sa+PWFlga/c3SIEi3ZTom+GtbxkFrsXc39p6hrjM2HhDvWVNto1rv
	 g0RGEu1zEAc9ZpgAtb/f7mfZ8GA1nvoYKUaAUIK889Xa3sGL8qV/96lijrlOqQ3ET7
	 jDRNPHfHu0q/w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E9C4837821DD;
	Fri, 21 Jun 2024 13:26:59 +0000 (UTC)
Date: Fri, 21 Jun 2024 15:26:58 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	benjamin.gaignard@collabora.com, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca, afd@ti.com
Subject: Re: [PATCH v14 2/6] media: imagination: Add E5010 JPEG Encoder driver
Message-ID: <20240621132658.m2utqnvwaicgiwqr@basti-XPS-13-9310>
References: <20240618193651.2771478-1-devarsht@ti.com>
 <20240618193651.2771478-3-devarsht@ti.com>
 <20240621123715.enqtdqxskdkod5ze@basti-XPS-13-9310>
 <8dda9d0c-3154-a7fd-1233-ca5be59639de@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8dda9d0c-3154-a7fd-1233-ca5be59639de@ti.com>

Hey Devarsh,

On 21.06.2024 18:14, Devarsh Thakkar wrote:
>Hi Sebastian
>
>On 21/06/24 18:07, Sebastian Fricke wrote:
>> Hey Devarsh,
>>
>> This doesn't compile without errors for me, curious, it probably did
>> compile without problems for you right?
>>
>> drivers/media/platform/imagination/e5010-jpeg-enc.c:1622:19: error:
>> initialization of ‘int (*)(struct platform_device *)’ from incompatible
>> pointer type ‘void (*)(struct platform_device *)’
>> [-Werror=incompatible-pointer-types]
>>  1622 |         .remove = e5010_remove,
>>       |                   ^~~~~~~~~~~~
>> drivers/media/platform/imagination/e5010-jpeg-enc.c:1622:19: note: (near
>> initialization for ‘e5010_driver.remove’)
>> cc1: some warnings being treated as errors
>>
>
>Yes I think it did compile fine for me.
>Did you try this on tip of linux-next ?

Nope the media subsystem is not based on linux-next, but instead on:
https://git.linuxtv.org/media_stage.git/log/
Please make sure that your patches compile on top of that.

>
>As mentioned in changelog, there was update in platform driver for return type
>of remove function which got changed to void return type. Please check if you
>have this patch [1] in your tree which got recently merged.

No that patch is not part of the tree yet.

Please note also the following section in that patch:

  	/*
	 * Traditionally the remove callback returned an int which however is
	 * ignored by the driver core. This led to wrong expectations by driver
	 * authors who thought returning an error code was a valid error
	 * handling strategy. To convert to a callback returning void, new
	 * drivers should implement .remove_new() until the conversion it done
	 * that eventually makes .remove() return void.

So your driver is expected to implement remove_new().

I will take care of this for the PR, but please note for the future:
It has to work with media_stage, unless you have a very good reason for
something different.

>
>Kindly let me know if you still face any issues.
>
>[1]:
>https://lore.kernel.org/all/20240527083416.1177106-2-u.kleine-koenig@pengutronix.de/
>
>Regards
>Devarsh

Regards,
Sebastian

