Return-Path: <linux-media+bounces-45806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5B0C1458C
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6681858601E
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F393090D7;
	Tue, 28 Oct 2025 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCdJFf4g"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B365322D7A5
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650816; cv=none; b=uxAkMQe5mSQM9jgpXzljPwU4Xp8mTb1K79qPkmY0Plcd38T73AZgjTtRE3N0lSbThE52Dw8k5EUdSMeyBcPLIALqGTv9JrXNLUh4bt6S9qk6wmUUN85NvQc3Q0GPs6Pzq3Qi1slpE3/PKsfGNzu03ancTo81Zk51iOF9PPrwnJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650816; c=relaxed/simple;
	bh=fBufmoiCsGgn84g8PYJQQN0ig+1uXDDqG60gqXk1NoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ab2OsRbAakK17fkBLVky+DkmWvr2qYZBsYdRXlpEl7da5VR2QGFfuGkZ3eKlwxy8oqhKFHg7YqjLNT6U3SaYA5b3F8GyAioJE4bukBak4eM4lX7lt2yWl1Z0raCBJEnviW0IBc3L1aIn5ylHKtXOxn7owPrJA5XAYIYbH7i8WgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCdJFf4g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SB55DL552969
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CxtEXxyjpblH1VkRqNJLlrUhubXxvJIKK5oYF03s0To=; b=DCdJFf4gvZ517ofF
	nGY8WnAseGDEFBoaLpyMtbN8khAuIFnGBNuJ7YoOCdjHGQAFMKdLHtyjCXv9naVc
	G4Qn/fMz156ukvgkfGVX9XK9Lx2lozqLOrTmTfBIfV8nxYX9Mae4x7U6PjZMVy9J
	fo47om5K9W3tNzidex0+VYvMP6ml9ifgOoElcsB395PbmQHUwFYP6TZ8PeZEZv47
	75MzaeR1z3fnrZOdTJ6GeGh2LJ1NKQhThdBGSP2a0gzfI5WfgwCCi5B7pCTZE+Ey
	GX3fVQUfu/6NUNv2gtIT3kJMHbxrZQ/EJ46YPVTZVROuS/9dlHW4pYDEKbAkwol8
	9/AkDA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pjf97rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:26:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78108268ea3so5467763b3a.1
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 04:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761650813; x=1762255613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxtEXxyjpblH1VkRqNJLlrUhubXxvJIKK5oYF03s0To=;
        b=ZKKANIfZ0/sd2Wve6vSvcab6tpwSqmnuBLTh/R/1WJJ3xBLObUBgVvOYkxKgE1NCRj
         MPauJ206S5LIEPQXp85q4Ie9jtWBNrjTUrcpxOo1ouHMhbXKChuirT9lqp3YvnUjVRHs
         uQfJAS1Jql4yMRyMT97s/8vcgv85YyS1c8hsPERhr/qsOq5wmSokjor8EC7RvQEuzLWG
         raGVpCwqwjGe+kKEeSzVAP7hxQ082AMHXmWBFBOlewplciP7Dq3weeieTHb+LGBtn49p
         vD7cDnBxBD6Pd9St1i2yjQTa+ORkKhZNCXS/9puV220gDrc11e4WqL4bjprlFUbExdZF
         kRJg==
X-Gm-Message-State: AOJu0YxaI9fOMt7fpeoirft8AV7mhCYQLHIJnrAklebuSO14eVBR0DQ3
	KgWzjePzli+IpYY6PTdKcXB/INCJW2WeKcvk6bSAU9UclaKpAwbjyxl6FlZ4Ip0WKzwI1Iewtn5
	zB9qVbyFF48yiYLh1IXWMoXHw/vf+FHOpZzPfQHK3Znr8RorBz09Ila8mnOm+5cspnp7UQhRj3w
	==
X-Gm-Gg: ASbGncvG1U3oTJBldJ8L9zbRThLWHWxgIJtD7O1aSkvpJ89ajxCFGAvVczUDXzbKuQw
	mo9MkQuXKpRfeqJzFAPGmi3+Q2iu1Wa279mTIjrTQWDRsHM4xhbHgMOTuy9RmLiq/vaaU0tIeX5
	tBRAs57Nm6hW2rwYs07Y1k/DaZN8DwWSNZDbNmesKy9fGiPQ5XEOEN+4QsVH7N2dVwfKpMoe5LR
	wbZPpolxKeewOid3UWtuWCs5qwKjJsJuiaELhwM7FcZQ3fY9SzVXOmblrb+0NeQVZn4kCgsUPLd
	t3iSFSEUO16i2axTz8wyK9CqBzJ40alroPRdxEKJlZkHYinGDlGuapYIHoo/gQNMydQvLFFh1Iy
	9jZ6mydLzwo8+Ak0FQbFjWLaffcm+a8s0
X-Received: by 2002:a05:6a20:6a05:b0:343:5465:bb99 with SMTP id adf61e73a8af0-344ddcd8a01mr3908452637.6.1761650813104;
        Tue, 28 Oct 2025 04:26:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGq8RNQDq78SryaeLfUbPZNmMQJGMYafxHnDpHHZnEWn3AO6zvI3CRYSi3qIUs5L7z7X2/ng==
X-Received: by 2002:a05:6a20:6a05:b0:343:5465:bb99 with SMTP id adf61e73a8af0-344ddcd8a01mr3908389637.6.1761650812224;
        Tue, 28 Oct 2025 04:26:52 -0700 (PDT)
Received: from [10.204.100.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340299e6fe2sm1297385a91.0.2025.10.28.04.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 04:26:51 -0700 (PDT)
Message-ID: <ef879fc3-b437-919b-7ba7-d67671cacd77@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 16:56:45 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/3] media: iris: Add support for QC08C format for
 encoder
Content-Language: en-US
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <20251008-video-iris-ubwc-enable-v2-3-478ba2d96427@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251008-video-iris-ubwc-enable-v2-3-478ba2d96427@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ut9u9uwB c=1 sm=1 tr=0 ts=6900a87d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tQ2HcwaAKAc4KCduFuEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5NiBTYWx0ZWRfX7LzhNic2weot
 XDpZtFi6OmLBvpFNzELVX0/BKssDUlIXRlqO4bmavOVQZRywARcctrA9Oy7DSi6NsQMYxgtxW0z
 Atc4mr6gO4okATicyedQMi3jo55guL4uRX7zQgSQEbiBwT6bGn4sNTUjAdcPKb6pWiPQnvfXMBN
 uIhrQVh1anXgibJo34r1SuD17mQhD5IVydfxL2nWkWYOH+1WLvGqw40VtrzvmQFSM6vzWbfP4WI
 Jz0zBV94f613Kfh1wbEJjFRZntRRrUr9xfF18bv4GRiDpvnF/LugGLPBG77nYV4dhm02eRQJWVL
 ky01SEJraPTkJmLHGLNkIGwzaCJts9LbY5RiBF+2makQ33lfrlI6G4OJo6siiwQG10ncFchBNsM
 o+BxZqGC4fMX0yp8vrSeVmvyb2i5yQ==
X-Proofpoint-GUID: VFgU8AdTk3v8E86gLukniAGMkQ2AJOSq
X-Proofpoint-ORIG-GUID: VFgU8AdTk3v8E86gLukniAGMkQ2AJOSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280096


On 10/8/2025 3:22 PM, Dikshita Agarwal wrote:
> Introduce handling for the QC08C format in the encoder. QC08C
> format is NV12 with UBWC compression. Update format checks and
> configuration to enable encoding to QC08C streams.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     | 12 ++++-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  3 +-
>  drivers/media/platform/qcom/iris/iris_venc.c       | 59 ++++++++++++++++++----
>  4 files changed, 63 insertions(+), 14 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

