Return-Path: <linux-media+bounces-21262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E986E9C4114
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 15:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D60AB21180
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 14:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6AD1A08B2;
	Mon, 11 Nov 2024 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Se5irdY5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0953014EC55;
	Mon, 11 Nov 2024 14:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731335784; cv=none; b=jrwQvGObug7ZOgodtP03ey00dLHx7PPc109U6W2rSMXEcZ+vknWKMgn27XcuxQ3zJishKDSelcd44aYGHgtxM2bUKRHorr/vrZuCwFSyYpgrmWvTup2kChIJ8VVHwaNxD+iNE1mp1ieOrdbnINqW0YJd/XsKZ7HN/xaUm1Tf/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731335784; c=relaxed/simple;
	bh=tB+KD7zTi2f1hi6GxLePQ8a5nPfNIZ/EWne+PunmC2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QA9IRzNvhXv5Yb5XIPyVolLK3+dDPMy1jW//tuxU7uhdw3dLwNXi7KVYP4zCTtItuD0hw+WDonSe2v5rTbd24XUMn835XyHbvGoJGmqgSQwzUNhauWcOyCoAr23vSvDqRWCnVKPuzorFddgN0YkNQ0ZpfUx3yGwdaPoeSCoH+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Se5irdY5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABCBP2e007341;
	Mon, 11 Nov 2024 14:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8P259kAHltHcyLSDTVL2UZ/hP1y2gwLMMSlMpDppz3c=; b=Se5irdY5sisHJT00
	01ghIdyB/1Qq8pwEJcf9rSj3LkaUGhADTrpl32unv21w2prqi77JCr6OUko8lxIA
	PrRsnncV2jfDNgfnWuXDqmAACdvp1dYXA7htd5zWMUrI7gCHwouNQ7ruOgUAtbMj
	wb6uDvluTlaLb1A8hTwPGWMvk8uIv+CGkTwph509pV1SSohsD70FHAlim0w+ubzI
	Pw+GIyWL/cjIUVOv6Bazi2Xh4GVUC3YhjLY/L+JKgLmBhlnQm1givmTrYZMC+70i
	9lVOZBQUjbfwGDd/mzRnlv0Hs8JMM0bzWGd1aoH1CTZrV16dG+MB0XQFWYuShTSX
	6IaPUg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sweecky7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 14:36:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ABEa5Rv018903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 14:36:05 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 06:36:03 -0800
Message-ID: <9098b8ef-76e0-f976-2f4e-1c6370caf59e@quicinc.com>
Date: Mon, 11 Nov 2024 20:06:00 +0530
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
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <474d3c62-5747-45b9-b5c3-253607b0c17a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: E_qPzhYrSEEDDrOqgOK7QpFe_OjE27F1
X-Proofpoint-GUID: E_qPzhYrSEEDDrOqgOK7QpFe_OjE27F1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411110121


On 11/5/2024 4:45 PM, Bryan O'Donoghue wrote:
> On 05/11/2024 08:54, Vikash Garodia wrote:
>> words_count denotes the number of words in total payload, while data
>> points to payload of various property within it. When words_count
>> reaches last word, data can access memory beyond the total payload.
>> Avoid this case by not allowing the loop for the last word count.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c
>> b/drivers/media/platform/qcom/venus/hfi_parser.c
>> index
>> 27d0172294d5154f4839e8cef172f9a619dfa305..20d9ea3626e9c4468d5f7dbd678743135f027c86 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
>> @@ -303,7 +303,7 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst
>> *inst, void *buf,
>>           memset(core->caps, 0, sizeof(core->caps));
>>       }
>>   -    while (words_count) {
>> +    while (words_count > 1) {
>>           data = word + 1;
>>             switch (*word) {
>>
> 
> How is it the right thing to do to _not_ process the last u32 ?
> 
> How does this overrun ? while (words_count) should be fine because it decrements
> at the bottom of the loop...
> 
> assuming your buffer is word aligned obvs
> 
> =>
> 
> #include <stdio.h>
> #include <stdint.h>
> 
> char somebuf[64];
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
>         uint32_t *my_word = (uint32_t*)buf;
Make this as below and it should lead to OOB
uint32_t *my_word = (uint32_t*)buf + 1

Regards,
Vikash
> 
>         printf("Size %d word_count %d\n", size, word_count);
> 
>         while(word_count) {
>                 printf("Myword %d == 0x%08x\n", word_count, *my_word);
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
> 10 = 10
> 11 = 11
> 12 = 12
> 13 = 13
> 14 = 14
> 15 = 15
> 16 = 16
> 17 = 17
> 18 = 18
> 19 = 19
> 1a = 1a
> 1b = 1b
> 1c = 1c
> 1d = 1d
> 1e = 1e
> 1f = 1f
> 20 = 20
> 21 = 21
> 22 = 22
> 23 = 23
> 24 = 24
> 25 = 25
> 26 = 26
> 27 = 27
> 28 = 28
> 29 = 29
> 2a = 2a
> 2b = 2b
> 2c = 2c
> 2d = 2d
> 2e = 2e
> 2f = 2f
> 30 = 30
> 31 = 31
> 32 = 32
> 33 = 33
> 34 = 34
> 35 = 35
> 36 = 36
> 37 = 37
> 38 = 38
> 39 = 39
> 3a = 3a
> 3b = 3b
> 3c = 3c
> 3d = 3d
> 3e = 3e
> 3f = 3f
> Size 64 word_count 16
> Myword 16 == 0x03020100
> Myword 15 == 0x07060504
> Myword 14 == 0x0b0a0908
> Myword 13 == 0x0f0e0d0c
> Myword 12 == 0x13121110
> Myword 11 == 0x17161514
> Myword 10 == 0x1b1a1918
> Myword 9 == 0x1f1e1d1c
> Myword 8 == 0x23222120
> Myword 7 == 0x27262524
> Myword 6 == 0x2b2a2928
> Myword 5 == 0x2f2e2d2c
> Myword 4 == 0x33323130
> Myword 3 == 0x37363534
> Myword 2 == 0x3b3a3938
> Myword 1 == 0x3f3e3d3c
> 
> ---
> bod

