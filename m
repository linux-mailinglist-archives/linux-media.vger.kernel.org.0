Return-Path: <linux-media+bounces-12438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 752FF8D7DD2
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 10:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0458EB21DB7
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 08:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637DA7604F;
	Mon,  3 Jun 2024 08:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="sZi5ZUBc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFBE74069;
	Mon,  3 Jun 2024 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717404515; cv=none; b=HRNvL+WzR60MgUxq+C0AfCotHlbFoP/3KwFUytpYOop7lyvgHWDh7852mZYB2XHhdaj4ebJRHXR2CvC2+F2Ft8Ahp3tI/N+5U7z7knV5AuD1kavehD+BXzbf29PVNQh4IBtSlFiV5hNcYtYM2PNPYhr0gXzoErlrakDJu/fEE4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717404515; c=relaxed/simple;
	bh=i/u0QhpikUU4tvXKtYsvQ33uX864CvXsbVERvLau4hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AjJ21Mfu8Qm1bUuqZyXQxDr7Q6rQJQJFDHuyXVErrOb723+ze61FKlQl5a9+wFL4Us0zn98hhaypRjJjKbvalrb0QeT8qmgyHKUdWXDD9osjbkKNCMsZyx2X3o6MxHoUSYN35w0SR+vXpXTlu4D9wJ0376tFgQdPycu6CaeusAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=sZi5ZUBc; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45383dHK009667;
	Mon, 3 Jun 2024 10:48:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xDFSp0bgHGnb5uhcwyLxi6wynGhrBTigGpLIvo69kPg=; b=sZi5ZUBc0IpoX7Uv
	+UNd3CMChGZLD5/e2d6zXG4yZ4Ic8jUqNoAePYfGj+BAR3pRXGEGWkgN0xEMut5Z
	HeFAhp76T1+bKQ2GcYIXlJcuO4yToJqOa3bwcvgsN/DwtbORWLxLxi5TcViayop/
	+Y6m7E3/NEFOCLvX5ZyYNgYPHT7GngsOahD5BhO6DoC4l9SvjCSFT2P+GB0i6WKm
	QEmbt3qCsp+a3mmEMkziSL6ZS2OT0eDG+O18IH+ex2g37zjmJMcAmt51YhJ3ZHqo
	Dmy0GHBEaF0+6KRlvEMxveKwK2KYabqrafIIzj0neOrUcGK/XBxL7iFzK7I3mSXF
	Aq4L8g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ygekhkq90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 10:48:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 38FBC40046;
	Mon,  3 Jun 2024 10:48:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B607215BDB;
	Mon,  3 Jun 2024 10:47:15 +0200 (CEST)
Received: from [10.131.140.24] (10.131.140.24) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 10:47:14 +0200
Message-ID: <5e21a6a5-0003-4b6c-a051-25ebeb38e676@foss.st.com>
Date: Mon, 3 Jun 2024 10:47:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
To: Sakari Ailus <sakari.ailus@iki.fi>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <benjamin.mugnier@foss.st.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
 <20240521162950.6987-2-sylvain.petinot@foss.st.com>
 <8afe1888-5886-45fc-b576-98db3d392d37@linaro.org>
 <ZlWiQTfag5yTA4YM@valkosipuli.retiisi.eu>
 <b6d3d336-5999-424a-9e38-3cf793b6627e@linaro.org>
 <ZlWrcTCNBWEz67Tj@valkosipuli.retiisi.eu>
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
Content-Language: en-US
In-Reply-To: <ZlWrcTCNBWEz67Tj@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_05,2024-05-30_01,2024-05-17_01

Hi Krzysztof, Sakari

On 5/28/2024 12:01 PM, Sakari Ailus wrote:
> Hi Krzysztof,
> 
> On Tue, May 28, 2024 at 11:46:00AM +0200, Krzysztof Kozlowski wrote:
>> On 28/05/2024 11:22, Sakari Ailus wrote:
>>> Hi Krzysztof,
>>>
>>> On Mon, May 27, 2024 at 09:04:38PM +0200, Krzysztof Kozlowski wrote:
>>>> On 21/05/2024 18:29, Sylvain Petinot wrote:
>>>>> Add devicetree bindings Documentation for ST VD56G3 & ST VD66GY camera
>>>>> sensors. Update MAINTAINERS file.
>>>>>
>>>>> Signed-off-by: Sylvain Petinot <sylvain.petinot@foss.st.com>
>>>>
>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index ef6be9d95143..554e6861425b 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -20885,6 +20885,15 @@ S:	Maintained
>>>>>  F:	Documentation/hwmon/stpddc60.rst
>>>>>  F:	drivers/hwmon/pmbus/stpddc60.c
>>>>>  
>>>>> +ST VD56G3 DRIVER
>>>
>>> I might add this is a sensor, i.e. "ST VD653G IMAGE SENSOR DRIVER".
>>>
>>>>> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>>> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>>>>> +L:	linux-media@vger.kernel.org
>>>>> +S:	Maintained
>>>>> +T:	git git://linuxtv.org/media_tree.git
>>>>
>>>> This is a friendly reminder during the review process.
>>>>
>>>> It seems my or other reviewer's previous comments were not fully
>>>> addressed. Maybe the feedback got lost between the quotes, maybe you
>>>> just forgot to apply it. Please go back to the previous discussion and
>>>> either implement all requested changes or keep discussing them.
>>>
>>> The above MAINTAINERS entry is roughly in line with what else we have for
>>> the Media tree. I'm in favour of listing the people who would look after
>>> the driver, not just those who merge the patches (or even send PRs to
>>> Linus).
>>
>> I did not propose to drop the entry.
>>
>>>
>>> In other words, I think the above entry is fine as-is.
>>
>> I propose to drop duplicated, redundant git entry. Maintainer of this
> 
> Ah, I agree, that makes sense.

Thanks for clarifying, git entry will be drop in V3.

> 
>> driver does not have access to git tree and the git tree is already
>> explained in media subsystem entry. If you ever update the git tree, you
>> need to update 100 driver entries which is meaningless...
> 

--
Sylvain

