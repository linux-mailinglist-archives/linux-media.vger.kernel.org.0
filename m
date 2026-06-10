Return-Path: <linux-media+bounces-64387-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mzKuKcolKWoURgMAu9opvQ
	(envelope-from <linux-media+bounces-64387-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:52:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E60C2667709
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:52:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jJpAL0cV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64387-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64387-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E7B23005D10
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07323B6BEB;
	Wed, 10 Jun 2026 08:45:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0C6391E4C;
	Wed, 10 Jun 2026 08:45:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081113; cv=none; b=a9X8b/kzoOVcLkpTNYHt+MIKhRiD3Q/TwmBqInxWUl38MKETQeQNQ0YRQqkCf2NupGqpYDzNoZYjccEfoebsoR/AusLkD/mkkKfQ9BHwSMkAt5V1T9G63k8T1yb4/iT/D5eJgcrrhwC24fLVv1R9ar8E4BYlWWa1fTd/SbTssPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081113; c=relaxed/simple;
	bh=79dR3ec1X7G4Pv+5qYv3XvdOClyoQArgLr1CO+yrC54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwGlG+xoV9Y7XekPJu9o6+MR3v5tFPjT1WruI8IPtoLbeeuaDVpz5xAXSlzo9wQaNeGVMph5EueGEE2Bszp+ugXX6yeumPYScXxQFJPg0JQwvQn8dnXJJgLxr4zYMI/EWMBSDBL97RYLbNMygxM/J/X3EPrwRdRxHMV/tuoOCpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJpAL0cV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB0B1F00893;
	Wed, 10 Jun 2026 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081111;
	bh=v1jCvYF1UWZxDV4ocmTiPKKrNLTz98XdwDOkWa7eeJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jJpAL0cVq8UgMWLY6pGq+xoa61xoIbMPFZvg3QdEK23OCroaoMmRWD7IZ9VEWVA7L
	 VNvwCTHr5z3gtQ9Edx6Qob2Lqj6XfMUPx2UBvFtBlAI63Qf0+nDe04MRdGWCgtCJKB
	 O03xK8gtjVMhTK9lxhc0X+LrBBtKfJFbcWPfisgwmp/GgQ3v93pRG8Hpbzk06sOoBO
	 0XUYhwMNNffUSnAC+zmEq0SJxFlV0ATENZJEwp9aS7ftk4RaoFGmGzHeePkpfiUfb3
	 OjefkVn4IBC9QzMOAphXIfzOxOcVMwaEYzpDk8L34aIA5zirvNPS96wZsE4TeAOYRP
	 An+vun2QHkSZA==
Message-ID: <383dddd5-be5d-4c8d-bbf0-f889b83af374@kernel.org>
Date: Wed, 10 Jun 2026 09:44:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/12] arm64: dts: qcom: glymur: Add iris video node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
 <ml_9sjHrXhEekEoq2gGpd-TK18TRhfINS8p6Nvz54Vsic2kRx3LrHye0pdi-i2RbEDkaFxaUI8cLNtSc3wGK4w==@protonmail.internalid>
 <20260610-glymur-v8-11-1c79b9d51fc0@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260610-glymur-v8-11-1c79b9d51fc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64387-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E60C2667709

On 10/06/2026 07:29, Vishnu Reddy wrote:
> +			memory-region = <&video_mem>;

What about the 600 MB limit ?

Lads - please stop pushing new bindings until there's a solution in 
place for that.

Either codify the block Daniel has - which TBH I think is wrong because 
it prohibits allocation < 600 MB for pixel buffers.

Or restrict the IOVAs in the driver _or_ via syntax magic in DT.

Either way we know this is buggy !

---
bod

