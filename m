Return-Path: <linux-media+bounces-62293-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A+IM8G/DWr32wUAu9opvQ
	(envelope-from <linux-media+bounces-62293-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:05:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7139C58F4B8
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0EB57300680A
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827533E7BC4;
	Wed, 20 May 2026 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdGVqRzj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgnDfypb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2529F3E7141
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285944; cv=none; b=UMcExbZKQXpny5LdOJ14fQj76IfIkdjeQbchSXRZsLLf2UkI5y8GCIyhEiYhqhchsuVhqYZmeaE4DN8dB6Vk9j4G69wjJStjgGWi8kpIwCii1M9bPAkr3SvZEjviUQlGabGIkE18OATsZu3grw/zbPNpzmaIqSccW3UwQnZ7Z2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285944; c=relaxed/simple;
	bh=bxhg2HxFmld3fYJF433QWvJMN+XCIp0MPqLoIN6K3y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avcg9X8QSFJSE4S5sexCVd1DDJR9WBTG6mun/bsN+kXW9tSZH/GoPnGcoD0jrtihGQPSioAVW4WBXCRFidcaxLPyBv1DHuZgolyuqk9zk5AyNT4XQZP2tCHNJD3xer5b8d2F+5C484umS3cSfZliOHral8qJCxo2I0a+vIUM1+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdGVqRzj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgnDfypb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2OKN826612
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYuYOeuKLU/F1YE+q0QbOg5zwMu3UJcu2pfEYYYE19A=; b=EdGVqRzjucFwT49w
	wSuOYqa1DcEBhIYGmSAP5UaGSI+FBYEwoK4K2nOR5LuSTZ+PysT3pQw1lppIYVNN
	uDm81WUXn9T/i0nDVwT/Ysf6bkzjZmrgg0fzR1O7IY2NAY4ATQp/iCIHqHJsv43K
	shMwAIM8uWKebr8wnQB4e8bgco59u2Qkfido66ov98H4AN73ZhyJYbI5C1tyCHlc
	zCn7OD8fXKxsWM5TTEhLfbGid6MzBY17YF/9dwJODR7geqqq4wTTGV7o5UKRbvbo
	KFvfkkKGba6+CjQ88Uq25Gh5UgZJJ34Nr8xoendBKPdd4ZrujEiw+uZwhNkNwemW
	+O5Pjg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecag0hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:05:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7aba0af02so47286755ad.2
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779285941; x=1779890741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYuYOeuKLU/F1YE+q0QbOg5zwMu3UJcu2pfEYYYE19A=;
        b=IgnDfypb0lTPGpsRl845AmnD/sIJxmNxtr2TCMBo7rBqjW+5YXwBF4srDdFdIT7KyX
         XcS5vpQAahY+uAMsIeIO235iTFjsRBIDgdA0UMy5fKrOEPU3tY3gLK7hUroY3hTZ+bD4
         g9tkfAhNP7+0uJd0VXuDyaZz2+TyiabpUbiTCwl0jDGczQqgeus/umg+toIVVbrROOG8
         8fg1XzG9CqhDyl1u2HBJKxu6LR+gyCPavwuFZpFDm3DUKqjLryDG0r3R01q8qkuJpFSI
         kUqx/iPS6sM3yyGiLZ3i9Pwx6GjlwPwx3JKhT/e8wIIpGY78u9IemXoFZT84DErvOO24
         KJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285941; x=1779890741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYuYOeuKLU/F1YE+q0QbOg5zwMu3UJcu2pfEYYYE19A=;
        b=ga3BP4Og3GOg8JlolgeJNEn+uB3B7IwqJYQ1ncFWcYyHlN4HTiRir13Wsk2jFgG9yc
         xKu9P67uPS2aqdib1TSfHLb6z+uQfNfNjoe8hnV6FxEQfcC07kYUSkwXhQglBtDPBCEl
         KX9DuBG711EiIGaXajYtuNVksDWbNPaRS4MCEv3gYeazwpE1cCwcHVpzV/nk4BdI1UJK
         4AxGOYejSFdsXe24jN2rkX6mAlQ00c9r5YRB9WLIZVWEwcdwMFLHMPDGy3Kwulj3s/wu
         yclJsLUn7z3/uHQGVY8WOabEKrxlbaLR2ePfVa94LoBs859WdmYP8JGxXbpgTBESd2rQ
         zTcw==
X-Gm-Message-State: AOJu0YxAbeG5bZIEHZczpZhG13UtdcdnjFMv0xqEb3AtBv/KkZS2HP/L
	qTC6N8FLzmrWlfNYhaTXbYbvJCC7srS9Ppvf8HyROvHYI+E3O1CwNg7eNrcb/yuUkLuLOc6L4CL
	6zBQJBiReIAqMqPVrE0WJ149REhGEySQounHc4T3XbvXknJUmz2KEauTlvlN3X7Y2LA==
X-Gm-Gg: Acq92OHzUTWqltTmV7X+FeW6U0DH3YH9Q+/jVNfHISoW8KnK6UJiCY2ZBLHw1DwRp7W
	6gDuzVqmOfiWji/zXkNrEAtgdkJRqYV+9bIVFj/bXza6sr6dmiG0jXGA0cO4OO/ZnZhBR7Hhtm5
	mJHPhPyJiAPTACDHSjRDYgQeLHUAWCI1RN5TycTNJIUlB2aWfvLdsnZDb5J2PQqgh2DwoA0+qq7
	qpP+wsCxdReyivnXLSJHlp9qQ5Xr3bnKi7i5xhHMYQIjO+SI1EsfS+84Wc+6v8TbFPiYL6jKC53
	c5H2lxxABX2pwiXS5Dr7BDyeLhkV2TrQXXCMKQHiZ6QzcvKdrKTsRx+x4Bfla5aCc9CveFvrh9T
	C7KOdU/ueK/nIVtyZHQlTLyl7MEtXrrJ0KHaFXlZc+kXOpJtb6dbogWU=
X-Received: by 2002:a17:903:2284:b0:2bc:9f51:2922 with SMTP id d9443c01a7336-2bd7e9db7cfmr238085745ad.41.1779285940611;
        Wed, 20 May 2026 07:05:40 -0700 (PDT)
X-Received: by 2002:a17:903:2284:b0:2bc:9f51:2922 with SMTP id d9443c01a7336-2bd7e9db7cfmr238085155ad.41.1779285940030;
        Wed, 20 May 2026 07:05:40 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fc2bdsm292402795ad.63.2026.05.20.07.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 07:05:39 -0700 (PDT)
Message-ID: <12650883-177e-4e92-bf34-370249cf6994@oss.qualcomm.com>
Date: Wed, 20 May 2026 19:35:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com>
 <20260512-kodiak-gen2-support-v4-v5-2-a98968423d24@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260512-kodiak-gen2-support-v4-v5-2-a98968423d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Cl9cWQeCj4hD48ys8VSa1jtPuZf2u348
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dbfb5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SlpFFaZawDAKOkDku34A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzNiBTYWx0ZWRfXwbq28DJ+eM3D
 +qcNUp4GkqWE5mjyqF2FvZZMaBW7DNEtKodktOinXBJNuP/8d98bxbH7MGg3AJNywvjb0O7/Ro9
 sUwVNgXdbHZp+9DpT6VEYCZYBe1XQYHpvI6bPjVSxQRjTVfQCXwO3GSq6cBzH9b/OLroq2YewPS
 zUCJvpiHHgByWpMsTDb58XE5uOPef7i/27T0FTEPk+nbEvfQUOK3My3g2K0nfJlCwBrrnr1Bw2c
 VCgPAa9YXacvS9bbEa1DAfeu0Emd7FWChV5SiiRMNj7QNzPzmX+CavCF+Hy3j3qB21IOCH3ceGw
 b+FfIthiCaalzn+yKILLt3m004TEVl5OWfx/UykMbLAZViIyJGZrpcZC2b8dBht9MHGgiC/fVEk
 0HhrGzrUi+OXf/LST2GJmtHS6O6Q/RMvdHpw/0ljYgwE8852fcljmcxNYAq0XDArOdTyAD6TaFx
 cgTWiim0LSvnQeAjFnQ==
X-Proofpoint-ORIG-GUID: Cl9cWQeCj4hD48ys8VSa1jtPuZf2u348
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62293-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7139C58F4B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/12/2026 8:51 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> Update the firmware loading logic to handle this generically by
> preferring Gen2 when available, while safely falling back to Gen1
> when required.
> 
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 default : If no DT override exists, select the Gen2 firmware
>     descriptor when present and attempt to load the corresponding
>     firmware image.
> 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
>     descriptor is available, retry with the Gen1 firmware image.
> 
> When a platform provides both Gen1 and Gen2 firmware descriptors and the
> firmware is loaded via a DT override, the driver detects the
> firmware generation at runtime before authentication by inspecting
> the firmware data. The firmware is classified as Gen2 if the
> QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> "video-firmware.N.M" format with N >= 2.
> 
> If a Gen1 firmware image is detected in this case, the driver switches
> to the Gen1 firmware descriptor and associated platform data so that
> the correct HFI implementation is used.
> 
> This change makes firmware generation detection platform‑agnostic,
> preserves DT overrides, prefers newer Gen2 firmware when available,
> and maintains compatibility with platforms that only support Gen1.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Co-developed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |   8 +-
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
>   6 files changed, 105 insertions(+), 32 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


