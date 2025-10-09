Return-Path: <linux-media+bounces-44130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 593B0BCA2B5
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 18:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C4D81A6495E
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 16:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE9D226D16;
	Thu,  9 Oct 2025 16:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcUpjNGa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2601DDC3F
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026837; cv=none; b=uNIEQE8FNji+Z1lUlzBGnE9+9PDPxfu1P0ofIirmBKYW6+BStZl7vq6za9dIkONQbJnmuW4xIKxa3xWe+Jgs4/pzZPtBDvuEeAugZeY9PsEfGnpObA32S5/gEsjKBjyzGPaKZ8s6O2O8/FxZ6IW2eK/mKSffyvI/FmqfgTo5vf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026837; c=relaxed/simple;
	bh=VbQsVyRsuWloA1O9V/3twwb3hcbjIIv9Hp3Pl6v70t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8q2fY+8TQtNcNxkDAM0nx++/P3T9z4jcP5chkf/A7vYvnqjeQB2NgezWEocP3A+a1XgdpGR8thd061AOGig8OHObz4fPc0IxAyQxpRmVYTQAe8AqsJvjkGGvNI7P9PYQnmnF9cKqTg80KJbNehFRs4SAp3/zQNLLwvoZ/3H5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcUpjNGa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EhjMK029611
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 16:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aUrMD37peXtVojgoLEAh0gbY
	11kyxgxZwVOkAKeKJMI=; b=kcUpjNGab2GgcvDjxDOroV6bmU94ubzm7qnW9Tpy
	eLe9TXkOwmYBHxvuqDv5sT7oDgdjqzrYJXtxMLiy61FvEndl3ADg6jr7urNmuYke
	B8Nbjso8TQgY+bM3G1j8o2qldn5vpZOmaFrr/rBnF43KhDaKMc39fo4E9ziJcn5B
	p7U3DjkV1Hxq+xWnuLt/94CxdcOjkoSvP9knM2VgPrYcaiKLlP+F1acCX7SLmX3B
	lhGwXjfz0kmVn/igIvH395qjvtoxWpRICv1vSYEZn36EdCDZEUyE3Hz1zvs6gbxD
	8Vyjor4NUJebC8a/TM2N3eOGOK2w9+PnVyFh/Q2pY8vTkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nkjvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 16:20:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e57359997aso21447741cf.1
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 09:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760026833; x=1760631633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUrMD37peXtVojgoLEAh0gbY11kyxgxZwVOkAKeKJMI=;
        b=rlfGxceihIGfBAbHQs5VBlXvZ+Golpj4mD+HMWNd69xwO504+gZATld+E4sm48ol/Q
         oSvApThZT9renXZhnjhTPfcASUWeDlWbSxgTb3F4XbyYWtu2XnnnVyyqka8XhHlKdm4L
         +Z9XYDYTZKFaF8GDIMH9RFVMGw3wZH37xO1MIfW8Es1RBzrRgQNrXx7qNlp3lcslArBX
         PZXFGt2dcTKRL0w9VlrZgdVJHfK5treX4KXdtMBj02Ct3lxxP8o3wXaLGFJFnl9zB/fj
         Ea3kztWEgUhKlRjuRYWxuWXMLGHDiOrJz3oRFsNJk6VMft23k39SsbQY+oU17SJB4Uyu
         I9WA==
X-Forwarded-Encrypted: i=1; AJvYcCW2tXfCLhl/3Zp8leRBVudEzhwG/d0tPAaj2/i8fHcPDxOnKuvySitqy023gvlILDribvZJQxGGsBqqaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXXEqI7NYqavk+JN/SfIDOl8Ol2mv/YRZPVU/UknQdzD6VnEbx
	j019A+P9eN741cOYjYZKcxl+i4anYE7Ruatyzm8bIJ01pJ9dgTdUfNbXomiUhN3HwdU895lsQ4T
	rwJhksxgNtZYO6ovXFQG+OtcNmoRUokiPVs/snN3TGNx86S3Nee3rryxseUarEgufxg==
X-Gm-Gg: ASbGncsEtK+t7K0ocUxAkhx1VwEmpUoZ70AFjeREQPhzrcVvBlDNA2NASMwSkrpV3OZ
	KvwQx5UZGGiPNjiQpJbnIN9yVf2y4uqgMfUowNelxQBYFgbskANRh6wORgObj7zvZ4s2Q4UMtau
	nyAcZ2AQDGgSTwZK5159gAMtOGlHRYWhQCV9CjVMSf/ZUxA7TUT2yH8iU2pkL3nY9bL7T/swMJt
	g3PvhZia/FBnCgxQA3BJ5BeIkeiIuDe+0wYjmIza8UQC5gbWKI3mRmyqhY6NN3p4yhV3MT85YFZ
	PLEm4XARBv/Le7R++P8NfjMGoV8RafI2B+rUX0NBSi6dCJv/TibVDb55fzMJ8EUJT+mc7hZ5qFu
	jiqGmts+yq6t+o4qntIw6Eeuzc4qBm/s2JRVKDIITnMDvpKI58znpoD4guw==
X-Received: by 2002:a05:622a:586:b0:4e2:ca4d:2956 with SMTP id d75a77b69052e-4e6ead1d1c2mr103131221cf.37.1760026833397;
        Thu, 09 Oct 2025 09:20:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJTouOXP+EABlCOSGus56DedrTUrViwKuBlKhFr3F8onfjvCRC5pfiuEb5yBFGb61EG16HEg==
X-Received: by 2002:a05:622a:586:b0:4e2:ca4d:2956 with SMTP id d75a77b69052e-4e6ead1d1c2mr103130711cf.37.1760026832905;
        Thu, 09 Oct 2025 09:20:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39fcbbesm29121931fa.25.2025.10.09.09.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:20:31 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:20:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] media: iris: enable support for SC7280 platform
Message-ID: <6n6teatqlppmstvcymwhf66wvfwc3upquvph3i7eina6htbxqt@ch23apdeykz5>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-8-def050ba5e1f@oss.qualcomm.com>
 <3f1979d4-1438-4c9d-99db-d97a09c5c35b@oss.qualcomm.com>
 <gdui5coiazt5ynuz6c6mr5slau33vuewr55vx53m5zzyi537at@cs7dbgirijuw>
 <1118c126-4332-4f9b-afb8-d3da4fa7fa87@oss.qualcomm.com>
 <um6d7e2su4erqet5fxyaxpyulfrzqvadq4izxgmxu3tol3i7jk@godpxwsqeqzs>
 <0a0afe32-7814-4901-bfbb-6694cd846257@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a0afe32-7814-4901-bfbb-6694cd846257@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX64+OkxjeGuNq
 gwCnM/n/8QFrIoiQV37qAS38Dw1wCrEWBilCtFXXj0LaVEPx2WoS7mx+wSYA5l8xDU5PRJOnhbF
 ead9Zwb/eBTt8xId1IKpSiqqna8PXbqiZV6vQ6fkukoG3dapB615wBk3f/0Pk5m3cNnOMClXh+Y
 aTlaJ6Yjt4VWbVDXWmevnf+ttjW6e5Bme5I4V1l438jW0kJc3edi51pNK00MV8oGH+u9ZBGCv+j
 xUzIn+4c3Y11u7guAYlFDQrqUdL9juIxib4+AkP4el9qTPWuof7HZV4Rm6ieWk7/yzTXr/6XnvS
 LrYasboVtt1qy0VvRUkFESI4jsokvV/CqhpVq8+cBHuWgEfpWEzbjbkeby++MgNFFQduK6ELe84
 gfB5LG8Cs5R5Wz9/8z1b064UBNtcLQ==
X-Proofpoint-ORIG-GUID: E17hQ2iG-StTf6lMLA5BMoI9oruWs-_b
X-Proofpoint-GUID: E17hQ2iG-StTf6lMLA5BMoI9oruWs-_b
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e7e0d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=LpQP-O61AAAA:8 a=t2CvURYCdbnRCxKuSPgA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 05:49:45PM +0200, Konrad Dybcio wrote:
> On 10/9/25 5:00 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 11:19:31AM +0200, Konrad Dybcio wrote:
> >> On 10/8/25 9:25 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 08, 2025 at 10:26:02AM +0200, Konrad Dybcio wrote:
> >>>> On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> >>>>> As a part of migrating code from the old Venus driver to the new Iris
> >>>>> one, add support for the SC7280 platform. It is very similar to SM8250,
> >>>>> but it (currently) uses no reset controls (there is an optional
> >>>>> GCC-generated reset, it will be added later) and no AON registers
> >>>>> region. The Venus driver names this platform "IRIS2_1", so the ops in
> >>>>
> >>>> Which we've learnt in the past is "IRIS2, 1-pipe"
> >>>
> >>> Well, I'm open for better suggestions. iris_vpu2_no_aon_ops?
> >>
> >> [...]
> >>
> >>>>> +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
> >>>>> +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> >>>>> +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> >>>>> +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> >>>>> +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> >>>>> +
> >>>>> +disable_power:
> >>>>> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
> >>>>
> >>>> ..for this line
> >>>
> >>> Not only. You missed the absense of AON_WRAPPER_MVP_NOC_LPI_CONTROL /
> >>> AON_WRAPPER_MVP_NOC_LPI_STATUS. Which in theory can become a flag in
> >>> iris_platform_data.
> >>>
> >>>>
> >>>> but this could be added to that one instead, since both clk APIs and the
> >>>> Iris wrappers around it are happy to consume a null pointer (funnily
> >>>> enough this one returns !void and is never checked)
> >>>>
> >>>> similar story for other func additions
> >>>
> >>> In fact, initially I had them merged, but then I couldn't find an
> >>> elegant way to handle AON regs. I can squash them back, if that's the
> >>> consensus. Any idea regarding AON regs?
> >>
> >> Digging in techpack/video, I found:
> >>
> >> commit c543f70aca8d40c593b8ad342d42e913a422c552
> >> Author: Priyanka Gujjula <pgujjula@codeaurora.org>
> >> Date:   Fri Feb 14 13:38:31 2020 +0530
> >>
> >>     msm: vidc: Skip AON register programming for lagoon
> >>     
> >>     AON register programming is used to set NOC to low
> >>     power mode during IRIS2 power off sequence. However
> >>     AON register memory map is not applicable and hence
> >>     skipping AON register programming for lagoon.
> >>     
> >>     Change-Id: Ib63248d118ed9fecfa5fa87925e8f69625dc1ba8
> >>     Signed-off-by: Priyanka Gujjula <pgujjula@codeaurora.org>
> >>
> >>
> >> lagoon being a downstream codename of the aforementioned sm6350
> >>
> >> Meaning yeah it's bus topology.. so I think an if-statement within
> >> a common flow would be what we want here..
> >>
> >> perhaps
> >>
> >> if (core->iris_platform_data->num_vpp_pipe == 1)
> >>
> >> just like venus and downstream do for the most part, and kick the
> >> can down the road.. In an unlikely event someone decides to implement
> >> IRIS2_1 on a brand new SoC, we can delay our worries..
> > 
> > But this function is being used for VPU3 devices too, if I'm not
> > mistaken. So it becomes a bit ugly... Also I'm not sure if this is
> > really related to a num of VPP pipes or the CVP.
> 
> Oh.. hm.. maybe we can add a .aon_shutdown op? I'm not sure how
> to proceed either

I think, if you want to merge those codepaths, I can add .no_aon flag to
platform data, unless maintainers disagree with this proposeal.

-- 
With best wishes
Dmitry

