Return-Path: <linux-media+bounces-40784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F6B31E44
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 17:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 161C3B41F4D
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 15:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA04212549;
	Fri, 22 Aug 2025 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUpcF0lo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6628920FA9C
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755875636; cv=none; b=RPNtwZNdjqiSEPCs2ug2gKJSyr/45lNy50zNC1HoCRATJwi1lUhll1o1IKJiOUG0m9lsPGEJ6l6rGfqBMojaHfBDV0bownEBm9Jg5KDRlS+8SryqaJOJZoYR8amX0V5b5BxZa+Bss3RsimS2fhxSjEg4AltyqF6GUyGGvl7rJ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755875636; c=relaxed/simple;
	bh=eG/orwKFQd1AjY3A8QCa+7dXaRile+fE60M6k3sicdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGX7UzZK9LVMKphUJ6PjiliETEbve+1zbOXDjPDhfpkri1r7fxUeZ7HZf4yn+gZsnzTJhZks7WB5nWqmmmccHiTqgTjLdZ1Iq9rvbWkMVnLa2dW8d2cskJ2MVE4DktwjfeTMclB4GLSdpk7AbCItFm38KTDBHu1jAwwXHyHR0Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUpcF0lo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UJ4k024107
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 15:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btt2DyzNMiZ+hzGRt3lGD/YX
	b5NjsYZqPLvyhJlPzp8=; b=AUpcF0loBdg+2hN2wj1mTQszGXeQ5mgzuKDd9etU
	85AGUMVg1Dm7Afnh2OqxLo/0rljJTyq63lapDWjPA1xKeati3rbGhhguaeVWQ6M3
	+UK44FPqkpT9dqXN+NvYloX6Va6Gm2h35aJMHFbwk+hcm3ToNm/ruMrTJR3jmjrx
	Kv8dNervN8YgkPoIkpcq0mH4Zch+TdypeDsLJh3neu663JlMcwmJpQ5+8H+MqyJE
	6Z6dsuZdtyTIenbGnd98QU9xKxsO1f4rFfC9MJM7ehFbWkBzuZHkR9BYX70Pn5nt
	wYFbm/1/l3rSGvH8WQcSFqs4/uYAxZHC966EnDhyO2/wsA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ahqc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 15:13:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32505dbe21cso1299995a91.1
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 08:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875634; x=1756480434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btt2DyzNMiZ+hzGRt3lGD/YXb5NjsYZqPLvyhJlPzp8=;
        b=len5SPVsNDiAyDwcjHqKx1MYdysb8505vOihoPv+c0UZRKYDXL6C75IWDkHlMeVT5+
         gZ52njoCCq0RCgMmpGajBDMcLrEFFImvbtBzeSzQOJKmusPGzzAd4c2nPpEM3Zrf/D9r
         tFwAPc5PQkMcfXa3BPGBwoHTaYpSv+1DpIsG2oHcyTAfsrmdSNjrFkWUtv7/kEH898+T
         acVBgHczUIvqLsTrjU0LS3O84cEM8bFc5HO8a8ErDDvKEQISYM30O3YRolb+1bHefsAr
         kfD73ikUletEpIseNkoBbRIWLD4nq/333OiSiWsLXxX/5VikuYF5kM2fbPZVrg2nw6DI
         9jDw==
X-Forwarded-Encrypted: i=1; AJvYcCUSqxF6+gNzOUoA9QAIJNrZauyE1Movs3zJw+uMWU0kBCxK5/lCcCpO5HkrYlqnJoG1eDJMAiB9B0hgfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo/PCVoRGKGRUXFj97n66mu8eYxFdNxhBZf0iIc7AvmUeUQJRu
	8EyFvo8e8l4ZBRP3TrSk/ND3jndkkMftCURAq8uB0YDPhoiy681PtauejnnyuOTffW9LbNJZDiE
	OYh7c7NNkaczuM+UvRgeSfw2uHqkpbTsizksdyIHhGquaoiTFyl/q3l5fiAmiC69hIA==
X-Gm-Gg: ASbGnct0onS3GkqhEip+dLco4KSNslb/WszW6Xz64wRGXF4s6n1uKjGOUi4dikXd05X
	lI79HVadcq9MZHsS/drPtojLfdDikhRLvJZmbuw8bvXxDy53KjrhLdOZPmh0XoePRFC8ZpzWwTJ
	0DvK2BO530x1WyNRWn/03MRJLKlPjSjzIPfIvru7D5ydVrphYF5rTCMF0Tp8NSBF+wPFUBne2ak
	ihIqXNDycMDT9YmNVS9cgG1VdF08fGq2eeKvtW3L3m8jjpPSSoSkdnGYnhufk9gwpxObftYl4Yq
	w4i4C+fmMuqfuGqdaQrLqaAyZ5VbydtrByFQsxMYCFtSCe+2IFm8KXuH3iOOyJICviE=
X-Received: by 2002:a17:90a:d2c8:b0:31e:ff94:3fba with SMTP id 98e67ed59e1d1-32515ea1368mr4981997a91.24.1755875633776;
        Fri, 22 Aug 2025 08:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErVfxzrJPOTigg78RZW9N+FXdSqfUm7MGCIOMf3eK9WaXKtIbmqRfkb5E1AROeKKMcfEPdvA==
X-Received: by 2002:a17:90a:d2c8:b0:31e:ff94:3fba with SMTP id 98e67ed59e1d1-32515ea1368mr4981906a91.24.1755875632892;
        Fri, 22 Aug 2025 08:13:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f3d37c51sm2122053a91.5.2025.08.22.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:13:52 -0700 (PDT)
Date: Fri, 22 Aug 2025 20:43:46 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20250822151346.skwtsh5abr3tmrjz@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <e18ac460-dcbb-4ac0-9c5e-3aaadf3485fd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e18ac460-dcbb-4ac0-9c5e-3aaadf3485fd@kernel.org>
X-Proofpoint-ORIG-GUID: WBh5775wpB8HP-WhTfnZyHBViJK91QoG
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a88932 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=LBsFnih5B16vKGK3eWEA:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: WBh5775wpB8HP-WhTfnZyHBViJK91QoG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1+APho9XDyp9
 Con48Lobq6/NfGUliAhA/Al/pGGeTg2jAvqNdMAEE8z1qxkGMc18unPKkgzYSa6vhL9QdDRt7OC
 WhrB2Ua7Vj9siFP/ccmt7ST4UtfdJzlg1pd6KNGcmhnz9Y4Q+UAqw2VW2tH4fIP3GS44SYHvMHJ
 /ZGTpUg78efb2RsUU7qDs8+nmGES+dzLzp3sEJGAN7KK0egw+UfHDFKtwWDQrENm9Nt7CFBx2TF
 eAbz9pTTN7HQ/pjFywMa7BcTKiD72n7/p9uNHCkQFNtGNp2Z9JdX5B2hrTz5YW77XM6RDSeL8L+
 68HlutLSRZzukO78BTQPGt529bec0xOuxMuuIZC6sdOnlfntG364NMPkvgjqSOhZ+q9bNRbUpxT
 YJBqQINvjcx3MX1oIEjSXEzKomUD0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 10:45:50AM +0200, Krzysztof Kozlowski wrote:
> On 19/08/2025 18:54, Mukesh Ojha wrote:
> > +int iris_fw_init(struct iris_core *core)
> > +{
> > +	struct platform_device_info info;
> > +	struct iommu_domain *iommu_dom;
> > +	struct platform_device *pdev;
> > +	struct device_node *np;
> > +	int ret;
> > +
> > +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> 
> Undocumented ABI.
> 
> If you tested your DTS, you would notice warnings.

qcom,venus-common.yaml is documenting video-firmware and getting included in
Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha

