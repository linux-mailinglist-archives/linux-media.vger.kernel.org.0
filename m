Return-Path: <linux-media+bounces-55308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJTeLl4RsWmYqQIAu9opvQ
	(envelope-from <linux-media+bounces-55308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 07:53:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B1825D12A
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 07:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C3213181DE2
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB976375AA9;
	Wed, 11 Mar 2026 06:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H7iSPowC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C52DF153
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 06:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211993; cv=none; b=ZHKEtLErcRc/HDCXCOXhePvopgoaKKNMtHuxpgEh2zXx8CyMEplRUVhyzBH6vVzFxhggO8O9AJwkGnvAvLTi9wSQs+EfUc16thQ/8EXq+3S5Ga982VdsA6nLxVz3sWZnFlUm0zhnygYsrl4MWBxxNQv8hLDzYoo+Wg8WnKcp7nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211993; c=relaxed/simple;
	bh=gLfrcn4GNXtzUHZ4mAGV9C/SkrxMY2hE3JC4Bc6Os5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrFuX8EfCb4/sQniv8PEQa5l+cyXI00pWpl3hravPde1gSw2UBlxZU3BRuc3EYdAeDKNRk0NAdOSyM/kMHqLGFsA1eUHXF1Ck/kJRy3OYP8Kyb7qdeUcfxrLgeDQEbNtNBlekJb3dqhfuV4ele6DNrt5O0dvLh5foeLmJNaqZEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H7iSPowC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439c4bde55cso5402238f8f.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 23:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773211990; x=1773816790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rfTOivZx0p7gzOazZRKQSvuxJsM85KQ4nZ/QkBNEE2E=;
        b=H7iSPowCaihQ/BeqvN8WvZzx/VwiKh9shDNd38JlfBo0LJXNzMXxoWcPH9WcIYj7+q
         1lUyxU2LxJlIx/rlD4XHDEWlMttygEjoV0E2XzYXrf2n7ITCr5eHjKb0tcB5VP4MOO1c
         M4f85hNx79Z9mfvBhTsdNH62nbaJr65jKEIcGpah6vNkHmBTJI3RMMXoLPy3SMyd3PNr
         /F/MUcOh/tdO2glvTYCp5Mvxqwd1mbQ28YZRXWOepe07XmgebHV3H38av0mARJ/+PxO3
         xrIRkvOEo0hqtTeeWpmOqLxFVoF63thl34ffP9W9MGfMeYaBsgfwO8k2rETMMCHkC0op
         7jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211990; x=1773816790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfTOivZx0p7gzOazZRKQSvuxJsM85KQ4nZ/QkBNEE2E=;
        b=o+E74K6GSTojYXiDHEcpHpgJZF+AEuXICKxmHp8+9ECEBjromKyxyTpFlQKoJTwunV
         L/crjzUNKyQoT2cBOMDyG5u+F86882N0wQIcu7TtzXVs1Ocec244jTakpN1CZAs8KcwW
         D0CvQEH2MXtUEFqU255URd9ta00r9EJ0xVKLA4/as1JjvRuJhJv4jXunPUHvBK/p+wnm
         Sx1tThSqup5D8XYOM4wBvI6RMaIUVbxJgZKgr01eZQANF1gNvaqBvmwW8G2Lym5kwehq
         wdTq9Zd/fPL3a144cVHMX1m9PQclnqjmEQsfdKjB0hiPcwtoURLIvn7xp+f4V8H5JRNm
         7eLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW83exkN0EBfjGsGJ19IKG+9zUy5cJ9VpyYR+IESpJ6hdo5LhcbmIUwQ+MWrpGvdEc14GVDGB1f4VHO1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQiXeXBVuEaPVjfN55zq3nfTjzCY8hzBVEOkheRb4l89u6JCJk
	TpTW+s9Fw3n8RktdwO4LPsfw995phlaNo85DQ8YTXLiTz9Qc6wkMFetu1XNPw1ajVTE=
X-Gm-Gg: ATEYQzyxl4tz4FNi4KjzYtW8I8IBzHqjsJXdLfKEjYjlKU0BjufUoihqMvnLbLDWL4G
	VdwbHeMj0NriJbxeT+K6tD3wtBdbKaTwEYIhNUFZ43K31fbwN/smy55FEZN//Ne9p3NWqpFeq8F
	skTXMSsUDVRaWCz7k+kkKDH1JGJD3cnuulMFsuQ16Uzm/+hQ8n6RR8ZjK6Hx6aSo5CNBbl8nhjs
	bbK+wm+4WVOFTfPpyWpzpHi/G3y/yoMpYt36cdtWM5G/0wAfIfqh98n25oai3eAsFl9RXdsc66p
	EoFe5WNzTh7jc50HYsI/drTdeo4IS2h8PGOe/RmnULdpFu6okKO3v4KMLG50Y+OWcyIPMZDf0pr
	+ABc9Vg7qvX9AOBiwoKH8qAQLLu8R6PLN1LKYpJTnThPwYknC8a8AvHU18VSyWpfSQkD+BNE1Wv
	nGZW8M/y5IKO/dKMtVkBW6OV6TEQkToT1Q4th3A58=
X-Received: by 2002:a05:6000:2884:b0:439:c628:2228 with SMTP id ffacd0b85a97d-439f843125amr2715649f8f.31.1773211990335;
        Tue, 10 Mar 2026 23:53:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm3857972f8f.5.2026.03.10.23.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:53:10 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:53:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 04/28] media: staging: atomisp: Remove unnecessary
 return statement in ifmtr.c
Message-ID: <abERU_Ac4s7A1-TD@stanley.mountain>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
 <20260310-atomisp-remove-void-return-v2b-v3-4-3fdddab41271@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-4-3fdddab41271@yahoo.pl>
X-Rspamd-Queue-Id: 21B1825D12A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55308-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,stanley.mountain:mid,checkpatch.pl:url]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 10:39:15PM +0100, Tomasz Unger wrote:
> Remove redundant 'return;' statement at the end of void function
> ifmtr_set_if_blocking_mode(). Void functions do not need an explicit
> return statement at the end.
> 
> Found with checkpatch.pl --strict.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
> index 50b0b31d734a..31dd3f99e28e 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
> @@ -472,7 +472,6 @@ static void ifmtr_set_if_blocking_mode(
>  		}
>  	}
>  
> -	return;

Delete the blank line as well.

regards,
dan carpenter

>  }
>  
>  static int ifmtr_start_column(
> 

