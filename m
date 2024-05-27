Return-Path: <linux-media+bounces-11918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B453E8CFB51
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 10:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD2B01C20CDD
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 08:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BDD5339B;
	Mon, 27 May 2024 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KEDL/IVA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476A746453;
	Mon, 27 May 2024 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716798337; cv=none; b=t2bfgipkj9We5dscdwQO8ywsfCNbF+JDeQ4oAKCDfFjLTwW2CwyZBePZUWldvOikxFuQoJ4s3J311a1/NqiYCOv6zsN6Kfn/n3N6JW3TTwq+KBtuO4kRrdUfrXCYHlQl9DQPRrrlSB1zBBs9UdV8XkNhBmb/+8ZR9QRLhGOA+P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716798337; c=relaxed/simple;
	bh=Bn2vs455rOM+Jl5xxl3oCGu3ebgM2zxGmcs3r52XYYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JSHVW599kvvsB3biJ52m7BkK9Gf11NCB3lCzLY6UoOgt9g1BobiaENonfF2ERG7J6Yy/ttP4hxEQs9Z9mlicMjNqHm3y5rbVBiRMQH9qQhJvw2gy0u/OXCRr+R4oEqCCW2VrC0rBmijgOh+ZtAUddX9MkWwZ5N/mCPnzzVUhMBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KEDL/IVA; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44QMsgXK002040;
	Mon, 27 May 2024 09:45:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	5MlVXLL0h6fGrepjEUKqMT+GSQ1qSjrne66KbCMAXKE=; b=KEDL/IVAUCy42ZKP
	+HzNbTV8UT63/1WBgbgLqijzZm0mRX1RLz1JU8SPEEUN06rNTV/ArtLOOVWpaI+I
	15Y+Owrei7MLgXqT8pNtvpLqBc1qfwyHhI8jEJbQSFnXJzt+AFOGzUIswrnziaZ9
	xjbD9MR8aS76SK0HWEsJ9EAOOvyELXUbXQeByY7+f1Hb2pRM5IviNMSX+cA/HcOC
	sWRhRc2aTW4yg0Zr6L9KuR4aGzEqnAG1rJue3s38laiPSiGyCBtJ2BWZ6ovYmEf+
	x/pnCU21suyPQi9Vp2ia8BPKcvo0eMGl0wwwoaw6gAtiufYS3yoUybeqTxVPvbCx
	l5IuHg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yba51nn38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 09:45:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 442B84002D;
	Mon, 27 May 2024 09:44:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67915211975;
	Mon, 27 May 2024 09:44:16 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 27 May
 2024 09:44:15 +0200
Message-ID: <864dc1d3-2478-46a2-84a5-c7c51f96268f@foss.st.com>
Date: Mon, 27 May 2024 09:44:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: Add driver for ST VD56G3 camera sensor
To: Sakari Ailus <sakari.ailus@iki.fi>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <hdegoede@redhat.com>, <laurent.pinchart@ideasonboard.com>
References: <20240417133453.17406-1-sylvain.petinot@foss.st.com>
 <20240417133453.17406-3-sylvain.petinot@foss.st.com>
 <Zil1wiCcCdwZs5Df@valkosipuli.retiisi.eu>
 <d45a2ea1-bc2d-441a-b036-1da40290c6b3@foss.st.com>
 <c9b35dc4-6f52-48e2-8952-5a43c500f819@foss.st.com>
 <ZlQ2zymJguCipLMl@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <ZlQ2zymJguCipLMl@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01

Hi Sakari,

On 5/27/24 09:31, Sakari Ailus wrote:
> Hi Benjamin,
> 
> On Mon, May 13, 2024 at 03:37:25PM +0200, Benjamin Mugnier wrote:
>>>>> +static int vd56g3_read_expo_cluster(struct vd56g3 *sensor, bool force_cur_val)
>>>>> +{
>>>>> +	u64 exposure = 0;
>>>>> +	u64 again = 0;
>>>>> +	u64 dgain = 0;
>>>>
>>>> Do you need the assignments? The values are assigned by cci_read() below,
>>>> right?
>>>
>>> Well initially, I didn't have those assignments and some checker
>>> complains (Honestly I didn't investigate the warning).
>>> I will double check and see if they are necessary.
>>>
>>
>> Since I have smatch ready, I ran it without these initialization against
>> the latest media tree. I got these :
>>
>> drivers/media/i2c/st-vd56g3.c:403 vd56g3_read_expo_cluster() error:
>> uninitialized symbol 'exposure'.
>> drivers/media/i2c/st-vd56g3.c:404 vd56g3_read_expo_cluster() error:
>> uninitialized symbol 'again'.
>> drivers/media/i2c/st-vd56g3.c:405 vd56g3_read_expo_cluster() error:
>> uninitialized symbol 'dgain'.
>> drivers/media/i2c/st-vd56g3.c:407 vd56g3_read_expo_cluster() error:
>> uninitialized symbol 'exposure'.
>> drivers/media/i2c/st-vd56g3.c:408 vd56g3_read_expo_cluster() error:
>> uninitialized symbol 'again'.
>> drivers/media/i2c/st-vd56g3.c:409 vd56g3_read_expo_cluster() error:
>> uninitialized symbol 'dgain'.
>>
>> cci_read() is indeed not modifying its 'var' argument in the default
>> case of the switch [1]. Spawning these errors.
>> Adding a '*val = 0' in the default case would also fix it, but will
>> change the function behavior.
> 
> I think I'd add the assignment to cci_read(). This isn't the only driver
> that's affected. In the best case smatch would be fixed to figure this out.
> 
> Any thoughts?

IMHO adding the assignment to cci_read() is the cleanest way to handle it.

> 
> Cc also Hans and Laurent.
> 

-- 
Regards,

Benjamin

