Return-Path: <linux-media+bounces-64083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cX96NYXnJWq4NQIAu9opvQ
	(envelope-from <linux-media+bounces-64083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:49:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA27651BF0
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:49:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Getk11YK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MuVaR7Uc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64083-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64083-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F663300E257
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 21:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0A2335575;
	Sun,  7 Jun 2026 21:49:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27166175A75
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:49:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868988; cv=none; b=IjGhk2QDM+mQ1eqooIj5Pj4aGvaM+EdCcDvUa8PnAHBkIf/HhIAIIEVvYamK8eCLveKnWgXm/B7nbFWq07UztmgxMVjROj1Ff5aUid1d33zfkOsZfIqBj5z/AjM9wnDZ/vhKVsum8nV0D+Lu5hU+kIpaJc6Ww+Vd7jgiERt1wSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868988; c=relaxed/simple;
	bh=pXEj32bnaEuxuRPrXJze1vNWEsA8Azc+N3fhn1syoWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuxAZ6Dt4m/jdGbIDtplH7ZpbV3IyiHyzIo0VlnzzvlkrSJ7iDfn3lEensoYzrWDE/fkI97QZEUjiozwxN4VZhdHf9wGewFPMRTAb8z4Mi8lxGwlNiUkhB0jSPV6m2DxTgI2VxqasYjyWmGfVwLfWfUY0lkFc9v0TapPdMLudtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Getk11YK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuVaR7Uc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Ek8Xe399106
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 21:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DXaTqNY2M+Ko03CtW9NBM5EV
	LlM8nxl7MyFTV+TpHHY=; b=Getk11YKZm/doRTM+2tdazuapP57I6wcDT6SXi+d
	Dh0MTS9id86Zb8GrbXJs4y8Qy9jmq73wGMBP5N/8ikJs3DBWJ0dukV1VIfK2UKBB
	aeJMGqxAxNPvRqEoMDG0Yxb70CUE8/AqGZYrUiBtnZEqy+C1G03VwBncqURUdtf/
	FcrwNgxxwzDkIszVTL+FqMn55C8Qy942MplHzIC1OLOBGN6JNfPex/1YuSvgv47o
	9ahf2E1E/s9NtJALNTBlzJMRISJ6TR+iPQYcdGfYRS82TDaVWigyQwfjN3r56QnH
	fxocFsj54qDWf0cKWxHSmH7gr2sRoAOm5oSildqySyDj2g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrd52g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 21:49:46 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ab02fb3054so2504308e0c.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868985; x=1781473785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DXaTqNY2M+Ko03CtW9NBM5EVLlM8nxl7MyFTV+TpHHY=;
        b=MuVaR7UcvcoxeNgbJ4hVVvmx+//2M4qfQ1GUjQz+JxtgjrKzaFHTL5EFA2AKsVZ/iA
         ojddcZAgdwzyHb2v8Z+DM+fYAqiGzJ6/N6a8uKjUggAVBa/UD4IrFHOknJ9eV4KfQ1i1
         G/1jRzXHtS7A1T8CnxxVEnALX7m8EKX0kkfC+CSBJum0D7VQXelJbFKXpwLtTc6vq/sY
         VssXiNgB6Yu4pu0wvo5OAovS1IIW4yb57ngtf32BIjrrmqkzSR8ldKjHxTufcOJI5n2K
         NvI7iOAv1daSPQZLc57X0wNW/i4mQBJi8qNidzNooYxkWlgXZ+uf2DWf3/0ualuI7LQY
         ijcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868985; x=1781473785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXaTqNY2M+Ko03CtW9NBM5EVLlM8nxl7MyFTV+TpHHY=;
        b=IJaQU8+eWawB5dkbeCsx+6MTiKHFOvhvVwEAGqAKekLFDYHVIz12WejvLAD4wad2cL
         Ys+AJhU0eG5vQOv+hsQL6+IvM20+hcTEpxSM5fUmWWhhbLhO8BnExWsds+6iFGFdrDVf
         /0A5HnlD/vAL8z3rp4HgzJFTsf2fmAMfM3PBcNDZTH1AxQ2vg/GffBZTBDrQwe3kQFLO
         BurB9xeZFk14TZG76vgZP800fB798xn21N08nvJCBIb1VP5tKCBpky628xSfG/CIo2lD
         I23ySYvsbTdOhaa2IGz7oTV9MdM8yNbR3aXoKSnIryZ+rxmWDJtyzLo072Zf36hmH63C
         OQ8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/EE9RzF0xxJN1fgTNLqdLwBrSyDy46fMTo0O7a0bOqWm9JNSVpHpeosL9ZZvJTyFzAFa2I+RkgU3LJQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDt5R4uDYZ76dnsqMklArggWxp1AL9NJUUl05RyjTtSkivUFO
	nE0Z4kHxoj+N6nlLEr38EDIlXbey7hHQ8LCuMwTLEjlNgLYPOlNbU0nZU/HwyiVEBdyoYU+3P+c
	ctcHFNBJT8HAiVwJ0QaLtR4u8ZR1xJ8VuniNTMJgVI0+A5wUoIWCYo+dB3uFo8SakEg==
X-Gm-Gg: Acq92OEh/1dE5V1xU7hGUoucHSLMw7wJXaBMPHEA3jcnhrj9+vQUM4YZDKrmQZGa2dV
	b1z6BNXD2rlXKaaY3icAQDXEMDYqcLamkARwQOfjS3sKeSsUXVlSWnkzEwqlF7NONjwXzKbmqfk
	sep8UYZQf/r5iYKzjUVhiPZm+ip8+MpPo1XClYRsa03/lW9B3TpWwDIERqChgiGYmrs2DjsReGT
	SCiq5JgZGKSSdJ2U7j+UVzaZIgP75c4K7L47uUHrxPy7ZV2J51WieZsqKHJcZM41rJXRa3TgvCX
	ski3xUk0xbA6/+ztIaVHAiZUfY0AWmEUrrGy1NCltGrRhSKbuN9wLdovqTY5mz1N3nmpJRbARMT
	FBcPdCU9rjn1drZnSZFC0UcqXke3MGMxXGJ8790geL6t8d7BOVfZFNDwEOpHe3yk8sVhVMxutQF
	ULFASxCKlMMEKHExAP1YBTB5rPnz5+ho1BZfpxdmU2D3TAvQ==
X-Received: by 2002:a05:6102:3ec8:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-6feef48d3b0mr5781904137.3.1780868985408;
        Sun, 07 Jun 2026 14:49:45 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec8:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-6feef48d3b0mr5781894137.3.1780868984978;
        Sun, 07 Jun 2026 14:49:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed8f6sm3317851e87.6.2026.06.07.14.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:49:43 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:49:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, robh@kernel.org,
        conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 09/12] media: iris: Add support to select core for
 dual core platforms
Message-ID: <n3sltwjzpp4cl5b53w7sfxvdrsnjus7vmydqzyfa5d7rao2sro@72ac4cxxydoz>
References: <20260603-glymur-v7-9-afaa55d11fe0@oss.qualcomm.com>
 <20260603144434.928EF1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603144434.928EF1F00898@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX6fDFJm6jE0mf
 z7gxxmqhA+oF4URg+S4TBq4CMHj/4ynDU/mJN+gPOrMq7wSp89oPk5kXrky+qkm01Nq8Aro+rDH
 tZrGtXKeu1JFsxRJsdIyGrsedH4z2fhJrlsjq1us3ZlegV4naL+QEuSVwsgnsmFAavQvRbXZ6fC
 QSPH+RmqMBT5jX3o7YmTavFiM62ZJEGrhrETv2yvgyO3SeQLnWXFEbH1wLsTDxpy+BRAbIZ3zn3
 k6p2lZtl0OHA69Ehpbd52MVjXFkMY/z4KS5k0gSPDX8/JyybBXsO3OBKfO3cVGfXKz/PfU2rSac
 ctYyVDocTY3lipVqvIFAVHDqpNl6+tPEZE0STf0fZbktCEDSVnG/RN5IsQcVYutjj83RIti6rpM
 wuVbvgzK4bc/iUWvB7xxTV2DsdGvhGT5geF3l9KPlxMDbxz2CpfHcwaQh52+7UvMfElMUwZYXru
 tz65LwbR1ooIwB2W1pA==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a25e77a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9tgJAH-OFjpxVSOFymEA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: xqx-JPIZFJh2yIPFyWNvRy3eExwkSnb9
X-Proofpoint-GUID: xqx-JPIZFJh2yIPFyWNvRy3eExwkSnb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070219
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64083-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:busanna.reddy@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,72ac4cxxydoz:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2001:14ba:a073:af00:264b:feff:fe8b:be8a:received,100.90.174.1:received,209.85.221.200:received];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DA27651BF0

On Wed, Jun 03, 2026 at 02:44:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Dynamic core assignment logic mutates `inst->core_id` during streaming without firmware notification and without holding `inst->lock`.
> - [Medium] Initial core assignment bypasses MBPS constraints.
> --

Vishnu, I'd expect at least some reaction to the reviews. It doesn't
matter if it was performed by the person or by the AI.

> 
> commit 2b81abf719d22ec30cd3764b2bba16be2af15168
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 
> media: iris: Add support to select core for dual core platforms
> 
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
> 

-- 
With best wishes
Dmitry

