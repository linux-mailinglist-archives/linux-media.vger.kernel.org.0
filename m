Return-Path: <linux-media+bounces-51575-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHetMtNzd2n7ggEAu9opvQ
	(envelope-from <linux-media+bounces-51575-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 15:01:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37299893EA
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 15:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 664473020FDE
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 14:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1758333B6EE;
	Mon, 26 Jan 2026 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PKvpJ32S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B431EA7F4;
	Mon, 26 Jan 2026 14:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769436104; cv=none; b=Ogp0GpgwG+Wm44dU59Aggp6Hu3MJ8h24I7P0rie87dah5fWnJ5DNqwkg1voyA/7Di7VWt9KwmC9jsca5V/zgec5ldsQMG0qqYBGM5G2xAbs1eQt2n9JgZYcQdC5/tJhQPxNF/Mbn6pM+CdNHG2z+0RGVyINcEELHnr8/CLyg+Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769436104; c=relaxed/simple;
	bh=22RF8237uvCNNw+Vgrfmq8nxaV0B4xiccDu6+ja3EMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CA3hhLQ6Ka69IKwQQIomWXm/zf+ZO6ANFlaaY56S3kLguS5BHseNm1RYdLN1hOnktHGTDLAv3yYWG5fnFj9/Cq0C84HLMNPgBkvm6z61bqcYVkKNJPA3GY9Fi7HmJy3Xgkk7tuEwVEf5Svh6fK/q8AGMkRQpi+rn0dKIODHd6qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PKvpJ32S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E15AD12D6;
	Mon, 26 Jan 2026 15:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769436064;
	bh=22RF8237uvCNNw+Vgrfmq8nxaV0B4xiccDu6+ja3EMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PKvpJ32SqLnDxx3bV4ke8kVNCr61d4QsFJ3Qbn7QAShdWr0NcdNidFp6HWOTqWG12
	 lqpJc/yc02/ityoxK+bl9Zj36LueUCCX5MC4rYaRH/pJWNeF64My3FRartTPmyqzRh
	 OPvvzOPl0VNyekGwSwf5UoIwUnOtRZ7yVUUVK/cM=
Message-ID: <9878845f-c403-492c-a673-90c91472ecc2@ideasonboard.com>
Date: Mon, 26 Jan 2026 16:01:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] media: rcar: Streams support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
 <20251231095739.GA3091492@ragnatech.se>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20251231095739.GA3091492@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51575-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 37299893EA
X-Rspamd-Action: no action

Hi,

On 31/12/2025 11:57, Niklas Söderlund wrote:
> Hi Tomi,
> 
> Thanks for your persistent work on this series!
> 
> On 2025-12-16 17:18:17 +0200, Tomi Valkeinen wrote:
>> Add streams support to Renesas rcar platform driver.
>>
>> The series keaps compatibility with the current upstream for a single
>> stream use case. However, in upstream there's a limited custom
>> multi-stream support implemented to the rcar driver, which will be
>> replaced with the upstream's Streams API.
>>
>> I have tested this series on Sparrow-Hawk board, with a few different
>> setups:
>>
>> IMX219 connected to the CSI0 connector
>> - The following patches applied to my test branch in addition to this
>>   series:
>>   1) The v4l2_subdev_get_frame_desc_passthrough dependency
>>   2) Revert of commit e7376745ad5c8548e31d9ea58adfb5a847e017a4 ("media:
>>      rcar-vin: Fix stride setting for RAW8 formats"), as that commit
>>      breaks RAW8
> 
> That is so odd, I do grab RAW8 on V4H with a IMX219. In what way is do 
> you see RAW8 breaking?
I think I found it. It's broken for all formats and resolutions, based
on luck:

VNIS_REG has the lowest 4 bits always 0. From the doc: "These bits
specify the width of the transfer destination memory in 16-pixel
unit."

We do nothing to comply with that.

 Tomi


