Return-Path: <linux-media+bounces-64228-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6wBHHYj3Jmq8owIAu9opvQ
	(envelope-from <linux-media+bounces-64228-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:10:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CBF659194
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:10:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Ddc7v3Ls;
	dkim=pass header.d=redhat.com header.s=google header.b=HlkKJ29q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64228-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64228-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20E6E3011A6F
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 17:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D021B3D47CF;
	Mon,  8 Jun 2026 17:10:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AAA314D21
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 17:10:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938626; cv=none; b=qHRA0rJ9tVkhGYd/FAE0+3EJ5dw60qXVOdn9VEuMusI71s1/1+4pZQk7yMCpIwy/amz4lzBp38cuvIUQv9fTQK2Bl5L6iFfVgt1VAuJDniRjvwNQbihXYrEQn1SCByKPjko3/kcMurckr33dCkSvgTH5LUzMO/khDDKWwVwSwVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938626; c=relaxed/simple;
	bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e2TqamdWIpWAlilPzgo2m3KM9XroJPE2CAnHrsV7kNUpfVlnVEhWiC5S5axCa2TGfiB+UWKL0xDDkhpNvzitJoOyDdNH6rCLihmFXlVCm36LcRVds7pyO/TRPQ6bH4zOqkGv3ssb4sGEIHSvmrLwA7aIdFJ4scvhecMayhdflV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ddc7v3Ls; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HlkKJ29q; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780938624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
	b=Ddc7v3LsR1/INJ2BJ2XKEP78vS0KW0ufoH/Hz5PjpFpvC9+FcunbkdNszhOLtzd+hq1DKW
	xyuN/0QJSeT16BDFHWSQrom6d3IDNvypBiIq0eI4vZrlVdetHQZWu8Uqncnru2IHzs6WPc
	mB3oS7w1LokmCjXhq2KPOmohHn8HIMw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-rVAaDXCMOYC2I7__v5M-Eg-1; Mon, 08 Jun 2026 13:10:22 -0400
X-MC-Unique: rVAaDXCMOYC2I7__v5M-Eg-1
X-Mimecast-MFC-AGG-ID: rVAaDXCMOYC2I7__v5M-Eg_1780938621
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915c364ae3bso397406185a.0
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 10:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780938621; x=1781543421; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
        b=HlkKJ29q2A8tjBwFEKInSrLU4JNL5yF3vcXg19nomGqbgzRPcFGwPmCIpqkQrsglgo
         WmBjYdi/3Ja+ropRt5B5tzOxJ8TXVRKwb08IcCdpI42cnBpT2Yr+apjILs+8ctPLKHqm
         RZ/4pW9YxpgQ/XV4nc5z6gjChqN1ju6tnYVLqpXG7pugnN8iQpep/YksXwiwGrX8sVht
         ogH9/XEw3/uVx4RGqgO5bDpbzo88PgrdYUY1pRUbSB73uqj2+BdjYMFbIX9ZRPLpe998
         N5bUnuKbioHTK8Qp3HSfkYoYlLE9zUqFCnknANFJ+0bfQxX7z2gGnjuj+q3qv+YAQweN
         bHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938621; x=1781543421;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
        b=BNLhjZI7Iol4yxE4qBRjf3UwtGH7/YMqRDKAMhhMeV2t1yv711jnhcr05I3QaO/EOQ
         G6D3UPITdG0okGUAfifcSBmrgBmt3nH6hMw2B8XMzTzmwL6meFTnjDeQl8wzgsxi/siZ
         Jb3p+u1X8lyZBTLRItO4SoXJGWaazuDeQhBK8hWFNMUetNvo8IZEFI/NYS6IGhT46QdR
         /8QkiPiLV9OXGWU9MqtI/4FnISJ4QJuuFXKks8czjF6gPsgd+vjdf1R34W0IoE6t782O
         dsIHNapLXlFC19PON2ZGwOTl+vx8YUi9B7KUS3fZWIM3dR3N7GQDx3nca5RO62+BHJ1l
         LKvg==
X-Forwarded-Encrypted: i=1; AFNElJ/nrNbvfY0jUTBFU/kPjPqLE3EMb70HgJjAZsTTcNz7waUCxxK4XP0mr8tQ4wu3wAyRz2r8nWK8+tQQIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZdJMu7TegS7Dx+3OaoyDtfXmLAPS/76LErXODM3cBKsQYYbay
	gU0MIZv9PelXVAfKB7twEEut37wWB9sbP0E89aeP4R3rrXe04WjLTXe3J8JFwntTNnVi1vfrjH3
	08IrfgpP4G5S5nCDkkamByy0uJI+dM0PN+18j0Tra03krqfAkZCz5/3rQTjfQptE+
X-Gm-Gg: Acq92OG7xyTUcMuPKJn5oxqN6US/Y/afqBAWoyLr/bSc5YXAn2kA77rI0X52PfLnxG1
	0YD0ewgHzvKDK26qH871h1JRbASyQxwTan8xC9G7sYmcM8IpBnWtTpdBA1umY0X+KfGCIKvEVHb
	ywdRyGGwqZqr09i8ggZRRHN9YAsdr81QljR51pWu8oX2L/qMjSj4jAIaCnx/uK7uJe730Wh0jlL
	QosuSAsekZuqN6cjNA/404fhxq4vEsnZQzY4NJwxASHtq+l2yRzDEt+JE3YiD8UtDaD+ZyFX9Fn
	0PYb6Qx+id0JI8SsBbzDSOZE7pJKtBy4fn0uWBPXas6Jb+MODeirVRGE2tKc5z9lgRAXzaY/68k
	/rIXd38lIu86UHvb/lt6d/mrd87M9
X-Received: by 2002:a05:620a:254a:b0:915:9943:d760 with SMTP id af79cd13be357-915a9db892dmr2520124585a.43.1780938621247;
        Mon, 08 Jun 2026 10:10:21 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:915:9943:d760 with SMTP id af79cd13be357-915a9db892dmr2520115285a.43.1780938620617;
        Mon, 08 Jun 2026 10:10:20 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3bf5f9sm1822479085a.35.2026.06.08.10.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:10:19 -0700 (PDT)
Message-ID: <00c7a09eac169e9da541b50396ceaa69ae978c10.camel@redhat.com>
Subject: Re: [PATCH v18 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
From: lyude@redhat.com
To: Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda	 <ojeda@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Alice Ryhl
 <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,  Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin
 <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org, Danilo Krummrich
 <dakr@kernel.org>,  Mukesh Kumar Chaurasiya	 <mkchauras@gmail.com>, Asahi
 Lina <lina+kernel@asahilina.net>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Mon, 08 Jun 2026 13:10:18 -0400
In-Reply-To: <DJ2TB5AX540T.311A690IK8F9B@garyguo.net>
References: <20260604192740.659240-1-lyude@redhat.com>
	 <20260604192740.659240-2-lyude@redhat.com>
	 <DJ2TB5AX540T.311A690IK8F9B@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64228-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[nvidia.com,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,vger.kernel.org,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:acourbot@nvidia.com,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:aliceryhl@google.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:tzimmermann@suse.de,m:mripard@kernel.org,m:airlied@gmail.com,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dakr@kernel.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4CBF659194

I think I have just been defaulting to always for anything that seems
like it should be unquestionably inlined - should I be defaulting to
#[inline] instead?

On Sun, 2026-06-07 at 13:22 +0100, Gary Guo wrote:
> > +impl<'a, T: DriverObject, C: DeviceContext> DmaResvGuard<'a, T, C>
> > {
> > +=C2=A0=C2=A0=C2=A0 #[inline(always)]
>=20
> Why `always` here?
>=20
> Best,
> Gary


