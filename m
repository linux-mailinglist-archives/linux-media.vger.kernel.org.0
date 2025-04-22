Return-Path: <linux-media+bounces-30747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A11A97853
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 23:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E86781899537
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 21:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FA625C82E;
	Tue, 22 Apr 2025 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="IMtMcGcv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4B25C820
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 21:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356428; cv=none; b=hw6tKKN+I568bmYLA26b3J6u0tJF0yVM+V+mE0Xf6I+ga4S0rC8mJw9uTzdTVM5njrK+t90h8MkUjPCto36qzlPGZv4yvCk0EdzvGo7mrYFa+IBuQpDEzACOBxLYxkXRVxXDBAFneFGvatGtAV/MpA5hBJ1lt1NkePOuaZQ1WIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356428; c=relaxed/simple;
	bh=x99YqM5jAciDGUwEEKcwbaWSiUtE4eY2SQKKZ+ma9tI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iTuRmQBUCWoVAFOxGlW3Zhf5Am6n3bZ2Vv3OaTMRsqiMvsaGNbTu6u/CwPY08dnomn9U0FetDJowR8xn8JHJmNlBB7TBGI8m18bvKl3S0zyUIYz2MNit+mdf5hosV1lElL/dm3yplAPKBuVPRGwPzziy2Y4Qad2LgbtNFEI2iLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=IMtMcGcv; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso54007996d6.1
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 14:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745356426; x=1745961226; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MRlkHO/ATqsDExG6tsCGhp23a2+ci1NHjbr5iO6Odtc=;
        b=IMtMcGcvVpQ9UAoX6OE3xtAKzBTgl8b/ZS6RAMBGzTd7kbIZXNSinakzHoStrsuAEq
         er8SfZAqim0/MQmurWQJc8uaTdz+HYAnOM3prSngZQm5DajXsIc3bvdTpnpneVV+SX80
         0/p65rZS/Mbf7A1r3ms8KVqhBXrQBN+ydvOVNI5TabQKHEEeuQ1dtEeYis7rmqE+NP9x
         RKOwW6UYe5R7K4hmnDrKEWTmj0H2ijuSX+C1by3xVx/JTlb7QcPMEdlQM44aaEMGgsZC
         xGTOtV3ZVvat3w23D4Dh/6s2uc5I/mK3Hl2pKzKYCff/b1oBdJUYfgF/Vyh1o3Pa5Rtt
         CTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356426; x=1745961226;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRlkHO/ATqsDExG6tsCGhp23a2+ci1NHjbr5iO6Odtc=;
        b=imFyQnWcnkb7Mno7q+RK/ekEIH1xGKwYIHeIhtxWO/4fViF1B8rjswNqn3KQpBV/uk
         STmf+Z7ns03GLITYLVQgIeqXTOYoLJd7fpsIo1F4J9UvSNB3kv6O1SmNXorU9A8wAN09
         zfp8Wg1zJl3qZ6DMiL7asClhnBA3KzUSc5aAcuZPDessgaqU6S4/QnjDUymYqvS80J2T
         I72PNC7h0hvcbjetEG0czufEBQLY+bTsBWHd16cKvndFT3Lv4uTYF0cbslSvA7OseKE8
         nQF9HQbaVWlNx/Q2nlbnpAQeJ0VVzsreUWBAMa3EH4vqQI4hsPVOt52DwlrFusjMdkcD
         0t3A==
X-Gm-Message-State: AOJu0YwI64zEtTgJEskC4oN8KKcEOb/yRKRHqZoIfnwoC2E4plvJ4DLg
	8wmzvH14fnKt9FQz3DqCGTysznbXpBJ1sflMj/NpqOarlcyX3C18YcCXSIUykIU=
X-Gm-Gg: ASbGncu0GG5Q9a68ZifQdzQASVxANQR1dy5lcT/urs5NfudQYzeohW7csYQLGEYr1Uy
	NeuSZpouRjORVupce1mmla/9VgNzWVWyRdVznFjgnFhKQ/RhGMAnHSzyl5i5+Z0uNXPTPlpCAjY
	cptDKIRVia6LIx6T/nMhKd3dTv2RFz3RxvpKcDQYV4STQP6CF+RUjYysyK/EPcLIsN37RUgKK/S
	1Rx7cLDh0bcVVCOeR/6+pNjH2eywnE7n/G7tVVNxSGWx98VjtnEpfkAxqTu61s+TI43t3S+qHzg
	+877qfIRFJxqlUvAy4oYHrroy4RSTv2GmOvPeXYsAf0d8g==
X-Google-Smtp-Source: AGHT+IH0GaDhDhwwRuUL8aPkyJ77kEEFwsg5jHZ6pptPGGu8U8R8GNXiauC/BafRtBOHlsAHETZJwg==
X-Received: by 2002:a05:6214:258d:b0:6f0:e2d4:5287 with SMTP id 6a1803df08f44-6f2c458d023mr232308396d6.24.1745356425929;
        Tue, 22 Apr 2025 14:13:45 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1b24sm62265366d6.5.2025.04.22.14.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:13:45 -0700 (PDT)
Message-ID: <6a8b96daac4dd37dbe51cdc52052a9af26236de2.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: fix potential NULL deref in
 vpu_core_parse_dt()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Chenyuan Yang <chenyuan0y@gmail.com>, ming.qian@nxp.com,
 eagle.zhou@nxp.com, 	mchehab@kernel.org, shijie.qin@nxp.com,
 hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 22 Apr 2025 17:13:43 -0400
In-Reply-To: <77ed36f63ec02156d480efebafb80f3af3ea50f0.camel@ndufresne.ca>
References: <20250411184356.2910366-1-chenyuan0y@gmail.com>
	 <77ed36f63ec02156d480efebafb80f3af3ea50f0.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 11 avril 2025 =C3=A0 17:20 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Le vendredi 11 avril 2025 =C3=A0 13:43 -0500, Chenyuan Yang a =C3=A9crit=
=C2=A0:
> > The result of memremap() may be NULL on failure, leading to a null
> > dereference in the subsequent memset(). Add explicit checks after
> > each memremap() call: if the firmware region fails to map, return
> > immediately; if the RPC region fails, unmap the firmware window before
> > returning.
>=20
> Its hard to believe that its a coincidence that someone else sent a
> patch for this. A colleague, the same person ?
>=20
> I do prefer this version though, the commits message is better, the
> code is nicer. If its you, adding a [PATCH v2], or just adding a
> comment that its a better version would be nice.

To Ming Qian, this is the type of patch that I expect an Acked-by from
the maintainer.

Meanwhile, to Chenyuan, you should followup when requested. Marking
this patch as change requested, looking forward a v2.

Nicolas

>=20
> >=20
> > This is similar to the commit 966d47e1f27c
> > ("efi: fix potential NULL deref in efi_mem_reserve_persistent").
> >=20
> > This is found by our static analysis tool KNighter.
> >=20
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
> > ---
> > =C2=A0drivers/media/platform/amphion/vpu_core.c | 11 +++++++++++
> > =C2=A01 file changed, 11 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/=
platform/amphion/vpu_core.c
> > index 8df85c14ab3f..26568987586d 100644
> > --- a/drivers/media/platform/amphion/vpu_core.c
> > +++ b/drivers/media/platform/amphion/vpu_core.c
> > @@ -586,7 +586,18 @@ static int vpu_core_parse_dt(struct vpu_core *core=
, struct device_node *np)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	core->fw.virt =3D memremap(core->fw.phys, core->fw.length, MEMRE=
MAP_WC);
> > +	if (!core->fw.virt) {
> > +		dev_err(core->dev, "failed to remap fw region\n");
> > +		of_node_put(node);
>=20
> nit: node and res are no longer used passed line 579. Meaning you could
> unref the node earlier, and remove the repeated of_node_put(node) call
> in the error conditions.
>=20
> > +		return -ENOMEM;
> > +	}
> > =C2=A0	core->rpc.virt =3D memremap(core->rpc.phys, core->rpc.length, ME=
MREMAP_WC);
>=20
> I really enjoy blank lines after closing scope, even though its not a
> strict coding standard.
>=20
> > +	if (!core->rpc.virt) {
> > +		dev_err(core->dev, "failed to remap rpc region\n");
> > +		memunmap(core->fw.virt);
>=20
> Its interesting that you thought of cleaning that up here, since its
> not being cleanup in the error case of "if (ret !=3D
> VPU_CORE_MEMORY_UNCACHED)".=C2=A0 And its also not being cleanup if the
> probe fails later for other reasons. Perhaps your chance to add more
> fixes to this driver.
>=20
> > +		of_node_put(node);
> > +		return -ENOMEM;
> > +	}
> > =C2=A0	memset(core->rpc.virt, 0, core->rpc.length);
>=20
> Same, I like blank lines (but you are free to ignore me if Ming does
> not care).
>=20
> > =C2=A0
> > =C2=A0	ret =3D vpu_iface_check_memory_region(core, core->rpc.phys, core=
->rpc.length);
>=20
> regards,
> Nicolas

