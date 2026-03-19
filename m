Return-Path: <linux-media+bounces-56306-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KnqExm+u2n1ngIAu9opvQ
	(envelope-from <linux-media+bounces-56306-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:12:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5E52C86CD
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 382E93081B07
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104CA37269D;
	Thu, 19 Mar 2026 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDaIyYIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZhy89kG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5922536C0DE
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911019; cv=none; b=HiJYiBJ5nI9vVT4Z1EVuBE1Feo+xGVmRNjEGsWSz2vwbXRghcvw2yKn7mEpS5Iye5f/u8KjkpyMuCQJoUchVUZm00shoK2EbgAeHz6QnigsTyy66+xMmwmQAei9KN0J7gOxyyiJbyWROYunztiBLqdIvKOfgRrzReR4+DCj3X9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911019; c=relaxed/simple;
	bh=Qbo2AkY1+KjetyfH9FvzCECSvTy3I3x1KOVPsNZJnkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlLU8I4YetuRE5MD0/3C8QcUx2Z+DUKIimYMbJPNaZ29jI8hTLNbTbLGz+E+VUY72Vxh4vzXZV18rXpLdTBjic6J9/TfNNZu/TUlZR3uUwJPRzyP+/wxE1g6vZ6zbcr5ZsGT6MCGDZQzOaMAxbLCMXv53MDhh9w961XV0ctj6bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDaIyYIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZhy89kG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wCh3927153
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOadfTGg9xXeghJQxazIB0gRjzi9FFaPD4IXx5xRYT8=; b=pDaIyYIlvN0wuiGE
	TSxmvlJbNDKe5yQA6eRib0d8v9JHLuOnmop1c0g7YxdC0MZVN3WwykbOAmzvoyBN
	Tdr7au9HdDA5so5A8/bbhcD7g27vAyVMfv2bfiYVCb/90mDqzs3Pt/rtokD/JajY
	4rD0L2QBuwI5zmrfROZsV6JbmOeGJt6FJc1KQQoVuZtUNN2LGau1qVtnceuF5FHk
	Lh9vWgWXevYpdJgU9sIsBN7eVR81vH4MABkwpqjSbKhhPxNZW4sLIigzjK44kWyn
	aHiZQTYKEvoIpk4ZYgO6hrhg12SvOEOHpseM68lqL1+HlVUXVdE2cO35PKhmpsf4
	8O+rpg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1bryp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:03:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a855dc82aso137712b3a.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 02:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911016; x=1774515816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOadfTGg9xXeghJQxazIB0gRjzi9FFaPD4IXx5xRYT8=;
        b=YZhy89kGoqp3fbUis1Ihi/I9VbSNSXInKcX+BWu0Rty26CEIz1FQRNmGFEfDo7AJpk
         JrquiwqEsHresTslLmDMgUtxgGRJO7nMKL7yoQUbsal/9B+XBBFNT+Uuw7wZCq3YKNxY
         tvMIhXmNn4A7qKFQBdSmEVKDUm9CGJ8g/UwJVaWTYKfCmqfeBkPJPOpLMQ9wK4EnfXGH
         hb8qPP5wEZWVsKPXn0zEwQYjYnTkMfNN2l3R0fHkKDJuMBIx0yjrI+l2kIPTGBpfZVNq
         uqEhpPfjTgfAp6cnehZCDLD2HaiACsDVXeBgdHbQxkCrY4XcG8gTPN8w42kiXhcOdcyo
         x36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911016; x=1774515816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOadfTGg9xXeghJQxazIB0gRjzi9FFaPD4IXx5xRYT8=;
        b=gqeuSCai5kKLU8sTQ379m14U4Y15oQ0uB+vpObOC3jo1eOMy5ydJ+UOtYzM43XNCd6
         0mpTVGUDpox5iyVsAs/bY5AvXmwKOt37TiRakpJpV9iVzSBQkL0KUZGlCHiBT6UrD3L0
         oSkOG4Io4to/XjY3FWmSbLnVH7p9TYPP1sQEzZZLLjgico5Und8vl3qrutC1NAUqlkGg
         em7qwpHRYsWzXzCEvmVeS8vvWyVWL086dBB2KJMoh6pPQ+FBOwJt4d7UZdSC4PpT+cQ9
         ik6WE/SbgoZXkhfsj53JwAUPpglKeHK2bHO/e6OURAnnWudiZl9h3THY4dRueCYSDu4v
         CNfg==
X-Gm-Message-State: AOJu0YyFsIbz6uyoN1+4vOzCDpU04LTvDjvexS6SUDJCY9j7w0Q/mpCC
	ATzqtrYO90jaTC5jMGP5RD5Pzm3bFGw5KD/xNc/zoDsCL3jDXCoCuusjkEVa9LMkzs1vbduJB2U
	lFxJQjGOBhKYT0WiWKw2LK8+dsjXNy6sieaRPL7Q/M9fKkzpOh+VcKfK++mz6Idi7F9JvE6xZVQ
	==
X-Gm-Gg: ATEYQzwLzM7X0KmGsje9b2Z0NlASW5c8YwnKLcj1sxG769X6Xo5oEqmYuMJNXROyghF
	m2kedi1tiOjQVd9YyTHSlV/5wSb8EyaLZmrMroPGPUsksp0/Jk+0o9ZcgCF3GFxPjUvOAFbTxd+
	VLnRohpI8RzJdI3MijfJbyvBEt8u5oplnPRE0/4fOgENYespYgRYFClq7WenVRe3gOYUu0D/p9F
	kS28yUPXIyhSeRF6DFBIOAoyId2nlcHqIVuLh/FnQGtjNudwfYn2vd2aRU5yOVdUR5tWca3rqi0
	urc/W+p6h1N9J2qR2gANmZSEsfH7/C4cjAsl2CvVpA/oiIHnql+r2R/Dbu6oyMyPhEoLNf4pkNF
	UejE76gIlsfwzkt/lEkjUDFLpupQoNJ8Ly0Ap1mcQO5zT9JhtQSOh6WI=
X-Received: by 2002:a05:6a00:6c93:b0:819:5db9:6ac0 with SMTP id d2e1a72fcca58-82a6adea0ffmr6222782b3a.37.1773911016077;
        Thu, 19 Mar 2026 02:03:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c93:b0:819:5db9:6ac0 with SMTP id d2e1a72fcca58-82a6adea0ffmr6222756b3a.37.1773911015640;
        Thu, 19 Mar 2026 02:03:35 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.254.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6befc046sm6808860b3a.59.2026.03.19.02.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:03:34 -0700 (PDT)
Message-ID: <421a4d73-ce26-4971-b7e3-31919e4ffb1b@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 14:33:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/11] media: qcom: iris: drop hw_response_timeout_val
 from platform data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-7-55a9566ebf60@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-7-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nw7xjl3ajHqqFYbYFLn1W-Is2EegdGRR
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bbbbe9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=vmayvKaVtNuonzR42S3udg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Y7rZwOY2BnikIh_CpQoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: nw7xjl3ajHqqFYbYFLn1W-Is2EegdGRR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfXzXThdC07HaWN
 W5ScEIlj0/Cq0IWeQi+ZwYJa7S860UjO8rworXd90t3JaMuAI7EgnTQ3zm5raWRndBIOyeXOsyL
 97UEQ5/MjfSGqFdQ4NvYqg79M32foKWLtUcK7PzCKSjrX4S95agYzuAaN68Tt5xQ/lwKPiG4FB8
 fTYp+XGM6uKviYUw534+BCRhGHTTnz7PkLgpX+UawGofhV2C0fwQqfph57eNCg5Q/GiHVztCh/I
 R031Rzq1XlS5daeInPU2BB5fCCAnqXBic1otenr+GpHo6saTq8xI4vkaKiMbMjr1etGXetkygxP
 3gjZ5PMltDuCuHPBL0lsFX/o5XILhvvFpoMVpXvUO+wXa/v64MFokqZHSMn25d1pHlQzebFAFr8
 YngD1Ho/1qo3FIs04prEgXcumWJzimRcS2Z7b8Iup9fSlEu2JEtXUyF0JbfioeZGy4F2TLkLKlL
 A2L5suqi4X+Meiic52g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56306-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F5E52C86CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> The HW response time is a constant between platforms. Remove it from the
> iris_platform_data structure and use it directly.
> 
> Suggested-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

