Return-Path: <linux-media+bounces-52065-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PYmAvgrgWlgEgMAu9opvQ
	(envelope-from <linux-media+bounces-52065-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 23:58:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1508BD28BC
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 23:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C753300BC5D
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 22:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9652D8760;
	Mon,  2 Feb 2026 22:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YI8KWJqU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864DA2E1F06
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 22:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770072342; cv=none; b=iXngY4tGtenVPdMCmF1FHh+Rexw/submiqavsdiIUYAMchX4gdEbeUQLbw1H82ugUohL28JdtAw96sNKY5ZwqJkFHW/egFQdWC5COpUkc934LT0+RXDoa3cjff/S+haceCDJ9qp0AeR9/kludhaDHv8M93TUWhc1yFqAakId7io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770072342; c=relaxed/simple;
	bh=5Kb5krIsfIdKzbY4UbV0w0i93VHuDl4UPIOiaxALKbg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uW8bYGMwwq1w+QYrMi6Du0bCm6K/HtagqhEWifQut74jaZRZFAxeJnly68LHygjlIJdIcJcSG6jneEpRJ/BCjZ5NgMg7xAW0I12WF5ku4tE4FyiQ4RzUmTWokKFfurP3bmugwIdKWTp2nXYpQwd0TtT4FbBNaZDRbYrgD4iM0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YI8KWJqU; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-482f454be5bso1656975e9.0
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 14:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770072339; x=1770677139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGqAdrVHnFu6PnnaHfHKQoFDoCwgyHq7ziHIdTjOCQs=;
        b=YI8KWJqUC0UQfYhst3EmtYqnqMbtMocelTGoFCn5ICZaG1YrEV/4+ldRx5gQP2aTe3
         +jsKB2nrkgLIgvETdfjQM8fn7115QlK4jj+YzLKYw+a+TGqjeZ7NHqqxrcTSDhX2RyiV
         FVG4bdZR1NJRpmGXiRg3yXfjHBzeEnwtYCb9tywXndb56SQ16DUbqwY2XEpn9i98nslg
         h2vsWy7E5/vTrQOiYeXnHuhK26CD23pJJt42dAFR+pSOJzgEescMsEorT7hAN6nICu6u
         j99WD+/C2Qotx+ZPXxI+AfzgoOjZxRNMvA75Hi3rZVS/LRPI7vNaBUa0lFVndkldXVZe
         L5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770072339; x=1770677139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JGqAdrVHnFu6PnnaHfHKQoFDoCwgyHq7ziHIdTjOCQs=;
        b=gcO+0j0rkup3P+L/Okr0pXQ4CG8yctq6U/T83lEF5VPxA7GyEPzStiLmUaF/kQHwYk
         x9rTtsTfnxTDLWnXCW15oor0M6WHD+5MHjxx+Wq/tGJvjRnRWN7JrES97wuLWLJZ2QZV
         +G20vEBseWkEtCuXCOJssNhiad7fKhf7Ty523UkIckhMgSf/f/iMJRF8UK7+QF2z1ggF
         71jZlarYwo7Z5VzuLru5EQANmLvvxbmud97BLnqfWQIjMKsLBIiVR3goMft2SkVglXt3
         OJ+GNtmYVb/27/SGgbHcLI2BIgweIxuuL8jdXAALb/Tu2TuL52YAkXL2tZ3l70HW0+r8
         dAhg==
X-Forwarded-Encrypted: i=1; AJvYcCXL/QfFN6MzAQZjC68ORhqdhaxbEhW96uXKqtB5lyFVmSB0bJ45ZdH9L2g4r4rMm7nsKwD/SKaPgwiY2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1sBn/MhT0vjpX8LG+KxO1burIuihvpWN/x1bC8jswVZcWADVy
	npOIZYjZ9xMvC6fd21XKmpIN1GDbTZbBZ7bo8MzmSKqAKFoaa+p0Bg3j
X-Gm-Gg: AZuq6aLSReIpcDxhrfPGo2/GgRgmakk8VdLzMy4Rnh9C9w30Advo2+iqzowCCCODTxa
	FOcGmT9IlHOR18WCQLsvnkyLsvkGIqpwGCoBbHQmi8dPhBIEUjV7TMAl7ur0zAgffP4FnS0eMMV
	u1clW2hQi/DBz6QHmJHcZmygSBtizeJ4jQ8hHJtTisZTgNQCXrI4vBiRfLCDD9OuS9YY50bjHxR
	iEIW3GpWfjzY8oAu0U01chM1gBdEC+urBJ5mvRWXKSJ/npabfQ6ALbNWXF3Ki5xW9yfSsuU08qc
	L12VIMx80mk9aZpx4MoBx5Dtjicr1DDKV+lCa/DYJe/8dm8zBGOjQpRSOnH6+w9yN4HfBWwFs/k
	5VsPQKOr6fxJyu/h+Gp2ApfQirc19k/YJRut9Xp5dtPl85lsyQHOOV2NQQ0/vOJ/V7kDAGpeHyt
	EptFa9IrroN2ECU5sE4oRz/b+mYfoFs5Zp0Hka+mZ+dW0/usBdtvuN
X-Received: by 2002:a05:600c:6303:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4830513aed8mr18382505e9.8.1770072338747;
        Mon, 02 Feb 2026 14:45:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2973d57sm100080575e9.18.2026.02.02.14.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 14:45:38 -0800 (PST)
Date: Mon, 2 Feb 2026 22:45:37 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Arnd Bergmann"
 <arnd@kernel.org>, "Detlev Casanova" <detlev.casanova@collabora.com>,
 "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 "Nathan Chancellor" <nathan@kernel.org>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] media: rkvdec: reduce excessive stack usage in
 assemble_hw_pps()
Message-ID: <20260202224537.16c16e13@pumpkin>
In-Reply-To: <070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
References: <20260202094804.1231706-1-arnd@kernel.org>
	<16baade123f563ea92e6117bf78c56e8617daf14.camel@collabora.com>
	<3b89635f-1c1c-4e4e-b0a9-2bbd0f21bc90@app.fastmail.com>
	<da9f044152383cacd50989b025fdce08a654bbe3.camel@collabora.com>
	<070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52065-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,vanguardiasur.com.ar,sntech.de,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1508BD28BC
X-Rspamd-Action: no action

On Mon, 02 Feb 2026 16:59:05 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

...
>  - Since most of the fields are exactly 6 bits offset from a word
>    boundary, you can try assembling all the  *_field_order_cnt*
>    fields in an array first that has all the bits in the correct
>    order, but then shift the entire array six bits.

How are they being written to the hardware?
It would be very unusual for hardware not to have things 'reasonably aligned'.
This makes me think that the data buffer is actually being 'bit-bashed'
down some serial data interface.
In which case the simple solution is to give the function that writes
the data a 'bit offset' for the first word.

And to re-iterate C bit-fields are completely non portable and entirely
inappropriate for mapping onto device registers.
You can use C structures (arranged with everything on its natural
boundary so there are no holes) with members declared with the correct
endianness.
Indeed that is actually preferable to using numeric constants as the
offsets are tied to the correct structure.

	David

> 
>       Arnd
> 


