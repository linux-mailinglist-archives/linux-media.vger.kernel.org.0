Return-Path: <linux-media+bounces-55371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO57CTxCsWlCtAIAu9opvQ
	(envelope-from <linux-media+bounces-55371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 11:21:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 376CA262048
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 11:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C330F35E4EC4
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530703CBE7A;
	Wed, 11 Mar 2026 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8+FM7vS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6493CAE82;
	Wed, 11 Mar 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773221986; cv=none; b=q0qCx2beCMbVTNfkwkTJeI43cIuazaZP6JSU27fpTXADJCriS/qNS6CahLhlDyUCqzVjnuS5p03ofP5IM3lK3jK6wA6GEK9pD+1ge7DXW5vluhIvdQd08OJrTBCT22Yu9p98b+a2v+aIjDjFNrM8ZIRkIT31B31MI2+DDSk8ZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773221986; c=relaxed/simple;
	bh=mqNqA37kQU0ooq46p/8nWAFZ995IR8bflbKFVTCwNDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdyjglah3i63umeZqjbGHHfONHOMzx25rWy+tC9oy7ijXaGfz6kTNt8ny4Y4CSZD4uqAP16nPqnh4IE/Kxoj8x6P/7QN0I56Iy2fT+rNu0EGgl4tm4YXNwMcRTePKhyAy/5G42uUeIKqV9xMehCFGiyK7U4QMLWpv0Bd9WrmmOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8+FM7vS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773221986; x=1804757986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mqNqA37kQU0ooq46p/8nWAFZ995IR8bflbKFVTCwNDU=;
  b=W8+FM7vSCBNFgyQZ1cgV9COBOlsf7TE7NlU+rvoY3T+oYJMFzmmHBH47
   p/i/Fo39d0T6qWiofYcqCuUb6pH1NG3o+aNIfCkrDInK+sMfmHPRMYO+8
   zNAAg5h5z0izOPTQrGe71Fsh2N68fKcJwf+Ki5UDUZdKlbsMH9ywPl/5q
   DsaF/GlodOO3XEetYXSwzS3IJczBsUveaZqOVHGLBl6Wo9PCR/RBTdOMs
   lav7i6/iBGA+WYGrCsMxalAW7UnIG7wqmm9VCDtPtNr/6cCA91jiys/Us
   dNfpiBOmwnGaNowX5P5DRpyIsmsDascKoVFB09R7DSmV2D4dnJaIsaQsi
   g==;
X-CSE-ConnectionGUID: NDf8wB80SS2y8ODxGgDHBw==
X-CSE-MsgGUID: PIRjj/meS9metvBzFQRY0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84608654"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="84608654"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:39:45 -0700
X-CSE-ConnectionGUID: DPhREV/DQjGnuXI+O5WWPA==
X-CSE-MsgGUID: yESb4eJVTu2RP3nrTsLL5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219655012"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.171])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:39:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4E140121D1E;
	Wed, 11 Mar 2026 11:41:37 +0200 (EET)
Date: Wed, 11 Mar 2026 11:41:37 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Muhammad Shadab Khan <shadabtg4@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: split long line in sh_css_sp.c
Message-ID: <abE40Qr5-S6E5c-0@kekkonen.localdomain>
References: <20260311084602.6088-1-shadabtg4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311084602.6088-1-shadabtg4@gmail.com>
X-Rspamd-Queue-Id: 376CA262048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55371-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Action: no action

Hi Huhammad,

On Wed, Mar 11, 2026 at 02:13:18PM +0530, Muhammad Shadab Khan wrote:
> Split a long line exceeding 100 characters to comply with
> Linux kernel coding style guidelines.
> 
> Signed-off-by: Muhammad Shadab Khan <shadabtg4@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_sp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> index 6da151e7a873..c38a7c69728b 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> @@ -983,7 +983,9 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
>  						    IA_CSS_BUFFER_TYPE_DIS_STATISTICS);
>  	}
>  	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_METADATA, thread_id, &queue_id);
> -	sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.metadata_buf, queue_id, mmgr_EXCEPTION, IA_CSS_BUFFER_TYPE_METADATA);
> +	sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.metadata_buf, queue_id,

That limit is actually 80... so you could wrap at a different location.

Are there no other such cases in the driver?

> +					    mmgr_EXCEPTION,
> +					    IA_CSS_BUFFER_TYPE_METADATA);
>  	if (err)
>  		return err;
>  

-- 
Regards,

Sakari Ailus

