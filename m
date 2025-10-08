Return-Path: <linux-media+bounces-44011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE8FBC66E2
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 21:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 68CE3350A82
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 19:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0142C158E;
	Wed,  8 Oct 2025 19:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS/+3fj3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB2916F288
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 19:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759950659; cv=none; b=n7ZKCY2nVjXhFFlUD95INpKKgFun8aYYfbexJYleKkOjg9rVLm6EJwT06L3xui4lrrW4WlpM4wSdpWsEKkW6/43jnoliCT4nopEDUyTx7PB5QYjYHssBhTrrj25rHtyvhquGpJcO9yW6bBFSpTrWRnGz6sFopVinoallBZdVAVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759950659; c=relaxed/simple;
	bh=3393mM6j+zRP6aM0V23h5dXXACKdbdldLNfjY/xfisg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2xunwCQ3xqYYe5hltD0YT+qldmUrIaxZ9v+9PEZA1hi6lmcKdd9ni5ip1nP9IoEj1fRe+MxJC5R8aIQgHAyB/Muzry7TEORAOSyime+bZLqXRYKdu9HqTtwSsREHm9qyOGfzgMog0UoxwXH12BkO5HiP5kbRdM/KAdHDkYtwSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS/+3fj3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5HVJ029165
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 19:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mzh8Mrx9XBniXDY+QCxqv+ig
	jEo2apLpJTr9CSk/4oQ=; b=TS/+3fj39ikimruvs9n7Tjc/boB6Pc6NpdraOeml
	nvljvfpRtK0Y6RST7K7uELbx47tB3LpsFtEQNHlOm+gdE5+m3zyBy23rOo7F3MKQ
	SjJZp9Unh+k/7RkCCdseMKLwl7CXXsEUCeD5K4jB1yC8fGDpVX7AykMKErSeGkBk
	bMROR3CZQuezSRlswcV79uxyvy411/k2DeqN4VGQIiAzvnxhsegFygpcPojmUUqA
	cwKqwlRS/+EFtJWQF/exXMXrh9uPcDzkjN3PI4Ar8Rcr1dEBi+1iPDHAZ+F4cXpn
	OECcvPNZLaQ1Ci0ouq2BO8grVpUOBs6lc6hUD9c1Yn/Ykg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sgbhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 19:10:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78e30eaca8eso13038106d6.2
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 12:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759950656; x=1760555456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mzh8Mrx9XBniXDY+QCxqv+igjEo2apLpJTr9CSk/4oQ=;
        b=wJKdrOPFsTdcmWdu1ToBuyWZUdS1n7uoitGN6rtj88d5+Pjo8ixVcvre4HIl/6PMHS
         AooMbaQZiKaCP9SzxhQAo7ZKUtd6NLA5yRykyFbRXhhS/lFscgbyKtOz7nZx17GvNjVG
         R0fuW4opHkRUhdqd5/NqNZJYdkxH20cahXPQcDKF41opTf7r7ljpoDpj303e7mCcOHYQ
         wolWDynDONKbbj+0KO49M4dzcgNsCB5ap8KdsTibowJTsFMumKq+tPW7EfSvQggJXWg8
         NJRlX+ewOg6YWm12GYnlVsji2oI7TVetpcggx+Qx5E1GF5PhwWBgycScNiugj+WRl6xz
         LpCg==
X-Forwarded-Encrypted: i=1; AJvYcCWvbl+ORTHdLaaPoJceESRDBojjgSyizWFfca3++EQ/up24CbZKKVerComrHIo3qgbCu6sUWmN5DonVzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpCOfTomd66Jc/4vOBAex7XLPzGC0Gh8fEFTtiscUERC5aE3JU
	bK8aFmZmTO/PCWHf815qeZqwU9gPAZxBrL97X+IItyI8o+LQUDv1jHaaWe+8MNG7hrB14Jt7F1/
	KVAAaK8BWoaSbY0/76XjYAbEw++4RL3Tg3vioi/sQowpYhKlb6gLNQ9QjVk21/SdXOw==
X-Gm-Gg: ASbGncul6FbT/I3uxnmechCpFKZd09S4tONQkozgy2fQgrt4RBgRQ++9HxVpdgmRLEX
	spcvtgsXBzGgpb50NK4Cr2zncWXCNadk8pW22EBicVE6D7f8VFlS1bPR/J9X/kDvyyBNaiqHnzq
	ruLL0Jc7va7IDdK/znDsxB4B+C0eFuKK3udREQyRQ7EQLReBt+y2+6Izdoy8QsCCxwzGnGRWsU+
	xseDIYTRV+XoJaRtXY9Vemw6Qgm6vupyIIlKS6Dqp7Z80qpBjuXRhyC8iekUacYD8Dfmkvw+seY
	IKyLEkpTv+C2CQnMMjb34HgUpwJQVbbFyKUA7+mwUmu8lfznQzydZA/GXwxI0mIs6o8b5lCe55O
	MZJbO/pWEApLQQLM65XM+z0qDwXs0TfNcbVojCDdv4lv2qaI6DU5ac02cDQ==
X-Received: by 2002:ac8:7d41:0:b0:4b7:9abe:e1e4 with SMTP id d75a77b69052e-4e6ead8011emr63168501cf.82.1759950656057;
        Wed, 08 Oct 2025 12:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNjZ8q/pme0xqe30pUUGYIGQ12Gl+haC3BRzE9Uf6qMFoFnkdGOaRBmsKs07f1ZOvC8HGxuA==
X-Received: by 2002:ac8:7d41:0:b0:4b7:9abe:e1e4 with SMTP id d75a77b69052e-4e6ead8011emr63168031cf.82.1759950655543;
        Wed, 08 Oct 2025 12:10:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907aeb3b15sm260834e87.117.2025.10.08.12.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:10:54 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:10:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] media: iris: stop encoding PIPE value into fw_caps
Message-ID: <p2kbhv5ybdqethvwspupezeivrdpqzk5cdwmw3cwurga4mo6wa@34yu2us322ux>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-4-def050ba5e1f@oss.qualcomm.com>
 <d9b6ed42-d70f-46d2-a0c6-a98df4b46607@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9b6ed42-d70f-46d2-a0c6-a98df4b46607@oss.qualcomm.com>
X-Proofpoint-GUID: mIIJZzOXzjTAuu_N5_hQl5niCN46tIhw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6filKQPtDvlv
 F/gizaOzo4ePAkNJXwAII54yjbY9MyyHPSliHGyzTnrz1m9p7pqf5BfsNJSLogeL0FDJgvR3L5e
 1A2YYtEDC6RRENBCohBugqYPgPiFnOSZx3yaH40yBv3Mnybcnf0P33CiZvJeXSm2eWxM21NtK2O
 0MQRC3EArZTCS/ZPL4m0z0YO5sCspuS0k69YW1xaIcmoZY2z4h2xlLmyt653GstNPqAa/9aWBss
 dg3WKFGQxEfwcbwl7BSrQzycuU26cYSC43XVik6O/0m5g7tkeXKKUSkOYhPvLcQU+KXMPFab4Gk
 1N+QXB5774H9d7S3DNdtTk5QwBcGrBzmN/Qw0Bb7HEJjvoWftXaOGOBRAgCTAVqkuVh93Wp9IzD
 yUzbYcL82i7zWo68VP2Rl3rcoHF3hg==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e6b741 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=13i--0rwG8f77gcSRFgA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: mIIJZzOXzjTAuu_N5_hQl5niCN46tIhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 10:03:49AM +0200, Konrad Dybcio wrote:
> On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> > The value of the PIPE property depends on the number of pipes available
> > on the platform and is frequently the only difference between several
> > fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> > iris_platform_data rather than hardcoding the value into the fw_cap.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_ctrls.c            | 6 +++++-
> >  drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
> >  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
> >  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
> >  4 files changed, 11 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> > index 0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38..8db3fa222bdb92a7ffff3dfe62d33f16c0550757 100644
> > --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> > +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> > @@ -318,7 +318,11 @@ void iris_session_init_caps(struct iris_core *core)
> >  			continue;
> >  
> >  		core->inst_fw_caps_dec[cap_id].idx = i;
> > -		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> > +		if (cap_id == PIPE)
> > +			core->inst_fw_caps_dec[cap_id].value =
> > +				core->iris_platform_data->num_vpp_pipe;
> > +		else
> > +			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> 
> I really hope this if-else won't grow in the future

It really means that PIPE and several other caps should be converted to
explicit code sequences. I think, only V4L2 controls should be a part of
the caps array. Everything else should eventually migrate out. But it's
not a subject of this patch.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry

