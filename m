Return-Path: <linux-media+bounces-37605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49619B03AE7
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 11:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8294717C6A2
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 09:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A79242D6D;
	Mon, 14 Jul 2025 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyXJPU1S"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978C3241668
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752485755; cv=none; b=f7MFU7zhToO2LCTVYDn2HUWoffVfr2FGBh0YOaS1WJshG3qg7AXdfaUEkvMM2UOXPpUO9Sy7ABBoJDd/k69jFDEQMA2aeKH3H798seRpZRI0f7Ccugv65S3rZ5dniCdgb0wdnskAF+Be7dPu+5zKNyPuhwaqR7xBGGEH80V8cQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752485755; c=relaxed/simple;
	bh=ru+jpxSTrNborX2bFBxdcyMpqdQrMupwkrZFcVDWZfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jN0kaW6iNBs9iktlE8eSbfJh5+ZTZzFN6KCwvBC3aYV4bl9Tv6i/mnG9UwLDE2fkCGm3LD75d1Ug/D+rvvJwamGFT15P2zG0NT2FQb2M2kuT8MweqAFRTbGmTmDBzLVtA6kCYlSf6MO/+q8WhHTma3J/ekNww5aECkEuh7cN3N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyXJPU1S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DLCWWV028873
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 09:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7zrisRWASLUd76UBSE8vFhiT+0G+v9sbTXyn1lJGAw=; b=ZyXJPU1SfZ/vrK2D
	SQlPwcnf+ETIFiVlrlCYhEPEph1lDrp55tR/MWPYKFySMiZglBnknHigufYreI5P
	86j8+DQKlXM+sLnBmjC/tGbvbjOaOw3irtcSodCZVaJLtF97IfBZMaEAcJoSgWzQ
	stVU8Mkxq7jJkoS8KO/ymb1cxJmCw1Z8yTRFgvLuxgbuz9dMpAODie684ugnbcyg
	uSc2f5kqEa33wUcdUBSRurmSjqUTS0uNL67XOFLYpSmA17e0qLtz/zzpWQdEURxs
	0f4tiXhe6EmuZDZV+ZFbaLJ1TQLQETZcEpnjD1WoRdrDPGahdHbFxsGB7Wx7Vrpl
	A7GRxw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmv242-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 09:35:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb030f541bso15565156d6.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 02:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752485751; x=1753090551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7zrisRWASLUd76UBSE8vFhiT+0G+v9sbTXyn1lJGAw=;
        b=NlE6onNwvm94F2sq0GyawLNVmcQAkhx6hHgScggD8CfQhtRC7BaK3Lt4vemLuXnyJd
         ALFciFVKmCpVNn3xrXgf2ui2EYjkrcrLST42xVm5spLQjNl6RCck5v6EFNy7ZREW8oUu
         qCiQs/JyiWqujPhzScQ+Dy4xYrBo9nQV+Ktu42Nhu0E8AxNJuNfn6LBNYTrMRiREmwBR
         6CHY7Ufk3qeUhiEyP0G24UBZJB2VH9OpHavUQ+co2HxPEzlsaxT7MEmi8XSVBaLY/Slo
         WjBDhQbDjGiv4rZGAee16EK+N12yFHcHDHYX2xPTEcVAtAl8Lk9VekQJY+H4RrlLpwfG
         de3A==
X-Forwarded-Encrypted: i=1; AJvYcCUOpcC42W/94cr22IQAQgx3/lwAdaKEee9cBHszXPmjkO67G9Setni42ove7OfI8d8ueBdeQSUYI9K97Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlI24UI/xHED0iEaQkTx+PBsvA0RMEkkrYLWwsda0m8qLZ8Ncw
	2cx3F4j0rxloUKg0T6MylJIGLQ3PvtGy5twrxk/Zt0wbwNxWrNSYedJ9joshVHIP3WwrqBuBuUp
	J5iTO48CBUPRQeOS7ERkgJxzYZvQ1+HbyTAVVOOvyQA5eMIJt/EcenZ5mb4mlPgZbNQ==
X-Gm-Gg: ASbGncu1XW69NDpQGTSGXbGuOKhKJ6Rxl+BMp7LiOWqQnSW7Q8BWnsvmfV8oj95oVTi
	ZJidEG82+y8adUYJ5KcH6Veysgtz7x0tm4XuDeb6on8D7N3xXqUYNzUF+O8Xz9exmLCJpfpx+6N
	kvuOzKXPOpYIJfsuJWplJsjntQyGL6esmwEsnABShA2AFipX0WXRo0xhUHjjeetu8V4fMzB5jss
	trp2LTpulF/0P7WLIGwT0KH9iRX3mpBNm6ZAP+lvLM7iFJhO+sZ2loFqregfhM/cquHESm5Z0gZ
	Wady/b5BXI8balpW6RuNC7DJ2GXX9CwgacvT+Eq3spah3TJUrcztP+YuRhnKfGphN2k3b5D5yj/
	LTs7jj1/GuuUEsd1ETGL0
X-Received: by 2002:a05:620a:29c7:b0:7d3:c688:a590 with SMTP id af79cd13be357-7dde9f3ffdbmr577279685a.4.1752485751120;
        Mon, 14 Jul 2025 02:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPBgHK2WKHaRZG5vMxzXtbPdkk1Lmydmr3moeXavVZ20BhmDNvzkpBN20H9euW8Kvu2AQovg==
X-Received: by 2002:a05:620a:29c7:b0:7d3:c688:a590 with SMTP id af79cd13be357-7dde9f3ffdbmr577277485a.4.1752485750600;
        Mon, 14 Jul 2025 02:35:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90afesm796156466b.32.2025.07.14.02.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 02:35:50 -0700 (PDT)
Message-ID: <7e65f9be-275b-4760-82d7-679ba3d7ee83@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 11:35:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] media: qcom: camss: enable csid 690 for qcs8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711131134.215382-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MPO1sx1Vt_oWg8-gCerOU-0rC8sGY64e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1NiBTYWx0ZWRfX47al1+7TaDnt
 MiKeXe89qGe4UkKmZGxHQeS6A+6/9am03m5WR8d2QjN9d2RV1xWYqXcb5/GwRiMNfLy2oEFhAKT
 kjtnbKXG2wtucQoYGgFvGYqh6nOKpZUgURPBBWqsPLFRrNlaMD3rqUJjbdmAmNve0cebaSqbrfU
 izz+EpJyyDFdeqqhd7BYYebDRCGP5JoMqjmLEh45NyUJSYDJnFThN5/WMQ82uxTkmSX5HPjHOtD
 uMhCFCCaaguDP4sXesdsh6TX6LA1/Pikyct62Yiu6Htw+8+tPU798W8HTJ9dOjLfki4yeTX97FF
 fuXCw9wU2S4uoTVQSjR7f96dPfaYNsiDsEr0mGfck9EjFGYheZtDVpG76ZwqKAwmzRW1cVydnj8
 JNX4K5SpROTNFsLiAS15aOOwTMjUwTFXvoseJEQeyq/6fJsJynQvWlnDQsjv6Y9DmsCbmLgH
X-Proofpoint-ORIG-GUID: MPO1sx1Vt_oWg8-gCerOU-0rC8sGY64e
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=6874cf78 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=_OLkaYxBag4VyamGeQYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140056

On 7/11/25 3:11 PM, Vikram Sharma wrote:
> The CSID in qcs8300 is version 690, it is same as csid used in
> sa8775p. csid gen3 have support for csid 690.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../platform/qcom/camss/camss-csid-gen3.c     |   5 +-
>  drivers/media/platform/qcom/camss/camss.c     | 136 ++++++++++++++++++
>  2 files changed, 139 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index f62084fb8287..581399b6a767 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -47,8 +47,9 @@
>  #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
>  #define CSID_CSI2_RX_IRQ_SET		0xA8
>  
> -#define IS_CSID_690(csid)	(csid->camss->res->version ==\
> -					CAMSS_8775P ? true : false)
> +#define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) ||\
> +				(csid->camss->res->version == CAMSS_8300) ?\
> +				true : false)

== tends to return either true or false without the use of the
ternary operator too

>  #define CSID_BUF_DONE_IRQ_STATUS	0x8C
>  #define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
>  						1 : (IS_CSID_690(csid) ?\
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 5211367b535d..b0fd5fd307a1 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2269,6 +2269,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>  	}
>  };
>  
> +static const struct resources_wrapper csid_wrapper_res_qcs8300 = {
> +	.reg = "csid_wrapper",
> +};
> +
>  static const struct resources_wrapper csid_wrapper_res_sa8775p = {
>  	.reg = "csid_wrapper",
>  };

There is no reason to duplicate this, simply point to the existing
variable

> @@ -2487,6 +2491,138 @@ static const struct resources_icc icc_res_sm8550[] = {
>  	},
>  };
>  
> +static const struct camss_subdev_resources csid_res_8300[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}

Please add a space before } across the board

Konrad

