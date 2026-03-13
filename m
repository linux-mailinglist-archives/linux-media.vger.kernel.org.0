Return-Path: <linux-media+bounces-55697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHB5MDwitGl7hwAAu9opvQ
	(envelope-from <linux-media+bounces-55697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:42:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B67EC28530D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16777310D0CF
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1267E3264EE;
	Fri, 13 Mar 2026 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fv2upVZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpFVzG2Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAF1396599
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411098; cv=pass; b=i8N7q1eSuPPh4wu6dSy/jdIGe3jgRu9ZDgPiKHY1kCaEcwyYTu9FtyDpPv8+d348RLBdQVeC7gXIpyEVEI+A04VzxDhrzrlEK91x7BK8KDro+WhFa3+1ekXBJoStZYXn8NxcB9QHKNkwc+Rcr+oUGncyX2Yd+CB3yjsiPBnyANE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411098; c=relaxed/simple;
	bh=lIHC5mCGeMIBWM+ohk9me1sHNw5PHfnOaMc/pd7qgYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZraEHLUxk33J7PqA66e8Fwa/10h5sH/2T7u2MMojWWvDaVExzD6Vb1bTw4v5XN5EWHZPUXNsFr8YSFpRz4En+tjv6/S+IsRZDopCOqc8aWjkoG+QoK5kO+MnsFj7Hbmu+RdmzJzrR4H7aJhK+2oLUq05dQZIa0hBTlupBua1m6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fv2upVZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpFVzG2Z; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B2OL3906270
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 14:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88Q2lXi+p8bfm20EO7ryFSHZtMv6TFqczovYFZbzFLI=; b=fv2upVZQ6l2U0tfC
	/zCKhpSrOc6NAQN8TFsmdChFsYuXTU6OLa59A7Xx+wo2fBO3s/cDDM6d01ZGVakg
	eGc4B4INJ4EzQIv7ET0SlgRYxQKPaKhE8u7cXHu7OglAXkuM6SVmnz75QY62DYBC
	ZWYw+KuroC991jYursb+Ti0il1HIvHKDB/Kw6qaDeSE9T7ne8w2jswR+Re6uY+Qx
	J9FjvjLFfo7m1K58Oc3mLRr0tVjXJ0TNDqzGTbbrazMqJVTxh45lGk6JAAJcuoaK
	DuZDfZ5WCRXDFSRGNLOnLXek15fubrThpiE3HZVawpApTI2d+GCtERlKz5xxA5mn
	d6BhCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs8y63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 14:11:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81506677so1303149385a.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773411094; cv=none;
        d=google.com; s=arc-20240605;
        b=a0L3srO4EIzW7iLKr8DJHStmHEvzrppHjc2B5Yj56qjtf/5U+YQaAyteN10pxuZtT2
         QF96gACRHHyN8cNTpHjzPLGEmcZAW3triMrgChJEO5QCHmCWJJ/Jv2XQS7lLi9c0392E
         Sh2NpEJAwPQbXgbONHnCWoVAoelPVu+vo3jVloQH9cBv1Le42aSlTRH2WdGde/DYp0EG
         Qqzc+RWkEagIbNncipSTg6QijuHB52lgOgfj65jFI6NOQEh/IJztaIxUjrcvNNsEam7+
         7jCOpqCt8eoz6icPhMCSatzBikYuD2bB2Vj2C7fRyZKbVWTWw/23j3WNXynJZoxDC/tD
         Maeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=88Q2lXi+p8bfm20EO7ryFSHZtMv6TFqczovYFZbzFLI=;
        fh=vS/dqSwdjPQ0+ZlgLhaujXAgVhe4UgPsQd6xjTWX2MI=;
        b=KTImrd5gZ64UMkRj75RFwdY0ZoPYAVXQ/+P7r6Un/9Q+4NvyqLB3qi7VDEeiWN1BaG
         BZVpYAZtmH8V4eSC+vDuKtq1V9gWOlQt9JHpHQhltdl3nRs4LsMlUrHG4JsKnomgY9aP
         9jE86mNO95T35VRwABNiXJxHbXthdTbnAvh17VaNmfNhEWscW9hg5C50rkaz2pmbX0dq
         fbAhhyaoGsfAbKIf7qdw35cN9zP7pqcGpMrvahbyhDfRI7ea+6nNgx9we7vMADSRnwcX
         c0iekHb4PucZWiBCCBYvt9W5HkLxnq7KkGm5HTPJNUwgxfVIECrAix8pFLSb9yyVRoxD
         CZbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773411094; x=1774015894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88Q2lXi+p8bfm20EO7ryFSHZtMv6TFqczovYFZbzFLI=;
        b=KpFVzG2ZMOcQReJTzKSZX8W371ygOjqHPCm4HRxib3WB/Sr02DcBs1ymKs87HuTYUg
         7pIMFVsaT4V59jZhpmyluEDgHDdmxG+cwjPzmODJ2fwSW3Vs9JPCPqMou29rJq87Q/ys
         NYg8QZZnX/aa1CxGcNtTrk9DSHdJGvH99tUOmaV18ZtRm63WipE2iHilf+JHo0UMmjnk
         QrDyYuqxBOpS3BR+5qOKJJ8Dg8FYvMedyG5fZE+hGn4sPSPsgQRwP9BqYBRVmmSEIbhh
         6U+chp0vjWrosl3GC7FvN6AgeARTJMiJEJ+KxwTpLQyk20HPxq2DSGIRf16WuUi1KesE
         sl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411094; x=1774015894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88Q2lXi+p8bfm20EO7ryFSHZtMv6TFqczovYFZbzFLI=;
        b=pYAqU17jZ76rsueX1K7hbAr+XPlAm4848cKY4WVMJKGULCcmexb9JSXBFl3dpqgloW
         ASfS1avpJ1C8pVWpk7/g4hSj1VbN+GSu6KubpHHwr++xSxkq9Vbfdo/ZuLj4gXaDZJ2D
         kZx0x634ENf1bGxwHCrzRLrxbogp1ho126I5EPID+FbKfD3oLVPMDGXd008q/nuc+yo/
         Z9D0a80eiO/npZec78Vng+Df5Ai5iuv9tfJM7QVdwqvwxlEv2aGr4c7iIorWknVC6/rZ
         csWcwWYlmA/wKt6HMPyivVBU2xt0VZWjEJmdvQcDmEdVFYTH+2gfXIC7mxcJvdV4K44/
         /hjw==
X-Forwarded-Encrypted: i=1; AJvYcCU4EqDfpT3TWwVSUkDzRIYhDRloqujwwEXTtMt/g5qJkyq19cQtfzGG4G9uQ3Oy/r+9eUW861xzQHwtMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/7Xuznd4pyXADCfxj+Lnr6hJLsOC4NK8RJyr67flSnl2gzzBh
	e4EL5ZCaxJ3x8+Kqrpt7hulBjtFBU7dSQFOltZkjhQdglnu1Bh2iEAL94fWKkwyRbz9XdZ7sq3Y
	cWxK2ynukQD5GanHFbWAAzu/2zRJJNg86z6JlIfxUTr38mnFko9W8Hnw50iYyqI677N+LKkQ9r1
	50S4CkYKYH6l4ygdLafMVJCcjOEX7+Tv9De0qxIUVD
X-Gm-Gg: ATEYQzwaw5u53MnfEZwgnsP/k3Zdr2dlJ4mH2+eJqNwDkc2unWl2kys4Q8RGo4UEWlj
	zl+Er6J5g92c+uibUXZnU6dclaYeWM87m1s6PupxbvSgBZ85TiX0d3/yUi9SssFp0/R3Pq1URI5
	/hI6dIWv5fknVJuX+MdkvXXz7MwWQeh+vtVsyeta1t5SfHEzhWXTDvbCzlvXvdBFdAbObcG3mH5
	SzpZfqfccJS2n7E0pAxu/kzF4sh8qTllhupp/qz
X-Received: by 2002:a05:620a:5350:b0:8cd:c02a:657b with SMTP id af79cd13be357-8cdc02a679amr85139985a.16.1773411093821;
        Fri, 13 Mar 2026 07:11:33 -0700 (PDT)
X-Received: by 2002:a05:620a:5350:b0:8cd:c02a:657b with SMTP id
 af79cd13be357-8cdc02a679amr85135185a.16.1773411093274; Fri, 13 Mar 2026
 07:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com> <d60503c9-0bf1-4cfc-ad18-66ee98a24d8e@oss.qualcomm.com>
In-Reply-To: <d60503c9-0bf1-4cfc-ad18-66ee98a24d8e@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:11:22 +0100
X-Gm-Features: AaiRm50V3b_h8lfsd2NySoI7rkPHks6CNqCWZILD2Ve-j3L0ZVQPh4js3GvhhHA
Message-ID: <CAFEp6-1pd7Lw1V5cFFSxb-3sq-vPK4Gbmk+BVQCLbM8vO+uh2A@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: camss: Add per-format BPL alignment helper
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: TB5H2s-bn5DT-nmHrbXSdIRMw-abKGC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMiBTYWx0ZWRfX9aTlXi8l8f1g
 vFatYiz4mJ2liwnDmMGAl2hfv7jybitB17BGiqvNfpjsCiBKMo2v0EM6h3nxVi4CAWbfL9ToN9Y
 BGuS+rdx0hvmBg7o9nMHOlyfXD/gSneHlhg7TUurCBYOoGkragLIgk00IyMuDGke9Q5SdrrPBJV
 3PqqBaaL4Hd+bO864Gx/jVUPr5W7lUggIHLYEdQNtzzKf/vpbTAFf1Xx0Htse+pJK3v3KqeWwu2
 XEijo87CmpxTy8tpnCSFVpFmMcUYg9So1kaxATC7jRVzc2n8dd2ITDfy4KJyWoPkz+PeC2PN1tM
 p9tbkPt7Zu0GjUNgsaiZnM1LF4EsEkfXJ+1QfStrjU39gyk3CYGypKfQHHwmN2ydQgupJ1B85DE
 SbHqrpymO3DZIXVO1LKa8ElUjPJkBW55oBVzSkp9f7joz18J4iAxU+0YxhT2RWPsiWmN0YR62Ti
 hRsaTd8lLTfPhBsfD3Q==
X-Proofpoint-GUID: TB5H2s-bn5DT-nmHrbXSdIRMw-abKGC_
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b41b16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=YhxEC2p3OWTnAaHfYZMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55697-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: B67EC28530D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/6/26 5:00 PM, Loic Poulain wrote:
> > Add camss_format_get_bpl_alignment(), a helper that returns the
> > bytes-per-line (BPL) alignment requirement for a given CAMSS format.
> >
> > Different RAW Bayer packing schemes impose different BPL alignment
> > constraints (e.g. RAW10 requires multiples of 5 bytes, RAW12 multiples =
of
> > 3 bytes, RAW14 multiples of 7 bytes, etc.). Centralizing this logic
> > makes the alignment rules explicit and avoids duplicating them across
> > the pipeline.
> >
> > This will allow PIX paths and buffer preparation code to correctly
> > round up BPL values to hardware-required boundaries.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../media/platform/qcom/camss/camss-format.c  | 28 +++++++++++++++++++
> >  .../media/platform/qcom/camss/camss-format.h  |  1 +
> >  2 files changed, 29 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers=
/media/platform/qcom/camss/camss-format.c
> > index 4a3d5549615c..2cd0f3a0bfac 100644
> > --- a/drivers/media/platform/qcom/camss/camss-format.c
> > +++ b/drivers/media/platform/qcom/camss/camss-format.c
> > @@ -33,6 +33,34 @@ u8 camss_format_get_bpp(const struct camss_format_in=
fo *formats, unsigned int nf
> >       return formats[0].mbus_bpp;
> >  }
> >
> > +
> > +/*
> > + * camss_format_get_bpl_alignment - Retrieve required BPL alignment fo=
r a given format.
> > + * @format: a pointer to the format
> > + *
> > + * Return the required alignment, in bytes.
> > + */
> > +unsigned int camss_format_get_bpl_alignment(const struct camss_format_=
info *format)
> > +{
> > +     switch (format->mbus_bpp) {
> > +     case 8: /* Plain 8-bit -> output must be a multiple of 1 pixel (1=
 byte) */
> > +             return 1;
> > +     case 10: /* Packed 10-bit -> output must be a multiple of 4 pixel=
s (5 bytes) */
> > +             return 5;
> > +     case 12: /* Packed 12-bit -> output must be a multiple of 2 pixel=
s (3 bytes) */
> > +             return 3;
> > +     case 14: /* Packed 14-bit -> output must be a multiple of 4 pixel=
s (7 bytes) */
> > +             return 7;
> > +     case 16: /* 16-bit -> output must be a multiple of 1 pixel (2 byt=
es) */
> > +             return 2;
> > +     default:
> > +             WARN(1, "Unsupported format/bpp (%u)", format->mbus_bpp);
> > +     }
>
> The intention behind this could be better expressed with:
>
> #include <linux/lcm.h>
>
> return lcm(BITS_PER_BYTE, bpp)/BITS_PER_BYTE
>
> "take as many bytes as we need so that we get k full pixels"

Yes, that works, and it should correctly reflect the hardware
constraints for all bpp formats we support today.

> There's probably an even smarter way to write this that doesn't require
> BITS_PER_BYTE to be present twice

A lcm() or gcd() based expression looks smart enough :-) I=E2=80=99m not aw=
are
of any simpler custom helper for this.

Thanks,
Loic

