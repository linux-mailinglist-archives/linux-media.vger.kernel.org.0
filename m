Return-Path: <linux-media+bounces-19854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2979A3D34
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 609191F21849
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 11:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A553A20127F;
	Fri, 18 Oct 2024 11:21:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E70134AC;
	Fri, 18 Oct 2024 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729250505; cv=none; b=htSlnuFuXTcaB11EAkck9AnKSDSOLZCJK9D4YX0ZAyBIzMTWrjuI9B2oWzwu4eD/zJ0J3Pt1fuflsgkK+HYmGygfiJiX/ruqR1rtW2q0yEE4PgJlSYS5XOpruwEM7yFySVlQWwn0TzQx/KL6CUf1KmZ64s/os9XTeRbxf++1oYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729250505; c=relaxed/simple;
	bh=DfngK5aEI0eh0NPLgkhHGdviOulGyaaWJXdLupMLYsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VskhPcil09lssqu1Ffb4CTeoIYfT3HO2F0yPyUnwA8V+fUGBeVSXcpoNw2LCtkIEZ20GsWYTZy3CsSJWkNi1vzsd58sUbglstphlv8gZ34G+RloZMsbuDn2Kz7mwUQgmUKAvWjw1EGhiWlRbV4khoLseJk9fC18bgjbuzEhuxDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.15] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id BEF6C509C4;
	Fri, 18 Oct 2024 13:21:33 +0200 (CEST)
Message-ID: <97cdc438-5699-4ab5-8c18-5fe39fe7e101@gpxsee.org>
Date: Fri, 18 Oct 2024 13:21:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] media: mgb4: protect driver against spectre
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 stable@vger.kernel.org
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
 <4675c8e726c7d55bbecf9f4772370daa8b46ccd3.1729074076.git.mchehab+huawei@kernel.org>
 <b5fcb290-5374-4ff3-b74c-a1bd3c802ef0@gpxsee.org>
 <20241018063209.69a76bb1@foz.lan>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <20241018063209.69a76bb1@foz.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 18. 10. 24 6:32 dop., Mauro Carvalho Chehab wrote:
> Em Wed, 16 Oct 2024 13:59:18 +0200
> Martin Tůma <tumic@gpxsee.org> escreveu:
> 
>> On 16. 10. 24 12:22 odp., Mauro Carvalho Chehab wrote:
>>> Frequency range is set from sysfs via frequency_range_store(),
>>> being vulnerable to spectre, as reported by smatch:
>>>
>>> 	drivers/media/pci/mgb4/mgb4_cmt.c:231 mgb4_cmt_set_vin_freq_range() warn: potential spectre issue 'cmt_vals_in' [r]
>>> 	drivers/media/pci/mgb4/mgb4_cmt.c:238 mgb4_cmt_set_vin_freq_range() warn: possible spectre second half.  'reg_set'
>>>
>>> Fix it.
>>>
>>> Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 driver")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> ---
>>>    drivers/media/pci/mgb4/mgb4_cmt.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/media/pci/mgb4/mgb4_cmt.c b/drivers/media/pci/mgb4/mgb4_cmt.c
>>> index 70dc78ef193c..a25b68403bc6 100644
>>> --- a/drivers/media/pci/mgb4/mgb4_cmt.c
>>> +++ b/drivers/media/pci/mgb4/mgb4_cmt.c
>>> @@ -227,6 +227,8 @@ void mgb4_cmt_set_vin_freq_range(struct mgb4_vin_dev *vindev,
>>>    	u32 config;
>>>    	size_t i;
>>>    
>>> +	freq_range = array_index_nospec(freq_range, ARRAY_SIZE(cmt_vals_in));
>>> +
>>>    	addr = cmt_addrs_in[vindev->config->id];
>>>    	reg_set = cmt_vals_in[freq_range];
>>>      
>>
>> I still do not fully understand the exact vulnerability here, but the
>> patch should definitely not do any harm, so I'm ok with it even if it's
>> real purpose would only be to silence the smatch warning :-)
> 
> With Spectre, just checking if freq_range is between 0 and the
> size of the array is not enough, as malicious code could use CPU
> speculative logic to retrieve data from memory outside the limits
> of the array.
> 
> As freq_range is specified by the user via sysfs attribute
> frequency_range, it is subject to Spectre v1 attack as described
> at Documentation/admin-guide/hw-vuln/spectre.rst.
> 

I do know the general theory about the "spectre bounds check 
fix/workaround", what I was referring is this part in the documentation:

"Such speculative memory accesses can leave side effects, creating side 
channels which leak information to the attacker."

I do not see/understand the exact "information leak" that could happen 
here on this particular place. But as already stated in the original 
answer, I don't have to understand everything ;-)

M.

> Silencing smatch is a plus.
> 
>>
>> Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> 
> Thanks!
> 
> Thanks,
> Mauro
> 


