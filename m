Return-Path: <linux-media+bounces-38884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AA8B1AD6D
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 07:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4F6E180992
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 05:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194CA219A81;
	Tue,  5 Aug 2025 05:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phwgjS5x"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26F11E5B88
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 05:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754370086; cv=none; b=P6RhNj84aYm8KVtS9Y2zGA/TRZgOYaQrF+kmjpcrIkoWpyAtwS9iKWXYyUe6NONfnoDoaRk02DOAJEhSPp6FhlJb9b7vJxo6UeY8jtXhMCrIHj3yRHzcoVVyazexeJz8wGFKybpzZxLsOFAE/UfWwhROGLZG9y3RzEZlYL7t76g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754370086; c=relaxed/simple;
	bh=xRL3ruAQkNgj97zvQUzJtTn9tgi4hIXR+ln1qFdIkWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSn4tVh7cHPfqePBa4b0KABevHNCWOreV1Opk9ghSXh1mFfFDFIa6aJxjZFVtlyZKr/hyZQfcB5m6A/E2/JeR/gjHeNWgtzSqQIKSRNCiLC9QKUEeVpb3vG0OjN1NOr9tHSKfoZvml6e+5e2DfFH9rnFxZ872420VPjeadfwmz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phwgjS5x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5751RefV011625
	for <linux-media@vger.kernel.org>; Tue, 5 Aug 2025 05:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O9RIDmNzhmmHiightJnBZ7fI
	75tTgnPyBB5yU+qp9lE=; b=phwgjS5x5Wrbd34/c9mJy01NrjVqbLwhnwmEwR8g
	kmIYh0CMbdbF2yik0sk6V0uoFffk2oO6wzTBTF/zDSPH/bo9bk8pc3bLloIJblHh
	s+cOZyrn2cymDnmBApp7Hv/UfT7DRtnhn3Y6XhHlDcMU7i09iXIfh4ZRhCEKAx96
	sj4FWqJmAJsV1MF/65Ae/cI3cAbzQNjrvLOBST+uSmNE0euqXa0GzPEaLRmu4pgd
	IHMSWuSrrWJqszD6fC4AU3AlgynHgfClFVhWQGc4H2S4dkI3Th3PwVVmFE30m5+G
	9KZWFIzKYoSb0zctr+9QZgG5csaCR5xgHcmlZFVs4ubuEA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b8ag0ejq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 05:01:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b07bf0783bso25934711cf.3
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 22:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754370083; x=1754974883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9RIDmNzhmmHiightJnBZ7fI75tTgnPyBB5yU+qp9lE=;
        b=gVfcZqJy8mT50DZCcitKjewDQn5AvCYytO+VjB8SwR60Lf7lKs7aZGRuPfTMaYUYK+
         /nPJI5Z8MS6epxCgmowjKlDU2Wja6ZXwmmfCpMLYZ+IGuGENBoxdxhc/P/wYPDS4G0AK
         AmT7CUae/IzLZjYV47lpREoMfMUIoCM6E9moMQcx7q3efHy/AsGv33lbl+l+d9oEmRnR
         Up318KidfCadApCaPTaXE04sFYNEZgl8moG4tgTlOTb0lvDGoRF7BCVeHhu2K3AGwzyS
         jdYHM8OsTnPr5z0B9x8lCfeeYAWZWBNywPJc32y2LDpOu63gsq/ws14ObvRxKIdlHwcv
         wrqw==
X-Forwarded-Encrypted: i=1; AJvYcCWkQ/iRUJOf/3lCNWdM3F7grme4oeM6WqCBkAlWqu2Shg/YtQVYiTkcnMDsqLFCdJqTX2tMniuX0XToHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh61Whw3IGiE/rtHmMD5ySdswuflXyCDHLMFSmDlh4dDIBFt/b
	dZUji2+PDGcJYa/Al8wmP552+GIoVmnK+LxMWU9qNqljzG6yzOFBvlGu9WcnorMfKwAd7KhRRbe
	tXrtpyNAMOImmwiYcgi+lQR10UFQ/sbgUZ8QMhI1+wNacZy6jgmEJs6gsspYsBC3Bjw==
X-Gm-Gg: ASbGnct5q/t2AH4tpmnWZmFnalM7sKHexDz65X9HT8a2CHlvTEH2JVQuU6HTzWXUdaB
	6jNYX8IHbUbzVlad4cnplJVoSsBkEzPO5VX80VywTca3KRdk3kZyMdGxqT+/LhEJYHBrA5dNCY1
	PmZyY6V+gCbZLZT2JuQnVrVgXyucf0gQUkBs/jb68ZYheyTi9Xx8Par9avWl6uKJB5RFfdjZK0i
	n5IBXsn307XydPW5jdFg+o0GDTBd0HRQLM69QVE0gK1ATCHSqjS+wU9WVkfksiRUdK8/mGOViN0
	fT6xJ4lLMveJwc5hN+Ivq6M+1/XCtjhrsAXTOfn3J7VGZCMzg2+5PPlyGSpqwhjgXl29W/IfhrS
	Tf8W9kB5HRhNjbeSMc+/WFgOGu74nNTlOAVmGShI2GFdLpQWG8KEw
X-Received: by 2002:a05:622a:2614:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4af10a4a6f8mr183536911cf.38.1754370082946;
        Mon, 04 Aug 2025 22:01:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFrkygcTlWMwxP/dXL1HWOn4RsCOYuS94xjX9GRmLBpCLWrY5VJAZwhtLhFsjZ3j/oj45ilQ==
X-Received: by 2002:a05:622a:2614:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4af10a4a6f8mr183536451cf.38.1754370082422;
        Mon, 04 Aug 2025 22:01:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332624953b1sm9339861fa.80.2025.08.04.22.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:01:21 -0700 (PDT)
Date: Tue, 5 Aug 2025 08:01:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] EDITME: cover title for mdtloader-changes
Message-ID: <volasof2jfa5bv7f7epyetxgci6ymt64ampqf2hhqhjf7co4vo@afkw5oxoralp>
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
X-Proofpoint-ORIG-GUID: b5tACbU_XYUz1Z5uk92ezMbrJedAHSFS
X-Proofpoint-GUID: b5tACbU_XYUz1Z5uk92ezMbrJedAHSFS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzNCBTYWx0ZWRfX0afidZvmTwH7
 VMp/IGYS/B0bds8fuP3ZhM9oQSNa9rfbIZ2Ugzsp2EZgWI3d756bQWfRI7f7YqLNgLiFZcy+sQT
 5MBG+g1Jur9YKBtMS3MbRtokp19fySJHjSF6Bw0qGV8uYanVKqZ7lwLs6vTKyCtUCMwFqXKQ/xq
 +MGJpLTsafbB9ikr4H3Hi01IGe7tVAt5CLEgLmb+aNvDJ1bRpBiS3yYQy3DxUvbYcEqZ19vQD8v
 iFAG8Qc7g/qOl2qQalsywbkLmYG62qMQewBV6vTCJpWVT6MWd+D9FzTyr8wZnJb52UGkoHTjm8a
 ziEaahaRFc1dFPfEOKUxYVx38kBZPn6fu17B7JiU/RPJRqSfJKvKtV8ZN3wj4feC+GituCiHl8d
 j8pWDmkdjtvR3rvQO21B0ZpmSdOVnEjLg1QdB7vQZuVVR2aJNRCc6EZroUJgL9XQnwGuyS1q
X-Authority-Analysis: v=2.4 cv=aJvwqa9m c=1 sm=1 tr=0 ts=68919023 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=PPOPQqKM8dVImZj3vAoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=830 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050034

On Mon, Aug 04, 2025 at 06:11:48PM +0530, Mukesh Ojha wrote:
> 
> ---
> Mukesh Ojha (3):
>       soc: qcom: mdt_loader: Remove unused parameter
>       soc: qcom: mdt_loader: Remove pas id parameter
>       soc: qcom: mdt_loader: Fix check mdt_header_valid()

For v2 please move the fix to the start of the series, so that it can be
picked up independently.

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

-- 
With best wishes
Dmitry

