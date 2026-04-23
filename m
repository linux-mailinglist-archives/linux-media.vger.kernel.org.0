Return-Path: <linux-media+bounces-59442-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E96CsyK6mk00gIAu9opvQ
	(envelope-from <linux-media+bounces-59442-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 23:10:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E4457B20
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 23:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A0083028830
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 21:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B073537E6;
	Thu, 23 Apr 2026 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIbqnCZ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989AC33F5A4;
	Thu, 23 Apr 2026 21:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776978363; cv=none; b=IJmijU/UbLd9JnfT78Oc5BR8FEFS05laWwN3QhB3+27ZRp9HLcmdknx6xIx05deX25K2j3behFrNiaTx5Dj0PEEA3AWldoIb0MJY82BQ87NfqNNhF1v7f7hXfyGvLjlqkA3Qg4bXhZBESNmr/S6P5+bLnlo/5gBQypfFgbwRee4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776978363; c=relaxed/simple;
	bh=XnOBfG9/4pGmlJ0M2y5gn8Ty46vZesDI19aXX5tBQ5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uR8LYbho/rXCXaX0vX27+O2MLl98vhf7gHHN8KrXmB0M5lDpdtkfc1Yz3g+BlN5g8Nwr5U0X8jL5fy9jCbccHKuUR4G98DNiabK4IPCqFqsNNPM8qfjfsRkJH7m9Euinhs5RdVcaTQQ/Kgi3vAI109ZM6YSLLGsDMKebwgftr8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIbqnCZ8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776978362; x=1808514362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XnOBfG9/4pGmlJ0M2y5gn8Ty46vZesDI19aXX5tBQ5Y=;
  b=eIbqnCZ8tHGOZkjiAdE9LhXSTwAw7WDV02F8WMI7RiiUzhgXUFJNU2Ei
   XLlfDJnz3QfEg6NCsbXhtX48JfzgFTI16rE3bWXmgOSQBP9MIGR4+UZUj
   JWzFYmBclfH6xyIQ2nk6RekNK1pHTCQIRRhO1dixFNZu9rFTG4RefnHMf
   jAK7P5sVuVJYE1PkYz3jBOZwrqj2A7pALNiDWrdpiFeAwNIt9fnVlU5gw
   voPc7weRwigo0hb3ySnwlp36odZxuiJDwHtxVZZxqSkvhpdPmZaB1ETPU
   WeUCOMCL3EvF7gq/VU/xF/xclcN/nVpgb0iCPEuT97Ts5gClAGVk0zDeu
   A==;
X-CSE-ConnectionGUID: GtYfbqOhRtmLQD6HEbI13Q==
X-CSE-MsgGUID: 2VfMTQWmR3m5yqFaZE7mrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="88568841"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="88568841"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 14:06:01 -0700
X-CSE-ConnectionGUID: wWXRx0bkTDq7w9CCDKTrRA==
X-CSE-MsgGUID: qROMJTWVSfencDeCNJ47Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="237757686"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 14:05:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DBAFC11F94F;
	Fri, 24 Apr 2026 00:05:59 +0300 (EEST)
Date: Fri, 24 Apr 2026 00:05:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
Cc: andy.shevchenko@gmail.com, andy@kernel.org, gregkh@linuxfoundation.org,
	hansg@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v5 1/2] media: atomisp: csi2: Remove unimplemented DPCM
 decompression
Message-ID: <aeqJt8gI0I8KnMVB@kekkonen.localdomain>
References: <aejF4OlVJtKSknxg@kekkonen.localdomain>
 <20260423125216.19217-1-debjeetbanerjee48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423125216.19217-1-debjeetbanerjee48@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59442-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid,linuxtv.org:url]
X-Rspamd-Queue-Id: 691E4457B20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Debjeet,

On Thu, Apr 23, 2026 at 06:22:15PM +0530, Debjeet Banerjee wrote:
> The source pad format handling attempted to map DPCM-compressed mbus
> codes to their uncompressed equivalents. However, the rest of the
> driver does not support DPCM decompression, making this dead code.
> 
> Remove the DPCM unmapping logic and simplify to directly copy the sink
> pad format to the source pad. Add an explicit comment stating that
> DPCM is not supported.
> 
> Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
> ---
> v5:
> - Rebased onto linuxtv.org/sailus/media_tree.git (per Sakari Ailus request)
> 
> v4:
> - Complete removal of DPCM decompression attempt (per Sakari Ailus feedback)
> - Keep source pad simply copying sink pad format without unmapping
> - Replace detailed comment with explicit "DPCM is not supported" statement
> 
> v3:
> - Drop "staging:" prefix in subject (per Andy Shevchenko)
> 
> v2:
> - Rebased onto latest media tree (fix CI apply failure)
> - Fix missing linux-staging recipient (typo in v1)
> - Fix indentation
> ---
>  drivers/staging/media/atomisp/pci/atomisp_csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> index 95b9113d75e9..64419c1a805e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> @@ -107,7 +107,7 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
>  					     &tmp_ffmt);
>  	}
>  
> -	/* FIXME: DPCM decompression */
> +	/* Source pad format is copied from sink pad. DPCM is not supported. */

I think you just remove this comment and squash the change with the 2nd
patch.

>  	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
>  						  CSI2_PAD_SINK);
>  

-- 
Regards,

Sakari Ailus

