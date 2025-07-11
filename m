Return-Path: <linux-media+bounces-37480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A163B01BE3
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCAC35A4056
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 12:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6304E2980CD;
	Fri, 11 Jul 2025 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqHus9t1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E5319AD8C
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236724; cv=none; b=izq8Sim+Mpt6iqWi9x8oCzPOKlc4kKqBE11hiQZJxOZ8wwUI5L2zIonbm3aN3CwV77I6OrPC59jfTz0EQpEn9q8UsyFSh3FsdlTOKpRTGagPSToRwU9yj9YFeaFejofNoM2V5Qd025uf7tWZOyDbHkxr/JnRwa5JMHQTWWokSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236724; c=relaxed/simple;
	bh=V1h3cDpy+r/wNnCbLeT1mLASfEa703zOU/9HCncVaTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyEQ97IY6B3OZbbofrOSETzCKCScXld6ivee/6k7YsZZJJevrbYoGxaCEV3DwRwpJYqiiT8dhV2FGMKgoht4pDrw1r8L7ZuVGF67gGNQ445X5TQtnmCKTeEieiFCpLlNKutl2n+938WmGiUHFGO/ftN5uai8aCkgh6FNn9/5NOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqHus9t1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAtG2l012039
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DM9HFrXHjB2Y0nHkZCChoaoVsWbGVK8S31Yx5JDAcL0=; b=OqHus9t1BNoh1JQC
	UykkRkj6P/irulXYfzB0iCA4Pzi3sJWek+yLEVC8G349Xv+1sV8T8vDj5+pD6YZD
	d2hbS3FrkQaHuGHLSA+TSMyh2bKGHNsPz8pDcCkYCTHre0zQfL1EUYMA2LKMsreH
	257BZMmV0kGLsLxusPLTn97e7CCLpscRNchOEEyDhpn0lxtPGvCb1d4p0qI94mKh
	qmNpZsp+0NtpYjqQmIBwcZQGUYg9diGOklK1egCRl3ew2pNAlAEkpVqprAd3+mL1
	IIfYnBlLxXKGUP20EqAZUJ2go8vbdMk2Hcyx9640ptVeU25EjoPiig+nTgkqXPBa
	P9K9eg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9e0gkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:25:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a9a8841a85so5095241cf.3
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 05:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236718; x=1752841518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DM9HFrXHjB2Y0nHkZCChoaoVsWbGVK8S31Yx5JDAcL0=;
        b=wmYh9K5nfPO6rTrwRPIdJVFOFHM1zYftDk8V/Ebv/9Bg+Lqdeg26cETfi/xT2DzxXr
         at2kLi76tP1dym/aIxzDKkO1xFiqV8qF41+EazLzeVgvieNljv8KxhfeMprxA5EIC8vE
         tp0i8fWtlD7rhTtWfTstK5liBBgjtHPUF+yj0V6Dbvak8GXuRkkUvfOv3c62UTGqxczw
         zR+kLoAxcy1dPw4AOsacjGNUbGdZPUq/qVt6Ts6XQm70Hqk26/QGkd1+H81DR9hBKmFt
         Cd60a8e1ZeEle1vOigx6/V3X9gmyYCNQ4L5VROpEEzHvRSNYlrzeNfT30izd5mm91aes
         ULrw==
X-Forwarded-Encrypted: i=1; AJvYcCWsIuVxG75q8QE+VUeVwD0/7sjjMshWV5iw8yXUDGn+05bxt5Pw3wXouyuvVs0z0WaDuACABGHfzI3O9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZtZqqga3RmerSJ6dnjSeFSoxIVSJrV1Wb02jGWaLElscl3aR5
	sDj55aoFLEbwIE3eHSKKWyfPb7nfJXUFDAuX1JEJbXLgFNZ8ZU5PHScgCmKxjQ7MRwrwuBhOdlg
	sMuXAzm7ZafEAgG/EC/jX2l9AdBuxanNlkCqeMuMEMLqmccjnm63ysAuVqdXPC+Xp7Q==
X-Gm-Gg: ASbGncsNTUAUBY+XwgEFcB80byWTs4bfr01LBj2lxSKlKEm+WWMwUj2V9hY2nW5BERi
	tMMqy88aDsWheXLpbqVnHqLIy26P/AK8clrzlHCFiGFyjSPhh7zUE5/fwirJk/UTDjHCGoRz4Fh
	src2keb+dGTjS5Rn7V8oCM+Wso40WwGN479qbKosnCJAe0jlAiME1C09LIZByxyiW9X4U0AHnRB
	aGFM9NUZJX3ppHTjTcK3I5/xHO0fX3jvz3BfrGKukLma4yfBrXH7U1WgCBdA2bNPUGGsi0DDYUy
	HOdBHY2Timvg3q7cotUyx9V2ocf+9OqncFbdYipGnuGW9/k3q0/0kQ0B08LaMgde3uEZU//JIjv
	yLk/M24P2s7cAGXdxfKI5
X-Received: by 2002:a05:622a:1792:b0:472:2122:5a37 with SMTP id d75a77b69052e-4ab3d90198bmr4064311cf.4.1752236717814;
        Fri, 11 Jul 2025 05:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfhvU3rHw/NzO8YHdZ0hdb/sCFcAXessFNNON/0+WsLESI732TDgE+n0h0m2FRFMjpRaLCgA==
X-Received: by 2002:a05:622a:1792:b0:472:2122:5a37 with SMTP id d75a77b69052e-4ab3d90198bmr4064051cf.4.1752236717269;
        Fri, 11 Jul 2025 05:25:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e92176sm287578766b.22.2025.07.11.05.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:25:16 -0700 (PDT)
Message-ID: <214c3d98-d0ee-4806-8c0e-81c1766dd1f0@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:25:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/72] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor
 node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-13-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710174808.5361-13-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QjkuDfeCUfat4BN8tVWdNw0lISM0c0Ob
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=687102b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=iR7-6Y_Ul2svg9zsNUoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: QjkuDfeCUfat4BN8tVWdNw0lISM0c0Ob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4OCBTYWx0ZWRfX+Da7Ez6A5wAs
 psA8/OxFvHKgYT2II5fY9BwcnJJTVFZ+/J2d6/sIpeuKxaKgn4vaLKM6N6SsU43dulGZkjlXrwE
 9X3XC6L/vGkKeasCpcPPIMupAWssljCm8On+/q/jOhGRkZDuOzH0yBO46Sc2qeK3ED51/7zUf+O
 2megWT6jzwPCvx+Rf1vE0REzUYDFAiS1By0AwPMNgr1UtBLoEDVuqnJBx+EaHwPuaqwhoWojaF0
 Wc/X662C5Yz0NVAXKOu29c8vvFyPOEXStx0ceQ0aoRv63/vBzqGsUKgoO68n2hfV2lkOHo3BwV9
 yhYxEjJXqNLgYPf8e3/6CjcE6TNBEDvfB9yh2tZuofiL3Ka73jKKTpLXOP3rD2S8N5UGnlDioux
 TsAj1yCVBGbRsoLHuduR1GwrO/yeuS7c/p21Jn9zp9nE65zS1W+opW6vn/qRR7BsQzAmtyN6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110088

On 7/10/25 7:47 PM, Laurent Pinchart wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. Replace it in
> the device tree.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso      | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> index 51f1a4883ab8..dbe1911d8e47 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> @@ -44,7 +44,8 @@ camera@10 {
>  
>  		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
>  		clock-names = "xvclk";
> -		clock-frequency = <19200000>;
> +		assigned-clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> +		assigned-clock-rates = <19200000>;

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

(although your patches still seem to leave clk_set_rate in
ov8856.c anyway?)

Konrad

