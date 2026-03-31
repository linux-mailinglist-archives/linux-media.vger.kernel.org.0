Return-Path: <linux-media+bounces-57711-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP3LBsNly2mAHQYAu9opvQ
	(envelope-from <linux-media+bounces-57711-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:12:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B66CA364654
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12476304E0F2
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 06:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5FA385519;
	Tue, 31 Mar 2026 06:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoqyUFk1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662B12F1FD0
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 06:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937473; cv=none; b=HlKlPZeX27eh++Od3LtwXwerPB4EDi18sFwoqro3A0lFzo+Yfn4NulLaqDciksmt74DPiYgucOA6O/89C+syCkUt/en2mZA/FkY5oc/biI7CpzIdYFmGcuP1OJbigJqu3VkUWiODIly2admdKYRM8EpnQYOFpoccQ1uAqoTg/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937473; c=relaxed/simple;
	bh=TQEPhLFbG443oi66SYnNeLKncuThmRO45JTbf+qVA0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPfQBv5ysKdYisJWT21BeqnBbFbaaXSxXZCostjT/+J5kQfDUDZthSmA6kQQBaub6ix2XvH9l+/QchVX+kZ73WVG4/GbeZrdDh7SprZ+9iz6tK3laV/My7KEvC2Mg6NujyNIto0CwziMhLt13K2t8Syg4uviJLbC6mbqF6Yr81k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoqyUFk1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-482f454be5bso59255695e9.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 23:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774937471; x=1775542271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri+6ec1xbEZKw5nXyB/FNfkgPoFjjyOvcOi3F8Vo/Pw=;
        b=EoqyUFk1hCdPd52hp1J0FaGgSYMZxneb12XuSxksJYO1ECb5gwvkoXX9JG8AHp+Z1K
         BoNsphgDkkVXv4830qFs5feSCaI+D+SjERhvLuVdLTrXkWGljIe5aX14Tuxb7OebCwoI
         xP0RG+MyxtiKVrD4UZ4cASGGXDBqH2XrXwe60xu+430Rc+k3rxKxgxtd3chxDDLiXiY0
         Gwk6CyTWp/oWx6p9COYn6dbVH4aZBvNVP4eW6uCuyWd2ya/mT+khwfdDbQJWHDXKpL9s
         3hwdoTOXujW5VYXn91EQb5MaSt1D+TSEiB3OTfu0Wl2x+/M+dUzl4CyQ+V9KDTI41pGx
         yhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937471; x=1775542271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ri+6ec1xbEZKw5nXyB/FNfkgPoFjjyOvcOi3F8Vo/Pw=;
        b=bYVspMA+IbZ7Mpu1IjyC9pdO01n93WD1SzrBU7GrbgZmA8xInP4wqxwZC6txdk4SUs
         TGjtYm9gaN2lbmOBPBcShuKIrSC3QDjjLXZX0JAygKr8pc60A7E2H2BhcXDaA0hsbJ1U
         eAofysq+d0ubyal7zjLA8FuACDPrEknyyQB78Bp5buRX8B78uTy+Kv07JAl7ZeebCOLd
         eiAeGwdMGh7WGjw32vVXDy7ffd9GZYAaA0PDQN7YLmuO7/rySIb4xg3FiwEyPxxam19r
         2I9Dd+OAyuqhc1R45atGVJLnoQGGYqbqdPhEzbrnyW80NkpH5/PHi7onddlbhG+8MDsV
         vAiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW9EBjazwepSC2G63QTLLkSH4dyFoDcBnRNffzagJDF4yEf0F/t4R0JqlcTxRXTHJQ+je1RmNF6ROSeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO114y2UarmhySTC+TymsX6j8WsBKQwD29lZ7DzkV5OJsJQNnu
	1FHTePnERb3HMLsPKpAx1YIzQZt8Y8uI3vx9vsTotoTOldWBIiXW3fBs
X-Gm-Gg: ATEYQzz0bL1pdt2/wMAeSAnBWYOtsA+GiBVMIb6BoYINbu9A2p7eepWZEa2aIIURenm
	KvdeUBFO6oVkBNP5f7HWgDbT4zetg5ayhSGpzuf0gSWylifIqA/nnZT8AiCORHhV/dWGvVrPGle
	H06CmKr2RPjZIdVr9+zrQixDLM4s1rjH23BgJLCjpMVPXursZDMCvpQIJ2zcmKu/1B3L9+sPwC5
	nV9CyNM+dk9Ij8sMqeTTxw8M0aXSCeaCdBoSMkDgjy07yGyBGshBATdWiozqeTvgMkuS39jiHYf
	Koo9ervJV+7f9AX2tZiF6B4atyDHbcLiIye5UnfbCTu0M/Kev2b7/mtl5rtg48ZHh2/8RNcZ8QM
	n3tY3pqebuYZh9oiUKzm8PP8B9Y++NJoetxR0PELyIOAvIchrXzpnizPIw0oB0cDzmogw+ExVFw
	LArTbKG5jMdJfjSUxaeBECDD61V6GVWQ==
X-Received: by 2002:a05:600c:41c3:b0:487:22ad:403e with SMTP id 5b1f17b1804b1-488783b1117mr21061195e9.14.1774937470676;
        Mon, 30 Mar 2026 23:11:10 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1882:1f28:c460:96ff:fea3:6e21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm12499275e9.15.2026.03.30.23.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:11:10 -0700 (PDT)
Date: Tue, 31 Mar 2026 08:11:08 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <actk9nFueD-8FSaa@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-3-azpijr@gmail.com>
 <acortY2LJ9f1K4ju@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acortY2LJ9f1K4ju@stanley.mountain>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57711-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B66CA364654
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:35:34PM +0300, Dan Carpenter wrote:
> On Sat, Mar 28, 2026 at 08:21:38PM +0100, Jose A. Perez de Azpillaga wrote:
> > The function configure_isp_from_args() contained a duplicate call to
> > ia_css_output0_configure() using the same output frame index. Remove
> > the redundant call to simplify the configuration path.
> >
> > Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> > ---
>
> This feels like a guess work patch.  Sure, it looks like duplicate
> code but duplicate code isn't always wrong.  How do you know which
> call to remove?  How do you know that it's not a copy and paste error
> and the right fix is just to change the code instead of deleting it?
>

my response here would be something similar to Andy's one.

> Patch 1 felt like an AI patch, and this patch feels even more strongly
> like an AI patch.
>

ouch.

> Please don't send guess work patches or if you do add a giant comment
> at the bottom saying --- "This patch is a GUESS.  Review carefully!
> Untested"
>

okay, I wasn't aware of that. I'll try to add that comment or better
yet, not trying to fix things without the actual hardware. thanks.

...

regards,
jose a. p-a

