Return-Path: <linux-media+bounces-17648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E2D96D123
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 10:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53646B26521
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 08:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F676156C49;
	Thu,  5 Sep 2024 08:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DLrM+850"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA827735;
	Thu,  5 Sep 2024 08:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523268; cv=none; b=hODz0EUJ8lvxR8TsiMwotdjs+pl+5hiIR/bmqDwFN5Pk2DqZlfCp0OpJcl6PrISBG6g8MuH7QaPzSENGuJfZu5NCHzc4weKuAJ3PvI2+i0tA02b3T8ttgtbZyS1I8mob98cG5jiGKflXOVD4G9qRBWFrogLV82/AGlLcwbToV10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523268; c=relaxed/simple;
	bh=McOp7hDvwmqmPwiTk2LCrb4t9pskONH+6bBxH5gPuUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RBnGg+mpDtnMbdImshLZaBpJUybVeWqs6PCJ9a40QDSesA4curd07oT9gBkgoPQmeXpoabOAHIWd48b6pjnsLlr22WR8j1k3isNcji8tSnOzBf/IKG4/wOxqF/1Vwm6hj4Fbzr8FjV/fWvd3UGtlUOO0LrE2+cjCAS/s0O11sfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DLrM+850; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4856id8N018130;
	Thu, 5 Sep 2024 10:00:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	SNQzo6sT8VPWdToUzaKONHbQDB6W+fKhlq0KolnXaJc=; b=DLrM+850QXdzspuF
	fBsHOqbDhfZeWgqAnFkPbAeyZK7dURqnJ1HkjCWbVfq7v8gVeKJ5oavdrVS0+wg6
	o9wadz2l7aHiwKQ6EnXAFJLkqH9W4HoBdgZiFQgJowCik86ImKMyEyZXNmWzn59A
	nEGns75KKZP+nv8Nn0e+FFv2A5YFxhRKMC04nbB0BXhUPiBD6RSiaHStiYJ/u8jJ
	+5msGH+ux9d7TB8BMWGT2NjRnq71Dj7LnEp8YPEBDpk6z8Eg4KRx5OnXKFJlglxV
	O6ygSynJXuPEF9/4BTj7zrCbT20L88l373S4o9K8n+kAicujPdleJn3LrEAsqAsc
	eXyJHQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41cuq28tsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 10:00:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 204F940086;
	Thu,  5 Sep 2024 09:59:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E0EC3249DDE;
	Thu,  5 Sep 2024 09:58:35 +0200 (CEST)
Received: from [10.131.140.24] (10.131.140.24) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 5 Sep
 2024 09:58:35 +0200
Message-ID: <29d74899-9651-4b73-8545-844dcdcb4aca@foss.st.com>
Date: Thu, 5 Sep 2024 09:58:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <benjamin.mugnier@foss.st.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomm.merciai@gmail.com>, <laurent.pinchart@ideasonboard.com>
References: <20240904145238.21099-1-sylvain.petinot@foss.st.com>
 <20240904145238.21099-2-sylvain.petinot@foss.st.com>
 <64mhzrr4c33uzqacbai2x2c3dekbomezenbmjowwtdtiqt43ad@d6bhvpwabimq>
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
Content-Language: en-US
In-Reply-To: <64mhzrr4c33uzqacbai2x2c3dekbomezenbmjowwtdtiqt43ad@d6bhvpwabimq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01

Hi Krzysztof,

Thanks for the review.

On 9/5/2024 8:41 AM, Krzysztof Kozlowski wrote:
> On Wed, Sep 04, 2024 at 04:52:37PM +0200, Sylvain Petinot wrote:
>> Add devicetree bindings Documentation for ST VD56G3 & ST VD66GY camera
>> sensors. Update MAINTAINERS file.
>>
> 
>> +            port {
>> +                endpoint {
>> +                    data-lanes = <1 2>;
>> +                    link-frequencies = /bits/ 64 <402000000>;
>> +                    remote-endpoint = <&csiphy0_ep>;
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e6d77bea5db5..e58deb5b3047 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21561,6 +21561,14 @@ S:	Maintained
>>  F:	Documentation/hwmon/stpddc60.rst
>>  F:	drivers/hwmon/pmbus/stpddc60.c
>>  
>> +ST VD56G3 IMAGE SENSOR DRIVER
>> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
>> +F:	drivers/media/i2c/vd56g3.c
> 
> There is no such file.

My bad, fixed for V4.

> 
> 
>> +
>>  ST VGXY61 DRIVER
>>  M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>  M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>> @@ -23947,6 +23955,7 @@ F:	drivers/media/i2c/mt*
>>  F:	drivers/media/i2c/og*
>>  F:	drivers/media/i2c/ov*
>>  F:	drivers/media/i2c/s5*
>> +F:	drivers/media/i2c/vd56g3.c
> 
> Neither this one.

Ditto

> 
> After fixing the paths:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof


--
Sylvain

