Return-Path: <linux-media+bounces-56320-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FNBNv7Nu2mXogIAu9opvQ
	(envelope-from <linux-media+bounces-56320-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:20:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8962C9609
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC574302A79D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1B33C278B;
	Thu, 19 Mar 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLioZZE8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5zUD1rq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D3B3C276B
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915626; cv=none; b=b8u7rqSiiBkMgb6wzWWSgIhzjXC2siY4/fnrpmzgDBfXD6CB6jdAAlTIN+gWtGPcrhvWPa8ClE+mrScMVzpzUbLE9rucF2EeA+HMUlXdimpcPhbAaJ/s/n1l6oak9Rih2HPvWxyGBVP1FgUMvJ/UcXBnRHAjFY866SF0yGnjRiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915626; c=relaxed/simple;
	bh=2jFx/lCFqUCfY3+otPGnB9VZtpOk/1zC/2scijMVNGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q904M3SztTYlpHU+vw9kewYgmbYswPScwJp4prHYeVMeqwEc9SWb1uVL0yJiuyS5vcZDMrAq0cPN7MvdM5k4AOheZFBJOp/q4lHkpqexwFM+eYD/13g0pSlGTPEa76/YxahiAlhiI/LOl3RwvHyuD7VMAsd9aoqckszg19ZOJhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLioZZE8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5zUD1rq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wSd3771122
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 10:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JpIiN+v8TGLqAYQCuL1HRFsq
	2um7nT2fXHuAbL8RWsU=; b=CLioZZE8b+T/E9aa3GDwaPXoRHtUZ4fCUooEDuRM
	YGkAldXBU9jLPRAGN3EPV6mzFEYfhEBTOwHkAAmmM1jNrz3OiMbc8mDnRhjJaiFG
	ihm/mj4VTBlscxL0hX/DmlN3zFJhgGT/ScdfKzAIpA6rmhgmC4UAvHmRug4bDhh0
	2+Njth1IE4fPOYYmztLYd4v9kpoOU0betEEhUH7EyTv2AvSPgZ25XxB8s5+BNCg9
	MpSpKlEImaiLHdOI8Xb9K3YuOdZx4kqncMe4HVyIbunljotuUUlPZaDOtT4hx3mF
	0hPzpZYYmWHawkDR3Ur9freepBwv6UP44escejVx6SeJsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r9bxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 10:20:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b317c40acso9793931cf.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773915618; x=1774520418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JpIiN+v8TGLqAYQCuL1HRFsq2um7nT2fXHuAbL8RWsU=;
        b=i5zUD1rqDN/BhuMBv+YY5r4Ey26DmELgcy5pUk7ztGtI1krr2jXBA0KGPY4gvnaDF0
         QDdPqo5C24Q4VATV41a1koMHnblPlxUhj1tgP/7KyiqYfaPxiopHNbtbFKr6a8orLjnA
         ne/0NrZJvdAcEhqo1CMjSewmDq35RjQze59DNLdYU7AGIrxBdLDvetUuY+jNXGiL1OlT
         fZVXfv22qOQ5d9cezi+Kc1mF7y6XOAoEaE8snmEV/GeRsR/TQaaY6BoVXxtcc6y7CGss
         BNOvGSfBlm46ByMPf/NouKRLWpC4HQS6eGycL8tXYe66e1V/ZdWgQ4jhxLvLTKbimmrQ
         yW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915618; x=1774520418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpIiN+v8TGLqAYQCuL1HRFsq2um7nT2fXHuAbL8RWsU=;
        b=KEG9nY8+yXH2hQ623+oN3uZl6nHl4k6bvCpfdFPf+a/aIdJG8kJv29MNdtv4MwAkYP
         ouyuwWyf2YmUCFyJ7uLEP2k8dwn85HZ2nVAJyEHrJheDe8mLhr1UGI9ax+jPmc7PMgRw
         3SRN9B6uFfTR2aInqscXWugUAFDHL1C/lDkTyQcsqy5dYzOkPMM6GheOQ++GsTQOSiWc
         Yav4NyfOIhgkddRwqh3IEGQALaoF8CeK4RlIOHtkhMZt/YIAj6dprimxMSBmFgIbf9kA
         xKTovy5D+pODRlGt+m8MWNMkz6NCdtiIVU5yvArKR17anYWbEPr7sS1QU+lnbUBOYItq
         dsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3f3UWjlXA0/Lr61CbSO/DVifdw7Qiv5DFjWTRKxkXXDHIqsj8/iQIoYX069ujb//O5R/p0sM0xmdksw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWi+emR1rTvunqpvIqSW4LI0VmHBHAtmiRqvOvQjbGkZKnMhos
	mYqDpzlnh/XEBCAy2QYDvyK1OluCBgRJ8jCM5Gzj6adCIQo+OgmS26+rHQ1+TElBa6Badve8C+x
	8sPugiw3N0s4U5PDdjt/BBY8ChydZMVaqj4KX7HXOWFCDZaIZf6qfBroPq+rKL+3/PA==
X-Gm-Gg: ATEYQzzxq2IWhB9b6IyiDuBC5AtX5Cg7czZpmNQv+eYSLv843zf1qHZ7W99WHCTpyUb
	t0GenyEfTUn8LSukxzf2lwwhCCz7bkaURCOWEKfmQROYusgMO9vmSEwErHpAhxYqKdizPcAEG2c
	CtHUKIGUoPzSBkzyslYhMOaT61eFWbh8m9aMmP2299dTDBTqkmG96aoW0/wgfzpuIFrzdlkoTNP
	aunQ8xmh6Lyup48QvlYE98bBZRCPySkIb2hkUS+h1nBdk+fk568yO5l6zqThyM3oQhKXR0yC6h3
	g6eHLutSJC2RuaUGee4W4x449fLpaicahEZ+SFmIcpbAmSVKpSGCEs0EgZTmugncOFQ6l5114Hm
	gXFW4uuvW/UkeFOc7FAXtu5lUvEwDTvv6nA4fF+h1HSMlzdmJvXRAbYjCq257p/qOlp86pITSmq
	tA2p+P7QtPFMdSCVwg0bXxLQOE8xSnzUfpoaw=
X-Received: by 2002:a05:622a:44d:b0:509:272b:b3ef with SMTP id d75a77b69052e-50b14866c27mr85400981cf.35.1773915617943;
        Thu, 19 Mar 2026 03:20:17 -0700 (PDT)
X-Received: by 2002:a05:622a:44d:b0:509:272b:b3ef with SMTP id d75a77b69052e-50b14866c27mr85400471cf.35.1773915617324;
        Thu, 19 Mar 2026 03:20:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2fbbfsm1115844e87.30.2026.03.19.03.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 03:20:16 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:20:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Message-ID: <xrs2cvg7do2up2tphzhldymtkijcxzxxluncw5zqehgodxcty5@uj3ajneuxpsb>
References: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
 <20260319-enable_iris_on_purwa-v3-4-bf8f3e9a8c9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-enable_iris_on_purwa-v3-4-bf8f3e9a8c9c@oss.qualcomm.com>
X-Proofpoint-GUID: z662ImIH0eNKnHN77c_Br8DYSti056yl
X-Proofpoint-ORIG-GUID: z662ImIH0eNKnHN77c_Br8DYSti056yl
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bbcde3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=TF0k-g7kNUyR_OrwjY8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4MiBTYWx0ZWRfX+EBtteyHz6ij
 tzMe2lE/w8Y7xsT5z1sVHOtZhhVubbK2u2ROPzPBCltqhKNGsdX4H7dNntKDVBok0qNbqAHOeyZ
 ZtIOk43M+Wr0Sw3VNoZum5vuaVhAxYXn+DQPUay0DDR1bLvZzQkzKZBulX/M7p4KuddCvoRcN6v
 7MIPJ7RH1n1sSzAKFuqo8FWTc6uoGup6aw6wCFaVu2aicA4cVWsIdaYyRhxeGw8dQt4k9qy9IEU
 Y+X40zEl5GrAIaFaOrCMrDcoqzbFOBNv61ioOtyBczcP3vzLqBq25ltLUkDOSi1d3N21HpsTJjd
 DM7dvqLg/SbiJRFmfqtt7ppRFGYhMSNSzW/4ijAHYbvBsBPmUgq0YOQmDWzjxJ/G/PcGf6K3IKd
 eo+5mRPLy+FtgXF2vDiQ8ZwMJ+fxDMlMGfj1aQcpQJURCT6Zc8Vu1MLDNqXNr45zgHdUuFF2vZ/
 7EnDM7Y7j2PVdVJSvKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190082
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56320-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B8962C9609
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:23:56PM +0800, Wangao Wang wrote:
> The Iris block on X1P differs from SM8550/X1E in its clock configuration
> and requires a dedicated OPP table. The node inherited from the X1E cannot
> be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
> be applied.
> 
> Override the inherited clocks, clock-names, and operating points, and
> replaces them with the X1P42100-specific definitions. A new OPP table
> is provided to support the correct performance levels on this platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 53 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
> index 46ffe5353f3d2fe20e70fa8373c2591863708c61..9db77fc734021ae2986ec6a231b1f6f5461e6688 100644
> --- a/arch/arm64/boot/dts/qcom/purwa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
> @@ -153,6 +153,59 @@ &gpucc {
>  	compatible = "qcom,x1p42100-gpucc";
>  };
>  
> +&iris {
> +	/delete-node/ opp-table;

Use /delete-node/ &iris_opp_table; at the top of the file.

> +};
> +
> +&iris {
> +	compatible = "qcom,x1p42100-iris";
> +
> +	clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_BSE_CLK>;
> +	clock-names = "iface",
> +		      "core",
> +		      "vcodec0_core",
> +		      "vcodec0_bse";
> +
> +	operating-points-v2 = <&iris_opp_table_x1p42100>;
> +
> +	iris_opp_table_x1p42100: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-210000000 {
> +			opp-hz = /bits/ 64 <210000000 105000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,

rpmhpd_opp_low_svs_d1

> +					<&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000 150000000>;
> +			required-opps = <&rpmhpd_opp_svs>,

rpmhpd_opp_low_svs_d1

> +					<&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-335000000 {
> +			opp-hz = /bits/ 64 <335000000 167500000>;
> +			required-opps = <&rpmhpd_opp_svs_l1>,

rpmhpd_opp_svs

> +					<&rpmhpd_opp_svs_l1>;
> +		};
> +
> +		opp-424000000 {
> +			opp-hz = /bits/ 64 <424000000 212000000>;
> +			required-opps = <&rpmhpd_opp_nom>,

rpmhpd_opp_svs

> +					<&rpmhpd_opp_nom>;
> +		};
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000 250000000>;
> +			required-opps = <&rpmhpd_opp_turbo>,

rpmhpd_opp_svs

> +					<&rpmhpd_opp_turbo>;
> +		};
> +	};
> +};
> +
>  /* PCIe3 has half the lanes compared to X1E80100 */
>  &pcie3 {
>  	num-lanes = <4>;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

