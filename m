Return-Path: <linux-media+bounces-57909-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNFKA2rqzWkLjAYAu9opvQ
	(envelope-from <linux-media+bounces-57909-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 06:02:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B7538358E
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 06:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FDAE30151EC
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 04:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DA935838B;
	Thu,  2 Apr 2026 04:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ahCHaOtL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37178279334
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 04:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775102513; cv=none; b=TKCnGU/WJKH9jAjQtXLjo2fd45xopG7KRaPfW8IwZYtPcClHCTkk2KFkpi55unutysLB/LRAC3Fgy7MkF7gUlFB1pq1p6F7nuy8yY0+jc1rz6Kb6W3fERsS7Zoq55q9NO2zQM9wCiJBFSwpk/iyiMfaPljhTloqrNVzZWr2fxqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775102513; c=relaxed/simple;
	bh=VOSKwmulXFKLWLYxC99EDsSfVQjo0gUg53rUb1aOlIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxYYkHs7g4ijOPFv77MJjdFJ7kF8u7IqNpVP54G9xQsm7FK7CFZ/Jl3+ec0NknvT1Pvi3K3xNqNOyFybS2HbLJgPHmXTGtmVKMYrUI3VkCjsncItWk4LfNPTLjhkSCS/9e0jwqGayFwmZ4y8KRMzOXWF8RUJWuLaLFTZ7SymMUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ahCHaOtL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5376CC19423;
	Thu,  2 Apr 2026 04:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775102512;
	bh=VOSKwmulXFKLWLYxC99EDsSfVQjo0gUg53rUb1aOlIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahCHaOtLGhLOHVvOpkVfNf2dNUZy0H2ZZAN3XcymvfkIceV5n+LI8rS+N0BBfUyjb
	 y4//+NoVcdEOutDIrFnVq2v/nND79LhIsPzAlqnNjdNTNX8ZCu4p+10nsYRUgW0tGF
	 YucIqS5CTKfAXIZRxQ2stAWwcyUhgFcn4SGjG2TY=
Date: Thu, 2 Apr 2026 06:01:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Feng Ning <feng@innora.ai>
Cc: linux-media@vger.kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH] staging: media: atomisp: use array3_size() for
 overflow-safe allocation
Message-ID: <2026040258-cold-umbilical-005c@gregkh>
References: <ac3R8_qf4qivmGc2@ans-MacBook-Pro.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac3R8_qf4qivmGc2@ans-MacBook-Pro.local>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57909-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 76B7538358E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 02:18:32AM +0000, Feng Ning wrote:
> Replace bare width * height * sizeof() multiplications with
> array3_size() to prevent integer overflow in buffer allocations.
> 
> The atomisp driver computes DVS and shading buffer sizes using
> unchecked u32 multiplication. When dimensions are large, the
> product wraps and kvmalloc allocates an undersized buffer.
> 
> Use array3_size() which returns SIZE_MAX on overflow, causing
> kvmalloc to fail safely instead of allocating too little memory.
> 
> Affected locations (11 instances across 3 files):
>   - sh_css_params.c: ia_css_dvs_6axis_config_allocate (lines 4482-4498)
>   - sh_css_params.c: ia_css_morph_table_allocate (lines 1384-1387)
>   - sh_css_params.c: ia_css_dvs_stat_allocate (lines 4209-4214)
>   - sh_css_param_dvs.c: ia_css_dvs_6axis_config_allocate (lines 52-79)
>   - sh_css_param_shading.c: ia_css_shading_table_alloc (line 342)
> 
> Example fix for one location:
> 
>   -  dvs_config->xcoords_y = kvmalloc(width_y * height_y * sizeof(uint32_t),
>   +  dvs_config->xcoords_y = kvmalloc(array3_size(width_y, height_y, sizeof(uint32_t)),
>                                        GFP_KERNEL);
> 
> The full patch covering all 11 locations is larger than suitable for
> email. I can send git format-patch output if preferred, or submit via
> a merge request on the kernel gitlab.

Email is how we accept patches.  Please do so that way, this is not
going to be a "huge" change at all.  Worst case, break it up and make it
a patch series.

thanks,

greg k-h

