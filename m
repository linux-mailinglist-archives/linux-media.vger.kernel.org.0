Return-Path: <linux-media+bounces-61908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOtlI9bFCmqa7wQAu9opvQ
	(envelope-from <linux-media+bounces-61908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:55:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E24AE5682F1
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61DC0300DEE7
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 07:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D163E1228;
	Mon, 18 May 2026 07:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbgbxFSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECODCa32"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2653E0733
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090827; cv=none; b=EdJBl3IsaYG+ySUqa7P7IxGbhiPJjolMNwKXgzy0KzEj27Dmo175ZW0cqkVDCvAMV5eRUPpV4r9lPgaFq3YXroGrLapIALBfY+CEz5OWq/WptYWK92Z+R1cCvvNerGz+c/xzTbk1VyNEP4WntwYHY2C2EhzHm5wcAFSXLaDSdSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090827; c=relaxed/simple;
	bh=B9gyGzCV1B54Pe8zE/IjJGy0FqlQ/bm+Wt6xaBcByfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbR6qZfCX89Oqa4hUj2LDaUwLhhvwALhjtCW7VhfpXPgpD6paZnqpepVpdD++r26CP301HVC8LEOQMH0B17jM2ln1r3YmcmGHUvODhYTZ7EFaZJG1U4ivq2eAlCweCIhpSZ/W496cQzfb1qpOrMGIzXxxbLeu4d0zl+2TV3577g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbgbxFSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECODCa32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I2o6dm2661891
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 07:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXxtdNBAthLA/h80lp+57IJHfTZAirh3+QYdTFgQFE4=; b=mbgbxFSRDwBQdxNy
	0+oxP5n4iF+DtH42d/MWqM7JoEXQSrCfwGQ/3s2THAU6/35ess9Ud4v6BHe1lOYO
	g5aiJasDhXLphcMoNxd5QHA9adm+EHEed8lIGBPDdl7K4BqYseVtlMV0oQlv/Cru
	LTYIOd7/8fvros62aRVAstKOzF21B1oLDF6d+k9SAcnZ1HEtDZAvVdKVr7BJJymp
	IWiqz+BPcAJTDOapXhY3G6BIPc41Ub3Y1ns0jrQOEmB43Hi9PNLSW6vvxklKRNC0
	EQUll9rqsS/qT/n7knGd4JDTcqpwQlLulnlWeCUtIQbu4UDMSq9GblUxE7swk5ZI
	VONyDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qdbqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 07:53:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f1b94ac9dso10545671cf.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779090820; x=1779695620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dXxtdNBAthLA/h80lp+57IJHfTZAirh3+QYdTFgQFE4=;
        b=ECODCa32MXLcT0QSscfT7pRQ0vvaRwa6g+6IsLovQVaUX5qWEudNQqtCy3pHzkcGUO
         s8iWXV1AnfYXJ2d+Xaf/VjPmLJjyyzwm2Alkhr6bl1FSA0ZmIj2X2Mhh4ohEzJmtmaOV
         OQyzHodlWO2vYjuZ3fY0ywuenAW1XQpqF2HVvRKHDPI+ahBf+WSO0mH5ool30yaWlfO2
         UjHfgl2SsAGdCd0Oqa5dViwcYy9AAJ8ZvIonGLbdh4/9sP1tgm3XlptsfhbA4VwUcd+c
         UW6+mw347uo9Dtgz2MtQdwDRx9LXmYCSyuJGCBuzEM+a0YIAYFaWsfW5tCd23xxN0LLi
         YxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090820; x=1779695620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXxtdNBAthLA/h80lp+57IJHfTZAirh3+QYdTFgQFE4=;
        b=WCIYQVuPVTTv5D2b8OyI4UNP1F1sOqu6gF+76h5bL+HUC9YNjzubsRu/7Q5bWoJOoG
         vAxEhKA8EBjmuKeX07GBurt2iFSPBJuIH+iW7KLzxu+BJ+g+igOaf+pfZ6RdqEZDw0Xd
         6FQfxwnXXwmcsb6r0aP42ec1ygFqsRnRcjRPWPCjoh9x7OlSHeES/Wo94U5TWYrtYab1
         bUwMxnG3FQnBQJKLFhCyk4+dlOhpcxxl2AZwUDGZvVyj76Qm7B926bzjAVs9QQJR6cZt
         ckxdt8+k7ortX6pNrKAJfnKtPlirf1sMzHXAwqv8HCcWVSFYMNtyEn1bgzx5b6tse1NJ
         gEHw==
X-Gm-Message-State: AOJu0YwCIi71IZPuVWbnrSNGoIhMbeoQ+7/dmK1DH9LY/gNj2f1IQATv
	KvRlWBpGCEmofBr0eMNIcSFpfuoBPBFxVq8ecyR9tw8WWWCrUFjiwh4pAEseXtkIO7Z4evrWn6e
	LoztRSDUGl1Hjszl0f29CWlZayYWbBJrmt6y/rhpIZ0v8yutczT4B3lbDQmf3zw0NhA==
X-Gm-Gg: Acq92OHg782Ww78qQY+UPbdR6V6dGoTYBE11VCFfcFjaxs2dbAC29yoCsp6Pxair2PQ
	/qoqq6WsvU2XbNzWMsXBQMqB9ZILQGylSkZeXSCTfyx+Ws49sVc5ZaSlP9BmKfQJzhcXI/3moUV
	lOKEjEvQUk902C6TSZHrfDIU4OH5/e3paM0Dj8qYVLro1s70wccMfADEB9s1YFe59liT2IwGJWW
	90tCWrMZYb+bDgnKdTddz4aNLeCg+E0ffPU+7GHkCplDdrFkMWhlHcM+njxLLFIprEKlHwm3qb5
	YLEEX2tMlMq++GRUrple79ZBAotd1ESudiFecRB1lMpStW0hy78+CwxmcY0LvadXlmoYiZISl9g
	d2ukjYghb7cgbunVfGJtHlhn+Tu6wa1xfgQc15fowyAWBo4pUlxWAH9WTaVCYWLNW2oQlDHd0fD
	0H2Cl6QrERaVQIOg==
X-Received: by 2002:a05:622a:4d0c:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51659fadfe7mr113897961cf.2.1779090820558;
        Mon, 18 May 2026 00:53:40 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0c:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51659fadfe7mr113897711cf.2.1779090819967;
        Mon, 18 May 2026 00:53:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831187d5f0sm4789600a12.28.2026.05.18.00.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:53:38 -0700 (PDT)
Message-ID: <e35598ad-85f0-4f00-a2af-b1dc92210040@oss.qualcomm.com>
Date: Mon, 18 May 2026 09:53:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: qcom: dts: qcm6490: Add JPEG encoder DT
 properties
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
 <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cdoi8sFevCFnqqx3C9fLEUy9JKFEte5M
X-Proofpoint-GUID: cdoi8sFevCFnqqx3C9fLEUy9JKFEte5M
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0ac585 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xYWKWClV66zwq8RDQgIA:9 a=S4w2FMICIi4s7N89:21
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3NCBTYWx0ZWRfX3dXOC1cPuKtP
 XPEYgRbVCIzs3hcqg3Gjv4l+GgE9m0xKU9zZahYn8ZEN9wfjvN6mtIbfVHPEW/qxNZkc70IppYG
 Z9z46RDW8dScCP2cunZj5r5mnzia8zMPqoT6ZhDT+I+ndhqw0OJBAtnVDhkAIrwibMW3A3wPwkN
 NqAETTplIGXR4agks427rSoDokIBtoaYJZkoL6HsUXCJtGKZDSPAs/jgTsOQVPUtVaNtBjzdXq7
 16xR3PRRG2miLoWOO9tqna27JbQae7t9hR4AeTJ5sltH4SlQUzi99vMctgVfU01N4xqKG5fEI2H
 zTODHXyXNWvNlQfqeFCsgNeKTlZMBl3y591boZ+Pgn1+K7tvA66CcVqy+QGjE/kfkEgLFM9xFMB
 5BAl/O5Ky5NmTk1IHmf4VadHjIezGlZDDSHSuK6Zv3tXa910XeC9v6VUfD6ux/aA/Vn5ws+YVod
 /nLn4gQG8jnXI67gkyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180074
X-Rspamd-Queue-Id: E24AE5682F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-61908-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.4:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 1:47 PM, Atanas Filipov wrote:
> Add the required JPEG encoder definitions to the device tree.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..dbfc6cc051f3 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5198,6 +5198,58 @@ port@4 {
>  			};
>  		};
>  
> +		qcom_jpeg_enc: qcom,jpegenc@ac4e000 {
> +				cell-index = <0>;

Will there ever be more than one instance of it? cell-index is
generally discouraged

[...]

> +				iommus =
> +						<&apps_smmu 0x20C0 0x20>,
> +						<&apps_smmu 0x20E0 0x20>;

Please use lowercase hex

> +
> +				interconnects =
> +						<&gem_noc MASTER_APPSS_PROC 0
> +						&cnoc2 SLAVE_CAMERA_CFG 0>,
> +						<&mmss_noc MASTER_CAMNOC_HF 0
> +						&mc_virt SLAVE_EBI1 0>,
> +						<&mmss_noc MASTER_CAMNOC_SF 0
> +						&mc_virt SLAVE_EBI1 0>,
> +						<&mmss_noc MASTER_CAMNOC_ICP 0
> +						&mc_virt SLAVE_EBI1 0>;

Instead of zeros, use defines from

include/dt-bindings/interconnect/qcom,icc.h

Konrad

