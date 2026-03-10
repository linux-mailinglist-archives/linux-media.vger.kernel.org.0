Return-Path: <linux-media+bounces-55212-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPlgA+k7sGmohQIAu9opvQ
	(envelope-from <linux-media+bounces-55212-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:42:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3753B253CC0
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28F84321B1EF
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01842FD1BF;
	Tue, 10 Mar 2026 15:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rDbghcjr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046AD2C08A2
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156570; cv=pass; b=Ef5wyLuvPqhpUAFBxW6h6D2TN6FZ0blrMfW5kXtyI2+rmdR4jxhg00USjcOuQE8lOFHWe0vPAy8ilsWbbBSXsL0w3ALit8VpjfrjFp/8x/mdPFsUkqCgUAl14wvEjb92FZuSv79FoLhXoypEr3vVhh3UwYeuw/4O5DumVOVUUWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156570; c=relaxed/simple;
	bh=kIxjNUQ02NPSCP5UuacwRgeGtJjNAs6igvmq7jsQPVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdPE6TVLnEPc18ADRXJe+QS4JlfUxpKYqSQQGhfO03ouAZtZFZ20II7oUwJfyp8zQZlbCWKm4SkwHDe1zAxU3q9TtNUZd2ZhCKnJ3RNCBKYcaTSLzP5FaLLhQcHlEao+Kpht1vqEhIdeIdMpvaeK363m+hwYaZ2TfcXvqp5zjk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rDbghcjr; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-485317b6bd0so72605e9.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773156567; cv=none;
        d=google.com; s=arc-20240605;
        b=gxLY04JIzTiEBdsbioU+wpHtTeGU0btH8JE9tJik7s7UYBr9eIMGo3dg/AvE0jvvdk
         IRKJSpI6Du2pTv+LCKN04lpmPUePxRD3lydh2SW3FrBv9z6pCjBjiph/Y9lFlVlFkVZd
         Nad73i6NLL2Rc3SAVnng2KbnrhIiNqQSuecIbhhziLA5Jb5P1p2+mkaqLA8LTLPLP6hv
         vDOLlEgc/D5e4iNYkJdm1iz7ngZdrIOlq4XTMnOqjgBof427+Q08fkvqllzVjfFss+TF
         uD4JxWh6gNtWG065UMYQaTOMSnD60GcEWGbPjlfnZ7pEs13DvXgjNoqJyouVh1bw/z4K
         j4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kIxjNUQ02NPSCP5UuacwRgeGtJjNAs6igvmq7jsQPVU=;
        fh=LHebUKvzuBA1UwgtA+9yEGHCUeQavFkMy8HbtZjSDvE=;
        b=SZmegtSrciKs5k6k7Yj4KCo55HkH7w7U4daLXNJeA5+b2QDCt7UCV3OIsB07ff0Qtr
         RXh4xO7KSPo/shMN/1X575umuLCKW8XRGsQ1WvgK82CHJhN4hiAvR8HB6BMW3RFSz+wl
         WXfLNc821iDxWlyu2V3SBX0NwxOzW0d6D0aAOAcx5v0tkKTmPbWtEdc3UCpKIM8FD1XM
         VqoXgDlorpdfA0TjHQ21k+wRSKJn8xRCsBtSI6BAVnX9i8a6+g6KRgzck/MgJDLBKRLo
         P9xejvM7TOcVZlx+if+Q8tLXXdb0t4mThgLJZeY4c0jcylmBPrjlu97g7Iw4am+Nf5ih
         OQIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773156567; x=1773761367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIxjNUQ02NPSCP5UuacwRgeGtJjNAs6igvmq7jsQPVU=;
        b=rDbghcjrBhlrJCAEdY+Q2Oi2RlOomHVT5H+XQGM0dJzbpfeJnReuw4+SkCZVBXMrvC
         K5IxO0q+XJeSUjBzS0hCHWAkjwAv4gPCsUXIxnbxZLKl6I6zr4pWbON/tGF4b91z4mXd
         54BZR+JDYLBdVEuJIbeHQqTl8EfY6Gt+cQV/u61WxUHDr63SJp9Mbcrt7xKCj/BYzN0j
         fq5noktD73F2DuqFZGI//1d+z3ujodpd1cvbP5Lehg9qdKgmjARj2dXdlEqMFqIiH+gu
         W7TrUkaB7Tui7RmjLAC0GazeSaEO+/JSn+efAbiip3EmljGFNoz1+3YJKwwH2BBnEx9z
         XGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156567; x=1773761367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kIxjNUQ02NPSCP5UuacwRgeGtJjNAs6igvmq7jsQPVU=;
        b=MpvI3RKuKbZA87ibjc1moUAfg5DvoR+g8mtNEGIHTGe/59m4w8NJwd9cKK6kL/MOWa
         lmLQuePnzoy5GKeHN9jZlaloPKT2uVAbt5LMchQK0rU8OWwCVjPwc9zmloqdZ3RQs1ez
         Nnj/OCdjkJLdMIA8uGesw7Sx20viJPut8P+xL0FU/IRE4XdfjhLIr6T7ZwivUWpz+VtS
         8RdcyLtTauMkLdR4daA7sjD5E5af0WtXOSx/jrmcwrdIQLv1oke9JIFmG3aJP6EkJrRk
         YY5o3KXzs/C8nYdKN411eMTtVZyrgXsUJcTByQDDtodX/V7C9iuowN3fbSIfvC5rseRY
         rWVA==
X-Forwarded-Encrypted: i=1; AJvYcCXc9YpFujkxlKrzHgnh1Mr0TvqrRxqkj4CzKqGwD8ckbvhFIvVbRWZ4wgHgNqQOm02mccJ0LpgpVeIb+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1ISzG9VE+W1te63FhkYqTr2oq2cldFWCPDWF0x7tWxalcCgs
	XbFCuXvRXXRHycNPlpqxv8hTWvR1Rc/ND5ka8odypykzJJc/UFZCcfakUb+bx+OPZ9EjXIIJcer
	gNbg2f3ivmuxXLwooWyKq6MoWNgAdloSv7Em09GiE
X-Gm-Gg: ATEYQzxKxAlLlFdmoSU13PL+ZuOz7IfcSwm9JvZ7J53xVIUsEHI943XLgvUodRK7MAa
	yzcGXux/aUCjeQBt1+EMOe3DbvxwKLZi1WH2YmDteqqmZqBP+CK64LgT+7m33jfcR8tQSt3UDsA
	g5JTLSo0wZ/k10TxCch/rSALCcppEH40+uALe6wAJLXAbMTathQ1zbTBKN+QknxS0jQRv1j0AND
	DI0AoYKK3QxGrU9fUzxyv7fUPwYNU5kIFOedNlerOrwYOLqgZhlZ3NllZ0Kz600umjPIOII5Ey8
	lxntNH3KqaIZ9zVtx8l7Ku4RBK+/mau0ckUqOA==
X-Received: by 2002:a05:600c:14d5:b0:485:32bb:7b82 with SMTP id
 5b1f17b1804b1-485422f0990mr713255e9.16.1773156567011; Tue, 10 Mar 2026
 08:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-cma-heap-clear-pages-v2-0-ecbbed3d7e6d@kernel.org> <20260310-cma-heap-clear-pages-v2-1-ecbbed3d7e6d@kernel.org>
In-Reply-To: <20260310-cma-heap-clear-pages-v2-1-ecbbed3d7e6d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 10 Mar 2026 08:29:13 -0700
X-Gm-Features: AaiRm51OfYQMi4uAoBCOFKD-AC3RahsO3Cwjn5nzCKdK-67emxyGfOBmUyNaDi8
Message-ID: <CABdmKX325TDBwJEFGdacoQgubQGxz4vPX_+-Gqx8kL4ofMZbyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dma-buf: heaps: Clear CMA pages with clear_pages()
To: Linus Walleij <linusw@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3753B253CC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55212-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 1:53=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> As of commit 62a9f5a85b98
> "mm: introduce clear_pages() and clear_user_pages()" we can
> clear a range of pages with a potentially assembly-optimized
> call.
>
> Instead of using a memset, use this helper to clear the whole
> range of pages from the CMA allocation.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

