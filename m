Return-Path: <linux-media+bounces-48527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3CFCB1B23
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 03:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A4E8301B62C
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 02:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6B018787A;
	Wed, 10 Dec 2025 02:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYVv8sqE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zhgud5Ys"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F236B640
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765332712; cv=none; b=Exo3Opis3YR3S1mCvfHRB+3AiW1zJ4maYw54yBRDvkK4D0iAT7p5ljU4/7JJMzn5OMdKq5NYHsCmacZChoW8WKsgyhoBeUllynWjdfObO2Sesyu9DwU3l3Cl9ZCEoyS0aJV9RtFJnWas+nLwA+2mI5B+WQ5XhOnp56c8v3o1Mrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765332712; c=relaxed/simple;
	bh=xnH/dYr6Tbcz5LyRL8zwdXYLOF1pAKGeDZXraGcxNOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqhNulu1li1vec1KgCNEt0K1+KIx8yhQpyMl9fs3ywiMs83brb57+pbpnw/duhzBFDonCcM8sWz+P6Y1Dg+2YsyrNXTU2lR80M2YZ+w7mplLpdqOGpugt7duTXISCshRCTI7obzsMIZdmn1iVY2in/pCbi0bl4Ehi/jnKqhuQ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYVv8sqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zhgud5Ys; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0OiDE1438880
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 02:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPbqbtc7HcYJPrik81jdvnPoUbNPmJIJ/+tZEL/7JcU=; b=YYVv8sqE9Xs5AcEq
	Qk163CgGQWGEM6fhbsXe+TSe8GBJImGlDFT32xL18bEE5bab8XWUmsjBAT3sZUTu
	EPcbyrMi+wO/Jl/Rgpu1O+juIfhfw1/IoDJBRn5REgBGzeOsmi/6P4Q9YBl3Plv+
	L9mjZriao9cTOBftIC6oE/YM8U+oRONGRStcEeiX4cuAwfRoeE1qmIApE9Qx7pLD
	wExfVBZYXTIWrMCq1hDEAjXoDk+KW4DE2eCuJPE7UQw6VFxU34RI7uTG7hPPCQmy
	Hl0JeHs01tO8f47dZK7Deh/lsmEafDUoA9uPSnAl1H0MzO6165+5FGIVeE79kXgW
	RzLDSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axm9cafgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 02:11:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295592eb5dbso117633265ad.0
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 18:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765332709; x=1765937509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KPbqbtc7HcYJPrik81jdvnPoUbNPmJIJ/+tZEL/7JcU=;
        b=Zhgud5YsSrZ+z4NaLSvKJ1n3jGRva5r1Wfx4y6DNqGCm3X3SmPd1eaPwb6jwDNeBUj
         gUKkYWo0XnYnx7KO6Q7FBqnbYXmS4pHbYDtkrvDkpxBHsHe3er8D/7asJ/rvuIlGnKR8
         lNtwsXe60ncz4s0z7bTHkgk9DP8z3qAbZ1aL8OzOr1EBNNC3HQARbSlT10nQr4mjWCqo
         tD9ry/4kwLRTrHDOJyV3y3K2N2opwD80mlaIueZp8l8Y1q2qK2p96Xk57fa61fHEntdI
         M8n25oT7UVu8VfIDha8kX+sZ3y9BOFMGCt+sIdhB14lCP/crFRUC5DY51WIpmDrWuF4J
         dE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765332709; x=1765937509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPbqbtc7HcYJPrik81jdvnPoUbNPmJIJ/+tZEL/7JcU=;
        b=Lf00uC7614gPUR+UgzfNrYII1sw6+bDGe/K7cHF8wNbKblD3mbZLW8A4m8hWjBKCxm
         UFKIuUYb3vetlcpYeJB/yM+GsrHJMM0dAwpDRMcbbl0Evk7kmcmpiK7qS6uU6sCT4E8Q
         P+e/boaxf2Q2wi62EwFKLbx/Jr1GsyJIKVfTJgBXaYyES1tIgHKbfrsPn8DJ88CikKjW
         MWED+O9ipdoVyzANQcqihFV8lmG9XmVcb+YW9C44zAyISZ7RiDuaFWCqlVHTtepCjKbk
         SJP5g0D5GVfmePRsMdnxUhYVK84EINvlA4/GdhYD8gr3gGR7L1EIY9SoGOE0sWoa+1cI
         glyw==
X-Forwarded-Encrypted: i=1; AJvYcCU3gvEJ/PMLGCdvrOTjYXWkjzk9o9r8U9fDN0S/cfBXf2CqxzQyE6T3yqs+V9L2kGib6LHc4PsjnKRtVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhUDxmPp3tc/jHlClRlOutHJsut3vODZDG287j4kMxPzXMB6Nx
	/RryHLHaAeMiAl2Zd37HN81AjFK1h6ePeyuYLGwoLiVhD73o75VQto8pV+ev+XtgmiKEAx4h9t7
	L4oayCSUTCiGXoyWctmhSaQZ/f3cZEt4H8hBP/vlIRC2BAYTRLn7QvdSniivPvfEv5g==
X-Gm-Gg: AY/fxX6b3p35j0bCqQE0FK3BUC2zLyWLVeFfSOwLOW0/fyCON5TODuQMaycBnUBU3AR
	n1mzsu8bMGxBN8qMpqVNlIZ9u6cPw82IRePBGozuAviGn1T8dGyraOEwFfgvwPdDk+vtyUooRDf
	m4BsjR87c2mFd4vvxXUcWYTaVqRgcKL9vGyLz4HMB3EUxNo5wsDRymGJ6RQUDS0j9f3blA98Ut2
	i8qt57PaI4qTnhn4JRuT2Y4e5hLX2p6l+/BwO3f5TFiUAdqQo+ZIa+wcvIvDobL1Qg4CZ2OYuSg
	rLW8tfn4kn2rkfNdcbcEnqevvNlscCebfc+Phu9S/qxxKtBy7Rcg6egbKZiKLab5P+GeFKLHKT6
	V5xIlimb/MjpYJRv5Pv/lZaH+M1S7KedfB6JUHtBOfkaZPpdOvwxquWP9rxrJI1WbSLeLR9RQV8
	BLxxZnLg==
X-Received: by 2002:a17:903:2311:b0:295:9cb5:ae07 with SMTP id d9443c01a7336-29ec25a7010mr7459075ad.38.1765332709215;
        Tue, 09 Dec 2025 18:11:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXspY0nDKRpyjv6slIy3q0/KUNCNs3aIMdRf45UIyhjR+Tt32D1VTq2WRYPh0TFXFVXlD6hA==
X-Received: by 2002:a17:903:2311:b0:295:9cb5:ae07 with SMTP id d9443c01a7336-29ec25a7010mr7458745ad.38.1765332708664;
        Tue, 09 Dec 2025 18:11:48 -0800 (PST)
Received: from [10.133.33.217] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99fa59sm168140965ad.58.2025.12.09.18.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 18:11:48 -0800 (PST)
Message-ID: <f5aaa9e3-a709-421a-917a-34b25c58fae7@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 10:11:42 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: vdec: fix error state assignment for
 zero bytesused
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251208-fix-error-state-v2-1-255b62ee2eb6@oss.qualcomm.com>
 <bqu2hcyy6nbjlzcrowcq4i4bwdycfidgl5l4ocbr4rcanhsi3l@lsyb6h3sn55b>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <bqu2hcyy6nbjlzcrowcq4i4bwdycfidgl5l4ocbr4rcanhsi3l@lsyb6h3sn55b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAxNyBTYWx0ZWRfX8hKR4RmG9nLw
 9oDYIoa+Ja/K6IIuM3WGEgC2fG75hY4F0pmZP3osxuGiUgR3u1cfk36OyamFm/aKOWdnFGmfGQm
 8G7TeBua1uXwYkmXvT2Ak6y6tbiSUGi4DbYgJtTMMEX4ceO31+bBgBMsRjKghkmsCqlyUD161oA
 D4+zGaZa1T8EShDANq3DVt1O9xhW/sAh+sRUS/1iu/VScLQPwSabGlVMxJPUuxdsPzqF6swEiN2
 kolptRqwPauwzmTVg26jEdDPCE5plH896vQX2PmU/cPQYKIgs/lBcVfIwSWXpf1hitzLQwdKrSo
 nAMZlLlurSKKmFt7+f6C3nZrjIElBfJ2xk2QF7Fg9jGc1CTNHSi7YeScY00RAR13vjUvzzZqwtk
 b1/wy90xdkNKVlcrq0aSXOfFJ2JQbQ==
X-Proofpoint-ORIG-GUID: D_MPYJEBQTZ6qJvyntlztPpKRrImtK47
X-Authority-Analysis: v=2.4 cv=Vcj6/Vp9 c=1 sm=1 tr=0 ts=6938d6e6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=l48zq0wRcjR2jSCBNtYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: D_MPYJEBQTZ6qJvyntlztPpKRrImtK47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100017


On 12/10/2025 7:11 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 08, 2025 at 09:03:42AM +0530, Renjiang Han wrote:
>> When hfi_session_flush is issued, all queued buffers are returned to
>> the V4L2 driver. Some of these buffers are not processed and have
>> bytesused = 0. Currently, the driver marks such buffers as error even
>> during drain operations, which can incorrectly flag EOS buffers.
>>
>> This patch moves the zero-bytesused check inside the non-EOS branch
> Documentation/process/submitting-patches.rst, "This patch".
OK, thanks for your reminder. I will update it.
>
>> so that only capture buffers with zero payload (and not EOS) are
>> marked with VB2_BUF_STATE_ERROR.
>>
>> Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")
>>
>> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> No empty lines between tags.
OK, thanks for your comment. I will update it.
>
>> ---
>> This patch refines the error state assignment logic in the Venus vdec
>> driver for Qualcomm platforms. Specifically, it ensures that the buffer
>> state is only set to VB2_BUF_STATE_ERROR for non-EOS capture buffers
>> with zero bytesused, preventing false error reporting during drain
>> operations.
>> ---
>> Changes in v2:
>> - 1. Update commit message.
>> - 2. Add a Fixes tag.
>> - Link to v1: https://lore.kernel.org/r/20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com
>> ---
>>   drivers/media/platform/qcom/venus/vdec.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>> index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>>   				inst->drain_active = false;
>>   				inst->codec_state = VENUS_DEC_STATE_STOPPED;
>>   			}
>> +		} else {
>> +			if (!bytesused)
>> +				state = VB2_BUF_STATE_ERROR;
>>   		}
>> -
>> -		if (!bytesused)
>> -			state = VB2_BUF_STATE_ERROR;
>>   	} else {
>>   		vbuf->sequence = inst->sequence_out++;
>>   	}
>>
>> ---
>> base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
>> change-id: 20251126-fix-error-state-24183a8538cd
>>
>> Best regards,
>> -- 
>> Renjiang Han <renjiang.han@oss.qualcomm.com>
>>
-- 
Best regards,
Renjiang Han


