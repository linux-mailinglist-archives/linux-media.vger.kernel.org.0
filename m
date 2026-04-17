Return-Path: <linux-media+bounces-58965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEPmAo/n4Wk2zwAAu9opvQ
	(envelope-from <linux-media+bounces-58965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:55:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D654183F9
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8410A3039B59
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B98135AC1D;
	Fri, 17 Apr 2026 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bv9ISsA4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEB135AC0E
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 07:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412537; cv=none; b=FzRPQqKNXyfdnpUU0mSRv+So1CLTEs+MP15MekCjM3iTsfcGWlBcwYwKP1M2+88xNoPR/wI0fG45T0EY+0XY2oUHkwJPV4poK6ZmyQ+eXcOfP9kdggheC375ok8pK9YskwHsUMPeCwiu4NYum9h18lYl4p6o0XWlbfnVvmpT0Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412537; c=relaxed/simple;
	bh=qwnO/dPC+6Jc/EcZmne1nxWrHKF3qJsdiX+Yx9rhCrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7fzSVuXAtmxQuRV+A7P2u4x8+aWKs9VTjulKgZF4wkdKal//yGZprSec+UtWS8ffIevnDblulf24ypJB3bTSIFj6s2FjwBVe5OslndtLn6vLA7TJOJVfcKN7g94lfHI7DvRRApnXwmjSTSsa5lot+SEHyKcFfrHYooiT38nep8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bv9ISsA4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so5634605e9.2
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776412533; x=1777017333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x2gJY7+fGqaHfkh90snhoclQbfvZOKiwtCzkHBs5oMY=;
        b=bv9ISsA4AFpKgBm1JvXYlLXwV7+Jh5P+BqXsyinO3Qw/ZT16M54SiDfCTBg+eEM83z
         3t5kuzbdEVOAh1VED05BTo741tYSQ5au7kv9SVgXsmcl3MvybPtF8Rn98rZaZR96i/LZ
         NgCZ3p98jtd8TJWFwmE0jTxUDKPyWuUfg8qLllp5owQ7MfCbGAUlkkVs7nvyWCfW4ykS
         XC0HJeaVfcx7SEtKK7xg7CzjVv0F8asUWQRgfsezR+honZOqsFtKqm6eX8AkPkXoCeXX
         jOrpubjbyFTz/2MRJEv/gSZoD6Z1v2fukhF8aJmrO5hmQEnjx24Vu+zAr9WD66D1Bl6U
         HHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776412533; x=1777017333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2gJY7+fGqaHfkh90snhoclQbfvZOKiwtCzkHBs5oMY=;
        b=bachmInIRKvF0IY4MPtY7KhxikTdZtJSnTvEbHlAdxVK+LRNXYIvM+L+P9OSrP5AjH
         AFsC28242ir5a6E5zlA639kRXQQ3YGVCA0A8cDyW8+mqi4+liCZY4Lqjlvsvf4rBby0f
         8mQGcFLEwmuQW1S5riHAsGTNCZ02HZrXz+C/7c1YTZqsJ9Xyh9WGK15JgabGM1O/BySK
         BKjYBVepvUS32rgLYoGMBxdVpsk5+cRTC+SPHWT8e4izGrr1JlwLX5sdALka2aSGKlPt
         4TbR4sRcZCKnYgdToUWIYzuUOnJrrpEeZHILRjY5Twjqt5OJ/POaThKJgf++sORVhomZ
         7qTw==
X-Forwarded-Encrypted: i=1; AFNElJ9MoxeCHSsbAPJTaMwXo7QdY0rEReIQWCHVjrrw6AqW8IgyhXNjXqjfxge4TosjEMaISuhVg/fuczliPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/cdHhVT4wuJLtWYXpxwCCsAZmQtlaZn7i87VX4XwOCbuFfSMq
	x4+zufXo9MUr9NPFSlfyuzudqXn7U4sQ1Y5exSm3BXtK+ynrpz1ctDDt
X-Gm-Gg: AeBDieshogWjnYK/24/kIBizpKNIDA63nPB2aU9mhCiicxXTcENCz5AYtyqT7nQQuG5
	SmRKlWLWoHNoRMaC7z7U+whbH6xBif9NOdHmQpfq2D52fECiJuVUlFh5YV51BLwsddZ2irlY+pP
	41ym77NTeWibhYw4+qVPpddTvaQW2rdGAADiyJtb2juvrAksxw8uPWcngycEFIcmyHiowShskq/
	j4ZtKwFLXFeBDUi4mm+ShcUx0ijJiQiKYqgSzZiW4wYeqHMRXdVIIJMU9Q0bazLjoQ5snPVjvwj
	RvscAA5kmNNIyXOy3ecyHOJ8ruoVrcGknMfWCe2p4jphtOqsTX4/C/rmxIHbF4fIQBazqIpQdJ4
	qj4Ju5m554ripXHfCVtoOiUtxo8EQO88lO9cqxMhb6SNNW2cHH1wBk50EG8+z9OetHAAI86c4J5
	xoV4kfzNEmfD5gmUJegTRaWxOEIexItQ==
X-Received: by 2002:a05:600c:a30a:b0:488:8d44:bf98 with SMTP id 5b1f17b1804b1-488fb74a5f3mr18115405e9.7.1776412533399;
        Fri, 17 Apr 2026 00:55:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc177dafsm30313095e9.4.2026.04.17.00.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:55:32 -0700 (PDT)
Date: Fri, 17 Apr 2026 10:55:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: fix memory leak of dvs2_coeff
Message-ID: <aeHncYMO-m183mOZ@stanley.mountain>
References: <V2_MESSAGE_ID>
 <20260417070124.2677399-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417070124.2677399-1-hhhuang@smu.edu.sg>
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[smu.edu.sg:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-58965-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.328];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smu.edu.sg:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E1D654183F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 03:01:24PM +0800, Huihui Huang wrote:
> There is a memory leak in
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.
> 
> In atomisp_alloc_dis_coef_buf(), dvs2_coeff is allocated by
> ia_css_dvs2_coefficients_allocate() and stored in
> asd->params.css_param.dvs2_coeff. If the subsequent
> ia_css_dvs2_statistics_allocate() for dvs_stat fails, the function
> returns -ENOMEM without freeing the previously allocated dvs2_coeff.
> 
> Add the missing ia_css_dvs2_coefficients_free() call before returning
> on the error path.
> 
> Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
> ---
> v3: Remove unnecessary NULL assignment per review feedback.
> v2: Reword commit message per review feedback (no code change).
> ---
>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index be5f37f4a6fd..d6e135c42e2f 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -1363,8 +1363,10 @@ int atomisp_alloc_dis_coef_buf(struct atomisp_sub_device *asd)
>  	/* DIS projections. */
>  	asd->params.dis_proj_data_valid = false;
>  	asd->params.dvs_stat = ia_css_dvs2_statistics_allocate(dvs_grid);
> -	if (!asd->params.dvs_stat)
> +	if (!asd->params.dvs_stat) {
> +		ia_css_dvs2_coefficients_free(asd->params.css_param.dvs2_coeff);
>  		return -ENOMEM;
> +	}

The design of this code is that if we have an -ENOMEM here the caller,
atomisp_update_grid_info(), calls atomisp_css_free_stat_buffers() which
calls ia_css_dvs2_coefficients_free().  I can't tell if adding a second
ia_css_dvs2_coefficients_free() here leads to a double free.

I call this style of error handling One Magical Cleanup Function.  It's
always buggy...
https://staticthinking.wordpress.com/2025/03/31/reviewing-magical-cleanup-functions/

regards,
dan carpenter


