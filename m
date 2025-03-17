Return-Path: <linux-media+bounces-28351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0DAA64CE0
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58D163B0066
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B42238160;
	Mon, 17 Mar 2025 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BptCu5eU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE7A237705
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 11:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742211362; cv=none; b=Nkm2+jBFGIA6dmskztaq5UxDKk59mXUgs9UNqCb7gE2JUyYyZgCIrzIf9qqzqB0qCsx7S8n+PHS3xGUC83q4d0EVcPwtD4XnpmEj/7CtnVMaRHBLJgYGNjeyD5h45FlZY8TuXSYjK9I2RYhQybH04+gdFqgSMyDP8V2DBi084B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742211362; c=relaxed/simple;
	bh=hhnKo1koZ9MWYz+6WoOpfnqo17O1obC3mtDDYd+spyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Avs2jLlqkUeUJ0xHCrHsAerI2JEQGCmi8E9jp2lQy0t1pniiTh/5PLpUv1NA30BfLM3nyMbhH7z6GDXZVhbRIFoaVBmaW5W/wLbRRgsXcmqYF+D2gu5Qpw7lATWTcbxFvClsIH28sPHkWat65qKmSsEp9MnLNThAiGwONJ83E3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BptCu5eU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA7PJ4022761
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 11:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YeZNlDAPrPyW/cf3xKhRAbVY
	fLxCK2qS+SxQ2C/Ihu4=; b=BptCu5eUymlmh53PK+qVflr5BKD4O+VGHRMWbfD7
	OScxgW1oiy1sHIp3DG0v3lFTzeGmuABGbMRDZszUlCw6Z2Q2a1DnUmkEj/krUjfg
	LaOnWtSEkdsHQ9fqSIVQ7mpZ3nsAXS5N/6eAc3O69Gv/PRfPjcogCQUi9dccOQ4k
	3pBVt7YwNR/oXjQfwD+fULRVqX1/ua8CfhAG5Hq+bbDzThLgZYp96DMIHtluI0hy
	sg/WaYMYQcMqpSSsc/M8HB0VgI4n8MG0JzNESZq0KLTTmU6FFnideJHzXnN4tHr6
	kebfVYXLVgGm9g16VVj88otOgIVyyWY0B3qkwNIJrDCD5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2qm4f2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 11:35:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476aa099fb3so149027521cf.2
        for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 04:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742211358; x=1742816158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeZNlDAPrPyW/cf3xKhRAbVYfLxCK2qS+SxQ2C/Ihu4=;
        b=TOHPEYU3jfZNO+9R159rA0mT9JDelP37Vx0PUyH06R7m/NNdQocLs14zS6uF2GnCj9
         N4uDmnZZGO8X4biBSa5/DScNgc/9hP4u9jdiHeXwIT2DaCX18vx10M33vCDnV5Gxf79A
         pK3lhvt4HVHMhFfBN4xEhw8bLilmPcp2rQ9g18P1fn2htGocFu+Fe1ogmztRn+5+Soix
         XM08zsM/hlvEUo4Q1+BbMtvXJtuU2iMj6lqirQPZIB1wxSf0sBZlrM1ngGcenjDbv7io
         DvgM+MM/ndLrGIw8k0Y9yCNoUmMf6dqyp1Q+vcvqvenwwHa0NT/epD2qAXNKvnhkKD+6
         Uetw==
X-Forwarded-Encrypted: i=1; AJvYcCUeHJMzqQWpTBDajHFVGDbf/NwvvKIdScp5CaL8+5VCJj4tGZ5xSWQHAE/t2ERu6Ujfz1kiBJq5m61azQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDb6k2wMTgEkJTeE/HFntYGNzIiBJGE3vkukTuDCTIkJKqbYmJ
	M2aajwUFrX1JN0TzUeOhZWez5p/t1fO8aYrSEXIuc4qIe5cO5+8u1SDEe0U2MFlqAx645Fd2yOA
	AdleCu/kRnVFmR1j+X70npuO6PI/Dn7le0ZrrRVgH0n83WisIrU5+9zeBFCuVPjQ2txTTKA==
X-Gm-Gg: ASbGncs1hWRlcaQDdl/3/c3lTLU2XK/MnT+cnnxLvRZS6BWWkJsrahvjEpyRYEkG3HE
	t6at5gGr9wrX58Un5UnEMusnYbzXro6H89TZA2oPBZAZPQmCEOnAJFNpZgg5KDpw3X2vXcTsl8l
	0k3DAcsgDQepEp0LzyXin3LvAoZiWjRwcePPwV0YzfvXxMMwEZQQQX+UJl2F3IyT6OYusWha82v
	Bh7Wj2YPDTWf9A1Oyf+eBxSp8bOxrpfnJ3VW9UmG0ZPOCAk5JI72k6CLzokWNYiFC0oFEaIW5qd
	12vD49gk7yPqiGXa4OcqmMvph3MwHsUH6tYjmbZOZyXJPg2xuXW0kunU7vUKpIcAjE1Oq9ukYqq
	q+F8=
X-Received: by 2002:a05:622a:2b4d:b0:476:af21:9d4b with SMTP id d75a77b69052e-476c81b814dmr187879301cf.37.1742211358183;
        Mon, 17 Mar 2025 04:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8Ff7NRDjIixgDbZiIssqIub1yFfmbmAPPXmx/TewABw8oOTS3ubLjWwHKqWclRI5IHUlYvA==
X-Received: by 2002:a05:6214:2626:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6eaeaad4dd7mr216862326d6.34.1742210994322;
        Mon, 17 Mar 2025 04:29:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1da7eesm15708061fa.100.2025.03.17.04.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:29:52 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:29:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: add support for video node
Message-ID: <vkwdmy4xabipnmetypzuem4xr2fijxb763hu5liohumtkfit7u@drhlzuo57y2w>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-3-5c807d33f7ae@quicinc.com>
 <3ec71075-b1ef-4366-b595-80fe41cd1e13@oss.qualcomm.com>
 <5qfe4gnjnttnpezj36rdsdbomghnz5ytj3hiecoingj7622o5a@h4tq4tzliwz4>
 <b9743d3a-d0bb-385f-f21e-6b0c0be37fae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9743d3a-d0bb-385f-f21e-6b0c0be37fae@quicinc.com>
X-Proofpoint-ORIG-GUID: xlsEC2RCkpGwg7b2oYduM658U2ME7w1d
X-Proofpoint-GUID: xlsEC2RCkpGwg7b2oYduM658U2ME7w1d
X-Authority-Analysis: v=2.4 cv=DLWP4zNb c=1 sm=1 tr=0 ts=67d8091f cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=xle-qd2Ai3CaSUjEJ3AA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170085

On Mon, Mar 17, 2025 at 11:30:16AM +0530, Vikash Garodia wrote:
> 
> On 3/16/2025 12:02 AM, Dmitry Baryshkov wrote:
> > On Sat, Mar 15, 2025 at 02:43:30PM +0100, Konrad Dybcio wrote:
> >> On 3/11/25 1:03 PM, Vikash Garodia wrote:
> >>> Video node enables video on Qualcomm SA8775P platform.
> >>>
> >>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 67 +++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 67 insertions(+)
> >>>


> >>
> >>> +					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> >>> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> >>> +			interconnect-names = "cpu-cfg",
> >>> +					     "video-mem";
> >>> +
> >>> +			firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
> > 
> > Firmware-name should be a part of the board DT file rather than the SoC
> > DT.
> Given that video ip is independent of any board, remains same for any board
> variant of SA8775p, and again for the same reason, PIL, aspects of video driver
> was made out of probe, i would prefer to keep it in SOC. Again, this can be
> overridden in board specific variant DT, if any case arise, incase.

This file is also board-specific and will not be accepted by a board
fused to work with a particular set of CA keys. So, no. This needs to
go to the board DT file.


-- 
With best wishes
Dmitry

