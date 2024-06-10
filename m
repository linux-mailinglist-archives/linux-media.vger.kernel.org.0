Return-Path: <linux-media+bounces-12805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A187D901BEC
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 09:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2FB61C21283
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 07:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8456D24211;
	Mon, 10 Jun 2024 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2BAWfcXx"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2103063C7;
	Mon, 10 Jun 2024 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718004723; cv=none; b=NHkkPEKjJnZD/WjznXudlnW35mp7G6EW06akZswozE0cf7+ZL4kge/7zRpg/MPgU/eVftxt76PiudPJouxka1uEYqCR6QJbrzTJxH4MW2aP5eHGyMqxXXqioJh85UeUv69+Li6TuYd2VupNuqP576WWK/Lq3lKb0ZrlfqPTnos8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718004723; c=relaxed/simple;
	bh=tZoaqfA9dPXq7SFLbTOVJimoCOmd3MzzXuFQVxaywC4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2VcF/e+sgJc09D1VhQOiZLtk76/OlNMVpUM4z9kjrSxYxn/s5ILFiq2/aXdxsiJBX2rnzcmaAhHGH3hicdOP+YXnvq63VcGJwa1g75NDcTzRNHUXgwk17PSTrAUQgqdRBkat//JJ7jYGEVI/b8Bbar640qmlPgs4wJo4H9kIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=2BAWfcXx; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718004721; x=1749540721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tZoaqfA9dPXq7SFLbTOVJimoCOmd3MzzXuFQVxaywC4=;
  b=2BAWfcXxYjkIeNPnH3ToqtPnsWc0VW+bPxoSSnFgxJSufeJu4SovirG3
   lnsHpL7qWQc2+H3qDzmE715ZrOEaZ+jzubzKTP2R5G21w0wPQX2rfTqZn
   xJBtBcK5J4/JsEBED7vUjBOjWd2Pt5Zt0R0KgH6+Ejvx8mfc7U4je80KL
   Yr30tggsdUafSPyDCbT1WLXz4nHZPY9D1U8MTP7dTgm/wlvYP0PTUNYVR
   QYIFD4NZefzx6aX8oFrdmJ08BbUr6QKmhk2mnX7/XcuUI/wZ4f9bqk1JQ
   gZE+x01puxMg+wG+boz+BPXuYnwVcgp2TJa7wLt1JnLE9Tu2kyEFRj8A1
   w==;
X-CSE-ConnectionGUID: fH8Zoct6Tr+mfyafoeqGHA==
X-CSE-MsgGUID: Dg8V9zg7TiS1c3IVaxOFtQ==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="asc'?scan'208";a="29616640"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 00:32:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 00:31:52 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 10 Jun 2024 00:31:50 -0700
Date: Mon, 10 Jun 2024 08:31:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Adam Ford <aford173@gmail.com>, Andrey Konovalov
	<andrey.konovalov@linaro.org>, <linux-kernel@vger.kernel.org>, Naushir Patuck
	<naush@raspberrypi.com>
Subject: Re: [PATCH v1] media: i2c: imx219: fix msr access command sequence
Message-ID: <20240610-wolverine-hanky-37cc8c409958@wendy>
References: <20240607-trimmer-pummel-b452ed15e103@spud>
 <20240607155704.GB1242@pendragon.ideasonboard.com>
 <CAPY8ntBNNOFR1nn05g4Y-SOv_tN0YJv9wygO=+S80-zA1oq7mg@mail.gmail.com>
 <20240607-celibacy-contend-c4a6be15804b@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RQwjnWiVsjBImHpx"
Content-Disposition: inline
In-Reply-To: <20240607-celibacy-contend-c4a6be15804b@spud>

--RQwjnWiVsjBImHpx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2024 at 06:55:01PM +0100, Conor Dooley wrote:
> On Fri, Jun 07, 2024 at 06:29:49PM +0100, Dave Stevenson wrote:
>=20
> > > > ---
> > > > I got the report of this third hand, I don't have a device and can't
> > > > test this. I do wonder why the RPis get away with the sequence that
> > > > seemingly doesn't work for the guy that reported this to me. My the=
ory
> > > > is either that they noticed the sequence was wrong while adding some
> > > > other MSR access that is needed on this board while either cross
> > > > checking the values written or because the other MSR accesses didn't
> > > > take effect.
> >=20
> > Did the change fix it for the reporter? We're using the driver with no
> > changes to the register settings cf mainline.
> > Why it works on the Pi but not on a Microchip board is likely to be
> > something quite subtle.
>=20
> I've asked, maybe it turns out to just be the first of my suggestions,
> and they noticed it was not matching in passing.

Apparently it was the latter & they did need to fix the sequence to be
able to write the MSRs.

> They did introduce two
> additional MSR accesses, both outside of the range documented in the
> datasheets I could find online. They did have explanations for what those
> undocumented MSRs did (0x5040 and 0x5041) in the mail I got, but given
> it's third hand info to me, I dunno if we have the datasheet etc. I'll
> try to find out some more next week.

Seemingly what those two additional MSRs do is under NDA so I would have
no way of justifying a patch to add them or the devicetree property
required to know whether or not the additional MSR writes is needed. :)


--RQwjnWiVsjBImHpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmar1QAKCRB4tDGHoIJi
0nywAP9jiXVl7YlW5revw707dpMwBM18c+5dtlHTgE8jVUt9uwEA3uG5TXfEGThl
H/f1AFrVA5fpcSwZaV56fBU1J29Rewg=
=srXG
-----END PGP SIGNATURE-----

--RQwjnWiVsjBImHpx--

