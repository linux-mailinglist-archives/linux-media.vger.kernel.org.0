Return-Path: <linux-media+bounces-58865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBjRLY+v4GkRkwAAu9opvQ
	(envelope-from <linux-media+bounces-58865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:44:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C353540C8DE
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1B1E300EC60
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D16D39B95C;
	Thu, 16 Apr 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="vEfHyiLv"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E775F29827E;
	Thu, 16 Apr 2026 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332673; cv=pass; b=SuYZKSwIPpt+q78VlM8Er0oWr0c816gJjKvihFigfE+djy9ya63jpSC/DLRaxQjF6SP2kbcu4iqWG6VS5jHh0JjfM3OrisUogG/LDFm8w4rYHKRTk7OxOUT6sDc8298SPYUfzUk26ch1YRnJjGj5sTTkMo8vp3tpNUy/HIMP9g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332673; c=relaxed/simple;
	bh=E3pkyy4qrNLVPZjCPToIS/l6G6G2OkeXjdHxxZs++pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7VhqmKNFwObIWwD2KsEcU8QMDLVcVagaUHl5Dq9trAek9ZJPeotIXK9ou13LtPlqHFsEN5DJpMtxq7YJq2YhLcFgxXwkv67P/SxpnXGLXdYJ4rDYMmPHud7VRehoanKJfjfL6Na6DhUPJGE95seZG/w9m1DmcGCuOZgp71WjtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=vEfHyiLv; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fxCld3LltzyQw;
	Thu, 16 Apr 2026 12:44:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776332669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cCPTiAE5o99QYEFpj/SEZptFlDCeRmok+EI6YQEGy60=;
	b=vEfHyiLvON7cUAUtqSpPnn7tdDu0EgPS/sSdwYuwqJbUuMPjIDo/yrHjkWE+X80kco+joF
	l4uZgLqfjM7bS6UpEv0gnvnSPC94eua2f3VS03LVYzJOFo0UwfMsT6Mi+ADmIQ2m5U/vQ3
	p8M849Ru/YEzfGbX5Hs9js2/WrvWZ0Q=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776332669;
	b=u9DC83VrorNjgCnjKYRGg9slxOginFj1qBscuFsSjKKx7mA0jznS2weSg9mSPj34gGlSWj
	1taxK+Me/rHrPuBCkVA44T3Q7qqXXPAHtZ4gOEMbk0sby+cx41hRl4vwQGGSdGGkGUJ986
	jOaTk9Wyr8dCdNHo0K23F2NnWKAuzTc=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776332669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cCPTiAE5o99QYEFpj/SEZptFlDCeRmok+EI6YQEGy60=;
	b=DzS7aU8XrmshzdvMv4f+JmUhzNX+2aTphv5xMrQRGk1PhcL1ALwQqDfzQNJD6zcPLAzDUO
	tZt84Ydj+TvDKEwKfsvsoRGHcs+SvDaRdbgPYmHlb+4l347BOAIXaxm3jtA1DUaJhfaBjK
	rm7+bfn0ijDxjyZW0bPkO+fTC1Ft+zM=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BB09F634C4E;
	Thu, 16 Apr 2026 12:44:28 +0300 (EEST)
Date: Thu, 16 Apr 2026 12:44:28 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Abhai Kollara <abhai@protonmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: gc2235: prefer usleep_range
 over msleep
Message-ID: <aeCvfE46XvGmXR--@valkosipuli.retiisi.eu>
References: <20260318212645.2014561-1-abhai@protonmail.com>
 <20260319204242.2076191-1-abhai@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319204242.2076191-1-abhai@protonmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58865-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[iki.fi:+];
	DMARC_NA(0.00)[iki.fi];
	FREEMAIL_TO(0.00)[protonmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,iki.fi:dkim]
X-Rspamd-Queue-Id: C353540C8DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 08:42:47PM +0000, Abhai Kollara wrote:
> The gc2235 driver uses msleep(5) during power-up. msleep() is often
> imprecise for durations under 20ms. Replace it with usleep_range()
> to provide better precision.
> 
> Signed-off-by: Abhai Kollara <abhai@protonmail.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index d3414312e1de..db5e007efc56 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
>  			goto fail_power;
>  	}
>  
> -	msleep(5);
> +	usleep_range(5000, 6000);

I'd rather use fsleep() here.

>  	return 0;
>  
>  fail_clk:

-- 
Sakari Ailus

