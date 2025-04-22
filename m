Return-Path: <linux-media+bounces-30719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC74A97021
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 17:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E951B1887635
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 15:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0626E28153C;
	Tue, 22 Apr 2025 15:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="pjfDhTLT"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB4D1E3790
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745334740; cv=none; b=qQBJ2sXVGbL5n8UTXfS+oI/DN/Ice22hXWWj79qr/hTme0RS+UPBlNbooVsaIuns/2zmUKQpkGi3ApJY/kNbCO7XQRN8OP9itUNLBQ4YgvNSu98p28jwTuVxDEq1Sgq437ihsSiLBIVZ9dxPUdlgIEoSPmZ7jELM1oQxXFwi4SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745334740; c=relaxed/simple;
	bh=bkjHdO6om6VfwqxhHRfWghPpXJtVDcj6v6MbJb90g+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+YUxlQpJSAKdyCyeloQYKl0ED7dKnSt+0ddef+5TKsnTE2Q1/V20jbgVe+CSPDu/e6CjMiWP4sKtlAprurb1nwPGNEZM1XfeqFmNNSXWIhMUS3VD9T+1k0k3bS9eLxE2UGPG8+rF+30+wAbOYYqicbXu26AWCEfAJo6G2cEvuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=pjfDhTLT; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4Zhm1Q5Xq9zjRS;
	Tue, 22 Apr 2025 15:12:10 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4Zhm1P4mZ0z2xMF;
	Tue, 22 Apr 2025 15:12:09 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=pjfDhTLT;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1745334730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bCsvBJQNW84oR2f9nd3rPrKgNisD0L6j6enSgmCrWd0=;
	b=pjfDhTLTrL8q4zE8pj2fX6VmkaAIIEjxtJr46fTlexqoOyTMFrp1tm1DsnUMfkmh4ejzq9
	ZI8P5Co+yhhC5ZZtylcVmlDgcjqBBlMMI8+bANVzEe/DmfHFOC9EqnfU2gbY2r8gfv7WDx
	PvBKgM+gVbYZcUu9ju1W3YNX0LrlbrsYRLctKZPNdEN1gDrE/5Tj3ftCFDS+9S5/RU502t
	0IqsYbYL483NOh5LIme9Pa/Ofy3MRmAlMShiuk6eDThtp2h+sQL0syWzeAP34XK3X4EAgU
	8/taZ+KS0C/NEuO1hEEaA7c8ZpRffnGzbfPUVgGToeiyl0CDG7KT721gXJ0a7g==
X-CM-Envelope: MS4xfAqwrmAkPZ9sY4GO2Jq0+cpNRvB1cDl3su6ZGH3QXd70r62SpbwYOvU5q2dlJME4ov/SuVgyr0E0i20yfgyWEFZctXKxVyTiu2fU8CRFEYiY8P6gumPc ixjM74Sp2tmTg001a25O+jxUX0CemXa154lNOZQrtDm2hkY5mKY2dOT0DB5h+LCc2IouHVXCrqPyCUpTtwcpPskmNx4tBaai3oa0OL9wAEqn2vIalpmCAKUw E2XnGhUdK0xnC3sXybHdD7UTOyYjsPGWpnRp9z4SUyRsoKU/Nc/OdKDi296h/5QkAuwY1h+NrmVOuVd6ESLr+nCHbrL02mzVASPgqoTDFz//wvfsVbDV1cIK EkM6F0FSd5j2YX/lS7c/6YMGIP4Z2Exl6cI8G0xfn6Tzuda9vqJjvpzm2k8KOfB9BNaC21q9TybRLXSvEqITDXIkQ1Aunv/iut6EGKYq1RiDsvzmTGYNVLSr l+j52QyAmQaJVVR+Z55ZpB6BNRrMFLXHbezHVNmqcDXKbfa+vO+JeSnc2vCIl/Emeq6oWZwiSj5UnHKImY8k1eIvsNLbAkqpyL+XCfLMPF1io/4XeNwJZxSp fA2BHvrMM+dxFap5pZiTuz0c9nYBzUPBkClluqxT2nyqphN/N8jXIdwhqrFlRE7eb/OGEaPpb+tZi06PXXwOivNmgsAKCcrN/8ETnaYjvyB6mqsq1l0Kizxx b3vzJKb0eJAvNZebEqTXFwN8Z6ahWRAMncRBsOFfdjoR7RdkPNd9Zo/IAiejFrLvillQC9GFvgCd5i/PbWvYHCoFZrsDuGdILb6WEfkyVa7YqaJPuVlndpBo RqW62EPS5bYYmEC2/Y4eNaVtwP74103pEmvphdGXu4GpA8zRyI8TiQY/53ujxhOwGBzADWd3DHSePBR6HqaTtkZEvEmRqgFz4S69+98hXJ5qh27+4TDouK38 k5jht7hsTnNVR8C
 b13ICWQIaoSk1yMCA9Jv3Jl/QNpyr8vObh46m5eCt208ZRcJNeiZ242M4TbUANykmCd1sT7p/RqClXnyAJvvVnYhr87tDZ3oZMAUtUcs5 ePXokS3AhMamsEA0PnDuZpZqpL3cspv2RPOeSa1+AJ/FpjYFGaYQ4YGstBPYxo2lQaFDg9fcyxH9tTNB/UH80gGIG21WDiN8+s7D8vyTr3wAXAQMnA30V86y 8kXTJZjuvuho+c4RuSQLfglrepPWSl004wqyy65mSZq7nDF4MzDxsyJNmsyHHN9+JlS4xUpHkdlApk8Ek6QdaOPsnqeVCQKLkckpJOcxHozkOXszpmxWxwNM EsLQ6c4P
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=6807b1ca a=xVxOAnYOZqKVbrsbIgLjXQ==:117 a=xVxOAnYOZqKVbrsbIgLjXQ==:17 a=IkcTkHD0fZMA:10 a=8s3bVdB6AAAA:8 a=smFrE9sGAAAA:8 a=VwnfekaSAAAA:8 a=xOd6jRPJAAAA:8 a=WN6_cwnCAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=20KFwNOVAAAA:8 a=P1BnusSwAAAA:8 a=cm27Pg_UAAAA:8 a=sozttTNsAAAA:8 a=dML_XACEAAAA:8 a=mK_AVkanAAAA:8 a=PssDBZGIAAAA:8 a=8AirrxEcAAAA:8 a=oOMWRE37rLOo8fQfbMcA:9 a=QEXdDO2ut3YA:10 a=mX_46NTfp5VFrLZRzBmZ:22 a=F_EvON2TorMte8AU-hMi:22 a=eAomlcYGng2R2mZ923rV:22 a=ndfOWLLM0rR49n6Yv1rF:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=D0XLA9XvdZm18NrgonBM:22 a=L0fzO-P85HkJbeZJe4ir:22 a=3gWm3jAn84ENXaBijsEo:22 a=HJRSn2hXXqGixlvEXVkw:22 a=ST-jHhOKWsTCqRlWije3:22
Message-ID: <b2c3472d-10d5-4573-879e-68b53426de0f@jjverkuil.nl>
Date: Tue, 22 Apr 2025 17:12:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v2)
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
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
 <cnvl2vshkwxuyfuyvunmgdgpvuwaijl4im7c7jqwdm7sa3o7kw@fnsarnzh6blm>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <cnvl2vshkwxuyfuyvunmgdgpvuwaijl4im7c7jqwdm7sa3o7kw@fnsarnzh6blm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 22/04/2025 17:07, Jacopo Mondi wrote:
> Hi Hans
> 
> On Mon, Apr 21, 2025 at 02:31:34PM +0200, Hans Verkuil wrote:
>> Hi all,
>>
>> Here is my v2 of the draft agenda for the media summit. The only changes
>> are dropping Sebastian's email and fixing Devarsh' email.
>>
>> As always, this draft agenda is subject to change and all times are guesstimates!
>>
>> Please note that I am transitioning from my old hverkuil@xs4all.nl email to
>> my new hans@jjverkuil.nl email. If you have problems replying to that new email,
>> please let me know and just send it to the old email (that won't go away).
>>
>> The Media Summit will be held Tuesday May 13th to coincide with
>> the Embedded Recipes Conference in Nice, France:
>>
>> https://embedded-recipes.org/2025/
>>
>> Note that there are also some workshops held after this conference:
>>
>> https://embedded-recipes.org/2025/workshops/
>>
>> And a gStreamer hackfest:
>>
>> https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18-may-2025-in-nice-france/4366
>>
>> The Media Summit will be held at Hotel Campanile:
>>
>> https://nice-aeroport.campanile.com/en-us/
>>
>> It is close to the Airport and to the Embedded Recipes venue.
>>
>> The meeting room can hold up to 30 people and has video conferencing support; it is
>> sponsored by Collabora and Cisco Systems Norway.
>>
>> We currently have the following confirmed in-person attendees:
>>
>> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
>> Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
>> Hans de Goede <hdegoede@redhat.com> (RedHat)
>> Paul Kocialkowski <paulk@sys-base.io> (sys-base)
>> Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
>> Ricardo Ribalda <ribalda@chromium.org> (Google)
>> Maxime Ripard <mripard@redhat.com> (RedHat)
>> Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
>> Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
>> Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)
>>
>> As you can see, there is enough room for more people, so don't hesitate to
>> register by sending an email to me. The deadline is May 2nd.
>>
>> And the following remote participants:
>>
>> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
>> Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
>> Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
>> jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
>> Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
>> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
>>
>> Note: information on how to connect remotely will come later.
>>
>> If any information above is incorrect, or if I missed someone, then please let me know asap.
>>
>> Draft Agenda:
>>
>> 9:00-9:30: Get settled :-)
>>
>> 9:30-9:40: Hans Verkuil: Quick introduction
>>
>> 9:40-10:30: Jai Luthra: Per-stream V4L2 controls
>>
>> 10:30-11:15: Paul Kocialkowski: Stateless video encoding uAPI
>>
>> 11:15-11:30: break
>>
>> 11:30-12:15: Ricardo Ribalda: Openness Framework for ISPs
>>
>> 12:15-13:30: lunch TBD
>>
>> 13:30-14:00: Laurent Pinchart: Review of the status of staging drivers
>>
>> 14:00-15:00: Hans Verkuil: Status of Media CI/Multi-committers
>>
>> 15:00-17:00: TDB
>>
>> Please reply with corrections, questions, etc. to this email. I'll update the agenda
>> over time. Again, these times are very preliminary.
>>
>> Also, as you can see we are light on topics, so don't hesitate to add more.
>>
>> Part of the reason for this is that we switched to co-locating from the ELCE to the
>> Embedded Recipes conference, so it is only 8 months since the previous Media Summit.
> 
> Ups sorry, seems like I'm late :)
> 
> I procrastinated to these days as I would have liked to be able to
> propose a well structured topic about multi-context support which was
> presented 8 months ago. Since then I paused working on it but I should
> be able to reserve time in the following months.
> 
> Unfortunately I wasn't able to dedicate much time to that, however in
> the weeks before the media summit I would like to explore a bit how to
> unify the multi-context support with the m2m context handling, with
> the aim to use a single mechanism to support both.
> 
> If you have a tiny 15/20 minutes slot I would be glad to present a
> plan to you, Nicolas and other more well versed in codec support than
> me.
> 
> Thanks and sorry for being late.

No problem! I've added a slot for this topic. I think I can safely assume
you'll be there in person?

In any case, both the agenda and the participants list are now nicely filling up :-)

Regards,

	Hans

> 
>>
>> Regards,
>>
>> 	Hans
>>


