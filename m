Return-Path: <linux-media+bounces-56316-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAAmBybIu2leoQIAu9opvQ
	(envelope-from <linux-media+bounces-56316-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:55:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B01232C9211
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4821B3242D76
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62293B6BFB;
	Thu, 19 Mar 2026 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="riarxanF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14706366DD6;
	Thu, 19 Mar 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913381; cv=none; b=Qu+aKdrWN6c/jhm90vKLKiV+GMGfnU2/72KHnKMdkFYNcHvdIT8Tr/YE7zppvpEu6zx767Qu93wwiXnO35o1wFCXeTgyqkwAJF70xGdbi6DWUWcehGC9kFcXMw9wbhJNCTTS/Hvmd8eyKZtt5ox9uoBlLZNU34Fw/MYRxEYXRHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913381; c=relaxed/simple;
	bh=1Phv88mh2XOhv7Tis0XNOCaFqkTWCs1ytEEsZUbgE1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhMhzsXL25MRIPeExFtEZub9I6YPzBsy8c5BthLDcC8QC6EoDSdO+MWh5UBOp3QmoyHf7NMWmL+9dKHyYnuGCeetyBfRHndun4ivl3ZYI8JSCNSFN0qWvH6vf7dyY/9hXm+rFYqnDNBtK92Zv6VG14TwC0XtKdDyEq5XgYqgu4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=riarxanF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD04C2BC87;
	Thu, 19 Mar 2026 09:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773913380;
	bh=1Phv88mh2XOhv7Tis0XNOCaFqkTWCs1ytEEsZUbgE1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riarxanFdP/7dPLJNwBOnzXEefqDoTvSMEfHft0/kZRnIZo5GL7etXMtFgUjWUY0p
	 2x3Oxmjaq4SnU0FQUQMD4MVZhhgKiX8t3lHcgrmNoczC6o1ZifRRwJxPGU42tAAllY
	 fB0SjsKin5GVAF+4XKcTupgoEtBMOPmWKHG+06UU=
Date: Thu, 19 Mar 2026 10:42:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zile Xiong <xiongzile99@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: hmm: remove unnecessary casts
Message-ID: <2026031933-juggle-decimeter-3547@gregkh>
References: <20260319093625.3225-1-xiongzile99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319093625.3225-1-xiongzile99@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-56316-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B01232C9211
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:36:25PM +0800, Zile Xiong wrote:
> Drop unnecessary casts when accessing vma->vm_private_data.
> 
> No functional change.
> 
> Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> index 856561e951a5..68116edda591 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> @@ -975,9 +975,7 @@ void hmm_bo_unref(struct hmm_buffer_object *bo)
>  
>  static void hmm_bo_vm_open(struct vm_area_struct *vma)
>  {
> -	struct hmm_buffer_object *bo =
> -	    (struct hmm_buffer_object *)vma->vm_private_data;
> -
> +	struct hmm_buffer_object *bo = vma->vm_private_data;
>  	check_bo_null_return_void(bo);
>  
>  	hmm_bo_ref(bo);

Why did you delete the extra blank line that checkpatch is just going to
ask you to add back again in a future change?  :)

thanks,

greg k-h

