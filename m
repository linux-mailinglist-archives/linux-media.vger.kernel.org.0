Return-Path: <linux-media+bounces-53024-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOQ9Eo8LlWmqKQIAu9opvQ
	(envelope-from <linux-media+bounces-53024-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 01:45:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E0D1525F5
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 01:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16718302A55F
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 00:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CC7273D9F;
	Wed, 18 Feb 2026 00:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MehId1me";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yz64demN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C93261B80
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 00:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771375497; cv=none; b=UBEOVeYDAtJFYFskHfQRAQm13fC6sLViCBrD/+A9xd1zoOH42p8jpm02CuLpQa/gMzkl7Eehf5sBqcuTO1LzkVPaOMNHjZA9YhRpdgxWLLUhazT0BcFlSd/Ni/Qioyj9T/bzu5FsGfjagH5vk/AR3jWz7CgnAv5SJIShY1hdJqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771375497; c=relaxed/simple;
	bh=KmKzUkSj7/o8XNJvVDn3KdduciP7Cki6QqteHDBEF3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yzn7sbdhZRyakxEvfHy8vZy7C1IOD2ZQYCFQLeLax1U/2dYMWNfIInaCwgKgoQePW+b5f0Sc8SqexUrSj/+nZdiQfCt1qC3is/ig/v6S9+ImmvPiDAykm/30YynXslU36zSs1h8NG6uohYl0YaLEmDvUrDcwYZtsmbXFoINey9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MehId1me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yz64demN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HFUGRa2319918
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 00:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MDILxvRtKcp720/UrtSTDBg6
	/HJjHwoeZ4/0fsSNcL8=; b=MehId1mePzlN7KBHLwUFoqLPqxbNclcPWhxpiS+G
	b9tLOO2g9J2tgOZRUMgO6xTrVYrwCZLBu0r8+nynHO/1wk3YTqvtONu++sB/WfCz
	KhVY0YHBJPcf7txj+z5UyzxUPSUqEUtsEwSqNKSlyFs7eCwc9SYa2xdX2yd0rn0u
	um8w4X/VLXxX/go52+7FUFYnkdYsySY57k8xBmLhhLIC4wUfI1Mzuu8U3skBr1iI
	qWWZZwULTsUfiUCnokC6E5P1z+epF+N3JoZBLs+4uXn/SxpgxhZh70YubHahkRYg
	arwVbGom30ZUJ5ZYmOdEhG/Ly2FoZF2KDxj7e08BR99JxQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccu1esnf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 00:44:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70fadd9a3so3952362385a.0
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 16:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771375494; x=1771980294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MDILxvRtKcp720/UrtSTDBg6/HJjHwoeZ4/0fsSNcL8=;
        b=Yz64demNCru+oT/goPjD2AvQrNq1OqWql7djJ6tewQHpHXBnrCsrjo5m4NLkEjxZUI
         cNSR6HVyfpeVv3dNQV4A02viLq0BH7w6+LK8uIa4x6aWKDb83kxUkwJcQ2B1mwEVEIHQ
         yNvqKSHkawZ69FZv+Lh8oDS0czDoKIWmueDMyTRbJA1/JUD94Xaq6iJVTFseTlepCBgy
         1JAz+fT8xdTL90Aetd5qI7XIrKaO5BazLYb5NI2XiNurRII2gbtVIg6NIzZDbxj5LePV
         NMJETQklDQNTPcIUY4yRRF48ybwFu3ndPkqcddBymZVLbYurh1ZttqDeHAAClDIQGc0q
         mbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771375494; x=1771980294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDILxvRtKcp720/UrtSTDBg6/HJjHwoeZ4/0fsSNcL8=;
        b=IkEdqFyklsZziXvGblT1aR9WBBlKqaAd4GdFvQpiD7fIEpYi5aPPj5H4CjuJylP8AM
         daf086nMgmlGR8AyVEz9JoNA7YMGTerBd9M/BGASFFVVwPX31qA5Rn3l59QZEfPB9vfI
         qS84KR5MnbvgO4rZpZUUZrGIRpGweyMlM6JD+H5voMNbodfb/eBvJ5f/YF8PprSxC1wN
         uXa5aPevtyypB0Vxc0xuITzc/x8wL4wki+U2mqeYAvQlQz83C4GeSpZVEpN8Hk1Tr15m
         4z6dKJ70rE2dybDqctBhKh+xxALsPZFx3ItaJkU8EJbXBAqy/H3hDyKJF4kysi+wn9BW
         waaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz8pWa17x3qqhvB+2dw+ois3mUbCB5UAyjGfYXg9D93iXIvrSiI8N62OuJio5fYI6LWrLnifO+GT1HCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg/SpkG6rwyzaw5D80v1b3r9lCVl8/ER1UzyEu9wNB1UljfRQI
	JaHXF8XsJFLN51/26jJ8vj63j8L8YHI1fIxovlpqY2GF9NeYVjjtU/3FnHQ8SMQN16BPm/a7I7g
	I6pxkS6yiCh/3mSMWo/WoN+03AT27LQqFtwbyqmaNvBNwpdQzxQ/QQo7bVuMqo3Cu2w==
X-Gm-Gg: AZuq6aLveyEJ1V2eREATmMFUsQW8rJ20mjwgeVtglfKoyKDrIvCApO/fVzlNr8aDelZ
	5Jn3d1A6e62ysDSVbwe1e3xzxxGrqa1lrUBa9UEAwa7TM5Iu5WT2KHoNF5ptxSr2VHoQKt9MX5W
	xQXKxrS/5ABCb9lLIV8doBrrxdNyRPGWodJiTzUQjOfSt1ILNqzjxbuOajk5WPjrK4WYmhS5EXv
	dHpCTD6HKIYGd/KsdgW8RtPx8po75D1nb/45TWnjMWujJoEFpIekBeziqHdJqAs+EKUhC4blji6
	OdpOIrCOLuylLrJ4yMLcMHkW71Qj3X+x6RFPAnefRSWkBr1mIelwFXayoPpimaXzLITdvJ0gO5P
	ExvcJRs8bQbtTDYHQ9cfduDY1mSnKUZyBtb2LJQdcQTDoP5Iml0y5T1+S/b1yVw1cvEdZpS6fu7
	NcKHJpv2PGf/aZdAtMP/adRSaB8Cs3UWBhaBo=
X-Received: by 2002:a05:620a:4607:b0:8c7:176b:ebbe with SMTP id af79cd13be357-8cb4c014765mr1607894185a.57.1771375494355;
        Tue, 17 Feb 2026 16:44:54 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:8c7:176b:ebbe with SMTP id af79cd13be357-8cb4c014765mr1607890785a.57.1771375493872;
        Tue, 17 Feb 2026 16:44:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5976sm40285091fa.27.2026.02.17.16.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 16:44:52 -0800 (PST)
Date: Wed, 18 Feb 2026 02:44:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
Message-ID: <pl7gyocwutgt4ftfjql7ipmsvvsje3jkzi62gnostcxartcb5d@trrdjswrldnv>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
 <5dd7834b-2e9c-4865-af6f-c362aa0c8287@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dd7834b-2e9c-4865-af6f-c362aa0c8287@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LfsxKzfi c=1 sm=1 tr=0 ts=69950b86 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=UiVfME4oCffaLAUF7oQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Vt01i6-TG1QHB4pynaOdVCxcxptrNWyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDAwNCBTYWx0ZWRfX1ZVB1a7ITTte
 +CDi9FpqVMYW0fP3OpbKReD6WZM/YZpa7qiv1AjVOzWYS3RreV9KsMYEitOA8s4lvBWXk3tGmkg
 V7bMlUw+VTTrle5JMIq46tVhTe8tgQzCUHAkcVKZpG20W4k7+/DPYiUsTsmrbMFlU4nfhMKc56V
 nTYdC6es8XkCsDxKR0K2IrjrsxcpV1pKmhpR9Wxfd3IbIDsG+dV+t+qaTIqkxA30NTMDVcn9yTv
 Lp5U/Fe1fkaHQ8Ra0ocS1Jlv+QcpxHSmk/rqcViG5Dk68RppMJVugjHG7TJDBHw9yYe+eZ+2Onj
 6Ti8wEoLUVu2qJHTn0AYe6qCWG8slBowbID+fkaBfvR2Ia8//MlRfqw/MUpsEjHCG34ihvn6W/J
 kkTmPpakZ1frjUO1US7zTdmgK7UZ2kOsQxNQdMXrT9/ld5wxALoJP+1j/J2d2/hSOs30C0LdioL
 KDOaiU7xll/F2/D1N/Q==
X-Proofpoint-ORIG-GUID: Vt01i6-TG1QHB4pynaOdVCxcxptrNWyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53024-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3E0D1525F5
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:55:41AM +0100, Konrad Dybcio wrote:
> On 1/25/26 12:30 PM, Dmitry Baryshkov wrote:
> > Currently the database stores macrotile_mode in the data. However it
> > can be derived from the rest of the data: it should be used for UBWC
> > encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).
> > 
> > The ubwc_bank_spread field seems to be based on the impreside data we
> > had for the MDSS and DPU programming. In some cases UBWC engine inside
> > the display controller doesn't need to program it, although bank spread
> > is to be enabled.
> > 
> > Bank swizzle is also currently stored as is, but it is almost standard
> > (banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
> > being Lemans (it uses only bank 3).
> > 
> > Add helpers returning values from the config for now. They will be
> > rewritten later, in a separate series, but having the helper now
> > simplifies refacroring the code later.
> > 
> > Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> > index 5bdeca18d54d..f5d0e2341261 100644
> > --- a/include/linux/soc/qcom/ubwc.h
> > +++ b/include/linux/soc/qcom/ubwc.h
> > @@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
> >  		 cfg->ubwc_dec_version == UBWC_3_0);
> >  }
> >  
> > +static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
> 
> Should we rename this to something like "qcom_ubwc_macrotile_mode_8ch()"?

I'd rather land it as is (and maybe add a comment).

> 
> Konrad

-- 
With best wishes
Dmitry

