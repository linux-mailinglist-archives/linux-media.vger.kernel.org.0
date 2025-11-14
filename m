Return-Path: <linux-media+bounces-47049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D46C5B480
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 05:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F0E003519A1
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 04:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E89B283129;
	Fri, 14 Nov 2025 04:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcdvIvc3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S6ehArPl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C088127D782
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 04:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763093555; cv=none; b=rdAjW6kHovZ+eV0BBZCIOZwi23iscikXlgkqZpKndvVBLmxV6NuTZcqWs36BeuFr5ENmYVFc33Io3LtN5hXg+QY843fTGV7/nl6hvrg+dspwEUwztSmc+M4MzcN4YkIf5ODqAwTacOkNZ7ksA1/lzYwsBapnZ2EC3F/qRnThY0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763093555; c=relaxed/simple;
	bh=vqxQ3dK7VdFS3PT/6Q6WjwlGkrU2MdtNuweZl3H6mBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=By4DkUr9Ha15vK/WDpL6Y6YOKnp34+CnDbJu6iiUsly4xVit1yRR4pthvp7oA8CEg/Tl8Ti6mVQrbLohzowH1iDU+oChpCu+h+mwvxNNVT8hwXZ7k/AtMW5yXqXxl7cBmBNpnbyvqHOYBast+gMgvb9CX/qofX5ldN0v8CjMOJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcdvIvc3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S6ehArPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb4qv1488582
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 04:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l9FUBbeUidxIV00pdQyQahKH
	PpoxkuEk9fyNczKyhZ4=; b=WcdvIvc3sMDYJHBly1X7GlPj50GGKCEK4vrDj8k0
	5eaZ80++Ws3b6M4a/w2eVgp5fBZPqpReXJ6xcZvCuGqlyHQVAUPNMJplXDtRkmjR
	y6847o+zGxT2XJUEtVt8QOs1dNpy77MXiVZuOJgYMs0BamIgUtjw2hTVBYrDWjPI
	ByZ746JdSL8Gv5MgaoTNMk2yzeUNW4jCf/D2j643Vd/vNt+46rBlvy+jz4Ihw0Z+
	fTd/SLbn6SPCPWVriGZp93nSNSFJRad1vxT6ksE51c5WW0OqhiOxjWbi0pFY79Eh
	201wVoknTjIeNpA4GWGoZTCf94s18YBclqS5YUrFYMV7Vg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hrrpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 04:12:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b26bc4984bso784568685a.1
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 20:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763093552; x=1763698352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9FUBbeUidxIV00pdQyQahKHPpoxkuEk9fyNczKyhZ4=;
        b=S6ehArPlA6Y4Y2WhGL5tW8g9/P+SLUq8P/kEOUNHMBNtktCmPsFqnHMd7TRn04iPvO
         3UXvPPUHTZFrNRaz15CaNWcEokgpflDA4lHpPu+L9wZx06AZC8GrhZtLXNVTJk+CMbdu
         11zsB1uyN//YAxP5Y6B6mKG39c9o8KpIfLjHmkBiFb3K71khvkuwX4igh8z8to2voa3p
         zeYb6yua1xQrJTcS/hZVKWsHoARpHWPg+pAKO80q7A1M9sFReG2WhdDHevHZdxs/91T0
         ILNhpfgX4oj303aRnl5T51TBtUVEF1XALli3nQ25MOMx2STZunr5JokL0gQauX1zO4qz
         pY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763093552; x=1763698352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9FUBbeUidxIV00pdQyQahKHPpoxkuEk9fyNczKyhZ4=;
        b=rxHlLNLf1JABgTSPZnNf9WKerhF3XZ6G2FXloSv5SkE6FPsc2sTodrfz1Ui2fI1fKh
         +lkXteXmNrINMIEqTGfnXxbHU5xQRhSyXw9Dzwf8hiOfyweTNQPif8mHsvp6W5qgCBGG
         k1qJ6IexcT2s2ojhbsE9PkCnSAAPn5b9BGQSL3blNtAhTe1vhBRtW2MYt4wGQnpIwC+C
         A+42EcIqH/u7p5j0OA8fdEUZcZz+JmcOpsk28QG5DddS53CzMER1/gmTLFdDm2wRBJjz
         BsGlt0W6zLoGFvxcc4JN8/Dm2ejRX14XL7igGgcw+kt/FF6AFccoI2syCuL2058DPNFT
         fT4A==
X-Forwarded-Encrypted: i=1; AJvYcCWKP8rdVZLtsk3jIBl8UYxHOw1Ylk5MzxvV2Xy5Mqdp7UXbTx5V+ZjGYxA/cGrGt+Mm6valGAbD/O9qhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyIv9lYJAy4LnjXT6CsJWy3q6AiQQpo1hmwxz7LTlT9JPjpPXX
	FZ3y0X3gq3iNV5PDubiC7DJt7Wu8P5ZBsSIIq/axObEc+j4JfVhDaAz1j2eKiVccuSMiG+XqOz/
	0LTxcDwyo0npUbxMNm7ByhR8W9Vz+gRIncnFW1FJUvDfy6MtRFjwanGyuNI2CBXjBkA==
X-Gm-Gg: ASbGncta/khHumDNdQXmLuo/CqlI9NNnJeNG4zzWMWNgiiIBqdGlXOf0Mm9eB84BoDD
	d8681hCEgW+sPVqwARBlGwGvBCCLbHkLRGsQb114JEMVkNjzLxi945ASO5RQXwaiMCoP7f1IDVn
	auaeBkeF9qVxAgUfGsEavevY3GkX8PzCfUGOQsHCUnh/ONn7kqkRP1wV/+9/WBqgZZecWOiM1Ge
	FiC3jHU3CV30dHkSv2VdXdJ76hycPWAjtz912qJHNQp3KALiLEjlJJfLtWQw0YRIS/FHSn3h59u
	QNDMQEOa6IqOgDor/jJknFXDTfFI/7t3T+lE45cbbYeAEu5x/ozUpaugFv6mz7SYk1Q/POg8+Yn
	EK0qhn0q4Q1PXVv9PK28cSn2LR0xazC+z28rbK6cnxaWmKrk5MZ+iyrk+NfP+/E+5ntwxld2aQK
	TZhXw14HB6NldS
X-Received: by 2002:a05:620a:4628:b0:8b1:ed55:e4f1 with SMTP id af79cd13be357-8b2c3175d59mr235431685a.39.1763093551955;
        Thu, 13 Nov 2025 20:12:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRBRFxxiAD30mEJm55HBtKCBqJwVeb/nqEO1wa7PZ+U+vRFrL3SI4k/Rw4EJ92OxtkmKQ+nw==
X-Received: by 2002:a05:620a:4628:b0:8b1:ed55:e4f1 with SMTP id af79cd13be357-8b2c3175d59mr235424485a.39.1763093551352;
        Thu, 13 Nov 2025 20:12:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405a4esm784867e87.95.2025.11.13.20.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 20:12:30 -0800 (PST)
Date: Fri, 14 Nov 2025 06:12:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
        Vitaly Lifshits <vitaly.lifshits@intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Sagi Maimon <maimon.sagi@gmail.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Karan Tilak Kumar <kartilak@cisco.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
        Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
        Max Kellermann <max.kellermann@ionos.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
        ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Przemek Kitszel <przemyslaw.kitszel@intel.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rodolfo Giometti <giometti@enneenne.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Stefan Haberland <sth@linux.ibm.com>,
        Jan Hoeppner <hoeppner@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Satish Kharat <satishkh@cisco.com>,
        Sesidhar Baddela <sebaddel@cisco.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 06/21] drm/msm: Switch to use %ptSp
Message-ID: <ngzyqzrjg2msv6odahkirdipjizbpaecfscfgnic3su5fl6hs7@qgdb53svq64p>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113150217.3030010-7-andriy.shevchenko@linux.intel.com>
X-Proofpoint-GUID: 3PDAUI03WXZOZUEdFxcckdSm0jqxqMEA
X-Proofpoint-ORIG-GUID: 3PDAUI03WXZOZUEdFxcckdSm0jqxqMEA
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=6916ac30 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=JNz3O4sEs4oywJvo4n4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAzMCBTYWx0ZWRfX3zwJqcO8aw8J
 hDSmJOF9NZGT+j4TmXjbO3pfyH0XKEOrMfCyuXW+gbIrNGentJyrQWTMf1ubaMk2cnT8G6Kiu2x
 vkOoCSviFzj5Tvw372DayZBo2tZQ45TajZK6d05GBu6wp5wto6SaQ2Xbyi1wVtmty641Cno1C+s
 X5/2MU4mn+oeKmg63iSj6xZHAYlXTSbHD2iBkXJL/duxJ1l73nzd/dVeiOGuAI6NtViaCAyuboH
 JQWsJdHRsADyBUzlaUmZsuExr8fnnBcqu6/FaBqArs55iaQDn4IRzPNxJDbp5Mr0vfzT95pz8Oq
 f+HGj01x+VrkXSFSsnNmignwb6T8vaFeSi7goqwPEDkyC8nIigfLO7I/rxPLpqTYU/W/romr8zd
 iqlPsewDGqpSlQLdfBzQfq3Xu/P4eA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140030

On Thu, Nov 13, 2025 at 03:32:20PM +0100, Andy Shevchenko wrote:
> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 3 +--
>  drivers/gpu/drm/msm/msm_gpu.c                     | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

