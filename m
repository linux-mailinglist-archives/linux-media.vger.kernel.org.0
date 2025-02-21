Return-Path: <linux-media+bounces-26538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B689AA3EC27
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 06:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AE0217070D
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 05:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447571FBEAD;
	Fri, 21 Feb 2025 05:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gZZ8qjrj"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38201F5849;
	Fri, 21 Feb 2025 05:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740114843; cv=none; b=thOTCwfBzKZ0F20+5Bs+ybyTHnMNgbXv4EettthlN6xsymT0D3wgG2tcpt4dV8PCgi1QtSvyw8E0jww7op4FUJ4pSRAZys3bhCrnce+fa+GTwZZMV3QK8c+zZr+wth86bpHWngRsAvyzm4lhWxSyfcOW/j7UgmpL5veet+cYzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740114843; c=relaxed/simple;
	bh=lUB3h0ipFgwB59Ux+XtGJ38gutgxfRvjwhela+jcYDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hMgOUYxG1GypbVr8ZnUuTO5k3dC3+VmJ+0CTssOpEuONdHO3dicDb78MNkve7J4jrMbhrRyv3CbUXcE043guEHLvQv22gl0Hbl8HyLemIR+62eIBXbylEnz3sUu09rdALdi4f3kSxKhch1vbrFUp8rfhZb5qxkUr5H3JfGVS+xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gZZ8qjrj; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51L5DWV4199967
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2025 23:13:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740114812;
	bh=BE8H63GngUYx2gXqXZfmYn+PM9gQPhLClcs6cgFOpuM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gZZ8qjrjLzBHJaLM4rywfOv+SDNLxJY+tZL7u/x+CvTKhXoiF0aqW5Bz9u/xvs9Al
	 DQmXQU1xG1JB0BiU7GLlNTVkH3w1luLHRoa1Jp68/GtKTo1hzdYMqGl+5q5ijpkdap
	 3OTWcC/R9wWRzHk3Xr1Is5qhrN3y9MUAN2wFfHHQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51L5DW4J099458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Feb 2025 23:13:32 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 23:13:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 23:13:31 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51L5DRQZ059562;
	Thu, 20 Feb 2025 23:13:28 -0600
Message-ID: <907975b4-9a0b-4e4d-85cb-625c8a61f149@ti.com>
Date: Fri, 21 Feb 2025 10:43:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: <conor+dt@kernel.org>, <devarsht@ti.com>, <devicetree@vger.kernel.org>,
        <jai.luthra@linux.dev>, <krzk+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>, <mripard@kernel.org>, <r-donadkar@ti.com>,
        <robh@kernel.org>, <u-kumar1@ti.com>, <vaishnav.a@ti.com>
References: <20250217130013.2802293-3-y-abhilashchandra@ti.com>
 <20250219030226.535893-1-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250219030226.535893-1-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Changhuang,
Thanks for the review.

On 19/02/25 08:32, Changhuang Liang wrote:
>> Enable the csi2rx_err_irq interrupt to record any errors during streaming
>> and also add support for VIDIOC_LOG_STATUS ioctl. The VIDIOC_LOG_STATUS
>> ioctl can be invoked from user space to retrieve the device status,
>> including details about any errors.
>>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
> 
> [...]
> 
>> @@ -665,7 +752,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>>   {
>>   	struct csi2rx_priv *csi2rx;
>>   	unsigned int i;
>> -	int ret;
>> +	int irq, ret;
>>
>>   	csi2rx = kzalloc(sizeof(*csi2rx), GFP_KERNEL);
>>   	if (!csi2rx)
>> @@ -703,6 +790,19 @@ static int csi2rx_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_cleanup;
>>
>> +	irq = platform_get_irq_byname_optional(to_platform_device(csi2rx->dev), "error");
> 
> Can use the "pdev" directly ?

Yes, will correct this in v3.

Thanks and Regards,
Yemike Abhilash Chandra.

> 
>> +	if (irq < 0) {
>> +		dev_dbg(csi2rx->dev, "Optional interrupt not defined, proceeding without it\n");
>> +	} else {
>> +		ret = devm_request_irq(csi2rx->dev, irq, csi2rx_irq_handler, 0,
>> +					"csi2rx-irq", csi2rx);
>> +		if (ret) {
>> +			dev_err(csi2rx->dev, "Unable to request interrupt: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>>   	ret = v4l2_subdev_init_finalize(&csi2rx->subdev);
>>   	if (ret)
>>   		goto err_cleanup;
>> --
>> 2.34.1
>>

