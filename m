Return-Path: <linux-media+bounces-30680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 504BAA96054
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 10:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55EEC172790
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 08:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F88622A810;
	Tue, 22 Apr 2025 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="FSh9Vqsf"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E01EEA40
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 07:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308794; cv=none; b=TysuCS0c2qxflJlS7wSaSCD/txtXywJql0C1d+zxzMWTV3C03VqW1r3mTiHAgRGyUTFKWbljfZDIKzBR5HrrgEfH3ttL9WV5r1/w2teZl6Ckygxsz9DyWRsZoDX35j812ttrofTl3cyoB5Aw1X7smHvZghUfb6iPQ58QxlxvhWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308794; c=relaxed/simple;
	bh=7TTMnFX2my5fe7aDopliONf9uqHbdUqVA4Tm0JxC1Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHAJgogJT9UWKlPCa2PoitsaNLXoS/bxn2cHhez9C2r24hcvqb4U1QqivEd0c/9KvVuDL/ztOlX8VjM8Dt4GYzwuBgthfWnDJshi21250oeABeDA8XHOq/R3dfR2K2DsBBvqVex5/EY0NeWzLNlrw/0VuJ9Z95GqdDxgxyleUHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=FSh9Vqsf; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4ZhZQM6fqqz1NQr;
	Tue, 22 Apr 2025 07:59:39 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4ZhZQM0bnYz2xMF;
	Tue, 22 Apr 2025 07:59:39 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=FSh9Vqsf;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1745308779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Yz17mxaCFOr4sMpuMOqi4rY5STNQJb1CzWaIckT63Ug=;
	b=FSh9VqsfzkQuWTo958FKZNyYA7ptizBWjCICS1bCty8UYn3BzA/EHl6y7TMOpBo4A0jF4u
	NCP25T9pvpjsXmOwgHRFDpL0X+sP+21H1srlAlN9c6MrHqVbP4JZk/ZHxZoVmp5uu+ELkV
	1JRD+BPJ4vRpf3ZkqpRGrUfKL4mWhyCv4uyLp0L4qfIRUOuajJxrtRJKvANS9eo3nUXatU
	pnsmMpCcopAXR8XQ1+ohPvHFGCM+qrZtdAmXYtreFbd2yBqxolNRm9R5lhYJGiD6vjff3K
	BKuD/s1QLCBgozNDvw9ZkiuNNSJJn52s3H+xp2RUEIpNDfc2Cs7TNdp60upYdQ==
X-CM-Envelope: MS4xfAGu1m0PF7IHvxgaEZ+iDF9lUHtDClr/jFALunt2x+8Y1jc2E9rZXLiHDfMPK1zC42jbaalidSjW8V7gxc/h3TUiCq95luTtX+1sGQJVH618cJKZqBMW H35Iz46HqUSGpTX06WlIQTN7MsWpCMilZSMNtAu6AOXsgKErQclrTvveviK4cYr6py4DyNrDJ4kcLoUKX/nrgsz0oIIP4BN0UjhgASZGHvcuwPjHp+OTWXfN PvYTo5rjc+jZlqIvUlJVEkoEwH8kDfBAu+AMH2GFv245Vqy8WWSCQsHK2bWwXxFrSl/kqW3Z233CmuVG7SxEU/6dyrhG25HpusQ4SLYfPbIdvPLH3ey/YNOx jkvfid3pfJYb1RVJr+iY9T7nKnGBtI35M/W9vh6uAy7ITvKaFaSYNgY0qPsgY0wvDIWH8LSb2eozQ5Cx+jZT4OktF/4P7DQsYAlgabmsY2Tl7avI6NODTlGu 755hrJ72QoeMW96W8j0rByvF9K3dBKzfN/HPbC9GxZYp5qEo3Gl3kfMWJGU+EKuHxxJzbrRNT/pPgdI/EdZtY8DEDh8cU4qjqf6i37/aILb7qqSEWVplx2nD Yn8FY0miqU9x6CnWlOfhuakzgeYR9m7TiepPfRDqMBvQrxPH8Sqml4OZojYl1/ACR2nHFLUv/qFaL7B+qRAdQOhO9Jlt54mQEs4ogkYdAxHS2X8A3lfYAjQJ RbZTPjYq6+ILdNQLCv3iEUF3JlYiDyTA4hMdkBfdMzhtkIb6fZb4wyLj7i+ctk9i0xVTpXjwEVSu4AtACzM7ZGO68WpNuCeGpQ1IXfxhEZwWFhLtfYSjCJP3 0qp0/3V+96DHZNdUL5IJJFyY9ptrVDNsEl0+l8tqPXt6vskN1VjqUJLwCoctYG5UAsPGvj4UY0MAwaR0kll2EW2kSox8dxLRo260l4R+kRVeJWxdlRQuE+jq 9nPgU6AusFDi2hG
 N5IMoxoEqCMrM7Lqpq1AQGGQesdlVxx+NjDJ1A+RvgIai4bvM4Jb9UywARHlero5wlPMUvXCBRcaGvBjetvUicgetp+rdB6TCCJhNzDzm CZZfK6/gDZrzNVMaLpYHsZqIbtvc3KpkTgle61cbIAS3AEqmXTOS8DQSY2kuRMUAiB9rwNKsBDy9rW0kUCxBF5vYW3ihgzHinLql5J39ZDTJfqKC0rhRMZ+s m9FlcFvSMaA7apzyYu/1YMz7v3g2W+HHO10EaXC+riJ7yhSyCbvTsKwRgRQKAVQ1bQjrHs9OUtx/JP7t6SWpRZpDXvqCCQz6KjeaP0pnNK0eRmhrRAUyGgtc WmFzJI1/
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=68074c6b a=xVxOAnYOZqKVbrsbIgLjXQ==:117 a=xVxOAnYOZqKVbrsbIgLjXQ==:17 a=IkcTkHD0fZMA:10 a=GXT28zKt2ES5jp1BmdQA:9 a=QEXdDO2ut3YA:10
Message-ID: <34e53856-1a6b-4db2-b6ce-a8862c415034@jjverkuil.nl>
Date: Tue, 22 Apr 2025 09:59:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v2)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa
 <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Hans de Goede
 <hdegoede@redhat.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, Maxime Ripard <mripard@kernel.org>
References: <71a1ba46-04c3-4694-95e7-9e2906b1d899@jjverkuil.nl>
 <aAdGN8QaxU4XQcL2@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <aAdGN8QaxU4XQcL2@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 22/04/2025 09:33, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Apr 21, 2025 at 02:31:34PM +0200, Hans Verkuil wrote:
>> Also, as you can see we are light on topics, so don't hesitate to add more.
> 
> I'd like to propose identifying camera modules as a topic.
> 
> The camera module isn't a functional component in the system and so has
> (mostly) been omitted in system firmware as well as UAPI. Being able to
> identify it, however, is becoming more and more important as the user space
> becomes less and less system specific, largely thanks to libcamera. This
> isn't just about passing information to the userspace as identifying the
> modules themselves is a problem on its own.
> 
> I intend to post an RFC set regarding this to LMML at least a week before
> the summit.
> 

Thank you, I added this to the draft agenda. Do you have a guesstimate for the time you'll need?

Regards,

	Hans

