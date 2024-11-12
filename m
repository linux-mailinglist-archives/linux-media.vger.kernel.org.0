Return-Path: <linux-media+bounces-21284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4079C5050
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 09:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18A8EB24FE3
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C348420B1E6;
	Tue, 12 Nov 2024 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AEJtsguf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF72B207A14;
	Tue, 12 Nov 2024 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731398751; cv=none; b=YdRknBjtPOIQSlDkDDwgIcV50A7T/AFeAmbtrr6oJp8guKY5D/MQIKKXcd8Bw/nD1T6xr7PJbwy5o8dp/fkIFRrasFAtI2eF9fuX5/Qv3yH7O2xrKw4lmnuhx14TRSuCH0BtsnEgJfcoT/ililIhJcizlr/qv9iZ1426B/QMvPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731398751; c=relaxed/simple;
	bh=IeB/4XzrOyimQ4eBaOEL5hd1GPkvU5aH7HCprMBSaR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UGit1S0fNCHSqjGkYdlCySnQhVZ3CRsYfBlRMgTHn9PbyBYyNVmhHePAJLr/exPE8lAPg6OQz2Pgyde7fpvh0ITMdRYaOcPliYaDn+3WwVB8thRagifeKCbpCnUSG2c2TvSLADkf6ih5q3Hl5CVtgb5pcFFeg2WrZjiEim2u4g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AEJtsguf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC1BSK5032123;
	Tue, 12 Nov 2024 08:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrd1dDuetkCSIDjAFPNOoc+ysmrRPIiHLNI+nAu1p+U=; b=AEJtsguf+L7YK3wb
	7WV3XNjODMdNqawW/M6iBb4u2JkOfs+XKwqsLnj3ekaVJ9m9jw8jmdYH2u9fP2VV
	4tVhy0N6VsFfbb/rNDU84e5QYDnItTz/6N+pmGRfvUq7qkK9ajA0GDqo/xIk2em6
	eD6CEPTsaAbIS5BKxrM4mRofUo4MI6qfqmcaBNG6CKDmGVtShAWVO3rg5Qs/cNfN
	2+8NibQAZyMKqpg5IgJMK9LsICObyLjnpHIo+/6a+IJDWO4P/YMRmGdoJIIB7Nlf
	Yu+VDOUo7k1j1nRoz48WtoH+ffOHdJ+HpyjJhM0JTwEZa1IT8O5akuS28E+fn0EJ
	CdXrEg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gkxg5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 08:05:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC85icl023067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 08:05:45 GMT
Received: from [10.216.26.111] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 00:05:42 -0800
Message-ID: <c9783a99-724a-cdf0-7e76-7cbf2c77d63f@quicinc.com>
Date: Tue, 12 Nov 2024 13:35:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/4] media: venus: hfi_parser: avoid OOB access beyond
 payload word count
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-2-8d4feedfe2bb@quicinc.com>
 <474d3c62-5747-45b9-b5c3-253607b0c17a@linaro.org>
 <9098b8ef-76e0-f976-2f4e-1c6370caf59e@quicinc.com>
 <f53a359a-cffe-4c3a-9f83-9114d666bf04@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <f53a359a-cffe-4c3a-9f83-9114d666bf04@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KHd7DbBJrH5cRN5YDxjG3K12YSMFFBKw
X-Proofpoint-GUID: KHd7DbBJrH5cRN5YDxjG3K12YSMFFBKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120065


On 11/12/2024 5:13 AM, Bryan O'Donoghue wrote:
> On 11/11/2024 14:36, Vikash Garodia wrote:
>>> int hfi_parser(void *buf, int size)
>>> {
>>>          int word_count = size >> 2;
>>>          uint32_t*my_word = (uint32_t*)buf;
>> Make this as below and it should lead to OOB
>> uint32_t*my_word = (uint32_t*)buf + 1
>>
>> Regards,
>> Vikash
> 
> How does this code make sense ?
> 
> 
>         while (words_count) {
>                 data = word + 1;
> 
>                 switch (*word) {
>                 case HFI_PROPERTY_PARAM_CODEC_SUPPORTED:
>                         parse_codecs(core, data);
>                         init_codecs(core);
>                         break;
>                 case HFI_PROPERTY_PARAM_MAX_SESSIONS_SUPPORTED:
>                         parse_max_sessions(core, data);
>                         break;
>                 case HFI_PROPERTY_PARAM_CODEC_MASK_SUPPORTED:
>                         parse_codecs_mask(&codecs, &domain, data);
>                         break;
>                 case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SUPPORTED:
>                         parse_raw_formats(core, codecs, domain, data);
>                         break;
>                 case HFI_PROPERTY_PARAM_CAPABILITY_SUPPORTED:
>                         parse_caps(core, codecs, domain, data);
>                         break;
>                 case HFI_PROPERTY_PARAM_PROFILE_LEVEL_SUPPORTED:
>                         parse_profile_level(core, codecs, domain, data);
>                         break;
>                 case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE_SUPPORTED:
>                         parse_alloc_mode(core, codecs, domain, data);
>                         break;
>                 default:
>                         break;
>                 }
> 
>                 word++;
>                 words_count--;
>         }
> 
> 
> word[] = { 0, 1, 2, 3 };
> 
> words_count = 4;
> 
> while(words_count);
> 
>     data = word + 1;
> 
>     switch(*word) {
>     case WHATEVER:
>         do_something(param, data);
>     }
> 
>     word++;
>     words_count--;
> }
> 
> // iteration 0
> data = 1;
> *word = 0;
> 
> // iteration 1
> data = 2;
> *word = 1;
> 
> ????
> 
> How can the step size of word be correct ?
> 
> Do we ever actually process more than one pair here ?
> 
> #include <stdio.h>
> #include <stdint.h>
> 
> char somebuf[16];
> 
> void init(char *buf, int len)
> {
>         int i;
>         char c = 0;
> 
>         for (i = 0; i < len; i++)
>                 buf[i] = c++;
> }
> 
> int hfi_parser(void *buf, int size)
> {
>         int word_count = size >> 2;
>         uint32_t *my_word = (uint32_t*)buf, *data;
> 
>         printf("Size %d word_count %d\n", size, word_count);
> 
>         while (word_count > 1) {
>                 data = my_word + 1;
>                 printf("Myword %d == 0x%08x data=0x%08x\n", word_count,
> *my_word, *data);
>                 my_word++;
>                 word_count--;
>         }
> }
> 
> int main(int argc, char *argv[])
> {
>         int i;
> 
>         init(somebuf, sizeof(somebuf));
>         for (i = 0; i < sizeof(somebuf); i++)
>                 printf("%x = %x\n", i, somebuf[i]);
> 
>         hfi_parser(somebuf, sizeof(somebuf));
> 
>         return 0;
> }
> 
> 0 = 0
> 1 = 1
> 2 = 2
> 3 = 3
> 4 = 4
> 5 = 5
> 6 = 6
> 7 = 7
> 8 = 8
> 9 = 9
> a = a
> b = b
> c = c
> d = d
> e = e
> f = f
> Size 16 word_count 4
> Myword 4 == 0x03020100 data=0x07060504
> Myword 3 == 0x07060504 data=0x0b0a0908
> Myword 2 == 0x0b0a0908 data=0x0f0e0d0c
You did not printed the last iteration without the proposed fix. In the last
iteration (Myword 1), it would access the data beyond allocated size of somebuf.
So we can see how the fix protects from OOB situation.

For the functionality part, packet from firmware would come as <prop type>
followed by <payload for that prop> i.e
*word = HFI_PROPERTY_PARAM_CODEC_SUPPORTED
*data = payload --> hence here data is pointed to next u32 to point and parse
payload for HFI_PROPERTY_PARAM_CODEC_SUPPORTED.
likewise for other properties in the same packet

Regards
Vikash

