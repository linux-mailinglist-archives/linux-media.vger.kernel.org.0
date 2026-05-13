Return-Path: <linux-media+bounces-61452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJvdJPyGBGr8LAIAu9opvQ
	(envelope-from <linux-media+bounces-61452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:13:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D52534C6A
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24A9C31914F0
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD15217659;
	Wed, 13 May 2026 13:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yazv6n5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/pGLdCI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B8218EB1
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680157; cv=none; b=cT0L5xDYgpu4JF5sMI93iXNUGckSc6P7HWfYoZrke8x+wKTaJYS7hE54Ye0wOjE4Q7fNOIQBzvRf3aGn7M/t8CjDbdPTwARa4RZtnqreF/bONt83p6OS3g/t/gnVNJSn72xj/pA+lVURN3Icj00d5iKT8NZX1yVhxXHbNdvYQq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680157; c=relaxed/simple;
	bh=jRxVsvYK08hJFPCU3r27mn2olm89N9iKJ+Bwl9hLev0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXV9ojWk2sVQDozm3SScm/RdS1SamsMgeLBv/NlwYOAlpKKqQijzO9wr37UchN8DpvEzzfkRoHtuk4p5M8NLo/ao9eskquq/qQH0KUg4ZB7/YGEruQUElcsYx1vgnVAbmwRtQ1dKOU3TDXGfnbUfs2HER+ModMx7W8MNRXEEhbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yazv6n5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/pGLdCI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAGSeg2321233
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4HsjvmVEDvo4Axfu4dOFUhmv
	OEIgZDUu9Iaidd4gHf8=; b=Yazv6n5eUZGwUjYncwcA8wT6ufqmJbEx9zFL8ghP
	xZ4cgTkxvbiMtkyY0n3m3+yixndIF1BNlFClOEsh/bwv9pjr1BpgyVSWfzvu3EEG
	0mvl1Ali57IffdSGV764p+ZB29wc8i4dG38AjPKhBYeYnKJEKe8Z90FnN9nd56qR
	z//S2QF0AgdCb/bS+cnbMrkrpXRpIVv3nzzOgqjI6qFEKQUfmGUpV76Hxmhilin+
	qZOwXXohHK0cXOx79V1GHVWKPdmsnk6SawU32+1c0YdflDKihKTLNAitLIRYtl9x
	2giJ7vrYPb/08YCeqbwsxXSMf/1UthJtcDKiiUk1ZPymhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgua784-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:49:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514a182b90dso52363801cf.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680153; x=1779284953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HsjvmVEDvo4Axfu4dOFUhmvOEIgZDUu9Iaidd4gHf8=;
        b=G/pGLdCI6LzrYLF6sDFqjo6vBXzDoJd5DmNIalM+YaafwY7xEkNPGJoD9bB/Dk+Tou
         TUXaynsrG1F+4ZSee8S1KLquV4m83DEatc9x5van/0YhhcS3V/FHG5c6flx3n2l2Z4Mv
         1PTuPwPWCONOkoQWReEBf26hPwmJj9EA3U6WhOjSwKo3O8nFP70dx6s9GNJqoIVIhS8d
         CQv3DH7DvkitlIE6FXtUN3H4G4fikLTytrid+iPuup7geR3p3cT/gTcxgurYBesccRoI
         9GNXnI6V2HsHl/AQuxPiSKaI+TzMFPvNCY+NpvVxcXw0OhW+wcGDq/VbAW3WtGwxKqk4
         kZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680153; x=1779284953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HsjvmVEDvo4Axfu4dOFUhmvOEIgZDUu9Iaidd4gHf8=;
        b=JBqJzSjZEFBGxAAKq60s2a135+VFkqBtNh6mN0IdoJ7cx7LtxYKg1//4lD2Fk50f7M
         pbH6cIII+7veSWal+HvHAA3OEwSztuECntANlvg7aSeOCjJ5O4p1cJq3LHK/yE2vuQEB
         Jw4yOZvRMgICGSHNU8B7kXR4t/AdUkCZMpBf7JODrkf+xP4x0zIzRwxz6jF7LhzdmQ5U
         nX7dV6Q5B1O+AA+b2rGdL1n5KzqQ8ZHken6XI+AE+7D6NSUnS9muimdcVJUIvIkPZiRK
         4x3ZBM+4rPTYzivqATl0p7EZVEipdlwx9u8tQup46b4E8SDbgDpANW0h8yK3IeQFB4fx
         lGzA==
X-Forwarded-Encrypted: i=1; AFNElJ+5GbF3AVL1XtJmFtc5Kzvz59no4b9cT71i+uSzOYAnFaaCMe/xchFnYhqoPvoqvQloZzpe6Rjbr9omsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypB9J8cuDvRtsTAvvPMRVm1OK7lhipxZxig41gRtFpbCkDuSrn
	AwklujR0HTJMO/5Ko9ZAvPwhIxXDvc3xTP0otCCOdFAD188r6lINYJoqYhmUix0fOrVNGlgzFDk
	X/8V8aJ1/yJ7UBa6/VPeL1Db/qRRVC2SPcO1wZHTc5/1TwGVs4AVdbArv0l87I5Xnjw==
X-Gm-Gg: Acq92OHZa1x9wFDsP04Cb5PRx83bmAmYjFVSy5tYIsQfxggGARn9XgV1iKGEi60F2Hy
	YjYsRpwXrPhxvrrHK9f/E5MXPp93lps/9BZE130k/TQ274aMhNDAa9QuRaPeHMUKMfppJdVmQZe
	70mdabfLKueXs4EZWXFTkFHcSsCo4hxpBNvUv7C4/Jw/wgYqQ1xH6n8DHDKombjO1FynzSuyPua
	UpVdtBQuKk/VLeZ5GEXO91SXd4IiJaAcS+Cj4t5lpD6/3mBnpGfZboc57gVW6lJAqv3wDBwcgcV
	DSieZA/URmQ+INYBPtrls9k15RwaP72sjM2eQZRP65a4zDkvf93rDWlv5WK3WcPVEe29HPljXtQ
	2qDW/K8c8wvuWr4wiHkVpZaIn/DHZYLwR7jDcxbSelBizIhkR0xxswmbsA0dmq/PDtqcbT1u+NI
	ZFpgSNNJnVOJY180P59Mkg8/Kh38ww9z8uZyA=
X-Received: by 2002:ac8:7f83:0:b0:50e:6139:492b with SMTP id d75a77b69052e-5162feba35dmr42576481cf.23.1778680152973;
        Wed, 13 May 2026 06:49:12 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:50e:6139:492b with SMTP id d75a77b69052e-5162feba35dmr42575781cf.23.1778680152434;
        Wed, 13 May 2026 06:49:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f625bd3bsm41952051fa.34.2026.05.13.06.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:49:11 -0700 (PDT)
Date: Wed, 13 May 2026 16:49:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 10/14] media: iris: Add power sequence for Glymur
Message-ID: <h2clkcgpr4uki3fq3kbdutsqc2h64hwf2ibtbrnjipilsnhk4u@w7645stdorq7>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-10-7fbb340c5dbd@oss.qualcomm.com>
 <jqe3ilzqzajuf67hvp7nw6mak36qyqu6dz2oiwtkf6zwiyclln@ydtyd7vkudm4>
 <67157e35-8c39-b06b-eb93-602930168f4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67157e35-8c39-b06b-eb93-602930168f4b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04815a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7I-VUM3uW_oGyASaGJ0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Va90x-i8SJ8rpX_1Cn2_5dp_YtpmQBDe
X-Proofpoint-ORIG-GUID: Va90x-i8SJ8rpX_1Cn2_5dp_YtpmQBDe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfXytd9e4J6jlLp
 1j1b+f0CGXbProCvMGj8mFdrqeKP30G9yw+tGxr574FQQALCs+OUUb04gV2gGrdZ0BAM1gxMdwZ
 9L50pSE0olZpaZ3PU2UyRtQFBDdA4CekPEIbSmXFfoteMWGH26rtDn4FnCrJbT5hwIIyDlRfCPj
 cjj+kfFvxfdNCwJwfsZzADUE0pjQM+UM/+a0VW0iMHqvgSj9XmOqCbWJYe9WTILadeBCMCdWErJ
 3L6xCZN3KZKTGVyQxyvMyGEN2phx3PjT8toCKuASLWejX+liwn+T/nLSFZk9D/ZW9K5KChzeZ+u
 fjHEPF5qOc2+2ThANRLsxplQjV4sVQv0BM4+HJdHduehK/PzsgTLrDzg1JQEKivUx0q0hDSsL9U
 3zl7490qrUrZwafWjgJ79rp56Q5cp0108j4op/mSVW9hA0oSBmTsXc6yClEtIen17dLbawlKNRR
 TxV8QeOuqgxMSG8Zw7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130142
X-Rspamd-Queue-Id: 27D52534C6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61452-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 09:42:01PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 2:24 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:59AM +0530, Vishnu Reddy wrote:
> >> Glymur has a secondary video codec core (vcodec1), equivalent to the
> >> primary core (vcodec0), but with independent power domains, clocks,
> >> and reset lines. Reuse the existing code wherever possible and add
> >> power sequence for vcodec1.
> >>
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  .../platform/qcom/iris/iris_platform_common.h      |   4 +
> >>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 141 ++++++++++++++++++++-
> >>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
> >>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
> >>  4 files changed, 154 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> index 7d59e6364e9d..8995136ad29e 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> @@ -61,6 +61,9 @@ enum platform_clk_type {
> >>  	IRIS_VPP0_HW_CLK,
> >>  	IRIS_VPP1_HW_CLK,
> >>  	IRIS_APV_HW_CLK,
> >> +	IRIS_AXI_VCODEC1_CLK,
> >> +	IRIS_VCODEC1_CLK,
> >> +	IRIS_VCODEC1_FREERUN_CLK,
> > I think I have asked the same question while reviewing some other code.
> > When seeing such enums my expectation would be that the set of clocks is
> > more or less generic, while the platform specifics should be
> > encapsulated in platform-specific code. Instead these lists keep on
> > growing to accomodate platform details.
> >
> > Can we stop that tradition? Adding a peculiarity of the platform should
> > not require touching of the generic code.
> >
> >>  };
> >>  
> >>  struct platform_clk_data {
> >> @@ -210,6 +213,7 @@ enum platform_pm_domain_type {
> >>  	IRIS_VPP0_HW_POWER_DOMAIN,
> >>  	IRIS_VPP1_HW_POWER_DOMAIN,
> >>  	IRIS_APV_HW_POWER_DOMAIN,
> >> +	IRIS_VCODEC1_POWER_DOMAIN,
> >>  };
> >>  
> >>  struct platform_pd_data {
> >> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> >> index 13fbb21c2182..ff90c375e805 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> >> @@ -22,9 +22,19 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
> >>  	u32 value, pwr_status;
> >>  
> >>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> >> -	pwr_status = value & BIT(1);
> >> +	pwr_status = value & VCODEC0_POWER_STATUS;
> >>  
> >> -	return pwr_status ? false : true;
> >> +	return !pwr_status;
> >> +}
> >> +
> >> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
> >> +{
> >> +	u32 value, pwr_status;
> >> +
> >> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> >> +	pwr_status = value & VCODEC1_POWER_STATUS;
> >> +
> >> +	return !pwr_status;
> > Add core as an argument to the function instead of c&p'ing it.
> 
> Ack, will pass the vcodecx_power_status bit to this function.

u32 core, please.

> 
> >>  }
> >>  
> >>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
> >> @@ -254,6 +264,124 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
> >>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
> >>  }
> >>  
> >> +static int iris_vpu36_power_on_hw1(struct iris_core *core)
> > Hmmm... And if 3.7 gets 4 cores, will we have 4 copies of the function?
> 
> As of now, none of the near upcoming targets introduce a significantly higher
> number of cores. If that changes in the future, we can revisit and optimize it
> then.

Okay....

-- 
With best wishes
Dmitry

