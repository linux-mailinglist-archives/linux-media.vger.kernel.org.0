Return-Path: <linux-media+bounces-61865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLZAJRIFCmqNwAQAu9opvQ
	(envelope-from <linux-media+bounces-61865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 20:12:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B543562ECF
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 20:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E6AC3018593
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 18:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75913CC7F8;
	Sun, 17 May 2026 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVcA2+Ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImyCPieG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3E63254A8
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 18:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041527; cv=none; b=qEIQ73ldiL7U6KSWdOJCEhk0jODvhCOwrY1ORaIyoq55e1CNRm2SOJJsJexopOth8Tbs/s+5BqB5bUMSH5VP6fim8+14BX4LzYQExlajDud+Oya2qY7MLMtkWnTHApGAQ/V8FVKQD/Cwx5O4k+/T5aEPYVEW1cDo7a5v+0k3ec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041527; c=relaxed/simple;
	bh=xGnD7yBHQ+nLtVK6MSzRD0aOKM1eCs1UBQP5IPYsJcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dk0X86R8AAlPKWo/MQ1FrsRSkSyM4wAG+fryKil5IRd2Mz5U2MYzTnv3GXfy+6vfv71yFJA5ahUKgOCc/AeEFSGzAJFrdQxJEchaGQ52NsspdQwej5kvQRmwMtD7SRaPnbfGe6sfh83KsRpb8mQFDPo1aPAp7JmnU2MpzK4MiDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVcA2+Ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImyCPieG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4175m3572711
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 18:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lF3/2RUQuRYMFEAVIwRWtW73
	IO4hVQVV7I19wPH93XE=; b=GVcA2+Ub5pG5pXpJrE8DbKK6ExSfW7+aZ+zIInGk
	ow6t3kNJ+7lu2BA542LYfO0ixTjYbaZG8ExG7fS8jeZPBTtlLxHAinETuh9WIwCE
	Kux6xv9FjTGjm3OR3IKmqeG7saaofT0rLw0ORGaOzcIhtF1LXDxU2Sn2BND4R132
	tGy72AAitoVJWOlNsRlLqqQ0Lw56G0hEQW+N7vgeU6kOyAWJqDGlZuKqTM+F2jYJ
	slOPpqpoRjBaPXaYB8cwxgaq76FIkENRZNQZfXSGu/ejUMDBdK3tsrhlxTrg4oal
	/FJNAgZdQHFG/r6RmtxURkThGD5iViWoNKVlgrns5McnMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h01kbrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 18:12:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faf575af4so47636391cf.0
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 11:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779041523; x=1779646323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lF3/2RUQuRYMFEAVIwRWtW73IO4hVQVV7I19wPH93XE=;
        b=ImyCPieGFRNdylhhnLcXWiDGMiNPamob7x8K4+Rbtz8RaswxzWbgOyHmF0OahHKXIX
         3isw1EmgOmDjlL5BugVK3KXs6+fg9gB3iwNL0GmzeOuvrlIXl7dQqMf5sLuej13wM33+
         cJ7WiOVFWUbNlDjzd9O4wuRUXq6kPML1P4c0iFVap+zOIzfJ2Vx1YTw40RuNeAYRq8ft
         X41VJ11+8mSlfy4VEy8r9mmTn1D+zDg2QzwTL+gTZXYbjPiuggy2JmiCPi3T7l7+9u6/
         d/5OsdBu6vL/mTz2fPMxsqG8xZiPad2MQIor70+rQtLd6vqwXmauMSOZ04nNTsoydHtJ
         6TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041523; x=1779646323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lF3/2RUQuRYMFEAVIwRWtW73IO4hVQVV7I19wPH93XE=;
        b=BrIrRnp4xLUMxOnbxJIOz5oIsCG0oOQjuDjrjDEpHOFWb5Rlq2mWvChPC4WBMqxeIh
         G85LGp0I+bcOWXVa6H9l8e9DNijCSFYQFpi00xkXDL2Nst6gEa99CaqqpRbbU4glcrFf
         f4lfixy6vrf6zzzmRvSCmUWFOr5barveQ6NIHg/4GEWto/joETnQAfmxuErhPL7MYtGg
         1HyRJBDgsUgUTeNC1Rc9gRv5RkKqFEOzAJKbK79t4E9MUoCrMTVS/vodSw1vlvbOHQkw
         8PlphgSqFap4/wkZ31SoTqOTivuhF6nDJ8ctBjEaXM2Wx6vkN5xB9A/Vcm8T9af2Z5fL
         tQJg==
X-Forwarded-Encrypted: i=1; AFNElJ9miVV63hBleMWFuku7o2EilkInD8NgHj6NYdEn2Xr3UTGOuCm/Rf69y0mP9+kKJHVcbnFe9WQtI7wzsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZhRvfeaWJozkhMD0kasuqc8udyJVVOHIOspg9gHPnu9rc0ZuE
	TI49D3kTmz5/il4cxGe8Y0T7Ua4j0A+tp6n0kAx+5WhHoQb+P37ht6ZQ8BhcXpoGneUq2k6tOvi
	qwcegeMQJS4gExFZLhg0CIqHvo8PXA/emSPN8qlMy1oKSNmutHT2nVjSnEOHuV5aB8w==
X-Gm-Gg: Acq92OGTsZWcmOKHvayj0EiukpY1sddWlz0b58Ns8gUsMfTMLmXyFErMNFoTh5Gtc/8
	+raBuleEnzGUWv1PHJgtuhen046L+p3C2F/lUMEmmj2I3YjI9qBYnx8Mr5Lrj2+gt5/0q7K/cAa
	S5cQpDGybKs3RwacnAnlaOTf2TaLPQ47qJrM851A9IuqSok2C7amnUO0beE4HS6JYrU5KsPGIwk
	aEn53ywAB3bVhFXBeYem1U3sdaI858T3JAw4QAF2HIdW0RgkTltDYKWqwB0bxDpDyVPh3YZxfBI
	GPf9st/yNqtEZe23gH0n2CKDcfIgEnccGbqSx1k6AzPhbhPTJU1t3lguxwMet1wG9ntGba/oAD0
	wqTy/J0nbTqmt8RRBXB3r8c87KR7k179gscajF+VADtSD5ZHAVw4Kg/Br1E7cxi1vpCrwRqM9g8
	tsMmfD4OAXN/Dm6KkwsF2tDfZQIgG9gpxgsjQ=
X-Received: by 2002:a05:622a:8cf:b0:50f:be4f:465e with SMTP id d75a77b69052e-5165a25ce43mr184111891cf.53.1779041523231;
        Sun, 17 May 2026 11:12:03 -0700 (PDT)
X-Received: by 2002:a05:622a:8cf:b0:50f:be4f:465e with SMTP id d75a77b69052e-5165a25ce43mr184111521cf.53.1779041522805;
        Sun, 17 May 2026 11:12:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b6cb8sm6721051fa.37.2026.05.17.11.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:12:00 -0700 (PDT)
Date: Sun, 17 May 2026 21:11:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 13/14] arm64: dts: qcom: glymur: Add iris video node
Message-ID: <fc2wiqf6vxob2lzp4fypekcdeuf7mcmn7znszzm5drmlkrdndh@ph5mgjaezdzo>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-13-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-13-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kmdN42QQeozOUMxAsDWyfamBklxMDZVp
X-Authority-Analysis: v=2.4 cv=XbG5Co55 c=1 sm=1 tr=0 ts=6a0a04f3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=0_QClZtVb7ToMYl6Za4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: kmdN42QQeozOUMxAsDWyfamBklxMDZVp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NyBTYWx0ZWRfX8AZ/jOywWqwD
 TD/mmcbCN7TWJ1ZFz/sFNLhWTB6sUAH+UmyU92bYOp5wXtQGPBMpxzJUMXAVXPaV4BCDqL9zm+L
 ISmBuuNizYNE/KfHOYtJaQoDB7SYE3Jg3l/Q6JhRVMZlVH3hnHQ9Fu0jqqk5JhcWJz17nej3lWA
 KNL7H5iVatSIiKmeaW6jULqVOV4YYVcJE+Klp3EpA26HVuK4Hk2xXCR8Eo33eCy8eTi/PR37LbT
 urqPEWtfuQQgBqvj/cPm28tCbDQwtT5a8uRdk0GXA5itukh/75t5AYyi1z7atgFSbaGnkwARvl8
 Kwk09++qP/QmXVI02AP39MoUbU+nVACSx0FKSqjK7cU+6CFPA4CM9VukHgQKfJW/jG7qkAE5+9S
 RAxvX3aOghOEQK5gVKIUjjA9zbgiVTpHgQQ4uFPcbc07ICrNRt1gKpP0RxxpeS88uMKYJzrAt8n
 +s7ZaK/UBm9BhEx1rPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170197
X-Rspamd-Queue-Id: 4B543562ECF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61865-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,aa00000:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:28PM +0530, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..c47443174f97 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/media/qcom,glymur-iris.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>  			status = "disabled";
>  		};
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

I can only assume that it is "vcode0_iface", "core_iface" and
"vcodec1_iface".

> +				      "vcodec1_core",
> +				      "vcodec1_core_freerun";
> +
> +			dma-coherent;
> +
-- 
With best wishes
Dmitry

