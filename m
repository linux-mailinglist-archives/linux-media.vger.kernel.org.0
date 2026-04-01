Return-Path: <linux-media+bounces-57847-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLOZCm3hzGm0XAYAu9opvQ
	(envelope-from <linux-media+bounces-57847-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 11:12:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D18377564
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 11:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97DE03046430
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 09:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6D13CC9FD;
	Wed,  1 Apr 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW7kgTJm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F273A6EEB
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034709; cv=none; b=GeeSeJnkTx93vqkB4zguT3kYnsRBIYfqtqPXjiWxuixXEQoVTHDymzK+G0tPsyKeizUGOQ6Rh0eQU/aFHx3lhToFJBTLlaxYvqUD5TQD3zh1y86gSOrbmN/FXSHwC494vyLfeTsVP6bOmFYOTouQ7W1DYr/830dMaPPcEXF/TGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034709; c=relaxed/simple;
	bh=//Ff137ItcAe5Ga2LCorRIy8/izw4y7+oMbb8vVEi8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwgqZZbiuRV13jBIJJ9MURk0WJjtxf7lZ7908EB+AjeqxHVAOWU78evXC2BbZBbYPvKKWIO2VXS7dnVDnyYS5G7EHt1CkMXQiaboBken7qsLJcajNm6Dwi6c9DieZ0B3t4ApKunnoMO/3P+ye7T8psVPijrFOWr+Ba2CSun0kuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW7kgTJm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so66325455e9.3
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 02:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775034704; x=1775639504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GU2MYtgtof8zhGg7Ukz6W6ZgS/Q4jFeOlOLWhznUGu0=;
        b=YW7kgTJmmw6y/ie63CWy9Hr1fkceIYROLSpjR7VHWWqzOoDxoKX+sMW32vHtaS6tq4
         rWnAcpiCJho3Wx7jbwXxMdvUHtToYXK2Ujg5ML2SiF7o6tXQvaY9gLJGwMiDdAGaUBNa
         3M2cyM0LixwO+Ceb5LTq9iyd+C7rGUtqqcgj99lCEqRSQZIWX2HpENnC5wIfKx/Ur5Yc
         LiW0nz7da+UKPaVAzgLr8TDSIVTGPK/rQ/BMS4QmdTGbwXq5KQlVXW4TFCHEhXjXPeXk
         5CQVqiRFxEWwKYE7BcFnB8pNDF57dMeOfFeeIsG6WU6WY7WBCJd/jV5SfIvWgAW5FmPD
         bXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034704; x=1775639504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GU2MYtgtof8zhGg7Ukz6W6ZgS/Q4jFeOlOLWhznUGu0=;
        b=mtos0DLW18yD/y5Xf4wwXtds6iTcOo6RaHp/TpiHGwDQXnby/k4Ms/RrQxqC6rVYp/
         24wzw6w1eaiatF+BTBJyVqr0BOnZlfbCD3qRicqS+Y7qtXRe3KJvEckOVfpF6sw4scH6
         OMhj6uki9rerJuxzgXk82oTeV3UTMokH++JJhEHwKTIfrLGFImPhN/WxTf6KJAoZJFZj
         yQBaOKeUniBoWSGmgQ5HbaCY22BCEn0iTPH16b2mILnHTMb7qdo7Rnbc5ed08ndFZmHG
         /Kh6M/lg09kGlIUO3Ipm9N+B4QlDmlmj29USp7rTxqXZVoU0QIW3GBY0NOO80+rv6nkU
         QdvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcyM2Q/rK3wprL1NnbiI0we0zH5QhYQj5de2yT7ObH1EcgBSr7Cs4hIu54q1ay8MdkYfwKyP35cd1ZQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ9lNmVPKEr4E5PnCahJBgFYQFZiOwUN59FpmT6AsED51ELiFy
	XvK74TkmYuNqQ6ZK64+FqlBLkcmZT+J8Kw0JIOGUjxHeN5c5R0Wx6TZX
X-Gm-Gg: ATEYQzzU3EC/YJKeGJszU3ytwTijbbRLrC6KCsTcG0X83CscroF2ywI9EMKCJeyBUBV
	AlJ2MkktaCDo6JXxgwTdgfLhSs8K3Unblysse04ntFAtl6hMWhYxU3+VWmGW7MhfDvYqM7UkPZ/
	UEyVZUI9TiteMkEJFdnOSHRWed8lcX628rmy1JOv5s2/Bu6sd8Zxuu17jN867sQCCuA03rPT41n
	D2VU4XuReBI1xKyqpHZYlEnnKoPrBRO9rpIJ4z7cR6dH7P8bMe59CZ9Ui1QqhMoIQM9e2x2UHK3
	BVGRU6fX8n44AdTeO+jS2iEAdBA4/zjUQoDFTVMvbwHtlGoPznbYaYHKZ8IhT9yIK9V7Q+SP2a5
	Ua0PUz6ysuWDpXcHho/WaPQNB+mNdLde1+wE6V/Pk/4Sehau9hzPvfO4zbv8GBkrYxr00ctVV0b
	Xj8izG3QIjG0gXszven7k=
X-Received: by 2002:a05:600c:8184:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48883575bbamr42898405e9.8.1775034703589;
        Wed, 01 Apr 2026 02:11:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf257cbc3sm33508339f8f.35.2026.04.01.02.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:11:42 -0700 (PDT)
Date: Wed, 1 Apr 2026 12:11:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yuho Choi <yqc5929@psu.edu>
Subject: Re: [PATCH v2] media: atomisp: gc2235: fix UAF and memory leak
Message-ID: <aczhSwl-PQKQ83AR@stanley.mountain>
References: <20260331194727.52054-1-yqc5929@psu.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331194727.52054-1-yqc5929@psu.edu>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57847-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,infradead.org,gmail.com,vger.kernel.org,lists.linux.dev,psu.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid]
X-Rspamd-Queue-Id: C3D18377564
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 03:47:27PM -0400, Yuho Choi wrote:
> gc2235_probe() handles its error paths incorrectly.
> 
> If media_entity_pads_init() fails, gc2235_remove() is called, which
> tears down the subdev and frees dev, but then still falls through to
> atomisp_register_i2c_module(). This results in use-after-free.
> 
> If atomisp_register_i2c_module() fails, the media entity and control
> handler are left initialized and dev is leaked.
> 
> Handle each failure path locally and unwind only the initialized
> resources. Return success only after the full probe sequence completes.
> 
> Signed-off-by: Yuho Choi <yqc5929@psu.edu>

Needs a Fixes tag.

The design of this code is that gc2235_remove() is supposed to
clean up from every type of possible error.  This style of
error handling is always buggy:
https://staticthinking.wordpress.com/2025/03/31/reviewing-magical-cleanup-functions/

However, the commit message does not explain why it's buggy
in this case and there are still two error paths that use gc2235_remove()
to clean up.  Please, could you fix those two error paths and explain why
we cannot just do:

	ret = atomisp_register_i2c_module();
	if (ret)
		goto out_free;

	return 0;

out_free:
	gc2235_remove(client);
	return ret;

regards,
dan carpenter


