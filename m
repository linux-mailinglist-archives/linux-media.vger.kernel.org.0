Return-Path: <linux-media+bounces-66033-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bLc6OuBcQ2pLXQoAu9opvQ
	(envelope-from <linux-media+bounces-66033-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 08:06:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F37556E0991
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 08:06:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=ktwxb7CX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66033-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66033-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D667303A8D9
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 06:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A810C3033E1;
	Tue, 30 Jun 2026 06:04:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD252EBDE9
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 06:04:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782799473; cv=none; b=h66IHyLl1xslQWmLsn2BS5sNdi/M3nLb0DlqqJOcFJusn9SXESVqnkmCOn9Wx+vrY93EUEIZDmBy9wkYimFSlA0rjE4h77QB9XhaxibQHt/Dt+wc+StgB9UpHhFZWszk/KsNfgHdvL2ZjNaRItFXrvqqDOpFTZ877AdS4+dlJlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782799473; c=relaxed/simple;
	bh=q9HQDf6uU3KOpf7X+h0FkXT0BRmTsT0Ka85jPZxYGjU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdVv6UHRl6U5ILuZDiO7Tn8I64cgSH6N9oUsy33eIEKBkbcqOVfG7kBo9RKoB0VPo0T9i73TqPcbPev/Z7dR9C9TRSBGqfhae0JPzNBwLqBmi/mUL5S4pJUZNadnkV7YQ+VWzp/c8F70elcy0Jmz+LyqyS56QXje4ypvNmjaWww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ktwxb7CX; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493a613571eso18093135e9.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 23:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782799469; x=1783404269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5BBnItCnxunKMbKk5r5XGq35MhHqmNERXs298mNYZQ=;
        b=ktwxb7CXt+trnAajnkzA9h9gdeaP+NWWqiQtMnj/0fmN71drYBEJJVqA/zdDPOHA+j
         tx53cU1g/94nmCKnfAZI3uM4N20ZfXbOrGesn2v8kLV408YjA0rqDDhX/rgJwy6yAMAx
         RHuc5qOE1EEd+PNOB/7AVM6ZKg1kPXmDutlUdICaEZh79ksn91a3posF345m56bEi96d
         N3fxZ84jT3pXm8b8Vnk4HkRUvEcpZIrhYwKHSeZAEHqu8PzndfN05M6wyGGRylM8ZzM2
         GlE2jFRlS3Dsmd36Hh6dzBH61f9OpFXTs900Z0kPYXTJM4l+T3BlB2wf6TAGsYHsX3mL
         IlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782799469; x=1783404269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b5BBnItCnxunKMbKk5r5XGq35MhHqmNERXs298mNYZQ=;
        b=fCJhEUy7AF41s5hY7oY8uS6o1kdKZNa1NlxhPx2BOp6OWFftif5dsDmuugiMvkXuio
         A6l/c9XP1v4uMF/96yYXEQCuJRS6GqTEWOKLKVThEgSh5lgwxSHug/ogkg3Ii8GsduvT
         n/sUel8YwioAgpktDDdhfEXs6war+rXtYjbHOZ/XfR80o5FkUFQh7JJ7lEOhk31DN1pJ
         Lccf3CUm0Xe8D6/NVilkVAnFCdp+X4EPBnrzUMuU0PVu30BKHnv5DrTSPiYKua7EDCP3
         Z9XDit0TC3zx2dVhgirTy453K5N61w6suAlj2HvYVK29DOxuRkPtgeTufkoftqe9cj4Y
         tW4w==
X-Forwarded-Encrypted: i=1; AFNElJ/J25Cs6mxu18+2gxZx+bihm/f8hrbhmM6I4BEswEI73f1Hkm2XQ1LwBTijrVsFhGUdnYsUApFFlS0ApA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4D71owozJZX1sA7pMZ+bniUuZQCMDStziLUxPnyGaag477Rjw
	n9p0TmbpFB1+N+NPHxFsLkNTEqH/w2QRDdMEfF07ZsQpRh8WK/E5IoE3gfaNN8jJsOk=
X-Gm-Gg: AfdE7clEObMg7cGflteP5RzpzK4FbBstRXKTHcIR6m1hdJj0/QaB4cuwZbUjamFZS7A
	KW3hjdwedKHnEjYLL0NhN3LECHGSIjLzlUDqH5x2xwqCky5LcRjLE1KhoudSnm3CCogzuDZ3ep4
	4wBQ3ASX7mVMUIC+iT2ENKPai//w6OUga5C44zNrVPW+q8Dwq/WBSeijJoISCP5Qu5YxaqhI2ms
	vmFlwfElzLnwz7rGaOr/X/2zlmQwYCXy7O/pnH/r1AV2vDvEzx9C6OVAGu/C8nVnD578y8BvW9G
	K+B4A+PY4ePZP2Kn58puNvmA/Q0ohq5aU/2lCo16+yXzq0TOqDsamW5/LsB+EBvFA+RjgFb8yRq
	moZbONHOTVKKI2vENTBzQ7H4MouedsFv5gg0Ct/kQ+CsyrbC9PtB+uifM3TpIQWeHyNJKh/d52U
	5VduPzhCZu5DHtSHZ40Q==
X-Received: by 2002:a05:600c:8285:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-493bacb176dmr13964925e9.4.1782799468463;
        Mon, 29 Jun 2026 23:04:28 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493b8cd3018sm45429405e9.5.2026.06.29.23.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:04:27 -0700 (PDT)
Date: Tue, 30 Jun 2026 08:04:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mark Brown <broonie@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Raag Jadav <raag.jadav@intel.com>, 
	Sohil Mehta <sohil.mehta@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Pei Xiao <xiaopei01@kylinos.cn>, 
	Shashank Balaji <shashank.mahadasyam@sony.com>, Ben Horgan <ben.horgan@arm.com>, Johan Hovold <johan@kernel.org>, 
	linux-usb@vger.kernel.org, Nikita Kravets <teackot@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org, 
	loongarch@lists.linux.dev
Subject: Re: [PATCH v3 00/16] mod_devicetable.h: Split into per subsystem
 headers
Message-ID: <akNYUdAS3sbEdRqC@monoceros>
References: <cover.1782682124.git.ukleinek@kernel.org>
 <20260629235804.GA414914@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bjsp2vxvxtx3lqot"
Content-Disposition: inline
In-Reply-To: <20260629235804.GA414914@sakamocchi.jp>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:o-takashi@sakamocchi.jp,m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:broonie@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:raag.jadav@intel.com,m:sohil.mehta@intel.com,m:dave.hansen@linux.intel.com,m:robh@kernel.org,m:saravanak@kernel.org,m:bhelgaas@google.com,m:rafael@kernel.org,m:lenb@kernel.org,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:nicolas.frattaroli@collabora.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dakr@kernel.org,m:driver-core@lists.linux.dev,m:jic23@kernel.org,m:dmitry.torokhov@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:xiaopei01@kylinos.cn,m:shashank.mahadasyam@sony.com,m:ben.horgan@arm.com,m:johan@kernel.org,m:linux-usb@v
 ger.kernel.org,m:teackot@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dan.scally@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:zhaotianrui@loongson.cn,m:maobibo@loongson.cn,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kvm@vger.kernel.org,m:loongarch@lists.linux.dev,m:nickdesaulniers@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[sakamocchi.jp,linux-foundation.org,linuxfoundation.org,kernel.org,gmail.com,google.com,intel.com,linux.intel.com,vger.kernel.org,ti.com,collabora.com,perex.cz,suse.com,sntech.de,lists.infradead.org,lists.linux.dev,oss.qualcomm.com,kylinos.cn,sony.com,arm.com,ideasonboard.com,loongson.cn,xen0n.name];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-66033-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_GT_50(0.00)[53];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F37556E0991


--bjsp2vxvxtx3lqot
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/16] mod_devicetable.h: Split into per subsystem
 headers
MIME-Version: 1.0

Hello Takashi,

On Tue, Jun 30, 2026 at 08:58:04AM +0900, Takashi Sakamoto wrote:
> On Sun, Jun 28, 2026 at 11:58:35PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> >  ...
> >  drivers/firewire/core-device.c                |    1 -
> >  drivers/firewire/net.c                        |    1 -
> >  drivers/firewire/sbp2.c                       |    1 -
> >  ...
> >  drivers/media/firewire/firedtv-fw.c           |    1 -
> >  ...
> >  include/linux/firewire.h                      |    3 +-
> >  ...
> >  sound/firewire/isight.c                       |    1 -
> >  ...
> >  1649 files changed, 1575 insertions(+), 2544 deletions(-)
> >  ...
> >  create mode 100644 include/linux/device-id/ieee1394.h
>=20
> I have no objection to the above changes relevant to firewire subsystem.
>=20
> Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Thanks! Added to my tree.

> Consequently, unit drivers just include include/linux/firewire.h to refer=
=20
> to 'struct ieee1394_device_id'. After merging the changes, I'll post more
> patches to modify the following unit drivers, since they are left from the
> patchset.
>=20
> * drivers/media/firewire/firedtv.h
> * sound/firewire/bebob/bebob.h
> * sound/firewire/dice/dice.h
> * sound/firewire/digi00x/digi00x.h
> * sound/firewire/fireface/ff.h
> * sound/firewire/fireworks/fireworks.h
> * sound/firewire/motu/motu.h
> * sound/firewire/oxfw/oxfw.h
> * sound/firewire/tascam/tascam.h
>=20
> By the way, the changes touch so many files. If it takes more time to
> apply, I think it better to make steps to modify across several kernel
> generation.

Touching so many files is the motivation to do all the high-impact
changes in a single go. As of v7.2-rc1 <linux/mod_devicetable.h> is
included (transitively) in ~18000 of 21500 .o files below drivers/ for a
x86_64 allmodconfig[1]. So touching that file requires a near complete
rebuild. If we spread the changes over several trees/kernel releases the
need to recompile the whole tree repeats more often than necessary. Note
this bites not only during the merge window when building the
development tree, but also during bisection.

> For example, getting rid of direct reference of
> mod_devicetable.h from drivers at first (in the case of firewire
> subsystem, for 'Replace <linux/mod_devicetable.h> by more specific
> <linux/device-id/*.h> (headers))', then adding these per-subsystem
> headers and applying relevant changes.

The impact of these firewire changes is limited to the firewire
subsystem. So doing these later is a smaller issue. I plan to tackle
these when this series is in. (But if you want to care about the
firewire bits, that's fine, too.)
=20
> Of course, I don't mind to apply the v3 patchset as is in upstream.

There are a few changes that I collected (Added SPDX markers, a few less
#includes added as my script evolved, a new patch to fix a hppa
fallout), so I will send a v4 later today.

Best regards
Uwe

[1] I did in my build tree (with the series applied)

	$ find drivers -name \*.o.cmd -not -name \*.mod.o.cmd | xargs grep -l /dev=
ice-id/ | wc -l
	19221
	$ find drivers -name \*.o.cmd -not -name \*.mod.o.cmd | wc -l
	21597

That's a bit wrong as my series changes the numbers, but the ballpark
should be right. In
https://lore.kernel.org/all/20260622210733.1743063-2-u.kleine-koenig@baylib=
re.com/
I found similar numbers for 7.1 (17038/21330).

--bjsp2vxvxtx3lqot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpDXGcACgkQj4D7WH0S
/k6p0wf8C/fqLWElPKeEJ6VYZOMbHAVQFFSaiocKgLhyatujJO/xABylQtIrG2bm
oNQHPUayrcWacObHGF3fEjQy4hRJLu10iu9WrGW/FvZUPjhCWUzPdhuXpmSnE4fH
zd/NVmkNUTbomy4rUfxcWTKfXtWxqi+pwwPvcbEeQBUCqK/R3MK9MTJPeo+fuS0w
N7J2Vv4yLihgZU1OW8Y9uT+TbrHb5Kn77XyKCF3bvRyrDK82GHBAEy0UIojDpJnT
sIhHykaiFL1/5jUZb/iCqMx0+2OUeNz8HOywoSete10zzE2qFPFgI683oSrO6gcY
cBQF6NX+zboS6GmYI42xlkzJTj7ODw==
=GSrp
-----END PGP SIGNATURE-----

--bjsp2vxvxtx3lqot--

