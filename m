Return-Path: <linux-media+bounces-60654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDUqDbJm+2kzawMAu9opvQ
	(envelope-from <linux-media+bounces-60654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:05:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6EA4DDD2A
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C2443054F52
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 16:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B753EF0D1;
	Wed,  6 May 2026 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMjbqf09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzXCLKvv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B3E4963D2
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 16:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083348; cv=none; b=W95f1M2YrNAyB/Hce8JIYY5nHbeAh0rSeLkTLdqmclUg72RxFzT9Ji2sRmf0nUL46+jy4yUMxAw3zURPfzEjZ1JSozbeRGXfoAa4rAct8cr2i/wvDLgsRBoYO054d3tNn48sr2u5hmw1rMSMfpBRIVslV0j9iHYABipd0qB6bW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083348; c=relaxed/simple;
	bh=IOTEW2qQ5N89NXwb1CeAN1Uhwjjf6nKKdaqAgo1Twjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKGcUp1Omas6RCJ7NCskc2HdBk0LxcPotgK6AvgOaPBeF6fPK12yXSpfYsJ3Ef0QW7wAgfJjKMmpuOcnxXKGDzaGDVrAGO21jITTlnxuu9lHbEdR37QSLkNNIOa93k8G51G4VGT5RmfyTQ9tK/pUoyBMehTRDnbUCZEhNvq+Qx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMjbqf09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzXCLKvv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6469xumv1985555
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 16:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TGZ1h1/OF53J3gFzAIo0xWBAkfLlfizlmwek520L4Rk=; b=NMjbqf09KRZ3cMc5
	/KHw2mkkI9Ijj7nU+6NObGB8gY8snyi0I3TFsEk36Zv7Y07/4oUJ3y3OJpeX1lE2
	ygAKbC6Zwh2UjQ6K3s8lsKc2cFPyUH0xYmQkAZpx3/Syc7Bv5uOvjTks/wlcZ+iH
	/Fgl5pgY1fMor5jsGIzCAbu9CtrJrdM21LGgafmvJRQf1UbmpSZZup8Qcc1TxLzM
	K4sv9ZV5lrpwuzaEOAV/Qa1r9R8YNacZ0PUs1qiELmDHitpQ3ekOdFcjo2TF/ARr
	J0U9z0DC8eS4oRrtwDaOucDXFgYyu8QTVwvHeTT4AjYFnEeNUEoI41ntb7WzPk7y
	A5g0Gg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03gp1ahp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 16:02:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2eba42b8dso60667645ad.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 09:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778083338; x=1778688138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TGZ1h1/OF53J3gFzAIo0xWBAkfLlfizlmwek520L4Rk=;
        b=TzXCLKvvwt6v4AiV6Vpyt52x+n1YYUsPWPJM5k+H2yni8hPKFgyKL1B//eQhXHOeYI
         zUzGA4ik4F08Xv/pHAW1kCMzRrFrSwLiw1LosC1HtJS3Dv4nakrmq9UJt+A5UL/eYtS0
         54ceUAGsfYwh9CVGmqBILitRSZeLrOMv5GT3496GGQeXH6Sez1CJ7u4AZ7IqAB3TQcFS
         2bnAWZl7VM9IozU7Q+6MPOdhu2+oVFXqrSm+DUcqeVLd0Kwpmd3dFvUfz94Wdy6HZn/1
         TnB75vMJm9eWuyaPZSqU7qPKLmlGQXQhyXYhWV1wwo/OTqRGL8gi30k2rCIIJ998WPhQ
         TeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778083338; x=1778688138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGZ1h1/OF53J3gFzAIo0xWBAkfLlfizlmwek520L4Rk=;
        b=Od83/lyXpozKzmYxeO++Mr568yjGWVuuMsW95KWIserUEEbkdInJ7rIj3SrKOljSy6
         MRdyyTL4nY73eEKNmcL5hw/oSk70A/rGLiwW4FtXFaaX5L8Uf3RcoEiZgxnCBPMCFHtY
         zepeL/80PM2gudSzf9CzhVhEFJrqiYy50k7SUOiYoslseNGJD0lz10KEnGkj452Nd3+N
         +JmOUfZutxPLp9rIQnJfW4UgonPhVfigCSK6xRcYlpEDSmKIudhZIpw+YeV40pAshzhC
         Fx+4t0IGaHPUw+nrF8m6YrcU97YtTLjruwWM7b1zhk7jorkd5uv2OuSxft+AX1I36Hn3
         MOsg==
X-Gm-Message-State: AOJu0Yy9/TzLlkHR6F2Qr/3eYF4g+ZnIbeTw6mtO81gaQUoGC/jbj9f2
	V8HvVfYFgALpoIUGJgVlIpKT0YH3i+tt60Z+mTaszZMwDVM6h78/7CyGnMJqpdIaTZd96TNGFfA
	+luc209lP7mp/ON50xNyUDTfxQyC3dWBJSh/30t0YQ+jGXH3FD5S3TUuzlKhF2vIRBQ==
X-Gm-Gg: AeBDiesAHtZ5enUitZT3yih684ktFIAStiAdgGi9e013SWUCdSG4zsU4NzEm+LFUZYB
	13mIOSxa0iiOXb1Bx4HLepBcozhb6h61tZpyYpCfDuaQF7X+8rA2aPEnXudH/dH+4vcsnyIdids
	FQMF8fSLiq3FUYG989z3PxV5mi6hwZfB5Hq8w2pGnVDQSmNCZebxIqcHoy3kDfDne9YYg7rxCRc
	FeiCNdZGm18liGc+YnAhnh5zU4vdwjpVAsl84Ue9/iPMjSwVwP3gzu3zswhBdnQGIUG68BUIzNx
	4Er0iO8HqYE0GZ05JCt1ya+TTHHJS+rWz2z+D2KLDvBu8SKUKli1JdaCISxjM/Q/KepooHDAblb
	lGo9XK32w7aflF6U08uMxgXn/wz7KM8dhiENiQBY3uRphjjYJ26oh9L7/oobsmChZ
X-Received: by 2002:a17:902:da87:b0:2b2:ebed:7afc with SMTP id d9443c01a7336-2ba7a33354emr44077515ad.27.1778083337859;
        Wed, 06 May 2026 09:02:17 -0700 (PDT)
X-Received: by 2002:a17:902:da87:b0:2b2:ebed:7afc with SMTP id d9443c01a7336-2ba7a33354emr44076295ad.27.1778083337057;
        Wed, 06 May 2026 09:02:17 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba849032bfsm23120095ad.44.2026.05.06.09.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:02:16 -0700 (PDT)
Message-ID: <2b4ff288-1068-4411-bfbf-d007740710ae@oss.qualcomm.com>
Date: Wed, 6 May 2026 21:32:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: glymur: Add iris video node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-13-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-13-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1OCBTYWx0ZWRfX2LMkZg7ZTeJy
 9xmRMRwP0Y+zIYWmowL3E9Zbp3hGN5DJh82M7837bssZUGxJ80rx9ss7VLhbYM3RJVW/u4By+9y
 /YXZaJ8qHAQ8b96j63AU5YW/0wCbC3rVqMVEID++G7yCtRIPV0OIxABf9cEgKzamvquUb/w0Hca
 XNp4E8oGSpp/YUNwjXV7DH2c+oxDZVcyxsJnaXHfqixoQyP0x4s+6fDtFlkiIfUM90b0F2OrL8O
 VOnyfNZ9BjeIknmzE1d2skBsDnHfcVT5oMk9wxCdZedlhI2DHes1jG4tohUrNsFLVNxrDYfVUoI
 yPQFfYF8eaeyONBjZESKr6eyhVvyOaJO6Jmem6aTtJ00KyGa5hVQT7itzcgv1EZZE0haP0fxfu8
 PPqiz73j8ApuV2VQyfWi0eE+zJqkHsTrwCsZ4iuUTBhGWKokLgbIRtbXoZ+DKPbQQJ1NooGdVjk
 tPImkBdrnqLLGlZT14A==
X-Proofpoint-ORIG-GUID: zfTdf3DNm4wLoQMmnh5VJgk4PWj-8mLi
X-Proofpoint-GUID: zfTdf3DNm4wLoQMmnh5VJgk4PWj-8mLi
X-Authority-Analysis: v=2.4 cv=W8wIkxWk c=1 sm=1 tr=0 ts=69fb660b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=glmcflYCJT591w8RKWQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060158
X-Rspamd-Queue-Id: 9F6EA4DDD2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60654-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aa00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ae00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.47:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]


On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/glymur-crd.dts |   4 ++
>   arch/arm64/boot/dts/qcom/glymur.dtsi    | 118 ++++++++++++++++++++++++++++++++
>   2 files changed, 122 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 35aaf09e4e2b..8d6ea857634b 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
>   	};
>   };
>   
> +&iris {
> +	status = "okay";
> +};
> +

generally board enablement change goes as separate patch, not sure on 
this though.

>   &mdss {
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..c47443174f97 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -13,6 +13,7 @@
>   #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/media/qcom,glymur-iris.h>
>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>   #include <dt-bindings/power/qcom,rpmhpd.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>   			status = "disabled";
>   		};
>   
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,glymur-iris";
> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core",
> +				      "iface1",
> +				      "core_freerun",
> +				      "vcodec0_core_freerun",
> +				      "iface2",
> +				      "vcodec1_core",
> +				      "vcodec1_core_freerun";
> +
> +			dma-coherent;
> +
> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommus = <&apps_smmu 0x1940 0x0>,
> +				 <&apps_smmu 0x1943 0x0>,
> +				 <&apps_smmu 0x1944 0x0>,
> +				 <&apps_smmu 0x19e0 0x0>;
> +
> +			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
> +
> +			memory-region = <&video_mem>;
> +
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&videocc VIDEO_CC_MVS1_GDSC>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx",
> +					     "vcodec1";
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
> +			reset-names = "bus0",
> +				      "bus1",
> +				      "core",
> +				      "vcodec0_core",
> +				      "bus2",
> +				      "vcodec1_core";
> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable on boards where the proper signed firmware
> +			 * is available.
> +			 */
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +
> +				opp-655000000 {
> +					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_turbo_l1>;
> +				};
> +			};
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,glymur-mdss";
>   			reg = <0x0 0x0ae00000 0x0 0x1000>;
> 

otherwise, LGTM

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

