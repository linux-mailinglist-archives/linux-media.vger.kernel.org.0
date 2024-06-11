Return-Path: <linux-media+bounces-12933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 875DF90374D
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 10:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77559B2CC4D
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 08:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB01175573;
	Tue, 11 Jun 2024 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsm9YJel"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7407A17554A;
	Tue, 11 Jun 2024 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095120; cv=none; b=sxyVvLaQFXzerbNm3v/EsGNzLd4MW1eOWWX8hKTDxz8KpDUINURliz+jblbHLDkLeuLSH6Jr1umuNtGeFm7zmM0JRB5pMcuiTO2X0PjmX7TdB2LbWB+rsBPonP3GDCfVYWizGP2Ky55vKNQT+vtgxgxARxkyBm/haRIoXRwRSbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095120; c=relaxed/simple;
	bh=2SEh1CNzPA8re6moiAv5IT5SN+7v5cglpdBVrbkHPKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AopSS/BLJtFFu1LB3rshEtADUD9sCJgpjX0dYiyOh3jggt966pNVUYqrmW3sTX1JICCYGkzqFjxuGNc08wz5jnKVjuYLlzkupTtTywtdKrE7vHWWWc1T4CNTpV9+NIB1rYJMOfxqWT9qZCE7X9NDPSVNh0HI/KFMwmkN61zpq6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsm9YJel; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7C7C2BD10;
	Tue, 11 Jun 2024 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718095120;
	bh=2SEh1CNzPA8re6moiAv5IT5SN+7v5cglpdBVrbkHPKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tsm9YJelGc+pxvzonTHLEEuzfrj1W2h3miu7SjEycEzKSs2XwZUzP96JlLdmkNUgw
	 fLlB63ml1lABPMOGPukPSqJWcsItK1p45jwINpnHlMlFvzQ+HelikyV33/WZuw7stk
	 U/BUYnPx1/bVfWTc20By0ExBrI8jQPJBP0cX0S3SLnsANOkDbagWZkc3Qgr4V52RPl
	 1yiPkkwfsBo76I+CJL0ibOkkaIG43692A+e7Ic8TpgV5J4XmFdlGQvPpjpt0IxW0AU
	 kccKRlRjMyqIbdhifRTfujGej7fyVrWKU2fkVDfBeTVqPXnoMaZlxSznNqcbHFQfBG
	 kmu7LdlruGE7g==
Message-ID: <b7514285-7a05-4874-a0fd-59ef16d5bce1@kernel.org>
Date: Tue, 11 Jun 2024 10:38:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: vgxy61: Add legacy compatible string
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
 <20240610150815.228790-3-benjamin.mugnier@foss.st.com>
 <b4de42ba-d884-44b1-9f0e-12f5818c6781@kernel.org>
 <ZmgIiaqJy1tWL4Yz@kekkonen.localdomain>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ZmgIiaqJy1tWL4Yz@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2024 10:19, Sakari Ailus wrote:
> Hi Krzysztof,
> 
> On Tue, Jun 11, 2024 at 08:47:25AM +0200, Krzysztof Kozlowski wrote:
>> On 10/06/2024 17:08, Benjamin Mugnier wrote:
>>> As the driver has been renamed from 'st-vgxy61' to 'vgxy61', its
>>> compatible string has been updated to reflect this change. Therefore old
>>> device trees will not work anymore.
>>> Add the old driver name as another compatible name to handle the
>>> retro compatibility.
>>>
>>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>> ---
>>>  drivers/media/i2c/vgxy61.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
>>> index 30378e962016..ca3b43608dad 100644
>>> --- a/drivers/media/i2c/vgxy61.c
>>> +++ b/drivers/media/i2c/vgxy61.c
>>> @@ -1867,6 +1867,11 @@ static void vgxy61_remove(struct i2c_client *client)
>>>  }
>>>  
>>>  static const struct of_device_id vgxy61_dt_ids[] = {
>>> +	{ .compatible = "st,vgxy61" },
>>> +	/*
>>> +	 * Previously the driver was named 'st-vgxy61' instead of simply
>>> +	 * 'vgxy61', keep it for retrocompatibility purposes.
>>
>> NAK.
> 
> Is that because the comment says "driver" rather than "device"?
> 
> Please try to express clearer what you'd expect from the patch author.

There is almost never a need to rename compatible or add new compatible
matching existing one. There are exceptions, like development or work in
progress with no users at all (and really no users!).

The commit did not provide any rationale for binding change.

Additionally, it does not make any sense. There is no point in doing it
at all. No benefit.

Best regards,
Krzysztof


