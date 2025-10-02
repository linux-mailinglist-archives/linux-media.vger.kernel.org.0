Return-Path: <linux-media+bounces-43598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC3BB38B5
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B88BE189DFA7
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534823081A6;
	Thu,  2 Oct 2025 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntK33hjf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5903C2F4A19
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759399593; cv=none; b=Tke4G9sw4X5BRo5/+laL5oetZzRXqKp4uEf5nZW6r2TlNu47QxhWu+CzyOw0UYdJlmtXlOABGCEWhIpK9EiHhL19fj1pklmWUp8bAX6ZLk9DtjZOuTQ914nHFl5SUnuqG2YdMbZUcdmqnKme6hzPlvtT8k33PUObxWFrzuE1EXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759399593; c=relaxed/simple;
	bh=Xk0ZMuoLn6B1XqtDIyDn5SBbElMp+XKnzPvGOFyIfo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fM9AdgSfbzNyzF/QgZibeuD2ueD1TZ6AHihjjBVCi+F8H5nfE3XZAHoFk8S60sEmz+5lFW2PlhzMiYqWNFrGdd6NizHIBVqthB9RQo/jcH0ClajtfJq/m3vAKMu+/pIaNLgv0xCwx71HcQEjK+50tE8s5vqGoQeCpyz4bwWrHWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntK33hjf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929NYHp006633
	for <linux-media@vger.kernel.org>; Thu, 2 Oct 2025 10:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lyoR5zFmPjLYNw1L0yVBnS+u3QUDvwCd06FITUk6o6g=; b=ntK33hjfliiF2/yo
	K3T9L4HP1CR4Mozu74/fRoiWxtTA/Bbih/fT5nn5RsZDOLtC14j/6L5aj8eITiPG
	oPe4bDKU7S8mKyJ0cMAu56EyBiAi4ZyM4eKtxSi0jPnK1+oRvgJcb7q+i37Oxdta
	Udwnb2b7T7KhGqkP76y528nIHGAd//icuMMy0HPYi0wBQj9nVwfc8hi7qp5+ltO0
	XC80W0otHfvyeCTcigQLLYeCWQXDRtuK/d6liIYAESFwwce58rwLIxMxhQ+XFRFh
	bYlSVrDw4nGazxJz/2TzPqNGSfJvuvw60NAmg6vK5bolaR9o27GMlskM1nfNl7gP
	15WsFA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851qf0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 10:06:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b54ad69f143so1097167a12.1
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 03:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399590; x=1760004390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyoR5zFmPjLYNw1L0yVBnS+u3QUDvwCd06FITUk6o6g=;
        b=HiH8XI0ayIgaQe0HzZImF9BavHPVI+nyfzHPRQMEkxRK0C2eiq1OzpZ70P6fhcbMVS
         jrdz/scb4xDNMRHAtQHylje4yh9zsQ6cApk5tEZ2Yx4HfW61i5wNRD/YUwyF4z9jHr80
         jLXPoxN8c+gLJH/QJDCUVyjtKXQ9gzWGHOmZiyAf2Drm7g1/QEe9Zagb7iX9lvG2tiuF
         GgoTXjNO3fNgBeyBKIF2BCC+7mP5HqknypLTxHaBtgEDFyeJDvXm8P++HI3IFFwIEHCm
         bq/A/M1DXyteSOsBE95jBcPDZLH73DrKPsN84wW+LPNKr7LFy89nWjLOwJ9favmTENuF
         EEHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0WN5P3Cz1q963C8SG2QQKpyA6N/NnNKgcjDseGivQWBR5Qn4CdGC+yioIgk9SrjG4/4pMbD6ZzZlmRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySzoKxIRMoMrEvSkUi108627g6p9sBMt68ViJaOHzMTdwnRER6
	e9lZl6jTIpFyXWNCh3Qbb4hVOHT49tFUdn5/KCfyDBMwZ1Lp+RzSObdeNqAZ72g3M0EFOkJJ/ki
	23uncDFu0Od2aYpo04XqMLmdvXJgnZAcSVpxBap1U0GtKDCSYPIbgLFQbHH/Mhksd0Q==
X-Gm-Gg: ASbGncv0fqa6fysUAOkwB80jwFqA7iKUhzElcc7mONFIWOiji9OTVfBY5PutjCqgCmt
	PjnhQ0M9GR9ToP1b9dRPHH5pIFNLPnZVAIq03y4tgvQy27V7ntjD6gNYh95Lrc+5C0KqeH2qGJB
	llmBYV/Wgrdt01Xl4EivF8vlJROtPqi3snKGavUaVRj04FVPCrWMlohsbHQinItJqJnqtmoTksR
	w269lCWxOHkVZrG2haXECW86Vs0h4l717Yg53x9ySVRw9bk6+0giAKYjdSXt437Obhe8JZwynH9
	5RSHWKaiWvKAAkRt7QbpvJlt1yhXhNlG8bW55Fk5CYF+JF3vevOER/L/kUQZI1Qe6zEuTeDRm8r
	I3iM=
X-Received: by 2002:a05:6a20:e614:b0:2f0:4f71:c482 with SMTP id adf61e73a8af0-321d8452aa2mr9556507637.1.1759399590407;
        Thu, 02 Oct 2025 03:06:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcKiWJW5aLjMg3oNcuCPIVwZjr+gQ1x/JxWytHkyrPwo2mPMeoJLrZ9O10AaPCw0B12SvaNw==
X-Received: by 2002:a05:6a20:e614:b0:2f0:4f71:c482 with SMTP id adf61e73a8af0-321d8452aa2mr9556469637.1.1759399589951;
        Thu, 02 Oct 2025 03:06:29 -0700 (PDT)
Received: from [10.204.101.186] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9cda9sm1861043b3a.13.2025.10.02.03.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 03:06:29 -0700 (PDT)
Message-ID: <a8e2906c-9812-0a99-297c-4eceb6c426c9@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 15:36:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/8] media: iris: Introduce buffer size calculations for
 vpu4
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <NFzYqaeq5sb1dHtVN0YuNSMRZSaP8tEluFULzxY35Ir2qNpfsn1yP5Ptd9zxuuLzyD7oMcyeZR_NK1DgsO0sKQ==@protonmail.internalid>
 <20250925-knp_video-v1-4-e323c0b3c0cd@oss.qualcomm.com>
 <bee1da42-1108-4d71-a854-e3f76c5a6e96@kernel.org>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <bee1da42-1108-4d71-a854-e3f76c5a6e96@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68de4ea7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=rPdB782uDU9_FGz_shsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfXxHC+pBzsCIil
 wywjNSrDXpqTFwV5DYTxkl2657fXN/E8jhycatqoYNvBnKvfYb5+qq+Akr8I/0QAHqq6dzyaeul
 7YrIHSyJlSs6snsGnzfljyataqPCmTt5QGS8g2npiA3pm3rWTAZLJnlHNzxkwJm2dmH3jI3Qfzw
 OCeLN+NomFZqgKZAEnKLP3kwDY9zpc4074LBX0y5sNQ+mFJI1nNL3qP2O7hyhRllMxWp5DSNdWI
 AslKh2BCkzw/743rqROBnFUeHPvIZWbipSS0hp5BC3zmCqtCso2XKj9w+tx92BXjivsDn4J2EYb
 eL6Oj2IwlBIlTW23VKOY2Jsysce3SjbDox8Opybm3u4sJWZqMumutBUAmW9zTFtdvfE/XZVw0wG
 y4mG2tJDmzwn/3q7SmutgoesjlbWkA==
X-Proofpoint-ORIG-GUID: 6VrfOPJLUfCXWRtaaRimqYZuBWD1S0Pj
X-Proofpoint-GUID: 6VrfOPJLUfCXWRtaaRimqYZuBWD1S0Pj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032


On 9/26/2025 6:30 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 00:14, Vikash Garodia wrote:
>> +{
>> +    u32 dma_opb_wr_tlb_y_size = ((frame_width_coded + 15) >> 4) << 7;
>> +    u32 dma_opb_wr_tlb_uv_size = ((frame_width_coded + 15) >> 4) << 7;
>> +    u32 dma_opb_wr2_tlb_y_size = ALIGN((2 * 6 * 64 * frame_height_coded / 8),
>> DMA_ALIGNMENT) *
>> +                       num_vpp_pipes_enc;
>> +    u32 dma_opb_wr2_tlb_uv_size = ALIGN((2 * 6 * 64 * frame_height_coded /
>> 8), DMA_ALIGNMENT) *
>> +                        num_vpp_pipes_enc;
> 
> I find these calculations pretty nebulous and not very obvious to look at.
> 
> A define of some sort with a comment would definitely help other programmers
> reviewing and supporting this code in the future.
> 
> (+ 15 >> 4) << 7 - I'm sure it makes sense when you are looking at a register
> spec in front of your eyes but if you don't have that detail its pretty hard to
> say the values are correct.
> 
> /*
>  * SET_Y_SIZE(x)
>  *     - Add 15 because
>  *     - Shift 4 to lower nibble because
>  *     - Shift the result up 7 because
>  */
> #define SET_Y_SIZE(x)
> 

Sure, i would trying to gather and explain as much info feasible from my side.
At the same time, these calculation for hardware internal buffers have been
there for vpu2/3x, and is being extended for vpu4 in a similar way.

Regards,
Vikash

