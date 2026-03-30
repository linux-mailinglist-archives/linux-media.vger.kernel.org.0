Return-Path: <linux-media+bounces-57602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJLoCh1cymn27gUAu9opvQ
	(envelope-from <linux-media+bounces-57602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:18:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4E535A18A
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B93F63041397
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD182749D6;
	Mon, 30 Mar 2026 11:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUzTz+HD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z76CFxAC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B433B6C19
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869342; cv=none; b=tkVw1PU4/lheY4qSYUZxOA1ybm93joDd3sqb9jDQ1xsxJVEu3jnhSHDIDMcDnnPGvYcyiM425aklT7jMhR5y2XGmwHtJUQiB3JjUJl9FGYyaNcTlHmveIpAoKM1Ezq1FASTTptnnyVGDNrdvvahKRRWZSolfdRDuQbCA4Zp+C9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869342; c=relaxed/simple;
	bh=tr1+vZrmofnSpYn90Eztx0OhSCniztRM0zdtPMgCtUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSeWWR6V+HeyxJ75x/nGyItG2Oh4NukIkYs61ByrbjsACLhZV398mhbvF5t7I4vB9BA724DepmU1la9z3TrewpX/WA2RAmsn4iovfdFkxLM5ufSsIoeKYivs+Ld9kVVskUZmru1XoVJ3BftSU0R+TvIbJPisuGdKGb0j9hTPFUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUzTz+HD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z76CFxAC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9naIO3722902
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogPJDkAzaFSmdt2dEX3iL6F7G9X1L2BalMH8sF2B1Ro=; b=PUzTz+HDRFT2Hlw2
	duCtE2XerKDJzQ0jr30gwqNyn3cimdZUrvRnjMlPvU4Ygail7LR49sddtPz+t/bf
	i5chtgUV5L3nMJnq/LZ8RKz9YJx/nwOz+MpGnaO2dCRlwy3u0xvA+bYeQ57Zxw9U
	dhxjNNzvvYLh85/hGl1Z2jARuFAlg5cDCmfDHJFV4KXGRPL1DBergakYyXM+NGkI
	mGnDGOFxXJy/0Yq/0E9wTiRMJCSEnJEajrW5CDYKUXKJ89olvVFlqk30vBSTjGHM
	uu/NofAR24a+lrQjntYQ9UP3/LdHTetgBFh7aOmW0h7XUhHkMP012frE4Rl6l2YQ
	5yfMKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmr9w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:15:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso641911385a.3
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869335; x=1775474135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ogPJDkAzaFSmdt2dEX3iL6F7G9X1L2BalMH8sF2B1Ro=;
        b=Z76CFxACwNsGhNqTX76broBwXUabr1nNPd6njPaLK4U1BNBuSIOTWNGjln5vvdeH6c
         P+abJlCiij7BmpppFg/rsDCy/d72YDPHHct/5CjzB8Hop/T9cysI3XKym7+Mlq3HODbr
         /+vTAqiEG2TUniVjEaNkAaM6NkUTISQ2rIQWfI+5D3QC8DVRTMYqHuoQRpid+Zqvj0gx
         kJHh/P55Wtl6krr5SABPTPP8iUe7IF/UE33hKxvhTtWA3ImT4Np9CvqE4z+mOzAtgf8n
         YfMEJ9RIqr0BbpAvnWcTRw78UAIdVL2Efj16kDIW92MWkKYPtWhnSc05tzYkCR1ZZ5Dd
         VXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869335; x=1775474135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ogPJDkAzaFSmdt2dEX3iL6F7G9X1L2BalMH8sF2B1Ro=;
        b=oo6DKdNcPF7t6ZVoZLWSJR22b3TpGNv6UfockDK4rtJjY2nMtfoUulEU+jsHdlD/03
         hiyxe0fp5Dx7W17XGjEOaczFsN1mF1KMeCQYJoTLwXWPqiNzM7GHuaOtxAduZk95w3A9
         PCFg0B93XnmUNPSWQ8EVja7b3Ksu8pu0JbEJoWksOd9tWuYg9DlSXBojNrlmBcwFwW8G
         t6txMzdYwlTRbu4Z/jXGxKnYgIbuw8p/fe7Z4bKwhBWkEr6x/7Uyn/22NzIaSLWJxf0L
         OG8wtlqipFz3QaJ3R/gwQGcHBdj7ofyBtjDxM0yn3BYfzvIqGHdeMfnsLoTAPXE3p7a6
         STjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKTEezAxJMeNg0yDjxJ5Bcwg5vbI7Gm25b1Vp5OAKrLVTtwkOhIX26d0TUtDRVv3R7RJ/mWRsJyMKnZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTZpHs52dY01P0B5SBqJUdLIcG05AMckQiIpVTJj9Ily295Ilh
	CUZ3nu8gUSIxecCK1yQGx4mihno2frWlSu+gU84prO23RrsKa2dooQ+Lub0qucRx5fYeZZlv9kZ
	7U9LosCnslp8WteYvfOJfJA2oomd+uArl5IjOQB6C50Yw+gzTiMuh55RJwVotJYZk308wIe8zLg
	==
X-Gm-Gg: ATEYQzw5sct7/+P7q/463S/b0piD7Jockav7BWkgSodf1AfSrou/fkxrDGh/oUjKJfe
	FSQBeF+M2IAsZ9bP0AJhHoomW8CMRIkY3caFwUHnZ7I0+yyCmujBFdyLS4bJs1CnlzZA1PN/PCF
	rOcJMLqGlk0cTtu4OUOR2Kgo9Y6FnmqO9YUJv7nWR8nMieLNQQxcjtmi0bZT6jpphD4/8HvM4/x
	oTHPyi36xa/7l+SEinGQEPAcdaSXfKD9r+LE1hsl5YJXTjl00icDKFfvRvd4qB93TWkod8MJ+9B
	9uaxoewYpOICGRmY7pMKetam3yqhUblVI4MhUJZqT7SwoNzp2ldZlcn9gOHTld9KAdtNHprihae
	+2WIxNp8VNeChAxDyUGk6oS+H7GzJYNvOHib+MOJChctzstReEhWi0XgRo5HmEo5776LHgDD0Iy
	lfYDb74ZXuZUiX7o2fWqkJd/uCAkq2vYqTNgU=
X-Received: by 2002:ac8:5744:0:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50ba3836e2dmr178220911cf.18.1774869335126;
        Mon, 30 Mar 2026 04:15:35 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50ba3836e2dmr178220361cf.18.1774869334457;
        Mon, 30 Mar 2026 04:15:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f435bsm1572580e87.9.2026.03.30.04.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:15:33 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:15:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Message-ID: <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
X-Proofpoint-GUID: ZSp-Jdn424EoajFZ6b6R0r0fQbQwWegd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OCBTYWx0ZWRfX9YVWmk10T0CF
 QtM3n3IvckGkNHsh5U5OhcyREXru7SdPpumi/Ovp/qTCE3a/WuEzAZUic8VlWIcv7MSrvh9lryF
 UlwCAqTk5PM8QveuvNxy2RpihovJVeI5iSq1YMM55s+MvGP1Gz8Fxajm2a/teIcFk52R8TcBier
 5MNWchZv2GgwmbbrRjESu1pM1r7xSerQZM3m443JYlGFKguj2YMRHlYlxYQioaL/GskFXREFH98
 CrPRKGYxuGJO+lTzL2864CXYaoi7W6rWrW4CL7eT/+NUB05hSo7ZxBZ0O1DmlpgLlScphcB3h3x
 V0SM3mX4fuNRgcZwPs/T+55aEWta+70kIVyzvh6OXfsWerRXfMtQHLx/+VkRz2el2Q+udV595gq
 Mrgjk/mof8aU126XCfZo1Ize8zmfjoh+VIdXvRCTHTfxfBG0fkQBr0rv0hvkHXyQuhMLYvDRUjh
 +Ef7HOdmoCEPwJNCLUQ==
X-Proofpoint-ORIG-GUID: ZSp-Jdn424EoajFZ6b6R0r0fQbQwWegd
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69ca5b58 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=9MiheJ026npgdNaa-0UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300088
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57602-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A4E535A18A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> > On SM8250 most of the video clocks are powered by the MMCX domain, while
> > the PLL is powered on by the MX domain. Extend the driver to support
> > scaling both power domains, while keeping compatibility with the
> > existing DTs, which define only the MX domain.
> > 
> > Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> > Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> >  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > index df8e6bf9430e..aa71f7f53ee3 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
> >  
> >  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> >  
> > -static const char * const sm8250_opp_pd_table[] = { "mx" };
> > +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
> >  
> >  static const struct platform_clk_data sm8250_clk_table[] = {
> >  	{IRIS_AXI_CLK,  "iface"        },
> > diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > index 7b612ad37e4f..74ec81e3d622 100644
> > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
> >  		return ret;
> >  
> >  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> > +	/* backwards compatibility for incomplete ABI SM8250 */
> > +	if (ret == -ENODEV &&
> > +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> > +		iris_opp_pd_data.num_pd_names--;
> > +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
> > +						 &core->opp_pmdomain_tbl);
> > +	}
> >  	if (ret < 0)
> >  		return ret;
> >  
> > 
> 
> Hitting below compilation error on latest kernel
> 
> drivers/media/platform/qcom/iris/iris_probe.c: In function
> ‘iris_init_power_domains’:
> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
> read-only member ‘num_pd_names’
>    71 |                 iris_opp_pd_data.num_pd_names--;

See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
dev_pm_domain_attach_data")

> 
> Could you please check and fix.
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry

