Return-Path: <linux-media+bounces-63488-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zI2qFwLBH2rkpQAAu9opvQ
	(envelope-from <linux-media+bounces-63488-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:52:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4010D63469D
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:52:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gLRejsnA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Tp+lh4EP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63488-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63488-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7F1D3045B6F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 05:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7F0367B99;
	Wed,  3 Jun 2026 05:51:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4BB39061C
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 05:51:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465915; cv=none; b=l4EtUuBTAiiPxpqkeGi3qtLyZlLBVMQYBUzYDwKRqIw4GmW+eGqpWOnpzwqoAGH0ljgsL4Sdn7aC9uAxK5pa+RgMJkOygKfUKZwIREERvtMk799w0PZvnEEHIsi3BnfP2uFKrg2Kx9BTGkCONpA8QgDHuFLyTXlh9igPN01pUD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465915; c=relaxed/simple;
	bh=JU12tekL6GBhR04YvsNYNHGTnRlGN/sSSSIxQh1PeUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tH30OXXzWEmTZYvE/4d3dM7I7ThBrIFD8o7Wovs8GyY1JReczmDXtYGcNMT5g3y9TmAroUyWDZA07SrGvHqSB14g5AlNe6q+gPlQKh6O88oI3ix/anSlVyFgusmrXePElSeVSmJwNaQk+z5uHuTJGhoI0DmlaA3QTkymuMFGgkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLRejsnA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tp+lh4EP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6535WCXR1619630
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 05:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AoBXmuqEDW/B4n4M1GtYaMi2nefd/8NaLnywKReRnKk=; b=gLRejsnAQCm/y5ik
	ugn0LJwtvecXJpobc9QOcYHsKyVw+1ctVQ18LgKhz/YIJ8x77vwGfOGruVZ5gEz6
	PSY3LGCD/rL1Hrpr5QKxUa0viKgbwk6mSIWn+e/jqfFl4jt9bA+jSSS2Jc0BuH3A
	64KAweYROTEsZ2x7VVaixA1e4+OChDAb/vVr5su+lQxNgVXcW4dSZo51c/lhoi7H
	8GMSAC4i+tsgxdkS+RcNO7Xik29ObYSD5xYQSRNZSLK2jYAOKtjKyUZwvdRy81cY
	Ia63ghCRnpR7QDZpBU/i97wmIe/mD4/sAwW/obIKA1m9GJoUica6Q3apSplGsIEJ
	iTxykw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejdq7r5mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 05:51:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0532a6588so38710865ad.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 22:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780465913; x=1781070713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AoBXmuqEDW/B4n4M1GtYaMi2nefd/8NaLnywKReRnKk=;
        b=Tp+lh4EPnzXF56umkgDjKvZhyKD31jkdrqfEotS6V562cNk2Gp0cGOn5ZCe68tEp6k
         JtLoKl7Gza2CRtqgEknYYvDktgtE82dpyWKmtcf5D+FtG+PYA94kd+7K3uSybTwH8lEV
         PrlTcqoaRNYVndgv0miy6/97azEQOYDly6SMfmUnhL3/Gq2soaZVZ8zvoFrqg37v0dH2
         7DXLHRxbfNbh4wXQJfQC/ph3aO2i+avDqysCotfAlBkmeR3gUoszFdBL3NzEXeOBDHKg
         ZgWtSJGBECbLvbHNb12USU5CxPuABRuDAINO/4e4ng/kOOOSYbhit2ozpOuzJUEgaK7E
         Q/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780465913; x=1781070713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AoBXmuqEDW/B4n4M1GtYaMi2nefd/8NaLnywKReRnKk=;
        b=SS5oIi0zxQ0kxmB66RAAOBPrZpvGTZ6jMrp7PLEjAAc9Wk38O04EtfUEKdE+Rzypc4
         kpF8dOG8eQSjRhGEw9XafKQa0qps3saM+e091pRxVaQwtvMOzsEJXkef17SpZY7Nkcaz
         kEjMdHmLJ2UPyDMeUaXr3S/iNYnbOpEVIeeWyszLLY65eapQvOGZJHCJzGx9JifTMacJ
         eP5qvjjfB+ohYvnNthXL2vVUfHFoxKZY49sXvqnDaNdAJ0XFlIEca7MiMyAJ7SaDL2FR
         Xgah3vvBKEQLqBLHzUM9W3XZoE1S03BbFCinzmFW1l48D02Xz3e2oivoXL2yZeRiOxjc
         Ocyw==
X-Forwarded-Encrypted: i=1; AFNElJ/E4pS7AVYIxvz9teg6+7KjIbMwZESf2Vu1TzPWPAwKas7ssX6WtjsNKHDlxkdwZggecZkk7uX6fjSPAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+QC2o7RHZAxMd7nN29eJdGvIymLxjQokrB8pqWucTCQoB7fbt
	l+6Xe1xVpozNYcwb35yHwxgLplWirW6Omfu9TjKfGowuRrLK/GlHkoWtN3uUjmy7B1dUxLXSi1S
	Q2sboUBrtUAPFDIs8oJUpSYjS+GPBQO2FOofNtY0WA21cCwS9Y5Qo65qMdiO1EPfCqg==
X-Gm-Gg: Acq92OF2w+7SyQoFcFP52348cw8OaWZgz0gS8WENLhtUv+HNNQY8ss7MxFi6Mv8q03z
	3oObQe0JybCxWN4qhZMxm1yicfXZxcihUZiNG1kKsZnJzSu/dyNLe3exLA7LzIXmFUOByVLpRE2
	BF2DNBUQFk3Gfz2NZ9n5wdD0YhB7xL8Uqya56YSkGulU/6LnNCFK5O5xs4Yw+WuliCNSBa4YAAM
	YyMMmO9k1Nhf8z9xPMj981MIa/ACQxJL+iY+SItJchNYxyAWpLWzvUrjaHBp2i2QTmyT2kfFSDh
	2xda/tXkRT7dBA2aGeWoF+VslOxKoZ7c4umZkcM4i0YsTr8JsTu7BYln6id7SWmDM2LTW4emV1o
	heZGN12T9tAi+le0poR/BtsSufJfoKnupSvZYiV2iKDVn98/lPFGdSx0/LWlG
X-Received: by 2002:a17:903:2312:b0:2be:fefc:d5b9 with SMTP id d9443c01a7336-2c163a1352amr20027075ad.5.1780465912918;
        Tue, 02 Jun 2026 22:51:52 -0700 (PDT)
X-Received: by 2002:a17:903:2312:b0:2be:fefc:d5b9 with SMTP id d9443c01a7336-2c163a1352amr20026725ad.5.1780465912431;
        Tue, 02 Jun 2026 22:51:52 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2d4sm11280795ad.77.2026.06.02.22.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:51:51 -0700 (PDT)
Message-ID: <b5c9d149-1a48-4c0d-aa0d-9ad331896f47@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 11:21:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-8-b2d984c297f8@oss.qualcomm.com>
 <m4zo2nkxtl5yeyo7riuata6r5saflmdgqf37cz2g2ezrwhk53m@mnad6bb7n3ik>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <m4zo2nkxtl5yeyo7riuata6r5saflmdgqf37cz2g2ezrwhk53m@mnad6bb7n3ik>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1MyBTYWx0ZWRfXxQUd7UtVDLPd
 lbSxo49BZqm6qSBac/Auu6QlEQ2hcd2y1MsR5Yh9pvmlriNZO60S+IRi4FdByEFoeC+LZhB3y9b
 PnnbdUHAdUvBg6XzpHmLic+ihrsmAFs+hjubVtu6RsvSC+72dRzYrFXTHJiy7dYGk1lRnwn01Ss
 11B1QnXSqJepLEnM/NL91ziEsgBAQCh73lC43M7bqc7ttNekz8GlfQvYlcm9qWjJoV6TElP6Z7c
 OnAD6PA5fesG0sBVsclvJsv/QyQoKEAxtsZIprHWWpCzuyjW3MBMW9rHDIY2XPSl5eHc1CqhqEg
 DI9oKgFqCXBEhtvI0lrKyt2Sza0gIQQjHY6tONOwJLaIhvWcqstnbsxW5HFEB0rU8SY8xBYCgn7
 rEkZf1blKZq3njzfYf3p6vDCBxuYOWHDM3ZGHsSKNwp8ABb/Od75JP8WAjOrHl8x1MuAGq5AUso
 1ItuYVivYLP8LQce5jA==
X-Proofpoint-ORIG-GUID: hOuZYV7CGrJKesiIT-K49dZ8X6wkoEdD
X-Proofpoint-GUID: hOuZYV7CGrJKesiIT-K49dZ8X6wkoEdD
X-Authority-Analysis: v=2.4 cv=ccniaHDM c=1 sm=1 tr=0 ts=6a1fc0f9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-e_ofER35s36BqmFglcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63488-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4010D63469D

On 20-05-2026 19:59, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:58AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Introduce the DRM_IOCTL_QDA_QUERY IOCTL, which allows user-space to
>> identify which DSP domain a given /dev/accel/accel* node represents
>> (e.g. "cdsp", "adsp").
>>
>> include/uapi/drm/qda_accel.h
>>   Defines the QDA IOCTL command numbers and the associated data
>>   structures. The header follows the standard DRM UAPI conventions:
>>   __u8/__u32 types, a C++ extern "C" guard, and GPL-2.0-only WITH
>>   Linux-syscall-note licensing.
>>
>> drivers/accel/qda/qda_ioctl.c / qda_ioctl.h
>>   Implements qda_ioctl_query(), which copies the DSP domain name
>>   stored in qda_dev.dsp_name into the user-supplied drm_qda_query
>>   buffer using strscpy().
>>
>> drivers/accel/qda/qda_drv.c
>>   Registers the qda_ioctls[] table with the drm_driver so that the
>>   DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile    |  1 +
>>  drivers/accel/qda/qda_drv.c   |  8 +++++++
>>  drivers/accel/qda/qda_ioctl.c | 26 +++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.h | 13 ++++++++++++
>>  include/uapi/drm/qda_accel.h  | 49 +++++++++++++++++++++++++++++++++++++++++++
>>  5 files changed, 97 insertions(+)
>>
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index 701fad5ffb50..b658dad35fee 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>  qda-y := \
>>  	qda_cb.o \
>>  	qda_drv.o \
>> +	qda_ioctl.o \
>>  	qda_memory_manager.o \
>>  	qda_rpmsg.o
>>  
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 0ad5d9873d7e..becd831d10be 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -8,8 +8,10 @@
>>  #include <drm/drm_gem.h>
>>  #include <drm/drm_ioctl.h>
>>  #include <drm/drm_print.h>
>> +#include <drm/qda_accel.h>
>>  
>>  #include "qda_drv.h"
>> +#include "qda_ioctl.h"
>>  #include "qda_rpmsg.h"
>>  
>>  static int qda_open(struct drm_device *dev, struct drm_file *file)
>> @@ -36,11 +38,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>>  
>>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>>  
>> +static const struct drm_ioctl_desc qda_ioctls[] = {
>> +	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
>> +};
>> +
>>  static const struct drm_driver qda_drm_driver = {
>>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>>  	.fops = &qda_accel_fops,
>>  	.open = qda_open,
>>  	.postclose = qda_postclose,
>> +	.ioctls = qda_ioctls,
>> +	.num_ioctls = ARRAY_SIZE(qda_ioctls),
>>  	.name = QDA_DRIVER_NAME,
>>  	.desc = "Qualcomm DSP Accelerator Driver",
>>  };
>> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
>> new file mode 100644
>> index 000000000000..761d3567c33f
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_ioctl.c
>> @@ -0,0 +1,26 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <drm/drm_ioctl.h>
>> +#include <drm/qda_accel.h>
>> +#include "qda_drv.h"
>> +#include "qda_ioctl.h"
>> +
>> +/**
>> + * qda_ioctl_query() - Query DSP device information
>> + * @dev: DRM device structure
>> + * @data: User-space data (struct drm_qda_query)
>> + * @file_priv: DRM file private data
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	struct drm_qda_query *args = data;
>> +	struct qda_dev *qdev;
>> +
>> +	qdev = qda_dev_from_drm(dev);
>> +
>> +	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
>> new file mode 100644
>> index 000000000000..b8fd536a111f
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_ioctl.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_IOCTL_H__
>> +#define __QDA_IOCTL_H__
>> +
>> +#include "qda_drv.h"
>> +
>> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>> +#endif /* __QDA_IOCTL_H__ */
>> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
>> new file mode 100644
>> index 000000000000..1971a4263065
>> --- /dev/null
>> +++ b/include/uapi/drm/qda_accel.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_ACCEL_H__
>> +#define __QDA_ACCEL_H__
>> +
>> +#include "drm.h"
>> +
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
>> +
>> +/*
>> + * QDA IOCTL command numbers
>> + *
>> + * These define the command numbers for QDA-specific IOCTLs.
>> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
>> + */
>> +#define DRM_QDA_QUERY		0x00
>> +
>> +/*
>> + * QDA IOCTL definitions
>> + *
>> + * These macros define the actual IOCTL numbers used by userspace applications.
>> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
>> + * data structure and direction (read/write) for each IOCTL.
>> + */
>> +#define DRM_IOCTL_QDA_QUERY		DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
>> +					 struct drm_qda_query)
>> +
>> +/**
>> + * struct drm_qda_query - Device information query structure
>> + * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
>> + * allowing userspace to identify which DSP a device node represents. The
>> + * kernel provides the DSP name directly as a null-terminated string.
>> + */
>> +struct drm_qda_query {
>> +	__u8 dsp_name[16];
> 
> Are you sure that you want to query only the name? No extra options, no
> attributes, no hardware capabilities?
There are plans to extend this ioctl to support DSP capabilities and few
other query options, but as per my understanding, I don't need to add
reserved IOCTLs in drm case and I can extend it in future. Please
correct me if my understanding is wrong and I should add reserved fields.

Copying the statement from the doc[1].
"Note that drm_ioctl() automatically zero-extends structures, hence make
sure you can add more stuff at the end, i.e. don’t put a variable sized
array there."

[1]
https://www.kernel.org/doc/html/v7.0/gpu/drm-uapi.html#ioctl-support-on-device-nodes>

>> +};
>> +
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>> +#endif /* __QDA_ACCEL_H__ */
>>
>> -- 
>> 2.34.1
>>
>>
> 


