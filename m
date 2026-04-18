Return-Path: <linux-media+bounces-59062-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ASVN/c/42mVDwEAu9opvQ
	(envelope-from <linux-media+bounces-59062-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 10:25:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E06E4206C3
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 10:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 960863008D4C
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 08:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38123750D5;
	Sat, 18 Apr 2026 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="m0Rg+B9X"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEF1347520;
	Sat, 18 Apr 2026 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776500721; cv=pass; b=DB669KPtpgGXX+rmkNXCTlKvEm8J4v4ODyEyv4vT32KfeP13vdNh54148CFu9f3bXTFtAd6nALCbkIf7E1cxxpZOzBLwNb1X2dcB0acRL67ZbSvqKpdXdjdcKuDOMWjdUC+Cp/xzI+RPh1LdMPjoK5iXGpHVZt7yhb4MKy6IJTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776500721; c=relaxed/simple;
	bh=RJtaw2UHUBWxNgZv1ccYTGdKvEhWoisceNAuIHGPxak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsHP7ZdAvswzspJhkEfiav0g+8rbTkeA5LvYoJjk/q+RbdwZGHoKUBzWXWl875nvJ9ZZXs7kc/02+OMfjmU1U3x5Tri47IGWBmGLe8mCgn0qOzDc1JZBOK+dH9E1/FumrsJhG9y+XMRLCyD7uW7RVPANt6yCFuEQOeOaW40N3PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=m0Rg+B9X; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fyPvG0JsczyRd;
	Sat, 18 Apr 2026 11:25:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776500714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SDp+B4j1zGlzIv/ushdXlTYr32D4+bzZxyZYAwo4W4s=;
	b=m0Rg+B9X1OxQPLe8d0/a8wxPGXC+3+BHtE+gFmCHnRUm3F9EcdkJ+JSC+Gqhbdp50qwvrd
	McKaLHTsNkpJr5t8/1jnhz/3VDdlYw/tiRYGbEdDY2DBhIyOQrVELbxVNPM2b4fOitsdH9
	026Oaouq4MNjUAqmNH2+AFpalW5ekm8=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776500714;
	b=LGKXQoQVxWeu6T7PCFvnSGVGNzyUHEq8fsmSkL2xXA3128tM06AB+P6fLXyHp+wcZ0xZrY
	YCxzdFf7Mpy6fltNqPwH1v+xJT3ET/CgQhzMC9aLUxKH9yF0Cx8vT1H6RCDRH0RULi397A
	HJUvSgaPWShDx86Ux/ofhmIbrNmM6oU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776500714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SDp+B4j1zGlzIv/ushdXlTYr32D4+bzZxyZYAwo4W4s=;
	b=ajGJrhXmCU8pEj30Rnxm+5tx3RdWnaH+XiX8aNJ/3W2CSrsUr9hNoS75ZYP4o6pCZ+zgjn
	ms2+hac0xkjvs3CHz+bvtoTzOn5C+GMBvOosl+7SAyXLJcjcgV3Yos91Znvb0mzaAF/qMX
	3m5rx2vOtUEFDX0VpCpkSDKEeBzgYhI=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B22F3634C4E;
	Sat, 18 Apr 2026 11:25:12 +0300 (EEST)
Date: Sat, 18 Apr 2026 11:25:12 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Teng Liu <27rabbitlt@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: remove unnecessary parentheses
 in return statement
Message-ID: <aeM_6Kpt6UhmDtgL@valkosipuli.retiisi.eu>
References: <20260317155636.99844-1-27rabbitlt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317155636.99844-1-27rabbitlt@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59062-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[iki.fi:+];
	DMARC_NA(0.00)[iki.fi];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iki.fi:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: 7E06E4206C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Teng,

On Tue, Mar 17, 2026 at 04:56:36PM +0100, Teng Liu wrote:
> Remove unnecessary parentheses around the return value in
> ia_css_pipeline_get_pipe_io_status(). return is not a function,
> so parentheses are not required.
> 
> This addresses the following checkpatch error:
>   ERROR: return is not a function, parentheses are not required
> 
> Signed-off-by: Teng Liu <27rabbitlt@gmail.com>
> ---
>  .../staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
> index 0470871f8..fba567de4 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
> @@ -446,7 +446,7 @@ bool ia_css_pipeline_has_stopped(struct ia_css_pipeline *pipeline)
>  
>  struct sh_css_sp_pipeline_io_status *ia_css_pipeline_get_pipe_io_status(void)
>  {
> -	return(&sh_css_sp_group.pipe_io_status);
> +	return &sh_css_sp_group.pipe_io_status;

Is it the only such case in the driver?

>  }
>  
>  bool ia_css_pipeline_is_mapped(unsigned int key)

-- 
Regards,

Sakari Ailus

