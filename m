Return-Path: <linux-media+bounces-38956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6848CB1C1C9
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 10:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CA2A18823A9
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 08:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD6621D3C9;
	Wed,  6 Aug 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ml1ZRBFQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C666E21CA1C
	for <linux-media@vger.kernel.org>; Wed,  6 Aug 2025 08:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754467466; cv=none; b=dpEoLB6drqDYhmJvEQwfupuXFEheRjSW0A8XOmgMXjW0sCcrouwcaZzzyCnn9s3Hs37lvanakkZYq1yTjTaEnRGucAdymyDoK81/Z8nIDpqlIGqguM+xtr7f9eiCK/eIJORCANE6/cxiX44bfI87eEd8KGQmjjKS3pLQFYGB+8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754467466; c=relaxed/simple;
	bh=do+Q4TBy90VHMwLyvqQnXrNgaertEGk/GAWekoVTcyQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iO7EJw6fNzKPRpvqonW/d7Pb+UV4eiS1AB+P1HeQqtj4Ao51Bh3nKib0Kh5k1hRnSlEpOpkjdN0M79XSzZ3ydqyJxGUlgQbpMrrARsLFdwg1zjxuUuyf+lsPHzGVgV6H+gETXAxogeNkk7N1T4yjq6XyG4LBtlc7fx9fM9Fdwpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ml1ZRBFQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765fxN4032054
	for <linux-media@vger.kernel.org>; Wed, 6 Aug 2025 08:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WI0JgqSLyH04MZ9ZNbOt2fQtDP48Bzia2Yj36myistY=; b=ml1ZRBFQjvXvxNRy
	n9Tl1YQHuqsKpRtEWlaq4OQN61vg2TvH/p1bai7XXBgzL49ZQe1mdaZnObzaJoKp
	wbnlr2XuPcXN9m9xAMgCSqu7rQn7glZLDYOLopbT5JFZq2wEfZJBvwCIgpXx2tex
	5skVJqKsdT5hK4idVDL7p65Ddo6jD5vbd06GVT/BbfH8RsfyqWzHapIzwY44AdSw
	rMmZvN1p8TTLWLqw9m/pHxcnQ9WTfLQVF0tWHuEjAV5oNmStEYupdB8FQkz9U9o8
	jPUIbe1IlQHxjyD7vCtnkywGTMXt7+tSsjvNLSuq+5tJY3kfItzj8lSG7Lrpghun
	yHBGQw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyba0vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 08:04:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70743a15d33so107268326d6.0
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 01:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754467463; x=1755072263;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WI0JgqSLyH04MZ9ZNbOt2fQtDP48Bzia2Yj36myistY=;
        b=fWvoDLLVTcB2DtUaOAmhzIvNFGD6NHPAtjDtbc7KthyXDfKeTXcSgQ0nddxTKiKUgH
         IA0m+slF2tFAft066FfGWtC1ClJCOPgqIK473tARffs+qdNwVsNbcKYGTYRIoC1cDxmD
         DaZXEadZCJc8q/sWBNyj/hePYCisSaWrQq+S7oKa3uEvA4Y/EgCO9wxjkcOT/JZFmyaI
         QJADzZ+8nYk99Kkpa1cTvyIbPrUPz8TH4CqPxY7WXPSvD5P510fNXb/NwCngrw/iQLeK
         5tIHkjO8ID4cRgRiWkV1RFbaIogFIyUQL8zzHhkyW162wOLHbDj2GcOS7sFenLK8M7vU
         S4dA==
X-Forwarded-Encrypted: i=1; AJvYcCUl33b5vIxDzwxzZM+NW1rFXZulityucRJ4SFSwNrrLiI1auHjbcH87+R+PT5B03tlMq5aP/w0WQ6+yUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzumDssBI8P0jthCPkr5p9aTlTUZLTO4ML6cb8VRRvp6L7ehFxM
	g6mHwwXRlO7qNHoJkQ8zikpCw+7VXpPf9gF+KUwyXeZuh/4a3EamCeBxg6POjw1GzETQDSad6Lp
	cVv62cSiXu3Rj2sP2h4ShPgWstOXCfHQdhVPHMbtEhFppYEUsuCKmFb9uCIDboUdccg==
X-Gm-Gg: ASbGncvnFV1QCAJa9UBstHPo8nOu4FpoYtYAPXnX0G3JMPcGYZNs0z1nfFl/VdBxNnw
	f+L15Q5ifb2LRdW+yIoP2+v9hi/TmoxOQMx33+atz8KDdf6MDa3d67W9ztmu4BHpCFrnOsEtD5e
	0KeAaLJbMNIMtTUgpWDe+SeGE8kvnkd0oTz8FVySsn3/j+tQc9d82Ye2I/i9zQjMDdyuPse/+Hh
	ugFTmbn+oKb8u3DLESLPxwZ+u1JTrvAWDYE4Xd4jyYHLzqMAQ0M2Nxb2sT6DE5OifRBqZqu7/t7
	HsFYlw12B3ILZ8YgPzyvofof2srA0s9tkXUsCxZAiO5UVHqd4RycCWI/40MA0Wv3OSOYWw==
X-Received: by 2002:ac8:5e52:0:b0:4ab:66d1:dcdd with SMTP id d75a77b69052e-4b091544948mr22883941cf.39.1754467462647;
        Wed, 06 Aug 2025 01:04:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtlSzPQGiiI/wu3WOY5X9QIs3aR/1fM/eIbQcYjPvFkmQJWYe04ZKBxf13+Ic9+phKzl0JQA==
X-Received: by 2002:ac8:5e52:0:b0:4ab:66d1:dcdd with SMTP id d75a77b69052e-4b091544948mr22883531cf.39.1754467462069;
        Wed, 06 Aug 2025 01:04:22 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaeeesm303179955e9.25.2025.08.06.01.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 01:04:21 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 6 Aug 2025 10:04:20 +0200
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJMMhIqNupwPjCN+@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX+xXtKWBW8QjB
 gfMycw89EnQgF2pUwiEyGtXqOBNKR5nr8ksvSAROtmSHoKpVLZ1C+8apEtprjbOIOqbJPT4cL47
 OmDxNP4vOL1QeOFbaknUQZmuVERAiHaKC2ngq9ZXH+/l34gcXWQv4PMKNgobvQD5x5Ux/H7m7ID
 xIizR0IEYQmXblDR+ij/2n0W/Latao6GeH0y+BWYUeWWrYpfacEUHlCnPLm85CTsX6onNjlRHc1
 fsgqtraCveWg5Jf5MSL20H5a3YEcpleCd2v8MIqmojzFnfGoWkipK7GtcpkKRitbATc5vMwAMXq
 lw32IGcImXaP6kp8jW0Nk+3IbIl2SvSc3rtpnso6NDkw3mdTwsPB9NhNseOkEDLnxhKtTbZhHlz
 +pQPnOPW
X-Proofpoint-GUID: M3hX_rwpPLCcQk8RX7f0TtA6MZFvH1dQ
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=68930c87 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=RNsuWQFUNzCQQpSZkWYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: M3hX_rwpPLCcQk8RX7f0TtA6MZFvH1dQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 06/08/25 04:37:05, Dmitry Baryshkov wrote:
> On Tue, Aug 05, 2025 at 01:27:34PM +0200, Jorge Ramirez wrote:
> > On 05/08/25 12:44:23, Jorge Ramirez wrote:
> > > On 05/08/25 13:04:50, Dmitry Baryshkov wrote:
> > > > On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
> > > > > Add a qcm2290 compatible binding to the Cenus core.
> > > > > 
> > > > > The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> > > > > encode at 1280x720 (HD).
> > > > > 
> > > > > The driver is not available to firmware versions below 6.0.55 due to an
> > > > > internal requirement for secure buffers.
> > > > > 
> > > > > The bandwidth tables incorporate a conservative safety margin to ensure
> > > > > stability under peak DDR and interconnect load conditions.
> > > > > 
> > > > > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > > Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > > > ---
> > > > >  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
> > > > >  1 file changed, 50 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > > > > index adc38fbc9d79..753a16f53622 100644
> > > > > --- a/drivers/media/platform/qcom/venus/core.c
> > > > > +++ b/drivers/media/platform/qcom/venus/core.c
> > > > > @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
> > > > >  	.enc_nodename = "video-encoder",
> > > > >  };
> > > > >  
> > > > > +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> > > > > +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> > > > > +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> > > > > +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> > > > > +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> > > > > +};
> > > > > +
> > > > > +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> > > > > +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> > > > > +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> > > > > +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> > > > > +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> > > > > +};
> > > > > +
> > > > > +static const struct firmware_version min_fw = {
> > > > > +	.major = 6, .minor = 0, .rev = 55,
> > > > > +};
> > > > 
> > > > This will make venus driver error out with the firmware which is
> > > > available in Debian trixie (and possibly other distributions). If I
> > > > remember correctly, the driver can work with that firmware with the
> > > > limited functionality. Can we please support that instead of erroring
> > > > out completely?
> > > 
> > > yes, in V7 I did implement this functionality plus a fix for EOS
> > > handling (broken in pre 6.0.55 firmwares).
> > 
> > just re-reading your note, in case this was not clear, the _current_
> > driver upstream will never work with the current firmware if that is
> > what you were thinking (it would need v7 of this series to enable video
> > decoding).
> 
> I'd really prefer if we could support firmware that is present in Debian
> trixie and that has been upstreamed more than a year ago.


I share your view — which is why I put the effort into v7 — but I also
understand that maintaining the extra code and EOS workaround for
decoding needs to be justifiable. So I chose to align with the
maintainers' perspective on this and removed it on v8 (partially also
because I wanted to unblock the current EOS discussion).

At this point, I have v9 ready based on v8, addressing the latest round
of comments. However, if we need to revert to the features in v7, it
will require reworking a significant amount of code.

To avoid going in circles, I’d appreciate some clarity on the direction
from Vikash, Bryan, and Dkishita:

ok to post v9 based on v8 or should I bring back v7 support (decoding)
for firmwares before 6.0.55?


