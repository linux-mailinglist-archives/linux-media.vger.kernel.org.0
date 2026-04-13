Return-Path: <linux-media+bounces-58659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vKCcHVrF3GmcWQkAu9opvQ
	(envelope-from <linux-media+bounces-58659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:28:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DD73EAA3D
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 232503022560
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABACA3B52FE;
	Mon, 13 Apr 2026 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFRIa/2+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7254359A74
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076078; cv=none; b=q50g/ftflPHAD3x1sukjyTiX/jW8/xbNuVRqkHiA4wuSrb4MkA7x85CkXNuoc40hNzn2I7gPduVO1gsfojGSOIBJPfqrkGOBt0f1rso+XGiqPiCLctZO3lBPk8jv3JMMIg/ypPtmIlc8e6Ix/uBRoibE07Rb+fXxW+I34DbToqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076078; c=relaxed/simple;
	bh=Wo/H3nkvnYfDOPwSOhXRPoLWQlF4HiLgzcjjj9Gxy8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eczh/rrF8JO9oYyxR66SpPqz8PwGVhjBCsGSS6tFWhMr2oPKWuf4JQAfIqrV8kl/eEcgIqwKW0rEobXn9B1JZZ5byHdXXapg/eldxZ3xcJXMmzEUj3EmpAy4rc8zoHsY3Wi+w7RCGQuiXK2peZoEmSe9iNxgz2Vu3/d2pQr1XbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFRIa/2+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488afb0427eso53520925e9.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776076075; x=1776680875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5191h31g8rBCcVHs7mCj4zrQVM2ZH4x8IA2+cTQ4Cgw=;
        b=GFRIa/2+8eoylbPLMYgSpjZu9Aksf8Nq5Of1pU1DarZT213iUBysz+WftoFkibL+Nl
         /aQD/KqpjcIhTIRWJzq90FZE/VCTV1r2srZGYdduUtgsY86GnXHlDm4jca3CQX4jyzUt
         qOlo4kgu4B6TaY4EMvOdNQVoYk22hBhweq0GsFHWBycIv0OdrGbsaGkM7wnmc1fNd5Si
         b1N4Mt07WtvEIppTAw5owiNvAuvMlh656rVME67fF/QGfRWl5M1r6n8mUJIVnFQAN2OA
         QBKy42gbdcEpFPlUEhEsEIWn6WnPdk9P+wfGXoGHPFBuTXQWp4jeKBpgDGK+Py2P5/Ws
         z0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776076075; x=1776680875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5191h31g8rBCcVHs7mCj4zrQVM2ZH4x8IA2+cTQ4Cgw=;
        b=Bc3tKLEPjN/ZObLyG5AxJIsYBSV74JqDvDf6vHkYgaE7koqO9EOXnquylRltqyMuNG
         WCqbmH3NE2wypo2KiFRRH4wqhMA7GDBgzWSYZ5BikCshHVQq7waWKXjTgYvpH7M7oGUE
         2DYK06QkoYs6iBua7zHe1JpITjImoFyX9m8+faQy+cfASgt+B+l7ZkEL3VVOqArBz/TQ
         muCEk8RH8XKE09rJvJBVqlgLu4DTSjNFGBadrhMzd3iNba4HfSkSLB3UtW6Relhap8js
         t1+pfwAB6se7AAWQVuKu625YqH2xzUkC5o9aLyZ9Gtaxoi9nIstSA3xcdyy9/8OzxvQ+
         7vNA==
X-Gm-Message-State: AOJu0YzElavQPlsUlJvHu6pAdBe5LaNtsuMOMKYd9Yxw/6e+nA7j1NR+
	y0a9WdKIwmXbim76pXUvBp3xfI/YokyMXkAYabDPTpcdKzDfJT/e8XSp
X-Gm-Gg: AeBDies4dTI82hTjLcngV00sMOL/FIqVfreAxpCF1Dze1SAUpVVF7AUc8cazvcGQ0uy
	KN8LzyKz7JRvUPAiAAK9HEXzN3RB8bJ47cDfmA8MU7iG8x3N3/6PvQRINnxNs9jVg4x+HQVufL5
	97dI4uVXKRwk0/bxfhJuW8BINBLTU0z1MMNJTm3gDVMMi7W10236nCIs6wJK3eADi24p5bS+9dC
	mTu7yZ0/7IBQrZ+zRSZq7pcXUgcxZkmc9eLpj5IIfO1wbCnDd02AlbK3qrP/1UnCRASYHeVKndy
	f9Bs+Wo32GQhRvFFgwxsG57uqc5tsC0t0VLF3T6X3O2FF5ln6QvE9rezm2petUDxMUASY65cW+U
	fB5CuGp9O1AUrn4ZQDsvjrX+1rIreBfVHnWfp0EurstMJ+4XPDYXHszXh7yC24xgX3CfAeYVWzE
	tsVuYiTsCsrd9LyTt7zdU=
X-Received: by 2002:a05:600c:4987:b0:488:def6:bb17 with SMTP id 5b1f17b1804b1-488def6bce5mr60305855e9.4.1776076075070;
        Mon, 13 Apr 2026 03:27:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d66773c8sm203145935e9.0.2026.04.13.03.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:27:53 -0700 (PDT)
Date: Mon, 13 Apr 2026 13:27:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: fix double-free and
 use-after-free in error paths
Message-ID: <adzFJnr6Ru9RjqoP@stanley.mountain>
References: <20260412205057.386856-5-hossu.alexandru@gmail.com>
 <20260413101533.496090-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413101533.496090-1-hossu.alexandru@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58659-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: C4DD73EAA3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 12:15:33PM +0200, Alexandru Hossu wrote:
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
> Additionally, the error code was not saved before calling put_device(),
> causing ERR_CAST() to dereference the already-freed adev pointer when
> constructing the return value. Fix this by saving the error from
> dev_err_probe() before put_device() and returning ERR_PTR() instead.
> 
> Remove the redundant kfree(pdata) calls and fix the use-after-free in
> the return values of the two affected error paths.
> 
> Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

Both the resent patches are fine now.

Reviewed-by: Dan Carpenter <error27@gmail.com>

However, please could you resend the whole patch series as a new thread
(with the first two or whatever dropped)?

regards,
dan carpenter


