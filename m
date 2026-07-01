Return-Path: <linux-media+bounces-66230-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IOjQKFMuRWoz8QoAu9opvQ
	(envelope-from <linux-media+bounces-66230-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 17:12:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F056EF249
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 17:12:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=TxaJ3D1y;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66230-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66230-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E99D530CE257
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 15:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6C73F485E;
	Wed,  1 Jul 2026 15:06:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF863E0C53
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 15:05:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918361; cv=none; b=TNHzWNZHN/XDfIDJE4Y78usamV4eimvVAkdu3AGeaS7vFaB+bT/r7Os0cxF6XV5JeIBIPG2tV1k4FPa6lHSpdLyr5kdaekpI6I0o7Zw/hHOT8Qo+TCLexozbet/PQiCprYCCnQRSP+Pr14mfF2Ejcm3CVU7hbIOTwyVG6m5U9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918361; c=relaxed/simple;
	bh=18zI0uDNXCdZC0YCPtSLa7z9JgEmzrvmewbjBUWwyj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1himEJcz8m5knY23M5kF/zICLUo6AhFqIRVIOq+QfY3+g3Fchhl2og+uuYEBRLb5boe7FWEjevR6E/E3ix3BYDlJ90yJUI2Z9ecniTIk6txePsUvrowh9nPr63IgSwKgzPXiXMSS6jqANhFODCQMdS5+mOR7Os51OovBxIAfjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TxaJ3D1y; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF6FB2309;
	Wed,  1 Jul 2026 08:05:52 -0700 (PDT)
Received: from [10.2.200.62] (e119884-lin.cambridge.arm.com [10.2.200.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48F9C3F85F;
	Wed,  1 Jul 2026 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782918357; bh=18zI0uDNXCdZC0YCPtSLa7z9JgEmzrvmewbjBUWwyj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TxaJ3D1yKU6P/dCCIkctiv2SN0i1xv/dkieLr16Qd5J+f6/r/nA8Te5ha1ofY/ejO
	 Myc1Ccf69BdOPm+JBG88iMVeDHrM9zK3ee1dJKuvQauhE+pHPx3R5bPPMO8YNcOEHj
	 JVmXAxZwLhwrbhitwDZ5VPid86twmZUA0afzDbUA=
Message-ID: <05776c6a-d5be-41ae-8e27-b87cb063f251@arm.com>
Date: Wed, 1 Jul 2026 16:05:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2-ctrls: document expected validation scope
To: Linus Walleij <linusw@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
References: <20260701-v4l2-doc-v1-1-9cce64b7a1c2@kernel.org>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260701-v4l2-doc-v1-1-9cce64b7a1c2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66230-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vincenzo.frascino@arm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:nayden.kanchev@arm.com,m:Konstantin.Babin@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincenzo.frascino@arm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,arm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6F056EF249



On 01/07/2026 09:11, Linus Walleij wrote:
> After discussion on the mailing list it became clear that these
> validations are not expected to be exhaustive.
> 
> Link: https://lore.kernel.org/linux-media/20260629133209.GG3054459@killaraus.ideasonboard.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Thank you Linus for posting this. With the suggested additions would have
certainly helped my understanding.

With this:
Acked-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index b8698b85bd80..58184b6e386f 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -118,6 +118,18 @@ correct. This prevents the situation where only some of the controls
>  were set/get. Only low-level errors (e. g. a failed i2c command) can
>  still cause this situation.
>  
> +The validation of controls is not expected to be exhaustive, for example
> +custom controls under ``V4L2_CTRL_CLASS_USER`` would become very voluminous.
> +The expected behaviour is to reject settings that could:
> +
> +1. Pose stability issues, such as turning the hardware unresponsive requiring
> +   a hard reset, such controls must be rejected.
> +
> +2. Pose security issues, such as compromising unrelated kernel-contained
> +   data to userspace.
> +
> +Extended validation of control values should be performed in userspace.
> +
>  .. tabularcolumns:: |p{6.8cm}|p{4.0cm}|p{6.5cm}|
>  
>  .. c:type:: v4l2_ext_control
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260701-v4l2-doc-c60195d38d00
> 
> Best regards,
> --  
> Linus Walleij <linusw@kernel.org>
> 

-- 
Regards,
Vincenzo


