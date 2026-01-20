Return-Path: <linux-media+bounces-51151-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KkVNM0JcGlyUwAAu9opvQ
	(envelope-from <linux-media+bounces-51151-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 00:03:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 473974D71F
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 00:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2FCBBB20DBC
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 21:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA31B3E8C47;
	Tue, 20 Jan 2026 21:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dYxxVMoj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00663D3D0B
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 21:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946180; cv=pass; b=dVdAvZcgaeyQLhpMFCD8OzktSz0kvqnlBlEDU2LrfMO9eJuyLN5KQGhteg4W2g/ZYAcjahSOdzvbtJ21iKKOgsn8r4FpS9wxADNh4xTFduccFAgLc1KKDLxWgqBVksRrrKHoLG6zPuN71k5oJtNRaNr8xy5eVgMrh4xkhVeIZmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946180; c=relaxed/simple;
	bh=QVZL0RZkg04ocz6rLt32bQ6sRNMP0a56Dl2GzXli5GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cw9EgKXKMi8a2td1Ykf3QCRhZ+X4NnpVNDMPNg+h0WV9gjC4KZ969qjSV8yjhl2gWL+3nWCzIJPeZ2S5x8az5UeK+KAiBT1coIRinqzOvppeLzSIckyScYshTqsKX2ygpus9r8eXB+Hgx/+8ZI+Az58MtC5mIgM0HArDfP8SRgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dYxxVMoj; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee730612dso21565e9.0
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 13:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768946175; cv=none;
        d=google.com; s=arc-20240605;
        b=WOtm8IR1kO2vNfESRyXGOty246UQEV6qRovmqMCmBrJQYUzYoo+JiRVjNHF3tl/sNF
         wCLZqILyRaGzFA6AHiO9l23oEAyskUkLnry6PCd2A8u+YTONFZEDSWMXkuU+jJ8unW7X
         WPwGlxwFhapxRD4R/h5KiDTUKYzdmgnFEzaJfFaGUSp2bCrsrWnbaQ3G2Hp6dLhhVxnc
         ZjWEXCnH4WygOW3HmLbE67GQUL4Io1mv1tyObwGRgt4A/sZ1VJosi2uy8Uj/lnhKz2Oc
         eiGhx3EPz4frQWLshbSPZ4LztLQyEMhu/oS/gdkDfU/q8nixvvl+BngaRp7WyvWu1TSG
         rarA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QVZL0RZkg04ocz6rLt32bQ6sRNMP0a56Dl2GzXli5GE=;
        fh=tqR4iGKeo4SpeYS02N0wMxwcNem8C39zTxITWkr692c=;
        b=e5sAxslcu1ysZJcnF9mgYGSzK9VA4z7KAmKUL0SC1WkzGDyu7M3NpnwXxHdUGGDRt7
         IpoTpmLOs9Ps+01vfH973K63YkxrgMBTB0iZNcpGoxtkDloeNqoLUlffb68J9Qxz/7DJ
         cPcJTfGIxQCfoUp/KYb90t/sCfQLXK4Xu1RmZXVfiaOjhtv4apSlxDERqM6F4e5NdBve
         u2ESX2XhWPQ0iIfs3fYAs7+tug2dN55sVFO5zKGM6ghSjXxB6upJxiylpQIxvQ7IXyad
         SoNW7VbJxJHt/Y+9APV1yBv3Hc8yjgVcsxgStGSwOu2EuKLQVtxFqHPtcJ0vXObR8TR8
         de4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768946175; x=1769550975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVZL0RZkg04ocz6rLt32bQ6sRNMP0a56Dl2GzXli5GE=;
        b=dYxxVMojgtS23OsGhKbjZH/obB+6y6DHFe2rb+iW7Lekr/f9Um5/qNq2Qglfila5Hl
         iY2030N2Y754XZxAJ2tqXYmMO54D5zrn/QH3xMtO2FDAZyvvJRpY1fJBIVc5s205HGb3
         uKTDiLqbksZfamQPNDX8cOsr60KMCmTgpB8xOv0uNIUuvlHUSOCffsGt10lk7mDhd2dU
         Kl+lB/bs4ycCo+IM74oxKc/U0/uxKYmJUwwI8f77vJ4MAOuZC1W0TF1F/rTnyHnG/2KA
         pvdYcIvPuxrsWnn9J/7ff6Qeot30sFxdsIRT7LH/mUbvjEdkp1cqoTsIGD76YbRsPpmh
         h3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946175; x=1769550975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVZL0RZkg04ocz6rLt32bQ6sRNMP0a56Dl2GzXli5GE=;
        b=O+xhRCiFWlwDbHLwNa38PN0a2AG4N6EJ+4k0EAOkE5w2hubELsCtD+cus8BuEg1PJa
         6dqgL5YxGl7q4PEpNTp99AvZGfRtP1oXpT0kgcdohPp0Ta5r/u0hFkUDvKgCEzEqezL/
         cOFfYyaH0o+Mx+YOqvE9xelZ2tG9UWA5hRXaEFmJ6nklWjR+y2J0vU8tByemGbxrZ1Zp
         fAcoMVCi+nDbBJRf2uG8qadmOMYiXXmLe1W2vFFgXitMxY0X65xxd5zyPT6KWY2lEkJU
         V0Jaag+/K+IScW55+erq7S8X7zIB/CDfayvvQYGyDtVGPOdbQK1EPkm7ZJpMe5KjjKBq
         P57A==
X-Forwarded-Encrypted: i=1; AJvYcCVFqqIpdCIRWzB9yZGITy3wxzMYX4tSEOgitp3IZKQjz0z6tGPbFQ0rcLJoDOKVvsN3+wP9W9O6t8Nahw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYXMuwxPufXd/yu76aml+W86Vbfg5b3YJDfgYbT2+tqGpSlOhE
	1/poOAd3BEwd19XmmZAW9BQ+A11fhWjGJU5yTodqi7gvmOUt1neB/OlpfyIbCNTwld2PYh0K+7L
	TY1zMEkS6t4bBkH1/SMlR692cw2wTEkK6WFKO+f32
X-Gm-Gg: AY/fxX7rrMJUtobrIHB753sYdH5Pywbo+rzT07S6Xm+oVLGoClYa8GyvJqJt+LepgHV
	tOb6hE23op6+W47yGDQZW7JgRKRSWdsGl6MhAejhs0z8whqmFKtiUn6S9D5iE15WvSsqcAWyuN6
	kjpdRy8Xo7V6W79a3zKUJsCDztOFOBdH9UWXMUcoTs/X3vLTxaZrpTkPXbDqopbLkvOzT5viTmz
	cACuKLC/B30DnIryI5Wh6+IdeMX3PDhQVo+QiEx2lu0aVDT6FYlvtjgOWfUC+uKpS+YpGqxptt5
	zcOLa5gfliYLvlXB0FT/9d5nE9Tj6UJ3mlNSfHd0T4kyum9xYXWNoHDCQ/L/9kJTqQNs
X-Received: by 2002:a05:600c:2294:b0:477:b358:d7aa with SMTP id
 5b1f17b1804b1-4804269ded7mr182155e9.18.1768946174451; Tue, 20 Jan 2026
 13:56:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116190517.3268458-1-tjmercier@google.com>
 <4cd1ed61-0b19-45ef-a77c-7fccde818ae9@amd.com> <CAO_48GENCZrXNCgXnW4rujNMHk8d9QrXoACT1zpJhWR0r0jACw@mail.gmail.com>
In-Reply-To: <CAO_48GENCZrXNCgXnW4rujNMHk8d9QrXoACT1zpJhWR0r0jACw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 20 Jan 2026 13:56:02 -0800
X-Gm-Features: AZwV_QhAkwIRZ_-oc6BWWemkNMCWB__3YgDNYfNqrl_eFujJJHCLVOgaVNe7XtY
Message-ID: <CABdmKX3LGWueY91k+i7_WFTC8b8LJdR8nj6Y9KeJMRk7fSrsww@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Remove DMA-BUF sysfs stats
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	TAGGED_FROM(0.00)[bounces-51151-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,lpc.events:url,mail.gmail.com:mid,amd.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 473974D71F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 5:08=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro.o=
rg> wrote:
>
> Hi T J,
>
> On Mon, 19 Jan 2026 at 15:15, Christian K=C3=B6nig <christian.koenig@amd.=
com> wrote:
> >
> > On 1/16/26 20:05, T.J. Mercier wrote:
> > > Commit bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF st=
ats
> > > in sysfs") added dmabuf statistics to sysfs in 2021 under
> > > CONFIG_DMABUF_SYSFS_STATS. After being used in production, performanc=
e
> > > problems were discovered leading to its deprecation in 2022 in commit
> > > e0a9f1fe206a ("dma-buf: deprecate DMABUF_SYSFS_STATS"). Some of the
> > > problems with this interface were discussed in my LPC 2025 talk. [1][=
2]
> > >
> > > Android was probably the last user of the interface, which has since
> > > been migrated to use the dmabuf BPF iterator [3] to obtain the same
> > > information more cheaply. As promised in that series, now that the
> > > longterm stable 6.18 kernel has been released let's remove the sysfs
> > > dmabuf statistics from the kernel.
> > >
> > > [1] https://www.youtube.com/watch?v=3DD83qygudq9c
> > > [2] https://lpc.events/event/19/contributions/2118/
> > > [3] https://lore.kernel.org/all/20250522230429.941193-1-tjmercier@goo=
gle.com/
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >
> > Oh yes please :)
> >
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Thank you for your patch, LGTM :)
>
> If its not pushed yet, I'll push it tonight.
>
> Best,
> Sumit

Thanks Sumit and Christian!

