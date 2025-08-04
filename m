Return-Path: <linux-media+bounces-38841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 142C2B1A20E
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 14:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07FC7189F754
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 12:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC2026059D;
	Mon,  4 Aug 2025 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McHctA66"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A331B1C3027
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311582; cv=none; b=mCszsQj9yoyXsr8pqB7HxYpP9ECsVHHIyXxBp1ZsCvUDP6RdsFC7REijoIBDQlsjlOxJi60lovPf8+cUdPLN35Fq7jelhTQ9NruZfG81axJBobd27hMdNwVuPp+IcsBjQhu9A8f5zs/STAEcqKvSDh2l8+wQeoWgLk7hvAvbr6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311582; c=relaxed/simple;
	bh=rM6WUBKB4nM1bTFF5efRuiq2r6zvWYsDnKyHNwOgRp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBZ4L28QxgA+agiTojI/nhVlv8ZzQRBAdW6erwIkMj2RqEtKqyTsMvM3CrPtYld3YHCxfdD7lLrYlzsvpuIEBYIlVYvqg/JxKp3lheveC4Y0c6C3dFT1Lak1hSDArfXFhCTGe8fpDUuyt/481EvzrIiR7B+Z1UoA7Q/chw9cT3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McHctA66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5749Z58Y000546
	for <linux-media@vger.kernel.org>; Mon, 4 Aug 2025 12:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=srJNkV8mi/T3+DZb93ch2hkK
	PbbG674MuA3RGQ20bB0=; b=McHctA66Bgs8D1rMerh7ta8TOsGMjNF74+GhUZNB
	iRmxL6EhwTlWsCSPQtSTe1PZ09+aV6cXYwFuO6s042TBIpTDdiIcwzK1n7oRxaPq
	p+TibN0ZEzGUfDJLtFM6D0D2ZTbaA6ycMyK8cr65uYDsgrDfSeEZzQNnJFpHk4zR
	Ms/mccru8rJ0kBSOeL7qxXQvn2JL9YB+ZWsx9bTGoMwfCN3pR8tSrK25VTsdF/oT
	ArUBgWyBDxa7GkqfNNh1fKTINPKXnVYNGFztFVEVHAnduCmPMgYP5hIVSvSrr08u
	RBckhVA020jcfoMSlC3wcGHGK80QlmraG5Ok9efCUqiqXA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a4w1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 12:46:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76bf73032abso1487888b3a.1
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 05:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311578; x=1754916378;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=srJNkV8mi/T3+DZb93ch2hkKPbbG674MuA3RGQ20bB0=;
        b=A6MRUPVWJcUI/6RpvVCbkUt2ZOnUn3Biwfw02aEN173+xuPnKNzWXlvO61TtfDXEnA
         ZK/sOjtJtRr7LyDV7qkEqU7y+xbuH/kVEp3qV916pxTiMAQ1Meezm8PPvTEoWfknPhjd
         LuHLZzq4XPZe+cvhM+HHSjaoOcZht6nG7MY/rLDnM5+ZwvDlx6V64tCpzg9Q8kbYgGOm
         jMCQPoYVL6BQzWsR9z7pELY4+wP8RXJ7keWIU/YCSv318JQIy0lWNsz4PH8zs2Y1YbHK
         kVBL4ashqHLboiGkD8wjRO13qqrxV+/9yuxWK3t3Yd6epWnhTRNW0Xe9fpLnjSU+Ru1E
         lEGA==
X-Forwarded-Encrypted: i=1; AJvYcCV/geNCa5SCCdedRXLhPPeTqoB2vxKeAa965fxlJ0w38bud+QBwhuNpE00N4KSOSmuG8gfyfLuzIb+7lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCTwfBy7xA6oPwb7aI6ZvbdfvtLiwNQ6YXnVkDL4L1ASMnrRli
	tYcf+Ll7RZwlH5dGQK49zEMruk2igA+yrdL1SJGqoi2fjzb3ObWWge93uvWe9YXukbhs1+DsJ1A
	Fzwvj2R1e/Jrxfy/CB+oPfzeczBkgDIVVSlQ6vg/YcbbNeHAybIEAAuhPhBwIirphZ9kxEnjB5w
	==
X-Gm-Gg: ASbGnctR8XPn9KYd2U5+KYQ8utB0NeVr9MW5d/MppQ/FZVTMxRr2n9KQG0258FGt58m
	9WU4rIPZkro20zpbVqr4dDU8cjrEuVrdTw86H1Py/YcMKlqJJQp1WsbCOxpwqBlYUi1LYQZPjfO
	4cFLO9YvTCPXQcPYYT5IMhFq9lH0+8xT7kvl+oKdBAsXuW0Ry3gsda20Bxq5t0MnM0LQCamgk+V
	lQnNWQDhJmQqbcdpnMluiwT1QHE9RlwI9JAqSBkJRKGwhZ6PB8HrcI5+Nbp1NVIdxw4PNPzo62I
	0nYPluobKgC+68FgKi01RyCfgJ8tC4w+S19sgsic1bqAZmJRyb3bxSAvM2ptkD33xq8=
X-Received: by 2002:a05:6a00:1484:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-76bec4e1e63mr11958347b3a.18.1754311577867;
        Mon, 04 Aug 2025 05:46:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpdaJQ7fVIlE18tUxW2ATQbF3hPhP2gMHXpqf5ai2xxiI+sZ1i3HhvTdj4U6zAvu2H9FbzRw==
X-Received: by 2002:a05:6a00:1484:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-76bec4e1e63mr11958312b3a.18.1754311577464;
        Mon, 04 Aug 2025 05:46:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8b5basm10399198b3a.41.2025.08.04.05.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:46:17 -0700 (PDT)
Date: Mon, 4 Aug 2025 18:16:10 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] EDITME: cover title for mdtloader-changes
Message-ID: <20250804124610.xqioktl6lbyvv5qb@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=6890ab9b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ICuFGErgaGyLqr7TlXEA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: GWZNBd3Zxpy9BBFMgJ_Ct5q93QwDxie6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OCBTYWx0ZWRfX1iZSFQa1XiRa
 /d/VcFQxdbApxb6sWB9Ti18vTpzzv2dSV3iOF5VRfdjrEWKtiNl6Fp0o2rqjgwgEroTO/Qp86ym
 BIDDAS0Vl/YovdEql+G7x8ag+0ktvMjKj46z4ETDWKj6QzM8oCqTrgcFQu3p3WeskMCviN3qpz0
 2MpePVpRAR53TyD9WQ6wG521xYaJgRbOs7AW81L0YTzef8UiQgTEWJoeJNA6HSz2BsuNLkA52XQ
 7sDVBGsMV1/p2Wccg1bKFiSJxMkV8z9E8ZiVfkxKZZ/eJPsG+PDNW37rT4Nekzhv3TTgPFo1hY5
 amirKa1Pj/av1xa5ErP3gf+QOIV3neVWhbOBkfUpVJjiRVFOOeQ9e5WR11BK9la2z06FolyMByL
 eiPVjU+CgaAEuya2qXxMqbgFZLmr+wgrH4bdddPfl+lxwTFfYdLKhRWBy70zfPne8FY0uFI6
X-Proofpoint-GUID: GWZNBd3Zxpy9BBFMgJ_Ct5q93QwDxie6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=913 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040068

On Mon, Aug 04, 2025 at 06:11:48PM +0530, Mukesh Ojha wrote:
 
Please ignore this mistake of sending empty cover-letter to your inbox.

-Mukesh

> ---
> Mukesh Ojha (3):
>       soc: qcom: mdt_loader: Remove unused parameter
>       soc: qcom: mdt_loader: Remove pas id parameter
>       soc: qcom: mdt_loader: Fix check mdt_header_valid()
> 
>  drivers/media/platform/qcom/venus/firmware.c |  4 ++--
>  drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
>  drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
>  drivers/soc/qcom/mdt_loader.c                | 22 ++++++++++------------
>  include/linux/soc/qcom/mdt_loader.h          |  7 +++----
>  7 files changed, 21 insertions(+), 25 deletions(-)
> ---
> base-commit: 5c5a10f0be967a8950a2309ea965bae54251b50e
> change-id: 20250804-mdtloader-changes-9aca55e8cf37
> 
> Best regards,
> -- 
> Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 

