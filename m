Return-Path: <linux-media+bounces-61857-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI+SKg/6CWpPvwQAu9opvQ
	(envelope-from <linux-media+bounces-61857-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:25:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F250C56281E
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F6B0302451E
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 17:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524A93C5857;
	Sun, 17 May 2026 17:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meKhTaR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGoQFSQ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399273C4B8A
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038702; cv=none; b=pv/TCXzSjImYNlyVkuKzJsma+NI5qBRC8kcbGDfAKBkCV0uEpC3AM9ycasUXt3ePQANV7HIdHnQ+p/SmLCv6b3Yb8dO8K7qzBHarhRKFqLcjvLxKN4VmGKSJkiKxxQDvRzJpiOWqNZ3b5vUQjPh2acD92jNWLUnRogpE8BclYLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038702; c=relaxed/simple;
	bh=wolJ4ThGe8dC9+nkGWmJ3EDbmW5mWWkDH7iALQvuVsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN2Bk+1juH/XN3mO/419fiweGHxbjPZQNu/QOEO75B7mY+XxDJeGhWkVylOEabgFcsq5u2pi4NV1TRd6ctfMlTXCb6hRPZ2aq+bmWGD8m/cKSYw//op/J4s+GvF2JStUr6XxLooWt4d9GkPIi9zIJf0blbMZF0r50wd+u4rQx2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meKhTaR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGoQFSQ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H97DRV3124872
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=62y0GV+EuCwNt4/8lErab1ei
	sydCTnrzt3JbW4c45hQ=; b=meKhTaR0O2rYD2EE1otQpoGUaBG3tt2BzmrbUqFS
	JbAn64r/SirYpK/2EXzHaeLMDZss2LqyV0+/K6lZKUywebHVvJ6dwQC/Y9OxP4bX
	nYFxCxJss2OEbUS7YPc3ymekaZvkBmOxZXS8EAscEgngwL0JQIy5wWzNuK+4T3bs
	vPqvRMKmfDOCgXvSlPpsDn8DtzskgTmTQF/Ldhwbt6PDGJ0z94k8fsko66Z/iSP6
	QdWAnf1S8AI5oXv78SmeA97VofYrhu9yZl+3F//BHO5fbEqzaAU2QOI/MNTfyqPy
	9yK5C0S8dy9pdUoSv5YuHEe6DQwtE2aKHmcl1Kr9InpyLw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw38vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:24:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5156c85538cso49674541cf.3
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779038698; x=1779643498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=62y0GV+EuCwNt4/8lErab1eisydCTnrzt3JbW4c45hQ=;
        b=KGoQFSQ6voJnniUqyUfV+LcEB+6k7pjM25V6bD8vXAjGlI9VKX/H04sS+jxRrD1L5s
         qlJm/sAdc7JRdIwPoF1rc2M2V0/8f8ZhiRyqqEMc/GrK4IHff6HWfeZNaExUT+kvlyzp
         465FLr6QpEmFKalg5LkwXgCiorO2jYA4ThaI7HyeIycWw1t+V03FkF+H6L4S8jCCwA+f
         gm31q7I5ZzPVk4Zp6wZrV2mHZdCtMZer8R8QaGV+FoWqqyRlAYBAH+HWt+pnj2bFYKnR
         a9d/kY4vp6Zi2GvNKmLH02SKystufOqzjQFtCsb7ImrvER1bCCiT8KUGKUOD2CP5ItTB
         8p6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038698; x=1779643498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62y0GV+EuCwNt4/8lErab1eisydCTnrzt3JbW4c45hQ=;
        b=jPVWDjnVLs6U3ETVE7/dkEC76VCBexc0/0XATWkBW5p4GQUivkt/doYCB9sHXkl481
         Gsue2H1yJiFYSo8Kx5eVY6I/47U3LnTniKq7o3T/zmU7p+h0mrxTIhvrLnIn8p4t77rz
         BzV9Upthq6yAtX2zqJ3VR1ZdRsm/t5PNuVe9IVxzqDEhZ29Y84Zxf9tznYWzgpfhnPUE
         2igETHR9UYGXgYZHBRDnVDFhLgOkC1aoqSEmfua5rE7s8LcXReTBiWxwg+bxfUJKUpKm
         vTdwUEb46S2qqv9X/JakgOl17G5KEhhP7HALuMDgceiSgPa/7pS/ehyrFObQ93YTCF8u
         653Q==
X-Forwarded-Encrypted: i=1; AFNElJ/PsTT7qIuIeZN8WRIGG39aXKXMdLVyfI2Nc2pwJkqJAIaaUF3tROXttpW625j3Gh90O5gqlCraEaDSgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq2chQvHbDhhdfPc4zb4nzkiyGq6Ge/KDHo3IxQNKjKAP2EG1J
	S68dWh1GETfZk2wgJhHpcon7Av6k7JjGrybEJIfxDkztMpCL8XTP8UP8J+dJNHrQ+UbcMlHS+Zp
	ixx/S30Jkh1/cSIFkq6mxd2k0tfdIz1cJkpOWAhE31dplWp2UuBWH05tciKloII3L6Q==
X-Gm-Gg: Acq92OEZ0fNfNUwKNDhew9bxymyWT1U518aXAMvaMRa/IhzM/HG1KvJGxlgohR7NQeP
	6gKX5K50EMTB5nnw42pntD21G0LOxA3Oh1WEbyoC0kFAUyecZSXXDGVgQma/+ISWS5eZ3ib0aA7
	TlkeOHzY0SFJpVRGqLkDVlfYFYRqgIoEaaYG95RfS37QIXJr8ml2HYZoeLEW7OwAOl+3MYf/Ffi
	e5cJq4pazKzW7PW+xfchfhDluPfbU2Vv/ssgS2mVtPrC+M5/EL0zFyNKDVJfkl4lLIdgNwZ6tBt
	IL9Pflz3oS/cyp2xq3EOSfMsk9acPc7ZLZpvZksgvOqvRqOVigaCUx8sKmD2R7mGD0k0NpVYEHl
	Zc63QwrIUoHT3b1hD9oqCV25ULRI9HWygtzif602g2CF3P4bqf802UxpL/J1EggJ4IK4dYB66n5
	gUwCNAst5hgigfp7ey/v14UtvPESIEzfvjlp3iiH4FTL3T2Q==
X-Received: by 2002:a05:622a:1dcc:b0:50e:5b04:810b with SMTP id d75a77b69052e-5165a0a4091mr177101621cf.32.1779038698553;
        Sun, 17 May 2026 10:24:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1dcc:b0:50e:5b04:810b with SMTP id d75a77b69052e-5165a0a4091mr177101371cf.32.1779038698161;
        Sun, 17 May 2026 10:24:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958874ff29sm6451821fa.22.2026.05.17.10.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:24:57 -0700 (PDT)
Date: Sun, 17 May 2026 20:24:53 +0300
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
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 01/14] media: iris: Add iris vpu bus support
Message-ID: <5l4pecxynb7mip5tmzspxrjnzy6jkjxr6fru6lgfy4lt4vo2r6@cm3w5t3bfksg>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-1-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-1-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4NiBTYWx0ZWRfX8u3lU99sn7Xo
 HMTVrL4Trxvkn3fa9dNjjiAdAWuh9CYN8Cy/lQ8icmGElDsLnSe6eAOSpLu4nHPyC4IZCAOt36s
 oPZkkpWGdGI3JX4fxU8FxIhlsY5modm8dil7vnLyE7OdOvVRuW2G/skkR56oe53DYY5MXlk0qMB
 i6mD5vuKBGCzvbXJ38jLXYGqixIC6Wrc5/MpQqtGwoV1j6hoKkzsnFSf9jqE6RPDEVDZnYc6Tko
 e81hfE5WHwrvOIRGjJy2H4QTL2lLEwoaojF/Q2PmndvGs4M+5ays0dIRC7E3I22T6EMBi4OkrGp
 T2sgy2wIy0Y/SpgncXu8PeywIXGtt62iDjrEt0rpuoJmZqif/sfJU7pXI7aeRN1lXuFN7iEczcE
 B+R2r0Il1Qr7kjRbWhnPY+pBTwqdw05EXpPnBhwaQtmJBLi5FaR2gjdnyI90rwYACXJF6HgNqM4
 9jYM2DzvrmVUMxWQnjg==
X-Proofpoint-GUID: 3HS4DRRtlzRul7Frzqv-eWcgPWyKHThE
X-Proofpoint-ORIG-GUID: 3HS4DRRtlzRul7Frzqv-eWcgPWyKHThE
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a09f9eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=iwIdmoSuwSNZiPAV1xIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170186
X-Rspamd-Queue-Id: F250C56281E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61857-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:16PM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> On glymur platform, firmware loading needs a separate IOMMU mapping with
> its own stream ID. This stream ID is defined in the device tree with the
> associated firmware function ID in the iommu-map property. To create this
> mapping, a separate child device is needed so the firmware memory can be
> isolated in its own IOMMU context.
> 
> Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
> and its dma_configure() callback calls of_dma_configure_id() with the
> function ID provided by the client to map the corresponding stream ID.
> This sets up a dedicated IOMMU context for the child device.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  MAINTAINERS                                     |  1 +
>  drivers/media/platform/qcom/iris/Kconfig        |  4 ++
>  drivers/media/platform/qcom/iris/Makefile       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 61 +++++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                    | 25 ++++++++++
>  5 files changed, 92 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

