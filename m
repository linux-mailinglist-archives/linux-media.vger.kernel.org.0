Return-Path: <linux-media+bounces-32708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38422ABAE97
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 10:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F047C3AC33A
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 08:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3C320C005;
	Sun, 18 May 2025 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8AiQOaQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6962513D52F
	for <linux-media@vger.kernel.org>; Sun, 18 May 2025 08:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747555242; cv=none; b=kS81YoWofFK2UoeqrPPF/MfPumcwqWf9kTiGuedhgmG6SK3hfc0n9uTF81xzwDX2sHR3HCmiLsQUyIYs6kDZcfmsbk6XCp4pLiSQUoLg9L844LAsQJJ7z53jYkXU66vHP/MfS2sKSnsP9bDhoskkXMIg0rBu+b1zecj8+1MG/kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747555242; c=relaxed/simple;
	bh=eEpOAGltDfZQrcPF5EABRdNdezAR1P/s0r0PFrHNgxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0mRAZDQ8z6km3nv0mO4bNAsENYxoD8HMuvWWENwnLPxP7n30/0rsm4bXhHs+6MZjL2MdE4cg5uFCYDFUx1LXpkPM+ZChjy4XWro/aZkWr8KEJqZBuSGOakSu4ldkG3/J2vurjrxla/PzEthetk9+iiR2LRYvaY0vPw7/OyZ4s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8AiQOaQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I4MDWS000737
	for <linux-media@vger.kernel.org>; Sun, 18 May 2025 08:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M1hSROUXIIz884cqASZZtnpd
	DRy1hYWsqulvbnSF7qA=; b=S8AiQOaQ+pE5llTKK816AwTQwrikZRsMjbxfApB+
	eR7tEcghOsJ+FZuhw+P0+8AfonM8xnZAWctboybc8Ep1f2NNGrT0/f0vBj9BRqzX
	Z+QUX7kdNLNkh8fMmNd1+eIENl5jhC6x609GUSCgd52y4m40auKxpcKYeBzvoMb+
	grhZVoS9+8xM9RrIv3Xn7BS9lNDyZwUb1Ij5XwH7HvsTfL3a8UDc7zpqn/hG25O2
	T1DQOHYk8xSZoeC06hNn6oMEj0KSkMDBhSC6g2b59IhEUXGw40uP6txUwFDdeZlO
	nSWKowVBFtHunsDcUTo21VbPNeToMpYaG9OVX+lgfxxUfQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4hp93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 18 May 2025 08:00:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f6ea9b56c4so61538106d6.1
        for <linux-media@vger.kernel.org>; Sun, 18 May 2025 01:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747555239; x=1748160039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1hSROUXIIz884cqASZZtnpdDRy1hYWsqulvbnSF7qA=;
        b=OFIU63P4kuMbTTNuqaQLLZmo5yI9RN01KgdKZTnLYxpqQGH4/nassj5MBTQ0l831EQ
         3X/QVwu7pk2j+XIP7YmzNaPKmQp0Zu9Q8to4312qqiiFqXJkcax/9v193EYqQhf/OuOB
         X5QhvgfmgY1eC5BkeGo6e1h2fr7nvT6JPnvQetr98fQf8ZQEQ6xR4LaB06KvuhQm9ObL
         V0qwGwbxle3vwiwBC2TgXw2GZyidlRKSs+G9ZyQfYP069zdmvmhg2a0W2Qb68JCtTOmR
         APo1U1025BaBZbUu5r+nJa/TNab+UDNmWCCT5fXhrM28UN+cMVkboEwpV3scNujXgnoR
         5U5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTeS5Nvh0w/BcYnUgos87oNgkDnluxROe1kT+SO/ktnDGZDNBVQeN7qBbRGnTyW8ux8wD/i3GUy680wA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywot1xS5CWoTUY3pYim3PJ9Z1FvUUiTUtHajbtgOAXraWEs5U/b
	1X5FOo8KpzHQ6PfjX/I65irMUYxR4MPzlTob+SSCdDt18Ne+TxzzAxX4nAzDULng4WjEh9ojllL
	beDSx7hJWygTezCZbWK1bHKlueuUfPKS5TMnghWGMI+8D/PKAYEKjpP5n/wyIByx1Vw==
X-Gm-Gg: ASbGncv7iUr01RGNm5N+GfIBSp6tQlIHHQaYcsKkORbW8IpzZxmcDsNTgZ61lsK0sfd
	m251nZCY7wyG0Boz/yQAXbU4+7XfXU5muo76L0NLAiy/+WQJJm+UpgbNKnm/6ScXXt3viAhwDpv
	L/B0kuayv0E8xSZ5mhW7vTpweE7Hdza/aLQ20YIGC/dAIpLBFwWLlsvIV5PseJhE2uvENtN80i2
	OCMc+Bfly9MzFxdJW1YMNvlF+Pkzbu9pbEt5F+K+oa2HGDEeNqBbGY1oW/03nIsJH1KXh3kg1X0
	W5VHkgVas/ECGqxWawjByZWdV4WIwnghOF+Q9PWH+0lgddF+XBlXxr5ATnqenkddDqT+dRlJKag
	=
X-Received: by 2002:a05:6214:1244:b0:6e8:fde9:5d07 with SMTP id 6a1803df08f44-6f8b2d43931mr128485936d6.26.1747555239334;
        Sun, 18 May 2025 01:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7U6yVFqqgxWTJepkwkMTRStZXikQatyTxkBmj5oyJSp2W376ewY4h0spqmrjhxjC95bxVtQ==
X-Received: by 2002:a05:6214:1244:b0:6e8:fde9:5d07 with SMTP id 6a1803df08f44-6f8b2d43931mr128485546d6.26.1747555238986;
        Sun, 18 May 2025 01:00:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca0b9sm13615991fa.32.2025.05.18.01.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 01:00:38 -0700 (PDT)
Date: Sun, 18 May 2025 11:00:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: qcom: camss: Add qcs615 camss support
Message-ID: <dw37t3kefhxtzmygcdkdtl6nh733qbx6cpqmygaanbq7pg42b2@lutist5sdt2e>
References: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
 <20250518-qcs615_camss-v1-3-12723e26ea3e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518-qcs615_camss-v1-3-12723e26ea3e@quicinc.com>
X-Proofpoint-ORIG-GUID: n8mD9UCHkt_qWZCoDhLFeAzPTCkqiBl2
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682993a8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Zj0UxLc9_TXd3n-uCjcA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: n8mD9UCHkt_qWZCoDhLFeAzPTCkqiBl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA3NCBTYWx0ZWRfX0F1QOIstle/v
 VgocUamiu2rNVqzDoHV4SJiAuJ6jrIpD6vHOwKf906HSseqmuzFEu8hgo3bTxHYCF2ZJU95UYX0
 96sokVSTqnLwRtoRQdMh2qrTw1dgQIa0G+q3QUZigvadf6aYtULFeOLdn5sJNQgnllBaL02nlly
 sNm2v/uQ3ZWYi3z4LlOL+eScGMXzczS1r3wuwFqrN/VgABEnslxGgelmpsEE5PaQA1aBQAY0KLN
 qv4BrFTuUw/zVUBz3y/D3+oYCZtYXxLhgU118vpTHr2+6svIDVz+sfHjivbkVrhxQqWCi9GNusR
 JEYUfu74peHGEN93X3ZNxTxbJ6ClMgGcU3NFSMR/lvv8gn1F32EXAYYvAApkOkos/X/J69IeMJp
 w3d3RPjuqD+a8Y3POzSkyyjwSoTBpt7sCQUlLgnD6Ho9jA+qIa0nRYEJJRRLH4Pgig5JPWB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180074

On Sun, May 18, 2025 at 02:33:09PM +0800, Wenmeng Liu wrote:
> Populate CAMSS with qcs615 specific hooks.

QCS615

> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +
>  drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>  drivers/media/platform/qcom/camss/camss.c          | 196 +++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h          |   1 +
>  4 files changed, 204 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 3f3d875b8a74ee8f6585bebd29629bdb16eadb28..3b58b938ad419b6d482314e23b4f51aae5f8a59e 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -824,6 +824,7 @@ static bool csiphy_is_gen2(u32 version)
>  	bool ret = false;
>  
>  	switch (version) {
> +	case CAMSS_615:
>  	case CAMSS_7280:
>  	case CAMSS_8250:
>  	case CAMSS_8280XP:
> @@ -905,6 +906,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
>  	regs->offset = 0x800;
>  
>  	switch (csiphy->camss->res->version) {
> +	case CAMSS_615:
> +		regs->lane_regs = &lane_regs_qcs615[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcs615);
> +		break;
>  	case CAMSS_845:
>  		regs->lane_regs = &lane_regs_sdm845[0];
>  		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);

This definitely should be a part of the previous commit.


> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 63c0afee154a02194820016ccf554620d6521c8b..04e2359fccd5f61b27692caadf2855a1fde31ed9 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -77,6 +77,7 @@ enum pm_domain {
>  };
>  
>  enum camss_version {
> +	CAMSS_615,
>  	CAMSS_660,
>  	CAMSS_7280,
>  	CAMSS_8x16,

And, as a dependency, this chunk.

-- 
With best wishes
Dmitry

