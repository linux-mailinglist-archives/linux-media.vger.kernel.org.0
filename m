Return-Path: <linux-media+bounces-57860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN/DNFX8zGnQZAYAu9opvQ
	(envelope-from <linux-media+bounces-57860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:07:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B87E379151
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7163A30580AE
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 11:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8865D40B6E9;
	Wed,  1 Apr 2026 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmHJDtXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zx2l5k1n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19113F87E6
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041295; cv=none; b=dLaKo4wWJjafI6hASfHrBLnflxvdtNInrNmIH7gpjifSXbbsOWVkGfqm4E8v8eSIXruxyJffXQH0/P+286qBTxR4Eoupo7L45sjdHEuc74JCW4blfsT7jhx3WY7Gfr0T2cc0la1Zvmrg1EAPlHdZJS3GItnU2mbhHrQiEwa3E2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041295; c=relaxed/simple;
	bh=Fa60T1J9NdG0M8J8bhvHiHZIs+TFsgPClwjQYrHu5nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2tLxcYQQYLHdzZy1xGoiS7KTnBRR4BiGZ6F/a5IfElOwjcvFXD0++t9UZjF4TFg2EU4S+BMQD3/5yYgRsEPs4CbCYvQohvAsSbiQwSML2JDn5lNo6LxvOjGUzopp7Ke9v+RaIaCKslHrRErWHpGM+oTS7yCCZH/EMJbv6ZyQGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmHJDtXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zx2l5k1n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63171daX1285924
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 11:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um9bWYbqbpemNVrExQ12MkVwZ+nPwCvsKWs7TNNv7x4=; b=YmHJDtXCinnPJ2gU
	A6y3Ab8rzxFvUbMoxOyNnpMuzCvBi2K12IXUQvKdZ/uRtmfRJlDThZabVWBqgKwS
	rx1g90D+TB9X8acBauwZJkxmnXZev/o9T2cd/D68HunUsq+6xE+ZUhiNc2Mdig25
	wXiUlJvGHTKwqd29H1OVn2Df6GnzaYuCwbqB+GhXXJD4tFc2y5epaTNky3w90Xkk
	pGfKWPed+lwJNExv5KqbpoXFc+sFysTrH4WSyJUVWJlRFwwDvOebar89AzRIg6R4
	FxR2Pu+5ZRX/S0JJAPJqmiayrnWa0HmUGntdnLmtQahVV/odLFNmt7GhWv18PDi8
	NVp2sA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3rvxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 11:01:29 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56ce653f759so5105236e0c.2
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775041289; x=1775646089; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Um9bWYbqbpemNVrExQ12MkVwZ+nPwCvsKWs7TNNv7x4=;
        b=Zx2l5k1n/lhGwiPgnMrytyHht4C16Me1D9q/+LMu/xtMuuVlHHyafpKNhPLuemdXuA
         RNTTn2JZPPTz9ZBlkZWT9rEp9n5hwTjxBotIG5RugnrFsbs9IyV00NQ/Y3nNi8spY4/c
         UbQSQWI/EKIl1qfsNXmK5prd/KupfWEJFDiQpCbFQie/wS9Zqdfm/tNP8XnTmiaoQOcR
         xdm3ITSLFSES/SpaalgJNqPGshwAG0ea7GbFi7LWBtDgxhhWNaP5+dgSAcotQM3V6t0S
         t7ziD+M8LWhTFxR1kzLUTIibyHXUMUNvu40z+fGyAedbIdVSxv+n+tNnC9hYqbQghVNa
         27ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775041289; x=1775646089;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Um9bWYbqbpemNVrExQ12MkVwZ+nPwCvsKWs7TNNv7x4=;
        b=ANeiwRkkUqiU7A8+iIwVZeBzN5RKmIaCmttgZ1usr0JcOUwj8MXKupqGN72e/E3w37
         hAwOASFDSStIvK5GEu8Zgfhzy+KCApw3Mw9OikgOpvRzNdIo5FA0j2Ygp/xiu+OjaLwR
         iS7mEuSh2ErariDbnBe7u465DKitLR8EAbXYHCOS4iNhU1JEXiZMmXK+q2QK5hEDHuVI
         nzMXywFkzjQnl2IFtexb+I3qqHGIxQeVqXpbpH6cSaK9VLH77GElwy8RBnjwuz8nV46w
         oLPX+FMnNwuFIA2jIdkaNayWbJD1u4VeOPbKsUSrJqQv7Z6cyBqhs2+2wYiHoKkcH6Kh
         UCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZYvzUYeiAcBc3xRU5IWgJvB3tD5wmslygneNIuSaWJTEOL4OJ8ZKtg3FNCP8PM5WQM/PU2aQC3/R/Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmu1C1bKKg++YM+YnH+lamDUjxqQu1U1zCE8/v3Nf4ibD16WwN
	e4NGWp1FMkOF7Xa4dNuFpXu8T4YnmMYnma1CALwnraU1v+Wwqz6HXt+6i08sbdJw8HdP7D5nK65
	exMcbQgnwQ3hx5s4GzxwZeP4FVoYO02IGz5FM75hCtoJDma4ULx0Jn+lIJy0N5AqIcA==
X-Gm-Gg: ATEYQzwrwZwvpmfYJK5EoaWXqDzbwO5fH4Aca6vXYwfb1+2NK9SjkM9rb+E18ShCOj4
	x0/8+w/bpRpE3zfyx5UpVb+/qWdrN05bywL2Zfx1yvUlWd9GoiY8/tvaD1ozb4opw9ly3BnngMu
	vRZUrh8ke3r//zHqBqKweI1xbF/GR+a2c62PMxUH80SJB0drcK6ouTvjokKzbQTQrKsTdXpYUGt
	iTwdhFIxIFbOb+F4SD844AQl9FlzovnJAZegfdWhBH7vCHhlFDR7870XWesGQtyZcATOCd0yeTu
	C7r5VAolWNLPEP6iEQrsMl/u+bUtRLlI8VZj8GQ2lPLzAK8iISmvw2hmxPyW3cHQg1hUtXQZlZx
	dSRBEqnT5MdSuF6VDXjoCkwelcM0uVeTW84xQlLyNNzhwNoJS/Ctef9MrsH3QFlj0fCmyvLw1Um
	VPt6L4kLriq5qbxlT8qIdy/H/e4l/eVJHulOU=
X-Received: by 2002:a05:6122:ca1:b0:56d:471b:c814 with SMTP id 71dfb90a1353d-56d8a817f69mr1167219e0c.1.1775041288922;
        Wed, 01 Apr 2026 04:01:28 -0700 (PDT)
X-Received: by 2002:a05:6122:ca1:b0:56d:471b:c814 with SMTP id 71dfb90a1353d-56d8a817f69mr1167104e0c.1.1775041288262;
        Wed, 01 Apr 2026 04:01:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2bc5f3377sm1384251e87.74.2026.04.01.04.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:01:25 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:01:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
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
Message-ID: <4fiyjcqt5smotudsfzyqrevxxnx3sf5grbgfluzkndbp2od6pq@vlyikcvl3xkb>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
 <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69ccfb09 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=sXGUrAVt7bPh_wKNbm8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: U6ZI8UO_x8Pm1VNSIK5OV_cIUF1_MY20
X-Proofpoint-GUID: U6ZI8UO_x8Pm1VNSIK5OV_cIUF1_MY20
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5OCBTYWx0ZWRfXwUjowbu35E3T
 IWASt/77kKdbkqOYwtVk7G8e6KLr8rXRUrNZLIHfvUe54VfT/trFq91r4R2IOWtlAgMowdU4d28
 JGq43UhFHcdPj5XBpU+e3joWEhOK2e6zxE4xxWEaPH2tRplbVlYpuFXbgzgddRS4IvOFH2ckS78
 0ezTwGXxiw8GTLtmdJJxer8WissFnGuD0zfv4D2qCGonvyJpVaLszCO1B2s9vZ256GbuKQnZWo/
 ng07ORx593IzvdWMHucUF0AMiyvEojwGN4AOeuuQbABYKxvjFxJ6AyxlIT6SS9FpyZ9cSyFXQaS
 yAKoxKUs0UB6zXHO1TFKMRsCN5uykaoET8Tht26asAiqZxjjImSSFJnuruF4W7GLKhBycKOhj05
 jzStIULhrHSt7l8FzrBZTAN14iuPO/cwNAzJxDBl7woWllVJtOpOO1iKgXfZv5rmy681thHc/jF
 ZkL4mr5vA42Yw68thig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010098
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57860-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B87E379151
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 12:46:01PM +0200, Ulf Hansson wrote:
> On Tue, 31 Mar 2026 at 20:46, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Mar 31, 2026 at 01:33:35PM +0200, Ulf Hansson wrote:
> > > On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
> > > <dikshita.agarwal@oss.qualcomm.com> wrote:
> > > >
> > > >
> > > >
> > > > On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> > > > >>
> > > > >>
> > > > >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> > > > >>> On SM8250 most of the video clocks are powered by the MMCX domain, while
> > > > >>> the PLL is powered on by the MX domain. Extend the driver to support
> > > > >>> scaling both power domains, while keeping compatibility with the
> > > > >>> existing DTs, which define only the MX domain.
> > > > >>>
> > > > >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> > > > >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > >>> ---
> > > > >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> > > > >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
> > > > >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> > > > >>>
> > > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > > >>> index df8e6bf9430e..aa71f7f53ee3 100644
> > > > >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > > >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > > >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
> > > > >>>
> > > > >>>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> > > > >>>
> > > > >>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
> > > > >>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
> > > > >>>
> > > > >>>  static const struct platform_clk_data sm8250_clk_table[] = {
> > > > >>>     {IRIS_AXI_CLK,  "iface"        },
> > > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > > > >>> index 7b612ad37e4f..74ec81e3d622 100644
> > > > >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > > > >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > > > >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
> > > > >>>             return ret;
> > > > >>>
> > > > >>>     ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> > > > >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> > > > >>> +   if (ret == -ENODEV &&
> > > > >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> > > > >>> +           iris_opp_pd_data.num_pd_names--;
> > > > >>> +           ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
> > > > >>> +                                            &core->opp_pmdomain_tbl);
> > > > >>> +   }
> > > > >>>     if (ret < 0)
> > > > >>>             return ret;
> > > > >>>
> > > > >>>
> > > > >>
> > > > >> Hitting below compilation error on latest kernel
> > > > >>
> > > > >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> > > > >> ‘iris_init_power_domains’:
> > > > >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
> > > > >> read-only member ‘num_pd_names’
> > > > >>    71 |                 iris_opp_pd_data.num_pd_names--;
> > > > >
> > > > > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > > > > dev_pm_domain_attach_data")
> > >
> > > The intent was for this patch to be part of v7.0-rc1, but I failed
> > > with my pull-request to Linus.
> > >
> > > Instead this will be part of v7.1-rc1, assuming everything goes as expected.
> > >
> > > Is it possible to drop/defer these changes until v7.2?
> >
> > It would be very sad.
> 
> Right.
> 
> Since it's my mistake, let me reconsider. If I rebase my branch and
> share the necessary commit through an immutable branch that you can
> pull in. Would that work for you?

I think that question goes to Vikash, Dikshita, Bryan and linux-media
maintainers.  Bryan, what is the plan for this patchset? Should Ulf
rebase the branch? Or is this patchset delayed for some other reasons?

-- 
With best wishes
Dmitry

