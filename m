Return-Path: <linux-media+bounces-59572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WETfOQM/7GlxWAAAu9opvQ
	(envelope-from <linux-media+bounces-59572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 06:11:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C8464ED7
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 06:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 145523011588
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 04:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD778239E7E;
	Sat, 25 Apr 2026 04:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtWIW1y+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1400578C9C
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 04:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777090296; cv=none; b=p/35JkC2K7UgdE/QwhMLM7jWWqTkNd8Okh96Sp0S/rIsNAu5uuZcMrwDmxTAkhM7+SG3FRV99VHsLSNMzQ7QRPtJnvEgrmekgGeKWaTAJ96b1Wp/0rJxI/0kSxLOHXUZM0tvMm689I1BVoaftIvsR73D17ZXOtghtjYJe0LBfGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777090296; c=relaxed/simple;
	bh=GW4l/R38TjNz3L8O5Art7qT+FhN1yKPsNIVdCQ5t2QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWTms84N706O7zdeZ1vydrKyBr7meYM92aiNIOPTTH4iA6f464uSLtdSGg0uK1KmkeWJGrnY2VkoiM/jVxHq7NCLAtbnEdGkSho9/BvCWCTqOadNJjcQY1PnlZC6sPTnUXGWUaI1p2euWZJgf8dTMUx+UMtO9eAJ3lZez1hOEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtWIW1y+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35fc2b18363so9488819a91.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 21:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777090294; x=1777695094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GW4l/R38TjNz3L8O5Art7qT+FhN1yKPsNIVdCQ5t2QU=;
        b=KtWIW1y+OYKmdPxv9inJgEjvnjGZ2BptEiWxHr5o6ikTWzfBb+VdD73sirXsJv2OKk
         WBuihTMGS+wMkjblaLEkPumeTeJlj7UQ1pMPt0tCQ9FygFm7kHs+tuLrlorxsE0AoQ+l
         wakaVQsw9OOYqcUL01maeRK7Hy9rjnrd13VIVxFH8usRv0IaAxJqEEtDkqWzPEe2UT1z
         D9WZeMH1anAdiq5nT4ZIIPEhVRBSii2uHcR6YJCz04XIBoFL7o1TRkF/ZHTrS2wrvxBD
         O+E3T6E3n4nWpdQMBSXFeaiSCfgpqFnzyM3nARbpbKp7PM6S5aCxqP7dKuroT7Mp/S2A
         dQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777090294; x=1777695094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GW4l/R38TjNz3L8O5Art7qT+FhN1yKPsNIVdCQ5t2QU=;
        b=ULvu+UY1D9egKFABvYccJvWFCL/zDH9XjLbu1c8iHTq2GWT324wmYqbEugLDn5uFjR
         9PQknAbz+p/pbaSRA6K5/sSmrJw1WGQiITg4m6B009yXeypBM9yBD47Mhondo6VdeO4a
         o/M4tT0E/zOGh8qLQ84rm8j/qiQXNBKEOkP6CBoIEGNdO6h1jDeuJ9HOFVj7FdA6BQJW
         eU9y43U1X6kik0bm3gmvjG4JN8pDUYSipS2BZdBTfrF2AKi9+qe+pFxi7S7uuzI/WHAb
         OLodhd0FiS62N/fmm96TqPtZckS3gYLupE30qtYEFylylTusNF/X07liIo7Qr0dy12LM
         oxbw==
X-Forwarded-Encrypted: i=1; AFNElJ+7qXp6edTTtf2kAL+8hbVSdvck+oRlxAMJYCrTrI/YeQUgYzr4xDaHhbIpYXWyk9wLtr4zCPpp4xQLYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDDbcgc0LUkCXRlapwKESpSrveRC01vq1zlNZBBGuGBqTGB1Xd
	+1/a3BpKlvDq3znsNzr7SnIymMrzad7z9cJw1xBgjRcW4V30c6KkHDYw
X-Gm-Gg: AeBDietQufTWm1cFK3YYRsxfnEW3TzVRlGGk9Ogng3FVDYBkKXJGt35/RTIyJ0JuSX3
	M9l2u5e0iKmJ9L+wVKm4Et+8MWjx2Ayaa5TJjyso4hyI3eQpkh70mDlILptvve4rxqtxcIUHJAM
	YSORCzS9C/aZ7yl4HOXcOLn5qgfdndU8Ns7wqF9piR+D+Oh/dNrDU1STFgPgS5td+7ll7+yaoIw
	djk4ZPXv/GrrUUQD+M29IdURaFvN4Gp2HwH+4rkR9HQ21gWdIAsQckps99ZuPZ6VbZCl42sHPgu
	DHpqrfKU89JRr+0BDoKA5SPZ9ytTEB4e84/7Fxa4j8grvpIoMWLYQ6v0KEIYudkW/6AhUb8e2Hr
	2yZVSGcLifNZ0/MDTH4cVEWW6pl3K0GmAQuI4wi5pGnyeCsQwOD0+lSJ+VlFvlWL4xKD+HFX5lH
	duIEk1GVZeQb9DKSUCjA5cdUNwvZ9scRccrg==
X-Received: by 2002:a17:90b:3504:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-3614046f76amr38398081a91.18.1777090294301;
        Fri, 24 Apr 2026 21:11:34 -0700 (PDT)
Received: from soyboi ([158.140.167.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361417748aesm24262122a91.0.2026.04.24.21.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 21:11:33 -0700 (PDT)
Date: Sat, 25 Apr 2026 11:11:25 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH RFT v2] media: atomisp: Add error check in
 create_host_regular_capture_pipeline()
Message-ID: <aew-7ecz_4MCfu4t@soyboi>
References: <20260424081538.459564-1-robertusdchris@gmail.com>
 <aesudPcQ8Fec0_VU@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aesudPcQ8Fec0_VU@ashevche-desk.local>
X-Rspamd-Queue-Id: 323C8464ED7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59572-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robertusdchris@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello Andy,

On Fri, Apr 24, 2026 at 11:48:52AM +0300, Andy Shevchenko wrote:
> On Fri, Apr 24, 2026 at 03:15:38PM +0700, Robertus Diawan Chris wrote:
> > When calling ia_css_pipeline_create_and_add_stage() function, there's no
> > condition to check whether ia_css_pipeline_create_and_add_stage() throw
> > an error or not. So add conditional check for the return value of
> > ia_css_pipeline_create_and_add_stage() function.
>
> > This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.
>
> Unneeded detail in the commit message. Use the comment block for that (as there
> changelog right now and other stuff you explained).

Alright, I will keep that in mind for future patches.

> > Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> > Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> > ---
> > v1 -> v2: Add Fixes tag (suggested by Dan Carpenter).
> >
> > v1:
> > https://lore.kernel.org/all/20260423060246.296986-1-robertusdchris@gmail.com/
> >
> > I am not sure if omitting the error check is intentional or not, but from
> > what I see from another ia_css_pipeline_create_and_add_stage() usage
> > in the same function, we check the return value after the call and return
> > the error code if it's non-zero.
>
> Okay, while this observation sounds like a +1 to the suggested change,
> you still need to dive into the code and try to get if
> ia_css_pipeline_create_and_add_stage() failure is fatal or not for
> create_host_regular_capture_pipeline().

After diving further into the code, I am not confident enough to
continue this patch. I lack the context and not sure if this _seemingly_
small change can have a big side effect for the overall driver.

With that in mind, I will not continue with this patch. I will try to take a
look at another driver.

> > I also don't have the device to test this change.
>
> It's a pity as this driver is quite complicated thing...

Yeah... Let's just say it is _a sight to behold_ for newcomer like
myself :)

Thank you for taking the time to check this patch.

Best regards,
Robertus Diawan Chris

