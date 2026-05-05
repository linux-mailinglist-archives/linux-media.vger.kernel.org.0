Return-Path: <linux-media+bounces-60410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAUpI0rq+WkLFQMAu9opvQ
	(envelope-from <linux-media+bounces-60410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:02:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 293464CE1C7
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7ABC307B8FB
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 13:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9DE421EFB;
	Tue,  5 May 2026 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoeIVUHj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E39E426D37
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986006; cv=pass; b=ZxbDFnxUFo8LgkAdb/xTQpTUQK2Y6NrVtiIGjI7xXH7RX6yGZkGtpImjBxn6XddbypE7BK0IdAfbtIefGLrAbY19SsZvdGEp2oyiO3w4YHob41j3Av3uQmEJT4LUjqlzyhMqwCNfrkoiXN+Qk/O4IJZkbxhU8PaR+Rvg+thHc/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986006; c=relaxed/simple;
	bh=hIDRLg2eWaFSrnAvJdPT6cUXbRWnjBe9GRrwIz05WwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TphUZBgwUZn6kv0dHRN1U+irQ7Mv6BldoIlTVV+snzR/P0FYQ8nYeSs/+zZS5mhw7A9QFCzy4pyN8nwuw08jfEIJDOZNDY8YBzBF0GjocAM6l8n5qyYyg3b9Ky2sV4CXzbOnA8fIo+JMgHkCVKGgOtNsG+nNXD9HoXmIu8x83FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoeIVUHj; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-651c366f7efso4988065d50.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 06:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777986004; cv=none;
        d=google.com; s=arc-20240605;
        b=PfY1bi4q4olmlLA0lS698LwyxhqD3YsH607Wo5ZnELxHgLHvCkRpiyldT+nOELQXS/
         1CNcZd8Rqte1Y/OZHkYYwsFIRMi+KO+ED2w3kY2w3aqrTllWAaOVJaRMaXPKJzjpxR44
         RcLAo5Adj8hjbnISarCWvzw7hpdMoaer7QZgeyr57QULPcbqb07jkRicVoBOHK1zFHPS
         K5k9PeysO9TlubIfCHOHEHMImkfcYgzQZbKMd34EH1ilzx18s06zHPv3EbvZERnwODWS
         BOIPL+KOSs66DBjRVQt0E4s5IL7J56ZBLaYvpL1lUBMHy6lJmbDwBiANeCqzg+wAp30O
         Ct/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIDRLg2eWaFSrnAvJdPT6cUXbRWnjBe9GRrwIz05WwM=;
        fh=gaE3G09tubm/pBu5POXjmisojtbZrTvP4eAd9le0pLs=;
        b=BEpiWMhIEegq9LrdvxltdLZNDfRxM62vAJgB8Pc7i88Hyj3fN3zbPH7hskn8ziIhYx
         2Y8jksf2DXo+XlrKXJWn40qjSdWHr9Xw5cz3auX2Lqs61M8CkiibyQWUxJwoums7yqkY
         BipmtX10gmUqSOifzeAgHHEKFhUzzLmUeXhUGneL0IXo7IEO7nIJuHLQyGoxSFaFV642
         2epusiXnYPhQ1VSeu+jJKVa1WomxXEvFhtEQz0prU7eHYNF2iCvjTI0ZrexZHVwjKtVy
         mbBgZWnXiLIV+yXCEugKREUne5trF+qRGaxG8tjzK3+H6mbZ1CR3zynBUOMWD+oRrQyv
         jHvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777986004; x=1778590804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIDRLg2eWaFSrnAvJdPT6cUXbRWnjBe9GRrwIz05WwM=;
        b=GoeIVUHj2GRSwE5ou/UpPYcxlhjdEJHZaLKeWxmSqxeY3lNYSU4g8NHXz9ch6gB13a
         N4881PESspPKYX7E6LA+og9JEsQmJ5FCzOkU1w0Br+bAxaVIAHxGlkaVyl7pwEpElV7n
         5tX7T+qJ0kGHEVpkrtFk+q2HbU7+uO8YxCHcTa065vmMr5IlCtu+opdibqqNY3W5kiiy
         CH6Nb0rXM7zV2EI6CMLznwU6jaAkCMpNMSocPol0FKzv8vHo+2YfNflPeor2pvlIAKo5
         HnVtVTBhsmqM/8aPfgyxo4uRdt2IJLBtFOuQSMjN4mc4fzAuvTruMKDmvKJosgGWB9Kt
         f9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986004; x=1778590804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIDRLg2eWaFSrnAvJdPT6cUXbRWnjBe9GRrwIz05WwM=;
        b=qSIA+Rj8H90cH8ud+J/5DXhp8RWPLpmloWoAY6WjH0DnPktLPA19KmFFLeDIIc4szv
         O+7XTv7cN9mSUpTQN0+MK/Z38EIIoJoHGf2R+/bF6NOSlYhWUsRSsktL+7kTF2LEfzaz
         P0cFMTHbpTRCuihr9FmKC0OhsPuf7dNPKuoZzf82mn7qVOfpaCPHS6ZuMV1bdoYO/K78
         JjYZb5w8lVsydYOZKukSPgl3zBDuKQqjpdMZ88rlJE/7K3OjK0So6v9cmSrMowFkIvt0
         JbBgUGZ+h4MmNB4zf+Wsq2pE9NyGCU3xI1f6JEqc3osYtUKbdiNif5LXjxfdfIZuMWem
         uwaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nJCxNbXTwjeDjCzBghByu1wrljsWPOITDw7LDqNl2oerPBGinnQ4Da7dZ3oD3FLaiEqJ3KX4D61rv2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtsv8k7BGlrqSB5KDu8QBIGB/LMfXWlfXMjV+jt4vyl1y5BCCV
	79iRGIIcA6Hj479Wh4vZ32Dinv2MeqY172ZmWIOrJU1uHN4APFHAWggjkSSrYW/m8TxEX4H2B9Y
	Xb2RdO/dv2LlTH5BgOwHj9x+8yqleDtQ=
X-Gm-Gg: AeBDiesJhkIhhb80CmDvUANrL1Ke/j8xai6gcgWdWNQgZu3+ibLtgdAfuNbXjE73O6O
	I77ImDAZoHRx7sJjhJsIpMnYjvh0yXVnSk339Aphzmhm94I/u/u5LaEzzFKfBCdqCkujf9ohD5f
	LtSCV7cF3gc3qFBqpdsZAUttRNNXUAW5rydyWGNRW3pVPeP0584qvyFOPMWqibaY9hcQvv0dP0X
	lpWR/BvS/271rOinhHzZeZvxD0DYTrlNMBFqeICoYjlNzZDMaOMPedZyxAFIKMcto7n18m8RZVX
	h+M2FLdkJJV90RfY+dFa9NdEFjbjDqmrS49nFDNgVldsAJhKYe/GIIgNcO7HHSnVIgAHTg==
X-Received: by 2002:a05:690e:4184:b0:650:4a79:f3b2 with SMTP id
 956f58d0204a3-65c3da71099mr12790430d50.28.1777986004285; Tue, 05 May 2026
 06:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHijbEXhuVRgkkPA2dAC=njGBU7vpAbxAbsSmxvvPznO-ckVRA@mail.gmail.com>
 <cf945dda-f526-4544-bc43-22f70acb28f5@amd.com>
In-Reply-To: <cf945dda-f526-4544-bc43-22f70acb28f5@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 5 May 2026 14:59:52 +0200
X-Gm-Features: AVHnY4LkH-1c7-8LjQHE1WeKKibV23GXxWelkIeQtvvCstfkg90iy7cF21RDMuQ
Message-ID: <CAHijbEXQfm4QDDfo1yiVBV9mVvogGqt_BAu2ipnhqa-EDOKteg@mail.gmail.com>
Subject: Re: Regression due to /sys/kernel/dmabuf/buffers removal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, corbet@lwn.net, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 293464CE1C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60410-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email]

On Tue, May 5, 2026 at 2:41=E2=80=AFPM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Hi Julian,
>
> On 5/5/26 14:25, Julian Orth wrote:
> > In ab4c3dcf9a71582503b4fb25aeab884c696cab25 ("dma-buf: Remove DMA-BUF
> > sysfs stats") the /sys/kernel/dmabuf/buffer directory was removed.
> >
> > I've been using this interface, specifically the exporter_name file,
> > to detect dmabufs created via udmabuf. Such dmabufs show "udmabuf" in
> > exporter_name. I've been doing this for two reasons: 1) to detect that
> > mmap on such buffers will be fast and 2) to detect that GPU access to
> > such buffers will be slow.
>
> Crap, I really hoped that Android was the only user of that sysfs interfa=
ce since that approach turned out to be quite broken.
>
> It's number one rule on Linux that we don't break userspace. So I hope th=
at you don't insist on bringing that interface back, but if you do I will j=
ust revert the removal until we found a better solution.

Bringing it back shouldn't be necessary.

>
> > With the removal of that file, that detection mechanism no longer works=
.
> >
> > I'm not particularly fond of that mechanism but it was the only one
> > providing that functionality that I could find at the time. If there
> > is another one, ideally an ioctl on the dmabuf, please let me know.
>
> The virtual fdinfo file you can find under /proc/$pid/fdinfo/$fd also con=
tains the exporter name for the DMA-buf.
>
> You can find the full documentation here: https://docs.kernel.org/filesys=
tems/proc.html#dma-buffer-files
>
> Is that sufficient?

I think that is sufficient. I probably didn't use fdinfo initially
because 1) it's a lot more work to parse and 2) I wasn't sure if it
was intended to be machine-readable or if there could sometimes be
newlines in the values and such.

>
> Additional to that the debugfs for DMA-buf also contains that information=
 and I'm open to the suggestion with the IOCTL.

My application runs as a regular user so it cannot access /sys/kernel/debug=
.

Having an IOCTL would be ideal if it is not too much work. I'll fall
back to fdinfo for now.

Thanks, Julian

>
> Regards,
> Christian.
>
> >
> > Shipping an entire BPF compiler in my application, which the original
> > patch suggests as the replacement, is not an option when the removed
> > alternative was simply reading a file.
> >
> > Thanks, Julian
>

