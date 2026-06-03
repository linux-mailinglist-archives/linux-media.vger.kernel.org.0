Return-Path: <linux-media+bounces-63696-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zc9ULSG2IGou7AAAu9opvQ
	(envelope-from <linux-media+bounces-63696-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 01:17:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD5A63BD2D
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 01:17:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ihtIxLKY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="KE/2IU0h";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63696-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63696-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC2EF3030B2C
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 23:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06984DC553;
	Wed,  3 Jun 2026 23:14:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5563C4DBD9D
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 23:14:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528495; cv=none; b=NyGijWGE5XMK/L00QMX8C5ijXTP1mw77ps+dwoSd/gBhA1pAdY7VkDvPh0rYjz8C96Ts7TyyFQbzNFg9+muV/Bx9mkzjjXkDReWnXXCQFW8QSEbtDtkPtrDvJXRFcKH8mfAYNL9g4wml+oSBJF/3AmZ7gXcHSLh4pYJhd90b7Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528495; c=relaxed/simple;
	bh=wlIh7ewMrK39uAMTUXhpkLTuGf2SAbn0ZjgyC9KDupU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nl6dNAdDEbpHHpihXKC4q4iQy53S1ebH563Z+oZiBGhRfsRWLIxqTKrthZlZfmQz/lns9HUvsa8YWCZ3jCjzBEOic2FIpF+cZvj/v2AKL4Nu+izmE+TwZIrbPUT36FRnc5dtv6FdqutyxB/tl/bJyk3xPX7Vt1udNALOkwmnolQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihtIxLKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KE/2IU0h; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Gj8lZ2260649
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 23:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2G//XKBrQs0e6JBzYc1oOjln
	PuaY2eGS1/i4qJ/r9ew=; b=ihtIxLKYM6Yo6nNNaTB6zIT3Y8K/AXl9EhQuzt0B
	X9wMI92HrqljgfadLxCHYB6oyWTArtp5Fhovowro6J6UNwrLPWaugGM+/z7wASf5
	tv1WVu+j3LaEgGlI2NPNLOsIk9lF4SeoPjUw5iqMdBfKTdoBXfnvE+wtVR0+tvtj
	oHeGuXedQthK3EbsZg0Ib9v/SUVwJKr2BLeDQ/x1RLolDQfb7ZK8fUqIYqyDkWPz
	2JfcQJ/xXziBD1J0DmNelO1WpFmH+rEN0RoRblzMtvMznp0sGZY2W7gXyaUsGE0C
	6ctllqCJ6WQArQ8JkGEXw2pIYyn8iIGlefvR/JuJo+l30g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejr2mhe6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 23:14:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59d1218663fso155797e0c.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 16:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528492; x=1781133292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2G//XKBrQs0e6JBzYc1oOjlnPuaY2eGS1/i4qJ/r9ew=;
        b=KE/2IU0hgtO5cv0BKndepFEQR+T3pWO5T6qg3F1aRU652W7lwSXKNOATVo4ANfa5Pr
         5I3VvgC4IgcpMMBzDS9hKzSR4YHNYQTvdL/XUM8uXvpxzB6nn2rGWb0djslarhYDA7pf
         +YKoEPkxDLO4teYdfSm0rBwbHQX0ODiPCZrNDLNaeILdcO5Yc0AYM04HswjmHwOAikBV
         qhtnQc31cPkMjlwrDFTAWgbPHeYkYiVljX1YuwILzogclPhOqfVmfYU7cLe5++5nP2IM
         LLkqDcO3VCENfqgepmTBsrIUkM/Cb7z93HncCHJT5StbC5CNWimP5bVR1LPCt/57VRp4
         44xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528492; x=1781133292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G//XKBrQs0e6JBzYc1oOjlnPuaY2eGS1/i4qJ/r9ew=;
        b=W4ntq+g86A4VEbFpbmKWMwOVEue8Fs4gA9rleZoMdBXlzlLx4pEcLqyV9GGR+JjPxJ
         9J2srBYDZBvRj+SIDd/q57CVnj2MBr7uod9FVppsj6053aKdCowXX+2S75BUNWXZGsEx
         I8EdlIQNH9PyLWHUVUkPKO3+/i4gTg+QRIVS1fECYNobjndqQFw+V1hthBpgD0upw/lb
         mQIam+KhQ6Hc+RH5h7CX2CGI0nlrVdMPRfMyaWjiaVszpq/IBuCFPA+ymEEU0ev9d0QF
         jpceBKAHhTjqV/8W01gckFzP+wiY3zseIPk6HRtmhZID0SR7o+7+U/e/+PRLJsYk1poU
         jVeg==
X-Forwarded-Encrypted: i=1; AFNElJ/20sewMVVqV7LjQZov5INwAPk0kiOjLW8G83ehPRo+tl3RBcNZhVV0RuSk0sFC6qWyZaATmggKPbmCZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgy6EyNfqdW3WPhbZA3Kc+a6+hO2P/HykiW2yODQ408N/7+e+E
	y9gsThXMsS/ZmqxhqE8Kzo6iKLoS8X4DVujfZUyj920x/1oTH4MsLer2JtvpOrnJU7lOj0uJBNQ
	tXMUsxAl+1m5+XmTDsV2JO2rpK3HNKL0siQ5wsiuvspQM580sFX1DkeQkSZmv2H11rA==
X-Gm-Gg: Acq92OFzqMQqQa5K9AVIA57UX+OthfrpmKQglFcefix47AGdDRbOcTnQm2M7yjMc3+/
	J6FzRqtRkTa4BgyZf3t9mS2ZDQXJK078MC/7o2Dryt226FCK0DYEyjNq4TYmiIHenuuMx5K2uvJ
	mXIvfj1vNQoq1nkFDxkaw9W20lrXRPYEz4hyHg2xaW3gmn2he6L1K6V+gu7esOdSh7HxAk4Rzjh
	R7sgG1yqPW8be3XQl//9OvFTLgXmtNujK08CC2j0hqLgCsrruNGaHBgQZQf3svulPEAG+l3YaXT
	/q7gQouiiTztXC2yge0E4rYT4dDE2j/+1fjss28mAbYOReGvW3Im2E4bKyfDTjNy5aOQAgv2EDh
	m+RJl1ATze4GDIlcFoXl5J3aOIMjEoT9G/8V/6wOqgVlFgyLu1agcBq7jqU9+DnsEBTLC8hIZ/5
	AIPKwioYvRpprI67USkVBIhEjNmyoSB6ENJbXM9sSH9PD0NQ==
X-Received: by 2002:a05:6102:5e97:b0:650:9174:32b with SMTP id ada2fe7eead31-6ec53921cb3mr3875133137.1.1780528492354;
        Wed, 03 Jun 2026 16:14:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5e97:b0:650:9174:32b with SMTP id ada2fe7eead31-6ec53921cb3mr3875118137.1.1780528491852;
        Wed, 03 Jun 2026 16:14:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fc426sm886358e87.26.2026.06.03.16.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:14:49 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:14:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 01/12] media: iris: Add iris vpu bus support
Message-ID: <4daogr5a6mcuksuszz6io7msh33lut25jxfbltr5qhqij5idhn@ztizw7mf7bhy>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-1-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-1-afaa55d11fe0@oss.qualcomm.com>
X-Proofpoint-GUID: Z-wPvsCsPI7CsgOpuHoP1OAhx50OuyZh
X-Proofpoint-ORIG-GUID: Z-wPvsCsPI7CsgOpuHoP1OAhx50OuyZh
X-Authority-Analysis: v=2.4 cv=A91c+aWG c=1 sm=1 tr=0 ts=6a20b56d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=iwIdmoSuwSNZiPAV1xIA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfX0lDWs1D2AJ4L
 ouLoAivAT9RIORPpt1vJEPIKvAYEuAhbJI+9B5GRnzXObUfO0fKofXCQTBXVp7cl0zUTPJzmJPa
 vkldfWLwFOsWwdp3kQt+c2RrbARhWEcmvnoTl6+XA8dms8A3lze4E65jeJUpp9e/jt/B9H52ZYw
 3HIPe8zlBgE7t93jSKSvHNfKN07xhyLME6GREh8xWz9ND/Vb3Hjela9r2lBwW2k4tfJQXLlvXjr
 X8PFOVTekaqolTj6XGvoN1zYlURaPj34NoAdi3hxHgzeAYGf9oqpQ/uPFVt6JODz7qnBVnAzUh/
 +Hxo1CPlWC/lQh9Ies+VNOWOuYRJmtMTY3h/Q8WVCT34ow1k8oVJxphGAAmmZBjji391G5GOOqq
 WvrhtDtigTQWZ+mStpWwEZ4CaafMcxhsqWWRs4rBB0z0AD2sIZooggyIMCkmUQBVK9s2Crpr9nt
 pyXzKUqX+8Z6rSP7Bsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030226
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63696-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AD5A63BD2D

On Wed, Jun 03, 2026 at 07:48:39PM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> On glymur platform, firmware loading needs a separate IOMMU mapping with
> its own stream ID. This stream ID is defined in the device tree with the
> associated firmware function ID in the iommu-map property. To create this
> mapping, a separate child device is needed so the firmware memory can be
> isolated in its own IOMMU context.
> 
> Introduce a new bus called iris-vpu-bus. This creates a dynamic device,
> and its dma_configure() callback calls of_dma_configure_id() with the
> function ID provided by the client to map the corresponding stream ID.
> This sets up a dedicated IOMMU context for the child device.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  MAINTAINERS                                     |  1 +
>  drivers/media/platform/qcom/iris/Kconfig        |  4 ++
>  drivers/media/platform/qcom/iris/Makefile       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 61 +++++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                    | 25 ++++++++++
>  5 files changed, 92 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

