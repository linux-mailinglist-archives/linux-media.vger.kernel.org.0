Return-Path: <linux-media+bounces-48310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF850CA6F72
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 10:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E58FF30178C6
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 09:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DD53115A2;
	Fri,  5 Dec 2025 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hiv7ifi9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQ3qSePG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41084314D0A
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764927802; cv=none; b=TiO0fPMMwKN3IjovVx0t5zD1ZpOrFckPSdrfEz12kZFjQ7hqsGS+hmROCWQPPE5b0q7QeqnpQABvYzOg4IkPRvsQtmVUlPCbuxiJdt93DV+qQbMNbS8u7nQxFCBPxCnqySCbCYj2w41PAmS6VDNKFUHdX1YaNWpZsd7tOfJCMYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764927802; c=relaxed/simple;
	bh=1Dtjn/s+S6Phy//fdwQyXqaw9wMZ7QcYaRMSJ3fhAbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGbapGK1ke04iCRvKxEu5+UM2YsFreohXk40PnW1Dynn1GLBUQ/4EhxGpUBtInxJGW35idgkKpZQpic5dpoEN5Z/sxIOfodBMSQXY4uhEevedX0eSt9iEMHaTDHxvDJn7k876D7yLWpcFPi78vIQT/0iOptrwKy4HQyW2e5QiOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hiv7ifi9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQ3qSePG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B586pdC2516877
	for <linux-media@vger.kernel.org>; Fri, 5 Dec 2025 09:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	051Y9IVu26emFyHODILoIGxYykNYI0ydzB1GW1bIHzg=; b=Hiv7ifi9lGDpNtur
	gq2NlUeAinhoE8WqF2rdgDRthwpdZzK9Rq/sVH5+dhhVrbvNL7ZunBqYxxH+f+pU
	97mRCgoM1EmuMa2Bcc+RBd1D5rD5+AnJGjIN44Gw0fhTd6hh5aLx0bVKm6M7O8Bq
	YqyNPLP4hBlrsNIP0aZ1WT3ZvRzH+qoRWGb8ZW8ay4yWzpiVamW0KbeJpUufnBVV
	2tKr3NcNopQcrOcfqLsNLlCQhs0DV0mTUmI7e3Ni2XuCw+aThxmcYu01jhlHKK70
	Dnjr3fkK0dk5d+IOOOmSxtIBTdFLsgE+xlA8DhaMZpuklslsxbfU0CWghYRxE6X4
	ZVM1NQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n1pbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 09:43:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88046bc20faso5438016d6.0
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764927794; x=1765532594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=051Y9IVu26emFyHODILoIGxYykNYI0ydzB1GW1bIHzg=;
        b=iQ3qSePGJPXM1OpDctVmQSn8ovN05AY8dSyrluKwBmqQ2pJmRuyZ+zVCqjKtc36pWy
         ocGVdZbyYvigvLQ6M0fSK6t4cPR+36U1gX2jtw4LWB+vT5uc3j7z0iQX7ChJu9WRjX47
         Tj5Bgn8TWVfLzJOcxnpCAVtEMjswv7aVytNT89Pr5XTse/4FPFMC+fUXP+3w/s5YlHOl
         eM3jFlu8idyHv5N3lERXeYIrJNm5PwfCa/+/ARV9GuORW4fnn3UahDfrvXw/YPMQy0L9
         7TtEHHJ5/ixPYfE/Q7C485Z4GlIstdvYA0EFFswDujB0RBGC22Kl2oiStNunnKKn6JL9
         fjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764927794; x=1765532594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=051Y9IVu26emFyHODILoIGxYykNYI0ydzB1GW1bIHzg=;
        b=qsobtoQFui1Blp6zRwvEcLyM94hhlcODGzJwTkcVrToxF4B+6K95F3tH0g96Hx6OGW
         44VgAWkCMARUaGHyILapYLltaWuxjH62HlorofXY38zgrCkA2nen93VFOrM2nNB8u/Du
         gbUaB1BtDpfX87NQJr2ZLjoowb4Nf2Oop4hBd0y43xMMmMPDs0RNJcBfY29DppWkjUQY
         cpFgmsbSnBv5WIC/6Gu+s3aS0DeWrzO5BIDpHe9cZcsszI0IDWtAryGpkHQGK/40nKfV
         9UUEns7ymmiuLZNU8vp1MjIasPEg/nYpHPH0Tdm7+Q2zIxnf+Ko4OazkY8FldCvKiFWZ
         Ldkg==
X-Forwarded-Encrypted: i=1; AJvYcCXq/rA0ogK2Yy0gS8sZhP6Egu2t6s2M2WQTOye5qFzqZgS/azIzvpn56c8SC1IynpfBypyJKSm4wjNAUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMHQaGirnXMsUdJXYKG2T6Finb7E8hk/z2QyQ1r/LRsbtkOvZN
	OFyyirHlsrsB70e0kkfogrUO5A4JAUTuvVDHiYTPSr8MDkisawC2aSFXm3CklmVcLpAjq6xzwOY
	qE8PxFHJ2yNrdCC3VOamuvBIOVrb2VN+XRmafKLFL+GCzWKrjtt2PDaBttQd2eJ8weQ==
X-Gm-Gg: ASbGncsSl01n3GSTUWP2Eb6sz2RoM9Z4i61DR4k2ayzftKGsB60myhGMkm0Jma/VDlh
	tkV4uEnMtHxkgesg59J+FsC4Q0+zff0JJDC3hYF0sKGu3anMqKhdgGylSmYKvYSb3hRxC/2H56p
	ptumMtG6XaTXzB/72fxqhtYkyPeIY132nYoCpGK6oN+yO7msETMGhs/PojzTB88ae9xy3+hclg8
	r8G4iXdMYgTvn3AynOK0eOpX3SnEYL2vvE8Mg42uy1eMTChkFLw1nFWyfC4HNmWZd17MwrrVMpL
	JpMKutdU56eyXqCd8GffVF9TuTcOh6k7jGYS5ERXCwGXdAb37FlnK7brnvsv+0cEDyMnSaPhHTR
	LPXf86oLMHKXQK/zkvos9bEKpgmh14l+JMNOUyYYmwdXpOP+XiDapqVCdNsBsW/xj2g==
X-Received: by 2002:a05:6214:401:b0:880:4954:6af5 with SMTP id 6a1803df08f44-8881d8519aamr104391076d6.7.1764927793860;
        Fri, 05 Dec 2025 01:43:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE00PIHFiV3/tKHkvG/O7NMn8xXqMnCgGo5KoqDYRTk+K+AnVBCSbZOXWXZ68Sp48OzMKygug==
X-Received: by 2002:a05:6214:401:b0:880:4954:6af5 with SMTP id 6a1803df08f44-8881d8519aamr104390936d6.7.1764927793472;
        Fri, 05 Dec 2025 01:43:13 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a7c5sm1350921e87.11.2025.12.05.01.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 01:43:12 -0800 (PST)
Message-ID: <9af39b45-581b-4e25-8ab9-19015f00d6bc@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 10:43:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 3/8] media: qcom: camss: Prepare CSID for C-PHY
 support
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-3-6b35ef8b071e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcom-cphy-v2-3-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=6932a932 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QkNP4qxLxUHCfFU9Qr0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: RhafTMCw4Z_KltLNH_c-Ai2zMwSAoWTe
X-Proofpoint-GUID: RhafTMCw4Z_KltLNH_c-Ai2zMwSAoWTe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MCBTYWx0ZWRfX3Ve9DK+bosfh
 HdGi5Uoj0uGDxRbzmQxcYUAOjF3S00Y6pk25RhXkByEOhWU5rXDLL274j01KyeLVH++15+5InJV
 A3srkJj+xNCYON67lvttPVTBVXm+2umlB5rtu+G+mci71mqwj4Xne1E1OqVyum1Ebn8F1Qn5oEn
 vkYHivfx8EAIlEXYmFEeXZM5hIWmasieBAyFIaYuyofoh50s3mzPe463w3A66maFrnTHLycebdr
 7kEfqAtO9vtwz5g1RWqY+J5zZv0FYtQ6m/qq1aMkLUlZpqlzlKodTC7fAj4/8DBu25qXuogrtQ2
 NLjGsomchDg8Q8Pt44ueaW8wX3P0VoBIiG4DFfJHqYs7BJXQ0clrFFTUHeh7PQ1VnkYO/ZAt/pC
 KdosyCmF50nTxbTc7ZQmZK+VukEp3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050070

On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Inherit C-PHY information from CSIPHY, so we can configure CSID
> properly.
> 
> CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
>  drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
>  drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index 2a1746dcc1c5b..033036ae28a4f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device *csid,
>  	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>  	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>  	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;

This field is 1-wide, this would be neater:

if (csid->phy.cphy)
	val |= BIT(CSI2_RX_CFG0_PHY_TYPE_SEL);

Konrad

