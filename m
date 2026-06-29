Return-Path: <linux-media+bounces-65943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VeqYKFVuQmoK7AkAu9opvQ
	(envelope-from <linux-media+bounces-65943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:08:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 683CD6DACC0
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:08:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FxJMVguS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QNGGij3t;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65943-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65943-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3609303A007
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B30140627F;
	Mon, 29 Jun 2026 13:02:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5120140627D
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 13:02:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738176; cv=none; b=rZR3adG3oshUlQqbhaPBzcGS3ng0OWn124aBp0TqFlK0aGJoWxsUdVzrht5fYR71SUrNFU3yR/Am5RlBZ1Amb64Ka7I2zENuKusfszPj8/fdqHJcehpY8q+hk2dxIlH5LsAgJwhn4bITLnuJo0isd/9iK4Mkd6N9d4N4cpd6IzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738176; c=relaxed/simple;
	bh=gZw53pFMcQgCYZDJinH3iCRFlyEYE5MBia8cml4tAH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUoX+wjR7q4eGn2ZK/3EeDbOI0RSMwFEkKNtPSirCPWPyS8IfNT5bnWVF3B7c5JuH5hF+tpk0KhKBBd2bJpxgd2YiBnoGs0yiJdMNnRBSA9KvHI2mFi1stzFgDS9omFH8ndWR3KneHngjTu2jRJS0Y9LvImXhiWQBGjI9DuCuEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxJMVguS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNGGij3t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3gO2646937
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 13:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ml68ks4UWkrifZj3ri7MUh/7
	MoKC61M3Z9NIEdR3OKA=; b=FxJMVguSHIhCYSrMDlHY/FHUSk+Unkab9Fmtcao7
	QzbTO+wktHQAIImxVMB0/1fp7fceAmVGL0ERc6bKog7wU864Qs9PFgyW0aKhar6a
	zTNZ2yd+NVHJgj6Ib1sHHckk0DCzaKppLixohNTBNHMW3fsKzo/sRsv0s9fRW+3y
	03JI5cjVuKGKu5SZoPe/PiapZDTFUDB8KNImKXQzgRCC9vnuLF/d6miyCXtDg6gc
	5hHfncBUrbe2gYdFa1kaU87cOX9BJ+aHa/X7lpm6Fms3GhBAotHZ9OGzqymEmKp7
	LF1sDuGaxqA2C7kwBF0N3CE9ku4cRgob1/P3tC8nVTmZ1Q==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tsc8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 13:02:54 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e74781faaaso4485991a34.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782738174; x=1783342974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ml68ks4UWkrifZj3ri7MUh/7MoKC61M3Z9NIEdR3OKA=;
        b=QNGGij3tm5QIcfZKqIuqv0zjUH+5NokcikGdXufq5YGCoTVn+fOu7PFmoaaTokDoqA
         Qjfnwp5fSZgsP1P6dcghI36k/VK+/t+nuAEcHh3nV8FJzhRLseGXOTDEibTq4hNA9bfK
         d7OftjnUbJW6ewmRrKODE7xXElMmCTsk42+ICSWYVT1hrG967IBQaoz6TZpvQ6rttJ2v
         CZUdyysQLizp7yDnCLOlyepSKSpltMrIHPGxGTAseB4SIq3V7pI3u7cyeeKn0l9cnc7n
         YZwpUSSaT/A+B9Z/iIMLwVZtfOQMcknSO8teWOtcK2V9Mc++YQ3NGXQrw48oDCx/MtJY
         Fn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738174; x=1783342974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ml68ks4UWkrifZj3ri7MUh/7MoKC61M3Z9NIEdR3OKA=;
        b=V8mY9MIJFOkcoZH2ORSliVovXV0ecNVXGeIoO+KMGB+8OTv6N+NeBL18/TOMw+ypZz
         SKyHQ5Fnh0Qwz+dS5U1C5IJ/gfm/TW3PrIZommbirc8dgngnj1vU9XvqwwC8Z50GHvYN
         6YAN1/IuJ7P2hvi39J2UtQyv8hALC40F7Fp3Q4XXB1zc3ufhCrY1EafIaVcUFrnMexh5
         UwL6JD5p6ME8VhXeFqz0h9nbpufyAURGq8mCMluNDkriPEoOj5ngprxHqaGCBF82LY/G
         O+XgxLE7A5/QHydV8joWg0f3SRQNMuXiwfWqKAhLZhTvXB8BQfU2s2aA7F/t8JbB5gob
         qkkQ==
X-Gm-Message-State: AOJu0Ywcx3xKWnCkDoFZ0v0FszS5I/abpO5V3asos9B2pANYn81F+Ujv
	8K/bLTfsmmlVODvnvQTrWOA6+nIS/z694PSg5GxlZl3oSknJL/9P/A0MEmjiGMDDyoBjWPMWg30
	wd4TJszGIeP7Iqt3N8dKNooi7wzo4F0H/BwL/usgkqDUmmSu+qv2JcBb2duH5p1Answ==
X-Gm-Gg: AfdE7clJR/nfrliQXcyKqc9KhKQHTrUm0ehT0bfvZ7+cx3OuVl6UK2Bkq1cDjL1TYRi
	k97iXsMQCziyqgmgmR/186nEZ/3b+MPC1K1h4Uq5RWFcbp4MuH+K4ljoZzKH8IqdZ1U8Co3yr6C
	ZrDr5qnCfANntrE2TTnR3gZP14oDcubcrakjjMFlzQrcnsIqYDgJJqdxem0Op2ZkUpCq2pky8kp
	w3eDSiVx1c0U/Jy+71emEh+X1UgaMUJYJ/ol19VMtf2pXdKP7RY7LAN/zRRK4jHvdhqHxlKwE2L
	aE0G8tqrT4OLHTUQ/u760v1ho234FI58/jHh/07fzX9kCCNttSGdfecvCzCbFMwtCBJeMFj1S+D
	qgacFBolqfmpa5+DDCfokgKOnvBSATxCMiAeXlis3hW4JQS2CozFqw3+nJWvcIAi0cwlGkuwKF9
	7fBH7KdX6GVesGkMyhih98cCzo
X-Received: by 2002:a05:6830:81f0:b0:7e6:ece3:80ed with SMTP id 46e09a7af769-7e99c22242dmr14258410a34.21.1782738173662;
        Mon, 29 Jun 2026 06:02:53 -0700 (PDT)
X-Received: by 2002:a05:6830:81f0:b0:7e6:ece3:80ed with SMTP id 46e09a7af769-7e99c22242dmr14258337a34.21.1782738173084;
        Mon, 29 Jun 2026 06:02:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6954a55bsm5960604e87.6.2026.06.29.06.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:02:51 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:02:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <nrbztmmm7j5txtu24e6hy3g6kjbxk7mulcx7jv5zbnexnhzwr6@ddbp7av7hpbc>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-4-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629121750.3469292-4-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOCBTYWx0ZWRfX5s4ztlo0Yy34
 gEkCU2iWDyTpmuu4dfMRntt5YN22X95g3G9UA9WZMa/KFBeFTwNJiIXhvizQwdKtTWRTf6DkcR1
 476iBqcoH18FJA3oM7J0CH1fsiYPmuDNAi/Z2EjdK2s6XguCKvEIbnfoGj7Gvs4wUrobYkX7tHn
 +0AEHgyBlR+AE9995Id/6TOMcVHUvM3jLmeOxqqB18AvUo3vAcCjC1xaUII1X9whVH1ZUjR51ZH
 1DEldMruhiCtT9FEfUwGZngeBwoZyof+GkbrdN+UohsqE8d7db1QeO3c8I0ZI9BXiDMkfw0rhnf
 B0AzBBOBbQ7pW6ubNhNOsRpsaTwwD7aOOKNg0n4zQlbAX7/NGVVRtLE7ImlecnR/5qZO7z/zGhu
 9mkjlbBErTojOEXu6EOq6ajPTCK4z5ya6oJIBld0XZCQG4N93Iih/ObAStre+q/6PUNddNL3eMW
 4WxmE6BxvNrXB4NcWUA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a426cfe cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=enru-rfrgKOJ_pi6DpUA:9 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOCBTYWx0ZWRfX7SAevYsFSjrt
 yGMdRGuXO7mhqXZEXYZrolbzxWMEbw2aNqwO+lPNzS7WoOP+IqSqXqmFiG6pali44aG6ddnHihM
 KCch868RNnQ4bsML/hi8chPMLweMEqM=
X-Proofpoint-ORIG-GUID: 2nNIfBv4QbYgExoDvtSRIQCz8q4A2kx0
X-Proofpoint-GUID: 2nNIfBv4QbYgExoDvtSRIQCz8q4A2kx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65943-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,ddbp7av7hpbc:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 683CD6DACC0

On Mon, Jun 29, 2026 at 03:17:49PM +0300, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 78 ++++++++++++++++++++++++++--
>  1 file changed, 74 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 7076720413ab..d0cacb4ec35b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4472,6 +4472,9 @@ cci1_i2c1: i2c-bus@1 {
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
>  			status = "disabled";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;

Status should be the last property, add empty line before it.

>  
>  			reg = <0 0x0ac6a000 0 0x2000>,
>  			      <0 0x0ac6c000 0 0x2000>,
> @@ -4616,10 +4619,10 @@ camss: camss@ac6a000 {
>  					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
>  					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
>  					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
> -			interconnect-names = "cam_ahb",
> -					     "cam_hf_0_mnoc",
> -					     "cam_sf_0_mnoc",
> -					     "cam_sf_icp_mnoc";
> +			interconnect-names = "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc",
> +					     "icp_mnoc";

No, that's a part of the ABI, you can't just change those.

>  
>  			ports {
>  				#address-cells = <1>;
> @@ -4649,6 +4652,73 @@ port@5 {
>  					reg = <5>;
>  				};
>  			};
> +
> +			qcom_jpeg_enc: jpeg-encoder@ac53000 {

Unused label. Drop it.

> +				compatible = "qcom,sm8250-jenc";
> +
> +				reg = <0 0xac53000 0 0x1000>;

0x0, pad address to 8 digits after 0x.

> +
> +				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +				power-domains = <&camcc TITAN_TOP_GDSC>;

This should not be necessary, if I'm not mistaken. All devices inside
camss are part of the TITAN_TOP_GDSC per design. Handle it in the driver
if required.

> +
> +				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +					 <&camcc CAM_CC_CORE_AHB_CLK>,
> +					 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +					 <&camcc CAM_CC_JPEG_CLK>;
> +
> +				clock-names = "hf_axi",
> +					      "sf_axi",
> +					      "core_ahb",
> +					      "cpas_ahb",
> +					      "cnoc_axi",
> +					      "jpeg";
> +
> +				iommus = <&apps_smmu 0x2040 0x400>,
> +					 <&apps_smmu 0x2440 0x400>;

These two entries result in exactly the same base & mask. Why do you
need to duplicate them?

> +
> +				interconnects =
> +					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,

Move to the previous line, use proper tags instead of 0.

> +					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
> +
> +				interconnect-names = "cpu-cfg",
> +						     "hf-mnoc",
> +						     "sf-mnoc",
> +						     "icp-mnoc";
> +
> +				operating-points-v2 = <&jpeg_opp_table>;
> +
> +				jpeg_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						opp-level = <0>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-400000000 {
> +						opp-hz = /bits/ 64 <400000000>;
> +						opp-level = <1>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-480000000 {
> +						opp-hz = /bits/ 64 <480000000>;
> +						opp-level = <2>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-600000000 {
> +						opp-hz = /bits/ 64 <600000000>;
> +						opp-level = <3>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
>  		};
>  
>  		camcc: clock-controller@ad00000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

