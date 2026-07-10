Return-Path: <linux-media+bounces-67284-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FlaRItvdUGpA6gIAu9opvQ
	(envelope-from <linux-media+bounces-67284-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:56:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629D73A763
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:56:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67284-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67284-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D553B30039B5
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5306F426D37;
	Fri, 10 Jul 2026 11:54:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8526F3DF018
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:54:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684485; cv=none; b=todTLSg6Po+lF4TCkF+7kwaKtxZeEuDSl3MQQ7oONb/MqBmxkRKfk1feKHIDvWLBAIhqkUK/QLHiEss5hbLpnzhKkRXSAN3wUMlfPDqAZuzHRf7IthM0nq3NBT9V7aiLPQn/6FQzgyi9xl+2KJtqE7qxaUYaKUi4qmooL0Kdxyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684485; c=relaxed/simple;
	bh=GCWVyBroHWdqwDdI3fyaj+P0cYi9W1+dTfPtYlS5hoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6/2zNjxzodbOm1+OFLXgT9qG91Phru6gINo/kaX/N69+xegJiMkiqgsEVupyP355FH87bDLgeutgf6PEcwf0QFLvCHpjg+XZ1TC9rQsals9s4r2KHiV9xqjfY6K8xUC4TCmDiWgG1FhGXqUBsY3nCxi8br22N5Ys4VBp0TX6JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wi9o1-0001Ng-OC; Fri, 10 Jul 2026 13:54:09 +0200
Message-ID: <00b18307-f982-44bc-bbab-4a640753d8fc@pengutronix.de>
Date: Fri, 10 Jul 2026 13:54:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: v4l2-common: Add v4l2_fill_pixfmt_aligned()
 helper
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-3-tommaso.merciai.xr@bp.renesas.com>
 <ak9pPzjABetdgUiq@zed> <210aa2ee-8931-4dd2-a51f-eeb0c205d647@pengutronix.de>
 <alC6DDFZ23q5h33W@zed>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <alC6DDFZ23q5h33W@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-67284-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,vger.kernel.org,kernel.org,collabora.com,linux.intel.com,ideasonboard.com,samsung.com,crapouillou.net];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1629D73A763

Hi Jacopo,

On 7/10/26 11:38 AM, Jacopo Mondi wrote:
>> This is due to the fact, that while we have a hdiv of 2 we also interleave
>> the cb and cr parts in a single plane, which results in the stride being the
>> same number of bytes as for the y plane (and vdiv isn't relevant for the
>> stride).
>>
>> Therefore the stride scaling also respects the bits per plane (bpp) value to
>> determine the scaling.
>>
>> @Tommaso : While the sentence looks ok, the NV12 example is misguided. The
> I guess the usage of NV12 was as example of a "formats that store
> multiple component planes in a single memory"
>
> NV24/42 works the same, but being 444 it needs the chroma plane stride to
> be a multiple of the fist plane stride and might prove as a better
> example ?
>
My potential concern is that NV as an example misguides the reader into 
one of the following:

- It's only for formats which interleave cb/cr into one plane (whereas 
YUV420 also gets scaled)
- NV24 in the example being though of including the NV24M variant 
(whereas latter won't be affected)

Maybe smth. like YUV420 but not YUV420M is a better example (could also 
be NV24 but not NV24M)?

Sincerely
     Sven


