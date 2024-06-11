Return-Path: <linux-media+bounces-12952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9180903CD8
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 15:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C1961C22622
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 13:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1E617D35C;
	Tue, 11 Jun 2024 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="t1v78wLD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BF017C7CD;
	Tue, 11 Jun 2024 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718111651; cv=none; b=T+QkEws28atmD05G28AWHDighPvf4hFJ3k6WlRWXD3+8x5rh/0PnlA4rJO+Q+SF178xWayJfd9Pu9QtCLLn+gq7Ea+UOu2DUSwPl+N40fv5Hat5sbjozz/osUAklhuWgt9U4mco6onSGqZ3l6aWkJC/v2OTiPg0FrDh0HDthP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718111651; c=relaxed/simple;
	bh=1px+pBBKwT/kT5Nl3k339zWLK3XeVGSfRfAFkwQM8u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L3xWR02TMUJ7062oz0dX/hpd248BmJXXYd05jYqFT7P9B+4u9ehIxpRZPEGeSpLB/N4lbeFSN046k7ApemyNjl+i0UX/CsmCjcza0BRhvkPE/rWFOPcjHYClDgADvZBkG1jG5n7OiySuvJs+8/Q0hp9xXCAqwxAs4HRXkwq+RKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=t1v78wLD; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BCUnRS012090;
	Tue, 11 Jun 2024 15:14:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	5IHnpbmUpj49Nn64F1e9zeYA5D+TVXazrWvkh/paJ8k=; b=t1v78wLDWtTfw8mu
	7MBgnI05q8pF4ynt4ihNaiIRMv0k/4o22f/lxfwrCffE84APqMyCg482VVBleRmF
	jVhufqLYNP24cYDAk0uMcg2WMJWo0W1q2ZfbpTUNHnaWipex0ZXUg+F+cPdGmnJB
	MWOSmoxbYA7hCAvHUeBbkgNpRtqqFwNJPqVfh7a+h8a04hDFp3k13DGEkvmWlfU7
	LUZGU14v99r+5v4TF98nSFFrn4MsFSZEIiSwCGizUVtTVp9hxjeQFPqV9/wTuoVW
	ngWuoolT+IVbnm6Cbqv5PXOst958BiGSyYfCOD1q7H5fzPDS1/yxb3zyYXEUIDC5
	sMrv/Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp3u0b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 15:14:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E3C744002D;
	Tue, 11 Jun 2024 15:13:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B105216842;
	Tue, 11 Jun 2024 15:13:19 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 15:13:18 +0200
Message-ID: <02daa868-17d6-44c8-8508-555ab258f77d@foss.st.com>
Date: Tue, 11 Jun 2024 15:13:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: vgxy61: Add MODULE_ALIAS()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
 <20240610150815.228790-4-benjamin.mugnier@foss.st.com>
 <ZmgI8nET4sdhdwQx@kekkonen.localdomain>
 <76fd2e25-3a9c-49fa-994f-6a392e42a6bb@foss.st.com>
 <ZmhM9mAcQqMGKnzw@kekkonen.localdomain>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <ZmhM9mAcQqMGKnzw@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01

On 6/11/24 15:11, Sakari Ailus wrote:
> Hi Benjamin,
> 
> On Tue, Jun 11, 2024 at 01:57:24PM +0200, Benjamin Mugnier wrote:
>> Hi Sakari,
>>
>> On 6/11/24 10:21, Sakari Ailus wrote:
>>> Hi Benjamin,
>>>
>>> On Mon, Jun 10, 2024 at 05:08:15PM +0200, Benjamin Mugnier wrote:
>>>> Preserve user space retro compatibility after the device rename.
>>>>
>>>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>> ---
>>>>  drivers/media/i2c/vgxy61.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
>>>> index ca3b43608dad..c85f356946ca 100644
>>>> --- a/drivers/media/i2c/vgxy61.c
>>>> +++ b/drivers/media/i2c/vgxy61.c
>>>> @@ -1898,3 +1898,4 @@ MODULE_AUTHOR("Mickael Guene <mickael.guene@st.com>");
>>>>  MODULE_AUTHOR("Sylvain Petinot <sylvain.petinot@foss.st.com>");
>>>>  MODULE_DESCRIPTION("VGXY61 camera subdev driver");
>>>>  MODULE_LICENSE("GPL");
>>>> +MODULE_ALIAS("platform:st-vgxy61");
>>>
>>> Perhaps just "st-vgxy61" so that the module still loads if someone loads it
>>> explicitly? That's what you'd want, right, as the old compatible string
>>> will remain?
>>>
>>
>> Yes it is for explicit loading. I'll remove the "platform" prefix.
>>
>> But maybe I'm overthinking and I could just remove the MODULE_ALIAS()
>> completely from this series. What do you think ?
> 
> Most of the time the modules are loaded based on devices found, so this
> would likely not change things much.
> 
> Up to you.
> 

Then I'd rather remove it entirely. The less legacy code the better.
Thank you.

-- 
Regards,

Benjamin

