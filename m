Return-Path: <linux-media+bounces-60768-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBICJolX/GmvOQAAu9opvQ
	(envelope-from <linux-media+bounces-60768-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:12:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC94E5950
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE0993067EFD
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 09:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003D43A1699;
	Thu,  7 May 2026 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="sMRXE5kR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C61739478D
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145018; cv=none; b=V950pCxwvxng2abLXFiv9JmlvfRWSjvXKTfZXj1hLbFi+QPWcI/x4ix6vvpYXzYNzIXKAQnW8VSY6X0VXA/74lJxrIq5KPO3YGJD4MfDpNiZ00tPcaDyW8XHwVHsCcaIji1jSIf4ArLA/Yx6yyrjrUM76h3zwMSlJSVYF3wpKhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145018; c=relaxed/simple;
	bh=Es88Yu65wUMSaQFE/UCCEK51UDHvc52tu88+CMwtra0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANgPjer1uI+is3jBpm1CqbdbVoBlQ2uwghJZafaQNWuk/SLBJFFU4RajG8IDgHZ+NBPkJCAIwVU8iq9yL32y2/2Khk21ePiuDgB4f7nlNlB+tzbS17yTa2QKuhr+THt816PS7VZlk7KcXgpWclHOl57C5zluc8iYfaPDqqmnXKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=sMRXE5kR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d146705b4so7324565e9.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 02:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778145009; x=1778749809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uX2uw4njESM6FzmX10EYIOdBZeyEmnMqBSR/sN4F+u8=;
        b=sMRXE5kRrh9Q2R5SKbjPPWCadZ1HXfaMk9vvk375asxFqe93JbrN7tfl53VD4K8yi0
         wIDH/91iJ/FDJuyU15wHBlSOJ6guXiwQUBJHTwlpo7i3cap3oSD8CfH5G0h/VCPU0wNN
         qEBeiARstbhCl89aPWJNdUnM4VWrnOmCXyk0+mdPLF+1zYmxNnZLaLJ6PMTglcRs+7TJ
         96SR+20BQ8rG50feCsKTma4q7OK4GqPH5q+noD4zNoMmgcSME7yJT5N6CWwyK4OQ+VLx
         KqY8Ku/gig5N8xR0ofwSMBc3IRp1QXlcVrhh+3fD9YvNocON4z2JJRNde6uxtjyuJN7m
         L+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145009; x=1778749809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uX2uw4njESM6FzmX10EYIOdBZeyEmnMqBSR/sN4F+u8=;
        b=DGZJyks/1c/c/GqcwDj5vT4/6wxXfYoYZIcgWGMGUIIUik3l69mk2VtQZxI+zuVMSk
         bCEjbUPdf5gwiwYw5+LVutd3+6XjZQqK9b9qMxCSOixB+SbV/wFTgyjxM0VbwH9YMAvA
         Cif+pHTV9yyvyM5JMwBd2Rz5+pFu4qd4sL2n7oQDHoJS+9MMJyOZDkt9JyJrQcQLQlmo
         PgiRlG0fWS7BGpHEtDy+ERCsd6mDgvGPwM2yj6DydNTjczgrpp+ly61/5zuY5+892Syp
         JPfWP4AGyFF1jWuXHd78evjFTiKz4YCFNRh2Gst4+c8dvOrxmgzVGtRTVcLN5Q2CQyEZ
         qFdQ==
X-Gm-Message-State: AOJu0Yy7jRNooPj2y1epPUdvrnc8Hamm1zSntRS0jRbh6oMxoB/EGL0k
	fpFKmAgBcZiJxzKHYcYZPozk2JJkkt65M/4Grd5aphX+SHieUNwA0KPXJo5sirFmOsY=
X-Gm-Gg: AeBDiesdm9zJgsLj21W14EEFt5QkjFSi0MmZvT5xdGt8nO7sZRDUn0iqINEecHGBZ+R
	m02YM1mw1NMJcbpkAT+5jGgVVb2fglM10/JB6yKammKdcClFfp5pmB2SSfDEIALW3vjmmR6Hdhh
	cJf2WG+i2WH8oPtdhKSu1iypXCBJhia9TpgehzLo3kBhlkuG9tL0bm5RkMruP7l58CXrCn2rf6N
	/WuhmQPzHyW6gFei2fkAu9749aVPGRflwLaLgUGqwluagMoJnGKm1ot4lchRl8dkC/daZEty3/s
	v7ACWp27Bq/qXcEE3NeO0eSjA4q5EyZg/+36B48AyCTCB1yeSttHTCs1Q3ZgBQzkHSOLO4JtN3K
	OuGQSc/Gt+/FyCK4Lo9hCs+oS2TijD2aLyhx1mFEQUA6Kec2qWX/owOW4pJY6hWJQX0oBgK5/6P
	k2TpLyAveFiPW80PJZ2sCTOPE2TFWp/5MLAYWQ1D6O1ffcnLbi2UXSobccYCPNr/KIGiwIXrJQr
	4E5FRT61xW9eSynQGeFtlVzG4h7+AKe91W8
X-Received: by 2002:a05:600c:a405:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48e51f54230mr99031915e9.26.1778145009073;
        Thu, 07 May 2026 02:10:09 -0700 (PDT)
Received: from localhost (p200300f65f114e08ac341e0bb79e5496.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:ac34:1e0b:b79e:5496])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48e538d2878sm174760185e9.15.2026.05.07.02.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:10:08 -0700 (PDT)
Date: Thu, 7 May 2026 11:10:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: Re: media: pci: Use PCI_DEVICE macros and drop zeros from
 pci_device_id arrays
Message-ID: <afxV1qkHJaHbmtk2@monoceros>
References: <20260506174412.2606010-2-u.kleine-koenig@baylibre.com>
 <69fbbba5.050a0220.1ee6cd.0145@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="amcqlxpotrw4kcn4"
Content-Disposition: inline
In-Reply-To: <69fbbba5.050a0220.1ee6cd.0145@mx.google.com>
X-Rspamd-Queue-Id: 04EC94E5950
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60768-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


--amcqlxpotrw4kcn4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: media: pci: Use PCI_DEVICE macros and drop zeros from
 pci_device_id arrays
MIME-Version: 1.0

Hello,

On Wed, May 06, 2026 at 03:07:33PM -0700, Patchwork Integration wrote:
> Dear Uwe Kleine-K=F6nig (The Capable Hub):
>=20
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>=20
> # Test media-patchstyle:./0001-media-pci-Use-PCI_DEVICE-macros-and-drop-z=
eros-from-.patch media style
> ERROR: ./0001-media-pci-Use-PCI_DEVICE-macros-and-drop-zeros-from-.patch:=
 Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by

I don't understand that one. Ricardo has nothing to do with creating and
applying the patch so far, so why should there be an S-o-b by them?

> # Test checkpatch:./0001-media-pci-Use-PCI_DEVICE-macros-and-drop-zeros-f=
rom-.patch checkpatch
> CHECK: No space is necessary after a cast
> #2473: FILE: drivers/media/pci/saa7146/hexium_gemini.c:365:
> +.driver_data =3D (unsigned long) &hexium_gemini_4bnc,
>=20
> CHECK: No space is necessary after a cast
> #2486: FILE: drivers/media/pci/saa7146/hexium_gemini.c:369:
> +.driver_data =3D (unsigned long) &hexium_gemini_dual_4bnc,
>=20
> CHECK: No space is necessary after a cast
> #2524: FILE: drivers/media/pci/saa7146/hexium_orion.c:429:
> +.driver_data =3D (unsigned long) &hexium_hv_pci6,
>=20
> CHECK: No space is necessary after a cast
> #2527: FILE: drivers/media/pci/saa7146/hexium_orion.c:432:
> +.driver_data =3D (unsigned long) &hexium_orion_1svhs_3bnc,
>=20
> CHECK: No space is necessary after a cast
> #2530: FILE: drivers/media/pci/saa7146/hexium_orion.c:435:
> +.driver_data =3D (unsigned long) &hexium_orion_4bnc,

I didn't introduce these, but can cleanup that en passant. IMHO it's ok
to leave it as is because I will touch these lines in the (hopefully
near) future anyhow to make them

	.driver_data_ptr =3D &hexium_orion_4bnc,

=2E

Please tell me about your expectations here.

Best regards
Uwe

--amcqlxpotrw4kcn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmn8Vu0ACgkQj4D7WH0S
/k4bCggAr6kUztCDlPfTJ3dKcgh1HttWu+iP9pb2L2Id3JZzoojPf7mdAaNMbCdc
LkD/2Zzpow9mnvUdo/PBS2wYDbzzUJZPLrKEXZJ+IIzsGvI6HTv78iR6iwP2rY2q
eIojG83Ei3tzhjwplkeH9aRqCLFdtTc9FZQCs9KoO/abgKovaJ9MZCQL7jB2PQKS
VVqVpTYgLK/EumGHbkbH6H3wBcg7vm4BbXXLwEP+5UbPhthuTCQNvuLB3sTbQQcU
J/IKRDmWO5CVXmT2ceA4trQJhK554R4sKQa6xFSaM63yDiYxmfuKozPKpavK6Kbr
eQ9vJHHtZ+jfpNBQ0mEcr9+praIpEg==
=0tiY
-----END PGP SIGNATURE-----

--amcqlxpotrw4kcn4--

