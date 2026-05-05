Return-Path: <linux-media+bounces-60443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BCpKs7/+WkqFwMAu9opvQ
	(envelope-from <linux-media+bounces-60443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:33:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B13674CF7C0
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B815301933A
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C973B37B3F4;
	Tue,  5 May 2026 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KbH5deyv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC5C3806AC
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991588; cv=pass; b=eV3DSb7OGVtzPK2AZjDlojZzndlZFa/y/38vWH3h6/u9XcCQJaC0yYFEIlEPWPI7kvtjDHpp07O2s5EdzbU1m3B5tkG5e8vZ3FKKhclZ5oDm/o6gP3L6pOIi8kyxmqZz4TEDa4O9uhZEtEB1aMgH/BL9xZD4/X6wlNgo7qMdMZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991588; c=relaxed/simple;
	bh=5h+jyKMMIPTXybgbDkdR5LLDHZaQlqwfa7Kw+QHGnoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eV8QNduEnjKkQR+XFf/UsWDs9dfFIOnZdoZwUOFTux4BnqjHhSNTCJuJICM9PdT6hTcXTigO5C2KbBFMo8Ki+WYrwZyRAU7JG+LU+y7l+Hew2MqKtGCKI9ZewC/8Q2ostFgdEFT94AVhNCUkjb6lC+0pFNo3l2Mw48cR0YtTW4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KbH5deyv; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so95495e9.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777991584; cv=none;
        d=google.com; s=arc-20240605;
        b=eydzG10JGFYiDrqsrqTh2ooRMQ5g7uyPf29oibOhl8T7fNuWpfGcHlctvuDecFhgcs
         GLbutgUC+GVXWp8L9YjHUZYv9fqhn+NS9QnoNIqjGb+WUTx5d5LB/uuqEak3HR/Kz3lT
         KEb9Q/97wNdjitFKT9UovBkRKTmWi/AzggQ1G614Wnn3rKZ+9NkcL88IY5qQA0yZdbcU
         ahWNsDhciTVq2Bd5T9of8BN14vy6N+CEQSL1wVeM4kk7QIDJDr72t+wKmO/t+7nmuXlO
         tUV9Qc6y1VSWC6sQANqkLYJT1GVWXSxvsMWO0Lbh6aipJivwTCYCtl+f4K53cZdqAzJJ
         pfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5h+jyKMMIPTXybgbDkdR5LLDHZaQlqwfa7Kw+QHGnoc=;
        fh=NWyfEdXDXnR1u+74oNl7+MExO9diacGFn1kd3WTlBEE=;
        b=gLXaz9UUnkPdYboTcanzl+3KneSM1p50lgdyvdQM1t6FO59LWBshlPq+s0ZIiKlH61
         Gx+mUr89IlpbcfCe+IcRX8nCtm0oWw3FIGBHoWmtWh3Dz938xozpoTL4jYhrkCkBUfBg
         mCMyQMUIY5cTs10aO7fVo832MtJXyHEsyO9EksQ3ZXtGVBuv1kvhp2w77BWYp8I09SWW
         Akp2xrAiPDebqB6zVlJ5z/dX0mGUtMJ/C6sZGISioNcG/jxW4cceuhQ8Pk8lCo+dAMgi
         zTG/7sUj6F+VNKlwHSaxgeOwJ7SlCbb0upS6oIBCf6fj11htrjlHjwQNiCdBqwYWGO26
         s3yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777991584; x=1778596384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h+jyKMMIPTXybgbDkdR5LLDHZaQlqwfa7Kw+QHGnoc=;
        b=KbH5deyvNLMsTZsp8dKuX2f+nNnmzTa9MF+MUCAqtuqLvL6IBR/CoXhYAMnuY7kz+p
         mBHh+5riix6HEOBVewCDNAEAA6vzqwhN6MY8Z0MYiIcxpLG3Qpt7EqbZcFhnSIPUz2Br
         oPmcpfwC2MVNkeT9MeLSDMR0XuCHdNEPTsTrRML9FL7BJZ5FzHSGTdHbx1rKrf+1lOzE
         G011fLOsL3FJaI9EBCvu/KLl5sHAyEgmPb8FmyrBfb+AgwAlzpOgBcgU8mIPtTs5qQNC
         LjtvXRx0/pRE0NRjBmmhCyCaLiz7Au/lXrtUz2XpZumyHy6oIALzrGVLwDgEDRuYmeb5
         fwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991584; x=1778596384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5h+jyKMMIPTXybgbDkdR5LLDHZaQlqwfa7Kw+QHGnoc=;
        b=ooTSki/mpqGaVOCbq88OG6L3nuK23bV4iP/k7VdoWRbRmJkze3g2O/VIaf4Hf/Ss7J
         EMqBw3IdkWWtVWRJfQ8q5EH/tSLWp4jYoX0mtyhFnGmdcFklMmzc/oBc1OMEYxEAoUnX
         LuymjtEtidsgqY/Dr+kdz+mqOmJdxkFKfoH30b6qLLfPKMOZ9vnelNK/oK2wVEo69jKi
         ICwfIqVoH+9Faum7JJwXYXuEqpR7Erutb9o9s3IWAXL4uNS9TsIZteXntXYg4pq+uFcJ
         ON/QcWzc1wMuAyxM0kLEDP0FGbH5/pJ561iTlACI/lCmkIVufydCH7AvL8iu81TKlAKQ
         RJdA==
X-Forwarded-Encrypted: i=1; AFNElJ8vuMBBj9o0Z4ovrhCnFABX4j2uik1h9bUokkbtLtLMF8npHUdK6+87P6cVP1iFxW/vOlA4KRYjhT1SgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycjz/lgAuRZ1CsjG8/DXAE9rSwRNFTQQNkq6+J0WPzBzQohD1c
	+cWtNg5Q8E5FqbZKZ5iGU/WoY/eo8Fc0nuDYvj8by5WQVs9b2asTMSKUs2fwNc+L7TgAxeyIrWi
	65o7IF0329dNKkdswmmiyrj0a8PSZ52bJDeP8bp9d
X-Gm-Gg: AeBDieuhV9KK9kpZ3HVnsPTYA6ESudDUl/QgSUB6hC4VuhQyTGidkvbvLRHJrbG9R/B
	WIuB32R1wHnjmogxJUQrI60A3Me2T9KOk3wgDky+K6D9sRA3GvcTGdfuhCVX+BsFo6vB0taBCAx
	SnWzz/IJxN33a5l9EoZg8fxgKqpyjBn3EF1nkjECnjG4f+nZS5S6LG+7qxJQypr1lwXaZpKVnPR
	1oU1gIloZe26acojBRhadj4pFPdoKultEKzGZR2I/YbMEqk3M+nQBKXnJBkDbApihu46OgISOr3
	Z/uZy0x8xxon5fC0MrNWP2t5f3PpL9pVB8BAJd8HMIKyHPe4LqmMF4pk79WGCZbuhh6KGp0=
X-Received: by 2002:a05:600d:8498:20b0:48a:5f32:62d0 with SMTP id
 5b1f17b1804b1-48d1474eebdmr937275e9.12.1777991583578; Tue, 05 May 2026
 07:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHijbEXhuVRgkkPA2dAC=njGBU7vpAbxAbsSmxvvPznO-ckVRA@mail.gmail.com>
 <cf945dda-f526-4544-bc43-22f70acb28f5@amd.com> <CAHijbEXQfm4QDDfo1yiVBV9mVvogGqt_BAu2ipnhqa-EDOKteg@mail.gmail.com>
In-Reply-To: <CAHijbEXQfm4QDDfo1yiVBV9mVvogGqt_BAu2ipnhqa-EDOKteg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 5 May 2026 07:32:51 -0700
X-Gm-Features: AVHnY4L-CqRCk9K_YM_TIPhfxSGrpHWAX4Wk2aGhZey2Xo5NNg91bzKueU3NeaU
Message-ID: <CABdmKX1pDc7wpLVQzM0ihH6AfW+=KWdyaZuorMqWCbC80Y7-Bw@mail.gmail.com>
Subject: Re: Regression due to /sys/kernel/dmabuf/buffers removal
To: Julian Orth <ju.orth@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	corbet@lwn.net, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B13674CF7C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60443-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Tue, May 5, 2026 at 6:00=E2=80=AFAM Julian Orth <ju.orth@gmail.com> wrot=
e:
>
> On Tue, May 5, 2026 at 2:41=E2=80=AFPM Christian K=C3=B6nig <christian.ko=
enig@amd.com> wrote:
> >
> > Hi Julian,
> >
> > On 5/5/26 14:25, Julian Orth wrote:
> > > In ab4c3dcf9a71582503b4fb25aeab884c696cab25 ("dma-buf: Remove DMA-BUF
> > > sysfs stats") the /sys/kernel/dmabuf/buffer directory was removed.
> > >
> > > I've been using this interface, specifically the exporter_name file,
> > > to detect dmabufs created via udmabuf. Such dmabufs show "udmabuf" in
> > > exporter_name. I've been doing this for two reasons: 1) to detect tha=
t
> > > mmap on such buffers will be fast and 2) to detect that GPU access to
> > > such buffers will be slow.
> >
> > Crap, I really hoped that Android was the only user of that sysfs inter=
face since that approach turned out to be quite broken.
> >
> > It's number one rule on Linux that we don't break userspace. So I hope =
that you don't insist on bringing that interface back, but if you do I will=
 just revert the removal until we found a better solution.
>
> Bringing it back shouldn't be necessary.
>
> >
> > > With the removal of that file, that detection mechanism no longer wor=
ks.
> > >
> > > I'm not particularly fond of that mechanism but it was the only one
> > > providing that functionality that I could find at the time. If there
> > > is another one, ideally an ioctl on the dmabuf, please let me know.
> >
> > The virtual fdinfo file you can find under /proc/$pid/fdinfo/$fd also c=
ontains the exporter name for the DMA-buf.
> >
> > You can find the full documentation here: https://docs.kernel.org/files=
ystems/proc.html#dma-buffer-files
> >
> > Is that sufficient?
>
> I think that is sufficient. I probably didn't use fdinfo initially
> because 1) it's a lot more work to parse and 2) I wasn't sure if it
> was intended to be machine-readable or if there could sometimes be
> newlines in the values and such.
>
> >
> > Additional to that the debugfs for DMA-buf also contains that informati=
on and I'm open to the suggestion with the IOCTL.
>
> My application runs as a regular user so it cannot access /sys/kernel/deb=
ug.
>
> Having an IOCTL would be ideal if it is not too much work. I'll fall
> back to fdinfo for now.
>
> Thanks, Julian

Phew, I'm glad fdinfo suits your needs.

Adding an ioctl would introduce new UAPI so I think we'd want to avoid
that unless absolutely necessary.

Thanks,
T.J.

> >
> > Regards,
> > Christian.
> >
> > >
> > > Shipping an entire BPF compiler in my application, which the original
> > > patch suggests as the replacement, is not an option when the removed
> > > alternative was simply reading a file.
> > >
> > > Thanks, Julian
> >

