Return-Path: <linux-media+bounces-64866-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +XrSGS0dL2rX7wQAu9opvQ
	(envelope-from <linux-media+bounces-64866-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 23:29:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E60C26824A0
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 23:29:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X7xhvreo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="jV13P/CP";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64866-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64866-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30B6C3003364
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 21:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E981433C1B7;
	Sun, 14 Jun 2026 21:29:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565493264FC
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 21:29:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781472550; cv=none; b=P1sDOSuBJHSTx/j7MdPKb8GsjxJTFnyTkeJOPgCvLwm8Sr8GD/iUGWmDONP5g4k75nC/CFA9hZK7/s0HhrTypnDjbjFGqMlcfmyYmIcVGMfZRBahevPJ/Sda4gA+33+eze8WTxFoGF4r1HWHsthIT8AfVXr2N2XivzzAvv2nwgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781472550; c=relaxed/simple;
	bh=rkwnz+igJhLSHd1/g1zNsfmNlAjsiP1DTMIeA2PxKKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Epz5iN4tEgzXsJQNnNunpvRYltmiTMA3qh17JJJ9+dWJAQGECn//dyoyLNA3av8Kd6iP4iz5MUlYinMVtxE6RwyvKvnpJ34T5U21bFg+t017pA3vXghkexkztjKsTTt5Zh2wqHBZe7jzk59UN/nWUENqkfY9CBfwc4cLX7aaCSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7xhvreo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jV13P/CP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELFhep2187630
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 21:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+UIZX+yrm8NpkbBZgExiV/8q
	eCkMTLOf0NOLfbd2dfw=; b=X7xhvreooleITjkkm9bYeNm+7FTuGg1nMlulEQDb
	u3sU1IQcssaqwvDdRO11Jpr/+QsbMvXwUeeNvtabtk19sxVwxxj6lVHZV0EskUIk
	tVnWGzKQroM65MZi2RgVy0gQhlGbdiK3cxJ8y177lADm1YlBQV/hsiiLt/SzewbH
	klWziuyh9Qj6fYTnhxPQ9xKefZL0w2oPl9CK5+BjA7J0fGP4d4m0sidaqbbqxGEb
	BUGwP+lF4upVIeoRsIKkyTjhfZpJkgJDkOEFTp9ZmQGtX4fvtKwLb8sm4EXTuCjI
	5JSAjzB/Kp0G5xxWKK7J4Mo1fWZKS6HRgxn8Qpe9BgJ80A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye14kj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 21:29:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915b9dd020cso754035585a.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472547; x=1782077347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+UIZX+yrm8NpkbBZgExiV/8qeCkMTLOf0NOLfbd2dfw=;
        b=jV13P/CPn/ri2FIwsB3vWi3GGvWDnB9KdGRCrL0V3B1RYJClWAENqyjNd/UQp3IwAk
         zEZdbCk5+a6bqmN3P9wEqaVy6ylit0zWRhx6lfiC3jSGBYG+OBK81z8WiIofv7KYG4F2
         3hpP+2C2fHMcyyS8aLt5RF0AsrQwYYV4U6ibDVoBt61xQnyRcgByYltOzp45ztZZJ6S6
         eZ7MWij6ArfstJFsYAV8lxqxgsdGeF6Iw14E0VcKvc1q5aHjEAnqdWikO1Jzq/UAssH/
         x3wpI0cXRCen8cheqr2Q1OFGZNeywxHGjDl+dHxDGN4CL/dUrhHY9xktjkvk2gJ5I2Cz
         BmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472547; x=1782077347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UIZX+yrm8NpkbBZgExiV/8qeCkMTLOf0NOLfbd2dfw=;
        b=ib3nC7syLmwyccpUeX2woVvkHhu71P3k+NyxY9NB01iXxYwtTZunDxITTgIUUc2mVp
         mghtQbPmx/CRmjyKxRAduU/VTY19GCcy/CKhn44juPyUFCyFvKru2uDa+dFYvvHMMtqc
         YOD5SsQDM/dtIsMUKXl4VJDonfGPny24ZvLAfRBADQvHgN9bueLhZ/z8jNNv3k/qeauQ
         9bU5Ng97ugMDKqjzvDmNsqKc0hG327HhkwB9Z/24X/+eXXf31XrTmRP2uPL1UJa5EkhX
         bwCaSS6iqCGyfbrkyvJPER+Mnc8jjfHgcBNyHZTLPg/w0WJjuG5jv2RRpG4hINr7yyKV
         0YyQ==
X-Gm-Message-State: AOJu0YxNScL+++nqWbTKzVX56fxXY2wqOr2vbfiGcb36JAtSAiHVVilu
	hMoZiuHhEv02deuxAWaIcNxaf2ARaaoWUOQukn/0sZDJXQRQ/+EIVbvaKPmMWWP9DAWzRB9kh4C
	rdpnO4XbRs6zgVcA9KhlRojF2I0aGX8Fkt4tQFJ6yU+yUigDrcT+efSCc8FQeYvChdw==
X-Gm-Gg: Acq92OFyZD/E2X6/woxBfSrsKYglWoIDUU0d2e0rGx6hSW3Tl/e4RXFcNHsP7wUotU5
	W4doZuvvQ3t+JhPhkBW3nk/l1Ab6+KEYEGoMMlcMqkJwD2aCq0dOZ3VUhBVyfQj1L9Ni5n7s65o
	LXWHon02glX0/ocK0k/WhMY+hlcK5Koq9xgLNbRqNRIkAW4G+RHYaeOxr53dJMBwW/5jyElm7sR
	Xm5uU7mL7sMq49xwv4+3wXlrgU0BrxVz3e5aumvuVFdSdX0R/HefJwVcW5+X6dnWWa/Gjx4kDoL
	ck6/4AfjnEDLM3ALnSiesoxg8C8zPj7LKvhu9ms3z20xMJLDifRBCtLqc/plxNfLB91PdynV4tY
	fPI7TJp/vYPDc3ZF0ceKowToyDsAX2sRlw4/QOf0g3Xbk6Zk4S1EGM7lvgONrn75mh695XQJcIn
	g8vTkFNQdO+amG6U3L4wMN7b8f3UDmVdX8t5k=
X-Received: by 2002:a05:620a:25c7:b0:915:9fba:878b with SMTP id af79cd13be357-917eefc30ebmr1399469985a.9.1781472547489;
        Sun, 14 Jun 2026 14:29:07 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:915:9fba:878b with SMTP id af79cd13be357-917eefc30ebmr1399466385a.9.1781472547075;
        Sun, 14 Jun 2026 14:29:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a0fasm2219335e87.20.2026.06.14.14.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:29:03 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:28:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
Message-ID: <t73gjl3mqcp64rddf7yaosmscdpaj5opiiatztd42fmjrxdpta@2fp5mpgn4icb>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: cDJhx66niiFdl3614tsIDVOWsnaRx3SW
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2f1d24 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=57GF0HRpIeqOalGSDUwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOCBTYWx0ZWRfXzEZ6IeU2QcO3
 RsHz4hea1BhUMj7xeYCLsec8UESwC4FgVwp+b8RD8Sqs8SmkqsexyQh1oiihr8eMqF1GKZSiEp4
 0FsVCRNj2khYltI7DRPB58atBRHgASA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOCBTYWx0ZWRfX/WA/eBWmJJmV
 WxUUwJxRVqb9LI1J/FfAYZvpY74g33KA4MDBJrDXoMw5fzskXN5GeTTYlpqkYYgXPwkHRfV1lsT
 6I0AhHrxE9yN1hc+xhPxjO9voeELFFF+qLfM/jmLTN/sSwD76x7A5G1X72TSem/1G/stjeiqJ9U
 HU2PxWAe1GTilyhZDB0qwZGS092MbqOsNQ2eiOnO+m7b3oLE9ccP2wjJ9id3fucAIZj+CiXSQXl
 dXU5f4gV+l4B+hbaaHAAt+1mx8n/XFLY0RAYfIRblvyiTiWgi3boNbKJYgvNmbIX8/4ShAGK/bU
 ESbgTW+DeoRfJDqoe8oM8Q2fA6mG/FU7gtHAHSP8joShp4XCvwAKz/1uHOTUcPQzzkQDUS0ks89
 fWNBaLsfAdy3FrWiD9iGZTZk7mfzTup3dQmtQft0OQYtSbdYT7gkbw5u55x6XuMCILGx97gykZO
 NkfCqJBLZzQ/FM5cIRg==
X-Proofpoint-ORIG-GUID: cDJhx66niiFdl3614tsIDVOWsnaRx3SW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140228
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64866-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E60C26824A0

On Fri, Jun 12, 2026 at 10:44:15PM +0300, Atanas Filipov wrote:
> Add the missing JPEG encoder hardware node in SM8550 DTS so the
> new qcom-jpeg V4L2 encoder driver can bind and operate on this
> platform.
> 
> The node wires the resources expected by the binding and driver,
> including clocks, power domain, IOMMUs and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 42 ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6..8090b8b1d7bd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3677,6 +3677,48 @@ port@7 {
>  			};
>  		};
>  
> +		qcom_jpeg_enc: jpeg-encoder@ac4e000 {

To reiterate and reinforce what others wrote: this should be a subdevice
under the isp@ or camss@ node.

Then, drop the label, please.


> +			cell-index = <0>;

No cell-index.

> +			compatible = "qcom,sm8550-jenc";
> +
> +			reg = <0 0xac4e000 0 0x4000>;

0x0 instead of 0, pad address to 8 digits (0x0ac4e000).

> +			reg-names = "jpeg";

No need to name the only region.

> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING 0>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_JPEG_CLK>;
> +
> +			clock-names = "gcc_hf_axi",
> +				      "gcc_sf_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "camnoc_axi",
> +				      "jpeg";
> +
> +			iommus = <&apps_smmu 0x20C0 0x20>,
> +				 <&apps_smmu 0x20E0 0x20>;

lowercase the hex.

> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> +					 &config_noc SLAVE_CAMERA_CFG 0>,

Use tags instead of 0.

> +					<&mmss_noc MASTER_CAMNOC_HF 0
> +					 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_SF 0
> +					 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_ICP 0
> +					 &mc_virt SLAVE_EBI1 0>;
> +
> +			interconnect-names = "cam_ahb",
> +					     "cam_hf_0_mnoc",
> +					     "cam_sf_0_mnoc",
> +					     "cam_sf_icp_mnoc";

I know that camera settled on these names. Please use a better approach:
describe the source and the destination of the interconnect (see how
other devices name them).

> +		};
> +
>  		camcc: clock-controller@ade0000 {
>  			compatible = "qcom,sm8550-camcc";
>  			reg = <0 0x0ade0000 0 0x20000>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

