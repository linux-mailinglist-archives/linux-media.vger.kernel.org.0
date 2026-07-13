Return-Path: <linux-media+bounces-67517-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nSi2MAJUVWrLmwAAu9opvQ
	(envelope-from <linux-media+bounces-67517-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:09:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E17F74F2FA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:09:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DDu2ZxQI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67517-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67517-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64DF1309C418
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0550D35F165;
	Mon, 13 Jul 2026 21:09:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3026334389B
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 21:09:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976942; cv=none; b=TrBiWRrET1dfA5f0oU1d7qveg2NQ4XRYCLCJ9tsWZnV2HK0qNL9cPaE4c3q5SQ14isXmD0uTQEvVkfI3xHlkItswqrlAZfh55MfFxyUKT/5NgY5J37CfVWM04fZR9OXFtRR4c3IVPDUAF4/NZbx8frDHeMtuiKh+oEklqJaD7HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976942; c=relaxed/simple;
	bh=3jQ1hH8GlZgiDKSnvflUdEkxhV2abBPDIrnY3Pptvs4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jedjuVVVPteIVy2ZsJBSU0VytAPdKwUhuxj0bmj/EfCxqczzuNMKDvQLIX5+dwE7jVcp3tqK2dHga+GTByGBTZtOzBcsogXLmtls92/n1IYqer5NBiRszUHmwarMDyqKgiNCRuH1/pOZVYWWId50a0UD6oUikl+qjwjcPztSC/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDu2ZxQI; arc=none smtp.client-ip=74.125.224.129
Received: by mail-yx2-f1.google.com with SMTP id 00721157ae682-81cf30cb90fso16575427b3.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 14:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783976940; x=1784581740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3z11abkydzZ2iKlx8ecIFGRlioo2QGUfIr1WJRM/Diw=;
        b=DDu2ZxQIwHAT+1WUHK+lGcra70p9GFk+7T2LBlyTerpEuC2q1C/ByWyyVwtVPaFrfV
         RgcgDXBMmifKT1gFuRnWONEitVx9R3MwIC9sdRrDsy1nXJFjNYATaapiT72LCJJPHPW0
         nQzYMo/qGKX2LPQVq81+xG8gTPEO1ptDcq7atl0znq8jh+9nRWHHpj/loF79upJY6zC4
         Hp2dQXTV7LQUO6d5MvKqfClQ7WON3H/c/eL8E9O6txblqVrCCwPKcJDiCAowbAqj9Hw0
         05zTftNpF7+wdU92OEq6WaLMdkwdzS+u6fhYpWdX5kJ9gAl6mpmOqNop4yUecJzJOgIT
         czWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783976940; x=1784581740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3z11abkydzZ2iKlx8ecIFGRlioo2QGUfIr1WJRM/Diw=;
        b=STEUhW1vHQnUVunO806UQGyWQvcrt+0WEd+xI5bbbJ2F5+hPMOkKXWVXq8EdmU/3Eq
         5Mj3ucEwMdihmbEMEDyegW2Pbvc0nB32Km66/EZBeoNblmf1ENqYMaqmuKW62xYdvbO7
         FWpYVMAfsbNCVfu6GfgvSg4DPaxnAbnYexRbNiDnOb2YCNh/rqTL7iAzwBlpVHdzHfkB
         aINAKFNj3haB1rmb+RVFvNbZfncp6hma8ayog+t2OhOi+JjDs+KBBx90Lg4nQ3qI6f0u
         7gwHoaJ2r6/MucAwnwpN4se8CTW8YuowCuZ3oQLvtzAidX8uFv60xQIzaYGezy018iUw
         zB5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqaiK7uftX0tdPctdbL07ljjZOJmHaCK7q5N/7SQYxyKBIwBKTSwKNCo4fdUBFibppahgt80hQ3wp0kdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjKiklfDfLDt4E4+4NjCiGO75CeaNS6sirs7QV7Y3sJFRrXOMa
	hb1IIK9DmZJofS92Kp28AM2jgiBQ08HO3ekcpaJ4XUxR2821WjG9lQtl
X-Gm-Gg: AfdE7cmEo+89lsx4RcmhifiUeMT70IHWBfwtc9O61+dy1TA2bNsMepSbw2Qs/pqsaMD
	mXZ07ISQtc/9eGW6NcYCMgDy9eate76KnggouDvwUjyfx0NEQJdHc/PnrtZqwNQ8VjM5mDDjfXO
	pgiSCQ8oSqBpc/wjeF/eEfvDj8rkpEJyMnu7I6x0yp1cGUlnPydt2wTKfIbiXfxelvcsVx4R24B
	SvLTBlRiqDrut7Ucj+9NE/02OFnSkgiR0bqUkSt4cwflMyk8Ql8Zm/rF21SbQhlw4x0ChEuzNnJ
	8y9qXYUhV5Asug5GUikLcJnWGGvoafe/2M34sn7CT8GKZqgjsvzCJ26rjbhcY0O7+iQthka9qLo
	NEzKgJwqaWLRh4vg6m6BIDXXTim27nyIV68qnRL+BT8fsAnCdmPg51fnKTQIe+qEaYZufCChIdt
	VXWDR69cLoARfHA180FLlfGh82b+Lm8FlEu1wkZqHNORF4Eux5sdsY4axYPb5nITpAuZ0=
X-Received: by 2002:a05:690c:61c6:b0:81e:b801:34ec with SMTP id 00721157ae682-81ebb2c92b2mr9367897b3.60.1783976940225;
        Mon, 13 Jul 2026 14:09:00 -0700 (PDT)
Received: from pendragon (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be98dfbsm126045887b3.2.2026.07.13.14.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 14:08:59 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <electrolitic21@gmail.com>
Date: Mon, 13 Jul 2026 16:08:58 -0500
To: Danilo Krummrich <dakr@kernel.org>
Cc: Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>
Subject: Re: [RFC PATCH 4/4] media: add gv-usb2 audio capture driver
Message-ID: <alVScUlUiOS0ZiIH@pendragon>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-4-9fa011634ead@gmail.com>
 <DJXIV7JTU8JG.2U0I0LMHE84NJ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJXIV7JTU8JG.2U0I0LMHE84NJ@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67517-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[colinbrauncl@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:colinbrauncl@gmail.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:stern@rowland.harvard.edu,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,rowland.harvard.edu,intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[colinbrauncl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E17F74F2FA

On Mon, Jul 13, 2026 at 04:44:24PM +0200, Danilo Krummrich wrote:
> On Sun Jul 12, 2026 at 11:08 PM CEST, Colin Braun wrote:
> > +/// Write a vendor-specific control register on the GV-USB2 device.
> > +///
> > +/// Uses a vendor-type control request (`REQ_WRITE_REG`) to write the
> > +/// given `value` to the given `reg` address.
> > +fn write_reg(intf: &usb::Interface<device::Bound>, reg: u16, value: u8) -> Result {
> 
> In addition to raw control messages, this can leverage the generic I/O backend
> infrastructure, so you don't have to roll your own write_reg() function and use
> the register!() infrastructure instead. See also [1] and [2].
> 
> [1] https://lore.kernel.org/driver-core/20260706-io_projection-v6-0-72cd5d055d54@garyguo.net/
> [2] https://lore.kernel.org/lkml/DJVQ852J7SOH.26YBIJTQ9B66G@kernel.org/
> 

Interesting, I had briefly glanced at this macro and was disappointed
that it didn't seem to apply well to my situation, but I see that the
Io and IoCapable traits are generic in a way that does support this.

I'll include this in my next revision, thank you!

