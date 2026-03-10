Return-Path: <linux-media+bounces-55179-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMtHIFAmsGnYgQIAu9opvQ
	(envelope-from <linux-media+bounces-55179-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:10:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 08429251734
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 840B03219351
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 13:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EE839C002;
	Tue, 10 Mar 2026 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="A1RM/A4Q"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E840DFC7;
	Tue, 10 Mar 2026 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149656; cv=pass; b=TwTWjpUnG/H6rBFoSjLT3lFke6gg4sd8gQL7X4Oit3HJtJ0+c0xfY4x3+b2NSWXdT5hPingsqKayCNpD4FDC5KSdx2Ty8mqjpQeEpwbzfvQfThAoRROGInWTf8Aa17Y2q/zP2XxwGz1SA9PZFkK9xl8JO3wxuB1OavFM4aLf6H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149656; c=relaxed/simple;
	bh=XvtusBtLttv6uK31N5gEOAYnd5cCzIPklCZEEQwool8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGGzSPOWnfoPpw7aU0qaDc413JMK3klf0Q+ooTkNJoTI2N9wuQabqdZlYcH1TN+eLitfpjLfb6XBmSIDvpZ0SpbdffD3y4FDSqtv/+R+gi3dJaFaL8o+f6yFLAHTC5ESjjm9xKBp+KNCWzOMDYr95KG7lUU7x7hNYgiTSm0GI7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=A1RM/A4Q; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotp5c1dsf-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:1157:8c0f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fVZbf4kjCzyTZ;
	Tue, 10 Mar 2026 15:34:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1773149647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbbCoMIKHho8A2lZAHILdn3DiD5n6G5yZxvhwBhsg30=;
	b=A1RM/A4QmSvd89WyBtC2iQ18ncfLw39QUUE9Mg4Hi4OT36eiXrNAra44zCDQ8qX9+cMYNl
	/Wr3Txxn5FxAUOVJrPAfrE9P3WJDVmyowecvUWQqI8Kg9rEv/mvK0OkmpJ6DPNuT+vTCN3
	6JSweSav/bbOXbrkrUpzTZ42Z+wNJmY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1773149647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbbCoMIKHho8A2lZAHILdn3DiD5n6G5yZxvhwBhsg30=;
	b=tPNymujrBqSh+81ABhyYQdxz7aGr7sN9VFaVJnH1UZonzTAB4u2GJRlyuWc7CrbdiRpyRt
	WtSBI2FSSsjuZNDH+LyyCWZas+z2LLkRhkxfBEAAmlVuWDyCv5v03nYqzMX9TfyBAbb2Kj
	SjJDQlGKJOvhba25/SVlyWttkTd0HuQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1773149647;
	b=WD0myuJtCdSMY/Me0UhHwGmykauJLLB7BBYLfxMQ3TgtwB9Hh7MLgc5Au/3QSJdttQ1Ir8
	LV7XcmkFjVm2n+jC2LAEqcdbfkowF4kVnYJoT8ew4w6j8rWtj2f3PNkQfR1gdjTIEnnM9y
	515SDEEke0nruSDe2KrNcVpCTAbawpU=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 27AE1634C50;
	Tue, 10 Mar 2026 15:34:06 +0200 (EET)
Date: Tue, 10 Mar 2026 15:34:05 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-media@vger.kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: i2c: replace msleep() with
 usleep_range()
Message-ID: <abAdzZYJXhjpJIWb@valkosipuli.retiisi.eu>
References: <20260307053311.15746-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307053311.15746-1-marusik.adamenko@gmail.com>
X-Rspamd-Queue-Id: 08429251734
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55179-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[iki.fi:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,iki.fi:dkim,valkosipuli.retiisi.eu:mid]
X-Rspamd-Action: no action

Hi Mark,

This is a patch to the (atomisp-)gc2235 driver, not to atomisp itself.

On Fri, Mar 06, 2026 at 09:33:11PM -0800, Mark Adamenko wrote:
> checkpatch.pl flags a warning for msleep() being called for 5
> milliseconds. Replace the msleep() call with usleep_range(), as is already
> done in the same function.
> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
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

I'd use fsleep() here.

>  	return 0;
>  
>  fail_clk:

-- 
Regards,

Sakari Ailus

