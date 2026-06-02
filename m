Return-Path: <linux-media+bounces-63401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EvdnK/H3HmrHawAAu9opvQ
	(envelope-from <linux-media+bounces-63401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 17:34:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C9262FD05
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 17:34:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HFR9Dsfo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63401-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63401-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1716C325720E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 14:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84527360EC7;
	Tue,  2 Jun 2026 14:57:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0186126FA7A;
	Tue,  2 Jun 2026 14:57:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412244; cv=none; b=CMduJIKLslQmFvHSd38yTDJj22yLbMNw6Fpeo0OU5fmm8ZylH3K9Ma4FJNO9zXMgnd4HPeEFk8VUN6sB5c7X85d74IVm/nPhZ7qRwvny4EyJBf4pu/LtWnGupe7jYR5KZr4QOwpWD+9BjH4seaX8LzlQwJLvlqfpc5o1mauP/t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412244; c=relaxed/simple;
	bh=3a8roC2lWx6gxRjemzRLNrw72DeHdU5h79igg6qWtGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpGp2BXXG0Xv6rhY6RQVIL2fHgN0zAbRLrGC7TA8YSrio0C+NIha0XTLHQ52QE0AfJ/Wj/RWzx0z4zgFyJAVplcScanZ5AGnGETWzKp9DdyjIWBXenWDh0vY9c2144EZ9RyBsXacNKGZO2lXBnDTCGkGlbkmgYPsnIluydTCAWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFR9Dsfo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AD01F00893;
	Tue,  2 Jun 2026 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780412242;
	bh=9jp3g2EDN/gKi0hpggFOmttoIVZamgMz0NUya4wI9Ck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HFR9DsfoKsCRdGlh6HKxIUg4mH8Ut7l+zGezqSrQkqTn09UCOHVlvjGloR7Mzj28i
	 /8Gnp0KyS8gjHaSRmsOwYxBCSA5HlLDmYCnf2neNQLafC1Fx/Te+8VjaBuHzjthtnd
	 isyJ63dzImnV38vF+pBbZSSiOq6rcLMS7fq/hRL7lpapTAK7cE9PhETg4kKZsFE27k
	 zNjq7bMiLiRhdZfDf0fx3gb5u7P1xHpCgVBxtYITAftspshL4tfRHGbH4MQT/sYGDy
	 xgy/VdF+2uojyz+wHmBK2Hw5gNfg2nDerJlTkMJspZI+ujQfCxYsV9fkJBwrRA1Lr1
	 Iu31VM4490F8Q==
Message-ID: <ea9f45f8-4389-4c78-a4ea-dc08d3e461c2@kernel.org>
Date: Tue, 2 Jun 2026 15:57:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: Add myself to dw100 as reviewer
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: p.zabel@pengutronix.de, xavier.roumegue@oss.nxp.com, hverkuil@xs4all.nl,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Klug <stefan.klug@ideasonboard.com>
References: <20260601155059.1332290-1-bod@kernel.org>
 <20260601155059.1332290-2-bod@kernel.org>
 <gDn4RCB4gOUFyNFwqb1Z_PKSw6MZAJBkl09jatpSLYWEfXlHnTAeiOZuR08ssuKr3yWKuP-Bb21qRDbqy-8ceA==@protonmail.internalid>
 <20260602085551.GA850227@killaraus.ideasonboard.com>
 <b19493de-5d39-49d8-a5f1-acfc613cfacf@kernel.org>
 <xo9COx4XIu103yiTmWeu4_OnKc-bHmgB-IaOv37jRRZYhPAYKgro5SL2R3N6JmwGuH0Df3EAjkjkSPuOkXGyzQ==@protonmail.internalid>
 <20260602142603.GB850227@killaraus.ideasonboard.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260602142603.GB850227@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,oss.nxp.com,xs4all.nl,kernel.org,vger.kernel.org,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-63401-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:p.zabel@pengutronix.de,m:xavier.roumegue@oss.nxp.com,m:hverkuil@xs4all.nl,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stefan.klug@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7C9262FD05

On 02/06/2026 15:26, Laurent Pinchart wrote:
> On Tue, Jun 02, 2026 at 11:10:24AM +0100, Bryan O'Donoghue wrote:
>> On 02/06/2026 09:55, Laurent Pinchart wrote:
>>> Thanks for volunteering 🙂
>>>
>>> This may however not be the best candidate. The dw100 driver is well
>>> maintained today, by Xavier as well as Stefan, as Ideas on Board makes
>>> active use of it (Stefan, you could also volunteer as a reviewer).
>>>
>>> Drivers that I think would most benefit from your reviews would be
>>> imx8mq-mipi-csi2, dw-mipi-csi2rx (technically a Synopsys driver, but
>>> used in NXP SoCs), and the new imx95-csi-formatter driver ([1]).
>>>
>>> Other candidates could be imx7-media-csi and imx-mipi-csis, but those
>>> see little activity as they support older hardware. The imx media
>>> staging drivers could also do with some love, but that would be active
>>> development and not just review.
>>>
>>> [1]https://lore.kernel.org/20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com
>>>
>>>> Signed-off-by: Bryan O'Donoghue<bod@kernel.org>
>>>> ---
>>>>    MAINTAINERS | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index ec0743b41a463..35368c2ff0ca6 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -19243,6 +19243,7 @@ F:	drivers/media/platform/nxp/imx8-isi/
>>>>
>>>>    NXP i.MX 8MP DW100 V4L2 DRIVER
>>>>    M:	Xavier Roumegue<xavier.roumegue@oss.nxp.com>
>>>> +R:	Bryan O'Donoghue<bod@kernel.org>
>>>>    L:	linux-media@vger.kernel.org
>>>>    S:	Maintained
>>>>    F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
>>> --
>>> Regards,
>>>
>>> Laurent Pinchart
>>
>> Ah, wrong set.
>>
>> No problem, I'll v2 for the above instead.
> 
> Thank you. Don't get me wrong, your reviews for the dw100 driver would
> also be appreciated, but if you have limited time (and I assume we all
> do), the above drivers would benefit more from your comments.
> 
> --
> Regards,
> 
> Laurent Pinchart

Eh, not a bit of it.

You flagged we should do some cross review. I'm happy to be shown to 
whichever drivers/files it is you mean.

---
bod

