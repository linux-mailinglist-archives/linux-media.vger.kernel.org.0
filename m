Return-Path: <linux-media+bounces-61007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDjCGt1p/2nQ6AAAu9opvQ
	(envelope-from <linux-media+bounces-61007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 19:07:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EFA500A41
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 19:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0747930125F5
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 17:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450753BC692;
	Sat,  9 May 2026 17:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSvGJXcZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTGxJVFQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76395299937
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 17:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778346452; cv=none; b=p/hHrlsCMzirHTgD6Fq8dxZElP96DWLbra17RDL0hPUFpCVZXlMQVfSVhrVGS9WFOGc7rxj2vkZ5U0WorNIavmkDgeFGKm63sJjP8o2tQYcOXNaFwjskguJ+vCetXTpfwiy5JV3PkbLVWczTpkmZPHwax3wlyYOrAX5KvAoL+hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778346452; c=relaxed/simple;
	bh=QhhESLt4sU4La0hv5PEaGGtWswEN/2rxsz2V4OX7lNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/9CnNymcYLx7OVVgzUq03G9M4ZNxfJx7bZF23D4FuGxn1XLtRdqQqscfvwoiKtdtePwACjsgqspUAyeRs7bERbDMhlwPzN8TBnHICZMMJ7JVmayIK5aimuTzuHwO3EgUCkyO3J9w/ocmT5jCVlnaC2FvGTEW7IrTqkdgC655dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSvGJXcZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTGxJVFQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6494tmRh2730632
	for <linux-media@vger.kernel.org>; Sat, 9 May 2026 17:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NK26YkhXhOkB1zXXrflzYxxjD7OJUQPCc6PGnNHByaw=; b=PSvGJXcZAgrUyxaM
	U6HDSgO1E2DllbScsXkg2vFzairaUrRNUwT/eHB8sNtYb9Mi7QIPIy9oRuPp6vTX
	qvqZRxKGECeOJAlfKPy/tChHjGd3dsC3WQJRMuKXFTcs30wkjWhlQQS4IXA5w7/p
	HBCSU6AEzIdjXCyIKsoOYmhpMEhezBnUYxN6RrWPmSg19rXe30Gas6nCH1SOJnPM
	AEA+TWemEm0jcVf5UooqQbDMp/fWsupOsSgjZzz+wuPDfLlBOu77UV2Bzx9WcaXz
	y/werDFzZw+zG/79CrF4/vSovF3+4jEul/RGYwcb/AftErqGrCTWy32yDRypTCXd
	xaWKfw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1tmd1rj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 09 May 2026 17:07:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f9429f49cso3604741b3a.3
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778346450; x=1778951250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NK26YkhXhOkB1zXXrflzYxxjD7OJUQPCc6PGnNHByaw=;
        b=dTGxJVFQiTaBKsL+BfuBkxMentqIeLAPLjwIvrxdIfEJ9osiJ5jbNsa0+MlqaDFS5Z
         9rUeAJqluZ/Z3peGiiCtrh743MATwtR1yLcYfwNg+97+Mb/79a13w1muoxbupSeN4+B9
         wL9QDhuqyEcEKf4U4pIIsv8G3NTgfjWFsHr+8Por0dGTwrztv+1nQc7tDlQS0nRL3rVP
         oVpwLBep3K/DGlq/14GbB2NrAQDTZQGS+YN3ZV32OFY0jD/Ut0lBAVMNa9lU6H/BYzdm
         oiCtUkNXPs5P0kjjLDGklyVNHIAy1zpkplRwS5rr6zw6ovgJoQnP8GeCKpqFv9YtTpkd
         HCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778346450; x=1778951250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK26YkhXhOkB1zXXrflzYxxjD7OJUQPCc6PGnNHByaw=;
        b=hN7HezJemxybknGjaVaz7Nw5boDGlXSKvZ/g2QyQsjgro6mFtv+J8ntNaulPZuHlgX
         DmWXwAlyeYUh+zALBrkhXjfjsC12qk+Yjt/nnO/j5PTpjX3wPL2cO6MWMMHhT5d2++XW
         j12jozpsQAMK/IlLzw62Tj6AF0yH+odVUkzmp4ZbK1ofKbr/1TEZbCYgLTcj3SurSFgp
         XIrU20WXwoM7h3RYajWdoTtkGSkDcKEboOe/Nf4nmromqawNwoBJRSzpZ8pw5Al4c/Ds
         Vvafnhs9JNSf7EblDrJ9DScwqKSbyqmH1ODkcLnwwVuXz29n4qt1Ts+r2AI9x8IzgeII
         kWLA==
X-Forwarded-Encrypted: i=1; AFNElJ+jHPC/vE6Mw2LBuwZdQ6ZphDVpkG80jL3hOfwwUETEfwH7Rdmja2Uyachs5ZaLOTymcexd7mjbPogC9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk9DFSD1Oz9ExXpFfTv0jntFkhBiuujuZ2oRyk4xXz7BsqJKUG
	nrvem6cRJkKbgpoifQMfNKgp2oM+k4CqLl1IkPcl2ZbS/+mmeyco6pv8YfJTFuQcKUKi1I62BFA
	PTO7zGjKiowrXVOTXMUHDE5j4FgIRVCgsqb+BHnXmtqGTsgGwGbu+E2HMa3k1cdCE7w==
X-Gm-Gg: Acq92OFLf+hmwjlZhcPOL5082ocaHZ4K95ZL9FkcGa3UsJJgnHkzxJLsyHyvYYfGhm4
	szaqS/CB80wO6QJd2at6WgloRvpQ8x33gOkRkvz9+xBSByf+bT2rs2k7yheix7/LuqvVZU/lydV
	v1NLxY7Ihk8lAqZQvgJr9LIHaRza/rJBoqh3enjMdAayzkrRleK2mdju2rxm4joNa/RRzHaDsNu
	sTUvBPPb4fbkVid9+QlWWYX6xFZGcaKPxpeylKgWh9eYas2jS9n1eYmCnV+z8KB3X4KyaIVHJ5J
	BxnpsZjuIzdVOaHHgHx5/16ApLR+LXtetRZt5R5Xb3FDCyqXaCsDZ7WShIVQMlQS6bjQZw0ml+B
	yYlQwJG+T/zOYD1YpBYO98F/2f6VSh6ZHB6Gblm0BzNTIwxzGHgIoOlxNYEKeMw==
X-Received: by 2002:a05:6a00:1303:b0:81f:3f03:6846 with SMTP id d2e1a72fcca58-83e3bf8eaf4mr2810770b3a.47.1778346450103;
        Sat, 09 May 2026 10:07:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1303:b0:81f:3f03:6846 with SMTP id d2e1a72fcca58-83e3bf8eaf4mr2810726b3a.47.1778346449532;
        Sat, 09 May 2026 10:07:29 -0700 (PDT)
Received: from [192.168.0.9] ([49.205.255.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbee14sm20911031b3a.48.2026.05.09.10.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 10:07:29 -0700 (PDT)
Message-ID: <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
Date: Sat, 9 May 2026 22:37:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s6KXLPU0Q2xJeWzwrPdSLjgPiJwKicMS
X-Proofpoint-ORIG-GUID: s6KXLPU0Q2xJeWzwrPdSLjgPiJwKicMS
X-Authority-Analysis: v=2.4 cv=aZlRWxot c=1 sm=1 tr=0 ts=69ff69d2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=SpcZ+gRb+6o1zy8jT5J+bQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2nvh9x2cStbi1KpodkAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE4NiBTYWx0ZWRfX2eJPDGTGaxrD
 S/Pci+Hv0Np6XvzNpN9CLlyLNdO5k1er0DWBkMLIB5oSBBflaakk3SlEiYq0XIIGoitYlhWxJIu
 /0XSqKD0EyKjgAQfDLtMvVVp6rEOF8BTAWIW7cFiSfNoNl5Mfq/5Sfdq8YDye5nOutZkboS9Bzc
 WjWSIfBspG3ATpNYl/CY27zC8Cb24RpceEgh3LV8fM+Fd9bQUccphxOt9siIBcIWoRxkNpqSonr
 YRppOuVmPk3SdMJ54hHsCYQQgQuxS28t2BxRkikdt/hCC1YFJq1YT0nbK4mqp96xJ6taxVlJhu0
 MC0DHr24OdapgyYJLK8FzUsGQEuMv5gtWMeaqn4G97hgd1dzzjIM2L081xizEY7sdMosjXedC0s
 3xQRFy10w51Ueo54rvtdHykscajn/pXUm03BHct2WoNeC+0ImsblUGFxecjNHLpeAp3/QdrfuNn
 uTFg/WSysSIVzB/mkgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090186
X-Rspamd-Queue-Id: C3EFA500A41
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61007-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
>> The current clock and power domain enum names are too generic. Rename
>> them with a vcodec prefix to make the names more meaningful and to easily
>> accommodate vcodec1 enums for the secondary core for glymur platform.
>>
>> No functional changes intended.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
>>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
>>  .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
>>  .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
>>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
>>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
>>  8 files changed, 67 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 55ff6137d9a9..30e9d4d288c6 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
>>  extern const struct iris_platform_data sm8750_data;
>>  
>>  enum platform_clk_type {
>> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>> +	IRIS_AXI_VCODEC_CLK,
>>  	IRIS_CTRL_CLK,
>>  	IRIS_AHB_CLK,
>> -	IRIS_HW_CLK,
>> -	IRIS_HW_AHB_CLK,
>> -	IRIS_AXI1_CLK,
>> +	IRIS_VCODEC_CLK,
>> +	IRIS_VCODEC_AHB_CLK,
>> +	IRIS_AXI_CTRL_CLK,
> Why AXI_CTRL is better than AXI1?

Glymur has 3 AXI clocks: axi_vcodec0, axi_ctrl, and axi_vcodec1. Using
positional names like AXI0/AXI1/AXI2 doesn't convey their purpose, whereas
naming them as AXI_VCODEC_CLK, AXI_CTRL_CLK makes the intent clearer,
especially when platforms differ in the number of AXI clocks they expose.

>
>>  	IRIS_CTRL_FREERUN_CLK,
>> -	IRIS_HW_FREERUN_CLK,
>> +	IRIS_VCODEC_FREERUN_CLK,
> Can we at least group them too?
>
>>  	IRIS_BSE_HW_CLK,
> Is BSE a core or a codec clock?
>
>>  	IRIS_VPP0_HW_CLK,
>>  	IRIS_VPP1_HW_CLK,
>> @@ -206,7 +206,7 @@ struct icc_vote_data {
>>  
>>  enum platform_pm_domain_type {
>>  	IRIS_CTRL_POWER_DOMAIN,
>> -	IRIS_HW_POWER_DOMAIN,
>> +	IRIS_VCODEC_POWER_DOMAIN,
>>  	IRIS_VPP0_HW_POWER_DOMAIN,
>>  	IRIS_VPP1_HW_POWER_DOMAIN,
>>  	IRIS_APV_HW_POWER_DOMAIN,

