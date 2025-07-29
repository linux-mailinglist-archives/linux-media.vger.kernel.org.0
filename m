Return-Path: <linux-media+bounces-38642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3A7B15370
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 21:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E53D616DC1B
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 19:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF83E253B40;
	Tue, 29 Jul 2025 19:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="p8PaVsrZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-69.smtpout.orange.fr [80.12.242.69])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4198324886F;
	Tue, 29 Jul 2025 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753817619; cv=none; b=BE1QNLD6tT1GkOYF63x3FpHalUYKXOzFqM/XdaJUVLBnqUgsRXWAySuK2FiheHsCxS7R1ocku9hDTCIKW7k2YO7Lkx9BHcinta7uwUkBYOF6VLZ+3LNwlKNhT/Uylp5bR9qP8mhlCLWDIZPN0uqmHnC+5+MdDoA6hVoRvXbz4Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753817619; c=relaxed/simple;
	bh=Pn/4wU3FWzPANPeulCS77bi1iXkwqEjETvGQ2NElXbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/rWCADIUdlOuAXZBu5PtZZCkz+jRLgjMSrao4V2B+wRsB9fEqf7LjSycBRfOga0rs6XHFROj418laqxAe1TJ2hCgoBYZXDxG5AQSk7nPSBu8xA65nGOl1h0PeLOVweUWFniJTHoozjH/ZfBZCm+JpvuvJkAS5T5ibk8h/O/Gho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=p8PaVsrZ; arc=none smtp.client-ip=80.12.242.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id gq4ru80ArUD3Ugq4ru4oqm; Tue, 29 Jul 2025 21:33:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753817614;
	bh=z+SRRL3rRltS4sAuSdLWbFetbEgJEuFio4WE2T9Xyb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=p8PaVsrZqWeFVlslirJenx5xHw0FCGjNcLzugJozH3WTmqHGn5fi/qsz9EKnhlDK9
	 8JnMXrCM24Qd8qHpbd0v82eiHrGWsWvz67yHCkwUIeW/kpFRRXZesPKDtGtsm0o9HR
	 XPKiEtHRSaO5ZA/9LCOSS/bpEo60rz9OyhO5hbNKUR3Dw3vnDrf0x3hfIOjB5y66dj
	 3uLSIJutYRHOBiP3Og5JMCsFgPFW7+jrjnxXIKOAiXhIwVrClRFn9ueI1gApEyuyfq
	 bL9Nf8wuWKX293f2HmS2HmQAFpz10J0/bwqDv7uI1lCkcz61PMaOxB04RQek127Hfo
	 ZsoBmEp7pBInA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 29 Jul 2025 21:33:34 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <884293c1-f6f4-48b3-a5d9-9b41fa8614a5@wanadoo.fr>
Date: Tue, 29 Jul 2025 21:33:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rkvdec: Fix an error handling path in
 rkvdec_probe()
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <b69c20783a7b6f7964ab636679d3da80fc48372e.1753610517.git.christophe.jaillet@wanadoo.fr>
 <0a8391cb368653b91ea73a51e2c0dee35cceb128.camel@collabora.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <0a8391cb368653b91ea73a51e2c0dee35cceb128.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 29/07/2025 à 00:50, Nicolas Dufresne a écrit :
> Hi,
> 
> Le dimanche 27 juillet 2025 à 12:02 +0200, Christophe JAILLET a écrit :
>> If an error occurs after a successful iommu_paging_domain_alloc() call, it
>> should be undone by a corresponding iommu_domain_free() call, as already
>> done in the remove function.
>>
>> Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Compile tested only
>> ---
>>   drivers/media/platform/rockchip/rkvdec/rkvdec.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index d707088ec0dc..eb0d41f85d89 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -1169,15 +1169,17 @@ static int rkvdec_probe(struct platform_device *pdev)
>>   	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>>   
>>   	irq = platform_get_irq(pdev, 0);
>> -	if (irq <= 0)
>> -		return -ENXIO;
>> +	if (irq <= 0) {
>> +		ret = -ENXIO;
>> +		goto err_free_domain;
>> +	}
>>   
>>   	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
>>   					rkvdec_irq_handler, IRQF_ONESHOT,
>>   					dev_name(&pdev->dev), rkvdec);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
>> -		return ret;
>> +		goto err_free_domain;
>>   	}
>>   
>>   	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> 
> Have you considered moving the allocation of the domain right above the above
> line instead ? The empty domain can't possibly be used unless the probe have
> fully completed.

That would not change things much. We still need to handle 
rkvdec_v4l2_init() failure a few lines below.

If it is correct to move it at the very end of the function, after 
rkvdec_v4l2_init(), then the patch would be simpler.


Honestly, I'm not very confident with it. request_threaded_irq() 
documentation states that "From the point this call is made your handler 
function may be invoked."
And rkvdec_irq_handler() may call rkvdec_iommu_restore() which uses 
empty_domain.

Not sure if I'm right and if this can happen, but the existing order 
looks safer to me.


That said, if it is fine for you, I can send a v2.


This would be:

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c 
b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index d707088ec0dc..6eae10e16c73 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1159,13 +1159,6 @@ static int rkvdec_probe(struct platform_device *pdev)
                 return ret;
         }

-       if (iommu_get_domain_for_dev(&pdev->dev)) {
-               rkvdec->empty_domain = 
iommu_paging_domain_alloc(rkvdec->dev);
-
-               if (!rkvdec->empty_domain)
-                       dev_warn(rkvdec->dev, "cannot alloc new empty 
domain\n");
-       }
-
         vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));

         irq = platform_get_irq(pdev, 0);
@@ -1188,6 +1181,13 @@ static int rkvdec_probe(struct platform_device *pdev)
         if (ret)
                 goto err_disable_runtime_pm;

+       if (iommu_get_domain_for_dev(&pdev->dev)) {
+               rkvdec->empty_domain = 
iommu_paging_domain_alloc(rkvdec->dev);
+
+               if (!rkvdec->empty_domain)
+                       dev_warn(rkvdec->dev, "cannot alloc new empty 
domain\n");
+       }
+
         return 0;

  err_disable_runtime_pm:


CJ

> 
> Nicolas
> 
>> @@ -1193,6 +1195,9 @@ static int rkvdec_probe(struct platform_device *pdev)
>>   err_disable_runtime_pm:
>>   	pm_runtime_dont_use_autosuspend(&pdev->dev);
>>   	pm_runtime_disable(&pdev->dev);
>> +err_free_domain:
>> +	if (rkvdec->empty_domain)
>> +		iommu_domain_free(rkvdec->empty_domain);
>>   	return ret;
>>   }
>>   


