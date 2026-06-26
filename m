Return-Path: <linux-media+bounces-65760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gy2VF/+gPmpjJQkAu9opvQ
	(envelope-from <linux-media+bounces-65760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 17:55:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C37A36CEB5A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 17:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=l8HCapbb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65760-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65760-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 529EC300ECA1
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 15:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67F639E184;
	Fri, 26 Jun 2026 15:51:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01843F2102
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 15:51:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489064; cv=pass; b=So1y7jIXU2zoEHfR+8Ka/1e9EYJfpu2D6vVN6yooT4eKLNgoZZJhUTsALL3k2/VSphtrU4vEBGlTe7KW0OM9PIqBg2zHPzH7WS6jrxEy1fJyjnJRjIqUNyZYbZXGoSbd2xJW0X/TXyWD5laRY6drHB0M8NUP+yE1bSnEHVVxfLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489064; c=relaxed/simple;
	bh=ZPHcJuGGWfpRD9VuT0tHbZH9ElUJLMcAe7aNwn77y7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PINZeBb1YTf6bqrgRgIQ/ZluYGqVRCWhwjVNif4MS8uT7Cmfe6retuRZOspoGYRvgtJZ4iq3JCCowhWBOPFXJc+YcPYnLXa2m9KzeSh75TW8M9iloAnO4no4ldcAMX9ghgDxuWLQC0QFs7d6tO6rw5sl9RDduebLgZro9YhMWV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l8HCapbb; arc=pass smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c81db32393so42635ad.0
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 08:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782489061; cv=none;
        d=google.com; s=arc-20260327;
        b=czLjLPIImARJWvSHCiuQ0KJNWuzP15XxRjCRC1Yad1lZvIYmhA9HmMhYZIULj5ba0f
         uRMEeim2LmJnQyWCXd27oqWFK86wUgz/EVONArNDPd/oLFe4DJ/nCZb72wQNW7mDhZIA
         H+dg8MhtF19hZ3zkAHIn7XSaOAoVJUxENYo5dyv7o7N8pLeebDKT70nGXw2SKO6E8KtV
         x9b4JuqoqJ8qj0gnf2i/ruXidI8nvxK26gZ0E7tLMiK+3k7KTkUF+T1SvZWmAVS/v6g/
         uW8vZA9xxc5qu/9f8bxT+iVs8Iph6eF8KUMYLlUWSga4tJt4dfXTC/OF4+YTPlpQfQgO
         Neqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZPHcJuGGWfpRD9VuT0tHbZH9ElUJLMcAe7aNwn77y7U=;
        fh=IaVCdbYclyBOkdx88oLvzVwD5m57tnXVKc+Yw+Na5Qc=;
        b=IClaLk19gTfluDhO8GBk2gLCMPi5flNaLJ0KAw7Fz6PAfUBm9GxRRkWWPYh3ZohBKr
         y38awQBb0lthz0YsWEry2IoD94AivuIkdJgmXEVswY4gs6Ljiahk5Ix+La1mLKf0kfpc
         eYx8UywmKKlajeIJHoNXuFzTqz/0ItjSFvsHO3u2rFPfKCXEDn0wE3dOzAqIK9Fik15N
         3csCYGDPJxEDP6WDnFYWE87Pq+ngQYiS9HMhptu2JwbdLwCjb6gqDpx5A/juE2m0A51d
         ONMd65uizaxb2vvvAtyXlpCkJst20+UDa31gnQhsycJQsbpI/8np/pGjWbzArNfLM/iY
         zsXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782489061; x=1783093861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPHcJuGGWfpRD9VuT0tHbZH9ElUJLMcAe7aNwn77y7U=;
        b=l8HCapbbVSEtxkAIdf1YmXzfP2XMP7npR84SBSAxvpHSlUsbi8fW5REMMFazhqn37T
         bTS4Q2TFoSZ2rYkmju0jlWd4ZSDa/wGhxi0D/KmMvNTj9AftDy+qATcE69+7WmySZUOp
         3ZgGLdUPpjy2ju9XzqoMuPA3TixJvJyObQRWIdtnQN3PWnQEf1XQriXxzPpY+9SRQrEe
         RM9gyrK3F6nVc8WvcOyQpUIvXjbacLnNblx65wHtkQE1HK3QFhV/n/c4btEd87o31rcF
         +kDzWhGrldrLYkt4MEzMQuVH29/kGnkAsf+iueaDX7couKmDCcBL3xB1WMQLp3sRJfIG
         rLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782489061; x=1783093861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPHcJuGGWfpRD9VuT0tHbZH9ElUJLMcAe7aNwn77y7U=;
        b=nfgnXR0SwZFe1gAybk2/HBf2T+okGt5R8VJfAWyEggX70hBrrd2taf8tzo75kgVAKa
         5j2CA8SGd8jD2ngcnXjVESzWAqsCsvoUYRgOasJ2aIdH8Rl7YjxxS5sd0q+j1vpZKXNz
         fImEqecZzqXVlyNLNEwiaQIxvkKJE8Nyddd96hu6KRPg2D/mHvXp3DkvKe2W1gx1p7m5
         5efQ1StOypxyWh7NB+apOoErk1my8FoVAHqXfVuDZfkg3kv8XuZijBk0ZrlIavS0UAZw
         WGWut8D3ehYdKmfRZsOA7fk9NIyEBJj5Hww0R2oFZNWBcifWyg7Y2RDBtco7Tnhr5xK6
         DqSw==
X-Forwarded-Encrypted: i=1; AHgh+RpGW/HciZZ4XGKmJePpH7dAQqvtJzETpyLfhAGGsIN19ibBi171n7I/gOCzPrpcXQTv6maX/bccUXqxsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEi215ilcBZpVi48Iob9KtRhZrZptE7MvKFBfnlOxEgEhg7cgH
	Hg+66Oko1f513j9eJRLQBYuUCidIcL7aU+5NmeR95kbyTKaoM83chrBBn4LwA3QgE9Ske/hfg7d
	xrZ9ul/VKwNGefr8Nu6RQ5RAn9Dv/pKciguPCZFQ=
X-Gm-Gg: AfdE7clVXK1WQyte3v2su8r7Xnvys4vip+gEpQZnNYHMk+f+Yyn/V+ygzr/Pr95h0yE
	oRFrlSa0PNUV5sqh+uj8Qc5saLbpC+zOmYgbfi31mixQUmvF5g+cUC2ZhCAvau3u1ai9l/7XTG/
	YFmDmypgX1Dg40jEmVc12ALxCioBa3NaQ7e+Fe2XpfCzh1bDxkZu5kro7D1dQqSwom/KzAY6XJ9
	ibujx7danAjKtDXO9vw6Ib1jJLGki7xF+1MeF4clTaN1BnEqo+B4xNk8v9D4kVLKbXNnYU=
X-Received: by 2002:a17:903:4b0c:b0:2bd:6dad:7ccd with SMTP id
 d9443c01a7336-2c99855966emr229385ad.25.1782489060232; Fri, 26 Jun 2026
 08:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <V9qMNHLlezBTRwOQsdz9qWQfAsMwBr9PR4tKnaHWUJz7GVS5ttNlNILtzxYh1Rxd6_nL8p8Ffk9F7OqcHBYF3g==@protonmail.internalid>
 <20260625202412.2986772-1-briandaniels@google.com> <fe970394-176b-4add-be68-74f6074ba78c@kernel.org>
In-Reply-To: <fe970394-176b-4add-be68-74f6074ba78c@kernel.org>
From: Brian Daniels <briandaniels@google.com>
Date: Fri, 26 Jun 2026 11:50:47 -0400
X-Gm-Features: AVVi8CcaG32oQ98-BwXSiQ-X6hlARwE9_bW6g1z1koV_pEWAyvNHcVBb8psrX4I
Message-ID: <CAD4i_GQaUvCH1SD3Dk5V8XTFQHpmSYqWFV5-hr-8_urx+jtGww@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] media: virtio: Add protocol
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com, adelva@google.com, 
	aesteve@redhat.com, changyeon@google.com, daniel.almeida@collabora.com, 
	eperezma@redhat.com, gnurou@gmail.com, gurchetansingh@google.com, 
	hverkuil@xs4all.nl, jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mst@redhat.com,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65760-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C37A36CEB5A

On Thu, Jun 25, 2026 at 8:51=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 25/06/2026 21:24, Brian Daniels wrote:
> > I'm not an expert here, but taking a look at those files, the vast majo=
rity of
> > those reserved fields appear to be padding to ensure the struct has 64-=
bit
> > alignment, which matches the use here in virtio-media as well.
> >
> > virtio_pci appears to be the only device that explicitly states the
> > reserved bytes are for future extensions. Unless there's a good a reaso=
n to
> > expect a future use case where more space is needed, I would prefer to =
not add
> > more at this time.
>
> I'm querying why just the one though ? Why not say four ?
>
> Perhaps something you could address in your commit log.
>

Sure I can add a note in v5. But yeah the reason is the total struct
needs to be 64-bit aligned. So it can't be an arbitrary number.
And all the current reserved fields add the minimum number of bits to
ensure the existing structs are 64-bit aligned.
Adding more means extra bytes are transferred every exchange without
adding any value, which is inefficient.

