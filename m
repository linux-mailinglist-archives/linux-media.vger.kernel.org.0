Return-Path: <linux-media+bounces-50459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D10D126F1
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 13:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCEBD308CDF4
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBC1357705;
	Mon, 12 Jan 2026 11:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqSAg0QB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4312B28D83F;
	Mon, 12 Jan 2026 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219182; cv=none; b=sEmVOadlCYCr4xBP1RMDzcFOrZHeWW0RIer8FDeqaE5/p5VP2vHZi0IM1BJV8KafiuvLrifHmr8X+ZxemZWxzjv+zfJrKUXpgDsYveTudmgoRjy2rLcjFTfHW872kn+dJ83xxeSDQM+Bb0cl1KusaMzr29hY2Vjanq1iJ5zG3vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219182; c=relaxed/simple;
	bh=nv0QKn/vbK6AKnykyJsZSXuxhYtZBmMs+iKw2fPMln0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhAresyAgm8Qaf4XctQUyNTJw/SXbEtMTCWWzVmnLgtDR76OgysDyOo5c9sj0obm4/KWfjwJ7WAfshgq3+/XRXHyeNlzf2Uurrew5uYP8bSR+TWLA/BkCWnXzqjJA7f2OgUZLh8/Eoucz+He+/QGpT4Yp/UNHmpl10QTXciwWU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqSAg0QB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF47AC19421;
	Mon, 12 Jan 2026 11:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768219181;
	bh=nv0QKn/vbK6AKnykyJsZSXuxhYtZBmMs+iKw2fPMln0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sqSAg0QB1lXgQ4bA0QpCPnvJdMK/EH2VJPGX3YAK3iCVLrhnyj3HYOWGV/y8HKF+i
	 t9cqlLNl7FN8CUy6SluDwYnlkcIXg13GODglsEtcMu+g3WY6mOoLIJBZjc9rUBwJwZ
	 CfS9Nd8BZ3ePnnUAh2g4HAthif44RMukC6Pie5z7p3An88BQFC1SNmUFZ2pBRt+lS9
	 6WqLqXBDLF2toBFgc1Ej4vZVH6FFAVFiUd+QT5NBxe2pLA/sliNR5rzvWNFkhhGaz+
	 Zupc9p0TtLiv+4iCsrhgPUWa56t11av+FwEbYZRWoIviyt9Oxyjo6IkTF6T0sibnxQ
	 n1rkCdbEKPwMg==
Message-ID: <6126ae90-6f46-46f4-9a28-1b8d7ef69277@kernel.org>
Date: Mon, 12 Jan 2026 11:59:38 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: imx412: wait for NVM read (T7) before
 programming mode registers
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tjF2Z2nt6dR-T_d-5cSpzZqItgoMsUzNmUBQ-jucG9SMQ9Q4y9cCrW4aya-hRJR0dQG-q63OBmZajTWMbxfeUA==@protonmail.internalid>
 <20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com>
 <dc68db73-163e-4443-b334-31e2ae529e99@kernel.org>
 <1344ad43-a4c4-4e37-ae4e-eddd2c577b3f@oss.qualcomm.com>
 <aWS5qIA1Hfrr-3Yb@kekkonen.localdomain>
 <Q_aYRmvRyFExck1x7KCq3R5cFB8HTgFftErKAzEIWCCKIgXQuS1IZxzlbX7RbGoZ0M-IGKyellEXIdniJzgQcg==@protonmail.internalid>
 <468ce093-7704-4497-a538-c54baacbd8ae@oss.qualcomm.com>
 <ca5e24d7-94ea-47f0-9e02-cb6ecb3b9b24@kernel.org>
 <wzOknEikjpLenwGVcr9RSGtZP9Z7HtHxdwzhNpeeHaqF63Y1FGd6zRVDZuXuaXEp2daI5vD4_QiIjrBoyyFAOg==@protonmail.internalid>
 <828597fc-ec02-488c-99e9-418a7ff266d3@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <828597fc-ec02-488c-99e9-418a7ff266d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2026 11:50, Wenmeng Liu wrote:
> -- if disable gpiod_set_value_cansleep(imx412->reset_gpio, 1); form
> imx412_power_off, the issue will not happen.

Yeah this is basically what I said in the last email.

The state transition diagram for starting the part will assume reset is 
asserted.

So in power_on() - you need to assert reset prior to powering on and 
clocking the part - which is the eqivalent logic to what you posted above.

The reason you should do this in power_on() is it doesn't assume 
power_off has run first.

power_on should establish the initial conditions required to power on 
the device, in this case, we've established you need to have reset 
asserted first.

---
bod

