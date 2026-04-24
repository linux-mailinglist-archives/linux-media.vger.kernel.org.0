Return-Path: <linux-media+bounces-59557-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMMEKYyz62kJQgAAu9opvQ
	(envelope-from <linux-media+bounces-59557-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 20:16:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6D462543
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 20:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D22E303EC22
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 18:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91BA3EDADA;
	Fri, 24 Apr 2026 18:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="flTNSQDk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mpn9sDid"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E775E3E8C4F
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 18:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777054435; cv=none; b=YGKGxgW27gHfJ2E8ixmECkJPmKlq3GYi0yCNqWIjmmdIYOxXy246wfDKz5TCRjJPujOQsVj8FTZxvJfaBC3tlEFNuw2RKKJepH/yLgABr+GOD8O3w/Kik4geuzOuy+7BaCsDRwepZmEbojvrQnM6jEQ0Rk4Fvo3PohTQLoBOTbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777054435; c=relaxed/simple;
	bh=OeQosteTdD6VM7jZXWeJNravgroMD7pnnDdWYomsqZs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CbubpGarJOI8VKcZMQk8rX3VIcK/Q+QM1xt9SzNucGadN2h0QQA6ZI41TDVAZcso39VqSJNiel6/w0QrkPGbK/+zz350GvOBA2o5v3iyNX963/iFvtnWoMbL/8g0XX8gU0bUaYmXnrFV272+Dec6L4QH0csqI6s8OKkMmpMAwkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=flTNSQDk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mpn9sDid; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777054433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OeQosteTdD6VM7jZXWeJNravgroMD7pnnDdWYomsqZs=;
	b=flTNSQDk4iGEkK+XzM5UOP44uM8sB70PtTTtL0NOai7cYIce116BgAbxlWnAZaz4SfXOST
	JgQlSNpXslPqR2G0CB20PJ71GQkumZyfdS7+nI/nSj7Zec8rb9j1kj7eHzy7rDyEBujvOK
	EfJJ1LvxCauF/5jS8j2btPg4YJ6mZOg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-BgyRiWRFOYOk6Wrf7KaDGg-1; Fri, 24 Apr 2026 14:13:51 -0400
X-MC-Unique: BgyRiWRFOYOk6Wrf7KaDGg-1
X-Mimecast-MFC-AGG-ID: BgyRiWRFOYOk6Wrf7KaDGg_1777054431
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a16036c90eso203475536d6.2
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 11:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777054431; x=1777659231; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OeQosteTdD6VM7jZXWeJNravgroMD7pnnDdWYomsqZs=;
        b=Mpn9sDidXpccfizsAWGr7qiOLr0TMB14XF93z7/nmAhNWHV2CqegNkKOxbp5GS/Shy
         NWRS2cx0LicWKu2siJGQUTGmquH71byIN6bHqsViFnkdIqTssWcLZh6dZWmWE90uTzpZ
         BVBHOe7yAp/9D8ekBfhcBrjcMS/V7U1DgzzxqW3j5KUENJIuKCSoudhCakob1ktt/5Ha
         O7EKUq4QpAswDIa3nj54uxdduIl8B9KKh6vCytuedp4buahM5hGQoKJm8bcBH7G9s6pR
         1MyY3NrGHH3i7QmX6sw+eu+taW15jDN7gy1LYkR2YKZ5fFtoN9qlQVayHSh0ECA/oeOV
         1QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777054431; x=1777659231;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OeQosteTdD6VM7jZXWeJNravgroMD7pnnDdWYomsqZs=;
        b=h7NN5XbW+UHcpX6nt+C2SNdOrWJ0h7N9Ix40ydQgJHh98c1BPpL0CBAuvHZwol9NKv
         LfqohLqd+Fbvo7fBBcy5yV0eineLT5YneDG4d9JuKSVaCvscTktkroheF0CrozIojBZX
         wOVLJgDQVKRESNsbGPqIWhUbO8aem4GTxQtRqArCPRtpasSDcvPkYAxRCQSYI5Mg7a6T
         rANL9Qgd/j2eHjI45hV2h4CARcApDeGmQZHXVrPlcOPfYmsNO2R1qYs5lUbISXy+Gv20
         ofH2O2s4wnsZXJ9jwsEEomeXauHSGVH8qkrJmNBojXg0hSe66d2U+Lei/O7BYvjXpOI9
         xEaw==
X-Forwarded-Encrypted: i=1; AFNElJ/lCPKUaOO+CbQuG39T4txWDzxbZLv7OzHk/nKUA7Y09qU1mTHKjK8DFu8HTu9FgPh5kxJlf3DiIZGHnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPJ/CAS1BrzzvYxBBgnPsL87ZLQ3flzupBVgLaZwhYQV2QriT5
	YqjRdWKU9htqRDx8fK9mwgcW0gKvnPEUCE5MPDmx1bAZnG4V13rES1wattlEsmxFalQtlBrDibE
	0/MZlndd/zTaivnAPvb6CrA/U/Socpj7e8EO3svk05FZxAGDCvzQe2jhWWrNbN6ZR
X-Gm-Gg: AeBDietEhboNTWRYpIIVkUyUKyYUWPJMXWAsGzup9rnPM24/Q2tUEFpNqOg2rG0lLgw
	LdffuADKIaMdnoxpqxpBgGf/ic/slUPzHKEpMYHFUGANSZsHKBLQtp2eQb/EfRBhm2AO93YfmWl
	mOJF41cPlV9Rup9lEgfRURszrxkA1eRyQl2EHLg6/I5E3M54Wp+OtW6o6SUf/pfDSntvTO3bvSk
	J5XXUNKp/5a+HSSQAr/7rUrnGq9DusyOP+Lzak2hqegojT0HyjH0S4Xuz/qLpddRkNNfpd6Rv/L
	4SPIkt3r1F6qBHEVK8ltnx8l9kDNLYxvd/L1Jqk9iyodPQ7oWaIGdgr52mdmrVZ+fqJfZ/qfbfm
	eQDF/MQw9QfGfcqo+BWNa1gIuMidK
X-Received: by 2002:a05:6214:27c2:b0:8ac:ab30:fffa with SMTP id 6a1803df08f44-8b03addd7bdmr442488136d6.32.1777054431180;
        Fri, 24 Apr 2026 11:13:51 -0700 (PDT)
X-Received: by 2002:a05:6214:27c2:b0:8ac:ab30:fffa with SMTP id 6a1803df08f44-8b03addd7bdmr442487526d6.32.1777054430667;
        Fri, 24 Apr 2026 11:13:50 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae86947sm253378776d6.37.2026.04.24.11.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 11:13:50 -0700 (PDT)
Message-ID: <4bccf3d1ab49dfdff29a69b2040c4d0aef0e87e3.camel@redhat.com>
Subject: Re: [PATCH v12 4/5] rust: drm: gem: Introduce shmem::SGTable
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 Matthew Maurer <mmaurer@google.com>,  FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>, Miguel Ojeda	
 <ojeda@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter
	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Boqun Feng	
 <boqun@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan
 Rai	 <prafulrai522@gmail.com>, linux-media@vger.kernel.org, Shankari Anand	
 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Benno Lossin
	 <lossin@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
Date: Fri, 24 Apr 2026 14:13:49 -0400
In-Reply-To: <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
References: <20260421235346.672794-1-lyude@redhat.com>
	 <20260421235346.672794-5-lyude@redhat.com>
	 <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 04B6D462543
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59557-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	RCPT_COUNT_TWELVE(0.00)[28];
	TO_DN_SOME(0.00)[]

On Fri, 2026-04-24 at 00:01 +0900, Alexandre Courbot wrote:
>=20
> This fails on master:
>=20
> =C2=A0=C2=A0=C2=A0 error[E0432]: unresolved import `crate::sync::ARef`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --> ../rust/kernel/drm/gem/shmem.rs:36:5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> =C2=A0=C2=A0=C2=A0 36 |=C2=A0=C2=A0=C2=A0=C2=A0 sync::ARef,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^ no `A=
Ref` in `sync`
>=20
> Importing `sync::aref::ARef` seems to be the correct way now.

FWIW: as I mentioned in the cover letter, this series applies against
drm-rust-next - not master.


