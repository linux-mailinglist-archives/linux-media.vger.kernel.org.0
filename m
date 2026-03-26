Return-Path: <linux-media+bounces-57162-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA0oL6pVxWkk9gQAu9opvQ
	(envelope-from <linux-media+bounces-57162-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 16:50:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 605EB337DEF
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 16:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AF46314674B
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 15:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2CE408223;
	Thu, 26 Mar 2026 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LErCrZ6Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE704035D4
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539443; cv=pass; b=MIFbeBbewlJ0xZss6c+QxwH3NP5/Fd7xfuoNSvoxT9fsIdPIgklP67VGedwe45e244beR84YUEdyg06/SPwjYUJMWPJqmlm5OWjgHB4MYS79R47N+Lwy4awJR1o1eCeni/6wAC4gcPH+y0qAXOvcKTePODO8C9IqOFHiERE7JWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539443; c=relaxed/simple;
	bh=QDxg5XmNoFt4YUmz45JtwPcoB1FBAXUZ4Xr/Cp6D5Ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u13y/vqCvQL1vzrN+PD94CcEFYH9mO4tXJtZx7Zei30AYduZUnERRCMdtVOAi99LlooWRcvwqFobQwa/Iix3x0PDYw3tK7O86tQqD5/Un65UwfjAt2gTu0OP9O6Ja0fseEC8wRmQDmiGSfOVXsD+PyPxvPUT4DlxoJ8tZWbENlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LErCrZ6Z; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b983bb07eso349435f8f.0
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 08:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774539441; cv=none;
        d=google.com; s=arc-20240605;
        b=FX2ky8oiOc6mdd/gS/94y7xS/uaKzJzVaAJvYDeUTZrkqt+5pxD7S+AT1pjj9qN4jN
         LvpqiPsIyvCX1yv/GP6Ion47QfNRKpmqU1Cp5AH/W+3SZz5fmtojXGzTt0NDKB57wySM
         Rb0Rz64rI9zUhNTtMlpDovllTkev64jQvy0Mj9pkILg+ldNxwtantBQUSZThBDxUACg9
         fOteQlRoP5ZJfzGprFKzcenaM60XkhHszYIyYuO9hAovdr7Is0OgtJExwepTWQHujLLO
         mU3bVQgEOwpl4Epx5y5/48DM50FKdm+p2MWqomCHYzLGIdpnIIKGU0dBmx7P1GjExpaK
         iU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NWeLPeCEOISYEMuHk4klgF1pcPKiVi4mEhvhikoMf4E=;
        fh=PRj/7UlqO74In/+CKWBhdkGHmLsX8exI0al0Q2+gcVA=;
        b=CjpGAIhMKVXdlRoSkP+KxbNwFWdCv+Y33yBdyxCcrXoKB/f58WFPUlwhiNTsTQJZPk
         L7yHuvntyotKMxRddm7bESYgFj6D5ib4zEe1HmmPYQsTaHfUC7eoTynnym3q+r15smUC
         LOlyf7wcFLZ/a0mKuKHJd8m8VHqbfRqFQOrufoyg8T6JbexUT1kfpSmEvpqIhFbMMPlX
         uo4hx69cQtY96eGgAWdgPTIm8De/b7Sn8FaYGh1oLXJ2gDITuStWIvHRIydyrLzxyZm2
         ISGAwsY0FvK5CXpU5lJMFw+KwSvAhnRNOfFETkCX7miP3Hiw4KAJbgi5WYeoLkhF13yM
         ZhIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774539441; x=1775144241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWeLPeCEOISYEMuHk4klgF1pcPKiVi4mEhvhikoMf4E=;
        b=LErCrZ6ZSY6nlfulO5fmVRILZbyHyHql3fRyfY6WmMzDYDiAYt4dap990599KgEhoD
         e1FbvQuKrgg3RrnxrEihgNDCZUklsU+iHAp2/mqQs0tC7ORdGP3BP3CRdiZnc/voCxqh
         x7zNcFdcElFqL8Mo59JVqAzmCS/8Cn6RLanqnM8ERWcVaYhHe8qM8Y/Lw3JbnjMNAndk
         oW9nH/3tfSZL3WWJQEWDdRVFb/ot1y23ZPkqCe485lM6eZUYLOm27AbmioWR875jlHsB
         7eQTusoABswM1NGm6r4J5WFLyqX0sVRLDToTqfB/ZFu1BlZbhT+dyylPekoaLqhh4JSr
         5tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539441; x=1775144241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NWeLPeCEOISYEMuHk4klgF1pcPKiVi4mEhvhikoMf4E=;
        b=kGUzYFFL+r12Fuuh7jXP4qGXfDBH4XVIj4hBmf3Z5yyFuuNsezogbyWCsXwC3P9jP2
         ng88Cp3Hf5d8qWp11LgCX1R0aGUNZcff0yXyMb/c+xmuOgeoFSQO0qZb35S4EKZV0lAU
         nnzVxtsN5hEyVIx6i5rktH1evyGhrYrITT+K5a1IVCtzozxBrltTLRAxEuJqv8DtvWgu
         WEW83cIwb5iSqQqI4KQk+HaBjXaD5Ys/k6A/fnRzjyvn7WVHcRFxNzkq0JGEYCcZgOco
         RnYqTMvXmlKC2CrFCixYOWBbPhyi8mmC8DVjMH+RE5gqHsdHsjCQk6ZObab10bjHsYe3
         ycBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJGknqlHHR71ewO1Jz9YAuSHNPHJj7FnNcTE6fTYiYR5pVRcYQNy+oy1hDyFFOlXxoSn/xhgsLlq9dNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNx4mjLOzkQP/CQauBDVtisJRLX8i8oHYLDORIvZZDknKtpSAm
	7tWY+o4aXpZ4z11xVSU/fLHc2uGu80NqjJeSMrvZ711ZbR4pgUQ6tFm4fHPbKFOCNnZr1qcO+ZA
	nt3/SepFdSU7A40Bq30AGkHARup2bu3lzNhpZ+CJu
X-Gm-Gg: ATEYQzyyfed3TccD2JYNQSVLVE/kuwzwKpFRLk+N5yvU0hGYzxCAYgq7IMguM4YefNU
	Hh0VDxaeNPEloNZT2dz5QSKDaaYFMBPYJtyYuuM8CJSMiiUTBCOwif3ckO7ojCHVXWH8WJr830a
	2Q6wLo0fuCGAlY/hRDtU0QfTND66YeWTWdILLhsY6vmT3+p5yugYNZIIYoHiEZF/jYNtjWl6skP
	p5mc4bAD6X7qdi/CGNq295hoLLV+I3nz9kik+oDzRJ0NWy8TLQ7GmeyuRPGEYBg/P3LmZefb5GK
	G+iQkdCLTtr2s6UCaMY03Mvbs2/ANiBLqvyhIA==
X-Received: by 2002:a05:6000:220b:b0:43b:8023:8b2 with SMTP id
 ffacd0b85a97d-43b88a25a22mr12525617f8f.45.1774539440336; Thu, 26 Mar 2026
 08:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316211646.650074-1-lyude@redhat.com> <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
In-Reply-To: <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Mar 2026 16:37:08 +0100
X-Gm-Features: AQROBzAWo8AoJkaNLNO9mq7x8n-1T_o4Q7aKPSl79urjgisqLmie7CjKUZkc8tM
Message-ID: <CAH5fLgifLd5sYQMjXs-154KTJbDcEuy3VE1LY+9YvfNMBWzHbA@mail.gmail.com>
Subject: Re: (subset) [PATCH v9 0/7] Rust bindings for gem shmem
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, nouveau@lists.freedesktop.org, 
	Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	linux-media@vger.kernel.org, Shankari Anand <shankari.ak0208@gmail.com>, 
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org, 
	Asahi Lina <lina+kernel@asahilina.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	kernel@vger.kernel.org, Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57162-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pages.freedesktop.org:url,rust-for-linux.com:url]
X-Rspamd-Queue-Id: 605EB337DEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 2:15=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Mar 16, 2026 at 10:16 PM CET, Lyude Paul wrote:
> > Lyude Paul (5):
> >   rust: drm: Add gem::impl_aref_for_gem_obj!
> >   rust: gem: Introduce DriverObject::Args
>
> Applied to drm-rust-next, thanks!
>
> > Asahi Lina (2):
> >   rust: drm: gem: shmem: Add DRM shmem helper abstraction
>
> I was about to pick this one up as well, but did run into quite some buil=
d
> errors and warnings. I fixed them all up, but I consider this too excessi=
ve to
> actually apply the patch. This is the changelog I came up with:
>
>     [ * DRM_GEM_SHMEM_HELPER is a tristate; when a module driver selects =
it,
>         it becomes =3Dm. The Rust kernel crate and its C helpers are alwa=
ys
>         built into vmlinux and can't reference symbols from a module,
>         causing link errors.
>
>         Thus, add RUST_DRM_GEM_SHMEM_HELPER bool Kconfig that selects
>         DRM_GEM_SHMEM_HELPER, forcing it built-in when Rust drivers need =
it;
>         use cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER) for the shmem module.
>
>       * Add cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused=
))
>         on pub(crate) use impl_aref_for_gem_obj and BaseObjectPrivate, so
>         that unused warnings are suppressed when shmem is not enabled.
>
>       * Enable const_refs_to_static (stabilized in 1.83) to prevent build
>         errors with older compilers.
>
>       * Use &raw const for bindings::drm_gem_shmem_vm_ops and add
>         #[allow(unused_unsafe, reason =3D "Safe since Rust 1.82.0")].
>
>       * Fix incorrect C Header path and minor spelling and formatting
>         issues.
>
>       * Drop shmem::Object::sg_table() as the current implementation is
>         unsound.
>
>         - Danilo ]
>
> Please always consider [1] and [2].
>
> [1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committe=
r-drm-rust.html#submit-checklist
> [2] https://rust-for-linux.com/contributing#submit-checklist-addendum
>
> (@Deborah: I assume you were testing this with Tyr built-in?)
>
> @Lyude, Alice, Miguel: Please have a look at what I came up with below.

It looks okay to me.

Alice

