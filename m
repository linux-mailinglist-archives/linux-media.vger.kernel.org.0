Return-Path: <linux-media+bounces-55307-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGWIIX0RsWmYqQIAu9opvQ
	(envelope-from <linux-media+bounces-55307-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 07:53:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 006A625D140
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 07:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA85430A31AE
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF1933F585;
	Wed, 11 Mar 2026 06:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0IgWttN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E528D2C235E
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 06:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211887; cv=none; b=qpn6EZLkmfwfQPIIr/fE43ujOxNtVWS6Npp5MgGDZK/4NNx3+PYFZ/MuaXoFJRVFlhwdmc2ZpxRZ17mzEwAYBQk4v9rinAnnLh8dw9+zRiGobAwN6ObS097H2gRiOmN5vL+hD4IfqMwQdWxJUm03wEo/WOWLcsNvlhnerpo6lXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211887; c=relaxed/simple;
	bh=PzPcFTQ3tXwP7zF5f7H/cw0KlxWYCJGLWtrtgS88JXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5g0Zr3RN+0haX1E7PbefufrCanAbl3immfs3mySuJbeMI6fX4yS7X88V24oe6xLyhxRS51L1c37zrbnhPWLc55FqJZCKdKyUfPUUOvbQsNMUJxDC0Uxkd5SuM8WKn5Xl33Z/4wKQ5t15X44ay22q8c/SJfJIzKExy07Hwdf6Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u0IgWttN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso43321815e9.2
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 23:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773211884; x=1773816684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=;
        b=u0IgWttN0t2kyvnbuaA/cPXyQSBGDt6n0UasqFNVxJUrU353xF55fuUABB6DJA/qkX
         U/qiU5Ark8KUIF2CQ0KopcGh3F/PMW8c+adL0lf4Cgae2591SU0QzLAir+FXNMFORF87
         EWk8TY2mNXC0cGxCpcYAowv4onkc/1xJl/NkbpsIdL0ZyL7iGshqvxywjsvPFuh5piEw
         GCZ4lrEjfTNPd6ZMSUZxrSgVXUyRIDiC0weIAb9huh+C0yjQaE2Mgi3KGEbKDht5qE2F
         6xs3MAhJMtCBSjF8lRYOhj4ykV9OfXqsDJgP1NjSRlnyzqO/4P1e317nQFihI8Hnv9X0
         J5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211884; x=1773816684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=;
        b=X+H/rXtpeIUAPQMROWXdnUXgdWduJs0CyvatNTL2izFMUm00nMJI2d4sKKTpbuoz2S
         7NynBo2+A9RHeGt37DAKxQxDtJ1wJuatB02rYIh+Q28V65xGQLl87po7SCVq6BJRJ3tv
         mAmltdopA1wRxvYGWu/hJEiiCESse3Go1GL5qHj7WCyTfJ568IdjMXauMV425jS9aVl3
         T9iOb8u50ieNTkWyLRqLQwTjMJMppZK23XT7RWW6sAKmKFVP90MxLeaVjFrqdXdrAe6Z
         8C0jssQ+eVRtXhb+R8HqZ9Ce4tjScRZuPYI5Tb3V1INRWbnNiwxqP2cX2xD6TjF5hBvP
         JbSg==
X-Forwarded-Encrypted: i=1; AJvYcCWGa2Jia/JIdrab3MQEmfuEs9GokEy98A9URasV01hwNM+YVw69bY3LqPXH7JJ64LeDzxNEFhh8STO5qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/0FRLEO4gU33TzLPHhrbXD3lbjrAjmzVsG74FWGHkjHLbJK2d
	oIkETEjUFNXbbF7ZL8GKWJKYy8VQfXVXSZeZ1VNz9lm3y3Iih3sXUMS2ba3Dd5q+0uU=
X-Gm-Gg: ATEYQzx3cdfI3rL8J6xmBv9pZGs0ismYMiADbaS3Y0yU24kz+C4rRbLnH3gkZpd2UJt
	3wOLGtvAqdKxAUJhAnrq8Oa1ZuvpVkbUrerSgtoAYkvkn3hHk1vRDklPHVQqmcMfAYeLehIKtkH
	u71jS7qRuOITNun4cnB9kHzCkuY7diUCxpoLPg+X/mmbYUI3/+3t1BSj5iyZqHgxf9l5eihfGDd
	QeJFdV3CRzvFD5Sy8ofH+tp1QRyYKOaU2nXYgCv28BmCignWsGsQZtKu7r3/TcPwjLxzgqDYnAG
	dAPhpnjT0U/Eos9+RsOTIE53iR4sA8gKiiaWEEHjz/hpXZIZ6INB6eNLfbZedXd3yD21xvUfORx
	KXotjPCufhgMG5wmcrU9V7pGcqQ/GYVmpg8Q4p8TxaXBnhHjNdchTM93c3Q4EJCcHwW4sDULQeE
	DL20eNf+j6xb3SgrzhIDbfLQUd3Q3P
X-Received: by 2002:a05:600c:1383:b0:485:2fe9:3375 with SMTP id 5b1f17b1804b1-4854b0bff59mr23795475e9.15.1773211884113;
        Tue, 10 Mar 2026 23:51:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f820a2f1sm4090148f8f.30.2026.03.10.23.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:51:23 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:51:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
	m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
	kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
	straube.linux@gmail.com, lukagejak5@gmail.com,
	ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org,
	mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 1/7] staging: greybus: simplify cleanup using __free
Message-ID: <abEQ6HA0CGGCyV1B@stanley.mountain>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-2-sanjayembedded@gmail.com>
 <abCIBPZzZBfMoOtm@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abCIBPZzZBfMoOtm@ashevche-desk.local>
X-Rspamd-Queue-Id: 006A625D140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55307-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,mediatek.com,collabora.com,linuxfoundation.org,nexus-software.ie,baylibre.com,analog.com,nabijaczleweli.xyz,gocontroll.com,chromium.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 11:07:16PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 11, 2026 at 01:35:07AM +0530, Sanjay Chitroda wrote:
> 
> > Replace manual cleanup logic with __free attribute from cleanup.h. This
> > removes explicit kfree() calls and simplifies the error handling paths.
> > 
> > No functional change intended for kmalloc().
> 
> ...
> 
> > +	struct gb_camera_configure_streams_request *req __free(kfree) =
> > +	    kmalloc(req_size, GFP_KERNEL);
> > +	struct gb_camera_configure_streams_response *resp __free(kfree) =
> > +	    kmalloc(resp_size, GFP_KERNEL);
> >  	if (!req || !resp) {
> 
> Now this check should be done in a better way.
> 

Yeah, two if statements, right?  Drop the curly braces at a minimum.

> > -		kfree(req);
> > -		kfree(resp);
> >  		return -ENOMEM;
> >  	}
> >  
> 
> >  done_skip_pm_put:
> >  	mutex_unlock(&gcam->mutex);
> 
> To complete this, one may add a prerequisite to use guard()() first.
> 

I don't think we're encouraging people to re-write existing staging
code to use cleanup.h magic...  It's unclear if I have to review these
patches or if they're auto NAKed because we're not doing the conversions.

regards,
dan carpenter


