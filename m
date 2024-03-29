Return-Path: <linux-media+bounces-8179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45B891534
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 09:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C4921C21F16
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 08:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8FEA936;
	Fri, 29 Mar 2024 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lveGOoaz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F489BA4D
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711701204; cv=none; b=bDin/bYLKVmRY0kUOcucJyHEOtBRugSJ30c1UL6a11qUJtJq779k7C51ZLr+e4GcXkI/2bfY287qdOuzo92txp0QD0brNM0imRAoBSVOCCcOAvzvoH6on2e1f8VbfdIPOveW7LNazIYkz/ChuPRU6spXPvwc4UugV0Kz0MS3+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711701204; c=relaxed/simple;
	bh=CBOA19XJFja/2GaZI9N2B+Lo6G9kisat76XxoWuJKDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mfK5ieaeoCuSScUpuJpxtiA1MRlbv4oAGRrzWFE3cnLNxNIZX1ZH/OMp8+6Fbk78031UyYnf2iHP/4fiQGxR90lEnZRsQ5d3lPExYGmzdsid4SoLGbVt1yERvmm5AaAw4HCgDaYrcC3I8+5cmVKjC2RGeOjwX4/XEweQD416prE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lveGOoaz; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42T7phta031690;
	Fri, 29 Mar 2024 09:33:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=VaIK+W3aX/0XRhoqKLoMfQOWLtv/UCgcxiTo5CZMHks=; b=lv
	eGOoazFpPlYL8Uceco0DpyIIO6JkvYf/jAXsm7h63IaLCeu3De2ZfhChXQ8svk2p
	lPlpHOmK0kaDjYIUjBeccYZsaEtFrGlTH6PwCesNsikXmjcgjiwchd8JGlF7IEKW
	voo5uC1IKpdWedacUjzEIaNHpUoN8t4wQKryJVHvFZcgBKfpw0x4Gtc0GaEt0eX7
	grXGtCUQ0llrV9sBy8huyf2kuTAkceRA/VEXfLcjOQL8GTtBCEaPOTb6hZKCDwFf
	b+cyAqD2dwsL1y3i+hOQ65Yg5S24uOPIpJ9IHEqxeujKPvImd+NSgevkTASg1are
	eiIZXR4fsmzY/GcDxIfQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x29h6cb1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 09:33:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3256C4002D;
	Fri, 29 Mar 2024 09:32:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A57B211605;
	Fri, 29 Mar 2024 09:32:36 +0100 (CET)
Received: from [10.252.23.176] (10.252.23.176) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Mar
 2024 09:32:35 +0100
Message-ID: <fa691a07-0c84-4fe0-8e3f-753e7fc41b7b@foss.st.com>
Date: Fri, 29 Mar 2024 09:32:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: dt-bindings: st-vgxy61: relax data-lanes
 restriction
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Julien Massot
	<julien.massot@collabora.com>
CC: <mchehab@kernel.org>, <sylvain.petinot@foss.st.com>,
        <linux-media@vger.kernel.org>, <kernel@collabora.com>
References: <20240315090345.1213957-1-julien.massot@collabora.com>
 <ZfQTQ5U_iXEaKUjH@kekkonen.localdomain>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <ZfQTQ5U_iXEaKUjH@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_07,2024-03-28_01,2023-05-22_02

Hi Julien and Sakari,

On 3/15/24 10:22, Sakari Ailus wrote:
> Hi Julien,
> 
> On Fri, Mar 15, 2024 at 10:03:45AM +0100, Julien Massot wrote:
>> The ST VGXY61 sensors support multiple lane numbers, as
>> well as lane mapping.
> 
> Wow! This is the first time I see this on the sensor side. Should it be
> separately mentioned?
> 
> The driver appears to be handling this already.

Yes it does :)
You could just add the "The ST VGXY61 sensors support multiple lane
numbers, as well as lane mapping." to the 'description' part.

With that :

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

I'm not sure about who is required for a device tree patch to be merged
though.

> 
>> ---
>> Changes in v2:
>> Add minimum/maximum items to restrict lane index to 1..4.
>> ---
>>  .../devicetree/bindings/media/i2c/st,st-vgxy61.yaml       | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>> index 8c28848b226a..a76434ecf23a 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>> @@ -67,11 +67,11 @@ properties:
>>            data-lanes:
>>              description:
>>                CSI lanes to use
>> +            minItems: 1
>> +            maxItems: 4
>>              items:
>> -              - const: 1
>> -              - const: 2
>> -              - const: 3
>> -              - const: 4
>> +              minimum: 1
>> +              maximum: 4
>>  
>>            remote-endpoint: true
>>  
> 

-- 
Regards,

Benjamin

