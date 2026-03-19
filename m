Return-Path: <linux-media+bounces-56348-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKwKB0QavGnDsQIAu9opvQ
	(envelope-from <linux-media+bounces-56348-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:46:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CB12CDEE1
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82C4630AD4AE
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82B73E8C4F;
	Thu, 19 Mar 2026 15:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqCe4R07"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82F41A9FA8
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935162; cv=none; b=IbI4bQf/7IrZMqvxurfICjAna7m0GVZOvXsxQK40qp/ymsgcctPc1nLyGBBHQBCQpUpQ021xvPBIEwxIvLC0Muqn+D1Zl7x2WG8ldRA8xROpBEyGO/YGlxYoUtZbT5UHRQeKP99bJuTy2XCaxLnqVzFgG1MFmJDF82reIywLbvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935162; c=relaxed/simple;
	bh=pCFTkv1Ku/csYKyILAUOeI6T1dn09foZagdWgw9SkI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRui2KhQvdcGynti9r+2FT9+FW4tp6Z8J1+s4HHQMhKpSiSbt8IDY+lSG2umIVrbOsJomCc3J+5zzacwRSL+s/+7GWA+wldlmUEf4adLfp8yCp3GPpanNITKZxvwWmIP75aKqZ1OjTarIt4APMWrfQ19UJsPuTWzTy+uLdWNtcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqCe4R07; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486b9675d36so7156375e9.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773935159; x=1774539959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Va6JrB6OOSwxW21r6IE5ejzpZQanwoUukytTkQ2lYmc=;
        b=lqCe4R07FhBjlVnuFHqb8rQAWCCk8mKyUMn07Py3mDXJFVVX0CLwiYwKx09tKeHQvB
         SpWUioDWaOXqSdwlDH+auoM71a2wDpG3bgO62BGbO5lvatwGqCAzDV7eL7Jj2qPZ/I7W
         XjG8500Azm1RTwQkpxMxeSGDBk3M+mRZ/0M1ajhq5rJIS09ZYfX+aOIkibaNUXs+fq1T
         EqATMlJOG9PBterhuDL6wMeJT+oOv3/KOPPsXZu53Mzv92XIadggR8yJ5w+D4tph/xBs
         mj9lKNVfsZbDfl823uAYuzrGkorXfgkFYYBcqWL4PaLkANf7VRO+SH7vW6rCdzDFWuT1
         dXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935159; x=1774539959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Va6JrB6OOSwxW21r6IE5ejzpZQanwoUukytTkQ2lYmc=;
        b=cdngf0v+pSJLLZQEjy/GKCAqLkIfg/7+iDtq73RL1Sac19SnC5dKI6xynsy5yDz+QZ
         a8oY9Ht6fkLu3iTJd4sBOS900PQLEUDPm1G4iQUn25TLiW8at1Kka2mGebFAXAinzvqf
         U+nLo5dCpabl1jXEY5yRP6eYgR+mDj7saapHaFzOhK9uDkjZYC+dvuCmWUqnffpWecy6
         4oOQT+4IGh7VIJ/Eo68be5VdBxV4eb3Pp8QMrm70y0E3crprIt2lHowxv1mp0GrynPyx
         yGFB9gfLg2QQqZZQtjevvVvarLw/NmH7qRdHqCid6Ety/HjAv1idesOfQYFOYbasE/0s
         rJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyXa4fPuda9yIDWkNCyVq5KKiyPL2VWllTqKAD1vLmje/GqoL8A8BRNDReXCjFLCeihXL76S4j1b+qsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFSePNl6bfNO2NHsZVXlLoTHnw03Tmg4EAHEFeuWxT1+l66gD3
	2pUfkshrbnsV/pZYArCsM0gfx896Id0dym2RoeP3onYJheFCi3a3TeFO/olfLW0pNOwRUhB9D+F
	m1S9l
X-Gm-Gg: ATEYQzwysxDloZ2Oe1DQ7uVkaa/UQum6zJQN4sFp/kP+0vszQ8/+0yR74lOWw97wkaI
	hs9Gj1ZiGeVkXIALPk5caG97v1yCGnDEQmhYBbNgMT9KL79u6mITxfdLu4Kv9i61Tl55CGaDu09
	0vMJqdxXLHvih2fOlNRqMdTIahJ0U1k2mpjzt/JtfMPe5DURkrd1cp8nbdY46Ay3MTcuhOe5bvg
	nY4cH5tLka+/1MiYqF2qkqPlzV1bT6cnz/uLB5MOgtzxDFJ48cl+cBxjxDlbW+wwseyLdbQffyL
	HIVJ8L/wqUxDbKedxJT2l4KdBnoyRlKhiOk9MnWQx6FWxG/Ndic0YlKNyPRkFW+4EZOjD5WDMbO
	F50V5wf0kkBpaXptzHY/C6nJ1EHWDcbH1TrmfvTp/YTT5GTXK3ZyJTPU/9Si2xGTb+JACe3SZdM
	TGAPmbRkwyC2L3NQOHS9cuAcXFJOO5
X-Received: by 2002:a05:600c:c8d:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-486f446d8d7mr128184935e9.33.1773935159110;
        Thu, 19 Mar 2026 08:45:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c53153sm76662745e9.13.2026.03.19.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:45:58 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:45:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: remove dead code in av7110.c
Message-ID: <abwaM9N8D34zq53y@stanley.mountain>
References: <20260319-av7110-dead-code-v1-1-da6e76804817.ref@yahoo.pl>
 <20260319-av7110-dead-code-v1-1-da6e76804817@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-av7110-dead-code-v1-1-da6e76804817@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56348-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[yahoo.pl:email,linaro.org:dkim,stanley.mountain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67CB12CDEE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:16:37AM +0100, Tomasz Unger wrote:
> Remove two commented-out lines of dead code that serve no purpose.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Checked with scripts/checkpatch.pl - no errors, no warnings.
> ---
>  drivers/staging/media/av7110/av7110.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..490963c0ccce 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -314,7 +314,6 @@ static int DvbDmxFilterCallback(u8 *buffer1, size_t buffer1_len,
>  	}
>  }
>  
> -//#define DEBUG_TIMING
>  static inline void print_time(char *s)
>  {
>  #ifdef DEBUG_TIMING
   ^^^^^^^^^^^^^^^^^^^
Get rid of this stuff too.

> @@ -762,7 +761,6 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
>  	u16 buf[20];
>  	int ret, i;
>  	u16 handle;
> -//	u16 mode = 0x0320;

At that point, you'll probably want to split it into two patches.

regards,
dan carpenter

>  	u16 mode = 0xb96a;
>  
>  	dprintk(4, "%p\n", av7110);
> 


