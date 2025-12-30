Return-Path: <linux-media+bounces-49663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE76CE8BE0
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 06:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AAEE3011EE6
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 05:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C63B2E8B8A;
	Tue, 30 Dec 2025 05:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcAE2BIY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HI2hIABf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BBC27FB05
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 05:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767074208; cv=none; b=EzDxZHllci3gFHElEJADSTO9vWpddq1WM5EpBFabqnpYkPaeV0qG/yv3SZVX9qSZafaPJOif4Yxsx6/ECOOAA37HTVO4+qRAvKAQAKJr4uVQq9Wh8C4PK8w5t7tqULjmmtp3OKA3eJanSPIEJG0SfFdjv5Pbqwn11ngeFjGSoB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767074208; c=relaxed/simple;
	bh=L6H6gmBf1ZBdl0q5TYxz359VcOz9UUMQe1RMxC8Wzf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQQz2JWKiLkcc25GtMLZSAHkqKtNiUPiFCY80OKeMzxDJ+ccL8tF1OiQ6zKPRQ0/qShXuatHYdO7RIdyAq5y5Eqalq2Sk17p4ERXxjopG98rXZSqfLhG2rmKhOjTu6GrcUlI6xwWrjrDsd+wqHg3QtkcVKygHaIhX8ety4MXLzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QcAE2BIY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HI2hIABf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU5RrxZ899646
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 05:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i5EHtVYCCr/LDL6mIRC+UCLJkKZahagXsQnQDecKjrQ=; b=QcAE2BIYE+Yw2Md0
	Teqf33rGqV8L46GhGoVELqIpuhNLjlZKDtbux0kWiXiZKA8FOxrLlpoIpRbZTk9B
	OmlCPQ8T/uLdZ4dIMxGt6NchTum7811pJTqHDNZcecC9bFBDygXME42hTyAmZnHP
	u1u0gSbwDoeMlGN5FCaU+cFetMr4KlgXpq20SnDHLdkEdEs+B3nsVyRfrKU2FUnF
	xi6vX/vhUN7/XdkIP+RghI9xYh2oltcMdnWm2jYmlJxyH6f1QPqopC16W+6Uld5N
	nZgkobWyUnejdyQ3vq+L3SYyTKnzNtk1Ad8wG3SK8fBiT6Znyp/xONihTQbDlcS3
	0JygsA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky01v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 05:56:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a13cd9a784so100072655ad.2
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 21:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767074206; x=1767679006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i5EHtVYCCr/LDL6mIRC+UCLJkKZahagXsQnQDecKjrQ=;
        b=HI2hIABfvufL3IxMqpKDhd56PKm8Bepiq3t7w5t1hfYsJTyZCZ3veIUZfPJ+gBvZgK
         484mKF5P11qj5eME+W8yAh0A/ndO4b2hbAD1V7QU3pP6EeEhijIijhjT5u8cRVpa2fRp
         M5/pY1L3Q9YLwiza/O5cLfqHsFaZE4+3NrM+YTuvhJPOFaIUz26hOgkoMkIgWtbWoCwz
         fcF9XIJuoHEgkBzgVc6cq+zmQdH8gkIVXwY4BQV1wdVWKYHWYuEZdOhxNF+XZo0o0WHX
         B82kdZC/rtJBwWBMkAW/3/y6VVesfpY9n0Dd1Y4YZ/3zSfYFS+nc5U7E8wD3d+O5wi7I
         200Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767074206; x=1767679006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5EHtVYCCr/LDL6mIRC+UCLJkKZahagXsQnQDecKjrQ=;
        b=YFVU4dFKqDPxpZlKddR1EUI47EhXwqPI+S95mB0h5GBTdAiPq95TE2KfL0HElzWqEM
         ESijmld6pNEf5knRte1Mo54MgLgtL0ywrUikeNfYTWtYTcxTYMaMBUabKtOjx1IYQhQ2
         vFapkMJMs8IDNNKPPjRRxCTLeGOtUIgqfUp/Hb0oiflnIHk0JFdktOEv7RV1RX4YKTaN
         2XxmoQZgQJ9TFH7tGnV57hy4jA+oLabZBg7LHi8yDUVI491K0JRzVi0k22LwaoscWYes
         NRklW9rGbsst3LHVA+LwE5F1grz39bMLotcq63NY6yqh6OID3SeLgoZESp2K1evXado/
         e8AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTyD9BS7e+hh5gXMrscYKEubU9blxcFV/HuiBLCv/Y/q8OxGlFc8MB3PFiMyBNMdWKSiRwr9dTtsZRAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qV7IxudWlVPzk/ELeAQRNtclcN2J9peKFffxSgIFTVktjwUJ
	xpUevSR8yV/ewz9JeXtxTC04wcQqrnnpryZ4QbwE/tve2bS827XTtZI2u2WCfaLLT6jF8521KXf
	jzohqkDxwpFmv72U5Uodu8BbTwLahldpMhpktkN8DxQAXpUDNWEeiaXgi63o9LfmxhA==
X-Gm-Gg: AY/fxX4nWEmOXLuFSGLy7b1AmpxaA/9RxI3lMOozsHo4Rdu2hOBR/6QoX1HUS0G61JM
	AEkEAe/klW/BlpfSBpg6VjPWUDkSW6h1P+wXD2DlmzrC3dqcGucN3Bcmnz8pT5DjwpX6eT3YRiF
	Hya7Mjo4j0P3LCsB5ZJhgncDf7spwJuX7mxW3GSLKSXlTZnriiEeTijdCeK8n6k4bnAsPXPgPm9
	KUxSri7O1tQQIx8gsCj+SwfY6rZES5j0Ry0Yx14B2q4aZNXPc1Aybvh6jDH45+re93IiU8x4NCQ
	lZDQIu8jtw9Y1EFh/XVlMzM408sznl25QhZtP48NBUwLD9P4bmq9bynoQ37OFFacJdeFiqgdAG8
	LC4QpL0+cGS0IMtidhcjxHqhpChQ7cesKz4CDqxokNQ==
X-Received: by 2002:a17:903:228b:b0:2a0:f0e2:94b7 with SMTP id d9443c01a7336-2a2f2735298mr294397765ad.30.1767074205632;
        Mon, 29 Dec 2025 21:56:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLFCVKUO/BC1akeZJ9O630BExjlkUKCBZABwyorRPspy4Bx8ohj8gEoXnF/Oji7nTuCtgvWw==
X-Received: by 2002:a17:903:228b:b0:2a0:f0e2:94b7 with SMTP id d9443c01a7336-2a2f2735298mr294397595ad.30.1767074205137;
        Mon, 29 Dec 2025 21:56:45 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d6e4sm288818205ad.75.2025.12.29.21.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 21:56:44 -0800 (PST)
Message-ID: <0758caf0-c23d-8fd8-ab26-2c68e5f78f60@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 11:26:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/6] media: qcom: iris: Add B frames support for
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
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
 <20251219-batch2_iris_encoder_enhancements-v2-3-371f7fe24801@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251219-batch2_iris_encoder_enhancements-v2-3-371f7fe24801@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1MiBTYWx0ZWRfX8l0VmP1GfsCB
 0rbr27IMAC7i3/DhT0MD+P7B+aaoIl6NC+0CWRtR92V/CRNMcqlA+XRpUKNAR/QU8kNdOqvFemT
 4CbaWtBqIUPclT9F9R9dVaIb1XDqPaMWNWvgydMdoZxA9QUzXR+IKjQnHN6NFspXds5IAFzJB1N
 ksWKcE/RqysrgE5ap3JRIzywu6e+X3RYgTEx1U+08dnI72oHEv8ifFuv49UswUl7vnBl8hgk47Q
 m64/XbqQEjDI1zTnSV14tp5sI4xdxmZD1IicLPCB5VspeyIZdio/bJfAnSMAJywV5HJ0r5HQfvJ
 afAjxIK33Vh/kB5RzTx7cw8K3/1/o9g6OMXmZQevQ44WFHXoRjB2LhYlj6Cau6xW9OLwt2DfA47
 dNUTMGKG/E7NsO3b8mtBnKe1pzPcQ8MvJLFq16yfWIj1e/F4aBfgHgb38/VYuKfrD4C3RFxvv16
 laYyVCkPZEnWutnS4Iw==
X-Proofpoint-ORIG-GUID: 5S2HpxwvkhHT5Bxc-R890y5m1jfQjsr3
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6953699e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IzfGebrgPFzWcUWWzKPHyQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jKdzUOJkW_5VvHNVDv8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5S2HpxwvkhHT5Bxc-R890y5m1jfQjsr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300052



On 12/19/2025 1:12 PM, Wangao Wang wrote:
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

<snip>

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index c48dfb6d47734fadd4f2e4123c93560f55355b86..34deb32eb5be0899fee779ff99b3f4b8bd91529f 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -154,6 +154,8 @@ enum platform_inst_fw_cap_type {
>  	LTR_COUNT,
>  	USE_LTR,
>  	MARK_LTR,
> +	B_FRAME,
> +	INTRA_PERIOD,
>  	INST_FW_CAP_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 13cee5f72a443b85136d30b41b589aeb0db8eb9a..78f3a44f4ef037a5291330627b3e94750b624f4d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -279,6 +279,24 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_mark_ltr,
>  	},
> +	{
> +		.cap_id = B_FRAME,
> +		.min = 0,
> +		.max = 3,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = INTRA_PERIOD,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_intra_period,
> +	},
>  };

is this not needed for gen2?

>  
>  static struct platform_inst_caps platform_inst_cap_sm8250 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 99d8e1e59e6bfd5e4ab0fd2b5831f74c54b6e87d..56b6a73bff8ae8e1da06a7b53632712932abe5bb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -667,6 +667,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_use_and_mark_ltr,
>  	},
> +	{
> +		.cap_id = B_FRAME,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_MAX_B_FRAMES,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_u32,
> +	},
>  };
>  


