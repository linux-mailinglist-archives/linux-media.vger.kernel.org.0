Return-Path: <linux-media+bounces-54935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GhMGSCfrmm2GwIAu9opvQ
	(envelope-from <linux-media+bounces-54935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 11:21:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D577236F29
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 11:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13586300B456
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 10:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD5D38F256;
	Mon,  9 Mar 2026 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAph2PJE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6256337BE95;
	Mon,  9 Mar 2026 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051670; cv=none; b=jdlh482fIsfF4dO5/ldUfAK2Q3zai+qJIrU1itgNmXYRP4YCe9iQ4Dbdr+ILvpuLHLR/MPlrWaxmTmwRPbCd40WYfSC7CQ4EdlkUEvTyMYG5eNKYVLw6J460TpxTjxfvzpoUCZkS8zjwbxK3LDhzFj0avqx+i6aG0FYpER/y11A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051670; c=relaxed/simple;
	bh=muH3iAGBUeDVCjZsMnj7SFIrN7mdSOrHQr189CuCpcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBIMpSAxPm0EABwvYQBnf4XVTy3G7b7fEfKe7i+WdkTOubVZLIWNOX09/pjSMDxmx9C8I5GB2U/e4vtw6w2QE7Kwa6lslhS8JJ4M61l56ACBCDnD6NM9iaKeNJd9ZlawO6LRygYIhEPdg0ulmvflHYYRxrAwy/VTu1/xlnX4H+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAph2PJE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773051669; x=1804587669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=muH3iAGBUeDVCjZsMnj7SFIrN7mdSOrHQr189CuCpcM=;
  b=iAph2PJEqoBAzwEdrR04STtolDI98QzATWYxnrWux3HiNBFLbPhBUQRF
   hkQR++/nwBtFiYcA1QobuLQXVZpD+7a5xQsD6cQagaQ4BAipJvByXXcYd
   B8ABQPSgqGgZ8tDnM51tf8IMJuetA+Lcuxn81AskObekC20928IUE8G7n
   piKFJC/pglMQZbN25oD2JNp/miv86txRAX30mDMxg30B143IQG7rWBMCl
   Zpy8fbCx0oYVt7kSnkwwxUoJj9OatYhJQlIlvQWgZtx0gJI1A0LbpElVJ
   YV9RVFNnYwrCyX271KEIY83n6UG4rNBobGIQmVz8SnUOv455DRukv4TiG
   Q==;
X-CSE-ConnectionGUID: 2DI32JovRAewEiJXDkIVzg==
X-CSE-MsgGUID: 4/n0YnVESo2bDUu/2oTqDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85543721"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85543721"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 03:21:08 -0700
X-CSE-ConnectionGUID: 88zw65zBQOuyK61leBoLgQ==
X-CSE-MsgGUID: JLigujz1S7SKs+B15bOK5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="216656825"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.148])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 03:21:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6A6C3121D1D;
	Mon, 09 Mar 2026 12:21:37 +0200 (EET)
Date: Mon, 9 Mar 2026 12:21:37 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laur <laurentiutopai2004@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: comprehensive coding style
 cleanup
Message-ID: <aa6fMZaAvMK-CyzL@kekkonen.localdomain>
References: <20260308215840.31197-1-laurentiutopai2004@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308215840.31197-1-laurentiutopai2004@gmail.com>
X-Rspamd-Queue-Id: 5D577236F29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54935-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi,

On Sun, Mar 08, 2026 at 11:58:40PM +0200, Laur wrote:
> @@ -2032,7 +2032,7 @@ static unsigned int long copy_from_compatible(void *to, const void *from,
>  {
>  	if (from_user)
>  		return copy_from_user(to, (void __user *)from, n);
> -	else
> +
>  		memcpy(to, from, n);

The indentation is wrong here after the change.

>  	return 0;
>  }

-- 
Regards,

Sakari Ailus

