Return-Path: <linux-media+bounces-14997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 738A0930B50
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2024 21:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2956628141D
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2024 19:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C663E13C827;
	Sun, 14 Jul 2024 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="aYgZbVdC"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CE51BDD3
	for <linux-media@vger.kernel.org>; Sun, 14 Jul 2024 19:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720984895; cv=none; b=hNnQlVvL29ZAhuWsTEk6SGbdTWp0g3z7oawAG+oeZymZWoW13mK1QFQXxcJWyKgbyjiGiFA8Kc0GYknzgMxkWnHclikjipBErXG9gOIppwrxcZ2xeOFzTrNsypQPeMg1VfVlJ9dokmOUPdjtLhtsLCl48llI1ATaGMJdkMGlTes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720984895; c=relaxed/simple;
	bh=NH1VNPV9fgx66nfi1vHkX588G26oFhxWU81p/eX2s+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJWoOA0XW4i6x6W9pZkGSV3ldXd6Y8wtJnRIqT3MmDgLfo4uyiEUql7KYoi5VwyG8swzkj+bTMFfDVSRPsBGbL7JwNDELFWN0g6Qa5jBWQ/TfrkBfax/vIibT5nxTnUoKffSleb1RcmRTFRkiEsuguUzzunPqYvoA5jiZVdMe5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=aYgZbVdC; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2AC0087D87;
	Sun, 14 Jul 2024 21:21:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720984885;
	bh=73Fi+N7WjxMFZT7MRVaUE701JgycQ49OYXl4iZNCbXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aYgZbVdC+OAdy3kiYUCs+kxw56LRhGzEI3xKmsZxHX7WXtUDghRBlBb4cMWwESfQX
	 ou5lDfoBWiDKl2oYJ6pSP8lNjKSNXlCRAH+T3mX5gzBIYJ137MAZPV9kCsgtFZzSIK
	 H1wf0JZ4wzhNk96cT/5SwFTb3ZRuWbf+XJMDCzXXPXtOGZBzJt/6jkjV8d1gAQVlmp
	 i4S+cDPwhs01oIvonkNOOmF8uMOLxtFO0ABpslsEfZ1oT53pt15aOuGsx7EnrLr/q3
	 /C3aCW5fPHOlMOiHPBtF5dehS7xwE6fkrWrxWuvbHsktZyhHdNQ56x1UTnR51/KM5Q
	 kuGZI983TOJ0A==
Message-ID: <30dd244f-3f9b-479f-af07-aa473fd11896@denx.de>
Date: Sun, 14 Jul 2024 17:37:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: i2c: isl7998x: Implement get_mbus_config
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20240713154242.107903-1-marex@denx.de>
 <20240713154242.107903-3-marex@denx.de> <20240714143357.GA9013@francesco-nb>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240714143357.GA9013@francesco-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/14/24 4:33 PM, Francesco Dolcini wrote:
> Hello Marek,

Hi,

> On Sat, Jul 13, 2024 at 05:41:56PM +0200, Marek Vasut wrote:
>> This is used e.g. by imx6-mipi-csi2.c to determine the CSI2 lane count.
>> Implement the callback in isl7998x driver so it can be used with i.MX6
>> CSI2 receiver.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> We had a similar need and we did send a similar patch for ov5640 [1],
> however it was rejected. I did not follow-up if anything changed that
> makes this patch not required, or maybe I am misunderstanding all of it?
> Any comment?

I am not sure what to make of that discussion, there was a lot of 
discussion, but no conclusion or hint how to move forward . So, what now?

> Francesco
> 
> [1] https://lore.kernel.org/all/20230306063649.7387-1-marcel@ziswiler.com/

