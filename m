Return-Path: <linux-media+bounces-64755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zjxKHxsWLWodbQQAu9opvQ
	(envelope-from <linux-media+bounces-64755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 10:34:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A0C67E254
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 10:34:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XeIi4mAJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64755-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64755-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA698303E6C2
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 08:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA5139657A;
	Sat, 13 Jun 2026 08:34:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AD9357D14
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 08:34:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781339662; cv=pass; b=bVv0DKIDKCrPTT520ZHzUmzwiO0q/KjetQXevFxwg8f6NryHrLZW1Yo9w2FOWy+Sm91MTyicrnLrYHodaIwCXzpnTAd5my4JEgoRlbu3Gxn86+cxsyLvBzqTbub6rR2jo8HsY5boZvn7zMNBIMM77lVII6Jdad/dsyZjYlZWOt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781339662; c=relaxed/simple;
	bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FacjsqWHEKZRe4NoudumfhsrYQQh7nTh7OqL3zbruABQja+pi/a8wTpAxKWnrXq3v4oE7NgkvZUUiENoPMPjL3MBuSZHads/m2J+VLCcQDE6qdQcmgi/3XJ1ZCKaIYicyaRCaVL+w+GQaVCoAaxtnGGqTFXl8uJqKdEFH1aueJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XeIi4mAJ; arc=pass smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-306f1213aadso171676eec.1
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 01:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781339660; cv=none;
        d=google.com; s=arc-20240605;
        b=Lfu9bw9aIwRH8LAPH+J2//JdM6R0uoOUvJfzlk2uJwmXD5TsSV7ver0FrspcgEEEom
         KZ4IGKqYqA10+VxKoakKubdu4RtP696Dg7V/TLolAHQSjyS4kfz1U5dQMCAVD43f9/HM
         Jp27dQab4K+crSk5ixq8OneaZqzf6xVYpj5FA0nSZwO5ca16KUNytiVKxa8gbzYbfbw8
         OSa82bR5Z7rlZt2H1X/k0tHDc71dS3dwhEmAuo7dKhkz+iOOi5CiHLMlQhiA3mzEO5dA
         kySscekxfvLrRX0eyWIEJBme7RHw1kQDvUo3WzMY2+/sa6HP65XCsVcmvTcZms8HbyMN
         TFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        fh=1fNkaVPJovP8b1L0JoKlHBXOAr1al9/uyq60qm6dCnQ=;
        b=FfECockUg/uuFKq57lp2yLTgZ0KlZpBN93Zb7H120oVsnz+5ISCRS3EKvzVpOcQXFD
         4CR5qAZcaKA0zC3fZQbcAmMVUzmQWT9d6z/y92rFJxyD0OshrsfAt69o34uFQ7RummMa
         GR0kUXSKpBISLTLf7rqZyUoVVyk8BijTIpwqzeeYK3pso9lV4+WYzdgN3Hbp3sKmmaRy
         /wd1qJGval6XTRPGoh6RDZSlFmERCZo9Z+mMQcPphU+Oey14O0T6CG3wfzyAKxLlBlRt
         uQqOtRhnOM+gKAY5z9TmMHsc7sTWtMeo/tpNhb30Qf5DIkCF186XwKtWU2cGvLXEiCQv
         qhLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781339660; x=1781944460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        b=XeIi4mAJxBCYHlo8HYIjN+xAuukEtAu/qJJpUROC9Y/w2aU6B1ECIJRowpZ9XMtwFq
         aC34Yw1i5Uc4XTk4MYRoXf7zX3LthWbpphpmpao5a8MfTX6G1QsyYP7bwgg2XMkFxXkv
         D1IoLT+9IFBQkXiCnZzhwPc6tgEx2nVXKyXB1A9zjsX1fUpiUXPUtP6UEOoqEzlRiNQ6
         bPVmS1vOd7fnANsojoZyN48TFQmn5r8ghcWZj2cv3B2j5G7jsD4MgImo6TAiz7566KO9
         kGQYGe6LYwXAWy3AOp19tntL0mSuF30R8VXBa0bnVQ4TDAweR5pkgdMYtvyCnKGRI6sQ
         A/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781339660; x=1781944460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        b=GVT6joMloa6/lJrOD/GHrLRCo4vDBxzsxpfTIIrtgFr1m9s/Xc5WUU+s/3SEQV4PtN
         oITYValCLJDRtGkoB8hr/thqQ8I/WQP1lcCwKAX5E6B10dSJg9i5dkpWf+CwcEIfx00U
         6CVNNvvv9fxsdu845aqIW2HDA9DjYqsPHNaOZwFLsn7iLiuvnrw2043p85klNd39FEC4
         1FkJ2+zju+DMpUwuU7/hpn1bnW51RNxioUrYGemmNFzZ/STR8OgbO2X1eeytYW2NMf5U
         5xVVDYiLYjjpd42t3ATl4uZG13StMDCQKlsNrVVeFrZPUDHnydeL5XBbTKoUp0JvxkFR
         eabA==
X-Forwarded-Encrypted: i=1; AFNElJ+hOry1sX/sSZ/dYnXzgl9QX8vvRGmRaJffqqJ1LNPdEla5KdutOhmwcKhQfJO5pGi1VJcrWqvxZIEx2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCCoWytaWyOZOJELGJV03VN1NTl8a736HkVgW1C0iCdc80JeHX
	yuna8KmycM3quO6W4FeVAR3/ALZ8EBROD8GHDKJ/L9X/hMc6/Uqul22y49NZaThOe1ciYZA+zIf
	qNgO8zcbC3S8i55+WI/4o6LP1vyEElfw=
X-Gm-Gg: Acq92OEbA/jPYubebUximtScJx8mxu75ufZBQWlAimM6Gds0JEE87Tv4qXZWyRjwStU
	sO5Mf2dQki9K+CXKOSUy3+c6/xG1N0elodDMRaUKXGebC3VrOva9/hmp3AfYBhIZheprUORthQm
	o2AYirX6wAvYvONUyNL/OQT/CfjZnJZ0zlQQHMDk6svnJDp7wbsmsiOWKLUJsVwvNFa0hplNrdo
	Mj80qrMY0BJ4BgjeOqtYt8NsukOvxzMqwotq7lc8eEPY+ijGcLVfbTDUYr8Yzu60CUs7mmrgDP2
	o6UbsgwaELZ71fBOdsw8FLBw72ZKmul2hsE07SF3h1HGl6AjzP+WS+ENGl12CelpyJLlcczKW8d
	s4NKVr4+pkqm8ULaHnwiNabg=
X-Received: by 2002:a05:7300:641a:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-3081ff5f11fmr1542136eec.2.1781339660064; Sat, 13 Jun 2026
 01:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com> <20260610162433.923550-4-lyude@redhat.com>
 <DJ7AXOH0W92V.1L1869KO4C1H9@garyguo.net> <DJ7CJCZRHT1R.3LZDILZ7HTXQ3@kernel.org>
In-Reply-To: <DJ7CJCZRHT1R.3LZDILZ7HTXQ3@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 10:34:06 +0200
X-Gm-Features: AVVi8Cc-0p_Glp23G0kVyr_DFh7-Z-_yXR6xtOVae_M3Gc4DHlyl43G8aBfq8YI
Message-ID: <CANiq72mffbi2BV9epfZtN1qmjM28B6qUp-5tNGj=VBTimL-nYA@mail.gmail.com>
Subject: Re: [PATCH v20 3/4] rust: faux: Allow retrieving a bound Device
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:gary@garyguo.net,m:lyude@redhat.com,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:acourbot@nvidia.com,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:aliceryhl@google.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:tzimmermann@suse.de,m:mripard@kernel.org,m:airlied@gmail.com,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64755-lists,linux-media=lfdr.de];
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
	FREEMAIL_CC(0.00)[garyguo.net,redhat.com,lists.freedesktop.org,vger.kernel.org,nvidia.com,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,linuxfoundation.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7A0C67E254

On Fri, Jun 12, 2026 at 10:17=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> As far as I'm concerned there's no need to do that for things that are no=
t
> rendered anyway. But also feel free to do it anyway of course.

It is not a huge deal if there are gaps here or there, but we use
Markdown in comments too for consistency.

What we don't do is intra-doc links there -- it would have been nice
if `rustdoc` could use those in comments for the source view, but it
doesn't, and while I talked with upstream about it, it isn't likely it
will happen soon if at all...

Cheers,
Miguel

