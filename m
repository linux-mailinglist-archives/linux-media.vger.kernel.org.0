Return-Path: <linux-media+bounces-47213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 236B4C64494
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 14:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 1AB88240B2
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 13:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B7C32B98A;
	Mon, 17 Nov 2025 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxZBAexS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZbATuEX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D140932E734
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384884; cv=none; b=SpWQp7RG0R7G/8Zj+1yxFnsuPX4J067d6dP6HutTU4SZ03ZgBlGgMpxsgaHFd5OCw79c2KDzWj+gdEfKyXYHdVGvZEaZGV87QCkNGRro73qeHTn6tae1d52Oi+CYYkBZdMF9CGMtKVTGVmx2pxApsJqW2yeYa3KBLkfgAx736EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384884; c=relaxed/simple;
	bh=nHSwsWa3H255Mse5CWXfUUqSCs7afTkcA77l91bou2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EXMTMPlkWZu7jjtzUGH8jaBCGo6fMuSA3RnZB8TaUk84HwsWQwNk45QxRrTcyrcHnJ11gi5eJnf1r5ZYojV97HZPucuHhUBWCrHH6K2xkLXrFfRzD9mfgGWmpJmeyNDmarvxMr2qYmzVI7FcBcnAkaYNQt28uDyvL5BkZHlWSp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxZBAexS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZbATuEX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAkMBN2790796
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 13:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOz8Vw/EkKM4D5JDYTKGDekhB/DET0Ni+ij9vn1xhrY=; b=AxZBAexSJGwqB+dj
	fr1wn2LAWKT8tytCTUqQlHhxcNh17P1H4FXcY+7bPatcyOt10FoZdDDUMJFQ0YKl
	Ljb2j+hFkpnOBD7jGuBLP/TsD4E1n7he8PGgcoknlcmvF/nx62s6kKI8LU3g+cBt
	4nwlCyEaYA+J7ddFKl8Jfp6YAU9SGXMKSbGoRcVHZIl+uS2a1zA0dxgh8bLl+w9i
	hbE9IMy79Z1rehcTDkgWDrZ0Ajv773mUeIeKyl0C91TvUmTEANA0VYPfjpyTtFXo
	auI2YhC3AiJW/0kQJruKYnKW42pHFHMjzkp2l/GK2Q4bbMza6Ck6ZrtmFa72qWzP
	GcwF9A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bhp52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 13:08:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dfbe140bffso686261137.1
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 05:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763384881; x=1763989681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOz8Vw/EkKM4D5JDYTKGDekhB/DET0Ni+ij9vn1xhrY=;
        b=aZbATuEXKS3SnKzUbEAmQn+M25Fr8GRHEqZtrmr37T9EoSzfuv6xzYM/7ZUZWasR7J
         ZtNKdapGUVhJctwrSbPWZE+gwY6VmT/3N1E195BrhXtnbWPLb+9Q6+6ubK4jU0XKw/tx
         bVx2cQ2nYjb9XOhILNrA/I81ik9wH2g5l6T8Bciq9Y+FKQexmpGIPKf5x/AsqAW8hIFf
         tHwyf4fZCcTI3twh1UeBryneWGU9RhTJfcuPLxQFH4UhvF5+Eeaq3AZgsl3rB+fNqrsX
         b7PkcVCODDL23qWp1RFBzNeODgP9GU0vKgLmSu8x1kxQMXjM2mNtJjtz6FwOanSRSUXl
         nfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384881; x=1763989681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOz8Vw/EkKM4D5JDYTKGDekhB/DET0Ni+ij9vn1xhrY=;
        b=p7QmbGBB445lKP5111HC/qzDNJXeEMnYsZpF7Ri8AHIf8e6L7SGWAWi4IE0ztdMAVa
         PxF3cto/zOpVqjqJFApmt6cEbvf7I3XFxE+s3quCAdynB406XXlBIDSkdtKe7/dXs8n/
         rNb9uUNvDLZg6Nq/YjX5IDzEAhs83Jlu4M5MMeZQVL/cbkTr+z8Bqga6GalV/VGGZECK
         J0eSLw2+aRGdZjjamHgsCHUAj4HpQABfZlvRbil/Zv6fOYodgY0Qg6K8Dtvm+B/PrfJ6
         Amq3dMIlwFJET8qn4py/LX5hY8qxk9lkUTjLb/TaMjC8DZKsjB5slO70GWTuW6r+ddI6
         cBsw==
X-Forwarded-Encrypted: i=1; AJvYcCVCuGWbMvxsNSxnAip+HocdqalftFlHbmFABdJkYnfxQCdCsBAIcRc08n6jTorBWOe6aqrAyQOW0uLjZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygOaENsNPXEb+imqF6GFVFfuc3u6xOipbXTWyhPsXONhi6MW6L
	GxoYLYNGcAenVq+Ir+rFuiPPZbrnmluEedWqQNyaO9eY7UO5F6d6YbJ2gMspllQk0kk7YHfEXlj
	Bu/fXQUiIOKceDkOm+R3crDbcKQnrDVPgKTyS1ayXwX39y7n9rkLenHai3jfKkbLAFug6BOjlYg
	==
X-Gm-Gg: ASbGncsjxMHKIYmHtnLm16fZSTJeUvS7ri5mcpP1EsBLG/d3LixNkvfNz73h0ZiqknH
	rMoExsEewOU55CJmehHe9+z/Tz4a4DDLQiBGtl+Q0TMI7NpxjKfxW7wJWb53Yz8dpvYCEj7jDO8
	dGyK7bLnmqQ7oG5jGB3/UMh+PlfYxO7++E9oVx7fOkpsbePGaDDGCEDlUxozC2jSEvlIiPzJy2T
	QHLG+7SWg+O49Y8TAqKwL/vqbyllVfryuV+wclVf0x00fDqRIVoSP5Lb3RQI/O/VP8Z6i/Q4Sun
	RXO5fXUjs23qiymlgCAyXuC+Ka86ertAeYBohfokPA1nc7lEUzR8fYypygmHnReV5tlb0djo1LW
	WFzPOKrkh0tS63rQepYauHvuN7Iw20fGpJPsQl9cte5NhtYPXJvWjGx/o
X-Received: by 2002:a05:6102:6442:b0:5db:36c1:17bd with SMTP id ada2fe7eead31-5dfc5b94aaemr1817995137.7.1763384880868;
        Mon, 17 Nov 2025 05:08:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwPpOPibTf3AZ+TWVStcnKED5zlgO2PzuMaP7kB5rzAiAkFpCbN24ro21fVMBc11GUV4/+qw==
X-Received: by 2002:a05:6102:6442:b0:5db:36c1:17bd with SMTP id ada2fe7eead31-5dfc5b94aaemr1817986137.7.1763384880511;
        Mon, 17 Nov 2025 05:08:00 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad43dfsm1081146266b.20.2025.11.17.05.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:08:00 -0800 (PST)
Message-ID: <04934c94-6323-403a-876b-d808fedd3a79@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:07:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: qcm2290: Add pin configuration
 for mclks
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-3-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114133822.434171-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dB1jKzlF6iBo51C61RtP9TDNH1xPlvJp
X-Proofpoint-ORIG-GUID: dB1jKzlF6iBo51C61RtP9TDNH1xPlvJp
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691b1e32 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=F2uzNt_Jvis__oCUEkcA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMSBTYWx0ZWRfX2821deLjI7jO
 YWRiYbnN2YzsiU/MaRyuz5rfS0kZcv0KaSkBfaZXYXKTRpXrlZ6H7Pxjcg+DlvKhug79ZldrVOf
 pczOr3wmC/CeV0A6gp0Ez/PiSDXQoOjm+qEkdONEKTGyjbePbMU5n6YaacfMLPChv/VCSfL1/Gl
 MzaNlJkhHOUoIQQU8akUt4WmVyVcTqPzjhyPoQejfj6z67D3oGh/IepblWPPjfxoUpNbnhtyuDj
 DgqmM8C8GtZeAfpoz0gjMSRc47rKmOXpvAmkh3evB1OEL9AlSmOJsVNbkzqAtcJg8iqwh+txwM+
 gRNcaLI30t19+NOWoERNn0coIb5PBMaetjkFIsnUtv4Q6Rm9zlHQJcune8KSBYvb0KDjZpAHKI7
 T6urTO/DM0Pda5ZMM0anRSG/vD2+5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170111

On 11/14/25 2:38 PM, Loic Poulain wrote:
> Add pinctrl configuration for the four available camera master clocks (mclk).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index 8bf5c5583fc2..e14d1f444ab5 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -597,6 +597,34 @@ cci1_default: cci1-default-state {
>  				bias-disable;
>  			};
>  
> +			mclk0_default: mclk0-default-state {
> +				pins = "gpio20";

Preferably these could be sorted by gpio idx

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

