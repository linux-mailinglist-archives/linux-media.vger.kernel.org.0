Return-Path: <linux-media+bounces-50817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0A3D283FF
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 20:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 256CF30A59B9
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 19:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5187330DED7;
	Thu, 15 Jan 2026 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mwha+xoa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOMlZL6b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346F32DCF67
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 19:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768506482; cv=none; b=NlXkV6e13mGXYN1DDywEILrJzgYzkyyo2qT14jIFGKVxtkGT3m7eXu/VC+mmOpiB2xjw3oD2/CkOEug1RzRUz4rzRDvtt0loH9hXeIS5NMgSysXkZ6meIrCWczlpmqjS5/rEZC0Zoku4C4Va92iNDPEzWxs3/9QJiQCs542+2Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768506482; c=relaxed/simple;
	bh=TgIWc48LTvO5lBzEn/2pVndxW6zGnATBm6RpgqO4/c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNLrSS78ZZGXdeG5tNs6f5NdaiSoaRT/nHA1BG5fGA6qLhNcwGZSgSqUsL86Ko8Y0y3WYCViq5d/gpJuZYWvxFMs3ji2wGrqj1VwBUOBTvkcap83LYYS+OWkdi6P2tZmbG1kAfSPDM9M3VwfihfwTU7sQUNdNYTdTtR7oYv58IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mwha+xoa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOMlZL6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYI2W2174630
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 19:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NkyDR/m5EpS74yQYHcy322av6+IMR4+hP+OkY+2fAn4=; b=Mwha+xoa9x5N2z7O
	FP4SUPTYBoztW1LUJpSpRAibflBWC2qhP0YuV8ceWGQpeqaEFLOSpT9+w2bb4Qzu
	aCuFPVXt8XCEcat6MZC+OSibMa5hO1x5cFhKxu3NV0/0CAyzC1Q7ebmwqCs4Ih8d
	vtTdKiMTELxhaaVd5iE6fYpL+kwYhF7WULeti/9+iXJuK1DLl2e3reVzOuJ5Y5GE
	FUiCjnWXCbm6ko6U2v0PXUn5+noU0G3rLKDi/YikmHRYIpdYZc81NMyXe9kaBvap
	cfrG4Z0O5N2KTM/ka+8rGs+IG+J2p85b3aRx08nwraT2m6nKIjJ+RaB20nh+URUJ
	+8jPqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh90u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 19:48:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bc4493d315so367316185a.1
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 11:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768506479; x=1769111279; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NkyDR/m5EpS74yQYHcy322av6+IMR4+hP+OkY+2fAn4=;
        b=cOMlZL6bZ9+ZYYFjyVVktTUTaq2eO8kMTjBBfYTaaCvDsHi5CJDfkYE7wzJLtHSbLj
         onfwFeHJHNanbjA0hNaHoiMIrv1yWpd9rlW7Cxd4/cxE/DG3ACGim2Z2NfU/t4eCXOPS
         /mUv3H/6VE7VOxp2uc4WuvJt+fcYi3ivSjE7JCDFpPUo3S8QLUmheLcKMRvNQzYUU/cM
         B0Mqc/XDxiXb6OcDlZuwJcKzne4nEJrCIy3velMNfkUtRlHeBIIEHTKUPCBl6cG5w47n
         1eMyMzRphT+keXowk1n+gOSXuBNPPhtzLH9WzT2upBm9WBT1szGsKxZ6SbB+GUh4dbwY
         jhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768506479; x=1769111279;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NkyDR/m5EpS74yQYHcy322av6+IMR4+hP+OkY+2fAn4=;
        b=lFiTYTw1znPlaDYqlzuK8SymEvrcsyCUKwLjpoVvugRBGWvEB+hV4dVvm1H+4sCcso
         4zHlwyzDcxiHJpOErxUag/xniaIXWxRQ606IHm4Qd5GbTbHzdgO1mzYMWT/lqygO4f9L
         oOirm3SMVX+13OKrsT1sK/bm/IMHtf9uw1ydHtnRhiXKRYhoSBmFj7uGjzZgh++YLkBw
         OZpaw04KDJlDndR6SQrJvVpXlP/9TqzN6L+vXhKBMWICHEwwe2HetazyxlQ1mPgcH2mr
         mZBdKDFfpEOvXzdUaWxGuvc/sQ3PIEvVY0RlEeXE3bP7Ze/H/GnGgK589FYBaPADHxcZ
         GOfw==
X-Forwarded-Encrypted: i=1; AJvYcCX9Yjs3nGMDUi0AO8wpKtWUToRL46cMqITi0cdnINcq7WDKPU0/ENMqcEr3rC/KnqkVoSkvCWr8pyMDPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0BfBjU7hlJC4Tm7tZcpKXYNb3YSxgf4Fa27Gem+U/3bfLtcF
	wNRtVzQ8Qz40Fur3ESE97fTymKfrPvsPs6exyKicMfA5kiPUyYDcSBPxyNGJq2EjtVeWNbHvbeL
	AukyXfzuBccNglp2DSTZYH6yJbR5pTPYvcF2CvAAz+NZaYQzfLG0aUgobHP224zmkow==
X-Gm-Gg: AY/fxX7fFUMOdoJeFUJYMVmhXzSkBvpVMNwJAQRGZn8umDFbxjuSCyeq76Mxg+gpely
	m7nJCJTAwBq5NC2JZ9NsC9SrApRgE+KupgQnuL4+Ykd5hWKJzTBVvRMXeCfPffPA6A/yxD90zKg
	hR8EHhEDGapAiVCNWll0XDmd3wm2kkqdxAZHCtfzjqeLKvkke65ZgeLoDJENWlmUniZ7hcNyqOW
	27FRpmKmo7+Yecm75246bzD3WBDLOCuFaf+8RgskJgf66GgGiwODQvX0X8v25TOXuyzWAz9nkw5
	7kgTDWKQ7Xqn9JMDd1HnAZcvKEKAcoNTtLX7TBNqAGQig6JzNDUAELYibWHsxpx83oCoZEKD01k
	46kuWNG07COKW9j7IFegrACm2jUVZEBbZ1epMwKlel/gsjauUqfNZDIgzpyjYEC4OcrcjWm3uF5
	lixAhueyfRE/48tylSIGAP0x0=
X-Received: by 2002:a05:620a:2585:b0:8b2:eb66:c64 with SMTP id af79cd13be357-8c6a68da13fmr78521085a.29.1768506479257;
        Thu, 15 Jan 2026 11:47:59 -0800 (PST)
X-Received: by 2002:a05:620a:2585:b0:8b2:eb66:c64 with SMTP id af79cd13be357-8c6a68da13fmr78517785a.29.1768506478713;
        Thu, 15 Jan 2026 11:47:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf352a68sm111137e87.40.2026.01.15.11.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:47:58 -0800 (PST)
Date: Thu, 15 Jan 2026 21:47:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] media: uapi: Introduce new control for video
 encoder ROI
Message-ID: <liyk6fjkiko3x2e5kts7cj2hvhqsyjyfypwwiixqv4ew24hoqx@5iit3xqa3y2j>
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
 <20260113-iris_enc_roi-v1-1-6c86eba38587@oss.qualcomm.com>
 <08ff44d8907c72b7599fa4599477d78bcecb440a.camel@ndufresne.ca>
 <763b6cdd-514c-4aff-b7db-8c0a17fdb645@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <763b6cdd-514c-4aff-b7db-8c0a17fdb645@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: q8f6AE8DYvN4U0ORffb17cnFrLskvrFj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NCBTYWx0ZWRfXwkCmuuRu9/O6
 kXeU2QI1D7KOUISiOn3PP548GfUnBTDkvEc0g0DEKYonbGRYmFAEUp2f+3qLWip8QVc79pjGIYw
 vnnyQvCVBiEZl+WNIWQGTyBz//geVfKQd2w51yIMsx8yn6D2keyLFRA/TA3WXdmBixFzHKnlUgP
 aTiqdY8RHPOr1/tfppBTdpczmKu8g59UClz7UxsIOLnaR23uFi541MivbPEXrlOgXNS70UbstRu
 gQDSFxTCLNRj/Wxf0TmQP+WGT2EPwKU5bbOd+oWH7V7zSNI7MFM+k/vKBs8YO83T3x0OVY4ivPo
 f38PTpnQ73vBMhcuLzFpy3wUpXxk260NrZUn8rTkBMAJ8AHqe+cEPUjsM+TVona9bjuo1mIbFL2
 HxScncXbJQJU6wpTI6m4mBfxVVX7BqlqUmJdCmQcIyzj6hLx03YH+jun6eU3VdFjmjIG2xoPkL+
 nFb4hjY1i5xDurnuSew==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=69694470 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gkwr4uIGB5AUEfLed_UA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: q8f6AE8DYvN4U0ORffb17cnFrLskvrFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150154

On Wed, Jan 14, 2026 at 04:20:52PM -0800, Deepa Guthyappa Madivalara wrote:
> 
> On 1/14/2026 8:14 AM, Nicolas Dufresne wrote:
> > Hi,
> > 
> > Le mardi 13 janvier 2026 à 12:33 -0800, Deepa Guthyappa Madivalara a écrit :
> > > Add compound control, V4L2_CID_MPEG_VIDEO_ENC_ROI, for
> > > video encoder Region of Interest to allow applications to specify
> > > different quality levels for specific regions in video frames. Define
> > > struct v4l2_ctrl_enc_roi_params to hold up to 10 rectangular ROI,
> > > regions and their corresponding delta_qp value (v4l2_roi_param)
> > > that adjust quantization relative to the frame's base value.
> > > 
> > > This enables use cases like prioritizing quality for faces in video
> > > conferencing or important objects in surveillance footage while reducing
> > > bitrate for less critical areas.
> > > 
> > > Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> > > ---
> > >   .../userspace-api/media/v4l/ext-ctrls-codec.rst         |  7 +++++++
> > >   include/media/v4l2-ctrls.h                              |  1 +
> > >   include/uapi/linux/v4l2-controls.h                      |  1 +
> > >   include/uapi/linux/videodev2.h                          | 17 +++++++++++++++++
> > >   4 files changed, 26 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > index c8890cb5e00ac05649e6c344c2a6b938b2ec1b24..0eecb46bb356c01411dfc313b92376593bcd86f6 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > @@ -1668,6 +1668,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> > >       Codecs need to always use the specified range, rather then a HW custom range.
> > >       Applicable to encoders
> > > +``V4L2_CID_MPEG_VIDEO_ENC_ROI (struct)``
> > > +    Defines the control id to configure specific delta QP for one or more
> > > +    rectangular regions of interest. The struct v4l2_ctrl_enc_roi_params
> > > +    is defined to hold up to 10 v4l2_rect regions and their corresponding
> > > +    delta_qp with a range of -31 to 30.
> > > +    Applicable to encoders
> > Any justification for this range ? Also, I believe I've seen hardware support
> > both delta and absolute values. Since it meant to be generic, some research is
> > needed. If we delibaritly ignore absolute, perhaps the CID should be named
> > accordingly ? Something like V4L2_CID_MPEG_VIDEO_ENC__DELTAQP_ROI ?
> 
> As per Android ROI API - MediaCodec API QP from the app is an offset QP,
> meaning userspace will received offset Qp and it converts it to deltaQp
> before passing onto the driver in Android HAL. I have used the same idea.
> Delta MbQP = frame QP + Offset Qp. This is clamped to -31 to 30 currently
> and set to driver as delta QP, hence I have it as -31 to 30.

Please reference Vulkan Video instead, if possible.

-- 
With best wishes
Dmitry

