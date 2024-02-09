Return-Path: <linux-media+bounces-4872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 691A084F239
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 10:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E19ABB2186C
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 09:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4312966B5B;
	Fri,  9 Feb 2024 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="go1r9tIv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15D6664B1;
	Fri,  9 Feb 2024 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707470669; cv=none; b=dG4QYeDRKQlvbwYTk0njY+qlr5ulotNEARsyEPe9K7IZatxEkNvi4RByvG7W2oI2rXAQIOJS2iJSdVR6ZU2bx+7iY5mNMGyTulXIiceDlLdO1I3+A2ind7YgkB9J/uFTiqh4V3L29GSyZGeXoY0xeQrPCYuz5mxwwGeXT+gnZwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707470669; c=relaxed/simple;
	bh=LWo09Ys4wrV+4aRTLA+zoGjZ77c40wS/ePushfPdaVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cxcZJHDXoLy2+zIdF8LjsMboLbhG/T0zkjItR5h9rXramQ5uD87KyM3ofyR/zGu4nzbFrj0EUntJ2ObA+StOF+Xc31LlF4ing4YunizacfdR8XzJPL3507IiwI8z3ibBEAvpKmcEPe5x0lDWJK1pJHvYVp5zH3eVNbMKKVuK9FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=go1r9tIv; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4196LvNB025594;
	Fri, 9 Feb 2024 10:24:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=G8hv0Ly9R1rT33a7xksaagvTQAfMa5pgb5qJjkEb21U=; b=go
	1r9tIv4JdHkmq78CLfNkktZfRUcyFQ9GCvK9W3gbBXDhe5ZqPR32oheuRwrwWnS/
	/CqHDAEF1n3WLcCiqoqCu5s34cfeyNlRROSm/K6jQ+les6A8EJE9ZzwqgfoyCARX
	3NT7lbJC8t0US5tp46A270yLMc40FNQ5ax2S8sWvc1f6NOeLarw1hCdfTSqAKwTY
	aR0b8Lo58yzTGpaq0cwx6h/iBs3BNwjK2IfmBL7EgeOBGGJ6NzJtyOigNqR/jwc6
	BuVIWMRvxx2F8cB+05KSOwH2IVQEWPSjBRVpVSLiMNXTcTJnowG+X9L9oO03slEc
	q0w1kS1kqvwvAFDRpbZA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w1eyprt7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 10:24:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9704410004F;
	Fri,  9 Feb 2024 10:24:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C58D2128DF;
	Fri,  9 Feb 2024 10:24:19 +0100 (CET)
Received: from [10.252.23.147] (10.252.23.147) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 9 Feb
 2024 10:24:19 +0100
Message-ID: <4bffed14-0edf-49a6-8bbb-cc122137e9de@foss.st.com>
Date: Fri, 9 Feb 2024 10:24:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: st-vgxy61: relax data-lanes
 restriction
Content-Language: en-US
To: Julien Massot <julien.massot@collabora.com>,
        Conor Dooley
	<conor@kernel.org>
CC: <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <kernel@collabora.com>, <devicetree@vger.kernel.org>,
        <linux-media@vger.kernel.org>
References: <20231213071737.1070162-1-julien.massot@collabora.com>
 <20231213-chest-turf-8e9c4fb0a3db@spud>
 <aa478429-57f6-40f8-8481-269311fdc937@collabora.com>
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <aa478429-57f6-40f8-8481-269311fdc937@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_06,2024-02-08_01,2023-05-22_02

Hi Julien,

On 1/5/24 10:36, Julien Massot wrote:
> Hi,
> 
> On 12/13/23 17:30, Conor Dooley wrote:
>> On Wed, Dec 13, 2023 at 08:17:37AM +0100, Julien Massot wrote:
>>> The ST VGXY61 sensors support multiple lane number, as
>>> well as lane mapping.
>>>
>>> Signed-off-by: Julien Massot <julien.massot@collabora.com>
>>> ---
>>>   .../devicetree/bindings/media/i2c/st,st-vgxy61.yaml        | 7 ++-----
>>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>> b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>> index 8c28848b226a..733fac85a20f 100644
>>> --- a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>> @@ -67,11 +67,8 @@ properties:
>>>             data-lanes:
>>>               description:
>>>                 CSI lanes to use
>>> -            items:
>>> -              - const: 1
>>> -              - const: 2
>>> -              - const: 3
>>> -              - const: 4
>>> +            minItems: 1
>>> +            maxItems: 4
>>
>> So, it is now valid to have "data-lanes = <6 7 8>;" now?
> 
> Indeed it's not valid, I will send a v2 with a 'minimum: 1', 'maximum:
> 4' items properties.

I'm interested in this patch. Did you send a v2 yet that I might have
missed ?
Thank you.

> 
> Thanks,

-- 
Regards,

Benjamin

