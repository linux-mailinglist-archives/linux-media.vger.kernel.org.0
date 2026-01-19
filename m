Return-Path: <linux-media+bounces-51029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C57D3A3F6
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 11:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8278530C208E
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 09:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6DD3358B5;
	Mon, 19 Jan 2026 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJld3oOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BktFPm9p"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132B309EF7
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816622; cv=none; b=AwI9vaEGgt10Xq7M22L7oZG0M/IFQuhu3VG7V3V7aozNxQmPM9C/l1EKsBBQm+4cbnYQH/fCEWYAdh5TRf/zQQxDzj706x9orb5QeylO9L6qZ3P6hnLm1okmQ0Ad0e+yvrMT8ZERK6wa6fHsORyaNz3aRyN0BaGWnZ3o+5622lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816622; c=relaxed/simple;
	bh=w5LhqyrtK2foDVF6cSsSjiv6bAGSSxjOZCtQCJ2+fdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETkBmNg8ob2Y1oqg98ByxdA8sU+Qz1XnE3bEe/W6W//3/AqqvWIGxDmscUV/d0503zgaDXoOa+oE+o3Uv4sr01l59Wr5zNPPLG7MUFUiDry1RuwExHGM1rpd8ejigA01BVHzBy4F2d9x0D9K5uMCV6e2YDU4nAHqDixXGIUMTYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJld3oOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BktFPm9p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91Hsp748385
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rRh/bpw38nqL0k524WZlYiDQjQWP4HmfccZ9c+P9Ez4=; b=dJld3oOmrgljq1s9
	3apduHIQF3582Q2cZq2ieE5SHRYNGrAOgTPbMteDb1kTDeAmSwitZtvxBTAomkaV
	Nrrwf0Qv1p4EF5QbSwTL8RxBU8kLHKCEgQAo5M3AhQwwjy3hT6vtU9ZhZpG8ssGO
	w5sI19hxkNMNMykvqU6qcNq1phKfbwTJVeAZxNjF6b88EV0dy+L1cXh2FGgsHy6v
	pWf/w/LU3ko1BZ4bHP23Ejrf2sau2nzYCwJP2m7yDE/tmfkiTlvB7wbptp9KT8UJ
	q4IKM/3dm2UMZM5pGTk6QUs966CB+dCH52o4WAmsv4xsrPWr/c12AIUBiwqA4yr6
	AKP70g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t74jhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:57:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c6e05af3bso4018650a91.3
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 01:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768816619; x=1769421419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rRh/bpw38nqL0k524WZlYiDQjQWP4HmfccZ9c+P9Ez4=;
        b=BktFPm9pPRYCOwiByccVpFqdplokbcZR3aSHl4WejoyMPs9JiY62d6GcCGd094Hyyc
         KM7FtxQ54Z+BvQaFbjEDfXq8f0trlZP5X0jwNu/0ADo/aEIkfKC6uOu7jM8qOCMrFK/Y
         XwjjJeImYq+/MwjzMxJUVYe3pHEoXiFa3DDqyFWxCsSuMc/I4SMRK1+MUjKSyafAjFik
         FojLNCp4R2DvWu1//q2a3f8CF6/0dezqqJ/QVTvZG1fOO22tvN+HxlE+4DiqcM01LubI
         /aqyJaT2UPSAsDwMMpw5PSFyPnwk+JFI+W5Kf03lyEmuOUluvrsuN+29TXqvEebZ71PC
         gnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816619; x=1769421419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRh/bpw38nqL0k524WZlYiDQjQWP4HmfccZ9c+P9Ez4=;
        b=VQxds7quV8uz9sUheVI1IoEHH4DqJqy+JI94Qdb5A39LXOLwwuXqtsvPA+8fmU6D+b
         fJxO+CVS0XqZwWHTEsyubnkRR6ysZQRFpYPLEVzElxkDLNO6GQdgw7Rzm8ElkTU5KLwy
         sxPrjD2fbB3SnxmEL9H4aQHZsGUIBgsaI6fxoEJ3ionH51D9koUd/wDzURko3MNLW+J9
         Cr+wiPofACS2xRdwg1tswmuDO/Qu2MzPC5OepPYT02cFg3iNXHhLRKWgMkrF8X6hd89l
         Y1JdQs/9CXzYozby0eZ/snH2iZEzLznynXFQDccKsRw1BBSL8pWwOZuW3icrnbZ+mJEk
         k3BA==
X-Forwarded-Encrypted: i=1; AJvYcCXsn7ZDPEYz++p+muREiqL/kXdXRxXuMnYMimvfnsBrRvhT2fVQJy8EZ+dkQRlFm1mhut/x18GxD6ibMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzty3ZPdhj5u8ez85TNMOdqJ7NYUyc6HLiL93+YtVTyJv4LENUE
	Ixtmp4nNdS3jWFKAQHSFFQVAxQm+EiE/osoh4Lu2z6qQqjd/Ljkc0lsc4hTRK573JNUclx7d7kU
	CJji4OExHuA++TKDOTsF84Pl0eoMHVOTynNKttMWZKRuQYr+5uN/8bkwBUz0dEdV4xg==
X-Gm-Gg: AZuq6aL8SoHzHuWHYQiymiKMa4CJm9WCKE+WMCU86kzZyUuf4upKmrgZV/axOrCkZML
	eO2ngvhWljaMaFkdVW4m0VpfRpRVwVUPk7+XulzUr5tqo2+Fv/BJPNWIuzYzLMc0D7WwfjO0bkY
	64UzVaCp3RLTh3DaF5JFOe+XsJBy2skIkdaMVuD8vdNV6SFwbwNbUdWGWcwkoWY8RHwLlxtCipV
	9hb+EyKB04gbtqd3PLLTF3FTmNxSTuWfVjXETnxxEGaHOb3CNs1gouI0njRrnZ5VW1IxWcosUyc
	njE2OEriK0RX7JOL0Z5kXKxfXhwZw4vcyk3rHl/cL8WEphqfb9OipAFfKfPuUvKt8zNvB3Qbfu7
	kGSe1pbsj3Q8xBTMXqQKWmztcbRAThXGde5AewaEmgyV4
X-Received: by 2002:a17:90b:4b08:b0:340:b912:536 with SMTP id 98e67ed59e1d1-3527325eaacmr8891746a91.31.1768816619027;
        Mon, 19 Jan 2026 01:56:59 -0800 (PST)
X-Received: by 2002:a17:90b:4b08:b0:340:b912:536 with SMTP id 98e67ed59e1d1-3527325eaacmr8891719a91.31.1768816618541;
        Mon, 19 Jan 2026 01:56:58 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ec7dasm11348365a91.8.2026.01.19.01.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:56:58 -0800 (PST)
Message-ID: <975f9f4a-2898-280d-c0e5-83190f814d34@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:26:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 5/6] media: qcom: iris: Optimize
 iris_hfi_gen1_packet_session_set_property
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <20260109-batch2_iris_encoder_enhancements-v3-5-196855ef32ba@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-5-196855ef32ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696dffec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hqVnMPCZWYgSQcfks7QA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: VLXehudjIBiHpuGhoVu98EHAokZAKZjq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfX4v45rS5wUUa9
 i9fBGw31DiljnKLvGmUYQ8i7TFSZ0wlgcTq7BpEt+QcYGPMS0fbufK5eUE+Qe0zGtMs44xTY9XN
 wX5xpUWgySASTG8/zDdBELlv3s5+GxvLj/CMDBa4AZ/PuWOAgL715iy5s1dAuNBPtjooij8Dv/9
 Di5xD0RZS5BJVnfAiQ81BP2y1VYyphne5SOM8x96Iud8ehBjx2trE/DD13FpV7zUcS5vfCSrAPg
 B3ZA4+LoSFqNLdB85o+NMyWTlccQF+PPyxl/0AFnFycegPFmUI8AgnkHcluyoV2pbcaOC9KkKJH
 lzEZLGnOLoLS64tu1KrcWLBK8BHzX/EqU5C2tGxFaFR+tYDn/PsAhiCWYNFr2oSNQmgch4bdIcS
 tBAErfRBbObY9ElsB0fYoL/gLbdnbcDQ6XJOrdSxaWXGEXRRtGKlvo+5fTRgEwGTjUSILlsSGM+
 iRqJiStT6fIdB57OxIQ==
X-Proofpoint-GUID: VLXehudjIBiHpuGhoVu98EHAokZAKZjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190079



On 1/9/2026 1:12 PM, Wangao Wang wrote:
> Modify iris_hfi_gen1_packet_session_set_property to simplify size
> calculations and remove redundant code patterns.
> 
> Previously, packet->shdr.hdr.size was incremented by sizeof(u32) in
> every switch case, resulting in repetitive and less maintainable
> logic.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 50 +++++++++++-----------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

