Return-Path: <linux-media+bounces-64079-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vBQCM1DlJWpGNQIAu9opvQ
	(envelope-from <linux-media+bounces-64079-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:40:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AFE651B98
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:40:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ACVh28eh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CjJFaSx+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64079-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64079-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B48423010168
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 21:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A688333440;
	Sun,  7 Jun 2026 21:39:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD08317173
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:39:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868362; cv=none; b=lyfCrMqnsO+JcBFxvJM5i0GNeMFtOwgq14Ll4+Y3xMBFv/Utemo6uw/99Uj+I75zpMduNegX70QAZUEy9OrWLiQjjZwww3d//Y/WWS+NY1yCGnXeh4i+poFW8bS/UyPNZdeV/ETx/gWC1stEdxy0j6gR8qOrk2dsQQTQpIzkmd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868362; c=relaxed/simple;
	bh=sXyzQOism6s0iMWTs6y8t96TK1C2Rb+t0dl5WHR/bpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQqT0QP3hAYyZ8wSL1Xk/wySememuZIYzkg5xoj68YFZ6WeVRRnIBfx3ZmnX1pcIhbXJtGZagAj1XBGK8hUWVd6urlFtfr30Tv5rH9GvszK/kzxLaxT8ScwEWrV+AYoTrGf63HP6ZG5LlFYAdIWCOPzi3PqInp0XvmrhuoBwDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACVh28eh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjJFaSx+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Em5JQ440623
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 21:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=27Zx13bOX1sLVHA2pgAGb40i
	Z5XaOQdOLc8g1jx0NY0=; b=ACVh28ehbEBp3l5AAnzU44Cao9/pJ+gg1EcWgAvk
	BxlbVWAvvciNFfw0ko3vyyhv0grSB+fwIGBBubeDuu3fffk5bM8ESWflWZLJYQaM
	ONWhIVRSonngg6reY/4OXmPwrQT7SJSV2TOS6Z+fvYRKJdJL6CQOsT6LWq60bpMx
	5csvHicf6p/XcLUBQrHrD/Cj0O9MWNLpKzm3/cGJKNn5VBs5Uu9bKUM+t5njtN2R
	794eDLObi152XVTnopJ3QbU66SOcvo8f/yzGaaqPhIFd9U4ys+XRXk0lP+Y0PTAj
	g1wwbYxFHGqhAn60PUEJfPsYR95OzXMsaihA0E97oWYBxQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8vk0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 21:39:20 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59e6c1217b6so2817931e0c.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868360; x=1781473160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=27Zx13bOX1sLVHA2pgAGb40iZ5XaOQdOLc8g1jx0NY0=;
        b=CjJFaSx+ZiKKWJOYlnoMd4RSrjOq7grsTCzwVXPxALXdLYRPOdVS+VSQscAHd8cKUO
         Lj6Yu0ovf1Llyqk7wPHFkoSgnm84oqTi4ekOTqNIL+d0u+S4sea004NOdvqhELjmdJtK
         2EZEOm+4RwymcG+Qip78+51gy+hMGFnhyK6BylL3Y4CZOsJ70L2jd7agI2I7dbM+5PRj
         NCMknfmw8glz1g9N3/W2+EDjPADY0hULwX+SqsWSOZNL75IBk6unpS39n2UuP67RDqEh
         SuZTUd1ADafGUpKkOazBhoXPUnTCpgkjYMPrE2J+CfLyvESK54e3Nm4nHOGvzd5ZcA3W
         viJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868360; x=1781473160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27Zx13bOX1sLVHA2pgAGb40iZ5XaOQdOLc8g1jx0NY0=;
        b=mVY6ALXvU2gsbc2qPzgkEXKXz/3b6LfxSy3WmqfeO1A5gTkrFaNkdLDUqbtH0LrgUK
         7zoyudXX3YTbp0U2RAKRX3yNNcWWhgrjFpK04upk+5DGkB+JZo3lhseVvZheI+cd/NvO
         Md0ltUFtovCiBdKonu31jBwv/Ss2NbE/UNQeqpaJAi5wd6NEcD+E8OwNkZHHlC3E5kN+
         WGBzaAD8afqjRsNQl/yHGxHy8m/54U92GuMUWzUKBBmg1g7mGgnOgsGYhX2ARj5bk367
         nGZR4NT2NnZCGZ8gooHF7T49fqQ1c7MSQzVfWgC0DccsqNr8Hoqiz8t0zdFp09BacKFB
         G9ng==
X-Forwarded-Encrypted: i=1; AFNElJ9S/xEcJ6ErmgmcJjJBjtnxCr0rXfhZxoO1yqZnPrWMP64TSbBd3R1Lhx5eTkw1D3r43RmzyVFeKxrdLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysSyUxoTYAj0rkz+GXBQOeIFjI/RDMFWCEbZtutLfMLOZFZSCS
	yB4VSYRPDKtMzBOZyMGjOmkhxv5nJFBkCchTJBf3ArYyCrFqvhYcn2ZPjdpKohhq+OIS9noyKmD
	4fQHlxY2LwiJNT0LQMKmvV7M6hKjhTNgQnyxtYDcDOmpn0Y6/rgYTJZIU3UCnKp9X/g==
X-Gm-Gg: Acq92OHV0j6YvKmrRLrxDNcQczSdXwA6OVJIirfEjMLvRNq7/Gx8zbFDTF909qAx/MW
	Aq2pcYbjvyAUxaiPiTHUNA9njmN1hObAmvxywWIBIUlxYNCvc6hlz3Y2nVvvZ17bTCN4TVIHX1L
	NvLu1mHBDccYjTy9HR9SnpICUfPaZghs0ZXz0pmf24R8CdM+pgA0BcYRAztmT1tl0ZUUrTmtV/5
	i7cszkAieGuM98bvTGnkimTVFefcwpmUbS1fgNx/n9Sit4ZdEArW/pT0nZgR1M+0Cl9pKdd7L0M
	K489v6smmXRIrCLBpP8V9/4XjmxBEu2ju3Ek+uQLSXoTAcEmHpLoq/TIxNLXIEz0sk8Dlr5fEjB
	bymdgKNG0LvGYqgUUGtf2rdB+vZPBmtXhQhatuVGIy/wtltZaR7BPolbgS+Pi6ucdYa5P9TYRLB
	CTCV2Vrb0wWX522+mX9AovzQJTRSXLxf+i2Fp5pCB1tF2q2g==
X-Received: by 2002:a05:6102:5f08:b0:631:26f6:7016 with SMTP id ada2fe7eead31-6ff14ff2034mr5977367137.28.1780868359866;
        Sun, 07 Jun 2026 14:39:19 -0700 (PDT)
X-Received: by 2002:a05:6102:5f08:b0:631:26f6:7016 with SMTP id ada2fe7eead31-6ff14ff2034mr5977356137.28.1780868359529;
        Sun, 07 Jun 2026 14:39:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac1esm3319815e87.54.2026.06.07.14.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:39:17 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:39:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, robh@kernel.org,
        conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <4itwv5frj6gqfib4bzbie5o4zs3oea65vi4hosyaeitdagqdek@4be2jvik7csd>
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603143923.58E1E1F00893@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: 0iJ3LHrJQo9GX7H_QhmuVCpyqXyqyiuK
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a25e508 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=s3xQa8otug5672-2qowA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfXzAsPoelVJGJs
 Utc7YZfcgYx7ta7aB3nb2Fb0l8nZVFZ6hT5jCwJV03i0TXa+hcGD0lw069wQboAx6eQLu0VDdNg
 KPeXEpHWhsbmfcg1yR/irteYdUqiZ7flnBIYyyol477S///31FMVXyD/+I+iQrJwQkV8K/WF6T8
 VnKUrRLzqWjJPPwWjqJhspFns5abO2pfJFlk2IyP62xp4216KCDEU2PC51aXCo0s1TTK+fOS/Gj
 2+TRQTLf8PtjpjDrErCy9dox5saiHxsO6D9Vfgb2u4ymMTkAbg98J9rix93DRqJJyv5tBFAhrG1
 2PRKqnI/+EIxnTxzv6YMDoilSGKUbQGzrzrQtfTJZtXJc6p856IQkWFd0xi6AkfwZz0Oh2nvlsi
 L8gzuOq+Y0YvfjyjFFHxVVqqseeGNOhIt8XtRIRvBRukHKPlPFv/JMpEidwa70g6Pz2nxKX/Sbf
 CA6X7joCZxFbmbEQhxQ==
X-Proofpoint-GUID: 0iJ3LHrJQo9GX7H_QhmuVCpyqXyqyiuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64079-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:busanna.reddy@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4be2jvik7csd:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27AFE651B98

On Wed, Jun 03, 2026 at 02:39:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
> - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
> - [High] PAS metadata memory is permanently leaked upon every firmware load.
> - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.

Hmm, please check Sashiko comments.


-- 
With best wishes
Dmitry

