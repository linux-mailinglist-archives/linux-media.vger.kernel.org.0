Return-Path: <linux-media+bounces-35585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD7CAE37DB
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF2B1166565
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAED620ADE6;
	Mon, 23 Jun 2025 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5bdbLzJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB1F1FE470
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666074; cv=none; b=dJkO/GLMQHBpb4AhBFoyR36n0trdid0qIqBeBb002Y48exymCSTbllUEHiBccXb6xoTizAKbuAuyeM6FGbDRyMpjBHF5GRvg2zoEBe/Xs39RwJ66o4WDzd82Ri3SfV7UaB04MVMnQVxqhVmLxet5A9FaJhBJJm29H7O8Xa+KtE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666074; c=relaxed/simple;
	bh=B4CPXnWbR9k+Yd3ZeRCcA6SnEKODoVSpqxSd0CBzTHI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ktbw5iIcXn9G/ZDeK+whsAC3izERQN5TQLx+hqnZpF4gSk0YtIt2q/jY7r9hHRmZ9zZ/LkXhn6yQwCrYo+JFNB4JmP+o5lE0Vq5bbzMvf1DNQpLPfKqV7JABSFkjzIpAgnrcojie4s6VluJyrJFCUipIsNapwy/fqf7lq+J3Yrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5bdbLzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N0PGAG015290
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oDMFlNkk6v0MChyRljc2vXBp
	h8oq8I0D2cJrN50OSZI=; b=h5bdbLzJPu4QDuQCHnsHoh/lPv24tLxnEWN3lw3o
	4ezIojzvlztW8mHjeopWk7V5mmrauQV89HZTdK66p6HHFPKLsAcgda4OJJASpO6w
	WSSY7amUbWQTXOSBUc7/mmILksnvaRbShCz0psJbfvXGvt3LCjATZFYKDWVVQtLM
	BLbEjruTCBLmfyIj6wzRA/qVOHrbu6uGNZYIx86NIoFrSkj/uCkBCxexROtbuvcm
	1L9FJwrAJFxECu4RBWMYI6+TvtZCEU5+v3+k5wqFPKf1IophVE5M4dnpXjoKbllt
	EkK4zL6mqOMGNxBSuvnumICKLCMsOP/Gupr5DcIFSbY1Zg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5gynh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:07:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38f565974so660527985a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 01:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666071; x=1751270871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDMFlNkk6v0MChyRljc2vXBph8oq8I0D2cJrN50OSZI=;
        b=lK84SRUFN7hjcSxGeYQazIN8TJuDIO574VWPcwrQdvkzVwaj+4YrGwSz7fVTIY2x/J
         6vP8gfRdCPjb26Yoyn6W48OtpMfCfsG0dhhKfGl8DYXEN3oSvmQ54LvZ0ztqjd+CK9Sb
         4/ckKynZ+7k5b4NGdahFApEZudN/t1FR4FRO7PiOHlkgtUCCRPo57QzkJael8OTndkqD
         2k0VKPSLBgnMv76uVhq9KyNrLTiqYFU7xgLBKHWSe7ZCs7CI7XwSiweCNGW3BszUtL0U
         r6ecbPrh9AJrr30oa3Hdyuq+Ga4+UTw0FbYk0OHcPCXxTdHishwvBEUL7jOCdyXQmcB2
         qtEw==
X-Forwarded-Encrypted: i=1; AJvYcCUA7fqQTPmEur7yxeW+qpl4A4ckpoQoaM7XiJUAaSlnkK/35UBfrozCvX/453xLDMzMmn+YmZ/bfxGnvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc8WLvNyxfnV+XBPx5gIf4tJy62wth6Iv6kwYGfmB5xeCojhhe
	HeKIAyW6gqxw9548/bdS2El6jpQ+ishKPzIeCgcL45gBqzuUQIeUDVsg1/0bukHXHtRXwo/2W9D
	Q+cYDLfssSBHBKQapdM/GjhtbYRiXF18gYC3dtWBohwVM75PuQJmZVPqD7nrYT3ugFQ==
X-Gm-Gg: ASbGnctLpcbGRocP1XSfx8tLNPn/+E3bFQ9IJS1lPOBF36JSVQa/RSMPUrYKUD+Gymy
	6OdnvGuBIbOWDfD1hw/ju/YJ7GN8edvvCUewIlzLi5/9w+NbAAFdPwlznVpaxHaM5N0CZo3p0F4
	hpnR2GaKsbpzau7mSvm+uqpyEj28PpDnWzkXE1Baq5uCFqOj7JP3QxXmktcnFy4MkcEc+94ktgo
	/cT+eD0spctnbV6CSY7wNh9dbNnDoBOzlkgSqX42PfqxgS+N1Vct/Rkg7Sk6V19Z1S0qty4NW/7
	EL/u1nvsXEIJe3W7FNy17skebJZyawjgu546oh0PQG2Tit0vRlWKQ/qzZw==
X-Received: by 2002:a05:620a:1a91:b0:7d3:a4fa:ee06 with SMTP id af79cd13be357-7d3fc08e0c9mr1465761385a.29.1750666070905;
        Mon, 23 Jun 2025 01:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq//17PLWLmNDldBebAqb7W7yo4ETm2ruyeCSlQOLTbSM3x4JTuSom1Eiu0rZzeYj/JZsz3Q==
X-Received: by 2002:a05:620a:1a91:b0:7d3:a4fa:ee06 with SMTP id af79cd13be357-7d3fc08e0c9mr1465757985a.29.1750666070346;
        Mon, 23 Jun 2025 01:07:50 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97abf6sm134859675e9.6.2025.06.23.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:07:49 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 23 Jun 2025 10:07:48 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] media: venus: Add QCM2290 support with AR50_LITE
 core
Message-ID: <aFkLVOkYZMHqEMrh@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
 <8c8bccd6-9a46-4ebf-aeaf-01f52570c0be@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c8bccd6-9a46-4ebf-aeaf-01f52570c0be@kernel.org>
X-Proofpoint-GUID: TITfkOvrgb30XXfQoRmqQXX4RsbYJxi2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NyBTYWx0ZWRfXzbjN0xfmLRJc
 vBUhYTmSCKkwQg8tdAiWGzoCuEt1MMiFuA2sLv3DjOgzlya59yj7uBM00+qDMKsV1sqtRk3GAtN
 wfkx7FHWfatevewLaRRjr3sqJUQOd+gqeLi35bDSdWfaPLGOSqBADQ2QqhGAs7SVlNn/SjIolo8
 Vk+CsenPCWV2aME4xm+aQzW4YIS59jef8pi5GQ06A4cQV7Jicq8F2i0982cXeXe0XdBUO4VGPge
 SY7Cytw7fjwFv4yWCx5vNHsBRxZp+W3+byIeBgJe0o6SbimPeMbP21R7dEA6YYGDt+GkbHqTbq3
 KzuHpZmxDnMZ9ebJDPvbuEJ73S/0AhU3YqUJLyBokw0thpYe1gY5YtGuceoHsikf20ZhsNzx+MO
 m3nmewAhF+ARl0BshyvXzB9IMc5oaUph8zFJCtQjM96Sx6Bv/awFlgOJJI2yCKRDgyz4SY92
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=68590b58 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=25ryw9l_FqF9xFXmehgA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TITfkOvrgb30XXfQoRmqQXX4RsbYJxi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=833 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230047

On 23/06/25 09:55:25, Krzysztof Kozlowski wrote:
> On 23/06/2025 09:49, Jorge Ramirez-Ortiz wrote:
> > Changes since v2:
> > - Removed IS_HFI/IS_VPU macros
> > - checkpatch.pl --strict fixes:
> >   - convert macro to static inline to avoid argument reuse side effect
> > 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.

ah interesting, I was reading somewhere that sets should be threaded.
sure will stop doing that (found it super annoying as well)

> 
> Best regards,
> Krzysztof

