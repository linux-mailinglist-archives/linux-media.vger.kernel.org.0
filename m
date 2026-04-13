Return-Path: <linux-media+bounces-58632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGt4CrWe3GkEUgkAu9opvQ
	(envelope-from <linux-media+bounces-58632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:43:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7997F3E866B
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E0B0307AAE9
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C139397688;
	Mon, 13 Apr 2026 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2wJYjxW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F0E396B7B
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065863; cv=none; b=BQzS7HDj+WPBfOmbske2sCyH6JbPriZJpxU/ct1w0ASNCiRWX7M0HIkYKU8nKqeUqX3D6crMU8QGI3JXw5aWu4o0XtOPMWlFWqeNCc7lvMfg3CIIptu255NPYhrtezuwt38QlibN4pAWgMIJcy4KPtE/mOFwN6ayG49NCX09Y8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065863; c=relaxed/simple;
	bh=SC3qj+zSPrXC7x148ssSlAOSsrLh6sGlRiQ6lldj1q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i122ThhTFgGrCSB1gYyoaxa0eptTYOmZn8NqRKOBRQdn4HBVMB9RVC1HD4OzkTJ9CTAYv7KWzF3Pgr8FzHOcsltZS7d39ZhUuFVnR/QfuijNAhX1eBKpJFg4gibmCemiYSot6qG1uk+UhlO/YD13SPMjZPu7xcCSQF3VhDUxHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2wJYjxW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d70c30767so666809f8f.0
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 00:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065861; x=1776670661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i0t7dfofWTApgTDHYz2jvCuOmi04UnlECznc19h2Ol4=;
        b=Y2wJYjxW8dF+sxGCY6h6//xdFZjIdrWhDcMuhZ2OLcmpVZud991/hGeZvd0KEDilSC
         CKE6kNNf6+xtyExxaCtoO4kfeN5I0ZB75iguSubit4OR9WSADV/gg2O1wxAjTWiubyvI
         W5zR50ospipf1Wzs3JDGfQGjGyFFgWCSWqWFdqKRVoH2hmUQzBcJvQ7mXd6RFUJtYjeQ
         pfrjDA6APBLF9GF1wwcel2uJQXOXLXIttCybTEEQ/geYoOXgbBV1xztvvFtrdEX4pa6N
         EZKsBIizix5uvE2dG9Mdp2Cq3QmiRaUBeiO4bRwXHkX0t2mbcmgL3pka9RMTiYk66xkO
         1vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065861; x=1776670661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0t7dfofWTApgTDHYz2jvCuOmi04UnlECznc19h2Ol4=;
        b=duZiM2R29lq9pI2oY2jHSdL0oAM7DMFiaPLNj4rhHjBxClBZ0JdL/BmBWfUzgcOl6v
         jlCiYNFrLtAeBVZgLTLYD283roIZOO+umD00sEp5w0mvYtqzNvTBZQ9dEnnB9CptgxWP
         10cP59syQYi+mcnqOgCjQhWiHBZkp9rLuYqZHgPBB7ysN2kpxOfTlhH8LH9AM68/ucFT
         iriP7wA+Xd4v4C5Q1gYVLqgylmTl/Ot5Y+zTBiU/GuWP/aCMdE5AESCOrkWkU+duM3Dp
         RS5sBNTwOikavB5teXDjtyW2/6X/MXElzbZRN7LAlzVJpaAYsT1+NTJvZlJgVFHm7FDQ
         DiDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wenXZnf3Yd3JtnCBy4EnsQexoJhULnGnIJrfYQZ0RB4uAcYDkgOBCOu+RL6IuYLg759LYHC7em2DSBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgbshL+GsFoYQZGHvNd/lgYG3wEpB8Zr+Bz7zraHWcMv0YC5jr
	jhcHcYsXe+dEazz/ud+2xdgSOqjINf7lnxRlxNWxTmHbrTYx8GTYSz97
X-Gm-Gg: AeBDiesT7mo2mXm8p6HnKbq9nC1SMjLRHA2jITsR5tkkFucbxS4ZsHtT15DH9uxeEWO
	lL6xMI6IEjOX+4cDX1eOMRezH+IbtocIAnljPP3Ve8dEbgTIW/kcXZJoSnLnCC33LMa4UsAEBd4
	sOQtsZ7+J1ZHhsWSLneUCsDf6Of+Ma0SFqIpdZe5yeUOZ1CKLtTm1MFCc1998T6omY3X8SrOQsh
	arWE6i/CfYes/ppCkyRcRGkUqg1v5kYPrCzFn4USVAVtcjuRmO7KtVho1dgiJ/36AKJpZM8eLQQ
	NLZzQfDyY7Xa9GOMpoLAbs8LdIeKuNuk3L6LuqMzB4Iu26WLK+G2n0FTRvTaKyKiSwnfwOLkA+k
	Q8xxDYBCXhrnUcGpr3QNpaHUKYT7u7apbNmFcEskUqblah4LtxRSUDT+1VMT0eEd2P38+zEJd/Q
	349vwBzqmWtV+LR1eBg7I=
X-Received: by 2002:a05:6000:25ca:b0:43b:5091:39db with SMTP id ffacd0b85a97d-43d649740c0mr18904434f8f.13.1776065860668;
        Mon, 13 Apr 2026 00:37:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6f4bf2b4sm15213667f8f.20.2026.04.13.00.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:37:40 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:37:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: tegra-video: add missing error
 checks in vi_tpg_fmts_bitmap_init()
Message-ID: <adydQWbkY7X68yVy@stanley.mountain>
References: <20260412045245.GA2019381@kroah.com>
 <20260412084808.232010-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412084808.232010-1-hossu.alexandru@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58632-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,nvidia.com,bootlin.com,kernel.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7997F3E866B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 10:48:08AM +0200, Alexandru Hossu wrote:
> tegra_get_format_idx_by_code() returns -1 when the requested format is
> not found in the SoC format table. vi_tpg_fmts_bitmap_init() does not
> check this return value before passing it to bitmap_set(). A negative
> index converted to unsigned would result in an out-of-bounds memory
> access, corrupting adjacent kernel memory.
> 
> Add WARN_ON() guards so that any future SoC addition or Kconfig change
> that exposes this path fails loudly rather than silently corrupting memory.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

patch 1 is missing.  Also the little change log under the --- is missing.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
And I want you do change the commit message to say that it's not a real
life bugfix.

>  drivers/staging/media/tegra-video/vi.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index afc7327ef318..d1d934e361f7 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1017,7 +1017,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
>  }
>  
>  /* VI only support 2 formats in TPG mode */
> -static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
> +static int vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
>  {
>  	int index;
>  
> @@ -1025,12 +1025,22 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
>  
>  	index = tegra_get_format_idx_by_code(chan->vi,
>  					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
> +	if (index < 0) {
> +		dev_err(chan->vi->dev, "format SRGGB10_1X10 not found\n");
> +		return -EINVAL;

Change tegra_get_format_idx_by_code() to return -EINVAL instead.

regards,
dan carpenter


