Return-Path: <linux-media+bounces-65275-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fhnOB7YsNWqwnwYAu9opvQ
	(envelope-from <linux-media+bounces-65275-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 13:49:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 459A36A57E9
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 13:49:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65275-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65275-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FAFD303C00D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 11:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91003815E8;
	Fri, 19 Jun 2026 11:48:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E714436C9ED
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 11:48:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781869720; cv=none; b=QPy5bWiMtn6HOicdxPdUD42yonznECZNDL2e8zMVT+/6CiWlmnB+mzWVo6RyQsZDDZ0qPRJOjwzcUHoBbYI6M09jqXFJoUHchuKjdJkbB4Kot26JWgNxHJLPTbuKojw9bVpp9BCo6Q6Byr7igkZMP4Mb3o3yHe5S5Dvmt0/GRlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781869720; c=relaxed/simple;
	bh=yyWyYqE/jbVl1VgGKKGeJNCofu8gfjfeZlg7cKyJ9fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJ1E+dd9aEQ/J3J3CCM6c/zws8KZpB4wzbBvLTszBVnfeC3tnlHmgIIhvN27byCL6HWn46k7Cd2lFNeEQ/CUJwkKBb7E67hG5lqeXMrsImW9cHz29Qv/cJDrY7DiShD1Ms6NrYHuSJNp21DFAJcCQ53JaoMF3hLGQp/PXyAhnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-727fad2be54so623879137.1
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 04:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781869718; x=1782474518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ItJpWj1GNu2tcZXuQZG+sYbJ7oV+gLF69bBweX98kac=;
        b=kxAeiYJ5UjveBsXhpvwy7QjUVcQqxOgMC5nVw1kF+vamwauX+ie4zolaoIfGhhjROT
         +443k89aAgKxBQRbAv8QQfUNYYJdnawOjfGUqjS7zbhBLfHRqcK+F/RQN+rD6AvzsRav
         Ia/BLCDVA+jJBsYoG2j5xPxoMv6lKr55rAICXQNkwxjupObYwwz8ovpUCFNp1aQJ/sQX
         aRuQbED5Lu5U2lW446xFzzsBP0eoTPzFO6jJnACkRl3UcVdSwFFRnOJUPgxtFD6i3xdM
         Ul4qnuHrCEeLdi0EVmrDlhz4QJ/CYLPDDcnOqA2GfMCQ1RtNxi4Cmu6m/pPdvUV4frge
         dYvA==
X-Forwarded-Encrypted: i=1; AFNElJ+Q9eVo278HUPwkvI3beedVLpR+tWyGVvlEF1uVu8Eg+ShzzscT/PvSdXNQ+exvk3/BOJlbXPcFtqj95A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqcl5YlLcSeMD4gx2uNHU3F5XtH1x6kD1k5hFw3VGUIv1kqr2c
	hxrBtOC4z54mgMKYMiLb2m2PwMVjWBqkDR8XGIOVQCuDZVqQKcZJx/cJHBrV42CEhtA=
X-Gm-Gg: AfdE7cn9FtYwHnltwkb/8YK0gctYPmqiijRD7duP8zI7DCMXnNueggIbPrB3g/HqzrO
	tNqnXDYiTsgrsEfvsBLjJVoMP9tx8gmyhDzfXHj9XQNgerMStxGQbq65UgEXH5Nl/dHmwXQUvKY
	ODyfxakjoRtYY1TNIXtZAmFCzBkIzfAzl4Lupy2pPzF/JzJB/xYJj0Juzn7RbCnf/3xz5caqT+g
	0OSZmtnZkt3puwBOinS2Sbl2cJJi0oTWICBYDOBYeV/oBYOGkFHy3OGCzfqKiEKsz2iUTEJ07dS
	O5nqhcV7iP4rFbnnkeDzZSzWqLGRUZQ6m7MamoA0rYhVde1NjvS7h4REihO12YAE58j+sMktzrD
	CWprW7OQD4pVg+pX11NKDdoL60RD9YDWu++MqB13J0MPHwnVp0Z5ElmUYct18CQD23BzStSsfcq
	w/eVOIa5s9KE8ac9yO+Aos+DKO1eBYZX2bOCXEUU2hB225pwXAEA==
X-Received: by 2002:a05:6102:5123:b0:6cc:f252:6929 with SMTP id ada2fe7eead31-72a037518b5mr2198436137.16.1781869717770;
        Fri, 19 Jun 2026 04:48:37 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72a36bfe9edsm1368056137.11.2026.06.19.04.48.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 04:48:37 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9666739d3bcso558832241.0
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 04:48:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bhNAxySg66AtGvtxbzALuLKgz/rzmz5RiQGgpQQJjd7zC05ef35kcyG8kGg65asqGIgZwerobVe2xlw==@vger.kernel.org
X-Received: by 2002:a05:6102:448b:b0:650:aa33:5dd7 with SMTP id
 ada2fe7eead31-72a01884599mr2039005137.2.1781869717237; Fri, 19 Jun 2026
 04:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <16fb40ded203d1e2b72f4eeecad3fd0c0d23ad6f.1781863296.git.geert@linux-m68k.org>
 <9503e60a-5e8a-40f3-b5cf-1d8d0f71c9a5@amd.com>
In-Reply-To: <9503e60a-5e8a-40f3-b5cf-1d8d0f71c9a5@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jun 2026 13:48:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoR6UNBC-hsi1V=vwx+9AWzRw9bT_OR0AO2L87nCnn1A@mail.gmail.com>
X-Gm-Features: AVVi8CdQDwS6tzm65LzLlS49GN4M-NumImqTWT8BmI9blTIGfCV8oYLJQhKk5Ak
Message-ID: <CAMuHMdWoR6UNBC-hsi1V=vwx+9AWzRw9bT_OR0AO2L87nCnn1A@mail.gmail.com>
Subject: Re: [PATCH] base: Remove unused DMA_FENCE_TRACE Kconfig symbol
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, driver-core@lists.linux.dev, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65275-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:driver-core@lists.linux.dev,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 459A36A57E9

Hi Christian,

On Fri, 19 Jun 2026 at 12:39, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> On 6/19/26 12:03, Geert Uytterhoeven wrote:
> > Commit d72277b6c37db66b ("dma-buf: nuke DMA_FENCE_TRACE macros v2") in
> > v5.16 removed all users of DMA_FENCE_TRACE on the premise that the
> > Kconfig symbol did not exist.  Apparently one failed to notice the
> > symbol did exist since almost five years before: it was renamed from
> > FENCE_TRACE to DMA_FENCE_TRACE in commit f54d1867005c3323 ("dma-buf:
> > Rename struct fence to dma_fence") in v4.10.
> >
> > Time passed by, so remove the Kconfig symbol, as no one seems to have
> > missed the functionality.
>
> Yeah that functionality should be fully covered by trace points.
>
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thanks!

> Do you have commit right to drm-misc-next to push this?

No, I have not.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

