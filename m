Return-Path: <linux-media+bounces-64061-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fojKKVmFJWrKIwIAu9opvQ
	(envelope-from <linux-media+bounces-64061-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 16:51:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174D650CBF
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 16:51:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=syrkoMLz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64061-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64061-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25BF63013278
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 14:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594AA3ACA79;
	Sun,  7 Jun 2026 14:50:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B71FBEB0
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 14:50:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780843840; cv=pass; b=jBl+FZpdhnYjO8q4pnhd2VqJYF4cD/do4MeLCzOAKl7K2rUM5IGppshCsyh8TmY46MoiS4bdo0NjexPJRkfCyxtVxkUxuTDCI3v7C8YkppA7hJ9v/Dk+Tw5HEbSrDfoOC2IR+gmB+3GuGGs7e0C2RkXR5GhfL/WMTDan0eqbQRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780843840; c=relaxed/simple;
	bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqFhH43Y9SY3bg0sOlsP3NCjLDX6Ok0RN4TH5KukC4Z6bMO1/8I19P9Ix63iusgO7xm1DIzVt+zy+KiRjHF1LgLO4G7Eb+vG/fqSx4mPMJYOsNksTNEfkNsdo3ASLEAeo+tPQvnTIm5lnaARy4Vo4fYax+rI9duV4fKJ1XSGMSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syrkoMLz; arc=pass smtp.client-ip=74.125.82.175
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304da3b4508so341742eec.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 07:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780843839; cv=none;
        d=google.com; s=arc-20240605;
        b=iEjSF77kDdfIbrqy/PFGAtitNkzAztUmUvTiPss7GMo1Ca7RG38p1VSgPqZxYRdAiP
         3UEOqkUY1Svf2Q3cKSyAfYQwbnHL0RYizLyhcW2rEApV4Ht7CqfqS7w481gsXZqVnfgO
         vZ1OhODHkm2ptYe92ui9216HU1fDmJ56Ur7V5rOJQBm7cQHXv65KC6HUVf69jP7FUQ9W
         Ob+2p9DO8abeRFk9+btkqTTHdejrHHLJs98EkNR+zv1L60TdLdqBlL4UGAd6gHw6c9F3
         TmqmT5LFeas1JhUeedIyEYMV6xBa/GtAY2g0XdQxghF1B3+0hIxj0oUgaLdgJ5Y6SUxK
         kFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        fh=hcPe8Z9ANA09nMOHtSQD/gn4N38wg3aejy++AOITnhY=;
        b=ITU714LXPVL/a4/3V5Hsvz7rLmnv3kCJymEjHUaWbYacv/4dmL9OiVZMRtobyR8VuZ
         4ibXDYQwTb6H/GI1CnQscnpyrwIrwUTwPUVe9ujSa5n0nm5uHrgYmLbcaJOED9wiUT5A
         xFbwi79BRj0FGsHjcr0bQlXQ28/yQ+0yqYD5kvV1ORLUDhD4H4yJScjiSH9VCLLn8gTM
         45cidxGQIrJnMCk+qr+WIrPdPy2ZaDCZb6EEW5kzfmLKt6MY6gIzwpqMz5udAgOcWqKW
         ugRq/95sIMZJM08UAowjZ0+N8+8diFHQ95dS5TneAmFwd7ilIeIGGTBLJO/HAT59yCqU
         UoBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780843839; x=1781448639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        b=syrkoMLz84RXXGpP5IR+4NLhd8fi1k79HUBAwBSr0U1wGAlaTdWceZaa/vtT0MsTvG
         kLxqBDphZf1+PYf/l4SaNu5S2+SKXzMfvcy2LjE2hc8HTHEaXEWOSC9F78RRYmJr1vEf
         VSjzXTXXIBfEZZWqeQR9Y+ZaiaqtAGCLZK0uFz2r6MQN7JX9Ek4dZtOtU/X5GSHjUw30
         NWcCtZgoXw6+7L/1NYSEgj5q7l85eSIk9G6x1pGfhENC6FHGaAbpnk8TMzJmPyfZovwP
         0uB6hzHTp49MUzlapQFN+NkVLuPeJYanJ9ehhibH4Fspqv3o0JHj3ecU+pEgw5BImy7y
         bL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780843839; x=1781448639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        b=fWx3wncYpQRJ7BYyV6OMv5cei1/t63XYWROn/JcaV5gInCxCfB/DlUu2cByASL1pQx
         fsV85bDmnIHeQxit56t9TqbKvPCTq/vzA0KzbZ2b5MVRKcFJMrPZJga3EABJ9qvDrWZs
         PXVQghVXbrD2nMaR+f0BLdCvyV10aWyCwlMfcLBGn+Pt18cwBr5fg0yeXjRWchdbALFE
         LKm6Ze8b/DnsRZh3Orpeq5dMHfm5c0kkB46fTTrqnqQG1ECv9YEbPFZAD3FsUD7iDbJh
         soXK1Id2RU4DdW6idFlJh9Pdg7/67xgDpi8fAJHr2MPw8Q2SdCTZXSokusHmXy29iA/e
         J2Zw==
X-Forwarded-Encrypted: i=1; AFNElJ8AdsBaK4PQsj2+6c5H28eKdcNdai9tkb/foxZytjV2A1P8U1tSNPanhF56KvlP7heWiejnFZj3D/DuIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMz6POMa8oyaqJZPAQAk4M2X7iOr78+IXBejJd0voTyBZyv8cZ
	ZxAIXxc8/b3KD4IUMNaD8bTr5usQeitOqI6tIUtMaQc+nz0bsqiGmPPB0D+0M/HVdCCh5Orunw8
	5YTNCF0kN5UJAMDXdaA3Q6Y8fmQMlqzk=
X-Gm-Gg: Acq92OE8/1NDyTYed8BFHdRV/HY6I+dm8auIE6GpEy+PleSGM2dzXvlvUplyQz5rByJ
	Sk8covJH37cX4FyIuOdiw7STYOARXJuStmNMK2WEKHEKAvY9BNFGDHONbG8keVBtm5KCxk8896A
	0+TVZmLs+WiEMIFrenSata8OllBZqA5T/rIzQgq0rMixAX+69snkgwy/ie67UdDLsHc2JFW0Wl6
	vTXLlZai6xC4urD8OFRPabZIY/NUBehWC6hELHZ7fTfvcxe5xH2GeEpRmqqS6cKzZtS93JaINvo
	u6QQgusPSl+MKb+Et68EsC3aASD84OcAj0RG9WtzPRXlvmChDx+xaJUGFzuVnZey+5eTh4dymLL
	eBDu+oS7U64ieT68+VHMyXJ6JGb9NEJJ6Yw==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr3072058eec.2.1780843838713; Sun, 07 Jun 2026
 07:50:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604192740.659240-1-lyude@redhat.com> <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
 <DJ2T75A5H6Y2.ISIBOQVMAO4I@garyguo.net>
In-Reply-To: <DJ2T75A5H6Y2.ISIBOQVMAO4I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Jun 2026 16:50:26 +0200
X-Gm-Features: AVVi8CeFi5djIGvrvuLFIe0ggcr2ckGO7PwhkagBDt7mLNkIJPuv5Gv_nWehfL0
Message-ID: <CANiq72=qKckJXFJU6TDKf1yh3a2wBS4SQE9fiGKpVOYWYtL8QA@mail.gmail.com>
Subject: Re: [PATCH v18 0/4] Rust bindings for gem shmem
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:acourbot@nvidia.com,m:lyude@redhat.com,m:ojeda@kernel.org,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:maarten.lankhorst@linux.intel.com,m:aliceryhl@google.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:tzimmermann@suse.de,m:mripard@kernel.org,m:airlied@gmail.com,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dakr@kernel.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64061-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[nvidia.com,redhat.com,kernel.org,lists.freedesktop.org,vger.kernel.org,amd.com,lists.linux.dev,linux.intel.com,google.com,ffwll.ch,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,linuxfoundation.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0174D650CBF

On Sun, Jun 7, 2026 at 2:17=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> IMO we really shouldn't use Clippy to generate code. We spent too much ef=
fort in
> fixing codegen issues that are only present when driven by clippy.
>
> We should just run a check phase with clippy to get the lints only, and t=
hen use
> rustc to generate actual code.

Yeah, given the trouble it is giving, I think that will probably be a
better approach medium term. I don't love it, because the original
idea was to avoid such an extra phase, but it is definitely better vs.
random source code changes...

We could also increase the symbol size-related variables
(`KSYM_NAME_LEN`, `SZ` in `modpost`...) only for Clippy builds to a
ludicrous value. The extra phase approach would avoid surprises more
generally though, so I like it in that sense, and has the implicit
advantage of avoiding someone using a Clippy kernel in production by
mistake.

Ok, I can take a look at that. For now, I will pick the other patch.

Cheers,
Miguel

