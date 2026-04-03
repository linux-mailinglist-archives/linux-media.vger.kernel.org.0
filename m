Return-Path: <linux-media+bounces-58039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id deBqCTSTz2nmxQYAu9opvQ
	(envelope-from <linux-media+bounces-58039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 12:15:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C49139330F
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 12:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A55A23012858
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 10:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694FA31716F;
	Fri,  3 Apr 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md/+ixKO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8300B38D6B8
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211306; cv=none; b=oPJkFJxlsv1gzuCibkLie0BrIq9TFpWKrgpbDNP19vS1Bx0z7elW5ElCDjrRyux2g5B9NJqWXsfcccOdjaemjiBo1gGfuXNS+ToT3UN5XpIS5SSDCwNrGZsUEKzEWJuinROxP1nCQDRPpZK1p9K/yqcDX/yz9Sy0AIsViWnobz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211306; c=relaxed/simple;
	bh=SyUUY0OUraYJ9NeW9bdZzmQJTzmWvU8SgeyoY92B5GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZs/bE8Wo1ORzuxEX7BBX/Ly1lncrOpi7+MU7SkUUOca4aOaSP97JucuzwppR4jr69bkAjTJbjw50spt6DM3mH9T8QDt+MJbHt8wPYcxiuIH8NpXKheqz35I2LrcBgDoxxcwEEP65Ztz18w2sPj23O55VAG9tGAttlLdpbxNOKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=md/+ixKO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4889e045bc6so2776345e9.2
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211301; x=1775816101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IBSiSl3NLn+cVJFrXtGD+heTI7pWpTMEmoM71Fd2JxM=;
        b=md/+ixKOlipGAxUepY2eAh9l1MtKcOWWnADPl80HwZOK/bZxR5Q0tP0bYdtcBi5KAb
         gjc5hUHHb+odcE7B9elgN4+OFH0ZC53tkOjGPz7W1Ir5u0d2NSLJaMpsrI54K7ZVlWoq
         Mu5vbTSCyCi0DZ8gcrxcOo+QP4IByeV5+Alq7lOoFaThJGx7dakOrAe/9jRWHpj1yE6V
         atN3ol0afMBnYU/9xQpZ4eVUX5TVATUzUS8P4vBTITKBapjWfNDBlmAe15cwkpXi88px
         tnfmp7n2krjVS0qmQ34h8n8AFTjOUU+XjqKszJSQV1njQo3JB4Kiig8pIMzUlmgGPI79
         Nexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211301; x=1775816101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBSiSl3NLn+cVJFrXtGD+heTI7pWpTMEmoM71Fd2JxM=;
        b=JzBwU+MWX5y+NINoFnlTEHirapBPusEeov6nHVLSJR6D8Rq8M7Opzhp5dWFwGLTg4U
         HwtIyIwQcLxQE/R1kgh8f8ObE+IPfWaHVa58HJxg6vQYC7MZyMMarQ0iyx3tro92TnyX
         BWKcfOtpn55uIY+kCHJxCCoRwco8Z9ApiR07h+kOJ8uXZDWFn3qJTjPCNw88X90lqqIX
         X2qeFrVXlps9mzy77/1Rjan0dKfd18ZFXGDgRoIF8u4vRw9xoHXZQ/mxn64knb0kqA3O
         09QyuKcfnUz+Co+QZNRvle3ldAyZCqnKgUWON6zyPcCHdryJMp3ob2h5DxzBc62ay58W
         AWLA==
X-Forwarded-Encrypted: i=1; AJvYcCXV8Hj9bmn4mZvWU4DUs9N/bawWNwa1x3P28wg0QgqZLs/E5BUVu+Kcqt1AeV24mS/2x6euf4IMMNgCUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEakvtpT0FnPp4eIsEA+WEFjJKeQPd/c/Skfp4JP4kDjBse6TF
	htFvflLRznCp+9B6UyEv6eMeDgAM3pZT0mc5TSa6yMDkC7Y8ge0XgfXk
X-Gm-Gg: ATEYQzya3dUUP5jDRZ45GS+q6Z+ugRYGUshfI98m7dqMf1Q/B6rw2sO3ZrSRb5e/iL7
	jp3O8NaDffz9MTHqnk/hnlspufBB06QQGe7DMTdpYSvj2jCHnNFFcFmvu3nU1U4oAvS9bAdS1Ya
	4uCHCvDtHLMXOhYlwLXSIEKggQLrvzQIEWjhp2fKmYZOvxaRp2crvkmRMbkMJSwsRAMnRa4l8QV
	Ri34p2hnJcWqda724IiYg2ubLknBdb5xqBnjyOvS1ckQ1Ce9wAurOXmh/5GuMOM3cz/6qIxYWSJ
	34z7wAcDm8pqzJKsZwkupKXk0Uc5wwUakhNossySb45Zqs7Ae+jpD1Yv583dnUyoGfVhjzQrg0e
	YDi+INDk58NOqMcR3xff44CrL/xiIPvRe4NxtiKlYDfhy7XogDYwJAyOKziFQnkXZowVhiYLuww
	5nSy/YzLtaY+S19n+//ZdjdSF80PHX
X-Received: by 2002:a05:600c:3484:b0:488:7e6a:e70 with SMTP id 5b1f17b1804b1-4889973b05fmr41489825e9.9.1775211301303;
        Fri, 03 Apr 2026 03:15:01 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1cc5:ab9:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899ed9cb3sm16078455e9.36.2026.04.03.03.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:15:00 -0700 (PDT)
Date: Fri, 3 Apr 2026 12:14:58 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <ac-Rc8Lv7xmSVREX@gmail.com>
References: <20260402183402.444630-1-azpijr@gmail.com>
 <20260402183402.444630-3-azpijr@gmail.com>
 <2026040336-humvee-throwback-72cf@gregkh>
 <ac9864qwMrHuU8Sy@gmail.com>
 <2026040327-evacuee-bonfire-a922@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040327-evacuee-bonfire-a922@gregkh>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58039-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C49139330F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 11:53:59AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 03, 2026 at 11:02:17AM +0200, Jose A. Perez de Azpillaga wrote:
> > On Fri, Apr 03, 2026 at 08:42:11AM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Apr 02, 2026 at 08:33:45PM +0200, Jose A. Perez de Azpillaga wrote:
> > > > The function configure_isp_from_args() contained a duplicate call to
> > > > ia_css_output0_configure() using the same output frame index. Remove the
> > > > redundant call to simplify the configuration path.
> > >
> > > Are you sure the hardware doesn't actually need this called twice?  Lots
> > > of devices need to be told multiple times what to do in order for it to
> > > "stick", hardware is "fun" that way :(
> > >
> >
> > The concern is valid in general, but ia_css_output0_configure() does not
> > write to a hardware register.
> >
> > ia_css_configure_output0() writes into binary->mem_params.params[], a
> > software-side DMEM parameter buffer in kernel memory. the ISP firmware
> > receives these parameters later as a batch, not at the time of the call.
> > calling a pure memory write twice with the same pointer and same value
> > simply overwrites the same location with identical data, there is no
> > hardware interaction that could require repetition.
>
> Ok, great, perhaps put that in the changelog text?
>

ok, I'll amend it to the commit message and send a v4.

> > > Have you tested this?
> > >
> >
> > as noted in the cover letter, I don't have the hardware to test this.
>
> That's going to make doing code logic changes a bit hard for this
> driver, you might want to rethink this :)

mhm... okay, I'll keep that in mind. thanks :)

--
regards,
jose a. p-a

