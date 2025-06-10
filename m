Return-Path: <linux-media+bounces-34459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141B5AD3B86
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 16:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E57D3A9B92
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 14:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13721E379B;
	Tue, 10 Jun 2025 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9JoBqre"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76EF1A8419
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566673; cv=none; b=HDHENOP9KOm6lHNsp1prBajrU6SuIiJS+SVV33td4H4UamMk87e8HrrtA1EsWeZ1Kc2wrRN39Kezg1vQfVp+mLzVEr9IkmNXzyOpZ19Af58jTEjC10yvewxDY/n2QjdatvNsauHoXmGEKMFnCZxIORlv4WMxsXOvALjwykCyNoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566673; c=relaxed/simple;
	bh=ElggMui8jF9y9EX7wOkS1Ek+i49TcttuLUv2qYZX3dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfETXwnh7Rv73wPbsj/BAvJAjj8yMHfUTZoL8a3gVpzf2nj8oboGCgArzMfEWqc5zbrE8f1ebJ6+m0pwN1CV/peMje2g1VSLtKhRX5vRkKD1SkwQfB2PLimmHLpcQozOtwgIuk+6YsvZW8tcngRaz9spnMGAp5DUDO6BRC3F6Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9JoBqre; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A98uks005646
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 14:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dmArcDtz/VBFaWXVD5inOnUO
	fF68N2U1yWnQMvw/igY=; b=I9JoBqreDfv3bobmrQgTMwMhEXziUQaiTUvUnSIl
	t4Hlow89ONddw7ZgbwQ3QghY2Ajdznv2pigh3V/qeMmbOV7BWgoX7yHH/cqU7lYx
	iqwOgbRh97BI52b/drn55ku7KA+IvVmo8QJBthvseeBt3Paqv4mlhQYNqJvVK60X
	WcVyzu9KEb0VPiVbftYITr9klv8oFDkPD79ENXpGaUj4a2HqfvpRcPIJBiteaIA/
	Yleuc2J8Yq7458Hs0mv44KpAUY7jtVhk9wPptGvljq1aG70Yi/1R8uzWBq95IWel
	dnVNWIW63lg4kWNYXhHOWtcIZbPifeDYXXpPoXnWXeQSeA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxt2qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 14:44:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabd295d12so89436176d6.1
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 07:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566670; x=1750171470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmArcDtz/VBFaWXVD5inOnUOfF68N2U1yWnQMvw/igY=;
        b=Y/5HOZEygFcG/OTweblClaHzf8Z4zUPQkOA6xwIFVReKJJgbhvt0CFt1gN2vGPnJVy
         MONVlIg4nCgDxAUxhy66g1Uk9Je7T3lcwZRLb4ml8XuCsVJ6QmazSMA2ZCxt3gcxeMwE
         CoGvbMZwWriA1pfqNnXvoqdpX2hUR14sZ//SiQGWeZGuOLM+S7RwMraoh/KY2D0j7ovF
         muaPHHx0xwlmQFcp4IH/+33u99D7uOViTucTTX+qi3XHsHhMISIvyAX54apWgxFhIoRP
         cpoRkhxqxllhHbuMZHeeLIlj6MXUq9oOpEgMifSYTxHESDcO/qrFVy7xTbmoN2wGD7pv
         qNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDv5uB7QS2ubdQDIsMuazuejoXIjG/ZUalJ85zLDFJK4YXMsmks66zo/5rSKyBz/X9UsKeiMg2Ag0OtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW1A7So6HZsIhyfyrpM0rslk7WkMyfMQiBlaq897B2Ju6Sd2fF
	+NnwonXnNZQinKOWOvVRVr8yKeSn3xd/7FNkARqZ50J8Aesu60iXVb+IEOJ1jfbbdCGn4tSUZwV
	JJ8TJZ+FrK6baHd365Wpm2iJFrIZQjoAYRuBKLGwhskMoTok/G3WDG18HA4ixtkoaYg==
X-Gm-Gg: ASbGncvvUEeNsH+JHZCSATk996BWuzwuQJjS/a2ZHJ+95g8s+JBVyVUQyWQF8O2bnCJ
	REUb2BVhFiyCR7QK7d3ntD/0T92x20x9gn3ePvhv0BrUa50NYy9qW77I7TbDnLdvi8l0plT0DHj
	WJILN6cs3hs6RpMlu/aXfshJlusWcgZpEmPS7yVXQEq6Ac3ZhkMu9VVHptEztakxGxpSlSn5rX5
	jDyfe5VrtC60BzUEK90kqzVcrOYQQJGRFDQB5qRmwxo/ipCFi2rFw+pOsAIpnRXuw3/H4I6qz1N
	IknMdNdh6OZ18mKR4kCwy2bzOdApFVZ7Yb50lSD2Rg27bkBxtAZLBFlqkERUOR8g+8tra8BQ28L
	jmO+JfqevsZ/MWwMlkiD8B/wKhaGIoVdgUl8=
X-Received: by 2002:a05:620a:31a1:b0:7c5:4b6a:d862 with SMTP id af79cd13be357-7d3a7e388eamr13585285a.33.1749566669641;
        Tue, 10 Jun 2025 07:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWOd7xuhrf5TwkieWLFC54AS4om1PhF57nn/qY8jxb6FBJjibaKyC8aIYrg6fhy1wK9IcBnw==
X-Received: by 2002:a05:620a:31a1:b0:7c5:4b6a:d862 with SMTP id af79cd13be357-7d3a7e388eamr13580985a.33.1749566669251;
        Tue, 10 Jun 2025 07:44:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d04d2sm1564236e87.33.2025.06.10.07.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:44:28 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:44:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
Message-ID: <tlaf6k4pblymc7zrsglgiugn4ft3bd2wwpmcghysmtnlb7grml@p6mqjkve3dvj>
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <20250610111145.zp62zx5rjmezvmkb@umbar.lan>
 <26a0a50a-849a-4a2b-87f7-af11b6f91ea1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26a0a50a-849a-4a2b-87f7-af11b6f91ea1@linaro.org>
X-Proofpoint-GUID: FPZy70ddzHbzVlMaMayb_oH7PdLo-KCB
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684844ce cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=orh1W3nBkB3DDOtbTGQA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FPZy70ddzHbzVlMaMayb_oH7PdLo-KCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNiBTYWx0ZWRfX5bETnPA2h8vt
 8kmbAM4/k8J2d5yLRI+rv63LvNDyRtottDJmom7lVtzl7MbQezqELGpd3HPV0yQe1E3tbrHIsQV
 mN9FR3COVXjPKGhwOqUXlgjjrL6zVtMD4RJ0/0A58BRCYS/UNTwLkMHCWEXWnsjhabvx6xWn7Fv
 0uCQl10XqtoagORdU635aeJwWsR8WP0u0I7KNUTJCXn/ivwKD/aqqwSRmp19POS/qogi8dtDSfv
 /y/76RKrcvdL1fSz9v8a5P36H5WgDFjb3pA6Qain/TDlLjKusMa3gYz/+3YlrIbzAXEt9+xKtRI
 eYaSe8UQZQ9wkPSVr9qOR12llGtFcneDREYbmJIJt6Txng/blgchRc/qxxfWpOacnU3D0uLH6Iq
 6UWuWDpFpa0mKpZMGym6+M/uVD9+7+9gNnRGmdNptciqX89gZkFM90qZtIWW7fZY2XOEap8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100116

On Tue, Jun 10, 2025 at 03:42:05PM +0300, Vladimir Zapolskiy wrote:
> On 6/10/25 14:11, Dmitry Baryshkov wrote:
> > On Tue, Jun 10, 2025 at 11:33:17AM +0300, Vladimir Zapolskiy wrote:
> > > Sort the entries of interconnect and interconnect-names lists in
> > > alphabetical order.
> > 
> > This looks like an ABI change. At least you should explain the reason
> > for the patch.
> 
> There was a number of comments and notes on the mailing list that
> any changes to dt bindings without users are acceptable, i.e. no
> users implies no ABI change.

It is still an ABI change, but the one which usually has a waiver. And
that's why it should be explained in the commit message.

> 
> Also it was used as a justification to accept dt binding documentation
> changes without the correspondent .dtsi changes, like in this particular
> case. So, I believe the room for fixes is still open.

Yes

> 
> > > 
> > > Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
> > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > > ---
> > > Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/
> > 
> 
> --
> Best wishes,
> Vladimir

-- 
With best wishes
Dmitry

