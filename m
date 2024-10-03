Return-Path: <linux-media+bounces-19068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079398F60C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 20:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91AC81C2129A
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 18:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D171AB6EB;
	Thu,  3 Oct 2024 18:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="mriC0vtC"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2031A7AF7
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 18:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727980091; cv=none; b=KxleA+UX3YY0E7/oQVpcigleUd9HIIP3ESqbhH/8ZgZCZW2XbtvCQHyT5uKHXYb961nRhez5DTN5Mom192iUxqJanZ6uqDUwNJTP4HYIj4RZaJ2WjAhLKRvrxP89RoHTAYJ+VqLxtTXMnJe+OVgOtLg9Uz5u+z6TqwIRRtqRFu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727980091; c=relaxed/simple;
	bh=FDRx/Hsgjjg8F2a5fUE1ZV8UCVSlPb2t1pC6sc6KDtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=caFQRm2kzuIfFxmZ3ph7TVuKtnfRSOpTSot8goQOLwx6sYZISANFDxNtM1gCCI05pNf6sbJAaIHQygJ9fqElKo7xPtBxIuHfbqqWm0ZvoNVpRs4ARWzli9Vy+jNcgQZY+JYJ2fUoKA6avLp5JmQanGaTpUoD5KmuVwWf8zMzcIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=mriC0vtC; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AE1E188E6C;
	Thu,  3 Oct 2024 20:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727980088;
	bh=SYJioxRwBWMIIoiiEGds8K69V07MoZDKpAXV5ReILRg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=mriC0vtC/71MsMMtsNfpGi4KEFvxofWpUKe+kQF+9uPkyAt4XmNAURhtP+kxYYndQ
	 dF9tNCaAf01n51c3idSj1M5RImZpJiEb4mn/97euUMk9ZYcNUUIDerjtszLErKUkTg
	 qVrXRuVY8KBaH2hWi7mOFSoYmmBpPX3Hs4ApoN/aenkqzwk9ywXTiEwoBUFwHdB8F3
	 /2F3/9wT0KN4ykFkWksWVqhFO89AkWARR+DTGmvD9241lW2XJrjM8qX0dL++oNzNmB
	 o820UsD84Zs+1qdn1dLzdww5CCAW6/LXTMkTVOMuMjszsCPOrg0kJggW453Eb415Qx
	 haoIOzvAcVHmg==
Message-ID: <d613da4d-cd63-452f-b14b-a509f89698b6@denx.de>
Date: Thu, 3 Oct 2024 18:03:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: i2c: isl7998x: Enable VACTIVE and HDELAY
 shadow registers
To: Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20240713154242.107903-1-marex@denx.de>
 <ZvwNlwSJyJ52I9Mp@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZvwNlwSJyJ52I9Mp@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/1/24 4:56 PM, Michael Tretter wrote:
> On Sat, 13 Jul 2024 17:41:54 +0200, Marek Vasut wrote:
>> The VACTIVE and HDELAY shadow registers must be enabled for per channel
>> NTSC/PAL detection to work, enable them.
> 
> I think the description is wrong as the change doesn't affect the
> VACTIVE and HDELAY registers. The change sets the standard selection
> register to auto detection to always trigger a standard detection during
> initialization instead of defaulting to NTSC. querystd explicitly
> triggers this behavior.

It does, commit message fixed.

> If the driver always runs standard detection during init, the driver
> should also wait for the detection to be finished and update
> isl7998x->norm accordingly, because otherwise the standard will be reset
> to NTSC.
> 
> Maybe we can also get rid of this part from the init sequence and run
> the standard detection during the initialization in code?
Maybe the init sequence is OK as-is and this and the follow up patches 
should be discarded ? Users can run QUERYSTD to trigger the standard 
detection when needed ?

