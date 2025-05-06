Return-Path: <linux-media+bounces-31867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99423AACBBF
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 19:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DC811C451E2
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 16:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A21286D77;
	Tue,  6 May 2025 16:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G9wNe5Za"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A1D286400
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550643; cv=none; b=U67pU1GM9riaUFWXw3hN5sQZta2OK97YWKfB5nxQFeQDhqtsGAaxlkEN++owxoNlppW+U3v3j7ZMaky2+x4FwLjV5zbYBdJrhcZdElEWNlyaZ1Y99b3DZHVWmzTZb72z4YydPx9M88iD+waXtsTI3do0wWSZwKEXcySxc5MCiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550643; c=relaxed/simple;
	bh=6wSQGLJvrsBjS1Af4IRe+b/+THlhI9727+A8meKGAis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1pgnLeMLEkgiNbAnLQFSj+CEaqYhL+2i6+ZeQRsdJEhd/oCYWnw64Bbu8NerlkbNR6S7inEDLpSe6n7F6G+mfUW4GYJYMwakR6TnAkBcE0Lg2Zxw2ZuOlCaaHuLH2eWTQEobPhsO/kAMAvLrz2LQhPjWnI7nbl0j/6EfkTtWgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G9wNe5Za; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746550640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KpJRN8DE+gNMShVf7SOwAkCgi8okTwMRnwrFioGE/2E=;
	b=G9wNe5ZaMYO8e+j7M+OqlSuXUMpld6yVDERDUI+SluPv7new3WkUKbb2pcMK0xs8YxTGHB
	3+fs45Y1vwkGpK26XWqdsrmNggjxYV/TBgCJIM7d8KyD6IOyHlKfoO1ktwnqq7/N35jfrK
	J7o+htHG80XwnDDqr3XN6VNlIZZX/ws=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-SmYhqOM3Nw-dakzOmrLIJg-1; Tue, 06 May 2025 12:57:17 -0400
X-MC-Unique: SmYhqOM3Nw-dakzOmrLIJg-1
X-Mimecast-MFC-AGG-ID: SmYhqOM3Nw-dakzOmrLIJg_1746550636
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac2a113c5d8so404774566b.1
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 09:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550636; x=1747155436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KpJRN8DE+gNMShVf7SOwAkCgi8okTwMRnwrFioGE/2E=;
        b=bB+9DhTDVECIvIPyVrrx2LZalkzSDnl2IrUKEK13gJvzFafrZmz0VkGTBSLCIuMOmy
         lBDd36YgKpNPin6d2E7kI3FgZDITazVG/S7gd8fX07IRPiJ4+99fLGjtOYC4niUbcTou
         QRFOMpVmPEtnBsGdNyQq1PdMg4E8fBDq3OlcNNH48iUtaGmsAeERQMJc491RLZQgXNhf
         dMofe6ktdwAnmjiHNGAEitxwP9cq4r7yf2rWjbgzZCgly6Z5D03DDK6nWn7P0PU8RHK7
         S7N7QebRPuHcaP0IHDTbvb3H3Z5bGJ+Sj8l1HBB1ju9ClZsnAn1dabs//3oXcWN4wUg9
         23/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMteUw0iu4Ez6S41/nsbB/VECXtw5zCNMe6lRrWo2M2enJdtHovjo1yizMs/yrfOuv74kVs1PrCBSk5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGAJlYG73PRWW5/QgxEAI1HXgUGt3JrYBGf+L3IHY9BubqGc7d
	HJCa+VgTE90db32ziMMgu/1Fky+8CXgjxTbgNTaTXdkr2a1u+NRcTn8xXS3WIK3JA9jq2WbVYc1
	TTWbwANuiK2IOHMei0q1trSkYOF/Xg7bWKIFDmAws0hvu/EVuqpuC1tR/pASW
X-Gm-Gg: ASbGncvPglpXpMvDeChgLjOS+NeD6piTTatrEOBbmGHVH/oGl5sP8S5Ow1WeqZe4NpL
	E3EhDMq+HL9fwmnFNk9BY2VwEQuMwAvu+the4M1cyIyV94XernBI28uGM41wE3qQ7rebYYYJIql
	aEJgCz6p4wQLLzGSUjkgXS+S+64wdv0YLtMmyAugjuvqLuTsvlLPlggFwk7YvNyg1iAqkjA05OJ
	OZ7aTpcGeWNCXO1prBkvscsUzcJPTeuNKFQyvTC3NiAUK4Uwo0Wx36tRN/gplAfxWrZEAsIY6rt
	Tq5AyOd/OUgaqyaHw/kptTs5o/ZA7Ii5Ow8Nd4gVlngSeZoocNqnivSLy20GYeqDdN5RoLWZXAO
	ZWg1jFCzo87EnmOF4Nw8cSOU0qujyid7a9dVgvgMjIgkxls5Zk5sdr02eQrJA5vYi
X-Received: by 2002:a17:907:3f92:b0:ac8:1142:a9e5 with SMTP id a640c23a62f3a-ad1e8d549a8mr16256166b.47.1746550635906;
        Tue, 06 May 2025 09:57:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+or7QGYrNt9HL8NgoN3qSf7xbSLT1XSTDfObBV+ObymkPpgNqkwgSoff8rtxSPYoTfwbigA==
X-Received: by 2002:a17:907:3f92:b0:ac8:1142:a9e5 with SMTP id a640c23a62f3a-ad1e8d549a8mr16254466b.47.1746550635515;
        Tue, 06 May 2025 09:57:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:f271:322f:26b0:6eb5? (2001-1c00-2a07-3a01-f271-322f-26b0-6eb5.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:f271:322f:26b0:6eb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189509835sm730997166b.129.2025.05.06.09.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 09:57:14 -0700 (PDT)
Message-ID: <323ed87d-074f-4bef-ac5b-4fc8ac0b478a@redhat.com>
Date: Tue, 6 May 2025 18:57:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ipu-bridge: Debug log link-number and
 lane-count from SSDB
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250506121843.250995-1-hdegoede@redhat.com>
 <20250506121843.250995-2-hdegoede@redhat.com>
 <aBoiRpAkR_8Yhf_c@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aBoiRpAkR_8Yhf_c@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6-May-25 16:52, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for the set.
> 
> On Tue, May 06, 2025 at 02:18:43PM +0200, Hans de Goede wrote:
>> Add a dev_dbg() call logging the link-number and lane-count from the SSDB.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
>> index a12bc1676c81..e342492e8f3b 100644
>> --- a/drivers/media/pci/intel/ipu-bridge.c
>> +++ b/drivers/media/pci/intel/ipu-bridge.c
>> @@ -308,6 +308,8 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
>>  		return -EINVAL;
>>  	}
>>  
>> +	dev_dbg(ADEV_DEV(adev), "link %d lanes %d\n", ssdb.link, ssdb.lanes);
> 
> Do we need this? The V4L2 fwnode framework prints this, as well as other
> related information.

Ah I see, one problem is that the drivers/media/v4l2-core/v4l2-fwnode.c
code uses pr_debug, so on multi sensor systems it is not always clear
which sensor the debug prints belong to.

Is there some way to improve the debug-logging there to give some more info?

Anyways I agree that this seems duplicate, so lets drop this patch.

Regards,

Hans




