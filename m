Return-Path: <linux-media+bounces-51022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93163D3A34C
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71D403016B81
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 09:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC0B356A26;
	Mon, 19 Jan 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cvvg3NUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLbNYJKe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB713502BF
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815638; cv=none; b=p+zTLUMIyf1PqYw5cmYk6liXUWJNw62rV8hryxEHN5Pv4wq7CV84yj3Cg1D1sF14VyYzLhoof4dx3noV10FJHuJsGeWNxjhXoE99mM84zKBXXG1zEgzJ75oYYuaXZVmMkJz9VgTj//C0RPwtXDRKUApvKwh2WWOec0G4Vr3kisA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815638; c=relaxed/simple;
	bh=twlrZl2HI0iBiBkJYhXKCrLjGLEWpqwu2Wk2mC0mbe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnXy1KiJKW+mc4DPvG1WTjvpsTXB8rg9Y2uz/1GrPCFlVsgWYzdewlf20bQdv1AjEdIXxoUzOzsuEc+qM/z4xgVFFkmZl7bSPeWHNzLvr6IxSQDE5pdbH0tlN6c6QJK+2kTPG0oczyl64rw5UPdMziR1CoaJCdrBNkz3SKnHhKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cvvg3NUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLbNYJKe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91L6J748470
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bip6G8csV4zq/Xp+lYc4Ge8wdL7FLZzkYw/gjd1Ywp4=; b=cvvg3NUYIxQPKJvS
	vItfA8AiTG8ZUUY1hkdSsQWWeGcEAWLz53cKwzg5NQ9wAefCM3cNc7EIX4qPUPuS
	epWFPWj953JjJaiw6bwOEDjm6cMozpr//pSb0iZdtLw3DUn7SQo9aeX7cbDpDlfA
	CN1dJlxv5vO7+ETVj1aXMEqbzNIq4MDi0KiAXIevNDQGGyCoQy5aLVg5x3knx+1B
	yxsPt/pHCHsYfK0rCevM9Gl1tmZyIPT0rjc/FsulZE0atf5HVSKpNEGIXNnSBLHc
	Y3GpUHnNcvnXwui8/3Ayl2WqqH9uy6SaMubi230302Jg7INwN1xC97ERdegn7186
	Ru/Adg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t74h2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:40:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2b45ecffso64070075ad.2
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 01:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768815635; x=1769420435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bip6G8csV4zq/Xp+lYc4Ge8wdL7FLZzkYw/gjd1Ywp4=;
        b=WLbNYJKe4YzHCXzxtVt2fRMgOzcfvRNxWQthkbUsx0AtoEA9NlYfXwasp/dzZzFEHc
         HICFdQFt1HO42vzer1JamSqLnxFBoThO9VrYhDH31/1pPgeyzeV5B38bG+qMu9JSaMFF
         rFJbGGaJgazygANDPx6WpYUjI9QTwnopD6k++9AhTb01U3hvZUPnhx3wIV/jn9cvdKyh
         1zpEDZErHI7g4KpYiPmX4ZueX/RFQXcZyha2AdM8gxRZdU/Uzjo0s+k+FznOC+w8Dji4
         hjdWfA3W9R0Cu0PhXp0tL2qyHoWMQBGcbqk/CszWlDYZjYs+h9q+ManuiTQeye8N1CCr
         oCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815635; x=1769420435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bip6G8csV4zq/Xp+lYc4Ge8wdL7FLZzkYw/gjd1Ywp4=;
        b=RCAW5ktOrT277idUfDXCbbpF4limPvptdPjYbhaK2PsVnMW9bqNgDqxBrzURsC/9Ep
         Xt1p46i9g8afKcYhN9NDBU3YOEIimtdpHwmzsU+Xcvu8jlZSsgZ8a2BxO6dnzUF3J6kp
         l0eaoJe10OLslneeD9bupc+KFMlpOzZGfXkLZN8SVeUEsNu0ogEWFvbEIrHkc0x1jOwg
         qWHaP1GJRETUglrUYyk3IFWnu0yciuc05O0nqNk441JttJh7Aqn+h1/YWyMtugPF5Gbu
         fazNc9TXrQ7M2Dq8bOxwAGH2RxXjEsCiJ8CQmkzuQfKoUHzjwPPmPg5xOeNsn8KX0gYV
         CWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+AgXeHRbMnzFm+ncp2PCoZDIGoAnlvxywpxQ9vuVkHf7B7hPvNG5TYCm0ArPRqKhJ/1LaD4ih8gFb8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBchUy1BZUP2UcZSn2hBFtAgjsEyWVL7QTcCQB6SoQ1joGK307
	T6bGzSLRJm4Fck+KJKeq/oSI4WODY1Y7XI1hEFp+FovlkAVy8kXYKoI1MM6JWNsXPEghdTH2Nhs
	6IZXg/3h8+Rugo3Etz/Wfx7DiDcCceDwPMkEi+GjfRrJxQ1H3Yz+yRCl/DAUoKVEpZg==
X-Gm-Gg: AZuq6aLcxUVzF4+q/HKsuBCFqXSmMcBQqvj0nMMOQpGGqzTpcWZ12f98CBu0d6//5ik
	+sQLaTBcZFVopK+hTu9w11hmA0LzjzyqeT4YVnVkHmoNubR0q6HU5GvjkgHbsZdiZNSFgMuge8w
	gOQGeRYdQSLAUTRejc/DzEsa8l63dd0Fjd5CVxSN24FxH11i+5C3NdyjlZj5dc24D1Lu+Khp6jF
	dDonhJ304v1FdE48yHRc9toX+8ghnC+KYeNXw4an7x57vmXxEAiZ6aOu/tTwpmsgamXBCjd6rsP
	tfzh21zAtsD9hkV6r6ZOV2Mnws6tQO5Ru9MIalFy1CHaP1x179CRkdpsGHpKnSo8Pv/sBriEGJq
	5OhwT8w+R9RSBsjeh7gZPHmjTaiovaDjPbnkRN5HuFw7e
X-Received: by 2002:a17:902:f60b:b0:2a0:7f87:2347 with SMTP id d9443c01a7336-2a7175be2abmr98610885ad.46.1768815635293;
        Mon, 19 Jan 2026 01:40:35 -0800 (PST)
X-Received: by 2002:a17:902:f60b:b0:2a0:7f87:2347 with SMTP id d9443c01a7336-2a7175be2abmr98610625ad.46.1768815634867;
        Mon, 19 Jan 2026 01:40:34 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941b915sm90223415ad.90.2026.01.19.01.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:40:34 -0800 (PST)
Message-ID: <2b87e1bc-75ea-f2af-cb81-fd12b5d2cf07@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:10:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/6] media: qcom: iris: Add B frames support for
 encoder
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
 <20260109-batch2_iris_encoder_enhancements-v3-3-196855ef32ba@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-3-196855ef32ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696dfc14 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hqVnMPCZWYgSQcfks7QA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: _VHPj6TEL611dC1izEY0jfA32yBrEvbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfX1bbYFyZmMZ/G
 8t8zxRxC9Plzy2if/br25GZj9fIX2xSCUwumf0Y22+9bl/fv0vMVbTC8vXcK2k8sFbecC7RpMSK
 Scs2avkVsGqjlp1H1bTWn6A35W1mF+KLxHSJj/77jhmPUdzlSFObBaOfLGTAKqcnlgFnvYzcHX7
 cbLZC0iz4IjGo4HYH75bdmaTjucSzo4NN8lEw6m7rc7sEVSCa42cpiQFKfip+OAP3P+o1cof4zq
 VEuAq+s2Ao3YwUnheQQrPaJ4tts87nDQxY0K7kduFgRSydZrW58ZlWRbLwIVxUfycsF8O6B8a8A
 2YyoCj/Pm2Jm0QTBhvZq7mNTFKPeUOKG+2unQtHi9zMO1ILmnSA9VBFdpwEVnIBkLZCl7BRBtoS
 Sx4Xvkz+1ADl/+zkDM3wuhNMsavpUtsK+pl89leDmNFkcuK171gsQMSD8I7ohZdUyKlbLiO6ILO
 npiLWcbN6bMOK23NmLQ==
X-Proofpoint-GUID: _VHPj6TEL611dC1izEY0jfA32yBrEvbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190079



On 1/9/2026 1:12 PM, Wangao Wang wrote:
> Add support for B-frame configuration on both gen1 and gen2 encoders by
> enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 30 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 ++++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 10 ++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++++++++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 ++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 ++++-
>  8 files changed, 84 insertions(+), 1 deletion(-)
> 


Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

