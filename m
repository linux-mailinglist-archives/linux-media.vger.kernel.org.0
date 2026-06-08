Return-Path: <linux-media+bounces-64137-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NQ8PAq5qJmrHWAIAu9opvQ
	(envelope-from <linux-media+bounces-64137-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 09:09:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0E9653672
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 09:09:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MWClvn55;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64137-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64137-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6C253013B53
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 07:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBCC3909B7;
	Mon,  8 Jun 2026 07:09:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CC83859CE
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 07:09:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902545; cv=none; b=pSaz09APHn19RK5PpJoiAKke0zY9TeqYusEDvEYeNz4VhpVFJ0+8B920nW5Xn5qo0NL2M15+m331XBoB9FndI0x+fWRFHPccIzXqt3j/wb+4M+b3QVhTHyaHOUpteqGzTz1tSUCCZ7bvbxC9h//NvvNgsLvx/WoPLbNfSYK1Wsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902545; c=relaxed/simple;
	bh=x4YGxnUH6nSF5/ZhKRoPbEMOQVVMlItMWOWI/c6CpGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAPe2MCGtg2bjdS0NdF8HgRIAR7fpiP17DmQ4pUJZXn9zkKuaohiHxnGeJ9r/QXhHr3d56tf83V6AW4q2P09Z2IwLmNSbxz4QspXOpVt3Zo/1b75jtA/KtnmTBNKE2sR7KVEhnZT7xCvKJzwvt38KXnaQSdxdRWHQEM/Vcfu+h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWClvn55; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so34447905e9.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 00:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902541; x=1781507341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=otSzr2Y0wGW3RXTk64Kspnpz7/ygAtHA4NuNzYHMC48=;
        b=MWClvn55UeLFGgNjzWAePIlK/B7iknzIXQMaKFe584rHDAVfCJs7/fUFJ59XhPg4e0
         +edsEzHd88RlF+AG/GgJuCT0kW9iUhK8yEqQET+urZA88lqNXnNDOnJ9RGyVeBtx2Ow+
         oVOulf9wMuygGSfVXwvtshw6pMYfJuMHjgeLm3XbQ7XDJFwnZ8Mm/rWF2jXZwoEeeG/M
         Vlaoff/JQILyOkc7y7Ge3wAr3/mD0F+I7o7mSIGXX3Ai3LHJN0vL4lpWh39B2EVOO+Os
         zcdO0xQavBs4BFU5wJzv+7StPFZ1ujR8eeu+ZZL7ES+qdyvT/es7UlNkwoHNVdJDBUH1
         VRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902541; x=1781507341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otSzr2Y0wGW3RXTk64Kspnpz7/ygAtHA4NuNzYHMC48=;
        b=gauiA9gP+pupWxzVYUK/rotQJfggbMpUy3uRmbOKFcealafI08IrftiuGxI6DWqnTp
         j4eVUwHKq4RCoUEa/KLyi+/plfR6hREd7rPt/fvTpyZJoE+1PEcOvv4pF+bbVChcmLAE
         AP8EnSMf12zMCTX3Oqcc4b5LW1Avw9JPtVasu93FlfbXm2zca+RpMuTaCc0oJlFcKVjo
         /0LABvCuDisjTmmVKqiOk/3AuhlTKWcLl/Yt8WIQXbovfEe3YIRzJ5L3O+k7ttPQqN+p
         VZpjGIX4GHuqmeUUi6MHYsjhUEHIk2bkYhw5mBV0wZb+SMAztHN3gHATTLwscAKvOyhN
         aKtw==
X-Forwarded-Encrypted: i=1; AFNElJ/HqYUQUCmmbxJ1dLiq/vaeH9XkSL3Pto6QYPNNBHGbxQdoEouGm1dcnosVjp9uiky0vZf/r1wdcB92DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmjJ+xAmKo5zw9iOdGMisVgTA7e8Uj97mU+2oz/xcDbLWg5Yfn
	v1bQ25I6Ep1OFLi+326eYtmnPaC/ORmk3JGGES0tuhPGJIKoPulC9W+Z
X-Gm-Gg: Acq92OGmT7kAUfXWbid78STaneHc+f7/tFDGz1fNCLgl9Uw5WbzmYsUjUSK6hLk83Q6
	9NwN9pNkyFVy5y8jqsFSTp4Dldzxho4Ea3xxEE79hlXurMPyrGP0RG8is31FHLFh+n65PcboyFc
	iZv6d7eAdS2n4cAL1XJIUxI69QOu7QB3YODk7nmDzmgX+Exeyf1bfd1kj5eWO2qCM8twwnsBadZ
	XDH794abcCnO1sitpjHfgxDdv0iBO3tVfrDCGxHfmhXP60bBuqKqTM6J3i9uVcMYwVLk8kK4+9f
	DJMYx2c/a7mBsHUhVdpcs1M4fdT/jMD6SgpFxbT2WSFX8nxQnhq4votFGooCg9aKUoYMGQpuGiN
	h3so1DbHHgEtu3H6wIjkpYFsdSaiQ9H6FHxJxoWAZZVhCif1O7olNjEItxZdk4rP3/bwyLRahSF
	p40h0Ie7uBgoFjDKDMSLP+4PRVkR+gZPQwAIO0TVHs
X-Received: by 2002:a05:600c:8208:b0:490:ad1e:1846 with SMTP id 5b1f17b1804b1-490c2cf6718mr175596575e9.9.1780902541391;
        Mon, 08 Jun 2026 00:09:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d37edbsm276118055e9.2.2026.06.08.00.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:09:00 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:08:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrew Soto <linux@notrealandy.dev>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: prefer kcalloc over kzalloc
 with multiply
Message-ID: <aiZqiXR5Z3Mt-CFk@stanley.mountain>
References: <20260606234427.9902-1-linux@notrealandy.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606234427.9902-1-linux@notrealandy.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64137-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@notrealandy.dev,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F0E9653672

On Sat, Jun 06, 2026 at 11:44:27PM +0000, Andrew Soto wrote:
> Optimize memory allocation layout

This part of the commit message is techno-bable.  It's just
words that don't mean anything.  I suppose teally they do
mean something, but it's not what the patch does...

> in sh_css_params.c by replacing the raw multiplication inside kzalloc() with a type-safe kcalloc() array allocation wrapper.
> 
> This prevents potential integer overflow vulnerabilities by validating the array size calculations before interacting with the kernel heap allocator, aligning the driver with modern kernel memory allocation standards.
> 

There is no risk of integer overflow when we multiply by 1.

> Signed-off-by: Andrew Soto <linux@notrealandy.dev>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index fcebace11..9147ca047 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -3716,7 +3716,7 @@ ia_css_ptr sh_css_store_sp_group_to_ddr(void)
>  
>  	IA_CSS_ENTER_LEAVE_PRIVATE("void");
>  
> -	write_buf = kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
> +	write_buf = kcalloc(8192, sizeof(u8), GFP_KERNEL);

This should just be:

	write_buf = kzalloc(8192, GFP_KERNEL);

If we weren't allocating a text buffer then the new way to write this
would be using kzalloc_objs().

regards,
dan carpenter


