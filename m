Return-Path: <linux-media+bounces-55960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGaKGzdQuGlHbwEAu9opvQ
	(envelope-from <linux-media+bounces-55960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:47:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 755D629F363
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86C363014889
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1FC3E5EEC;
	Mon, 16 Mar 2026 18:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUlS0TJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4742ow+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0974E30B509
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686828; cv=none; b=siQecMRgS+Cdjihaks+KsXYo9Hl2zN/g/ZH3e7kNAy7jb3xl/0+dUUunP0k4eJkRubRSfOL59aayssF5bMxykxGMqV4xXI4X/ueRL2CS6nQRuCpBiYROuwaI0IWYymDHjfWpOCeT9aXlmq1HyPJ/pII+wrFQ6gSsgC5MSFrlIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686828; c=relaxed/simple;
	bh=Qzq7j0QMJnJCNuKWQBhsRPJx6ggaYy/5i3sltBnvWKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyiFBJaymiFFER87MovV1UK8BjwKVGaG2U/1e/2JGXjDSPI1FD9ZE9dbwcTdJoMvkIjNgA5MODJQU57eUGd1lnZoemvjtk1/iNWzf2OlZyjw7w3cXh/ijy3tWq8KDC4rRB0krWUXrYpCPjAadJR3ngDgp3CAsqNJTwNsTw2Ow8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUlS0TJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4742ow+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GECT1I1639402
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOEgReXzTvhaS6rMXxCGq6xM9swa1SN2BOFYvDoil+Y=; b=EUlS0TJTpFzVvGmG
	/0usS7wqaBz6xhHJR/ZPeGOUdwaIRft9Ibr+G1l/El9BmgS3I7rswnJ/TWTR4+Md
	i0gUEC1c+f4Yt/Lqv7nO5BQwo3yepwHFvM19Bbof5t+JwixkNV93ZB/QvOyeNRK/
	1xHSgTUqGCt5ZrrG6VrriMFOnSIddIyzLixYPqiC0wvqokOwoHcvMvcBzdu9CMyJ
	F7JLw74aCFXQfIdeQeHuA2flg7o99yVjBSGiw4L3qghROYDmx0lfRkHVw9xmMFE5
	GVJ5oDx8Nj/JcuczUSX11sjrXzdZBeNSusDqmXyMlx02eIIq25wTjP6YUOaVe3ce
	dDCgDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke092n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:47:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50925fed647so350210731cf.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 11:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773686825; x=1774291625; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qOEgReXzTvhaS6rMXxCGq6xM9swa1SN2BOFYvDoil+Y=;
        b=O4742ow+vz5hH2G2nM3UwhG/f5sbRD5oCB+lF88PhXyOWkDAy7avPmGRpdISvsZ2nA
         CkuBqvc0b1IAC4ocdqacIXshyXazths0j7KrKbxtjpkHRWfEdgGdR/JAZrB7RM9H8zhv
         n0GCtWlKHAStSPl+TA5AVB+ud14FNXZZL4Y4BRq39loYNXo7LZD6s8nKBx15HI9dkraY
         nefoiBjcVGSU+jF7pQBDq4RQHkGOOfZ1k2zwPGJsAjFVZ4i1sGXdjf2OdWKoi+5wXjKI
         GDIjLWKsDUzei0Dfg4gXxePeh7PfbFZFIIrvTza7/ehC4xfVJ3Cl/BNIB6XdgX/bx7iD
         9wpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773686825; x=1774291625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOEgReXzTvhaS6rMXxCGq6xM9swa1SN2BOFYvDoil+Y=;
        b=sjihSACjJRFn2q0A4cg2rP98mBbofAc+22cnLxRVZGLr+Gopq6PDNO9ZsqJ1Wf1BwK
         zaJ5i+uJCRSKuzY9ffGeVRIuvBmgX5c8+85XD4cH68HS6L+kYnDjB/dY4cAZd4ac8Kod
         UWaQlJc9qpMJvQQVN9WmBmaClSzFZ7CKeZuJMXBXvbUb9XFFZfKpQARHKCW6mLU5IFaC
         Wdo8qy87u85D81l5tm+gbZ1j+gv2mTH1+PH3a21GyZ6DJRvVbBjZcuuK2xd3C+Yty4Wx
         4Jc7CYEyVXXuDtpYFbEThE1kJ/zQZZGFOce3VR1FeRYYyD+EsSmLlcAtDQWdMtMkrTXy
         5IJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvS9BXjT7gzHQTQaLX7UKpM2o2T1kw5+mEB5ZwGVY6psJY78CD/nAOSQNPpBqGKyhd1f+8y/B77ky6Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycJAfudgKX6jD4hj9cm3ZsHY4Ko/GPK0IdXcYDtl/D+/vv+XZ6
	celHWDDYRFL+cyskSqpCxGYnYO3eqfliZkhYuICo5g/7nW6PCZrFj72YF7xFWzYikx92A86+xB5
	vcGDOIKMBXA/Zz/WR5A0iB0QltVaxYfiJAQNAY9OwKLjukxLT/vVNMtJfBZmfdao2Ww==
X-Gm-Gg: ATEYQzz/LsVWKl8fK8WmMIY8QMycie/UT3ejpYBUT9fY/ylBceTEstDiSAtDw7IqaGW
	lx5KDG6SIgygA/B1s6MM3tJDJQgd6U3/KgrPl7ImHFrU+K+oVHobZIjuNJhTQazO9dXia6YVRbo
	F2a2Ip7HgHtMt19aVJqLz5hAupedF5zlvt9iBJyMRidv7rSqRaODtYKXNSk5fLPom0S9WbJqT7U
	t6vDyRHA0m8Gr5LIdGjhoqgUssVni0DP/67uH4AzV3MmoFs6XMBDOZHpsM98KSwGJVkYcBY5myR
	rhTOrBPAsEMYmPlD82lun3dneI/YPOfWJUwFT8RuzxScvLByLobiE/BtmhzDgIVqmoBDemx2Q5X
	UoG6wclC7y6H8ZPXJfO64fq7/F9Q/Lzf2ae+Nw7Tr7nZpRGKDdjQ2TiXNbiUqqd8vLCKMM54RN5
	uq2bJxH4uzdgwM05cLvNn7kh0j3eYdbqaeIv0=
X-Received: by 2002:a05:620a:2549:b0:8cd:7cea:aea1 with SMTP id af79cd13be357-8cdb5a17bc4mr1785679185a.15.1773686825346;
        Mon, 16 Mar 2026 11:47:05 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:8cd:7cea:aea1 with SMTP id af79cd13be357-8cdb5a17bc4mr1785674185a.15.1773686824757;
        Mon, 16 Mar 2026 11:47:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d83f9dsm38000141fa.10.2026.03.16.11.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:47:03 -0700 (PDT)
Date: Mon, 16 Mar 2026 20:47:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] media: iris: add new rate control type MBR for
 encoder
Message-ID: <r23uskjcu2ui4hgviei5pyv2jlnz5bhuqdjavz2ipoenwbya4y@gijmbfreckzl>
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
 <20260213-b4-add_sc7280_mbr-v1-2-e8d95b4e4809@oss.qualcomm.com>
 <84895cad-9f1a-4e51-8e43-faf30b4bdabb@oss.qualcomm.com>
 <7f165169-427b-4f5b-9bee-bb227be23d82@oss.qualcomm.com>
 <69fea3d9214405996d2ecc50419e539e84f22a3a.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69fea3d9214405996d2ecc50419e539e84f22a3a.camel@ndufresne.ca>
X-Proofpoint-ORIG-GUID: 0rMivDgI5Jl4r3v9g59zQkQ3GQFj1QAz
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b8502a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=ZikaNk_W1E2w7MebnN0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE0OSBTYWx0ZWRfX4wLPcQsH4E7X
 jB1+dTp29Y+HiM3ky3sorb7jx1rK8EKhnfhPqy6nnFn1RynMJmbbMNJGGYdp0GjaA2OQIWUje/e
 11RS7hW6GIdZlDe28YsN49UWC2VqBO/Zvl9/6k5/etLEjItr9udh74OOpcvkq27l+25iiV7HDFg
 x8ZsL/sJ4dgPRP7wJB6dqmL90GtA1/XePJbxbbaLNcoAH6J1nzDEeDaXlsiYwEGOzR2y4kVGKMP
 MHnP6JahbVfwbERyk+br10l1Mqftu4r3u42a6lYCrM+PQbeBJUTenSaUfePJUzodkBMNCNoU+O3
 zY3FRhUVMsu4eM294dED6scXFo/OT8WXmVMde3kzS29UtIxHBdX4/SwvoZvEKOgtcklUxcc1B2F
 xHntufAIy2ZvWv3lgNQJqATBxnbdPbKT8qIbHVSm1110HO1SSH5GqqRe333EXON77L1xD2x0gNr
 gKqYFfnd429dD2Qq5ug==
X-Proofpoint-GUID: 0rMivDgI5Jl4r3v9g59zQkQ3GQFj1QAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160149
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55960-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 755D629F363
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:37:21PM -0400, Nicolas Dufresne wrote:
> Le lundi 16 mars 2026 à 11:52 +0530, Sachin Kumar Garg a écrit :
> > 
> > 
> > On 2/13/2026 3:24 PM, Konrad Dybcio wrote:
> > > On 2/13/26 7:04 AM, Sachin Kumar Garg wrote:
> > > > Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control to Encoder.
> > > > Encoder will choose appropriate quantization parameter and
> > > > do the smart bit allocation to set the frame maximum bitrate
> > > > level as per the Bitrate value configured.
> > > > ---
> > > >   drivers/media/platform/qcom/iris/iris_ctrls.c      |   2 +
> > > >   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
> > > >   .../media/platform/qcom/iris/iris_platform_gen1.c  |   9 +-
> > > >   .../platform/qcom/iris/iris_platform_sc7280.h      | 202
> > > > +++++++++++++++++++++
> > > 
> > > Is this really only available on 7280?
> > > 
> > > Konrad
> > 
> > Yes Konrad, in this series we enable V4L2_MPEG_VIDEO_BITRATE_MODE_MBR 
> > only for SC7280 because currently, we have added the support only for 
> > low tier chipset. MBR rate control aims to improve the compression 
> > efficiency of encoder for static and low motion scenes for extremely low 
> > bitrate use-case.
> 
> Without a spec definition, which constrained the implementations toward
> interoperability, this needs to be made vendor specific. That being said, even
> as vendor specific control, I think it deserves more documentation for your
> users.

What kind of documentation would be a better fit for keeping this in the
generic namespace? Frankly speaking, I think that the current
documentation is too vendor-specific, it describe the particular
algorithm, while the control seems to be more generic. However, I also
feel that defining it as "Maximum Bitrate" might not be specific enough
(nor would it show a difference from the CBR mode).


-- 
With best wishes
Dmitry

