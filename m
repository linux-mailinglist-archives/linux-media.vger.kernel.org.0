Return-Path: <linux-media+bounces-22435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4913E9E034F
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 093DF282852
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 13:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359E01FF7A2;
	Mon,  2 Dec 2024 13:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pTR7JXAu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B275D6AAD;
	Mon,  2 Dec 2024 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733145900; cv=none; b=ZpsdlYzLlt+by7ENbsUxPHDHg4eDZ8h3kvQajYHTmr7wc7kv1EuKVbE8rHvn/Zdd+92G+BPb6nSrUo963iZ/OdgoflY3wZvOWyYiipR4c8iw3bScbt4L2ykLKBKZuxcZnW96MJVypJ2RzZj3FUvB16WrxGSjJkzKWr5WlBpHdqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733145900; c=relaxed/simple;
	bh=2RGkFkQhNXu7IplBUKMZrWxASEw31FeMxzQP7yI3tLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SmdH5wtRrEOpxtlWL7G2QSK4XKiIUSV3vqYGoKJ8+2NwojFmyu7BRqZcSypgBz0QtCOHDx8VT8kCIyMxrjGMKJMlI1wrK9UyYTKBc0ixMBowqJIHNnFEvvImCVCkFuBk2QUHLmat+FUx11u+g3NrlL1zlYhu/jWaFOwbrIFzcj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pTR7JXAu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28TqU2021908;
	Mon, 2 Dec 2024 13:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ysc6LZ2pXuLGDigdD9AfRlOq14I0mdHobGAZKT1DBDM=; b=pTR7JXAuwZei0HSO
	wA8jfJjwxPUvx3u1yMScH4nQklIJr1tgWTrfq20H3TP5Qj1qgoHk+GGClwyl0uZB
	Gu194iUjm7sd3qdYKCEi2XIVyNj4lcn0BhGtOuMLh9F7RzZgXh/eC9Nk2IsxPx3g
	B3RR/n9AlJi3lP0yRmOisUO0MFndjI5BQ+b4zyuSzh57c8irtOdRUAj1w6ZplS3F
	4ZS3bfuN/SX8PgjH+pUV/3kmUT5YwT/yhI9eSVcPFL782sFPhd9iogD85T2gyTv+
	fUQELieicltqZw9GKhn9uAkaotUS/rAwl/Uw5SxmbD0be7KG1BSh4B5lrbycI/sy
	VNx6pA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437rded2yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 13:24:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2DOpvx012975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 13:24:51 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 05:24:47 -0800
Message-ID: <1a6d05d8-08aa-cb84-ca36-859be3c589c3@quicinc.com>
Date: Mon, 2 Dec 2024 18:54:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/4] media: venus: hfi_parser: avoid OOB access beyond
 payload word count
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
CC: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab+samsung@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com>
 <20241128-venus_oob_2-v2-2-483ae0a464b8@quicinc.com>
 <65002924-3b8b-47ab-aa90-4733ccc2f728@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <65002924-3b8b-47ab-aa90-4733ccc2f728@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Yp_rYfePQF_FHwsGFgmyACebDwgl59-R
X-Proofpoint-GUID: Yp_rYfePQF_FHwsGFgmyACebDwgl59-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020116


On 12/2/2024 5:38 PM, Bryan O'Donoghue wrote:
> On 28/11/2024 05:05, Vikash Garodia wrote:
>> words_count denotes the number of words in total payload, while data
>> points to payload of various property within it. When words_count
>> reaches last word, data can access memory beyond the total payload. This
>> can lead to OOB access. Refactor the parsing logic such that the
>> remaining payload is checked before parsing it.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/venus/hfi_parser.c | 57 +++++++++++++++++++++-----
>>   1 file changed, 46 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c
>> b/drivers/media/platform/qcom/venus/hfi_parser.c
>> index
>> 1cc17f3dc8948160ea6c3015d2c03e475b8aa29e..14349c2f84b205a8b79dee3acff1408bb63ac54a 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
>> @@ -282,8 +282,8 @@ static int hfi_platform_parser(struct venus_core *core,
>> struct venus_inst *inst)
>>   u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
>>              u32 size)
>>   {
>> +    u32 *words = buf, *payload, codecs = 0, domain = 0;
>>       unsigned int words_count = size >> 2;
>> -    u32 *word = buf, *data, codecs = 0, domain = 0;
>>       int ret;
>>         ret = hfi_platform_parser(core, inst);
>> @@ -301,36 +301,71 @@ u32 hfi_parser(struct venus_core *core, struct
>> venus_inst *inst, void *buf,
>>       }
>>         while (words_count) {
>> -        data = word + 1;
>> +        payload = words + 1;
>>   -        switch (*word) {
>> +        switch (*words) {
>>           case HFI_PROPERTY_PARAM_CODEC_SUPPORTED:
>> -            parse_codecs(core, data);
>> +            if (words_count < sizeof(struct hfi_codec_supported))
>> +                return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
>> +
>> +            parse_codecs(core, payload);
>>               init_codecs(core);
>> +            words_count -= sizeof(struct hfi_codec_supported);
>> +            words += sizeof(struct hfi_codec_supported);
>>               break;
>>           case HFI_PROPERTY_PARAM_MAX_SESSIONS_SUPPORTED:
>> -            parse_max_sessions(core, data);
>> +            if (words_count < sizeof(struct hfi_max_sessions_supported))
>> +                return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
>> +
>> +            parse_max_sessions(core, payload);
>> +            words_count -= sizeof(struct hfi_max_sessions_supported);
>> +            words += sizeof(struct hfi_max_sessions_supported);
>>               break;
>>           case HFI_PROPERTY_PARAM_CODEC_MASK_SUPPORTED:
>> -            parse_codecs_mask(&codecs, &domain, data);
>> +            if (words_count < sizeof(struct hfi_codec_mask_supported))
>> +                return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
>> +
>> +            parse_codecs_mask(&codecs, &domain, payload);
>> +            words_count -= sizeof(struct hfi_codec_mask_supported);
>> +            words += sizeof(struct hfi_codec_mask_supported);
>>               break;
>>           case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SUPPORTED:
>> -            parse_raw_formats(core, codecs, domain, data);
>> +            if (words_count < sizeof(struct hfi_uncompressed_format_supported))
>> +                return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
>> +
>> +            parse_raw_formats(core, codecs, domain, payload);
>> +            words_count -= sizeof(struct hfi_uncompressed_format_supported);
>> +            words += sizeof(struct hfi_uncompressed_format_supported);
>>               break;
>>           case HFI_PROPERTY_PARAM_CAPABILITY_SUPPORTED:
>> -            parse_caps(core, codecs, domain, data);
>> +            if (words_count < sizeof(struct hfi_capabilities))
>> +                return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
>> +
>> +            parse_caps(core, codecs, domain, payload);
>> +            words_count -= sizeof(struct hfi_capabilities);
>> +            words += sizeof(struct hfi_capabilities);
>>               break;
>>           case HFI_PROPERTY_PARAM_PROFILE_LEVEL_SUPPORTED:
>> -            parse_profile_level(core, codecs, domain, data);
>> +            if (words_count < sizeof(struct hfi_profile_level_supported))
>> +                return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
>> +
>> +            parse_profile_level(core, codecs, domain, payload);
>> +            words_count -= sizeof(struct hfi_profile_level_supported);
>> +            words += sizeof(struct hfi_profile_level_supported);
>>               break;
>>           case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE_SUPPORTED:
>> -            parse_alloc_mode(core, codecs, domain, data);
>> +            if (words_count < sizeof(struct hfi_buffer_alloc_mode_supported))
>> +                return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
>> +
>> +            parse_alloc_mode(core, codecs, domain, payload);
>> +            words_count -= sizeof(struct hfi_buffer_alloc_mode_supported);
>> +            words += sizeof(struct hfi_buffer_alloc_mode_supported);
>>               break;
>>           default:
>>               break;
>>           }
>>   -        word++;
>> +        words++;
>>           words_count--;
>>       }
>>  
> 
> I like the changes made here.
> 
> Let me suggest you have the parse_something() return the size of the buffer
> consumed or an error code.
> 
> If you calculate the maximum pointer instead of the words_count
> 
> frame_size = payload + max;
> 
> /* Your while can look like this */
> 
> while (words < frame_size)
> switch(*words){
> case HFI_PROPERTY_X:
>     /* if the function returns the bytes consumed */
>     ret = parse_x();
>     break;
> case HFI_PROPERTY_X:
>     ret = parse_x();
>     break;
> }
> 
> if (ret < 0)
>     return -ret;
> 
> /* you can increment the pointer once at the bottom of the loop */
> words += ret;
> }
> 
> 
> That way you can
> 
> 1. Get rid of words_count and not have to decrement it
> 2. Have one variable words which is checked against the maximum
>    size while(words < frame_size)
> 3. Have the function that consumes the data return
>    how much buffer it has consumed, instead of inlining in the
>    switch
> 4. Increment at the bottom of the switch once instead
>    of several times in the switch
> 
> IMO it would be clearer/neater that way. Please consider.
Appreciate your time to dig deeper into it. Expanding your suggestion, filling
in the details

frame_size = words + size;

/* Your while can look like this */

while (words < frame_size)
remaining_size = framesize - words;
switch(*words){
 case HFI_PROPERTY_X:
     if (remaining_size < sizeof(payload_X)
        return insuff_res;
     /* if the function returns the bytes consumed */
     ret = parse_x(core, words + 1);
     break;
 case HFI_PROPERTY_Y:
     if (remaining_size < sizeof(payload_X)
        return insuff_res;
     ret = parse_y(core, words + 1);
     break;
 default:
     ret = 1;
 }

 if (ret < 0)
     return -ret;

 /* you can increment the pointer once at the bottom of the loop */
 words += ret;
 }

If you see, words_count is doing the role of remaining_size. In existing
implementation as well, we can move those increments per case to once per loop,
just that to avoid incrementing for default case.

Regards,
Vikash

