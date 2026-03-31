Return-Path: <linux-media+bounces-57709-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F8TK0lky2kUHQYAu9opvQ
	(envelope-from <linux-media+bounces-57709-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:06:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 368503645C3
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93AF7300CBD0
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 06:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A18372685;
	Tue, 31 Mar 2026 06:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="snts4bJV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50276371CE5
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 06:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937008; cv=none; b=e886CeB+xHSuyiKlYt5CPtI93AdjfunYV42dh//1SI6+kmP0zzAIoFqn1SehwNQaZDGrTilRsg2M/Y94s8NWaaZu+gtgCLB2TNziJtuvQG20jZim+1w7RDfy386AE83CIChYjSl1byYCmpB2PbqWetcG/zejngjjBaFhMUVRdWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937008; c=relaxed/simple;
	bh=Hw2eRWNSq7xRJtzfw9eZamV77ZIiYuWvXdnIMcmHnZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMATziIb+tM5FI0IPC8ZP3yBHsLjSyonG4mluhltOcQmQ+d31Ol5iFSCzcNyS2F9fLQR4fZmjSg6QxRCAqqiZ6Bajpx2uUDp/BE6ko4g9bElBto7huQfK7DNe0NgTKO+uJL7c8p4y1uocacq6lZmXJxpWhyi6fMeuc/hMwmfHPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snts4bJV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso3004333f8f.3
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 23:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774937004; x=1775541804; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hw2eRWNSq7xRJtzfw9eZamV77ZIiYuWvXdnIMcmHnZw=;
        b=snts4bJVteUwyLcotZN8JGfE4yhVEh9rA9o5Zgx2HFHJhpl6oKUVoZDOJqlWr3dBEj
         yfwYu+lRLGvmtjDY1WLTvl+l8zw2cvNRcJnW9LN5W9hBBdJZQKPTQrQgsdovw52J1RmF
         vA4P9JKmRf8jdvEHMS31w1yVdaRLcdFdd7j6ecRI1eYq82rJMN4ykZ//Wx2wdmC+b1U2
         H7LJVw9XEs2RUCF0wOOSOiGYyve0r3y58lCtqv0nyASreeDbUARyLtEeGEqG63JQA6u8
         npeaVNkeqtN4NAcqhI6/M7BkkseaQpontZhDuJLeQ9GasdHAVOSvPwN10qK0/hXlvCpA
         RjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937004; x=1775541804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hw2eRWNSq7xRJtzfw9eZamV77ZIiYuWvXdnIMcmHnZw=;
        b=azkZgrDAmnps+AQC4U6ZONLdpTdruKLpAxLZpML84EvaitCFT/M6/P6fPZWQ4Qwb2b
         kep5nSzo65l0vPV8I77Kkdycn/pD7PZJQoR+0DZ6L3wrWoNLKm7TLdmzdcOzp7jfw3X7
         Idxkayyzru6VF1JNpgOHb46avY5buDBDM41w5NOBXp0iVvJhqB36V4qQDaoxs2HWgvcd
         LkEb5dEWWx3NtVm97ZFH2GW3WVr7ckxN6K+dM3XHWIYCsQsM725rgD94Cl6rYMBtyM2L
         77M3Gf9oU+pmjohnqdrpIBHNB3Akv+6SWj+0Y8FC9rGRzVrE8yePZobEq458To4+ZGx1
         bhUg==
X-Forwarded-Encrypted: i=1; AJvYcCXrgy55DOfbw3/f/fpAkltEh8xKKowA5c3t57I4BHzLJvb+NwI3w8rnv//68yEQsGm2vo9piyN3H910kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3U4/Yum5rn78tyD4FhD/n20MjKlinh9F5JpAFAKSvvqClYmUX
	CJgCckGHcpNajADTywOnkMbzHnUHSBu4VbUyaBFWO/JzOkvpmBiICul7
X-Gm-Gg: ATEYQzylkh+u9G+AtHOHQA0h8+QZRvtMrrCdENvUdal04SeB1jaFMLUVLymC5H/OcyA
	9WnWxVSNVxYvF9fEXH7tuTJhNTFWkYhFmfMv+iGvD31MsphX3gAqv7eE4LaWWQGY0+FjcVMyQQg
	t6/yXFVM4BWwm5VKQQ1WDTvWCmSj9+5Z/+RoixXS/sCp5yY+Y3dW0YwBHxXjO3kXneqm1oHZYVh
	kaVgcaaiesQ31/rX89+Vhald2insvUqRE8aKSrY3R3Xh9GXDtztlTl4E4um2Rm7HmwlEai9lD4s
	YtWqkjkPgZVqBxbCaqfi/UXj8YEw1o9lMcSTghNt9aa+p3KPOrd0VSVfyW2equZ8qxR/q+B+ULq
	wLNaMGhpC7vP9ppKXpTD3ZH5kCeSjIgcbCrK2irG4LeBoPQ0F3l+3sje/PEzBIUKeVNgJuMdMLQ
	madaHogMIkSjKzFxhQAV+TP933ruVi3w==
X-Received: by 2002:a05:6000:24c6:b0:43b:4582:e90d with SMTP id ffacd0b85a97d-43b9e9fadfbmr26415699f8f.42.1774937004525;
        Mon, 30 Mar 2026 23:03:24 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1882:1f28:c460:96ff:fea3:6e21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm27245180f8f.6.2026.03.30.23.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:03:24 -0700 (PDT)
Date: Tue, 31 Mar 2026 08:03:21 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <actitevm6DKddeWS@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-3-azpijr@gmail.com>
 <CAHp75VcOi_fhSGnYn0KzsRMdSFmFhzc1kzesW52XEQVJY06ndg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcOi_fhSGnYn0KzsRMdSFmFhzc1kzesW52XEQVJY06ndg@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57709-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 368503645C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:01:21PM +0300, Andy Shevchenko wrote:
> On Sat, Mar 28, 2026 at 9:27 PM Jose A. Perez de Azpillaga
> <azpijr@gmail.com> wrote:
> >
> > The function configure_isp_from_args() contained a duplicate call to
> > ia_css_output0_configure() using the same output frame index. Remove
> > the redundant call to simplify the configuration path.
>
> This requires more information, in particular to explain if the order
> has no side effects. It might be that double configuration has side
> effects and removal (wrong) one may lead to other currently hidden
> issues.
>

mhm... my bad for that,

the ia_css_output0_configure() function acts as a configuration setter.
it populates a struct ia_css_output0_configuration from the frame info
and caches it in the binary parameters. calling it twice with the same
out_frame[0] pointer merely overwrites the exact same state with
identical values. it has no cumulative state, either does its order
matter relative to ia_css_copy_output_configure().

...

regards,
jose a. p-a

