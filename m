Return-Path: <linux-media+bounces-61167-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDayLRcgAmocoAEAu9opvQ
	(envelope-from <linux-media+bounces-61167-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 20:29:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1743B51478D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 20:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B71513031132
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3755472784;
	Mon, 11 May 2026 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgqP63ZQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068F930BF6D
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 18:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523830; cv=none; b=ZEBqPqPXEwmdK1yV6Y7HNUo++idiOvS9V3YHDxLQf6qTmijW+jhYzrbxu2rnBg9CFt5isC/cAKkb6mIf5wEky/LZpPSbXCWC2fy2BZjq5cXJ/zRxp7UYbhiKRaFh72qtIFRJD0Uo2jNW9BNLip+3fR8xwlVp7HxbysQYjyLYe6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523830; c=relaxed/simple;
	bh=F8zrzlkx45OHJ29lp45H4tCMkhAj7460hK/3RU9O0gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtUhgsa3y8zToMuCFsYQCA4WyxiaOuivwv/2lkb7yQeCJY0/Po2joX9r6JRTIU50bWTfvbQaa2VorPUVbeimJ/VNLbEwx6uzb196IO4WohnnH0ptgdMGsxlqCdAvao6lgN4v8Ot72Wsq5f12AE+7n7L/R4o2mu3VuUgX7YMIaWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgqP63ZQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso42579775e9.3
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778523827; x=1779128627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QxNeZINcMY52Teiud5sjeLxhrrD/tQVmXIMDkkQmOJQ=;
        b=JgqP63ZQ5oPOPK6/gZkHr5usAliFGKuMYkms3KTu1/p67lsfbg09YU54MUGqDZh+XV
         3tAAwNPpERJ9H4mCzrOVyc/Oer/Kiqblte+uFi8/mOH2kCYfdO8x394/cjhJKGzezBs3
         gZIImMl2ppsenAVNPGfhkUyggXBzg5hmw75l4qQBp5FVSeDtqBFuRdpfGEVyngwElEuO
         9gV8n2JLwf1aOFkyVpy+m/Iieb3XCGH/3v/r9JZiw+P2VRIkQP+O86ydYqZ+F/STl8tu
         nB6wlxg5IA6RLYTetw1I1HSBioLyFnvgV8vBHxex9YLBnwDvstIpFyYYzNH0ECsKY3ir
         YRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778523827; x=1779128627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxNeZINcMY52Teiud5sjeLxhrrD/tQVmXIMDkkQmOJQ=;
        b=KMJKqi90JSsc8cavoUw+q5w1wm81z9aiLg0rDcu0Vq1t2qZQJQS0rhMxD0ttZkw4nE
         Y4c7eq9DAYUNJbSr4gIaQ3rXZYv96CsE9zf8bPFpkDHw5GFYNzG9B312rWSv6RcMN736
         68xvH52kim9f1DAhuqTeJEjZnLmSm8Z0c/RSpByDEEKQme4lpAEv3lCElW/TXTegZJX/
         /n2r/EPiTeiR+l0yayXhzAAIewKYyS5xbxZSU8CwC0NA9OSRp7/wVFXJWVyv3TS0rli9
         1vxcHvYLvp01iBQzW89Y4fxXrcbqFx/Yh2wTNUDb2GT2AgF3miAtN+lD0SitqDaE8bI9
         5NHg==
X-Forwarded-Encrypted: i=1; AFNElJ+KPb7Flgx8cBBl5+rG1vAFI8ZkZNi0vHkhAE7d6GimzhHa6toNHc/wGLj309Hq8K/12l7mImMbU6hoVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7X1jW1bwPfe2l3iLS2YWz8pCMPwu8Uru/5U5n8GPb+WlXL0R
	cR2bNr14/1CswI+tR7G5AC7xXmqTVD7Xgq4wMhHFOjyDaEd+H7BIAcOu
X-Gm-Gg: Acq92OEJbvhJPjAUBeVWZt+Vy1Q1OOoUxLft74/v92FRhJYbFMZkO0hhvK0Bg5doCk6
	RYtRrEghnwoRLgo24M/DE0qdiaAoR1AqGyfU9M8rCsmRK5flhNXDJTgQdOIvScab+yovTFNyK18
	uwgxl5NfFbcPLkihdDXkio19tH9ezBj6j0ri6d8MnMQyPTqeA2ozCVQe11iw/WkibUy9uxByyn9
	OylCJKQy9+fB8FiSV+SbxkleozT9p5lTn5/EBxQrfDph14c2cBqlCIgpCQLEkvFTcc7aoe/lVoh
	BTV2cgHGN9zwrx6JFyfn45YJstlgXrSrkhiMaBiBb/IORyycuGjqmFVGDmZ4yZ+Gia8cB7GQ/Y6
	Kc6c2p0AoWW1J2jGlbLI0rz20i5KTIk7oGrBLa4SS/Q9ZqU9nMHJ4sKnC8e+NLYtkdqDfD05Nr5
	9JctNiNtfrO0ojDDScRYEMK0sIbUtLxQ==
X-Received: by 2002:a05:600c:8115:b0:48a:9540:1a3a with SMTP id 5b1f17b1804b1-48e51e196f9mr409040995e9.8.1778523827458;
        Mon, 11 May 2026 11:23:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e61f7b8sm1806155e9.7.2026.05.11.11.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:23:46 -0700 (PDT)
Date: Mon, 11 May 2026 21:23:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2] staging: media: atomisp: remove stale "Generated
 code" comments
Message-ID: <agIergH1dy_pKwQz@stanley.mountain>
References: <20260511-atomisp-remove-generated-comment-v2-1-6ebc1b2d988f.ref@yahoo.pl>
 <20260511-atomisp-remove-generated-comment-v2-1-6ebc1b2d988f@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-atomisp-remove-generated-comment-v2-1-6ebc1b2d988f@yahoo.pl>
X-Rspamd-Queue-Id: 1743B51478D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61167-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 06:55:31PM +0200, Tomasz Unger wrote:
> Remove the "Generated code: do not edit or commmit." comments from
> five files. As suggested by Andy Shevchenko, this code is coupled
> with legacy firmware and will never be re-generated, so the comment
> is misleading and should be dropped entirely rather than having its
> typo fixed.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/staging/media/atomisp/pci/ia_css_isp_configs.c | 1 -
>  drivers/staging/media/atomisp/pci/ia_css_isp_params.c  | 1 -
>  drivers/staging/media/atomisp/pci/ia_css_isp_params.h  | 1 -
>  drivers/staging/media/atomisp/pci/ia_css_isp_states.c  | 1 -
>  drivers/staging/media/atomisp/pci/ia_css_isp_states.h  | 1 -
>  5 files changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
> index 38c9c62366d6..96a8e58cfcee 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
> +++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
> @@ -4,7 +4,6 @@
>   * Copyright (c) 2015, Intel Corporation.
>   */
>  
> -/* Generated code: do not edit or commmit. */
>  
>  #define IA_CSS_INCLUDE_CONFIGURATIONS

Now there are two blank lines in a row.

>  #include "ia_css_pipeline.h"
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
> index 1cd3322b0da0..96af15f62060 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
> +++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
> @@ -48,7 +48,6 @@
>  #include "isp/kernels/eed1_8/ia_css_eed1_8.host.h"
>  #include "isp/kernels/bnlm/ia_css_bnlm.host.h"
>  #include "isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.h"
> -/* Generated code: do not edit or commmit. */
>  
>  #include "ia_css_pipeline.h"
>  #include "ia_css_isp_params.h"
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
> index a542f8979905..8c9468c5849f 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
> @@ -4,7 +4,6 @@
>   * Copyright (c) 2015, Intel Corporation.
>   */
>  
> -/* Generated code: do not edit or commmit. */
>  
>  #ifndef _IA_CSS_ISP_PARAM_H

Same.

regards,
dan carpenter


