Return-Path: <linux-media+bounces-48785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D6BCBD6A4
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 11:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA6973016710
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 10:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B394246798;
	Mon, 15 Dec 2025 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AIjoVpCB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rYEw8Ij0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005D127FD56
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765795908; cv=none; b=ueFcBXisZJEqaP2ilhiDQQXUGQiPWzypRhYFbnG98wFnyQirdsv4y0T9JlmiDxsr08CLpxVk49fOQE2ZaOALty4bdX2g15cqlI+lOSMP5M9rq84Q0DI6dnmOGp5yOXz+XiVgHdIUfYJmJS8R+ttNw6wF4Hjgdjeb5zONpvKGDqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765795908; c=relaxed/simple;
	bh=WkCUCfLiLGct9+NKSop/UGDcclTFONtKAWihXF5F0gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSZ+vtQmwpXoy3Z9V2jcuo9B71+9IDhYOGF4koTRZTSEkPNSAdKf3RvSPiUI96su+J+H3+8lApru8x/C4wAYN3AKBnJ1KP0G4TKSaRoeWqaNw1VgkmgwWqfJ4XDTk3Y0dwXOyfCbF8qjd+jAyF+o338ViPmpK96LdpF3bOKI/Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AIjoVpCB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rYEw8Ij0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765795905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WkCUCfLiLGct9+NKSop/UGDcclTFONtKAWihXF5F0gs=;
	b=AIjoVpCBzZ1QjjN3/FZTm9AJjMfwcAdY9X3qoztUWlsQ6pbYot2rUzugYXK5XYKUJNL8NG
	woX8iXXpNV+CCSNTkxvpL4L/9utiUsE34rMN/IYZgZWQhSrqRh12QaJ0pRGQavRFGqd/A9
	x+1wYjNe9uEJ4JD/q/ZwRs95UzrBpwk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567--t40Pq7sMw--2p_OEgPVbg-1; Mon, 15 Dec 2025 05:51:43 -0500
X-MC-Unique: -t40Pq7sMw--2p_OEgPVbg-1
X-Mimecast-MFC-AGG-ID: -t40Pq7sMw--2p_OEgPVbg_1765795902
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47775585257so24106165e9.1
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 02:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765795902; x=1766400702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WkCUCfLiLGct9+NKSop/UGDcclTFONtKAWihXF5F0gs=;
        b=rYEw8Ij0COl8zaNvTMmfsbLQf1EjhjO4XrpkjZz8h+5Gjv9qdsOpWBnQPV1wy1zEFd
         58ELJWvaGgiCOMJvXtlbarEMdkB2OSrec5ol9mVLZXUKMmdhXVHPEKdKpRdPZ98Mu4Ig
         TqU1gMJaMzsONWN5XsvXXvR4QXhS1XMp/TDZ7pcUUhJqXEhjjhx1RHMS3V7OPBL7WH2P
         r9i8Y2AL5zgdQXozxP/8DpwTKhM1Uc53xaKso+JPCC57xQ712fwnYDkydwQzkhDIfkeU
         jOaHRKyqs6wy8yq5T1mBRrysaxpLmQ8gVyWy15jedtQAWAQYstXLgBWtNjddqUdQ72QO
         GoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765795902; x=1766400702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkCUCfLiLGct9+NKSop/UGDcclTFONtKAWihXF5F0gs=;
        b=YsIq1Ku+s4E6fL/yhegNUVRy0WJBGLzgmrwrVy/v5BO5Ax2qnWPLI3hLd9u9AcEFW7
         mRDJj+F/oBWlC9QhsXg844LkLb6aziV2qrhDYTy8qwbX+zSK+aTSNMVcONDYnCMOcCvq
         eA8CLJZaM1Tx3/Vb4TeXIiYcuJ7EGp7caFnEnWD5MWd7retZL3rB3lLE/4ezZv8ZwAxD
         m2KY7HXmO8FTbQ6jfimQgShnmMPGKZO5tbPqr/WyfzWwXwW3VESVvwtuuLDzstG97za1
         EltKmqBMk7EKcOeHulCzzV+nh9VX0sgHjYpu89bBcxhUy9faJzhER9s9djbnoCtT+v6J
         z7cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWydo01vzSqse8ED7vwJh7R295+jliWoXvsY/ejE6RafoptPuwOMwuDD8DVw4H43R1f8cjFTMLslCk7tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfsbpEba5DxNHRjvO2hge9L4dzhXFCBbv06PThnYb0WKRw81BM
	WYTR3nMTmliyti/Ry0iHx/ekomXy5/ofC7tSVxba9elENqmvUBmPVVj5kSF9RRYmHNnwRq9kG1E
	6REpGqPwDQ4bAM0TRJL6BpPLlPzMJ9hQ2voAjTs4wxZpMyoLE+Iwl6y4Uoet8RJFA
X-Gm-Gg: AY/fxX6Xsl0a52Mk+45MjofjYwMYUE/rpO+1X43kEs22bFwL4ttRrGpPbaG475GkC33
	PKctfPisyBW0zSut1zI/AJroYZsNDNGde7nno9qb0vSuwpLkg6hVCQzya15x/xCW6DjbLt1qUDe
	gLzmLbnJMUQE5SyTleQ6+R594nSVk0whp+0+gcKB4SIxnfmHzDx90YqjF73VF6FAmJytRCRvASV
	lZEyJV+CuQm2NzLcJUUVMUUtjTR0KHWrJX80Hg5bKMIMhpOUMmN1+ukJwEegotllOjug4L3XXL4
	mbTJRPoZOeUSKlevdRiEIYQ8AiJZMz0cpcFs3oQTm53Ms28B+0mDlnYqk0VApfJ/KFlYIEfXqGt
	pUfLV
X-Received: by 2002:a05:600c:3151:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-47a8f8c0a52mr119367095e9.10.1765795901755;
        Mon, 15 Dec 2025 02:51:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsLOxvt6hxpjORw35OnVP+adHLtMmhH7jm5yhL+wJY2rwByI4ScjvlRVSyfAXmLS6E1u9MfQ==
X-Received: by 2002:a05:600c:3151:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-47a8f8c0a52mr119366655e9.10.1765795901232;
        Mon, 15 Dec 2025 02:51:41 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f6f3e78sm69652615e9.3.2025.12.15.02.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:51:40 -0800 (PST)
Date: Mon, 15 Dec 2025 11:51:38 +0100
From: Maxime Ripard <mripard@redhat.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Eric Chanudet <echanude@redhat.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Christian Koenig <christian.koenig@amd.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
Message-ID: <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="u7gkqqtkk3esv3ha"
Content-Disposition: inline
In-Reply-To: <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>


--u7gkqqtkk3esv3ha
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
MIME-Version: 1.0

Hi TJ,

On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redhat.co=
m> wrote:
> >
> > The system dma-buf heap lets userspace allocate buffers from the page
> > allocator. However, these allocations are not accounted for in memcg,
> > allowing processes to escape limits that may be configured.
> >
> > Pass the __GFP_ACCOUNT for our allocations to account them into memcg.
>=20
> We had a discussion just last night in the MM track at LPC about how
> shared memory accounted in memcg is pretty broken. Without a way to
> identify (and possibly transfer) ownership of a shared buffer, this
> makes the accounting of shared memory, and zombie memcg problems
> worse. :\

Are there notes or a report from that discussion anywhere?

The way I see it, the dma-buf heaps *trivial* case is non-existent at
the moment and that's definitely broken. Any application can bypass its
cgroups limits trivially, and that's a pretty big hole in the system.

The shared ownership is indeed broken, but it's not more or less broken
than, say, memfd + udmabuf, and I'm sure plenty of others.

So we really improve the common case, but only make the "advanced"
slightly more broken than it already is.

Would you disagree?

Maxime

--u7gkqqtkk3esv3ha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaT/oOgAKCRAnX84Zoj2+
dkxfAX4ve8AMEp5rGVxqWdx7mP32EEUlTe7oGqgQsZGk3gdf9G5zzO3162M7qdiD
3jlaGbUBfRHozRNiBmCNTKcExXO6w9Ygjiy0DBe+Vt/PkW0DZjejxbuLLNtgH70W
djcO8jaBRA==
=lq40
-----END PGP SIGNATURE-----

--u7gkqqtkk3esv3ha--


