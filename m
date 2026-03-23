Return-Path: <linux-media+bounces-56729-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMj4ERRCwWmqRwQAu9opvQ
	(envelope-from <linux-media+bounces-56729-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:37:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EA12F30E4
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FA953146E1A
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FF81D45E8;
	Mon, 23 Mar 2026 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNScoIbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJC8iC2F"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C9F37C90E
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272284; cv=none; b=nZRJHsczJ6LEYfY+gLTuxRVpe2RWInKI5IrrghwYxOVe20xN95yYASbyfet4W+TcBf1/FJcPHCxH040zm7U+OCqvxXAabwc6PRsPzYgwgUi816S0yKwAOEVoUTcOKUvarXxxSYKk1W/gbakedsGsyBSL3rxG2cDL6AsoIFKb8Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272284; c=relaxed/simple;
	bh=rdA4dOaZ4Ub4mBnbxOg0dj78nWYZnXE18lEpqUxcXD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghNE7jaJ/EJ8gUPTDHlcQHboTzN0ye2txH3ogOVA1dzFymlStTy0qKkiLBOR93NNKNcCIvk552op9KSEDZKMa/3MEMNGtcoH5d3NXOqSspxuXWYO+x4z8dId+Syrif4HbjfyT1SSknJtTa18wHC2+sRsSQa60QFKlCN9XaeLc6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNScoIbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJC8iC2F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADmhj3539751
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dagRmz5JVhI/c+NGsliK7/kenCLzmMMlVS151o3p/vk=; b=WNScoIbsXVEzsyZR
	V32o7ksBKn7xt9kf+JxShM+v9dBvkPusP9rLklXOrA5Q1Qyh7eWlWUwPKESKerpO
	UHJrOylNssiOctB8dX3EZMlnwCqm6c65AIjzTkh8YyfeKSRziJL98RwWytVL24tt
	LmIIVPYnaiaJJSEVY3tGPNkBCooXrpaiN+Nol9aX4p6K64Dx60h/mYjn2tOllcch
	mXPS4TDyaP/6NOLelWyXMWhODwuVEayrCdQ+NwsUoLzwXMq77c6Hlesa5BHQKhvg
	lJ6V5fl67Mw1jazp/vICD2o/H1IjD+tbklAJyWskrHe+1kHSXJjnQA/vDzDqkRuw
	UrTPbw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k30m12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:24:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffd797184eso412431137.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 06:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272280; x=1774877080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dagRmz5JVhI/c+NGsliK7/kenCLzmMMlVS151o3p/vk=;
        b=JJC8iC2Fr6m4n6azuHWORmAM9/6vbNKaXCbcTprvX8cMMHo9DgmgZmw7fXNTZqznwQ
         r4sWq9/svZ6GAeH0E6kE2a3gE5IPZcHej6+TCVsx9KIosLNEVGP6YXEJLSZIPusq4S/V
         h7fLeBSqBAd8cu91b2hqQByonj5NqKUGoEajO1RRhvvTEFV3bNdKrBbny46MxhmI07Uu
         PkOuRUKdder0wG9ggQF3LylNnZsmxR8AlqImVdR0qkGRfmWCLmewNcZxx8AzD9YKDvJe
         NISuKJlQ4GVQIpuDwsV/l1Xw4CW9vnqxg8UV09IEcJ4cxFTeS7pbRawpyCkHzq/0uK90
         8AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272280; x=1774877080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dagRmz5JVhI/c+NGsliK7/kenCLzmMMlVS151o3p/vk=;
        b=llrP4FfcNNdIog5pgzXm+qwls3d0Xvr8o7uA30U3CfHXqJR0pG/8opLhQZDz66zSYQ
         81RndDQmY/R5j1L50lXloLch4b9JuMR7MtdFr435DHdocbPmiUD8CD7hdeJFBxkkUfzY
         T/0kIplO+e0ooety53jqi0vQm3IDlimCTIq3HehySgw+JPOoOrtUyKmDIePc0Hw5Rs0S
         dpqFlRBxJHEfc5xe19kztyZS8PdqaF1fIT1x+lBDQ+esmLLVCPUPPqdwIwy/ZV2taIl8
         B13i7SVk+nfKzpiD/JfX4SQgsL+4qxljdjfXuvFE1LAqIytgmHoYRSdzJtoPlue2uOWO
         VLKA==
X-Gm-Message-State: AOJu0Yw1mYJUGkljJbs3fuyrp14jfGM4YtiywQWMzZcvAgCX7eSuofIL
	K20ST+fk0LZwGtsuEgnv+Wt7v459p5aWIQKyX6O2Kiy4I/UKkPRGJrPUJKN5Z+kyRmunw9YWEcE
	UBhxvRJulkfqiddaNPNDZ5HZFDT6w4B0M/2xWlbo2iVPUb2eRpkKeEW60XrKWfzpUDg==
X-Gm-Gg: ATEYQzymzIr8nwnzFcbODOOBTdbBVGu77tJZLeqeq7HALZj5uYpaLWUgJ7lseTN8yWY
	dTd8AHpXkAUz3aW2lhTzl7z00F2W8mksUqSbn3SHcJVGqC9htkp/CyOMU737hC+M/Ay3jMTMZUa
	tZ3AF9mL6M9Q1hfRJAOXmz+wwvukpR7jtw7w46a4BCfgGyLsG7yTclZFLaEKwEz7JwnzuPgNIk8
	DZJRLqxYB3i1QP6Ub6fjtD+YzVpml0Z6O5x8vR5Psipj2U9zh7t9RYE5mawPZp4KH7DDywkTmFR
	J58hWSxUvzbz5VhvyvrxtrXXhD2RO5OgvHzwYq2//6yKr45NZuH1EQvEEo7kVSHy6qDP25p+NGF
	gYrl5+bMfDIPz9YrwxT9txCDQYMXx9p95F9No8icrZyT50FJm7pI3wVvngOnwThb+VHJ8wyZF4/
	a5Gwk=
X-Received: by 2002:a05:6102:1144:b0:5ff:c510:b7d5 with SMTP id ada2fe7eead31-602aea7e2acmr1885223137.1.1774272279662;
        Mon, 23 Mar 2026 06:24:39 -0700 (PDT)
X-Received: by 2002:a05:6102:1144:b0:5ff:c510:b7d5 with SMTP id ada2fe7eead31-602aea7e2acmr1885203137.1.1774272279083;
        Mon, 23 Mar 2026 06:24:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cfdb4659sm3891169a12.13.2026.03.23.06.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:24:38 -0700 (PDT)
Message-ID: <76edd04d-7bd1-4b42-bea1-79f4b149c0bb@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:24:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c13f18 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iocPoGn1HS3vtzwNltoA:9 a=vU4TAecgBzH0kKDF:21
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX5ZBpkeJnGl1e
 b0gmVgYhIiwPNyD1zLeP9E/TntwouT26z9zMDiSOWJhbgjCLEuwmwkKTCYDlcwI2zScKRVBVqyZ
 co9IvmwQi2ON+aNCTaKr3FeM1vbzSC+ZPj4fBYhl/ws/ZU0J/2psPv1B4mqHNt0xyEE+ThAPjeA
 7NVTX5RYNblXewVFMePRHg/YsQFYg2jx7nA+EqbkVF/kJGI0KN2ZdlygIaRdy7I+VQBwcUawcfK
 O32+BTRt9naBdWrZxU301eoZ6YgSQ0Xvi/35gphYHJG23enuvD5KA55serH89sysnY5YH5sItcE
 p6NBUppUcGEmmxCOrhxQZeX7QdgYxMhsyY/91S9TgT0dMDP4ZhqdpBBNVIF9vGw2ro6S1cq5mLu
 MGh/acjjCjfE+Ci873pz59t8xIHKm1svPHmiyxc2KDrLNeypRpf3WuTXR3jDJMAGO9iNGkjg0Of
 EXu3JMUaW6NsXK4BLkw==
X-Proofpoint-GUID: aJ7-4qea5sn7WLW9ufWyi-HJAhtcKb5N
X-Proofpoint-ORIG-GUID: aJ7-4qea5sn7WLW9ufWyi-HJAhtcKb5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-56729-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,5c42400:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 08EA12F30E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 1:58 PM, Loic Poulain wrote:
> Add the Qualcomm CAMSS Offline Processing Engine (OPE) node for
> QCM2290. The OPE is a memory-to-memory image processing block used in
> offline imaging pipelines.
> 
> The node includes register regions, clocks, interconnects, IOMMU
> mappings, power domains, interrupts, and an associated OPP table.
> 
> At the moment we assign a fixed rate to GCC_CAMSS_AXI_CLK since this
> clock is shared across multiple CAMSS components and there is currently
> no support for dynamically scaling it.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 72 ++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index f9b46cf1c646..358ebfc99552 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -1935,6 +1935,78 @@ port@1 {
>  			};
>  		};
>  
> +		isp_ope: isp@5c42400 {

"camss_ope"? Label's don't need to be generic, but they need to be
meaningful - currently one could assume that there's a non-ISP OPE
as well (and I'm intentionally stretching it a bit to prove a point)



> +			compatible = "qcom,qcm2290-camss-ope";
> +
> +			reg = <0x0 0x5c42400 0x0 0x200>,
> +			      <0x0 0x5c46c00 0x0 0x190>,
> +			      <0x0 0x5c46d90 0x0 0xa00>,
> +			      <0x0 0x5c42800 0x0 0x4400>,
> +			      <0x0 0x5c42600 0x0 0x200>;
> +			reg-names = "top",
> +				    "bus_read",
> +				    "bus_write",
> +				    "pipeline",
> +				    "qos";

This is a completely arbitrary choice, but I think it's easier to compare
against the docs if the reg entries are sorted by the 'reg' (which isn't
always easy to do since that can very between SoCs but this module is not
very common)


> +
> +			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_OPE_CLK>,
> +				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
> +			clock-names = "axi", "core", "iface", "nrt", "top";

Similarly, in the arbitrary choice of indices, I think putting "core"
first is "neat"

> +			assigned-clocks = <&gcc GCC_CAMSS_AXI_CLK>;
> +			assigned-clock-rates = <300000000>;

I really think we shouldn't be doing this here for a clock that covers
so much hw

[...]


> +
> +			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
> +
> +			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
> +					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
> +			interconnect-names = "config",
> +					     "data";
> +
> +			iommus = <&apps_smmu 0x820 0x0>,
> +				 <&apps_smmu 0x840 0x0>;
> +
> +			operating-points-v2 = <&ope_opp_table>;
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,

Moving this under camss should let you remove the TOP_GDSC and TOP_AHB (and
perhaps some other) references

> +					<&rpmpd QCM2290_VDDCX>;
> +			power-domain-names = "camss",
> +					     "cx";> +
> +			ope_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-19200000 {
> +					opp-hz = /bits/ 64 <19200000>;
> +					required-opps = <&rpmpd_opp_min_svs>;
> +				};
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					required-opps = <&rpmpd_opp_svs>;
> +				};
> +
> +				opp-266600000 {
> +					opp-hz = /bits/ 64 <266600000>;
> +					required-opps = <&rpmpd_opp_svs_plus>;
> +				};
> +
> +				opp-465000000 {
> +					opp-hz = /bits/ 64 <465000000>;
> +					required-opps = <&rpmpd_opp_nom>;
> +				};
> +
> +				opp-580000000 {
> +					opp-hz = /bits/ 64 <580000000>;
> +					required-opps = <&rpmpd_opp_turbo>;
> +					turbo-mode;

Are we going to act on this property? Otherwise I think it's just a naming
collision with Qualcomm's TURBO (which may? have previously??? had some
special implications)

Konrad

