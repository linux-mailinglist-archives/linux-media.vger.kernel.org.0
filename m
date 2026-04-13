Return-Path: <linux-media+bounces-58645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKaEDBep3GkEUgkAu9opvQ
	(envelope-from <linux-media+bounces-58645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:28:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D113E91B7
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40E9E3009F3F
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8973A7F40;
	Mon, 13 Apr 2026 08:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsordvGy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2452C0274
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 08:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068883; cv=none; b=DziL0KazldMkauXHhX2n69y35B1HJP+K/Rmf/44ISA4q8BkrOCZsqEWPDL/URovc0zTWsB+cFPgKRaxHUzF72AoLubyGpxOVstR6jBrQi6zRS7jkjTLAeuAWEkvPXyFRLSeI+JBJ8sz3oMx4dgQdubS5RR+ezmP+6XLnIjR5PZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068883; c=relaxed/simple;
	bh=x/ArPEjgkRFmr2Ou75CLISSLQ+UM8la49trxVzEqOw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QB7rVM0a+C7aTogexEcg+u0sf1ho6WkLkplQfm34Ro4UkF+h4jg4IcMeLO7JXOM+Tr2RT/M+U7ZPKhSOWNg1oniQwyYkApi2/u4R14rkJIP0YMJf47Rp05cGTGe2Z+swHS9bMceOn7YAPYgrOwyVmm6cuhcGe0+d6Rmay6Db6qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsordvGy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso38667735e9.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 01:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776068881; x=1776673681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hgVK+xMFHenSVr8/JL2FgJGbiRTPeNjFrSjIxLFtmWA=;
        b=DsordvGygj1SaVaEjAfwBU6wLoag7o6E3bX9X1/khLkklRi6RfjKqLFQSPBia4Ey25
         g5ApkV5VJ2acw/yq/Zj4cJxOheiQ69Two1XMFhL1VFE3Wd94O/KYP7BWXXJcEYZ2NUk4
         Vbwl84t2Sii4rYocfOEbSu0rA746nCL689K/VgwgRdeayJTTAXwi7ijfX7h3NUKV2jTx
         a6tx/az5v2z36rfp1lSdTMeq/hJ3tJSmxAxLJBdUnl779X942Pc1xdAETvKMIFVKhI7J
         PslrSG0LzbE2dqrdsS8oGdZDdNU8WrgGNwfRNLkQ64s/ntEvlJyAiiw88cZURFTM2BSP
         5+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068881; x=1776673681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgVK+xMFHenSVr8/JL2FgJGbiRTPeNjFrSjIxLFtmWA=;
        b=sTBYEDuelqXQEw1zFtYSh4vFj5URXIiiQNXJZSYWfgLljo112xWUQSflIJdNzQARI9
         mvtkuvKcCQTTlw1z2U4cEXVRyfyd5j7hFbv6eNuuFGwONfO4dn3TlN220YdnkS6DNDm8
         Tl6iB3MZBou+LCP1hfWhesZmNaaEcxM0aYh4fz3ddJn8JFDzhQiOZMjPqSSjY7Yzkx43
         vKkyCAn7y9zWIIGx+nLxmwkzuaD8hTCYU990cR0pd8fO/Gj3E2QWMLQqiRuWXPm48nqZ
         TNsViNoLIJIaaK82VVxDim29ng2d4tfZ5xRGKIdLUKXc7wZs75dtM3Kkmspx1L5tzchR
         1ciA==
X-Gm-Message-State: AOJu0YxDrpjzStSRQ2i08hH+NGZPnfyz577yifAUU5aOFeB9N78LKj6d
	fTqsLJ/UIy/StNnJk+4q7HyPVVsv6pdw0Oa/KIlYgyPCF6k5yaOuCUBWZJrNUonq
X-Gm-Gg: AeBDiev3vAaeYGTKoxMMNv4S6C1qApXhr3pZYc7tKROQMP3+evYjEgAYXawFfpv6ZKC
	JYUC0aIwx6Bmh4nCyyzU/xVAY1AjooMiLgjQHi68rkjK28t+NmSm+GAvxpooxDwosQVQJkUvkb8
	Y1N34HgPVyCYd7GrxtrTLlSihI8bOFqdaGA5j3Syu36KJ20asfWO2VDtskLc7QTifjglYYQiYP6
	ccDyevKRTnH23EAaZHapsZbTWykzBBBF/QHq0kVD4xt7a3CiCr5kerGjwxmMfMR/UfDrxfY4IOo
	ZulUnlo2chIJuq4rU0JuwwrZEocKgMR9UaqVc5x6fHKISd4/yOfSButtgdD7G/wVnWCp+2mudPH
	sjETRWcnkAxA0GT2KiILfo0xUP3Nm5YU/HRB6tbTawkV2CpcFGOYKA8SNyHta1BMP6bCWkQR/em
	qyhMN9Gkxn/PnXXYmIpJE=
X-Received: by 2002:a05:600c:a010:b0:471:700:f281 with SMTP id 5b1f17b1804b1-488d68af20cmr173109845e9.25.1776068880612;
        Mon, 13 Apr 2026 01:28:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d68479b2sm88460975e9.25.2026.04.13.01.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:27:59 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:27:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: media: ipu7: fix double-free of pdata in
 error paths
Message-ID: <adypDC2I8pjekoPJ@stanley.mountain>
References: <20260412205128.387234-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412205128.387234-1-hossu.alexandru@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58645-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 97D113E91B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 10:51:28PM +0200, Alexandru Hossu wrote:
> In both ipu7_isys_init() and ipu7_psys_init(), pdata is allocated and
> then passed to ipu7_bus_initialize_device(), which stores it in
> adev->pdata. The ipu7_bus_release() function frees adev->pdata when the
> device's reference count drops to zero.
> 
> Two error paths incorrectly call kfree(pdata) after the device teardown
> has already freed it:
> 
> 1. When ipu7_mmu_init() fails: put_device() is called, which drops the
>    reference count to zero and triggers ipu7_bus_release() ->
>    kfree(pdata). The subsequent kfree(pdata) is a double-free.
> 
> 2. When ipu7_bus_add_device() fails: it calls auxiliary_device_uninit()
>    internally, which calls put_device() -> ipu7_bus_release() ->
>    kfree(pdata). The subsequent kfree(pdata) is again a double-free.
> 
> Note that the kfree(pdata) when ipu7_bus_initialize_device() itself
> fails is correct, because in that case auxiliary_device_init() failed
> and the release function was never set up, so pdata must be freed
> manually.
> 
> Remove the redundant kfree(pdata) calls from the two affected error
> paths.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>

We need a Fixes tag.

> ---
>  drivers/staging/media/ipu7/ipu7.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
> index c771e763f8c5..043b67dfe19a 100644
> --- a/drivers/staging/media/ipu7/ipu7.c
> +++ b/drivers/staging/media/ipu7/ipu7.c
> @@ -2172,7 +2172,6 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
>  		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
>  			      "ipu7_mmu_init(isys_adev->mmu) failed\n");
>  		put_device(&isys_adev->auxdev.dev);
> -		kfree(pdata);
>  		return ERR_CAST(isys_adev->mmu);
                                ^^^^^^^^^^^^^^
The put_device() frees isys_adev as well so this is a use after free.

		ret = dev_err_probe(dev, PTR_ERR(isys_adev->mmu), ...
		put_device();
		return ret;

>  	}
>  
> @@ -2180,10 +2179,8 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
>  	isys_adev->subsys = IPU_IS;
>  
>  	ret = ipu7_bus_add_device(isys_adev);
> -	if (ret) {
> -		kfree(pdata);
> +	if (ret)
>  		return ERR_PTR(ret);
> -	}
>  
>  	return isys_adev;
>  }
> @@ -2219,7 +2216,6 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
>  		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
>  			      "ipu7_mmu_init(psys_adev->mmu) failed\n");
>  		put_device(&psys_adev->auxdev.dev);
> -		kfree(pdata);
>  		return ERR_CAST(psys_adev->mmu);

Same here?

regards,
dan carpenter


>  	}
>  


