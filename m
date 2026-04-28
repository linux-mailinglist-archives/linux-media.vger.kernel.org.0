Return-Path: <linux-media+bounces-59822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D55DkmI8GnuUQEAu9opvQ
	(envelope-from <linux-media+bounces-59822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:13:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D49D4825CB
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABCD9314DD04
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D2B3BB9E1;
	Tue, 28 Apr 2026 09:31:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198733A5E8F
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368713; cv=none; b=ueA4aVE2L4/LW6clQGp7pWYaDuBFpAUCEcwJ1hBZdDkuGiHzsNgAUl34M3TJA0v+reefXKqy7SzCXdQPrXjt9MyR5EKxZu98lpTofz2hR6gJzDx71FBABAT9deY/djLa5AXTftZH191umXIaGc1+rGj8f/IGIldcudwFHpD7z0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368713; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHVdvNSTN0odjeBNkq1aeQKH6cjcO8ywyPZhbQM29T+y2b4KlOIxSgwOu7qnkp/dZkExCoe6e0/5euo0sQzIIo3p7C4q3jaFKHY+nzU5uyOvlZCqNKglJkZvg/d2znxnz73JLRfCPFnJyju14XCn4znu4hOsx01S/btekujCA0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8f97c626aaso932570266b.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 02:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368709; x=1777973509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=pE7AI+YgBDS+nKJlJgKQxiHZKf5K2bI/E0EIcZct6oZp4kWXhl86L7HoNIvLx0JxHp
         xhzL1cEPuYM7DefiqnekagOyreEOYyH1M55KN3zthvZzYGWAXV1pS9srgBqVjElGjZz+
         I9WmnL4SDiQyJEQBoILgWMy7TeXqS0JmxRpkZt5zNxZ6wISaY88stHqCdaYiiJMWitzp
         WOkmcZy/qfkVuZQK3mzEghxUFtwGW4HdXQefY0SlXpFw0WlwsgfHe/TJxf3uv00dEr/j
         +JM37J+89LbQUiKDDo/pcytMh1INpJ3IWfX4rnZsp/HNzIRQEYCcZ48Lp8lUNXg7xjE4
         uqHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iWcvUzLQNxeCmXKLbenHmdwMoiGBJ538XSpW7kQo0s90ohfLBY++AWWS4H6raIItfbGoIOyRT2jd5uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQCjMTFPEYXEf8jUsbVmcLqSGaDOMLZrDXaxUg6a7SeLHbqgbE
	bMWgMhQXNJEtIP1Ej1Rfqavtt0m77aeyeSF1OE4ge0AAhK+gyqRKdG2khZYSASbMWmI=
X-Gm-Gg: AeBDietdVtv6m1ut2FIgcmmcOG9XlT0WnOxTHbAaiqP6hsVhkVTdYHAM525g9vjexwD
	YKX0envl4JKrT0RkYZogPutvB3vaDTedkKTlhDdptAeA3EqPmzH2g+fYWW6trSUyNCS8Axx+Z5n
	vfvXoqx7K1dGbodKNuzMW7Ht7Ye4IXagcYn5GHmRsrD8S2C+7GW/7XMZmN5SvZer86BhagdLhJT
	acMf3MpY8Derlb4qyGeNnfU+q8yzMJqZsbWCBzbZSx1dn+q2zBKr9pSV+mq8BARwzuej+DJvsGY
	Fwult/rxXHn6hOkLGiV3asP14qgK++mDD18sMg3E+Lr+ZwqHQn+84pFNPy8ZyILhSWoyVtfWJLQ
	QR0PQ1LMLQQi1AUNDfm4I6lGrc23iIZLjss7xKqnDBr6PFWvQzWk/1quviC164SJ8nRpXP4P4//
	JK+HDYnhEB7gHKOATtkedVG/ZJDZtroXbvs+SAG/UrBoGYJG9t7HumIzRd6lFawTAouWu2yYU=
X-Received: by 2002:a17:906:ba89:b0:bad:a28:e09 with SMTP id a640c23a62f3a-bb804d28002mr143659566b.41.1777368708765;
        Tue, 28 Apr 2026 02:31:48 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2adf4dsm73052166b.39.2026.04.28.02.31.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:31:48 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-678a526f374so7378481a12.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 02:31:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/WIyxSbSTQpNlm4/q5ojqYpxH0wsSWtFxlGk6rubTEcxyfFwdgfGMf/Nk8OLNN1OfAcDNyczB5zZnsfA==@vger.kernel.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 8D49D4825CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59822-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.000];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

