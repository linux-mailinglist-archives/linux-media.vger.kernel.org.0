Return-Path: <linux-media+bounces-13905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E658491208D
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 11:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90F781F24BFC
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 09:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217B416EC10;
	Fri, 21 Jun 2024 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZI5fmlmm"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008CE16EB51;
	Fri, 21 Jun 2024 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962114; cv=none; b=iOKrbE67G70c8hkQzBBYCf2foxRe5FK8YfOcAfoTGC2aOM+N/8/Ys3X/4Mfc8mRvnGslIeE1HmGZNBhCRH5Hm8V9UQMP5qnOJUJlen4cVV5ZJiuDoBANFRhs/DPKWxiOPF0Ge0rIKIB2IBP9y3VHKvNod2zPjH+UTRjuK+6XF9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962114; c=relaxed/simple;
	bh=Pi27VntCnhtxxGjw86sEx39ep/qFaupg9gZ0tlm2Yuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRU8K64EVfhXUeM6/vmQbPrdpNdnOkU27IgzFiW5DczP4xJ5wPPJBH/psg3bmuEnpYRpfoFBQRYCn/8oo0t6Yuj2QOaU+Yi5jl/i+Ykb6S+oi+p7ZC5LbyPaCgqcEP+oNGiteYXdTACxa3nUyYLSqEeLrDd3vsXrFW5m5VVaNU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZI5fmlmm; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718962110;
	bh=Pi27VntCnhtxxGjw86sEx39ep/qFaupg9gZ0tlm2Yuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZI5fmlmmCp6rud/ONymtgmAUfX3s9VKrjMsB7xE2Ap7kz3emJE19vnYAUk3sGcES4
	 wWZAYI2W63dlnnYZsLPmnkSf8H5EIFFeOJ24qV/IG8sMtqS95vok+5SZ55tRZF07eK
	 zxGQDNPvr4CSs0yYd8rJ5GAjhO7IUA1gx17CS+AInCT2P0QMJSc8n9W8seuDMwdIHC
	 cXy7sO7XaiVW3AMQeWntpQ8palvpU7wK4vs+GEECnXcU7Wg/g7H6uVmoZOXZFpEgmE
	 xS+cxGnjwQhoVwh2IWWBjkqxTQ0RAM9YuCfbkGEYDVP5mzbDY2TJozNTGiYSQHZEFe
	 koSHtdWUJ737w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B5C1637820FA;
	Fri, 21 Jun 2024 09:28:30 +0000 (UTC)
Date: Fri, 21 Jun 2024 11:28:29 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca, Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v13 03/13] media: v4l2-jpeg: Export reference
 quantization and huffman tables
Message-ID: <20240621092829.2zdmebqm4zr33ki5@basti-XPS-13-9310>
References: <20240607131900.3535250-1-devarsht@ti.com>
 <20240607132831.3551333-1-devarsht@ti.com>
 <59866428-342b-4ba4-a7c7-2df1477aa7e6@xs4all.nl>
 <e948cea7-d5c7-a7e6-d921-ad7c2f93cd5a@ti.com>
 <904289bb-96a0-4a0d-9046-96acd8843b98@xs4all.nl>
 <02462e7e-bd55-2374-10e2-240e9d94c5db@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <02462e7e-bd55-2374-10e2-240e9d94c5db@ti.com>

Hey Devarsh,

On 21.06.2024 14:22, Devarsh Thakkar wrote:
>Hi Sebastian,
>
>On 20/06/24 12:32, Hans Verkuil wrote:
>> On 19/06/2024 16:19, Devarsh Thakkar wrote:
>[..]
>> I've reviewed v14 3/6, so Sebastian when Sebastian posts a new PR I can process
>> it.
>>
>> Ignore any reviews by Markus Elfring, he's a troll.
>>
>
>Just wanted to check if we are good w.r.t V14 [1] and it's possible for you to
>create a PR with V14 as discussed above?

Yup looks good so far, as soon as I have a timeslot I'll send it out.

>
>[1]: https://lore.kernel.org/all/20240618193651.2771478-1-devarsht@ti.com/
>
>Regards
>Devarsh

Regards,
Sebastian

