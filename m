Return-Path: <linux-media+bounces-59734-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKm3FRba72m/GwEAu9opvQ
	(envelope-from <linux-media+bounces-59734-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 23:50:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 049E547AED7
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 23:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE5D1302A7C3
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 21:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0641537CD50;
	Mon, 27 Apr 2026 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PrFQTTYV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD0F39FCCF
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 21:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326478; cv=none; b=JWUVz7EHKm6R+fqAwvZyNIkREWNfjxHpnmQcFTxF520OKQjs0/k4kGYWGfSMBs+Ln6l6YnrVoFRJiHeV70YGTLcHwDYzJmkh7h8EXFo5gPkmSERuyrDQcsW/4hcKi7/RIjoFcVAwbBB4YKyI1CYe5dkwi+C1Uz5B0Nob2EwvdfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326478; c=relaxed/simple;
	bh=i/k46YQbNxc6jmDhpSrBTZQploRe2hY24KQV/uGHVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNwk4BOJQLTGD02D8CFJelwBRA90iJFXzvRpa8KXJpOKfrd4scwjrZzH0QL3mcja6cSsjN7/kShzqp4zlhW+B0xfAYhorxOTzd8Rcj0tB05fIc2/w3XZRkGnA0ot7IgtbmzacL+nAus3jzYQ9Z7zuMNSnMYIeqUgiyYcliTXydk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PrFQTTYV; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so5634915a12.3
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 14:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326475; x=1777931275; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=PrFQTTYVMHv4cnMKFqL0+s+aKDM2oGr6hXF5ZXSY29SIbrfPeSjtL30Zp2T+mxOk82
         W3QBQ1HvYT++hMjE0DUX48V3wUWia/xaRg36CCxr37/pc+/dK6kr2PG6Nk/DepbBR64f
         D3w5WwhGx9NP2NpkHwDC+Mwe+lrlrype0kD20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326475; x=1777931275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=C7ZZXcD3mftWggbj7Ne4lMVJ/4mo2oS6pKno3iiWlhRmQaj88TuDtws+iuW5aW1VHP
         1dZoy8in6Q65CxbgJ1ZWgEgjrApg3uQ4+vhPVqiSQevAAH2wZAxAuXHEtV0o3ErW92xB
         Q5hD5TH4xv4+3xRv2IMSKxfZ4UnkksU9NypmBzvffdZuWZn9MfpgOQ3RSTF57+tjcy61
         4wMAVOQRpj8aX5M2VLPUgwRrgqziEp7eiOizOX+Py8DciOkfYVCKH/CPPTetQdrhZnm3
         Ro8zjKc25qsuJrMDC7FRpOWSFtPhqHUdmmstDyXehz6YoqRBP3FFmY8e11MGRdMDUjPm
         8DDg==
X-Forwarded-Encrypted: i=1; AFNElJ+h2fZAkibmeeMn00JuEE24QDGowjsHYeEmIoA6SAuRpBGs2nCHFzpUs6x/G8cN9XdzPF7yF7dm3/UIyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzenCZcL5j7JgK2FXqyan9OkwvAWfWeauq9AHTh3k6K/oT16wYa
	nu8PhJmCdRMnedidpt5nq+sgU/BTEcHoVVaeRacz3aewogZtvezumJrwHAQBEbJs8p/2LR+x7vQ
	VfuOduFZpVg==
X-Gm-Gg: AeBDieuQZZBcpCOsjxKUW/ueYOp926VLCSNlk7WjsaT7vh0JM+XCcraeJZ3cuvJZiZU
	8PO+7sXXv3sgsxF4Z4vuFVRzzY74CeB93XS9NXlmJ+9XEQQqUkQX/3TWdk21xKf1TpFvxkx1HuJ
	KjPTXey/QjjCpSJNZuUuPVcUG0KGXxyjaQU49pRsIDoCPDfY8oIi2T3BCH6/VpG8xpCk/L28L23
	iyBPjT7UNk/nZYGzJ0VpQKNZMEJh5R5+ZumPjTDA8YPqR/vQBpNiVnqmf6dazg/ov9uNY2wXWUJ
	JH44vaCeAxApJY3byLDVgDrwOKam5jw+VqYvH26duE1DipgmUJgKYakRsJc1v2v1S2NXYeAl6V1
	RzcseAKVWe4Hm7Lh5Ng8kZF7TI5CMajk+nolIz+MtajtQXUaWPBlKKQrvT57u4ebkBE0+OGSw/Q
	67bchgM+qsZLqNtr6QBV6gT+ajJFvR2ans36GJ4zBouvXv8LpmaKleImvaadHrM7bhDHeVACXhP
	MIGOnPVkSA=
X-Received: by 2002:a17:907:6ea2:b0:bad:d530:dbf7 with SMTP id a640c23a62f3a-bb804727dfemr27900566b.32.1777326474573;
        Mon, 27 Apr 2026 14:47:54 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c081c40sm9659866b.55.2026.04.27.14.47.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:47:54 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8f97c626aaso849673966b.2
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 14:47:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+J512BOc8xcuMTPe842A1cMEY1A29bYlNi5oVSHr9sqIjCR6mBBh4klOUYvwTCVbP6E7OeoDfdjLoTFQ==@vger.kernel.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 049E547AED7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-59734-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-foundation.org:dkim]

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus

