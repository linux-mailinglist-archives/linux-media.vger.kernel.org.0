Return-Path: <linux-media+bounces-65543-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7WcZBRrJO2pwdAgAu9opvQ
	(envelope-from <linux-media+bounces-65543-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:10:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 707276BDFEB
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:10:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=P21YrM4X;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65543-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65543-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0589B30E4A02
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DE4258EF3;
	Wed, 24 Jun 2026 12:00:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A53184;
	Wed, 24 Jun 2026 12:00:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302432; cv=none; b=HxMsxHvLBztOpDy+PZF+ZEF8Vpl6bd0fQubLJtzG46QiTW3zlYgxGX8IJ4w0znPtembtsdUldgyrRl8vDvWrUshsfF93FLbFfGJ1+U3Nu2riTVHeJ235UJjBnVORRrF/O7DPactkDoUubytIplRPe32Ehmf6sYKqhZsByiYm8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302432; c=relaxed/simple;
	bh=FEwaZgoP6nr7I/7zOBAr14pyiaMhSlktTxIEzrD4RCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVoxjIrULDBvAVdgLhgvpuvVREXDrPOA9CXPdgHnL4ptex9MMFC3Ld85+4ZmxbcKpVxcZ5l6rLEGx+XnfI6O4EgxmbEG6UWs6ntGaEvX0vNkE2Qhf1PMNFT0UNiiBi+feGXOGK4PInfNCVyjGAK8n0PywOqtUSDw/s4u+EN3x/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P21YrM4X; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782302431; x=1813838431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FEwaZgoP6nr7I/7zOBAr14pyiaMhSlktTxIEzrD4RCM=;
  b=P21YrM4X28fR09ShSN5nAr+eF+pyTmbz9QwOC5flQGcL2w4rRNX+e5JM
   aq3j8qxDFETrzRPS37AWuquouAGXr5oWEdPIMo2+ar0FYzamvYq0HIU80
   6TCgQ0YxZxtCNssE6ZR2i6mBUv+ynSMkxFFPjz9DibFDMOU8ZmfKGTsKm
   zedIdIVVm6OeIGcwDN8TnGd7Q5QteqTiJwx16dygAmR2fNBBCdE1z8Uy9
   lJvkQVNm34T+RkC4E1Xm0IkUxu0+O8dTDVydWbzDfChmW1qjskJ9gDn7q
   CEWy0ydht0rw1+f9CqL3DkPRW8SFz+GzUNlBpMi4TU33X51lAh+IPAVJk
   Q==;
X-CSE-ConnectionGUID: rGV0W5StR4WGb6SavtYHYg==
X-CSE-MsgGUID: 1mUzPs4OQqqDSRAsMfrQlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86742659"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="86742659"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:00:31 -0700
X-CSE-ConnectionGUID: 1yzNtTFQTEehtdgho7e3pQ==
X-CSE-MsgGUID: MbbUQdCTTRqlH00MXNed5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="245717849"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:00:28 -0700
Date: Wed, 24 Jun 2026 15:00:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: media: atomisp: replace CSS_ALIGN() with
 standard __aligned
Message-ID: <ajvG2Yfq9a2hR_de@ashevche-desk.local>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
 <20260618151246.6678-2-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618151246.6678-2-igorpetindev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:igorpetindev@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65543-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 707276BDFEB

On Thu, Jun 18, 2026 at 06:12:44PM +0300, Igor Putko wrote:
> Replace the custom drivers/staging/media/atomisp-specific CSS_ALIGN()
> macro with the standard kernel __aligned() attribute. This aligns the
> driver with the kernel coding style and is a preparation for removing the
> entire custom platform_support.h header.

...

> +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h

>  #include <system_local.h>	/* HAS_IRQ_MAP_VERSION_# */
>  #include <type_support.h>
> -#include <platform_support.h>
>  #include <debug_global.h>

>  #include <linux/bits.h>
> +#include <linux/compiler.h>

While at it move the linux/*.h to be on top of the local ones. And group them.

<linux/*.h>
...blank line...
<local ones *.h>

Since there are a lot of uXX, just include types.h instead of compiler.h.

...

> struct ia_css_blob_info {

>  	u32 bss_target;	/** Start position of bss in SP dmem */
>  	u32 bss_size;		/** Size of bss section */
>  	/** Dynamic data filled by loader */
> -	CSS_ALIGN(const void  *code,
> -		  8);		/** Code section absolute pointer within fw, code = icache + text */
> -	CSS_ALIGN(const void  *data,
> -		  8);		/** Data section absolute pointer within fw, data = data + bss */
> +	/* Code section absolute pointer within fw, code = icache + text */
> +	const void *code __aligned(8);
> +	/** Data section absolute pointer within fw, data = data + bss */
> +	const void *data __aligned(8);
>  };

...

>  struct ia_css_binary_info {
> -	CSS_ALIGN(u32			id, 8); /* IA_CSS_BINARY_ID_* */
> +	u32 id __aligned(8); /* IA_CSS_BINARY_ID_* */

...

> struct ia_css_binary_xinfo {

>  	/* Rest of the binary info, only interesting to the host. */
>  	enum ia_css_acc_type	     type;
>  
> -	CSS_ALIGN(s32	     num_output_formats, 8);
> +	s32 num_output_formats __aligned(8);
>  	enum ia_css_frame_format     output_formats[IA_CSS_FRAME_FORMAT_NUM];
>  
> -	CSS_ALIGN(s32	     num_vf_formats, 8); /** number of supported vf formats */
> +	s32 num_vf_formats __aligned(8); /** number of supported vf formats */
>  	enum ia_css_frame_format
>  	vf_formats[IA_CSS_FRAME_FORMAT_NUM]; /** types of supported vf formats */
>  	u8			     num_output_pins;
>  	ia_css_ptr		     xmem_addr;
>  
> -	CSS_ALIGN(const struct ia_css_blob_descr *blob, 8);
> -	CSS_ALIGN(u32 blob_index, 8);
> -	CSS_ALIGN(union ia_css_all_memory_offsets mem_offsets, 8);
> -	CSS_ALIGN(struct ia_css_binary_xinfo *next, 8);
> +	const struct ia_css_blob_descr *blob __aligned(8);
> +	u32 blob_index __aligned(8);
> +	union ia_css_all_memory_offsets mem_offsets __aligned(8);
> +	struct ia_css_binary_xinfo *next __aligned(8);
>  };

...

>  struct ia_css_fw_info {
>  	size_t			 header_size; /** size of fw header */
>  
> -	CSS_ALIGN(u32 type, 8);
> +	u32 type __aligned(8);
>  	union ia_css_fw_union	 info; /** Binary info */
>  	struct ia_css_blob_info  blob; /** Blob info */
>  	/* Dynamic part */
>  	struct ia_css_fw_info   *next;
>  
> -	CSS_ALIGN(u32       loaded, 8);	/** Firmware has been loaded */
> -	CSS_ALIGN(const u8 *isp_code, 8);  /** ISP pointer to code */
> +	u32 loaded __aligned(8);	/** Firmware has been loaded */
> +	const u8 *isp_code __aligned(8);  /** ISP pointer to code */
>  	/** Firmware handle between user space and kernel */
> -	CSS_ALIGN(u32	handle, 8);
> +	u32 handle __aligned(8);
>  	/** Sections to copy from/to ISP */
>  	struct ia_css_isp_param_css_segments mem_initializers;

...

Looking at the above, I think the best is to move the definition from
platform_support.h to ia_css_acc_types.h. The rest what you changed
seems fine with the explicit __aligned() attributes.

So, we can do it in two steps:
- replace in the other files first (as this patch does)
- move the definition to the ia_css_acc_types.h
- ...the rest of the series as is (I haven't reviewed those yet, though)...

-- 
With Best Regards,
Andy Shevchenko



