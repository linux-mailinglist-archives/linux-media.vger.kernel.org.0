Return-Path: <linux-media+bounces-63790-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T7E8EL9+IWrCHQEAu9opvQ
	(envelope-from <linux-media+bounces-63790-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 15:33:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EC36405D8
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 15:33:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lixbj3cc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jp8OkO0P;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63790-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63790-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5A4330B446B
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 13:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB8D42DFF1;
	Thu,  4 Jun 2026 13:26:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABFD47ECC9
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 13:26:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579565; cv=none; b=ZGzvzSu5IcJ/4LB5HN+X8V3CH96Ozk8kamPhiqGNIopWc7WQ7CGS2yzUYEty3q2p5aGWncwcyc9o6gmNI5s0FT+WoYboeL9JIWEU7qIvqhja55ej14oXiBpPLNfdZ+lPy8txGoH3TwIIVI+zESNSCu7uPQj2mLeM6dtYfkvlQCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579565; c=relaxed/simple;
	bh=Bqp1Fmjdd+OA4loVZGKvMjBGhteeRB3CvpMJZRmvFeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1aq2Cwl4KgQYXJ31H8WHp6a2aeGRaam0VxrIhDLekldV3Cs/Rkkx/FbFMn1mD4ntXBxTBczDr7lzy+ifSLKMP9bdMN2Cm+fXD9xpvm4yHLxw4bTJuLUGqIbrhgYnwLiR1wCJ060CZPpxK7HgasuPWGqc3rc/TZK/hSpD2s+gpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lixbj3cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jp8OkO0P; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654AaC0t1993965
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 13:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WDlrN1kvsktav9PmIfA7uNaL
	lErcQ7NjVXu3Ade2t7c=; b=Lixbj3ccTkdXrf90jeQ3yheX/Vm5ztjxBc1vxbEI
	s2x1oEFNzTCFvf2wkKAlSZxRL3gvV9HC8x4rFfIR74+K3uqKyPMTGWTvYRbfrqmh
	K35T1pQaz3YoDfsOg+IWoxH0lJ25HMTzv1+mfmyujTmH3xEsY3Fqfk0gyDmJH5YH
	suGkfCpXTrSwjuI4KB1RtqQKv4p6qMBXXCz59RB0FKwwyeuOyhPpqtZPJlO3T8uP
	8EVSdAwfST2ilchi/QnozlzG3KSCLgaoGZagfZHmXynFlGVjMkapruz3GzfeuXqk
	RhmsjK/M/jUuahEJMVsjQNIkdykGSBNsvD1aRKq60u6s+g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8puvb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 13:26:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751c50552dso346640137.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 06:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780579562; x=1781184362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WDlrN1kvsktav9PmIfA7uNaLlErcQ7NjVXu3Ade2t7c=;
        b=Jp8OkO0PjUnbkKX6r0n88zVyB/u18LwbqBfZQrbvq1ZEBrGjC+Cu4qrSFqLmvl0P+F
         2pmrko45kbqOsdEgN2AGiS+xFM0UsyEeqeyssrVGsRixheA6LWr+ckCTHQtoesWya93m
         MJJ4O+Y5uwUJAkyA1d0Q519HJVLMMp3wbAO73ZxSaxbrhrD1gsw/4oJm7rFgUFHd9VF4
         C2AbGMZo+vPmQlXbVXZ6fpBueuBdw4rSaSkjpoeeBamqMyyADP5SInvOelavuJpBU7lh
         Y6baw7RXqVaiV97KeSww83HJVUfMmGQYNq9nuL028l8L0WtQnM4TBUrkhSdkjS1RMsAV
         +bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579562; x=1781184362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDlrN1kvsktav9PmIfA7uNaLlErcQ7NjVXu3Ade2t7c=;
        b=IyOq2Z0kyvTmEqjMjVy18QYfnT1E/Zy45/ahC6nHQrFbVzMyWZSIghc/zgzj1DZBNQ
         qpz2Q3Mwqz2nw4BU6qr6s8+osQ3H20DkDoPqCwNACO1BWPBmh5YWqnItFSHcHDPcjZ6G
         2k7j0Qo8Y/izcocdXAqcbH6pomoz95DlrNb1LyLVQ1mYIMwSv2sgOBn9tKCVYl7XwiXc
         sTajeTXSpDSAVWNLOkX5CP9QmM/uS5yNFnrwnAXNEw4NwaxIDDHM6+ouxW0rTvfPoCTK
         MpWrtEvOZCmKY/9xuXFuvzZB7moUyDLcXS4bN5GywC2csf0QlGQe9DMGWCfvdOb2v86t
         XpqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KSHsUPre9/oGoOuuuxTf3bPOMBqMdCvPSPoCLN69YT5Rj8wp8iIN2NQmAwuKtgs2EX92Wu7ZheT+w8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxWEIcNFKR0rTAW0qEAiurkhuCIqQkseApsfkFXN3C2t7bcAvD
	Tv/8Xh7QKunFZx7o9Jt9AL4QFfwdcws2zcFdUnZ6WnXjeXx1sYNZAMxoXhhd93vMKOfcMDkPcjz
	iRYwPy+Xe1jg2p7CZVem84+Lun71/l+uxE2a+wB+D+hGeGW4dNTV7NMkTpFwQBt4ZUw==
X-Gm-Gg: Acq92OH4MQYeGZKCPm2/5JUqO7pIQ8Ldx/7kiQPszQR4BvwgpRmNcZZYvI1o/2EntOe
	9z+NzO67zWmN/q2KOkVvWyjz//IWWo5lqrT2rM+abtR1Ip+AOUre9lhv7lNX6FkdubcrPDQTRjm
	/if3839exN/uHFB2WtOUE41ld4AOIH9ntAG4rAM0KmWQHqXlxtk6o7gmlFqPCugWwa9pqo96vtC
	lB4LpVTgWV+T1P8uW4v2Z3rvUpBupXWPvpKC9ZZuU7l6LGUFUKzTTw32tj3LtqYUQFr8H39Yzq0
	bQI5bqZrTc1ad1eil4kI+MK1E3m4x2sssjsiD/dgBePRKwDh6UXtjHf84kzayWEfuR9sHpYXrw9
	Z7eIGegeNPqWhTY7Vqx3mYb64bUDzqQSV9wW+YMEEkuXGDXpdzwrqWNSCWN4Pmn5px2r3Cjiym5
	yXe4I9C8yNhD5jfC316p7+wkRxUrBT4c104RNfZLKPS/gI6g==
X-Received: by 2002:a05:6102:2ac7:b0:62f:406b:1baf with SMTP id ada2fe7eead31-6ec473f5d87mr4742986137.20.1780579562463;
        Thu, 04 Jun 2026 06:26:02 -0700 (PDT)
X-Received: by 2002:a05:6102:2ac7:b0:62f:406b:1baf with SMTP id ada2fe7eead31-6ec473f5d87mr4742963137.20.1780579561950;
        Thu, 04 Jun 2026 06:26:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcdesm1217269e87.21.2026.06.04.06.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:26:00 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:25:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM
 check
Message-ID: <agginfn3jo7df7bozpqvggg3rt5fudmh2jwewj37jhkbw3ynhv@demyhaltbpwg>
References: <v2-message-id>
 <20260604082510.45733-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604082510.45733-1-dennylin0707@gmail.com>
X-Proofpoint-ORIG-GUID: L1WimT1uwoH0i3T8WHmnDmvXuZ_ls6kg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEzMCBTYWx0ZWRfXyl+S4FuN9gu8
 dmaAWUU9jQ1i3KAinE6p0XtLDnRYdqOHoxzQ6zC5uBdjYqPSAxzXGJEigxIAiPVHlIs2295ZP/w
 IXSnfarsS1EqsH/GRbKc7xuqESqCaz+HsOmaB929u40Skl0gE0afX9gUo9RbxJ8iMJQ6Ag+PyYI
 qKPCIZBuSgzZcp5NmQ6KUOxRyAEZHraJ0wRiqHtjTiWpppj7wb08ru3vi46/U15iCiQ6+JrJoEo
 tZDPaUGYMpHxQBVkDEiJkSUcaM8XoAfn25h6kGBPVolDU14pFy5YGpk8J5i9FebW614v0xjCWoW
 ejnsZmj73JlTBzNC+8IVpm5n4GOK+xKZFKHOAe6X7Cze26BuENq45/gIki1TBgR6pZMIKRtdza7
 sCi0BGDv9FFXmnrS/5/0fm+KoZH6rSkFGgwjOT/XeQerSn0h8xbyhuaSb7qntPbMBCNdF5zky3W
 zPaWHaSGR5VqgmusYlA==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a217ceb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=TPyWUj72fWjUZVaPtgwA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: L1WimT1uwoH0i3T8WHmnDmvXuZ_ls6kg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63790-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91EC36405D8

On Thu, Jun 04, 2026 at 08:25:10AM +0000, Hungyu Lin wrote:
> Use pm_runtime_get_if_active() before accessing hardware
> registers in the threaded IRQ handler. Skip interrupt processing
> when the device is not active.

Please clarfiy why you are performing the changes instead of describing
the changes on their own. There should be no IRQs coming from the device
if it is not active.

> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> v2:
> - Use pm_runtime_get_if_active() instead of pm_runtime_get_if_in_use()
> - Handle negative runtime PM return values correctly
> - Return IRQ_NONE when interrupt processing is skipped
> 
> v3:
> - Remove the early enable_irq() from the PM-inactive early-return path
> - IRQ re-enablement is already handled by iris_vpu_power_on() after power-on
> 
>  drivers/media/platform/qcom/iris/iris_hfi_common.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

-- 
With best wishes
Dmitry

