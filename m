Return-Path: <linux-media+bounces-51970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M7lOQlrgGkd8AIAu9opvQ
	(envelope-from <linux-media+bounces-51970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 10:14:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B78C9FBF
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 10:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27BC6300559B
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 09:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947C63563DA;
	Mon,  2 Feb 2026 09:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErNHJPt/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcJgPBHS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC27A1EDA2B
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023674; cv=none; b=REa0SalX2Zg82uAxLccBVZRbnLqQHWY1HJt8naTH5UoJhxaU1O5TNTNEwVgbcFSRQMx/v3kpNtDct8M4edqHDUoo4aX5hqIIw4fVq0NCkr3iBKLvvDKyhqAY6D+df8D9yMTMoWzqD95RL+u+vFO/qIKJeCZYJty0mZsSy0b4kHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023674; c=relaxed/simple;
	bh=RPCa4jT3dx8G6SSasNvGFMIbnFAYR60kh9mN5iEbmms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiVZiKPmCSv3gYplX8kASX1jdWq058WGZZnh7C4IeeF2adwi1/U6ckpOohJllTIdCWTvdAQH8nOvjhuSaXd8rcQ1nTRYucbVJgv31c13lzWx/7sklmBm+0j2kkjys+FnGNXxrkLi+zcfCFuiBSssl6bXtQn8FKBbmMARfXXFqEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErNHJPt/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcJgPBHS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127QptH1349755
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 09:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mHvafMJ1u8k1iQozLlGKQ+EjWAWEQhyGmxb/Gs7Mypg=; b=ErNHJPt/HeAcPB0v
	Qc+nOUkottjJNojjNRgR/lzOEAi4kuz9clK08xBSH4XDs7J35ZqL0FyIwqn3PeQX
	Q1j0cEF0eAe4jyUxeuj5B7JhJ4OW4Ph4g5IYMly8KgrNCBwaV0h2vK704r3pB6bE
	3r8p2zCs+xxpSMBpa6ryNjNBVvDbfQeFtwNAhz1egx3yCNGqFzfkvLEVXnGeUHX+
	QAtg2j/Ukhgc4GcjwrCrCWURtn0o5+KntWbCrKp6fTNpz4yY+qqBKcpscDPfJcz5
	cMizK0DL0crT7o9vC4EnlwIvHPdOjr+maRkfWvrPGzYuGTgE0jYflWDuund8cpaT
	ZKuvsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1jgs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 09:14:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ed6c849so1075910985a.1
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 01:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770023671; x=1770628471; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mHvafMJ1u8k1iQozLlGKQ+EjWAWEQhyGmxb/Gs7Mypg=;
        b=IcJgPBHSyYadI6shcMXdWcAIP3opTwEiK99nsfOMPvIMSaLcsUf1B9XNKrqUtTQx6R
         YO3PD1yevYf5X6gpOgEOSktUxfNzcNeYyYdHJw6N0rwC3PRCN9MSDybX1AGQJe4LJ4M2
         oUE8jrsIbflYVN5cei5W0NQRm8BBOL4l66/LuVWvynHsKDkPAVJmkLbcQtw0x5qyI6nx
         S4GblrBIqCyvkAZxBGYSLZOamBiB0OVx6XcEb8zMiaejsXAM16arvcX2TYJRUmrRwKha
         q78iXcclo3cxMs7vNDIvU8T4AcUe4HSoT2ZOCTOaXXgXBtDPXt9VcAhHSjfopttPeplB
         JK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770023671; x=1770628471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mHvafMJ1u8k1iQozLlGKQ+EjWAWEQhyGmxb/Gs7Mypg=;
        b=LTGnxcPyb5GiehX09zzBa8opYxgQrMl5T747iNdYAAtZIrSeO1Sx9UapnaGIh+1sTJ
         51ySac2sELx/AiGEEl9sO+KmMaHAh+jQSN5Z9NvYTLZYF+vnf1wpTLsqQQtYzlipjizM
         1pDCADvl8ZljN9RNLogypxmGTn6qQsuUcxW39ryj2gTUYH2PbBpHtQ1bfGgaCpeC5neI
         LLQH/+68zxIo3iGWXsxNur8KDXssS25ylComgmp6JNu67cs/VYt629K1PngBAtvPPN96
         qq2iyk1IW988dU0SSZMkkBdTamSm5aU/9JUUhLKE11/ANo1/q+ZhXLoNgLDbQX8ade9J
         RBfA==
X-Forwarded-Encrypted: i=1; AJvYcCV/iEM05D6RdX7ljZI4VO6zCVTw0I6sbyr7hle4jaGHOn/IH8GIHJ79WVbI7IC41GKpercRD3CL8yIF5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz07SWnI0oJZl8gqQCAJ3TwjqKdJU+FAc272PC3EyCAI2UbdT6m
	PY9cDC7h8/8b/oPJh/am1z2Q1U3WlTX2HUgWB4dNlHbJ2fqMuIoRe4AifiJEz/lNSRNqzk8j52Q
	vaUBpXNOKgVijHM06vh29jSkXWPkTegDhvtUW+UOGBzEdecbJzK6G12utiI75uGnyEA==
X-Gm-Gg: AZuq6aLdElAPCS/dCUJ4d+dV/FkVtw1+rSSmJdCH9yNjIbc11xYSrrqiIsHaOnmvgoY
	zOPkEPq/cT0iURBO0euVmD0gD6Vkqu5aaFJvCzTxgy3LdO+fqu/fMYfaUHG46YwMM4Z2yka4MDh
	Whd1/O5fDiMS78K807uLHVtAuXhf46xqxniNNXxzXbPxrw/vA35H3gYyW08GuthprKXFAnuOWn7
	aNwXsymXnhjuiQ1xPAThlpGlZRiVADY/H+lue+LT7Mp+MwAV1VgsaejgwHz2gAFNfQWUWYGaGYx
	w3sVnD6JKkE2J0l05eWE0A6bC5SFUYPZ4EPNEplYqpbWDvRKNWt0n5G6p7CJFYAv9jI0H8FpkOm
	Zsu/Hntlr3UBB/DNi3QYtz4scMw7DdmAhUfv3oaxk7jrghxf2DNhQfqdpcxBSLT2qnNaxaAIIgf
	M/aMxqfq8RCmKGZugX+ORG1z4=
X-Received: by 2002:a05:620a:404d:b0:8c0:88f3:fac4 with SMTP id af79cd13be357-8c9eb2eec4emr1382588085a.56.1770023670774;
        Mon, 02 Feb 2026 01:14:30 -0800 (PST)
X-Received: by 2002:a05:620a:404d:b0:8c0:88f3:fac4 with SMTP id af79cd13be357-8c9eb2eec4emr1382585385a.56.1770023670292;
        Mon, 02 Feb 2026 01:14:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fca300sm29447051fa.46.2026.02.02.01.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:14:29 -0800 (PST)
Date: Mon, 2 Feb 2026 11:14:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Message-ID: <sq4b4634cnn3dc7xupadlunlv2wvlfc5rlo5krdtot2yvrgc4m@cfeczijdb25o>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
 <3d99e35d-1aef-5e04-55c8-628918e29da4@oss.qualcomm.com>
 <g2ft7zu7mabl63hggbyyfkhntvkmsqjvtu43r2c35ycgrghxgs@53m33fj3b2ft>
 <9831d703-8427-31af-48c7-3942108b3a55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9831d703-8427-31af-48c7-3942108b3a55@oss.qualcomm.com>
X-Proofpoint-GUID: xprTC2bCFlW_g41Dee8judKZ59-uuLDu
X-Proofpoint-ORIG-GUID: xprTC2bCFlW_g41Dee8judKZ59-uuLDu
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=69806af7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=HLF9OULPyPFYZ6ZIqpMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA3OSBTYWx0ZWRfX96tVcanfCBjE
 Ei0DJNhpNu3tXs8JCmCeOsllHlay55y8NhUnv4OcJJphCbqWjZz8yUpj/3s1GA5ezP672sAbanJ
 DnY6yWlGcHM3+dz9H6vkGUBSMUMdiPH7Tx/kTCEEazFsw0wcdTz1k8JtKxZplFrTvRLb4rX8W4f
 x45s3+a9UkWf3J5wWI4oW+YgkUruY4CscGk4b8pj71fLsvnXj/H7LAoK5+Sl3fBKkVWEfOaCXaV
 T3dYvq0rbZ0TXhgzx7iIL6ZOJJ7ZFek5AhMQvGg3LnwoCHLDWqR8W7cHV1UkS9IDXpgbfkHyfZl
 QA3TE6YdBWLZ5qsG7ZA2xGB98BS/YD5fYPCmLpUiuimnhy3DzRPoKChK1Txr86acLWEZaZRaIjy
 XejmPEyY07wun9k4BpbiT/c6a5irKa0eL2PuvXvQq8nDFQO4qkU2aiFehHxpIGb0uyRBnFByooh
 /AuYvzznqvp2qeQj9iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51970-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3B78C9FBF
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 01:37:50PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 1/31/2026 1:03 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 30, 2026 at 05:59:48PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
> >>> From: Konrad Dybcio <konradybcio@kernel.org>
> >>>
> >>> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
> >>> to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
> >>> SC8280XP having just 2.
> >>>
> >>> Document Iris2 cores found on these SoCs.
> >>>
> >>> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> >>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >>> [ bod: dropped dts video-encoder/video-decoder ]
> >>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>> [db: dropped status, dropped extra LLCC interconnect]
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  .../bindings/media/qcom,sm8350-venus.yaml          | 113 +++++++++++++++++++++
> >>>  1 file changed, 113 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
> >>> new file mode 100644
> >>> index 000000000000..d78bdc08d830
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
> >>> @@ -0,0 +1,113 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Qualcomm SM8350 Venus video encode and decode accelerators
> >>
> >> s/Venus/iris
> >>
> >>> +
> >>> +maintainers:
> >>> +  - Konrad Dybcio <konradybcio@kernel.org>
> >>> +
> >>> +description: |
> >>> +  The Venus Iris2 IP is a video encode and decode accelerator present
> >>> +  on Qualcomm platforms
> >>> +
> >>> +allOf:
> >>> +  - $ref: qcom,venus-common.yaml#
> >>
> >> Pls remove the reference to venus-common.yaml and follow schema of
> >> sm8550-iris.yaml
> > 
> > Why? For example, sm8750-iris uses venus-common.yaml.
> 
> Ack — in that case sm8750‑iris should be aligned as well.
> Since Krzysztof’s patch [1] removes all venus-common references from
> sm8550‑iris, all *-iris platforms should follow the same convention IMO.

He has been dropping references to venus-common.yaml mostly (IIUC)
because of the video-firmware. With the video-firmware being moved to
sc7180, the issue is no longer present. I will check if it makes sense
to keep (and use) venus-common or if it makes more sense to stop using
it.

> 
> [1]:
> https://lore.kernel.org/linux-media/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/

-- 
With best wishes
Dmitry

