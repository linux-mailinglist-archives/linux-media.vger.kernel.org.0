Return-Path: <linux-media+bounces-21315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB4F9C5866
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 13:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BF3B2853A9
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 12:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FABE13635E;
	Tue, 12 Nov 2024 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eLq0XgtU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E328A70831;
	Tue, 12 Nov 2024 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731416327; cv=none; b=B7gQNCczbRmzLpgQsva8EiMi0LsJIA4tVfNkBrokzmVJJVegnczRdVvV/h8NAhx2kCQ5Dlg8L08/vQe8Ss3DSMT+Ithb81Iv0w/+nAN2Hql8yiVkiJ/puWGn2J5Ly5wxJnwpsmjC4rb+E1lb/n5Uplrp67ZbU6Gt+neYHjgExws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731416327; c=relaxed/simple;
	bh=XsVrg/tycUyf1pge9uDquJ8kbJ4hI9A1otOr9vuWvsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G0eVK3yydQG2bKYTPsddzQjT7Anl7axOmafRHZ3BY8Hv0wiGFHl2Lf45/ZSUg9Y4vXkzS1P3xavCfmf67x1ndqpIU806xEXgkiGs3ODBYTbxzTC0scYjh46S5rTg9F4WEfOdGSOVywU/n516ttIqXmfkysAFVAIhSMycQtM7rYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eLq0XgtU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC9FhLh002987;
	Tue, 12 Nov 2024 12:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TFRQuks3xEPKLnmUVkx3quSMzhADnexEjI/TmNuYo4=; b=eLq0XgtU5E3qcGUO
	78N+NPsqjatL+swhGTmIHtpvaykiNh+ys7s47Kcm7l3GPkGo4T4VKAwfKMVVZozR
	DEvJCaUi0umrjgCXc6HhLQjCAMAN75JKdcxYDnyPhhqmliSwHY/n9NQ1RifAD6a7
	jmF511bSfbL+3Qco103KFi2qvhZOo5BuC6NMXri1Y99DE2Lc0lVq3vYQ6KXKgMdU
	gL6DQQ9YpOwZq/qZnO4vDfGq44uxFihiWkMLSOyS+z+uM7ELIhUMejcLkYawZQ30
	nuc7iqTkcNSEMkowyrZqdbH6NrAEeRB10cK/9NSzyhwdlemviGbc3vTYxZ4JhKYG
	PAWz0w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v47y0jd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 12:58:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACCwend000586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 12:58:40 GMT
Received: from [10.216.11.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 04:58:37 -0800
Message-ID: <410e1531-6c1b-fb29-2748-eca57fc13481@quicinc.com>
Date: Tue, 12 Nov 2024 18:28:34 +0530
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
 <c9783a99-724a-cdf0-7e76-7cbf2c77d63f@quicinc.com>
 <f6e661da-6a8f-4555-881e-264e8518f50c@linaro.org>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <f6e661da-6a8f-4555-881e-264e8518f50c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 68L1PboUyIa3j1Kv36ekw9PdVCYRr26j
X-Proofpoint-GUID: 68L1PboUyIa3j1Kv36ekw9PdVCYRr26j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120105


On 11/12/2024 4:47 PM, Bryan O'Donoghue wrote:
> On 12/11/2024 08:05, Vikash Garodia wrote:
>> You did not printed the last iteration without the proposed fix. In the last
>> iteration (Myword 1), it would access the data beyond allocated size of somebuf.
>> So we can see how the fix protects from OOB situation.
> 
> Right but the loop _can't_ be correct. What's the point in fixing an OOB in a
> loop that doesn't work ?
> 
> This is the loop:
> 
> #define BUF_SIZE 0x20  // BUF_SIZE doesn't really matter
> 
> char somebuf[BUF_SIZE];
> u32 *word = somebuf[0];
> u32 words = ARRAY_SIZE(somebuf);
> 
> while (words > 1) {
>     data = word + 1;  // this
>     word++;           // and this
>     words--;
> }
> 
> On the first loop
> word = somebuf[0];
> data = somebuf[3];
> 
> On the second loop
> word = somebuf[3]; // the same value as *data in the previous loop
> 
> and that's just broken because on the second loop *word == *data in the first
> loop !
> 
> That's what my program showed you
> 
> word 4 == 0x03020100 data=0x07060504
> 
> // word == data from previous loop
> word 3 == 0x07060504 data=0x0b0a0908
> 
> // word == data from previous loop
> word 2 == 0x0b0a0908 data=0x0f0e0d0c
> 
> The step size, the number of bytes this loop increments is fundamentally wrong
> because
> 
> a) Its a fixed size [1]
> b) *word in loop(n+1) == *data in loop(n)
> 
> Which cannot ever parse more than one data item - in effect never loop - in one go.
In the second iteration, the loop would not match with any case and would try to
match the case by incrementing word. Let say the first word is
"HFI_PROPERTY_PARAM_CODEC_SUPPORTED" followed by 2 words (second and third word)
of payload step size. At this point, now when the loop runs again with second
word and third word, it would not match any case. Again at 4th word, it would
match a case and process the payload.
One thing that we can do here is to increment the word count with the step size
of the data consumed ? This way 2nd and 3rd iteration can be skipped as we know
that there would not be any case in those words.

Regards,
Vikash
> 
>> For the functionality part, packet from firmware would come as <prop type>
>> followed by <payload for that prop> i.e
>> *word = HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>> *data = payload --> hence here data is pointed to next u32 to point and parse
>> payload for HFI_PROPERTY_PARAM_CODEC_SUPPORTED.
>> likewise for other properties in the same packet
> 
> [1]
> 
> But we've established that word increments by one word.
> We wouldn't fix this loop by just making it into
> 
> while (words > 1) {
>     data = word + 1;
>     word = data + 1;
>     words -= 2;
> }
> 
> Because the consumers of the data have different step sizes, different number of
> bytes they consume for the structs they cast.
> 
> =>
> 
> case HFI_PROPERTY_PARAM_CODEC_SUPPORTED:
>     parse_codecs(core, data);
>     // consumes sizeof(struct hfi_codec_supported)
>     struct hfi_codec_supported {
>         u32 dec_codecs;
>         u32 enc_codecs;
>     };
> 
> 
> case HFI_PROPERTY_PARAM_MAX_SESSIONS_SUPPORTED:
>     parse_max_sessions(core, data);
>     // consumes sizeof(struct hfi_max_sessions_supported)
>     struct hfi_max_sessions_supported {
>         u32 max_sessions;
>     };
> 
> case HFI_PROPERTY_PARAM_CODEC_MASK_SUPPORTED:
>     parse_codecs_mask(&codecs, &domain, data);
>     // consumes sizeof(struct hfi_codec_mask_supported)
>     struct hfi_codec_mask_supported {
>             u32 codecs;
>             u32 video_domains;
>     };
> 
> case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SUPPORTED:
>     parse_raw_formats(core, codecs, domain, data);
>     // consumes sizeof(struct hfi_uncompressed_format_supported)
>     struct hfi_uncompressed_format_supported {
>         u32 buffer_type;
>         u32 format_entries;
>         struct hfi_uncompressed_plane_info plane_info;
>     };
> 
> case HFI_PROPERTY_PARAM_CAPABILITY_SUPPORTED:
>     parse_caps(core, codecs, domain, data);
>     
>     struct hfi_capabilities {
>         u32 num_capabilities;
>         struct hfi_capability data[];
>     };
> 
>     where
>     hfi_platform.h:#define MAX_CAP_ENTRIES        32
> 
> I'll stop there.
> 
> This routine needs a rewrite.
> 
> ---
> bod

