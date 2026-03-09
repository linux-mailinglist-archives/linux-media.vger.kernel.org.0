Return-Path: <linux-media+bounces-55023-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH4BMx1er2kXWQIAu9opvQ
	(envelope-from <linux-media+bounces-55023-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 00:56:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83523242C54
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 00:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20710301CFD8
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 23:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3741A396B9C;
	Mon,  9 Mar 2026 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4WX/iUv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlAYXOLp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9241638BF80
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773100563; cv=none; b=qmbs72RUndzPT8qpDKhZUpD87EgA5M/yfdhgdYozw/r8Nai2VVnBBow6QYzdpQOjpG5kwwjwbzkH0SXW8ZYtELHINUAsKjy4S6QzGC9FLJlhjodIcQd6IGHjbJpF6RY83CfVrX/o/KA5SWXaW5hymdLAoJRHpBi91GB/7gAvO04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773100563; c=relaxed/simple;
	bh=APoB2GRIaTLewPG2eJJrNGl3EI+jktO1KC29NiUkO3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1Q2JaiXAXemlcLnKKLYZQd4GjwuGkY7SdW864o8wQhiYWLLiU9yqmhBEbsdYGzbXuJTMu1W3bxYDg2SjaMdNsbsfTfKbKDpnqd3BDGplsDMCBS3f7zKsIlsq+qYZx+w58E9R8cBxRrmbnqLAjq19s3OPGarYLZF5Fhq1HBaDr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4WX/iUv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlAYXOLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBsXG3148298
	for <linux-media@vger.kernel.org>; Mon, 9 Mar 2026 23:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gg5U06zvmfTeNo8OPcFnYQbQ
	yTfxWnitEMe/QrqOWCA=; b=d4WX/iUviZxL1yn5BMH5jwJj4eSI84LcSv6hPnW4
	mXEcttwdXfm8JFjBAgLyy2TGBeomgn7rOhN0fHRgufzPfkQLt5uXjZqWBXpuhAtt
	S8kfdt+AA1A4PtMnZUIuK+OtbXmEqNk4M+2U3TslkjNuB/M9Gp17AwLpSM5Px0n8
	+NOdKvuLe2enPrnCUFjmMgYkBtaz7rjks/d69VwBVXeXwUMXx9QQmU8r3A8UclpD
	26hxOx5eD2vyEl1rCy3TctTilzqoIOOlWZIlr9ZDtiVkBWB72XKSPOa3HoXxorFi
	QCJHl0TbphAptx9+bCvy4Cqohxsm/FfivQZTgyK/n2ngCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5uagf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 23:56:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd77bc8186so2596744485a.0
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 16:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773100561; x=1773705361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gg5U06zvmfTeNo8OPcFnYQbQyTfxWnitEMe/QrqOWCA=;
        b=BlAYXOLp1soMMQaMr+vg/p1VZ1b5uBZYiKZ3PnIrL9Bqkd03GVKzftgOFVHoa2CAVd
         jfpam6iWknGGgykiRhMiX3GgUfACZw8oqvyX5Ck8d3+KVYItmzIKc/TtQNE/SrFzMbLe
         Rc6S76VmWy3iC4vC+ReDEiJgwQOE4UBE1zNpXY92HoJICivoDh6Nf5BVrVUV0+PU4XIo
         SQTHUFu8fCpP/wQCILaV+ZZKNORBrfPE45kLqufQZPQAgxR2u8u3rxPCoBJX1rHJMYsL
         cIj6dBK7w/clFlmS+qa1P8HppjObV0Etw/A4ho7nheuAIDoS7a0c1sp9+L7X7uqJMAzb
         A1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100561; x=1773705361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gg5U06zvmfTeNo8OPcFnYQbQyTfxWnitEMe/QrqOWCA=;
        b=X+7/rH79cdnBRF9AjcTEIe1i9nIJ3FhBNhjdAjYAa09JT6ocVL7WGlnzyep/gDtg98
         kzamArnbAW/7f/5JvvZ5E+gL8m6N8P8iSg2/fshG9/obIF//EsOSIbwt5bStPtLk05mK
         GCMRXE7nHEstjvipbGocZjol0OGYRQA4KmaZ0XSdf4eAQYMSLnUZiAu6UDYGAp+N0stW
         CkMVsA33ucbEvBhi7QEUuX61jL+MjTi0Q2KkJGjMevpol4BTsvgwgIhTXezGnFU/MH0s
         dAAUw5Z3ceqmEG14X72aADdtKP/e66rgXPWxqsX4QKnoTb5KZWLywmwzvaKxdgejmeGN
         wc7A==
X-Forwarded-Encrypted: i=1; AJvYcCVw+m56ndnWPfPRfHMiUastuxkAuliTgjK1khkQeov+SSGmC3h1cgghqnd9NFw/4gAzfrl6UbJ2bfmxiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzbCFdgvFWvRBmp62Fjb80mGvEg+pfwlLbF3Q5ugko5CUayAM4
	LuhG0q0Xnf/VlXNfzyivjHNOis3arTlI+zSj+Jgm/KB4+GZmrZsw42OhtZ0JZGRpSMLkuyluqAj
	J0AOYbVYx+vUNNQ8omiS35L4eKMYGqJQpznhfsbA6VGUsFI9PeCWDK9SKzXMInWI4mQ==
X-Gm-Gg: ATEYQzxa00DwdpIyFvNKaCr2n8g0JDk+RaqIWeQLtWkgl3TFan0inGavASDgF8RFxqM
	ZF1obRGrSNfPGi6yZ8kBWU4u/+kEB27NKnZdSZTxUZSe5iZi95Cbv2/PxEN+i70FkQulld9nB33
	jCFudc4RUQ908UDG5VMaxfe4EzH1BHoOq3dI6sRBhw9gFvWFJ7PUumL6L1U7QaaDkwZp0AaFZEH
	EwTv6iHLm4lazh/A1Qj2xt5hwSC2exwKBRfvOCnc47Ou4fNFBPzVdPeCla7WznuiQhv8rPF5z2Y
	W0EQNt47MzTu/pKbv65kv6qukvSz5SM6U/wBWFo/ySu2rNru9SaYMFPRD7mjC6dUId0e2U6iHHZ
	3Ft8K5+la3pNMW1dHrNi/D1tlu1OJG8alAujhE3CTIF4bh5C2XNw1AR5ZPZ50oJmeFYg768vm/v
	TmCId0P3eDr98a5TloFW1MxJHFsPQvrXVgQKY=
X-Received: by 2002:a05:620a:44c2:b0:8ca:fdc1:cc9c with SMTP id af79cd13be357-8cd6d514b43mr1695423985a.76.1773100560844;
        Mon, 09 Mar 2026 16:56:00 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:8ca:fdc1:cc9c with SMTP id af79cd13be357-8cd6d514b43mr1695421685a.76.1773100560383;
        Mon, 09 Mar 2026 16:56:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfb8087sm2034751fa.11.2026.03.09.16.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:55:59 -0700 (PDT)
Date: Tue, 10 Mar 2026 01:55:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
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
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] media: iris: Add platform data for X1P42100
Message-ID: <wjue34qubjrdzwvmu74ysb6pfq7sy75gmihfzk2i4pw2i3koxz@pdg3vq6cgytk>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
 <20260306-enable_iris_on_purwa-v2-4-75fa80a0a9e3@oss.qualcomm.com>
 <20260307-curious-skilled-ibis-fffadf@quoll>
 <b65e62e7-c223-498c-9005-af8c74861a66@oss.qualcomm.com>
 <8a7c3b44-200f-42a3-9888-aa72f401cea7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a7c3b44-200f-42a3-9888-aa72f401cea7@kernel.org>
X-Proofpoint-GUID: hRX7eabDWaKG8t7vl5ERgk7hIk0osMZs
X-Proofpoint-ORIG-GUID: hRX7eabDWaKG8t7vl5ERgk7hIk0osMZs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMCBTYWx0ZWRfX7cibx8FwIwTh
 B42498ajZb0Ds0B0L0/4NDdKjemoNxKdUo1siDeUFN292ze0LT7sx+7WpPTar+E5otoHZbDCUaH
 p4ZAb+QVDtOUwB2ccAgShcovXkCPkWvQj0trudRJ580wkaBBy7zgQf84ofsSco2o8M6RBcEe//T
 9Z2jLvVTlkkKIy8qsMKubLXKrTPNe65MEb9P4FB9YYSux7OqVNu+Lok9ZH9q9zqmMG5Md9fwZ/b
 hLiQH0+Ex9iInqFAz7dqfOcWiG04KW/99zTCMeFYUMRAhPv62C0m3MsS3uc+mKZ2pbMWbcoij7J
 2Dw2b3xrnFjAn9LjadMlyQnbz/0pmm4gVPXVfwCfyO3jBV+i8W5ABn01EMzwY4e5yUWGmZDec1p
 gk2p9vALVW4xB7jf5KaLLm4xkaIaVcyqK5jX0p5oiWOnynhm2zWCGbpOKi1bMzRC4F38Rj6oFkc
 DT8LMMLwva+tWFkPSfw==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af5e11 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=tZouj9Mp9CdiKozPqckA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090210
X-Rspamd-Queue-Id: 83523242C54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55023-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:49:42AM +0100, Krzysztof Kozlowski wrote:
> On 09/03/2026 11:43, Konrad Dybcio wrote:
> > On 3/7/26 2:18 PM, Krzysztof Kozlowski wrote:
> >> On Fri, Mar 06, 2026 at 04:44:32PM +0800, Wangao Wang wrote:
> >>> Introduce platform data for X1P42100, derived from SM8550 but using a
> >>> different clock configuration and a dedicated OPP setup.
> >>>
> >>> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> >>> ---
> > 
> > [...]
> > 
> >>> +static const struct platform_clk_data x1p42100_clk_table[] = {
> >>> +	{IRIS_AXI_CLK,		"iface"			},
> >>> +	{IRIS_CTRL_CLK,		"core"			},
> >>> +	{IRIS_HW_CLK,		"vcodec0_core"		},
> >>> +	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
> >>
> >> And maybe that's just IRIS_AXI_CLK clock?
> >>
> >> People keep sending downstream code and name such stuff because they
> >> found it in downstream, so I have doubts.
> > 
> > As the dt-bindings commit message states, Iris on Purwa has some new
> > IP that needs its own clock for operation
> 
> 
> It's v3 IPU, yes? So why that block disappeared from further versions? I
> would assume it is still there and the naming just might have changed.
> 
> How this clock is used here looks exactly how v3.5 sequence is done.
> Alternatively that's AXI1 clock?

Looking at Iris docs for Hamoa, Purwa and SM8750, no, BSE is not the
AXI1 clock. It is documented as a separate async clock, it's propagation
is enabled separately, etc.

> 
> Or commit msg should really explain why usage of this clock is different
> than v3.5 uses its clocks.


-- 
With best wishes
Dmitry

