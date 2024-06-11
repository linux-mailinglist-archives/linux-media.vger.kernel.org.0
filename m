Return-Path: <linux-media+bounces-12946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B65903B42
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 13:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC85B1C247F2
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 11:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A99F17C7D8;
	Tue, 11 Jun 2024 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="zh2cg14i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B074317B510;
	Tue, 11 Jun 2024 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718107101; cv=none; b=JE8R+XCsmnlOCdpRqEXh62gyTgOxZQj3HQ6G1pWI3UZVb9uiCw+QThuhGQzCVQgsYSQ4Olt0ItrPjJ63IbV8zpuwSxcVxbxivh/p03TtZJu7EwhtWBEEbmvSNOgx1ktO+7HfCqyXxfD8D3wtsPEuJtFXbat+Eh6LsuDvIJ7LKvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718107101; c=relaxed/simple;
	bh=nXq5c15zT7793/peS+uF6woo42Z+LYQLZzZfytx/MxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jXlPfrK2//vckcYpc857ehAa9lDcQ+GyM9UcIv2LAuABSw/OsiiiVW+8UU0l3qnA7GopvkQemTMcHspMsfGS1cGad3D4kUUsCB1IXDSF7Dm95C3uQ6ZaaE6B31P60jZXglqhr8cH3BI+tHD3tfRBANHPddFZEU9IUTXmgBCmWCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=zh2cg14i; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B7dkLg027544;
	Tue, 11 Jun 2024 13:58:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	VRmcHt8sQnc73tzUGRSumCQnFUmddZGMRvsEEbhXoc0=; b=zh2cg14izKxCUqjn
	FdLLPh05+phq7a51fEZhcMAmUlirfjwgqN/YEucB6QiKsn40yBlG+icbnw9R4bwq
	Go8vqOB8tKzNT7/rfVERldnESls6VN1/FLq2CmkqmJNbqqRnTTMnIJ8cX1wioWFu
	NPntOaeI6Uo5QSVhmfy0bQwidVDymjgYXz+cKJ8hSRnTOZYr5b8ILVDqCn9JjkOj
	JaG76symxS2Oe6OnjqdVhpnJ/5xdRm40wuZBO3PTjpJoJlt2GyFAmtk7/62R+gw3
	V8OR2gM/+SsgrnzYqSXEO3EEh19en0IpcOWJKwxZiLTD1IuT8uR+KewphVq+ZXsK
	aBzpCQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp42pkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 13:58:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E62424002D;
	Tue, 11 Jun 2024 13:58:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A810E215130;
	Tue, 11 Jun 2024 13:57:25 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 13:57:25 +0200
Message-ID: <76fd2e25-3a9c-49fa-994f-6a392e42a6bb@foss.st.com>
Date: Tue, 11 Jun 2024 13:57:24 +0200
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
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <ZmgI8nET4sdhdwQx@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01

Hi Sakari,

On 6/11/24 10:21, Sakari Ailus wrote:
> Hi Benjamin,
> 
> On Mon, Jun 10, 2024 at 05:08:15PM +0200, Benjamin Mugnier wrote:
>> Preserve user space retro compatibility after the device rename.
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  drivers/media/i2c/vgxy61.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
>> index ca3b43608dad..c85f356946ca 100644
>> --- a/drivers/media/i2c/vgxy61.c
>> +++ b/drivers/media/i2c/vgxy61.c
>> @@ -1898,3 +1898,4 @@ MODULE_AUTHOR("Mickael Guene <mickael.guene@st.com>");
>>  MODULE_AUTHOR("Sylvain Petinot <sylvain.petinot@foss.st.com>");
>>  MODULE_DESCRIPTION("VGXY61 camera subdev driver");
>>  MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:st-vgxy61");
> 
> Perhaps just "st-vgxy61" so that the module still loads if someone loads it
> explicitly? That's what you'd want, right, as the old compatible string
> will remain?
> 

Yes it is for explicit loading. I'll remove the "platform" prefix.

But maybe I'm overthinking and I could just remove the MODULE_ALIAS()
completely from this series. What do you think ?

-- 
Regards,

Benjamin

