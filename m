Return-Path: <linux-media+bounces-61401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIKzEa9cBGrbHQIAu9opvQ
	(envelope-from <linux-media+bounces-61401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:12:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AD1531F92
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39FFA30DA679
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A367337C0E4;
	Wed, 13 May 2026 11:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZGRbYni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUGDyCiJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1923E9C3A
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670667; cv=none; b=Xi/qD4Rtvb4DwTyyZpqmtTwMxuF2c4+iiUfx5zB6TO/3KI2uK0m3+8x+XaS53ODvkTHZvcKlRTyBgL6OtFXFZe4yPeYjnX/vDIBOV/XwoH6PjNppsEnIByfkmJr9K6DXQZOp81iTZC3CgWT8QijwaBNgRFZbVYYFZgtx0RZQ00g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670667; c=relaxed/simple;
	bh=bx6ugxalEcCPey8CfB0Outa8hUIV/XXjwV8kbVwvypU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhhBW5mJOYXXrtlWVuuiA+fpcDGpjq5cxPndb8p7ipsiH51/YaNteee8KFcViwMmKNFPBZ9YssZ1hkAPr8Rkv0JS3rhUcTfPPeMhZ/qaRZLZDinCDP5Er/VsH4+Y1tPM5c6yodfS0XXjbfABq2jEfpLFfO5pqqxqZK1Be3vlrlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZGRbYni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUGDyCiJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jeQg3007155
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0E0Z7HP9N5oq7AEii3r0dxE3
	Nj3yySAbE6o5Bh3hQIg=; b=MZGRbYniTaehZSrwxrcjNLpRwc1+fX1IdMmyLo1V
	11mZn0qa9nE4TyfOBJmOwRV08utMCFn9G46ihg6nurJ2dwJcVxskgwPzGLlLsFoU
	5RV94pXzD5L0rY2ErlxJzwjYoTNgcH8KM5hJ7stQyfJ902n5kksr1XUKC/CJOEJy
	/jh/nxV7RKs4RzJVmBc9m/M+Uy8MHjxbRU6W/n8ah4M3e2BySeeOIaxpyOC6xWrm
	WGJHQTDKKGWiChrBQbJapTZcg6CfrpvRMjJjHuX50Yzlag4CVllw0wDRuXLdIckO
	pZAXYj3MU5puuW21QV89bBUUxpzfMkOdXNST1YjozqLsqQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0ga38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:11:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d5e1bcb8eso4433323241.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670663; x=1779275463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0E0Z7HP9N5oq7AEii3r0dxE3Nj3yySAbE6o5Bh3hQIg=;
        b=LUGDyCiJKB+BetN8u4zhPhJ9CrVv/Lxw69j5uNQ8NKj500IVXcJA/jtn64knwTBbp6
         MXQlxj98+c386HhgXrpl60R9Jp/EOl9Y2NDQhWfiLIP9t2BPTi48ndzz49PEtqJtj5uX
         IiKzDDjB3p8LGHSy/lzuEsg9eWRfOLkGxtArWXfbbfbc3fd4AWl41Bjffas/HCJDMewn
         lo6jABEI89UcRWJCb7sNBpyK+W/WjyYMjp9sklUm7qI9nTCZEIpmiRWFKUulUtycCY3w
         m3nM3lJK8zRuCkOMYtaYB0eVMCYJwn5dPFFDFFuN7zgTYj7v29DLk+LTOerVa3qdmwoq
         LGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670663; x=1779275463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0E0Z7HP9N5oq7AEii3r0dxE3Nj3yySAbE6o5Bh3hQIg=;
        b=R7fVtLB9+PNWVX/MvLKM0X/JBoqua4ylsT7k537agmuCa+v1X5ZG/D7Q1L2A29TFA2
         n0JED51DnWuxBUrY+14OoxVXXh5FFKSZ4I79v62hpTMR7UKo1uJcy4At6Pb6B+SItV+u
         2GdxQQXMd4wqby/Uv6T/AI9dU8ppgsV7v5rttn7u65tD+EJq9Ix98IvwIoHAnC27RDun
         UiihoXJPpkNiEveHBwhzhH8AaaSN83WZzCeQywBaY5JoZsHQlrExfdTOMtSWFq3iU8uv
         Tz6ZZHbQZAHnYrm/+/vv7K8L/tUOgxCjpM3guiUO2IeAlC+B7qcTk2Evu9RCCoiLok4z
         majQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HJrSnWL0A65y9IRU2AVRUX46r49vt61+ZLD4N+7K8KIFRzl6i6kTKWz9ZPTJTCRI7rvUYEkmTbskivg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLfszjtDADeOz0ywsVjFE5ojjBimRwBLjcy6eTU8NdWfXoSjp6
	4rIzba7SL8UeksPlLMnBK11gTCAZM62KLWgEpYVMLKe5bMoL733GIjiq9RnXdvgxN072AvgfWvu
	kppHd6hmCYZfzYnRmgT2sTqbgY0LJ51m/5wXJ/igvPEzBUojsqIBJhGDq9Ng6mULA7/AEhfeubA
	==
X-Gm-Gg: Acq92OF3lTiQjE27VpeHxp9yhvxFPCYlZsyQsLJzZO31UJiIi92qcBlJ0JGBr43wlTc
	+4IGTdgTQc2rIgfxt1N1FpQkBHmI98E3wk/gq8C7TZMmAZlikGksLTJzXBlcL7EhS3iU6VLov0/
	S47VgCR2SQRs1g4c78uetGoWfiVojvbYSGXmk6fRFEZr9nOI3mLE1XGOM0sxbci0MwhJpVvZ1Ld
	0tCDoI615nVKUVoCBfdk8jauEBxQPaXRbo6BSjjehhwmQ9PPr+ZZJf7qVIJhJvxr/AJ1luzH0ZT
	UB1J3NmJpSr5tMzBxmAFZXKPkk1bYnGvbehGFi/uCNDaRLm5RhBNTuNRrNM/TCMYQI5FLBVGnV7
	fHtp38tQyEU2ThwQ2MXxgFV8mI/SKFNbe3w50p8EzVlX9CetZ/wbHMXh6a/9YQN9u/JbMsFQI5Z
	uY8bx2PEq6wTLo248oK08UHPsSfS5fvfUuSjrI/+w/AFW2xw==
X-Received: by 2002:a05:6102:6055:b0:62f:2f1f:599b with SMTP id ada2fe7eead31-63771b747b7mr924354137.7.1778670662398;
        Wed, 13 May 2026 04:11:02 -0700 (PDT)
X-Received: by 2002:a05:6102:6055:b0:62f:2f1f:599b with SMTP id ada2fe7eead31-63771b747b7mr924351137.7.1778670661854;
        Wed, 13 May 2026 04:11:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e163sm4096980e87.44.2026.05.13.04.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:11:00 -0700 (PDT)
Date: Wed, 13 May 2026 14:10:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 5/6] media: qcom: iris: Optimize
 iris_hfi_gen1_packet_session_set_property
Message-ID: <s2aa5kpszswt6bcz6j5jepxk3ogmuqa5rhtrdqtwduahocdyy6@nerzjw3g3b5v>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-5-4954e3b4df84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-batch2_features-v7-5-4954e3b4df84@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfXyT4+vxz3Sl0K
 0sryoud22+fLTNskNoALMOWzGHlQz9IhHPRM6HodOVMRZ0YRd6ygAo31jq6XuX7DuFt4f5J0EC7
 eW0i2thVJVDuvXMva1UjG8MM+pJyvGF/d9JAgsIQRqaIk3NPPgqtxZnfEBA74GEiGFNXmSof95w
 LOdUleuk6QIqS8yDMcITr4ma4Dz/Km/KZSfHzavMeoQZPwfizsFwX30V7lx+0mBk+qiB8Vjd/qw
 lDrzx+gDvMMM80bGJJMxHUowgi2qM4wumMxm08gY/amT02gtA4CpfP+m2HHaBhbCiAfuHu9s4yY
 xoVmL9gTK+jS5mW5/E5v+LjEadrBRaNFUvLiIIcr7G8Mcf8ztwb2QL5a/q1/A/TeZlR36sQNtHs
 MuecCnavHRQBFxvLmRlpYSVv7pD0g06xSLq1o58x8BjTqKYxYtldwR66giMEeaXw5hS8DfCK2+p
 fFQnEI6nLLMm9g233Ug==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a045c47 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=m-et6-tnyGGeQiwqTYsA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KW5ICMSiCpkaLOG3gT25uOZp-22xdOj7
X-Proofpoint-GUID: KW5ICMSiCpkaLOG3gT25uOZp-22xdOj7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130117
X-Rspamd-Queue-Id: 91AD1531F92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61401-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:55:14PM +0800, Wangao Wang wrote:
> Modify iris_hfi_gen1_packet_session_set_property to simplify size
> calculations and remove redundant code patterns.
> 
> Previously, packet->shdr.hdr.size was incremented by sizeof(u32) in
> every switch case, resulting in repetitive and less maintainable
> logic.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 50 +++++++++++-----------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

