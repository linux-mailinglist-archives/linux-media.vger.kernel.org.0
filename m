Return-Path: <linux-media+bounces-56327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOI6LojZu2k6pAIAu9opvQ
	(envelope-from <linux-media+bounces-56327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 12:10:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A9C2CA146
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 12:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D3AC301281D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5FA3C6A37;
	Thu, 19 Mar 2026 11:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4ObFGlR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B9A3ACF16
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918544; cv=none; b=D4RmmpzjQuJosmNCgGo3T9pe0GOhXa1+czzs5ccFY9IXoQfbEzzrJFdyKM0aHMhjDPkpTxM97ntG2y/nwY4+ZPciA8ioMZqCZ0IvUwowUJRGUfJsxSH15P3YE8kIFTufqLp7HgAhDBtE97xs/ZYVZX6ISzwGvyZblu4BnNMejLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918544; c=relaxed/simple;
	bh=5upsHrtLRI0mBKjKLI5yL6bcYwkktIIBzTewjQcRaOw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f8SW9t/HAAzQ5ddM9f0ANyuUM7hQBR58wknE3GQPw0cI3tQsndPCD8l0qKgAZ81M23Rw3bj9wNcPRsRWkhPLBrd7yJiSMYYESxgy2LFiFXyG1fqbf6tFETnn9FA9VR+CNp3uxcEt/yk8JD00fr5PJ8pCCOiW+5052KLMZOfvbd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4ObFGlR; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-660a293515fso1692186a12.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773918541; x=1774523341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JRXc+Q5SYxlCa27iykSk4XXCHPIaQz6hns7kejM0Po=;
        b=b4ObFGlRPMtG1Q9Y4B1W5oLBqI6NVyX/N3xEUZmC2ZuIOq5q89OVuCbdelnAu7+4DJ
         2rGWEETN5EpsT1M5ab4nn0Rz55ZHJxuALdZw5q4qP7s7usIeK3Cwli4qLQEEsv45kjGg
         6jmBfHGehwSl2LSXlxPzk0tltyGmLyMBlcdabC+UO7wAgYiFxL0Rb92u7+Pipi9mLPqy
         VIm8BWmDpVF+V9OtED+7BTcfd5z5op2zMzPmx+rL48+mDMjoGvsBE7fXd3opWMyklxkq
         yCctd37xGxTlR79VElS/t/moZR4uzMEX/LsDMIHd3wNkmy7KsO73+0g4Pn+oxMafVObr
         L6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918541; x=1774523341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0JRXc+Q5SYxlCa27iykSk4XXCHPIaQz6hns7kejM0Po=;
        b=dhT1LqaPMZdK+INCuuhc+tJNbAu0Q7ipTvGJO5OfbJNOvBYzBHdh8Fpqp1Y8V5HN1B
         qNeL9xKiF9hrqRBXaKSw+tj8+VV7RPDLXA9cUB+emf2fKHG3Rm6FvZGHyRPlBBHdq3tW
         xdgivSroSwKplwixr3EWfuGPg+8qntQ/dzaoAf/lv+s4JquJ6XwWrhMuCZ5JiKqyBcxs
         rYUvgcfcgO/AxsqbVIWwohBGGmaRRJP+PyKPyOZmq+Jc8Mpo+5nhtTnwXD8sBiqogTjA
         CT1j6NZn4vc9AAADOdEqDlfg6OPXmacRUM2up/3wZ8Nc2NGWHr8zxFdjfNILvkDvnXcK
         wCWA==
X-Forwarded-Encrypted: i=1; AJvYcCUo+LvBIgV7p+fV6qMNIvDbLTgmUXq0fxwQIPBgtkzg3sDsy8GIVWOo1l49w3t13S//J/XkP4+dXdeoLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg6Nvs1u23FqUcshdjNPb8s3RFcMy5yJkfo1H9IPvEx/VjOv4J
	OUkD1jVCK51FKbTbNJkbyhiT4ZmhAEogULo7kfLgVK9zTB39VMDsNNsG
X-Gm-Gg: ATEYQzzk6OP0u6Evjp16f6OAcR+kllECPiTTInVE4A4H6Nfs3A5fnuHmOs6cyO6evgO
	IUWv3REr8fl8AzOth9neQxvSU4oEUz8c+m8gF/xQqCRwCl4QjAzbp2lmbu4rJUQlcdlplkLR86j
	y8oyC/PquLCDrUp6sfhL+9zDWSka/LG+Js9P2EwbVuSWSDFIiQ17wTzDtPPKKp5Aw9woPbkDFG8
	nsGzQQSpmkR3j9fR1XptMUGoTpgtbwqdgNg6a1jsmB3oWOMUX0HJEaXwR1kFfEe7bpRSzXjwmaf
	OjknNzDmaxLAphSlIl6U+lt30D+OXbwDt2Fuexw5vSKshB/K529Dv897hBUenJ3j+ATjhQefgE+
	x10Y2BIXlwgWxWR/Wc8ytyFfV+Cd+4YQSzR+1Ixh8qlQIZgqrGcwL2x6gYDW91A82aZVWvrIKfU
	FVoMP5k5fAbPbYsRcCJnl3gVXPBc0JSlrCq7A=
X-Received: by 2002:a05:6402:13d1:b0:665:1c94:320d with SMTP id 4fb4d7f45d1cf-667b2733215mr4466539a12.18.1773918541213;
        Thu, 19 Mar 2026 04:09:01 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9849sm3367540a12.16.2026.03.19.04.09.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 19 Mar 2026 04:09:01 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:08:56 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: uvcvideo: Introduce
 allow_privacy_override module parameter
Message-ID: <20260319120856.09f2f15a.michal.pecio@gmail.com>
In-Reply-To: <CANiDSCsBjgZL0MGFgkDzbTaJ03hE0gZbV3tu3fKo7k6KaAcMZw@mail.gmail.com>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
	<20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org>
	<20260319013657.155efeb0.michal.pecio@gmail.com>
	<CANiDSCsBjgZL0MGFgkDzbTaJ03hE0gZbV3tu3fKo7k6KaAcMZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56327-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.978];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6A9C2CA146
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 10:56:59 +0100, Ricardo Ribalda wrote:
> The goal of the deprecation period is exactly this: to trigger a
> conversation before a permanent block.

Most users will just curse and edit their /etc/modprobe.conf. They may
post a rant on some distro forum. I suspect no one will monitor this.

> We can then decide if we need a specialized API for their use case or
> a Kconfig option, rather than leaving the current "anyone can turn
> off the privacy LED" status quo.

Why not just add the specialized API right away?

I believe users affected by this regression are already known,
ISTR some negative response to previous iterations of this patch.

Kconfig option sounds crazy, who would want to rebuild the kernel
for this? Depending on BROKEN is double crazy.

> The attack vector is that an app with camera access, like your
> browser, can record you when you don't want to be recorded.
> The LED will be a signal that something is happening.
> 
> Imagine that you install a Flatpak for live streaming. Assuming the
> Flatpak is properly sandboxed, remote code execution is less worrisome
> than the app spying on you.

Theoretically yes. But also nobody should rely on those LEDs.
People who care ask HW vendors for physical switches or disconnect
the camera while not in use. I have seen black tape on laptop lids.

Are there more owners of affected hardware who want this code than
those who don't? Maybe it could be a Kconfig option for them :)

Most of my USB cameras don't even have activity LEDs.

> > So it's not removal of some controversial feature, but 3KB of extra
> > code in everybody's kernel (I just applied this patch) and a forever
> > game of whack-a-mole with HW vendors? They will win...  
> 
> Maybe I meassured it wrong. But I can only account for 1.3 KiB

I simply ran stat uvcvideo.ko and calculated difference.
Could be a matter of different kernel configs.

> I see no need for vendors to hide these features, they simply added
> them because an OEM thought it was a nice feature to have, or because
> they left them as hardware debug features.

But how will the kernel know about those random debug backdoors?
It just seems that whatever is discovered by users and becomes popular
enough to reach linux-media, will be getting blacklisted and broken.


