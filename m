Return-Path: <linux-media+bounces-55311-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELMuLBwSsWmYqQIAu9opvQ
	(envelope-from <linux-media+bounces-55311-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 07:56:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D0D25D1CF
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 07:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D054C302F4D9
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A7A375AA9;
	Wed, 11 Mar 2026 06:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aemBe46t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1672DF153
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 06:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212179; cv=none; b=RXWSycSYwZfgsR/jesH2zIvnevhTujZ17FZ8a1DlxH9UkWuxM3RzCORQxfwXnFWu/rYtGAcK+FRuMQD43gJWzJMLwjNKaRIcI85jDFaGRLqv15IL62gG9Ynyt67J2WCPj1o6NFyHqnAODcygA7EfslfqurfPA0SXlBX1uf+YeuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212179; c=relaxed/simple;
	bh=wbO0FXJ0RHu16QVceMlJ5juIdq1hptM6wSl2zq2Fmg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQANTLUnuvI/JFgn645zER7orJKl5rOl8h1iNzjW/0tz1JcXS05gxMqE/rGxtfU6+36CxWUk2sSCs8ZoA3aXEdvK+P8jQaNcYjXVWe3kRNC84k5Wic3/wProjItFQgnWWMZex4XFEvJ+W3gH11V/y/nL9JA1x8wcO3gt6gaKVDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aemBe46t; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48540355459so23018325e9.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 23:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773212176; x=1773816976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ062ZhnCTB6E4HEjtqVPgtjYSl8H/qH4Kr1bdrYG1I=;
        b=aemBe46tG/2IC8425THccm+lFQgzxnMRrAatV8SJD74kG5SMePKMKCz9NqQ9CU5CqR
         HYGPzljSQBgOS103Xk+8OWEyzAuwnbJTskqzudQXxgZCXGF3V1Gm+XgEGeuaT83j3hRM
         igoyL4PS+bm2oJDENxYDvXM3mPIdrnwwPVvdgBHv8H2mATiKwrUdE9sIQiuSz6c35fBL
         vifQaDaXDYhxuQs7LwqWCSyG1Uwamw8j63TUhMsprHbFh0O5rBEKdDlwcdTT+pouHnba
         x3ceaAk19ftIx7TqJcN9e6QmJD5goe2DhScMJwhVaK1H7CJ1Pms1ML/zAyQ4WZJXBNfn
         /spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773212176; x=1773816976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQ062ZhnCTB6E4HEjtqVPgtjYSl8H/qH4Kr1bdrYG1I=;
        b=sbD8yEOmLWl53iNd4DgMDXmLcXEBmmE9TNUcnLHgjrRQZfL3zDgmTKxrzarDawy3jo
         877qPXBV5PI5snG2bsVwRfFLIhQgZ5KfzfAWLz0Ju5gYooYlvaPhijWoTKJfvKQdAPMA
         fE48V8/QPmFgF/EFnw2989G4HtOcIb3GvmP+dDWcL8k+6oBSZG1NuUu7kY8tjuViZ2V7
         M4L1Q0lEScuQitAC20ovsR3oFs8W9rfzZIchaTlANz8T1ZOV0FgnVlReGgXbElNqK9ul
         IfttwwGWLEp27P2IcL/Es813jHnxA8ujEkAI0eI0pAJgq5I4AQxU5RRaslwb5MKuWQUk
         pcBw==
X-Forwarded-Encrypted: i=1; AJvYcCVCOjtXH+waDj+9AqrYTq9/Co4RPlI+JasfzD2wVdoyIkbx2G+26xLeB0Mw4EMMRVVwl+av0k0jdjwmjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8lpL5giJyme0lHYQPPxrZD42qMoRBzvnd3cYrQuQ+kbdiESUc
	IsR5M0QIclnospTXbhbC22thOwfOWjmS+NvOmonbtUWYJgv7DzIYsraqR6ks3Ot/VeU=
X-Gm-Gg: ATEYQzzqo42zDsKQ11BVUoD9JRUKURvKCqw4uTc1Cxg3qY5UyfInsla2dnjax6AWkyr
	j4vZhRDCp2SMdebB6i+bMF2VvdObQ0/uLVvj6arc2GjpVqYAZhbZiKGYYAViu/XxDeDRkKbaFHF
	ptWR6mOiU3zqizQi4k/Kx9aCvhVSTKO8CFcfyyTcXyIlvlbG/E3Vl/C+QEqVg036f0rJ9SCDS+a
	fTRFDo3d2vX99R0HOxe6eG5WrJ0E9FUegzSpxFpBNtWO7PnKNMsdXuqTOoamIrF4AtPk4tx84/g
	WALvVr4k86OKzORCZa/0SSBlSe1BxiNSHc7foIequAg/atMecl1sR7rxcwueanmK7XHySuDFvnN
	b4TXJ9NDq/eQZ9KTna6pS88MYcn+5M4NiFlqVYPA3tWl1gQGQVQQIK0rH6qZkaZXzw//V3ae9Ux
	NBlz/HnVMTg6/gg8tsAZn3IgklkhPk
X-Received: by 2002:a05:600c:1f96:b0:485:3bb0:194 with SMTP id 5b1f17b1804b1-4854b129e5dmr22302105e9.35.1773212176396;
        Tue, 10 Mar 2026 23:56:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f406sm124192055e9.13.2026.03.10.23.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:56:16 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:56:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 08/28] media: staging: atomisp: Remove unnecessary
 return statements in ia_css_debug.c
Message-ID: <abESDdP51XffnQnh@stanley.mountain>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
 <20260310-atomisp-remove-void-return-v2b-v3-8-3fdddab41271@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-8-3fdddab41271@yahoo.pl>
X-Rspamd-Queue-Id: B9D0D25D1CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55311-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,checkpatch.pl:url,linaro.org:dkim]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 10:39:19PM +0100, Tomasz Unger wrote:
> @@ -809,7 +803,6 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
>  
>  #if SP_DEBUG != SP_DEBUG_NONE
>  
> -	return;
>  }
>  #endif
>  

After you write your patch, then re-run checkpatch.pl -f on the file and
it will catch these extra blank lines.

regards,
dan carpenter


