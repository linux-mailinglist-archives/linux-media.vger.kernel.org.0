Return-Path: <linux-media+bounces-45215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78661BFB2F5
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 11:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D0DF19C754A
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C8929992B;
	Wed, 22 Oct 2025 09:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gh+EwBkl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525728C871
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 09:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761125861; cv=none; b=GZH2NEKHonkrItU/7Wu1HN5J9e5cmMeGczfji/Vyvl+lS1eclukZ6GHUrV9xaJgfgiolI7tmsEHJ35XrLZ86qaDOCekBXuYNVzRCEqH5xKGgBKN0wysGHYHlvOPMVzHJYAh6y7ioUSo1hK6Q5qrY/bW7DlcpYIBdw87sMGfBie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761125861; c=relaxed/simple;
	bh=+/MjwfbZvPam/0xlcWCDrWKB23vGSjkX/nOorqR0QbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twPrYTT0fMHBA3Nnc8sNTVw7XdIMC5FWWkJOmE7zQ+r/gT/ZUvp7nuuFcT5OX+wx7CzlsI00cY0lEdxRnGhpU6iqOTANA05E53fmp7HCN+KAjp36y74d0+wwou+iEEw6QZJxvq4jDKGtyzO+L3JXWTmTShsWitRemQsB5R9X1nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gh+EwBkl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3BPUR026480
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 09:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wlAiuhzDMbNQ1Fw8Ews+PID2
	RPtvP6Wo25eJKEmIUEQ=; b=gh+EwBkl4qsCs7HhmSFWn28pRpHeG6IjmIFVe7rm
	To6R5wI2NT9fzE7S/jHLQZFn6jH62ldmrPmzbWK2Vt1pP/upE0bQn4AyKRZCOqGV
	1nFd2wW3MAFIAyiKrvyb1s34iHS3bm3txpP0G0eQ2JENL3PLrRaFuJ1GSOy18Lpw
	A8yhlzSvgJQWAoaipGgHHMaH3xTA85z9WYkUcErhkUhKhBBwjf0/62Wi77fgqPhM
	oONeSzmzrUJTq276d9/WU8bDZkP7MxOapRCXn5e/zapo33Z2ZUHdtosWE0e+z3Hy
	TKCRQ4csvlsYJsBUdolyAw/Tksf6hwF/aWzl9aRgFaL2Sg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j43bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 09:37:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a802113bso26476021cf.2
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 02:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761125857; x=1761730657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlAiuhzDMbNQ1Fw8Ews+PID2RPtvP6Wo25eJKEmIUEQ=;
        b=FEYKWBr68kjLqFLo9+hpSyYiNm9KE2uGpw9FtE9USqYOI8ZC0nxcCW3SG4n14ZgEKV
         eh2VhqX8lM7BPsdV/5HvUvsEGrdWyTkrqcL9fa+YIJfrLKAw+B5IUWbi6UkzooYFvziL
         zw57/5rGvVnruZA1chRe+welVpGaxrnPc7305JLTgzdqcQwzZuoCKIg4BRZFug/PVarz
         QFdkMZFIQ+yr0D0iNk6lyzDZhj5mW6byBnRFxiC4kS0LPBI0tD6ScqkdKzq/H+Cf4V36
         zqV4jGqv1YAp8W+xiuGrHvXXTh8/BPLDm0HCXnj0Gb7WNRj+FjOQU7ola1DeiroSENAS
         CQaw==
X-Forwarded-Encrypted: i=1; AJvYcCWmhoh8v+jWWHWAKtU+StP+CfE/xut3RAEzM/8BOiXRdzWCedqnPoj6j2S5jY4miuOeaEFRLvvyWpIyyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy99e1BMSTJew9dFqHB6igHwtublJrMvWtAElJGxYQk5dmyqJAW
	mYvqTs/6gkuNJ7fxHf6/VhtsBJRO2PeiwYCtJeLBQn2FKNqWycLqmQBOeDkjv+4kP0gUmO2i6Kb
	Ztp26bIXzl0OcpcNSmkXSUZynFvU3UvDEZo0z1mItFEfV00zRYRxy5eQkLHoDEoQUTQ==
X-Gm-Gg: ASbGncs/dKD2wMAWw2vBE/QNS6x33rOIza76dFRh2PU92zh8Zlu0XRjPEQs4dVwPB8J
	rLxSeELlNtfx2BjE362mQX4zzzSv3002Tmov0al7Zv6Pisd4RXhhcPGwKkfwKvVAGjbun/NcjXf
	IRuzNYuFOn3b29tM7UDn7QzRHHtVe5GUJ7AIOi0OvuFlSXaCt+xYvGwDxBH/q/8ZKf6aRYwVHZR
	aN78u68VY/yCN1O9Sw/a8Gmf3ObadHeRJ0PTDBAuHxSp6FLgAfLrIM5M0yYcgeUxXpnCAPxIBof
	bbNh6Kfgw/EBzXpNrPZ4dgrPk/RZgZykbp3uZY7L0dbsVt0THUeEIdsJ+OmSay4rDNcCewCtKyx
	lJaPKbDoKpDqhJXNXAbxvMEUl6VxJvALK+P9SZA8NXf2grd4xwPIewRTMXoXTn+zFfx0P5CWwV1
	UMvFu3ZZ4rbUA=
X-Received: by 2002:a05:622a:138a:b0:4e7:2d83:59b7 with SMTP id d75a77b69052e-4e89d2b96efmr232633191cf.37.1761125857554;
        Wed, 22 Oct 2025 02:37:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE70UH8P0+7IUvRLiwSQa4wdN/h/jWfuzbCFIRtzRPc21GQfKi9T7kEbCCKp2X/mu4mW5+IJw==
X-Received: by 2002:a05:622a:138a:b0:4e7:2d83:59b7 with SMTP id d75a77b69052e-4e89d2b96efmr232632981cf.37.1761125857114;
        Wed, 22 Oct 2025 02:37:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592ed7e6168sm702834e87.51.2025.10.22.02.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:37:36 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:37:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH v2 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <mtlwpa3m46qwrfjcpa7wapjjnllxopoip4mpnomw2ngteb6btf@2z4hrjr74bts>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <20251017-knp_video-v2-1-f568ce1a4be3@oss.qualcomm.com>
 <c9d8f76a-513f-4a09-bba4-cb8f0df1d2fe@kernel.org>
 <034bf6f4-0a49-4973-8536-28526b3409d1@oss.qualcomm.com>
 <d19b1279-3031-43b9-ac73-7e5f990802ed@kernel.org>
 <e1bfadd4-2d53-1953-beef-1350594c5010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1bfadd4-2d53-1953-beef-1350594c5010@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX0wVKkG60Pb7s
 SGzxVuQ2UmMpOnJF49cI4hmw0PCbEoC+1E3YiEiJh1EGV+X38zdIyIieiFJoWsFXDnSpl5Rk1vV
 TbzrdZVEM6jyPRvD2EpupANLuiHNMkr3hnYnjfo8a7LPthof2M49fS5xfZFebusygBxG26QiwOU
 Xwc/ikPYrcQk91mzmPdFs7/lNyIwqx1fY55W2+yZZAqprk+TiLywOxNDG/wOdFTYEeCvxxTMwSn
 rStO1LfHD2MEisaXgWJvH+8WjPQXq3mWY9C24Qo5WRbT4lgujTaukRqLAiTCk04ToQmEfXEJnFp
 WrLyL6xR5Nwe5f1t6n0+KNbfZAVP64zaf/Xa/YTWDDjC13m1S0bsOZoVJYafHx/AWNhW5A2wWEX
 4V+de0hAMdfEJCqx+hyT5mybGitw8Q==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f8a5e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=vTb42-yg0zSnFd-snlMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 5DpJkdBoJtjG0AJIpj6FQ1H5jbQkUzAK
X-Proofpoint-ORIG-GUID: 5DpJkdBoJtjG0AJIpj6FQ1H5jbQkUzAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On Wed, Oct 22, 2025 at 02:37:59AM +0530, Vikash Garodia wrote:
> 
> On 10/22/2025 12:45 AM, Krzysztof Kozlowski wrote:
> > On 21/10/2025 20:55, Vikash Garodia wrote:
> >>
> >> On 10/18/2025 9:28 PM, Krzysztof Kozlowski wrote:
> >>> On 17/10/2025 16:16, Vikash Garodia wrote:
> >>>> +  clock-names:
> >>>> +    items:
> >>>> +      - const: iface
> >>>> +      - const: core
> >>>> +      - const: vcodec0_core
> >>>> +      - const: iface1
> >>>> +      - const: core_freerun
> >>>> +      - const: vcodec0_core_freerun
> >>>> +      - const: vcodec_bse
> >>>> +      - const: vcodec_vpp0
> >>>> +      - const: vcodec_vpp1
> >>>> +      - const: vcodec_apv
> >>>> +
> >>>> +  dma-coherent: true
> >>>> +
> >>>> +  firmware-name:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  interconnects:
> >>>> +    maxItems: 2
> >>>> +
> >>>> +  interconnect-names:
> >>>> +    items:
> >>>> +      - const: cpu-cfg
> >>>> +      - const: video-mem
> >>>> +
> >>>> +  interrupts:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  iommus:
> >>>> +    minItems: 3
> >>>> +    maxItems: 8
> >>>
> >>> I don't understand why this is flexible. Make it fixed size and anyway -
> >>> list the items.
> >>
> >> kaanapali vpu generates 8 different stream-ids. Now, boards running kernel in
> >> EL2 mode can list all of them, while boards running in EL1 can have only non
> >> secure stream IDs. Min have the list of stream ids which can be enabled for all
> >> type of boards, while max is for boards which can list all in HLOS given kernel
> >> is in EL2 mode.
> >>
> >> Below crash would be seen if boards running kernel in EL1 mode lists the secure
> >> ones.
> > 
> > 
> > That has to be explained somewhere, e.g. comment, 
> 
> Sure, will add a description for iommus property explaining the same.
> 
> and still we need then
> > EL2 DTS in the kernel. I did not see such so far, but maybe I missed it
> > - can you link it?
> > 
> 
> EL2 DTS for kaanapali is not yet posted to handle secure SIDs. While it is in
> development, describing the secure stream-ids would ensure to cover all the
> hardware generated IDs.

EL2 is a slightly different topic, it most likely requires additional
changes, etc. I'd suggest focusing on a normal usecase first and getting
the EL2 sorted out separately.

-- 
With best wishes
Dmitry

