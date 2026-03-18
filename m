Return-Path: <linux-media+bounces-56204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKHiKBKQumnSXgIAu9opvQ
	(envelope-from <linux-media+bounces-56204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:44:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 448C72BAFF9
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ECD13163D89
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623D43CE483;
	Wed, 18 Mar 2026 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVMvkRyt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qw2+5jod"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA9A3CD8AA
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833982; cv=none; b=jc56/T8FmXwuRFQu6vQ+z/3J8I4D22td1oYcaD+kOlR3uj13QehOjzydG/5rV2cvnkOVQl26dl/XRDsXav3V6ntmElAlgCcT1UM3/FTc/qfP9IQ7Vp1O0mP/kPSwZL2LqJ5W6+bnQIEyUg5QCrx40i6Wlw1u70eakGZF3RWvfiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833982; c=relaxed/simple;
	bh=FJXW/3/zEcDcRT6vsQx4yCfvNgCOmaWTUlZvN9z0JtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQ4fSjp8kCEYE4GGmiSCKNrHlrgTTaD+8tehDqPP+TYv2qSz6b7KaRzTPKr+5mx0KC84EdB36AX65pkY0QmLuWCXp5eFRGAj00cKigZb0zEGPaSNEhvTQ6j4I+Z7lYGxg3wHy+Gai6qy/C+9Y+eE5Stt5AVO3gqlfW8sVkf/YvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVMvkRyt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qw2+5jod; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8mDts1145393
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lsGpyfes1iTFO709BjYvbLBk0xhDE3ZPzew/PUqD7M=; b=CVMvkRytT5dCfaUj
	vmmbraDBeymO4Rw0yDb4FmHhyzK9LLk0k+5aWwQvuw/sesBdc4E7nYQo8k2HVQ/h
	ACs2CxvUeyGu/0wDHonMWtkKn7HiJWxQW6MrZGEAEyRG3HBMWH68euP9IH5Qx+pT
	C8g2hDAVGGpjUxspmX1WhVEsaKRs302vv1hbaXL8ApGFFS6+syHwJQuoQRkaakxZ
	+sLrB6243J8NF7h3fU9cHJSAHWTWaHSmyObugqYzk4Zpbn4En8dXOfKeA/J25c6H
	SaSU4EkDb1x103YqFyv4gWwDYz1JipATQDEXe82XvLaEjKScBjAht4F8pCputch8
	SxlrGg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3v1pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:39:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a106b687cso2774967b3a.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833976; x=1774438776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lsGpyfes1iTFO709BjYvbLBk0xhDE3ZPzew/PUqD7M=;
        b=Qw2+5jodMznapusZ9k0iz+R1mdbUMCnhJirtb0jwbCe1s5bxc824eGsxhDUJel/vjp
         cXi6PN7BsDYokZwwFcTC7Agdy/8HmeXTPypCpxQFqL7qK+VnDb51CrTaTiOS5dm4RO2t
         o+5mgHItAtyBOZS1b4g5Irxa4vmsscowfW1p/FRju3nO1D2+i5Npci6b/ubC6m6GeYx7
         nXt0EE9dUNbk7AE2i6vgbjp2w12a33/EfgddGPvA3W1QiiLBpQBbNJBQUP+xIFAmLA67
         I/1R5npdtQfnD5Ll4agFC23bRYDJnaUqb6ECRZqNfdjcHiJqF9Z4KBWivQlSZvn1SOkF
         Q/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833976; x=1774438776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lsGpyfes1iTFO709BjYvbLBk0xhDE3ZPzew/PUqD7M=;
        b=mgtcXnU7cJw8G/dVSpzh75+ITfU5FBWLyW58pcrBSKowwIyR5miC1vYHDMXDjhTqwV
         8pogLHskMDonkc19ggrmerX+pc8A8MwzUd4yP8sDnfH804IZPpHIN3sUMZYjvRRN+zhJ
         DI9C8p7Kto4nXfgLYHSA4wkJTvH/24UuVFWJZWoYxAVV2Beb8Fw3wi5WmOlOrM3nNmlm
         /uYXdjQ6XEzDut3D7s2dN3u1QIV9peEjM+mapmbpy1FnFQIDwjoUruAq2mbJ+RUPXrsE
         aDco2+OX9vrEomlsBvs0pmjmA50SzokY2CVpTESthRmvwkSOpXj93E+IAdLjyQzQgS9h
         yqqQ==
X-Gm-Message-State: AOJu0Yw6vgVBp+1hX6CrmqXQDcyEBIZvcmekaZDViO31g8dY9MaznbU9
	L4lhSnZfqmcWYJ09efESqAC4MxprKU0TFXVCoTr47aQS07266zXqMbISwrGOXaNdV8+kr9UUua7
	P6VTLCRnkYxUnxLhtF8SxY0SFpAs64zp8s/4rgqnx5tRFdDpmuv9ZwsQGCEXuZgFUsQ==
X-Gm-Gg: ATEYQzzdcy39fJHhfQzseNwoJGyP5hh8Md8rgdpCJDCFbyWMVG9Wu1BpJGQHNQAXpxm
	sGYJcHmbHaGnTTycclEdZgOWCjSIEgdgFeV4Yr2+fSEDj27u0bILAyo8qv9u+TE6FQ4IeKtUSVG
	uaR1owcHVRzYTrsb3SeZSnTS+Ef/jnhqtYd5YnRc1SCvqamRaZ7FNk4qqW/TCCKh3GgF/7iHMqV
	T2KTWKNY3uocXrYQ1J6dWZFOEXvEXSADX+c+GmyyziVI9hrHzUCv85RoMpQ4W+ZDlXof2jpiEkh
	zcJHf1S6fbSU8lCS+LzPePIexnzEmdGoZj1xiWGdhaKn/rS73AlVPKHZnqaZ+yyAGNdqETg/WNA
	w/l9sSySiDMLFZFTqHZGs+iwIRENcvR0LiJRZ4QktrZVDJlF9WZpD4A==
X-Received: by 2002:a05:6a00:12c8:b0:828:d9a1:c5f9 with SMTP id d2e1a72fcca58-82a6ae6d883mr2661303b3a.33.1773833975971;
        Wed, 18 Mar 2026 04:39:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:12c8:b0:828:d9a1:c5f9 with SMTP id d2e1a72fcca58-82a6ae6d883mr2661289b3a.33.1773833975506;
        Wed, 18 Mar 2026 04:39:35 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b597a32sm2665720b3a.26.2026.03.18.04.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:39:35 -0700 (PDT)
Message-ID: <f1da3728-4cc1-4461-b4db-05009f85e8f9@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 17:09:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] media: qcom: iris: move get_instance to
 iris_hfi_sys_ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-6-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-6-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba8ef8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=49nlwYLE8u8VGWQf3g0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: _3ziBeMx0QJEsYHszepNmzCJfTiV9KFR
X-Proofpoint-ORIG-GUID: _3ziBeMx0QJEsYHszepNmzCJfTiV9KFR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OCBTYWx0ZWRfX/zos48RestlQ
 5lsCbxIyhMt+wboovMBGOZiksKNg2hXRxBc+Kj+s5gVCJkH1fVlE2OJ+ydSTm5g8D0OL9Rimxkv
 6BghlsHX3eywtA4ALqSdgw42I4WUHTC+QU1j+ZbhIZtUsnbdn2+GmSFAZj0uGUpxQkkWEf0n/Iy
 2IDQJEK3LyH5JiylBfO7ZEb/woeY1Gtzsnb/PM69DbEYTaX3V5IwcRRMNSXWv7NsYx0P+efE8hu
 SqWWAwzkUbMB6sQhMf+WAE1yNYDhpux1MZpqUUCICrfS0uIyYptwtwufhJ4+ABsm5+2IA0MV5Fz
 CV+uczgXVUODPvpQ9shfwX64R91kcyx6vp0aD4Hs4BMQEY9jlr6OTJruGPdEkxOljfiBfz4IDaN
 hyU81/cLmCENkusrjTL3VECsXWAeoMTG0C3Te1wahjBZVU7RQzoGZqbhY6jrMznlkkfXhWc2rNj
 bT+OSin0rjfpHy5tFdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56204-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 448C72BAFF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> The get_instance() is a callback tightly connected to the HFI
> implementation. Move it into the new iris_hfi_sys_ops structure, merging
> all core callbacks into a single vtable.
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

