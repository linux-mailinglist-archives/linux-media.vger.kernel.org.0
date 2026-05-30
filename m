Return-Path: <linux-media+bounces-63100-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDLsDPqmGmp96QgAu9opvQ
	(envelope-from <linux-media+bounces-63100-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 10:59:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A42D60BC16
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 10:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70B7C305F5A5
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 08:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E929397E81;
	Sat, 30 May 2026 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hbXMiGwD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744663537D0;
	Sat, 30 May 2026 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780131374; cv=none; b=j98eBTr9YZx5THcjM0BzLIHMMkDjcYvXGleRp3aseISmAs/ofmnkx/JeDvtZwg1L1hoxgzf1cIqtmyeL6hPWIx0/WyuDErgg7AffKcid2UstFW8v32WiwVKB6GOEHeZxIHxBT2v4EvEvayO09Ru6iVCRq9eoMuo6cSZziYy5lH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780131374; c=relaxed/simple;
	bh=e9BpaDkO6dh8loJgBYte5yvZkPQd5EXFNkw/7Gmg234=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rN8sXN81VBXok+c3IeOZU21lhYVl1ig2N6d1nEHny9/FOacGpsaluhBzap4yzSm2oZjeCiqF5lQnaKkTxkJywfu3LRc554ZfdZDk6mhnK4PZtHAz+iJupXTUrJOF8MlsfWkvUwnddzEhM4/CeKJvHkrX6JW/dL1jxJqGX1VQkJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hbXMiGwD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-83-225-32-59.net.vodafone.it [83.225.32.59])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27C8D9A4;
	Sat, 30 May 2026 10:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780131342;
	bh=e9BpaDkO6dh8loJgBYte5yvZkPQd5EXFNkw/7Gmg234=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hbXMiGwDufgWQhqnfraasHhLQcAmXvSl7H/1DFTGfeio4R0KyiyaT1ZOUwfl1OKrU
	 tkeVrMw94TC08CoRLLPH1690PLHk4RgoH68FqQy6W4zQrFUNEEAhMTjGkWuC1kyh5D
	 5Lw8GQfLhfGLWASoI+O1tQkCkQrrR0X2WUpoqc+o=
Date: Sat, 30 May 2026 10:55:59 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] media: mali-c55: fix integer overflow in scaler
 factor calculation
Message-ID: <ahqh3Zv8xXNENzHb@zed>
References: <20260529024429.6942-1-devnexen@gmail.com>
 <20260529050649.14109-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529050649.14109-1-devnexen@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63100-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7A42D60BC16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David

On Fri, May 29, 2026 at 06:06:49AM +0100, David Carlier wrote:
> The scaling factors are computed by multiplying the crop dimension by
> the Q4.20 unit (1 << 20) and dividing by the output dimension. The
> results are stored in u64, but both operands are 32-bit, so the product
> is evaluated in 32-bit arithmetic and only widened afterwards.
>
> Crop dimensions may be up to 8192. Once a dimension reaches 4096 the
> product overflows 32 bits and wraps (zero at exactly 4096), programming
> a corrupted scaling increment and corrupting the downscaled output.
>

Have you hit this issue ?

> Define the fixed-point unit as unsigned long long so the multiplication
> is done in 64-bit arithmetic.

I guess the h/v scale computation could also be done differently in
the driver code.

We currently first transform the crop rectangle sizes to Q4.20 format
and then divide by the scale rectangle sizes and this, as you
correctly pointed out, could cause overflows as 32-bits arithmetic is
used.

Could we maybe first do the crop/scale division and then do the Q4.20
conversion ? We could maybe save the below do_div() if we're in 32
bits domain ? (I'm not actually 100% sure if do_div() is desirable
regardless or not).

>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
> v2: Use the BIT_ULL() macro instead of an open-coded (1ULL << 20)
>     (checkpatch).
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> index c4f46651dcee..6706939b4a90 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> @@ -15,7 +15,7 @@
>  #include "mali-c55-registers.h"
>
>  /* Scaling factor in Q4.20 format. */
> -#define MALI_C55_RSZ_SCALER_FACTOR	(1U << 20)
> +#define MALI_C55_RSZ_SCALER_FACTOR	BIT_ULL(20)
>
>  #define MALI_C55_RSZ_COEFS_BANKS	8
>  #define MALI_C55_RSZ_COEFS_ENTRIES	64
> --
> 2.53.0
>

