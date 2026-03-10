Return-Path: <linux-media+bounces-55174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B8vKAgjsGlhgQIAu9opvQ
	(envelope-from <linux-media+bounces-55174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:56:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4812325109B
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56F6531E0BE2
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 13:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB5A3A16BB;
	Tue, 10 Mar 2026 13:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDuP7G+m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018CE39DBEA;
	Tue, 10 Mar 2026 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148866; cv=none; b=rJzn6lBknRpXWuOb2jKsjy/zqL3kWteWE6IZDqQUA3HDkvCB0QSWQzO1YMBLygY9FhGfI/fRqKF/KlnpcIjouPACEBh1SnqhpUjjHQpu4cK1UZXlNkC0/ol8wvHHJZxCcKv0Yu5jbfgl8Lf8gMoGCQVcBa9Esfa56bNLD5Mpqcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148866; c=relaxed/simple;
	bh=blLMxUGmwBDKoLMZORWslGZo9VUV9sNrER9y9Ccuckw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klnTHeFmadXlJNu8zaYI3LPv9FzYhzG6eV3JVtVSjSj3v4D0mLLV+fkacZZe37RmJ46+mZSgM7bDdsr5aw6sOTVYgZomLOvKe55qoytjqZXsvwZaTIMa+aH9JaynK/hp4/NINbEe2cRJ8jCzKKTq3nBGVvGSGMYYkogyXjn2IiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDuP7G+m; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773148866; x=1804684866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=blLMxUGmwBDKoLMZORWslGZo9VUV9sNrER9y9Ccuckw=;
  b=DDuP7G+moDeYN8dLqRknt9UrIXzE02mdg98Gw29/+nxvtBftlrC49v0C
   I3PLdkCyV6zHVRMyG4lIv5vzST7EkterEuLpiZB9yvsrkIsqmaWyKFmA6
   arNZQki0gwMOwBlRCLReX5ZVA/orRu2BQKO/odVlRfraiKpKF6WN+gA1o
   3Z6hGOtMNE35182ymoJ+iAvW4xICc3yssxNp1yUgO5fAmcLGr5tUSuO5C
   jhT7O5lsj5y8P5APRpoJfF3qHMBFCDQoGVTbh+2hujDeAI0+5jqztFZ9S
   1Dv0mrYF6Ga7BjX2ZCSo5etZDd60QFCZteldKo8zX76yztjyp02PmvHXH
   w==;
X-CSE-ConnectionGUID: 2pAD4NrWRTy9bEn331wrvQ==
X-CSE-MsgGUID: vph2TqVLQ5ChGpTXIavXAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74385139"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74385139"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:21:05 -0700
X-CSE-ConnectionGUID: iqF4VTJqQKCRJlzMxT5IWA==
X-CSE-MsgGUID: 8jdBgldwRV65PGX3PlO8dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="216484500"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:21:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 156D5121D13;
	Tue, 10 Mar 2026 15:21:34 +0200 (EET)
Date: Tue, 10 Mar 2026 15:21:34 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, gregkh@linuxfoundation.org, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: fix block comment style in circbuf.c
Message-ID: <abAa3mVvlmba16kd@kekkonen.localdomain>
References: <20260309213024.5733-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309213024.5733-1-rayfraytech@gmail.com>
X-Rspamd-Queue-Id: 4812325109B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55174-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Oskar,

On Mon, Mar 09, 2026 at 10:30:24PM +0100, Oskar Ray-Frayssinet wrote:

A more elaborate description of the patch goes here.

> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---
>  .../media/atomisp/pci/base/circbuf/src/circbuf.c  | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> index cb34d0b5abb5..db0b76ea4a29 100644
> --- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> +++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> @@ -192,9 +192,9 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
>   * Please refer to "ia_css_circbuf.h" for details.
>   */
>  bool ia_css_circbuf_increase_size(
> -    ia_css_circbuf_t *cb,
> -    unsigned int sz_delta,
> -    ia_css_circbuf_elem_t *elems)
> +	ia_css_circbuf_t *cb,
> +	unsigned int sz_delta,
> +	ia_css_circbuf_elem_t *elems)

You could improve this more.

>  {
>  	u8 curr_size;
>  	u8 curr_end;
> @@ -206,7 +206,8 @@ bool ia_css_circbuf_increase_size(
>  	curr_size = cb->desc->size;
>  	curr_end = cb->desc->end;
>  	/* We assume cb was pre defined as global to allow
> -	 * increase in size */
> +	 * increase in size
> +	 */
>  	/* FM: are we sure this cannot cause size to become too big? */
>  	if (((uint8_t)(cb->desc->size + (uint8_t)sz_delta) > cb->desc->size) &&
>  	    ((uint8_t)sz_delta == sz_delta))
> @@ -215,12 +216,14 @@ bool ia_css_circbuf_increase_size(
>  		return false; /* overflow in size */
>  
>  	/* If elems are passed update them else we assume its been taken

/*
 * Multi-line
 * comment.
 */

> -	 * care before calling this function */
> +	 * care before calling this function
> +	 */
>  	if (elems) {
>  		/* cb element array size will not be increased dynamically,
>  		 * but pointers to new elements can be added at the end
>  		 * of existing pre defined cb element array of
> -		 * size >= new size if not already added */
> +		 * size >= new size if not already added
> +		 */
>  		for (i = curr_size; i <  cb->desc->size; i++)
>  			cb->elems[i] = elems[i - curr_size];
>  	}

-- 
Regards,

Sakari Ailus

