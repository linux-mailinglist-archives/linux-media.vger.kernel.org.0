Return-Path: <linux-media+bounces-64723-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8yvwH4VPLGrHPAQAu9opvQ
	(envelope-from <linux-media+bounces-64723-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 20:27:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7C67BABE
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 20:27:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=luaberry.com header.s=fm2 header.b=cabk0IKR;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="k sdYHWh";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64723-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64723-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37131301FB36
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3892E3812F5;
	Fri, 12 Jun 2026 18:24:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A0E37FF54;
	Fri, 12 Jun 2026 18:24:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288682; cv=none; b=T7oxUpMpIp+TwfTNku630B8JizFU5W5nRhTg31DONzy4/8+/MXAcvd4tcFJZH8tZoyvh01Y6NMvkIn7u8/Y7xAcfIxhhbPotUST+qKqcY4h+0HBTBVXYfx3Z8lrUONv0V5vkco3YNoY6b7E88/Sq2Uxx+d7tW1iDfFhOcj8XD1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288682; c=relaxed/simple;
	bh=vy/qcuA54hRqgak9pJ0FI7A/+2DprwpipH7kLjJc3XM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ko6W0WFoc4H1M/naAs1ODISFKeUMW43GU9oqc/19jMrORYKyrzvwefx1IW8U0AhZE0uJhACa5A0F1ASi0wa2bSPekMNuWf8sYuBVVyDYiFxG3/lRf6S7Rzav7b6NNdYPJb+laR8vQf+jV5ut92vcSKGZcjA7WK6zaEkeskSkS0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com; spf=pass smtp.mailfrom=luaberry.com; dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b=cabk0IKR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ksdYHWhC; arc=none smtp.client-ip=202.12.124.146
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 3113D1D0006F;
	Fri, 12 Jun 2026 14:24:39 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-03.internal (MEProxy); Fri, 12 Jun 2026 14:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luaberry.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1781288678;
	 x=1781375078; bh=vy/qcuA54hRqgak9pJ0FI7A/+2DprwpipH7kLjJc3XM=; b=
	cabk0IKRVESd1Fk2rZuK4k5qiHYwrmiY45pmcNs7pxAa+kNkJG33QkDhrBfPfGAm
	pXp/wayb9OEnHvDUlROXBnSqLZq2gou2wMmRebJSxb6ConSBZb2ysVv+YlpjmUPt
	VN9up3ixvbBnTqKo14lU4znwoKZRwSmts4lP1U+76tSH9WY+8tCR8Ht4EWGY9eat
	Ia/xgSE8njiHZQItpWHTPkOqhZX23atkkqYDuyE6rA1kg1a8b2jNcb5WJuUVcKom
	ZB3moe6NXShwQe5avcrGG0fZHMdmHBCyqc7xoVHH4yK8UOh1OA7/m4o3eklLJfII
	Zf57/RIb29BfKEGGR0Ssaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781288678; x=
	1781375078; bh=vy/qcuA54hRqgak9pJ0FI7A/+2DprwpipH7kLjJc3XM=; b=k
	sdYHWhCE6AkXJI4heL9rERUCbc1PagOBr1sKtxDHsDkQ9sIT9OWz/53zgyqRpwGy
	NZEDNIpdG8In9qhQI3pZfr/9R5GXBWtCo57AegFDHWL+z2D50E0faf7y8x2fSP/p
	OzYqbvrtq9QghoXfkGQH6BOb60MmoIvkequwhCNIIYFMqHi4yhpKIkZbocdyZgPz
	RYBRY2qya2vviUfS2n/RAXt4551mCWZkAj0Zls4oABx8jFpuZ8gPkKEXlWpA8HTd
	NpsI1ZB3tk8ld8mpx3y9oNPSWi4HLNlA+Mjl/sy33tuvm0UPaioRd6DDu7G2QvUk
	/qhwsXoUPMGcFfIQ+/VZQ==
X-ME-Sender: <xms:5k4san8sFrbtn-Yx3ZHS5-FLYhQeS3C9MGwaSt7Y4lA0ADGeZWX1iw>
    <xme:5k4saujfDXYOgDig3mVJVjmBs5D4I-Y73DOf5HAiGtj3pHCZfUbt1siFRovurR9jF
    QKwcFRDMGdKLt9N2JmbicN6_Vkb9TXH5QuvYLH5h-Ds3gGa6qaiEDc>
X-ME-Proxy-Cause: dmFkZTFDmBv2zFnXdXxsjcWh8Mw4raCVwLx++i+eSjULl1k8wAoqcozrtQmPP23WlIKrAt
    OafikrcjikcYDi84IlcxhSdBTjrynFYyar5p6WSUnUcn+IRVlw/xI19fW1h17lfhEri4ix
    Pw5tV5ZBd2hPjWRojneA8rv8KtzV7mf+inFOy90Plu7W9PWbZqajhTLtbQNnpUyMSpuL2v
    qNLQDxpWzh1+k/CBi8Pwlj1tK5qr0MHq1MitH8GuvJ3Q+JIfMvyKt5i/ZPCohfJvNDbklK
    Mvo0pmEqhzOXO4PJttBCtbRjpFTxxm29wCFtXdWVtSPK0FoXpguCCPBP3RdIoPSI1kzaG/
    bUhqmM9gcnNY0ehn/yH0RhFCAerCUypOgnr2xerp2iY+Vom5VMyPfSFcV3GikmMU5aSFCQ
    qjHl0tmrKDYj1629m3TOlxi4SbD40oa+IsasU3ufHxirrWHAHEvtYT8WTp7gcjXns5vBKp
    Q3NAvFvte5r0JsYh4JTXy2FZUrSiNain6IlpiBpm6XrtOlucxocga4hxE9YDRcx9UrpdGg
    BB+5f3dep6SJ2hb/lgT/3jQBlfLuOrxVJc60TswSohwGdzhTVy2zJdWTVwre9WMFddh/VC
    2o6+ox/tCTgwbQ0hMxvLw3rCfKxeAWfwrYjs4rB/4/6C5Rsr4gtdPqrpjl5A
X-ME-Proxy: <xmx:5k4satoNd5xoASBDojijOVLGqTJOjS5prDSb6zh5fT6RN_i98LJ-Ew>
    <xmx:5k4sat5Hk8gf6lItYMfL2V2oJbiYoFiRxHh91DpKIMVsP0j4Z6MboA>
    <xmx:5k4sajhRPXWy-DJUUNTJ56k0GtSXYfvG5QA0yM0gCrPo3-glflyaOg>
    <xmx:5k4sar63mGgRcNIx7lXOx_RXPnY6NGhPdjyh0uxq0i2UecQN-vxlcw>
    <xmx:5k4saiF9NXF3zxp2k_0vPzKAK1Ter8NFanwih8GezhrrlSalkN5FpzEy>
Feedback-ID: i372e487a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6D2C8C40071; Fri, 12 Jun 2026 14:24:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A74LFP6wUQ7F
Date: Sat, 13 Jun 2026 03:23:03 +0900
From: "Jeongin Yeo" <jeongin.yeo@luaberry.com>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org,
 "Greg KH" <gregkh@linuxfoundation.org>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, andy@kernel.org,
 matt@mattwardle.net, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <a9c5f5d9-88ae-44e0-9022-197c966f55f4@app.fastmail.com>
In-Reply-To: 
 <CAHp75VcL4KK=K4ZhT+Qc8VWUBsdaPcjcHJX0WJu8cty_fpJsOg@mail.gmail.com>
References: <20260527073705.1544479-1-jeongin.yeo@luaberry.com>
 <CAHp75VcL4KK=K4ZhT+Qc8VWUBsdaPcjcHJX0WJu8cty_fpJsOg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: remove redundant prefix from dev_dbg calls
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[luaberry.com:s=fm2,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jeongin.yeo@luaberry.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[luaberry.com];
	FORGED_RECIPIENTS(0.00)[m:andy.shevchenko@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:matt@mattwardle.net,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64723-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeongin.yeo@luaberry.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[luaberry.com:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,messagingengine.com:dkim,luaberry.com:dkim,luaberry.com:email,luaberry.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4A7C67BABE

On Wed, May 27, 2026, at 5:05 PM, Andy Shevchenko wrote:
> On Wed, May 27, 2026 at 9:37=E2=80=AFAM Jeongin Yeo <jeongin.yeo@luabe=
rry.com> wrote:
> >
> > Remove the hardcoded function name and line number prefix from
> > dev_dbg() output strings within ia_css_binary_find(). dev_dbg()
> > can already emit the function name and line number via dynamic_debug=
's
> > 'f' and 'l' flags, so embedding it in the format string is redundant.
> >
> > This resolves the EMBEDDED_FUNCTION_NAME checkpatch warnings without
> > introducing __func__ to format strings.
> >
> > No functional changes.
>=20
> LGTM,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20

Hi, Gentle ping on this patch.
Please let me know if there is anything I should revise.

Best regards,
Jeongin Yeo

