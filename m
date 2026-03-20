Return-Path: <linux-media+bounces-56506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI7yG3YVvWnG6QIAu9opvQ
	(envelope-from <linux-media+bounces-56506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:37:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F4D2D820B
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D7AF3053762
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC27A385535;
	Fri, 20 Mar 2026 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLI4IOsN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CB538657E
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773999454; cv=none; b=ixrrniR4bNO7+/9B7vSxglLbBXcUn7Vv8sAui+R4THX65mOv1AYPWlziXWnAh8Vj6HNl6JzF1MQPmM36kJPh//EkveVGQZ2+XHoSyobMht+aR614A8z2cgVrTX7xl5oGLh4VnXItpKj/Pwn9xlivilqBkziejIadnljxzC/5bSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773999454; c=relaxed/simple;
	bh=/RroFt/aDThaig1a7ciA5DMyFlmPG1G0vZnwb7/wNb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0xIDoYXjn6mV0zkGQTMBOvuKp59hUns8A4KSkNW0JEFLAf+nBLPjUTlcPNPFKB72Ufgm+TGBKOVOPX203ozhX78uenm5H0VlZIA5eaakYbiGA0uvoIRSffCFY/A9e6/mxMEutkTTnov28CqfFEK/musr+BBgKMHkpywcBOPlAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLI4IOsN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso4476445e9.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 02:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773999448; x=1774604248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eD4dBMvjtmZ/uGxmRy1So/8YVPy0MK5aKa2M09OXdww=;
        b=mLI4IOsNodpyfdYPs/3nAj3/qLlMYjxybpdfUFRWNXrxvvxK/uU7FOd7jO+SLzEdeX
         x9ryKe+SJkhW5gzAz/d/YNEiXfKBgafuUevD51gnAI4N3pnst87cQhUMsHWropHiH0Xi
         J4JrNQyWlXDjJzWYibHd+2zTtHJC9Xj9BfADpbARMaFAcvAhAGYpDvdvRheR9u3fnZly
         Fqxsi7uEoCNiCgTSJDwxQYa/3QY2wlP6Z6ttssdBp+pio968FIw3+HgXHPScguXoeS6J
         0PQvj3djI/c7VgZCQgo7mj0Dqw8RPeW2jyXUxqIFxS/m5Fx+QkyoVv71Af6aFfu1kHCd
         wAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999448; x=1774604248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eD4dBMvjtmZ/uGxmRy1So/8YVPy0MK5aKa2M09OXdww=;
        b=Vvxfyc88rutLcwjtBhbUO5t6bd1lsk3Gy/p/6rTppMmkLpVt4j72SHz4gpBtXhn17r
         xZCOWax4kOnGPXKfOUGeOSrqyAFt9Z4nhpp0FTHxtqeWDq1d/iJ+5QuqyEWDFwEd+lih
         AuE4bMX1WzMNNEeGgvXrchJivRWxRtplIAGpPZVS60xCXmRe+uQ5MU7MR3QKBO25tk90
         +gfUv0Y2mgZaqfDcNE9d4y0FLVWoSeroAIfSo0cqZJIOzo83V3oSvpUbVP/GsMB46MOL
         QvTOd87MqGl5JswMstN3REOLMQaYM7/iCRy6o8jMOlU2dbcTDFcUm+rAFCi+jgFtg6zB
         6z+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWPqLcotl+Y/SBmrEQ+F6ZY4ZFxRXcB3/4dDMh9ijyUC70FX/KWuuhhPhBZGsQ6I/Q32l5XKnP5L6Gqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgM8vrHv8gndVQawJVyO6jF/S3o8BUaioCmyEYtnveZ1SiXxsk
	1Yc6AhpzxzdJtSv6ZKvUG6R9XhggaKU9iMCFcl8bcvR5SSVyIF6oIvmg1C0jOdz1YD4=
X-Gm-Gg: ATEYQzzqiNH/UJ4lRV95Odi16OLQUq5/wXPBiRw5nKqh6gWYGbfqxijnu39BVE5CzjI
	DLf3BYKva8Cf61bEySaBny65JXo2QIjs/8BqRNfekYRxWs3/m4T34FICcTu3fiEI6BlaDK2l596
	DYLC1rn6hnYC5m2yIUtF9CIXIuAjCA4yr+UtUVrT139SrDSGFUmsnnphkWGgsUNDu0ySHQvtzIm
	b/gD5zmK0pPj4EfVvw9sRUur/laSHX/oLZOnEDH35XDsUXVb4kXOvdWq0t9aJjOZX5Nt2seh6N7
	v4iIrnQE8tlwebm3yASVyT/3cKw0Cnv0hg4SoyamifEMMKDNriX3o5gsRc5JubRKaJgLPvqFPp3
	NxjZyuFpJsdFeGA0ocA29A5shS2FXQ4GqLyGh06O2HYoj12VpO08zc8RiLIwprZZJLgzZ3rfLvg
	F/eUB2x4Kdx36RUTptaqg881qvy4Xk
X-Received: by 2002:a05:600c:17d8:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-486ff0291d7mr19670865e9.19.1773999447715;
        Fri, 20 Mar 2026 02:37:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae048sm5267437f8f.1.2026.03.20.02.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:37:27 -0700 (PDT)
Date: Fri, 20 Mar 2026 12:37:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: remove print_time() dead code
Message-ID: <ab0VVFimveEhibR6@stanley.mountain>
References: <20260320-av7110-remove-print-time-v1-1-05402287078a.ref@yahoo.pl>
 <20260320-av7110-remove-print-time-v1-1-05402287078a@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-av7110-remove-print-time-v1-1-05402287078a@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56506-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,stanley.mountain:mid]
X-Rspamd-Queue-Id: D5F4D2D820B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 09:46:15AM +0100, Tomasz Unger wrote:
> The DEBUG_TIMING macro is commented out and can never be defined,
> making the print_time() function body always empty. Remove the
> commented-out macro, the unused function definition and all its
> call sites as they serve no purpose.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Checked with scripts/checkpatch.pl - no errors, no warnings.
> Compiled and verified by loading the module in QEMU.
> ---
>  drivers/staging/media/av7110/av7110.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..9f4ed1e24b17 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -314,17 +314,6 @@ static int DvbDmxFilterCallback(u8 *buffer1, size_t buffer1_len,
>  	}
>  }
>  
> -//#define DEBUG_TIMING
> -static inline void print_time(char *s)
> -{
> -#ifdef DEBUG_TIMING
> -	struct timespec64 ts;
> -
> -	ktime_get_real_ts64(&ts);
> -	pr_info("%s(): %ptSp\n", s, &ts);
> -#endif
> -}
> -
>  #define DEBI_READ 0
>  #define DEBI_WRITE 1
>  static inline void start_debi_dma(struct av7110 *av7110, int dir,
> @@ -353,7 +342,6 @@ static void debiirq(struct tasklet_struct *t)
>  	int handle = (type >> 8) & 0x1f;
>  	unsigned int xfer = 0;
>  
> -	print_time("debi");
>  	dprintk(4, "type 0x%04x\n", type);
>  
>  	if (type == -1) {
> @@ -473,7 +461,6 @@ static void gpioirq(struct tasklet_struct *t)
>  	txbuf = irdebi(av7110, DEBINOSWAP, TX_BUFF, 0, 2);
>  	len = (av7110->debilen + 3) & ~3;
>  
> -	print_time("gpio");
>  	dprintk(8, "GPIO0 irq 0x%04x %d\n", av7110->debitype, av7110->debilen);
>  
>  	switch (av7110->debitype & 0xff) {
> @@ -2785,7 +2772,6 @@ static void av7110_irq(struct saa7146_dev *dev, u32 *isr)
>  {
>  	struct av7110 *av7110 = dev->ext_priv;
>  
> -	//print_time("av7110_irq");
>  
>  	/* Note: Don't try to handle the DEBI error irq (MASK_18), in

Delete the extra blank line as well.

regards,
dan carpenter


