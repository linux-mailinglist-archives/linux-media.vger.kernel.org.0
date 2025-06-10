Return-Path: <linux-media+bounces-34407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C3AD321E
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C05D172536
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6922B28AAE3;
	Tue, 10 Jun 2025 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6AJV9/ij"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E33928BA9B;
	Tue, 10 Jun 2025 09:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547934; cv=none; b=sJduCs5aYfirOg7P+vKStXzqUMHE1TzjBBMPrJYiRmEYwWvL+4dRPI4RCYqvEP+P4S2zMCrdr6xBcYijdLOL7VAR0MHosHU/HnvEtjBwg90AFaAL7BisQWTpYhCvdy8wTo9IDRrdWpOny1MTpho3VXK7kNXFLuhXuUpR2yCK728=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547934; c=relaxed/simple;
	bh=1tLDbCKJrSqumtEDaqsJmvpX6BOpqJ7MW46PQFtyADw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hFpnoTeQo60+MH/WGPAnBpo8Ss2zJkBojKigC1Ctb1e5I0z/zzk3weaJOp0ssOGq0gNoS8+SR4GvWzswsk/OE4qBCyffsYAWs9Zq01YNrjkOcx96BdASmp5OrN2/ubzLxVSh4ZVfV7gml/a41fUnOHDU3/8zUeqzi0uhwcDObGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=6AJV9/ij; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A86AMP031764;
	Tue, 10 Jun 2025 11:32:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	02a3n6IYRiGb9mEIL+GZf28LWw5poQHQl27Plwu3uao=; b=6AJV9/ijWcU4mUaI
	P8B1gdgwQS6VFKqd5hj7s/nx2JOxb/YdOcAdWfZRWnYsg8vJZSZlqlIK4dni6aTi
	Xgwe6MLVdMgEAMWu6Jvx6ZMluG+R6sZlUcTfxQvUscZobxqvrdbc0ydFU7+AepNU
	dHjazO3lx3CYzvHQdkOkBaH4VmwCW/5CEuxNG/vmP0UnlvNoGkc1U08Jz3lJ4qoz
	oCHZSAYWB+AC7ovkt2+wZvOoryljUiPHEoPA9ZSK+JW6tV5xSY3A/kGWgc1Y7e2c
	2RD5Lio2/rUKaSOXUNNWh+U9zmegZ1TJohpEsYlmpnJpGsm8+WDV1UWt4+qYYqD7
	pn35wQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aumcckt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 11:32:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A3D2940049;
	Tue, 10 Jun 2025 11:31:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1596C6D3821;
	Tue, 10 Jun 2025 11:31:12 +0200 (CEST)
Received: from [10.130.73.167] (10.130.73.167) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 11:31:11 +0200
Message-ID: <396b3ee1-d737-49dd-a804-e07027c19fd9@foss.st.com>
Date: Tue, 10 Jun 2025 11:31:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: i2c: vd55g1: Use first index of mbus codes
 array as default
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
 <20250609-fix_vd55g1-v1-4-594f1134e3fb@foss.st.com>
 <aEf1KIRuP_DdSqJO@kekkonen.localdomain>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <aEf1KIRuP_DdSqJO@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01

On 6/10/25 11:04, Sakari Ailus wrote:
> Hi Benjamin,
> 
> On Mon, Jun 09, 2025 at 03:46:24PM +0200, Benjamin Mugnier wrote:
>> Factorize code and prevent future erros in case of media bus codes
>> change.
>> Rename VD55G1_DEFAULT_MODE to VD55G1_MODE_DEF to mimic other macros
>> while at it.
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  drivers/media/i2c/vd55g1.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
>> index dec6e3e231d54a742bdd08ff2a506c152bb89429..177caa5470cfcf49e0ae2fb568d7872a5608a11f 100644
>> --- a/drivers/media/i2c/vd55g1.c
>> +++ b/drivers/media/i2c/vd55g1.c
>> @@ -111,9 +111,9 @@
>>  
>>  #define VD55G1_WIDTH					804
>>  #define VD55G1_HEIGHT					704
>> -#define VD55G1_DEFAULT_MODE				0
>> +#define VD55G1_MODE_DEF					0
>>  #define VD55G1_NB_GPIOS					4
>> -#define VD55G1_MEDIA_BUS_FMT_DEF			MEDIA_BUS_FMT_Y8_1X8
>> +#define VD55G1_MBUS_CODE_DEF				0
>>  #define VD55G1_DGAIN_DEF				256
>>  #define VD55G1_AGAIN_DEF				19
>>  #define VD55G1_EXPO_MAX_TERM				64
>> @@ -1260,7 +1260,8 @@ static int vd55g1_set_pad_fmt(struct v4l2_subdev *sd,
>>  static int vd55g1_init_state(struct v4l2_subdev *sd,
>>  			     struct v4l2_subdev_state *sd_state)
>>  {
>> -	unsigned int def_mode = VD55G1_DEFAULT_MODE;
>> +	unsigned int def_mode = VD55G1_MODE_DEF;
>> +	unsigned int def_mbus_code = VD55G1_MBUS_CODE_DEF;
> 
> Why the local variables?
> 
>>  	struct vd55g1 *sensor = to_vd55g1(sd);
>>  	struct v4l2_subdev_format fmt = { 0 };
>>  	struct v4l2_subdev_route routes[] = {
>> @@ -1278,7 +1279,8 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>>  		return ret;
>>  
>>  	vd55g1_update_img_pad_format(sensor, &vd55g1_supported_modes[def_mode],
>> -				     VD55G1_MEDIA_BUS_FMT_DEF, &fmt.format);
>> +				     vd55g1_mbus_codes[def_mbus_code].code,
>> +				     &fmt.format);
> 
> I'd remove def_mode, too, and just use VD55G1_DEFAULT_MODE. The 80
> characters per line is preferred but I think in this case using local
> variables just to use them once doens't make the code easier to read.
> 

You guessed correctly, local variables are here to avoid overflowing the
80 characters per line.
If I put VD55G1_DEFAULT_MODE directly then checkpatch will fail. As I
understand this is a hard requirement ?

I could do something like :

const struct vd55g1_mode *mode =
	&vd55g1_supported_modes[VD55G1_MODE_DEF];
const struct vd55g1_fmt_desc *mbus_code =
	&vd55g1_mbus_codes[VD55G1_MBUS_CODE_DEF];
[...]
vd55g1_update_img_pad_format(sensor, mode, mbus_code->code,
			     &fmt.format);

Which IMO improves readability, what do you think ?

>>  
>>  	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
>>  }
>>
> 

-- 
Regards,
Benjamin

