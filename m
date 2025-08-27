Return-Path: <linux-media+bounces-41151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3127B37F95
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 12:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB96018967A9
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 10:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65795346A02;
	Wed, 27 Aug 2025 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="YIsXWMWd"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317EF2F1FE6
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756289674; cv=pass; b=b/FymDeaCxvTxJHbc+d1/H19MXT2JX3PfURShwlVsbdEtAMnwa4HwMPo+l9x4rfzcv4UuFXtMZi0DfZPqXEP6Qu2ciT2RDYPyhdQkZUv5azLcW6mSmzLrmTIBtZXUAt5hBJAkCEdmKpltPRlJbmZrpPrssAUS8M+W788TjkAEYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756289674; c=relaxed/simple;
	bh=rXRFjxheJQSVejGAHZNiHsnuB6/mhtm92yOhON4lbag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkBLcvTyWYW0SdkBgiAjgx6utkEI4GXWdE14YLdUwistghGMeI4HBvzjPqApFHTrPiIuIIoUEeqqRr2QzQaatwYMJzA1yX2QZRu0hxcJxtqHbHEAVwc/bsryMwupOtJeum1SVyTDOSKQUTBoqMBrlEiR9ICz72Y8DZJlnp349YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=YIsXWMWd; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cBgP657dsz49Q4h;
	Wed, 27 Aug 2025 13:14:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1756289658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WFslCAbo1X3Ee/HrsjNOPCDJ6xjCoZLS8X4HT3zVgQU=;
	b=YIsXWMWdI25kpNWMOjCPk+7jDXPmsUkp8OUKIHAkjUOJ4Umkbuh982vQxc2qzdOeW4drcb
	pGXZmcIwWtW6ebTNrpCCPfTQe0N+sPA5SpqmaafES914X/4KRK9ueLnXhdXMsS2KN7UWdi
	/qop+qHMMzCgnIuJL+m+SRIWrq9kdqRetlE9mnkrck/RYJGJjk4ImvFsg19Q32BBKDb/ke
	FM5Brp1wkoPNu0FEP0qIxFaJTfcNmIbRlKNGI3otgMzp3IrgqauIfqN+2G9a4nTp4P3ak8
	Xf7vN47ASeP3QQZdkrjlE7WbMSCVT9IisJ36MQ6j4xkRr6i19ptVDAzRQugCNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1756289658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WFslCAbo1X3Ee/HrsjNOPCDJ6xjCoZLS8X4HT3zVgQU=;
	b=GwwYYWHreR9UXld2lAmvWPfy0sHPWVE5E2wq+eERlclx2cT+m2atYfZyA8D9xCG2YZTpbh
	mxSVcaFFyn/qxIeo/K82poABSs7qx4oBaagHt77RKeOAz+2cZiRxMAZjtK6lSfZhxc0+th
	/uEr0aR3pq0PTxOFyrqyU7+/V/K51NU6cequqVtHI5jDWqXUZCdstc0ZGFcp8pBpmeNRTn
	LKlfxt5DNk/u8oUh2nxW1PXetGkDTEuT4Jxj3KCvRBc5h54mpHlP2CDcJvZNqYt8UOCTKG
	A0kxQ39CSyI0elQ+TC9HWuvG70WE74GIQFwRYGayM5KtPyNLDk/Mek/KfcLQ0A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1756289658; a=rsa-sha256;
	cv=none;
	b=mzrSTtHvTyAioWtC84FUkfUkd5U0a0TOFjzy7rhG5v0vfMxdBLphdQCfxJs4HxMbmIGDJ6
	xv2TOjKk3nu8+PGYBd8XVtKkUAL0D35E1E/qNipP8o8f8O8sFjsgcllgkwpcHHtm+ZD7X3
	DYqGKXAU6ToyS9kuDuc0S1HWpDQkw8kXQZ7pjdobjtQ2t+u2e3+QRdk7H1sewylyQGUGYz
	G9GNOe6LkkrtysZXUrkroht9zP09TIa8LSepKfITrXjkkdAAFVNpL3GE7oF+maFPmWT1u0
	YbGLzIVFvFZgaz4o7LWFk+LhxF4rG0o6cXhPFWpjyEGWZL4qxFVMqtMCXkHJ/A==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 375C9634C94;
	Wed, 27 Aug 2025 13:14:18 +0300 (EEST)
Date: Wed, 27 Aug 2025 13:14:18 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: [GIT FIXE FOR 6.17] Drop redundant pm_runtime_mark_last_busy()
 and lt6911uxe fix
Message-ID: <aK7aeg47a3riJNav@valkosipuli.retiisi.eu>
References: <aJxVF0MpevVhsH0H@valkosipuli.retiisi.eu>
 <20250827110528.11f21dfb@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827110528.11f21dfb@foz.lan>

Hi Mauro,

On Wed, Aug 27, 2025 at 11:05:28AM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 13 Aug 2025 09:04:23 +0000
> Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> 
> > Hi Hans, Mauro,
> > 
> > Here are the patches to drop the redundant pm_runtime_mark_last_busy()
> > calls in drivers and an lt6911uxe fix that should also be merged to 6.16.
> 
> Please fix your description. The above is not clear and doesn't tell
> the hole history.
> 
> In this specific case, I would expect the description to be
> similar to this one:
> 
> 
> 	Hi Hans, Mauro,
> 
> 	Please pull for:
> 
> 	  - drop the redundant pm_runtime_mark_last_busy() on rkvdec driver;
> 	  - fix an error handling in probe at rkvdec driver;
> 	  - fix an issue affecting lt6911uxe/lt6911uxc related to CSI-2
> 	    GPIO pins at int3472.
> 
> 	The fix for lt6911uxe/lt6911uxc is against drivers/platform/x86/intel,
> 	and contains an A-B from one of X86 PLATFORM DRIVERS maintainers.
> 
> We need to have those at the merge requests as well, as we're using them
> to generate PR summaries.

That sounds entirely reasonable. Still, isn't this kind of more detailed
information already available on the patch subject lines? Could those be
used instead? The message in the PR usually describes the patches with less
detail.

-- 
Kind regards,

Sakari Ailus

