Return-Path: <linux-media+bounces-67344-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EINIHq0KUmrwLQMAu9opvQ
	(envelope-from <linux-media+bounces-67344-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 11:19:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D3074104D
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 11:19:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="ku/GG7aM";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67344-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67344-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F6723031CCB
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 09:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969E9381EBC;
	Sat, 11 Jul 2026 09:16:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F673345740
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 09:16:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783761403; cv=none; b=rAsGNsFrejropXbMPUEjkfzDuPoJQOEeDBczwIqNZ+46C1r1PKqlvL71eVBNDLnj4DasyzaVZ6VUzGFngegGzJwLyLm8k+JDtnCNviDyxMjJfyP6bmLgF1tK+GxPTBLuVXbdDkJ2SP3sBoasqpu4juu83Ix1yk4Nq4NAuAofK2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783761403; c=relaxed/simple;
	bh=uaK4E2NN338KW60VTHBVG2Nge1niyLZtTyuoJn6LktE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvtI3WfPaVS/OIntSLv81aOaXaMGjhAAcHEHjkrCxvKOrvK4oC86FCpiK7uIPIId3tNfFqf7Ss0UqoSdd5qLxoxJBC+m7eEdoJKfhk2A3Z0ayP51SPSleQHqG5YQGcLxQmISmYWm2fS9rqrF4DDHaPJ77hQd1NqMseb9zturxLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku/GG7aM; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493f6de72faso5904705e9.0
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 02:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783761400; x=1784366200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsR0+1V67dKoDon9Zt9yFSPL0W+9/ofIZEZlGwU2kRs=;
        b=ku/GG7aM35wGiuxNHga4yE7PZFD1mx/hF0rcqMPmvxuhgciIx+26zEVmA4/5P0G0nj
         2qCaYIgurttvgr/wzQCo1DNvKXmMu7RAC4XWbRMjD9LEpC3hgLw3clvm+v8oLCd+qNEf
         L/wqbrLcgKwmJLl2FxrFx3vOA1SbFq8t0eqTog8JwNcVskU1oXrxKNbJxIes6JR9BasL
         s00fRa6uYVIyhI7m1QOCSHy+NNxT1sGF/osyKAaB9ZaokF+2OQ+ReExPyyJsvB+6gh5s
         uGt2IHUWCTCK+/ayU3sPgwZLruFO1Vxfx4jFiLjtbCIbULqU2aTWInZql+m+IFM7OqJa
         wClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783761400; x=1784366200;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsR0+1V67dKoDon9Zt9yFSPL0W+9/ofIZEZlGwU2kRs=;
        b=IFbNUP6bbPQjnI5DaMSWXuhhpgfdUJMJ5uNg3tuDHEjvBficWaJZlw5Op9YOGbWDwp
         XiAs/mYD409lMWKySp0B1+yvblBBBN2vdZFsVPenxorFggE0qB1hf4NpQyrU+0bYzIID
         bEI9KfUy/nEk8cl00lLLgmfIbiIHbSAiGz11mbP073PT0qKHoWcr8Jf808eZ7rD3wozO
         drncQieTeyWSmb5ABqgbHydHjM2V0N8b3I5ZABxUFCDdKnEJlP9C7RraAT/r+5xWckqD
         Z4/1O4j47mco2yb7rP6D/nrnNdSjbzn7lYG4YhJgxoyKsVad4m2ruONalLN89GjPUlJK
         COGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrR6OKt7zYfiC6S9Vb2c0H3OU/R7ApAlcCYCMDE4gEpCP+VcpWa9hN2TA+TigOJkAqk8ifWUqM2EU496w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxrE0jzUwg9q4MdPaRtHMUicHMr7cf8txXHATqUp+QasJiDLKr
	Db6Sp3EzFb6eK0GD08MPxSf4ATPF8VQ7tV7EYyeq8fkoZoBbjNJ4c5Y9
X-Gm-Gg: AfdE7clog9b9a0znR6KdL5lSaeNmNSdi30NeB803qCwNQlY4k//MTGIsUUe1mbJ4jdn
	fabOArCHeAh038EbnJ/Ki0wCT/C3u0R+dFHr+Bf3AXKwokLQ4/3VGQ9xuwwJEvHY5DOHKc83OH3
	hYcPKdCIxtqNxYQIbX0mrzeXiYvW0BouJ2Dzip1V+cUAqEdV2EbEB4B5SdS9IPtP7uwF04Zylpw
	rja7Qkk0lSIMNrN3yQ/USuMjesm8TPCQhWklJEqmDo5QtAc97mrTGO4PxPhJlOjmQ0jy3LHTJ7+
	R9fGx+ucsyCh/E1/2N1oWSPaNntjUFsQuJ2OKuNisfmyN6MTDzLihJZnhcP4fzzwqfLa2gej9sz
	dMDmwZz6Fc244Vx7yEbarXpfiPdZ9o16hD/CI0imAJNoOskZ577pjf4sph9wsvmqShH/lR6qPs7
	DcOFWCRwQf
X-Received: by 2002:a05:600c:3492:b0:492:714d:8c4 with SMTP id 5b1f17b1804b1-493fb0450bfmr9365165e9.11.1783761399743;
        Sat, 11 Jul 2026 02:16:39 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm193656215e9.0.2026.07.11.02.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 02:16:39 -0700 (PDT)
Date: Sat, 11 Jul 2026 12:16:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: erqeons <erqeon@gmail.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, andy@kernel.org,
	mchehab@kernel.org, sakari.ailus@intel.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix indentation and remove dead
 return
Message-ID: <alIJ83ctZ7NDzBhF@stanley.mountain>
References: <20260711081657.37117-1-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711081657.37117-1-erqeon@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67344-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:erqeon@gmail.com,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5D3074104D

On Sat, Jul 11, 2026 at 12:16:57PM +0400, erqeons wrote:
> Fix style issues reported by checkpatch.pl:
> - Remove unnecessary return statement in void function.
> - Convert spaces to tabs for function arguments indentation.

Split this into two patches.

> 
> Signed-off-by: erqeons <erqeon@gmail.com>

Real name, please.

> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 6cd500d9f..fb1ae146b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
>  
>  err:
>  	atomisp_css_free_stat_buffers(asd);
> -	return;
>  }
>  
>  static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
> @@ -1885,8 +1884,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
>   * Function to check the zoom region whether is effective
>   */
>  static bool atomisp_check_zoom_region(
> -    struct atomisp_sub_device *asd,
> -    struct ia_css_dz_config *dz_config)
> +	struct atomisp_sub_device *asd,
> +	struct ia_css_dz_config *dz_config)


Normally we would align it like this:

static bool atomisp_check_zoom_region(struct atomisp_sub_device *asd,
				      struct ia_css_dz_config *dz_config)
{

regards,
dan carpenter



