Return-Path: <linux-media+bounces-67541-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lzWbI7fhVWrgugAAu9opvQ
	(envelope-from <linux-media+bounces-67541-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:13:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4E5751C2B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:13:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CfyFv32A;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67541-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67541-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCEB9307A321
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 07:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D113E1CE8;
	Tue, 14 Jul 2026 07:12:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5C13ECBE5
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 07:12:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013145; cv=none; b=IRC8IicJy61/eZmm981iY7Bji+epkN+pHcuIbJnHK+Ps42gS6qvGqMC742klokCOEPclTYECMJCQQIaPswD4ItqfWCWM92dyhdAfpv9SRewLELIAY0rqHXpqtoLbdDuEiooZPGfDMS1zNGTgI2n4h7OdJkUTxiNq7v/z7Dddphk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013145; c=relaxed/simple;
	bh=So77X3sMp+X8X/Uf6jYIL4nu6vIlJI8yrVJBIzmhyUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrwClfrpzfSfstUemNx/sP/byDHtsP0Z1qyOsIcFkJbNSLIqEhUxM6EeWEdcEceC/i7k+xxpxN636bhZDFzS7iYlq5gNGgARl1ClAMe7zViPMwbG/Ve+XpuoeMTCBYGM7o11ZJlGyBL70ZKAjHqao5E1tdj3T2BJSx0ayRKvfmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfyFv32A; arc=none smtp.client-ip=209.85.160.53
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-44aeefa1c00so995279fac.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013130; x=1784617930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i7/u5DtJLPl6AAyXQzJGGOWXfylHC+3RbrSgc8B6ED0=;
        b=CfyFv32A9EHnK+95zogVsT0u9hHUVhVOgIOzI6VWDoeSenqgIT7cLMOxBWv2WgH6Gg
         g4arJEKvDyhBhc07TeekwSgoccTyiuKYdj6KEEqza+ElL2lwXpNG+CEwgY54hvGxIQ2b
         s1TJn9avn5DFU5+iK9p15tKbjkzVLp3IxDUPdzEtz56rTbPV+64AfSuAaU14fW+JWNez
         74LpJckO3MumBuBlXAA4oFOs8PJ9p2DS6gqS1hLUiw4W9RPGnluOCESf1o17yIfdF+c3
         nNK0PV2ETVStTnOUVHMKs//vAxuUXhRjwCZu0YwSMlXpOL/Mm6ZJNtBrK2SV+r8/JS/U
         8HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013130; x=1784617930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7/u5DtJLPl6AAyXQzJGGOWXfylHC+3RbrSgc8B6ED0=;
        b=WV/RzVFlwp8p+9r7xM5EvR9Js0FPzwXWGVV1cHpM2LNBQhnDrg1fARqYXoVSjhS3/R
         Q4jGhW9Fyxv4JHVulNRaM1w++gewMua81YZNM0Uksa4ED8pibI7xEh+fpNXjDRG7qcG2
         +IRTwph2y6vlf0Q8kJgnGdEWF3aw6ADUb40dtwUjYMJUZSd0qtH8xvknyFuTT21tMCiT
         LZPU6ljo+tcB82IPuWwvAmPNwAA6FA5+GmYy88QUc7ntTyerrBFtnaPAPy+Ap4+N9pnf
         8jThr/zOAuFx9k2G+/Ds4AhiJCCaT2Xe1EDUnz9mgFdPd2GBstqfg5VXABwq31lqCo42
         rRDg==
X-Forwarded-Encrypted: i=1; AHgh+RorRPaZ1TTe8A9zDEGsiEzi8iGSPYdt3ZIYQoRFsrAXER7amsDhOUqghU0/gVZRqOTbdgHx0mmgBKb+ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8T4T4+TnHwysiOAvg9mMYhbtWv7L+HPiYwDw5OOnQG5hrRN9
	oqyULTwPn0Dcb8eSHYWXK7l4gvYlQB4BRP21/dLiVvL3u8Vifx1qkbLq
X-Gm-Gg: AfdE7clMGBsMxa4PPb1Oq3nRSSV/QIp77uGG6LJGLqVrhk0G1C9Aa0hMiXVCgNtPyLP
	uDeFKik87J0JPk3JfyDxdzIs5DLZC+6WC5nsJjxtvtwQA9IV8Xc/eZ1mRIpesvR6BQ4KP/2jPpM
	7Bp7IxcB2iekBRAamW2LFSjzieVOkC0w3cJfpD9FXiuoFmKBHvM9/edv4lxZjvQ3vjuxUF3N55M
	2S5XxqKcvNrU1Dv1IZj2WTRuNn2suzQcXOYuLfb9t1olxYMfdUM/hSO7lGyD7BTjoMT0rJ/YKzU
	yR0lhjTHaumCdQCs5vxbUfN6U5TMvwS9iZeAGylt9QDVmL/D8vkHPuH6ZZQFo9Lf0hf+RsY15Io
	kfu0Cu02hF6PaXC+Uzseqg9jGJVGsRWcv67eey4M3Q9qxU/roBJV4KmNy0EHXE7jlI2ullpORTx
	Eymwg9
X-Received: by 2002:a05:6870:e188:b0:443:1de6:beb3 with SMTP id 586e51a60fabf-451f253aa66mr6397334fac.5.1784013130404;
        Tue, 14 Jul 2026 00:12:10 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45191244618sm15385010fac.4.2026.07.14.00.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:12:08 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:12:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	bingbu.cao@intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu7: add NULL checks before
 ipu7_mmu_cleanup() in remove
Message-ID: <alXhQv_8v7ndQwWx@stanley.mountain>
References: <20260713172127.615-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713172127.615-1-alfievarghese22@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67541-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alfievarghese22@gmail.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:bingbu.cao@intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC4E5751C2B

On Mon, Jul 13, 2026 at 10:51:27PM +0530, Alfie Varghese wrote:
> ipu7_pci_remove() calls ipu7_mmu_cleanup() on isp->isys->mmu and
> isp->psys->mmu without checking whether isys or psys are valid
> pointers. If ipu7_pci_probe() partially failed and left isys or psys
> as NULL or an error pointer, the remove path will dereference a bad
> pointer and crash the kernel.
> 
> The probe error cleanup path already guards these calls correctly with
> IS_ERR_OR_NULL() checks. Apply the same guards in ipu7_pci_remove().
> 
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---
>  drivers/staging/media/ipu7/ipu7.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
> index 310e3f24e571..41436f22c684 100644
> --- a/drivers/staging/media/ipu7/ipu7.c
> +++ b/drivers/staging/media/ipu7/ipu7.c
> @@ -2637,8 +2637,10 @@ static void ipu7_pci_remove(struct pci_dev *pdev)
>  	if (!IS_ERR_OR_NULL(isp->fw_code_region))
>  		vfree(isp->fw_code_region);
>  
> -	ipu7_mmu_cleanup(isp->isys->mmu);
> -	ipu7_mmu_cleanup(isp->psys->mmu);
> +	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
> +		ipu7_mmu_cleanup(isp->isys->mmu);
> +	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
> +		ipu7_mmu_cleanup(isp->psys->mmu);

The original code here is fine.  It is the probe() function which is
is wrong.  See my blog on how to fix the probe() function.

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

regards,
dan carpenter


