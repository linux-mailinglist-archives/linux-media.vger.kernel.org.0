Return-Path: <linux-media+bounces-56200-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EINUJ3+IumnSXgIAu9opvQ
	(envelope-from <linux-media+bounces-56200-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:11:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 083552BA92E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6055E301F318
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A8D2F83AE;
	Wed, 18 Mar 2026 11:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6Z7Sxue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKOXExZc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1AA3BED4A
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831842; cv=none; b=WhAT1TZxDq/b0x6lSLn816ZwXMjtA5Rbf/I9a4kVUVDtsMKYVT28b6kh8UvQMFcyNDfikxrNFVf/VdI/cbO6UD1s+xfENZxmqhvVEzrduXpebKH3QHCyhOTZ8X9/vWXgcB/5RBU2+N1OeVx/OuC7teRiiTYcmr/mL8FCrAwnnVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831842; c=relaxed/simple;
	bh=2kZItgv6ifH8YnG6fdUuM7E7J2tMujlHwJncka7/TWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXM/3/C15TuWnjZ+EsCxedoQv36+wgnxHcvh8zAvk6+Y+5i/dZF9N2eU49TUwreDNh6t8NmbPJ7mYDk9iLbdq8+hBZV65hboN3cRnR7PuZ1C7vGBE7vELglRV9/7XlZplj9dIni6ClZQVgP1Jv4cx8MZPDVFBBGnTKT0LdIeDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6Z7Sxue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKOXExZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8H0L11050604
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l27kGiRX7dI30J6EC6k1fn7WzF6nT90eDQUhAOwj/w8=; b=J6Z7SxueakjQu4zU
	E1+p1xlgEoJkJLMF0dKIT9s60/Ntavr9zilrE+zAR7xYmr6NfLNkIrMgODn90kkq
	0EX1nqQLwSYBLpTEc5919uh7dAq053GWc9nBulQx77wWIaPiF7SOBNZaOJ1GKC7H
	sOJya/y0rYAxKqggxemMB1MmN6+ei/K7iMXJEXZzf0Q8/+SYHH9yGHC/3ZTZNdMU
	/byZRI0bULWgfiyRh3vVD2aLE0nTrDBq2jwyLsUnL6r/1Vbz9hcLpDNAP7qTE2SZ
	NeqH6/eVzMRdRYLg2cK6KqBWnSxPO0tlDlNSjNzMprxhovDkwGoJvNFVfYn3ijwH
	Zb1kLw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ej6j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:03:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c738bebd53fso28223926a12.3
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 04:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773831838; x=1774436638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l27kGiRX7dI30J6EC6k1fn7WzF6nT90eDQUhAOwj/w8=;
        b=dKOXExZcZaWZ0GfRHOr+vQT+y8HhKqjiSzFQsjEDRJXHEctgc0A+2AOZ+4usoULLJ/
         EcrA4HoIuV/HMLHd6Gf4zvKwNC1JR+eLeppQd4NMj1kBrDNeFdunej+ZdYdcmjafDkux
         f3R4jcqQfC6szPc6/zuXxzqvrmadDPEq/QknaeECS3ImB9OKgiNY8yQ2HgZTyGOe60Vw
         94tUyy8pJT0npW6AfPoLeYWWsq3rrpF8aUu7c1j+iDnZ/e/RhV7V8l/linb6bpyKBUUZ
         2qLBYTHk3AyZy/ahgZbg+PmfYxyEb47wZwM/4eCwE7dKHeYukSP/aZlrgJ3edVp0eRQY
         WoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773831838; x=1774436638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l27kGiRX7dI30J6EC6k1fn7WzF6nT90eDQUhAOwj/w8=;
        b=pNDYnxUaLRQhQ3Jwrc4WChms+c9lkSj5RrxfimG9PAA65A0suITY0YvzUq4oem24jG
         9gP5UKF1ZQMYOoLE8XFWQwMUKvjnhoDjPKmm0+BQ+nvL5xinvrQ1yFFdGvLm/0vgcFEm
         7qlTyrailzTAmi20zrZSNF51wC1VLEvpiSP2Oz3IlRXi2kbpIFVDBRVfwNUxLT0cChMr
         1aSucjd2qUB8WvGpBhOcsY7G4TgkUPK8zznD6aj29YzBbItWppu38ax97uX6SIxDVMqR
         grLaMsNmkKXsDp7DYhplo/CTryThDyR2WofXLedH5jIi1c+AW5IedWandq+C6KY4AjS3
         tbQQ==
X-Gm-Message-State: AOJu0YxZoyS9wD6YLY8JYQ/pFQQSVzJjfAtmw2/qyJteCRWVdwAwM5Uy
	XzAAWBAZiMVrLoJuGzpoRcy5/lUQKolMs3fbSRLCJdokPgMm0LgzZYVdGBonjDQZubmtpr7LVWo
	dLGlNTDzct+fi06HhB0KfqStgxVzkZaTsxQDxY97ucBwU2r82r0WKmSv1HU8yTVJ7xA==
X-Gm-Gg: ATEYQzznsHxotLV0c74V94Faq2QofU0jHTx29RUaCp2ghPJT76qGYtS18XxX0juEwao
	T7k5NGFt1OJuVLzenWZ5YnotDsbW49CRcVhEn2fmRpb/iU1bHAU+biWLGe233bBIkOM0L4bu5Yd
	nWdkNi4Mh3XTxETx6MCNGccmV0aN4wJGDQ/A6SXR5J7WTM5FuONCw3RQ3edVI4uuz7b0TT9Ohxw
	7LYdNdOuad4V+IKqaSe+DZRFzoipY2EHm7YyRMBzcB5U51/hWt5MeaV9FzpQ3iCWx+zvepMYqil
	b729iXk0qsNp8Kv4+pv3uC0LSjMWqtnESAuX3jv0vR6ecUtwyn8sV+JLWhEOGRr70M0+vQdTNQx
	+aQWQO3lUs8TZNlSC2PlZvd45KfMMHXsW5KALeEZfNNwhaMRW9lzhMQ==
X-Received: by 2002:a05:6a20:2444:b0:398:8127:e518 with SMTP id adf61e73a8af0-39b9a09af90mr2685858637.61.1773831838281;
        Wed, 18 Mar 2026 04:03:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:2444:b0:398:8127:e518 with SMTP id adf61e73a8af0-39b9a09af90mr2685828637.61.1773831837725;
        Wed, 18 Mar 2026 04:03:57 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bef2241sm2413826b3a.54.2026.03.18.04.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:03:57 -0700 (PDT)
Message-ID: <7eb3278b-1ed4-444f-9c78-3f2b20a58830@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:33:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] media: qcom: iris: don't use function indirection
 in gen2-specific code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-3-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-3-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba869e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UKym11NecJYO_-LCFOEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5MyBTYWx0ZWRfX0LJRokciY0rN
 tOKEWzS/zb3YCd5VTOgpgYsnU647BY6YyXL6czQiMBMUDucBymF5wfYdcNHv0mqyO/Q4b4Z0ZA/
 qGxt97XPvxZ2ldjPAJeGiG6HL1dan7/rk7n00ofhecfCIiKpb9mWAw9ayep91jtX4lsN66SGLVW
 /1HnjIZ/rJI94h+uDw65rG4YtkhaQjtQmfsof4YyxW5IxusHejd6E8jqiaj4W7OGOL88Oj438+q
 7eyJHEA2eDpN3VwQ3P0+zhIJwZ0slF1r+TwTvYrq88ErHG0StN07t2lizO4wyQX85sGnfnTLxac
 jNiWP9gAGclwMwTGy8q7xmVtSgUHYs0b2BSgnSkXlcH73/DObEjZJ9gX5w9IeSeOZXO01/757eI
 W7JpvHcLs7YOqOtSvGp/r13R+QaWL/DjlN0cF7xNRW1gbAqfGLJiDUOhgxwHSANvKkdHqARiRvM
 V50TUDAGYuOWw1HaVMQ==
X-Proofpoint-GUID: lMN6v7OsvQ1poOjcQa1Xqm8otzCk7FvP
X-Proofpoint-ORIG-GUID: lMN6v7OsvQ1poOjcQa1Xqm8otzCk7FvP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56200-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 083552BA92E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> To note that iris_set_num_comv() is gen2-internal, rename it to
> iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
> set session property (like other functions in this file do).
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio<konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

