Return-Path: <linux-media+bounces-55310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJjyMKcRsWnbqQIAu9opvQ
	(envelope-from <linux-media+bounces-55310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 07:54:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF77125D17C
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 07:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16CAE301B668
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0321C32572F;
	Wed, 11 Mar 2026 06:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S4zFkubB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385A62BCF4C
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212063; cv=none; b=k9ropDCLJYASwmuTxM6FPqEaZO0aRGcGk8NUeKE8Yw6OLlnufDyUEeex0dDyTLts2aP02Kn8CJy2gk/7hDPig2csbHsyOqwIIg/60VWeOBGdpXHxkz8GnqmpwUDj7soPINSl5UTCmOJpa5QErYlsuJGfbdOYomaJXV7Ob274URU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212063; c=relaxed/simple;
	bh=UVRKAdZHojHmopPQfckr6WfYfaCPtUN605Fdvm8Mskc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlMDgrRHCHf/FGym0ylyHmVHkvmZd6w7m/+rF9TxZXXSBa7QKbO5BNOcRf0umc/PhPFlT0e3c6/3ZrEkCbXKCGbQFEtHioVca7QrgqhBvPjW6rXggr5cv5xui46+WtjRrv5BuAFYxDdf2QfkK1r07V3VE43Piy1jwcTxOr2oC9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S4zFkubB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso42070415e9.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 23:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773212061; x=1773816861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lF5ZKsF6F7Qr5iBaoEQm8iifpJM4zWXRKtFu+dhnmr8=;
        b=S4zFkubBM4jSE2bCXQCLJQbBKVpUd6lkg6mu13Nm3mwSV+fWFyEQkWrpx3S9J2c5Us
         Em/+TGicE+UtH0hvWkc+IVikciVojco0MSYQ0vfdEB0kAfjtJ2ZkekueeftIgr02vQu0
         8lX82qrW4QF+SJOrRpjllMHX/oMBvaAWbFvlGsPYypkelnkFdb9IC72iBN88l4LuCE+k
         +A8fsnfu2MYL4MIh9kl6ucYZX0Bb1zTP0A3vuEGfte2WXbb67waTHDZGZy1TMYWrmJ7m
         x/hMSMtJ/rF/4ammotVJU4MRpKJtCTb+lS42JV/dInxB4vV4Z8eM6xldvvFtjbFwYuMv
         ZD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773212061; x=1773816861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lF5ZKsF6F7Qr5iBaoEQm8iifpJM4zWXRKtFu+dhnmr8=;
        b=M1DsZVzQFoL/XA4fbfA9a8hwMGU3qNn0OOLz32FGVPD3Ml4K5q98hPRQWEq2Os1koE
         NIZnr7y9uUxxAiXcqXoVeD1MP9c2wnz/lpM+ewePIWFILI9JPPGaIyPpZEJaDLamc4B9
         2C1GI3D0FbmEqN974F7pIZGbXPxLJoH3tbyaRHH9FowT3925zAv5Vn7DCc/heB2SLaqQ
         lGya9QEDuwOlYIjXMxXpZ5pN9Qc9NHhHu/r29qpR0R0TZoIYhH93zD7hf+qzEW3M7AXD
         FegtIlsAngQnnziTf+FKdIR0/BC+2Dtx4XduNOqaTyj8VpRYF5/3+It2LcXqSYtwnODY
         yTzw==
X-Forwarded-Encrypted: i=1; AJvYcCXJKQdU3U7E92NRDScSzBNgLHCbi5DKdcVR+bUCfI6U7OOVqmzOr7hRZxcrlFL9g+XRKsbL5A3ZQdRkiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIgOvUqXZpp5Dx28UFTcWGfNyfNZP0KH8W/W4lvfHoIbIdZOk
	51ZENXqabEJ8SVTROLxBtbxrSCwI9ltduHjnyf7DonWPLyorlM3TD0ofkjXS5jims0U=
X-Gm-Gg: ATEYQzxAF98gzTSb5CbMgg1mA0P+K88DDr1L76HdR70YFrHwCKb2UdsqTGkk9gmUDoN
	xyywCTCmSrdjakFLIVNJv7qbdiMErOwUnDnWjW2H3W2q/NUqwM3vsab5UOhXm2f+1kRNVrbPKS3
	iwEaP/fZz3UGYESScZYovSLfn94FkNRFJ+MzL4MubDQlpb8sAwb8qb1uzkbLZrfXkFjs5FyeH8w
	1N/lLfdHP8o86l4LEaQWhIo0a11j4eXNRci4PmGcpvthdHbd5+VNXGYhTzsii7kBPQRhr9rguzO
	nKI9uBNWKvOCh3U+baDBLaEFFrYW0/3Fju19xSnRpXSNyo/EFi/Yij+aZSKr1PEiI8NrkPes/jg
	O/305RPqERgCWduNKPj0PL+7XqnT4Y8uCqBu+Hk68oygP6Et9DBSKg14guODOFGEAqsljaLncYi
	bFMo5GxpJ3Kkpdas3GvdOzP8hhXSTS
X-Received: by 2002:a05:600c:46d3:b0:485:17a7:ba0d with SMTP id 5b1f17b1804b1-4854b131975mr21611215e9.32.1773212060586;
        Tue, 10 Mar 2026 23:54:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a307bc4sm19730455e9.3.2026.03.10.23.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:54:20 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:54:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 06/28] media: staging: atomisp: Remove unnecessary
 return statements in rx.c
Message-ID: <abERmUmWxAXm5dB6@stanley.mountain>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
 <20260310-atomisp-remove-void-return-v2b-v3-6-3fdddab41271@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-6-3fdddab41271@yahoo.pl>
X-Rspamd-Queue-Id: DF77125D17C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55310-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,stanley.mountain:mid,linaro.org:dkim]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 10:39:17PM +0100, Tomasz Unger wrote:
> Remove redundant 'return;' statements at the end of void functions
> in rx.c. Void functions do not need an explicit return
> statement at the end.
> 
> Found with checkpatch.pl --strict.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> index 9cfb8bc97e24..bf9be11335d4 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> @@ -44,7 +44,6 @@ void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
>  	 */
>  	ia_css_irq_enable(IA_CSS_IRQ_INFO_CSS_RECEIVER_ERROR, true);
>  
> -	return;

Delete the blank line.

>  }
>  
>  /* This function converts between the enum used on the CSS API and the
> @@ -197,7 +196,6 @@ void ia_css_isys_rx_clear_irq_info(enum mipi_port_id port,
>  				port,
>  				_HRT_CSS_RECEIVER_IRQ_ENABLE_REG_IDX, bits);
>  
> -	return;

Same.

>  }
>  
>  static int ia_css_isys_2400_set_fmt_type(enum atomisp_input_format input_format,
> @@ -638,7 +636,6 @@ void ia_css_isys_rx_configure(const rx_cfg_t *config,
>  	 */
>  	input_system_reg_store(INPUT_SYSTEM0_ID, 0x207, 1);
>  
> -	return;

Same.

regards,
dan carpenter



