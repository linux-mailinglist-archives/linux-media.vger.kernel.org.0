Return-Path: <linux-media+bounces-31001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A0FA9C21E
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E6527AA21F
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AD123497B;
	Fri, 25 Apr 2025 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAfs3N16"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217D923236D
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571101; cv=none; b=Og49wzD0kb+MfGZ/0Ue2p+4EVOfiiPU99cM5OvQOW+eN9sPrSEbMyzeHrXu1QhXyg8IRHfXNZiynym0m6LcLRMa+wd3GgiRyH7zStaZnLyxq8qKdiNLGD7aFxol6nmoDud7JMthhU+N6423/8IXd0o1ylKuiWjnolXnPv7BwGP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571101; c=relaxed/simple;
	bh=bMSjABCClWfJSC4Hjs5jAPDO2W6FqdDcosI1jaZyaiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkFZncaDRUI136Iwy88EfHnV/D4DoZrHniluLyccMyy1Qomv+fspKKq9EjWrQ8QTnBwd6wPJ8t0NniJYiC4qX+GHhOpzMp8Ujb++7rmdkEjCYLFKfECzRar/Ok0aPD4zRPvGryqsgtjEiC/PCN9oUQHojMWaAAbDwN3a/lrZPbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAfs3N16; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T719008612
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 08:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zgto+NXLTWjeGis4250S7ueD
	MaHv1HkfoBr/1cOtW7s=; b=gAfs3N16r3PEPHWUpj8lv3m9YE1gPmW86gv6hSp/
	xNzifIfwOfnfjqcy4eLoaIRNL+B7qtMoctcqbVk8C0ukxff9zfgryTujT9BWtyhN
	lMU0fD/GaeSE6DkzCrFa4xGyG9wLXXn5irhyZe6zFJs6de0eAnIqIBNfH17OxKXa
	u+b/9aIF3AiwLVpSgrUkqvjqMvxu/BdAb4WEGpE9+TfmmZPzyLqwhb3uWXAHiD9z
	m5c2igUsMvaEzNAjlBWiTCp3cn0O6yIooKBkKOPYeR+dOCKFcqbAD9Vizsxg/af7
	+37KEbMvABs5mV4dDyul9+BiBkiNnyCDKcF5Le0VxJctqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy8ate-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 08:51:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so363646685a.0
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 01:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571098; x=1746175898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgto+NXLTWjeGis4250S7ueDMaHv1HkfoBr/1cOtW7s=;
        b=ARqAVCahWy6NBG1vkW/Nx6CmyOB+JeWj+8Bii6cx1dR5fYrP0p11CaJdjx55ZuAJYN
         12VObAyPefpraWjjhWQRWq1YH2/a3Pk/Qttuub+iU7//07vCyQCQs+3urTzhx5CeRc3J
         SDNPKJfB3VUeusptiJo53XMuSvA2lzU6kzNchmb7FlN9sFpxjgtKYcvP7MIFfueTYnlr
         v1mJeM4CZnNWFHvc2ZHBFXbbwHJmgzyX2rdltibJZwaWVOjlhzg6NHHNNasoWautj5Lz
         EipJO+8kHCFQE9Dj2hRyYm2WH4KAv4uBCuL58kitzk6jm4wuG0UUrRHIanGET5qe0rEM
         fa3w==
X-Forwarded-Encrypted: i=1; AJvYcCXVrWV3rKTiJTzAMh1SYgEZ1gvuICjH0ec5quozJ99WBoLUanHiwvajwdmysfvmvnO9fM8JfVIWdnH+xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx855J56/9kEsQw83LifEAmRGhyVKYmDwkp8iuhAnPLvlx8W/I
	ANB957j1wBA40ln18YIaAvL9agKyuZdPPN8TPMJ4/CrXemoW1A7w7jM2s7+bhtmI67KewyYPw16
	akSPStrvXjK/3sF/bZks5RbZIWziaehxVYptyCVj1v4cn2qGYptR46rgA3xmRhA==
X-Gm-Gg: ASbGncufcFITnLDNVera72FF2VPGtPgwOBWhXh2CqxaAA1L6gB1oXhq11+BZR/mjAme
	ZeQqQzT+/v4TSqxbvQsh+2Vv/VL7N8fXZpxLnho6ptNmhKh+Khtwely+OF7lx5BVSK63+H+el5V
	tVOfgkHk4FZC/+2irsC5Clz9oABlsWVL+0Rf5rDZaQBV3KH0kOslMvFJgvHzSQYVypNZdjfukrA
	KpwikgPlc8bVmZz3zMfTw47syeCEMb9lJiE53BB9QhE1IG7bxuiymX1LS7xM07u6+F/UnDsZkWR
	UX8Jy5nsXKrZbd22JVBe4FSP/FG4MKxH1ZZSvE1FTZpQCPcYtmcRswwbjo7ssaNas9eloS1fOc8
	=
X-Received: by 2002:a05:620a:440d:b0:7c9:2e02:7dbe with SMTP id af79cd13be357-7c95863f8f6mr846010485a.22.1745571098206;
        Fri, 25 Apr 2025 01:51:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqb+tfOsOT8jkUVnW74s9Wh1PyfJrzNtha5bWxQ7ns3s35ArAoiI4qP7ixfE831NFw1jsQJA==
X-Received: by 2002:a05:620a:440d:b0:7c9:2e02:7dbe with SMTP id af79cd13be357-7c95863f8f6mr846006585a.22.1745571097864;
        Fri, 25 Apr 2025 01:51:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d0019e18sm6269141fa.62.2025.04.25.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:51:37 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:51:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
Message-ID: <luamtq6xhvmxat4ywhrawc5q5fjfhjnz3ku3c3k7aitjdbjacr@hmhf6ip76z7z>
References: <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
 <f05cba73-6d8b-4b7b-9ebe-366fcd92a079@linaro.org>
 <lwv5pk3dtyyxgtrwxss43dyecesv7pvrzvgwacwrnztkiowfkp@jqosvhrs3jk5>
 <42b56d7d-26cc-4c10-aca2-a0a5a16b09f6@linaro.org>
 <3kprgpvzffupnjbh2aodsowwklliywpemzwpsftd2cng562yuw@37tpwmpemr2c>
 <2dd28ebe-f69c-49c3-90c2-aedc0484a00e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dd28ebe-f69c-49c3-90c2-aedc0484a00e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NCBTYWx0ZWRfX20asDjb+wYjs DHqC66/4s29jKfbkm7lNokQED9X63arxrXJ+zKjR4OppB/JpndIQeI+bKKvkOOovHag+AJj40Ay z1bEq2iMdWZiqO8OTIk0clvevylPTeU9PV/jED0bCGCifRX5r7867Rny7ECoq9nifzBO4hiA5pg
 optX3c/sseBRduOYjG011YdXKZldOr2UntZTvBSUh3ecpTDqDggU3tzQrNBaHEKE2fWt8wQpJkN bmwLhA5UH2ICtCyx7x1r0ZustwISqQ3Z6K+BkIpYYeviQ+WwAUJO2yqQKo1Ps3NEyS7AzHL2+30 AOV19A3AC7QoxljsAwuI/sZOzK+CoauSN+d4TGq4h0WfapOH9DNLUtV3ypQLEREiOuFPN/QUOfr
 Dboq+rKHIn20wv89lf0ymCeClfRGfRH6rvDS9sK/gR64GjOFo8LJuMyCfuEdsIpfN1NPF9ta
X-Proofpoint-GUID: Xh-qSM2fDy09d3zAo-v58iu0nrHdvw2r
X-Proofpoint-ORIG-GUID: Xh-qSM2fDy09d3zAo-v58iu0nrHdvw2r
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680b4d1a cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=RRyVOxHS6r0Lc4ymnekA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=717 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250064

On Fri, Apr 25, 2025 at 09:35:05AM +0100, Bryan O'Donoghue wrote:
> On 25/04/2025 09:26, Dmitry Baryshkov wrote:
> > What should driver do if:
> > 
> > vdd-csiphy0-1p2-supply = <&vreg_1p2_ex0>; <- individual supply in PCB
> > vdd-csiphy1-1p2-supply = <&vreg_1p2_ex1>; <- individual supply in PCB
> > 
> > vdd-csiphy0-0p8-supply = <&vreg_0p9_ex0>; <- shared pin in the SoC
> > vdd-csiphy1-0p8-supply = <&vreg_0p9_ex1>; <- should be shared pin
> > 
> > I don't want to allow DT authors to make this kind of mistake.
> 
> I require anybody submitting patches to show how they tested this.
> 
> So you'd have to lie about testing it for a mistake like that to get
> through.

It's easy to miss it.

I think, the supplies should be reflecting actual pins on the SoC.

-- 
With best wishes
Dmitry

