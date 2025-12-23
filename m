Return-Path: <linux-media+bounces-49412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A16DCD96F0
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 14:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A68DB3012AE7
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 13:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132E33328F0;
	Tue, 23 Dec 2025 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwQEOaVc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7330E18FC80
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 13:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496476; cv=none; b=Z3JH1Rs+xs0YwrpYxz2h5l/VMt8060GRflm3AQJBy30q+NpOhlLnNSpHw8/QnUKDufmNWeSJwI2skolqnGjsOGoBCAmkREjwl+kTCE/tNh0XosOwk/IKb2OiwO086dv+OjvfKvbezghTIMEYX0NGb6FDci98XfhHQ77cAf0qQIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496476; c=relaxed/simple;
	bh=9QBfmkoxC7trtYDQS9QbMZJDqoHjk2oYQAgowdSaI2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mn84KsutIt6w9zoST/MK+TmMvF7G3NK1y65gvaeeGiZwqfS/4PFQ2j5wmZ7liIDVfNDcKMtLCpCTb/tCfbvKpxPN4yHXrAOJkwzrySaXTgbdUq7SvSJFWr2s9EkY3U+KrMTyewRHRO6cg3c7fgT3ABKp9E8WbnI6DX6uxDIPgrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwQEOaVc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D7DC113D0;
	Tue, 23 Dec 2025 13:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766496476;
	bh=9QBfmkoxC7trtYDQS9QbMZJDqoHjk2oYQAgowdSaI2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VwQEOaVcspxPQR7JS+gUWzJxrVAUXDSXugDgohR03DcWTTdR1f3GbFkyXZiVXXKlS
	 nNXLGJmQ2MD5b1UWyPfWEJ0cVOXVLxSSEd3PRA6yOQ0YoN/7h//ooqdJNd/b1BbWc1
	 HBceq9CIKDrmRXCeF7zOydC/mlEjNy1ISoYsmd6VwkWIlr8C37h3Js1+8+84EYI7/l
	 eUuLrrqfbHGa8dYUa5G21kj/ftAQU9LrpCOCedxSxHo3mHzCW0kbDUkbEh3sCKnL1B
	 Q5j9R8H4hXkDDfedINIGlwWFxeXErvKqNPDK8/RJ2xn/8VB+H/Z+QshL6g6xkYLdoH
	 NhHmQrTSZ7TVw==
Message-ID: <77dc854a-8ff8-4b1a-ae28-ed39a0118aeb@kernel.org>
Date: Tue, 23 Dec 2025 14:27:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] media: mt9m114: Use aptina-PLL helper to get PLL
 values
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mathis Foerst <mathis.foerst@mt.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-4-hansg@kernel.org>
 <20250603105712.GA27361@pendragon.ideasonboard.com>
 <f7d0ab89-f119-4ff9-a78d-00c51d45bb43@kernel.org>
 <20250603140557.GB12117@pendragon.ideasonboard.com>
 <40f968d7-2c88-4eb4-b9ce-604de03bf7be@kernel.org>
 <20250627180639.GE24912@pendragon.ideasonboard.com>
 <86d8d80e-8ce5-477e-be81-f8a46a021d5b@kernel.org>
 <20250629204655.GA2059@pendragon.ideasonboard.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250629204655.GA2059@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

First of all sorry for dropping the ball on this series.

I'm preparing a v4 of this series now.

On 29-Jun-25 22:46, Laurent Pinchart wrote:
> On Sat, Jun 28, 2025 at 11:27:23AM +0200, Hans de Goede wrote:

...

>>> Could you share the PLL configuration you obtain with the 400 MHz and
>>> 768 MHz limits ?
>>
>> 400 MHz out_clock_max, working setup:
>>
>> [   40.136435] mt9m114 i2c-INT33F0:00: PLL: ext clock 19200000 pix clock 48000000
>> [   40.136453] mt9m114 i2c-INT33F0:00: pll: mf min 4 max 38
>> [   40.136463] mt9m114 i2c-INT33F0:00: pll: p1 min 4 max 8
>> [   40.136473] mt9m114 i2c-INT33F0:00: PLL: N 2 M 40 P1 8
>>
>> 768 MHz non working setup:
>>
>> [   28.388940] mt9m114 i2c-INT33F0:00: PLL: ext clock 19200000 pix clock 48000000
>> [   28.388955] mt9m114 i2c-INT33F0:00: pll: mf min 4 max 38
>> [   28.388966] mt9m114 i2c-INT33F0:00: pll: p1 min 4 max 16
>> [   28.388976] mt9m114 i2c-INT33F0:00: PLL: N 2 M 80 P1 16
> 
> Hmmm...
> 
> Re-reading the documentation, I wonder if I had misunderstood the PLL.
> 
> There is no single clear description of the PLL (it would be too easy),
> but there's informatio scattered in multiple places. One of them states
> that
> 
> Fout = (Fin*2*m)/((n+1)*(p+1)).
> 
> Note the *2 multiplier. In another location, multiple frequencies are
> defined:
> 
> fSensor = (M x fin) / ((N + 1) x (P + 1)) (max 48 MHz)
> fWord = fSensor x 2 (max 96 MHz)
> fBit = fWord * 8 (max 763 MHz)
> 
> The '+1' for N and P are understood, they relate to the values
> programmed in the registers. From the point of view of the PLL
> calculator, we should reason with that offset, with
> 
> Fout = (Fin*2*m)/(n*p).
> 
> and
> 
> fSensor = (M x fin) / (N x P)
> 
> This leads me to believe that the PLL is organized as follows:
> 
>         +-----+     +-----+     +-----+     +-----+     +-----+
> Fin --> | / N | --> | x M | --> | x 2 | --> | / P | --> | / 2 | -->
>         +-----+     +-----+     +-----+     +-----+     +-----+
> 	                                fBit       fWord        fSensor
> ext_clock    int_clock   out_clock                             pix_clock
> 
> Seen this way, the maximum limit for out_clock should be 384 MHz, and
> the P factor should be hardcoded to 8 for CSI-2 output.
> 
> Does that make sense to you ?

Yes that sounds right and setting out_clock_max to 384MHz works.

I've set out_clock_max to 384MH and limited P to min = max = 8
for the upcoming v4 of this series.

Regards,

Hans



