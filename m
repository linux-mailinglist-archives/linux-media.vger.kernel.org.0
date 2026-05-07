Return-Path: <linux-media+bounces-60860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIl+C/n9/GmxVwAAu9opvQ
	(envelope-from <linux-media+bounces-60860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 23:02:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9DB4EF17A
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 23:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B66C2301370D
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 21:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBEE3191BD;
	Thu,  7 May 2026 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgwxFoMA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD3A175A99
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187762; cv=pass; b=RxoY5vZ5tkuJvlOjm5qtYy78Dqa7zcNbq7eiCZPvtw+RJvjPJAEBemC2mVq5cw1YmLvO3Bx1Wvayzs3nR2STCxsA8PUfvgpLPrdbjQlvqLc9hSr694nxhCZLzNAXn+UWLcsjycPoeRfWz43PcRIRTI0axIu6ZBCWIRI6PRBssa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187762; c=relaxed/simple;
	bh=BReTE+WddiyuqGiKoF2f06qwIX1MxPwMLiRTp5oPsoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYjntLQCXVICw2w5aduTpv/VEq90t80nid/E6AOmEg9uDpcT5/inXQ1+FRIBiABVzwyLknnU3lwb7H6qaZFylLSh5DTwjQfxtzqzHCjdydTocbwPDmS7R6R3mEFqU0IK2OIrv3Y4pB37sRS/UOH3ByGXpUe0XEi5m8w3Fcy6ruc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgwxFoMA; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-40ea611d1a4so576264fac.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 14:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778187760; cv=none;
        d=google.com; s=arc-20240605;
        b=aKX4hPGWa3qP7USsShcOUQMlGTtTNNOznKM3PoFxrx10jGnCgS7375n8vmTDOG+L0o
         LJnVm+M7lCKZULXP78nHSUV3VfDfE9ukk0S0Yt/WXI8umC+2Xi67yQY9FITBhYst8yJz
         azoyUkjxCIw3vDu8Bzn2FK6mdxQ7JG0ipPZkfuIl2ZWLyf7rKnOO7kMWWA2FoY1u85Qm
         RWHLHDKkSQ15zQL+qU5vlrg8eXxg+jkF6KSkz+OYv6qDvXrhYOIw+mTEIRm0Ik1xxT3o
         LnXRyoCLk5/X2TFUnWs02F+Lg0rA78GGm2B28k+Bhhqoa0MS+HS3Rmugi/f71ZcIBvJH
         Gxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=obVEZUPYeGxmy9MT3rfYBiKEPiqB1fkSFgdgZq4fiG4=;
        fh=nM2glHlGJJbdoDAHWyaCx9pSWO3syfC79yvDN4GehOo=;
        b=Mu7DvLNzDjbnl2K8MZr7ky8b/4zDTMWktiKQp75mazwyqfO/vMoPcfM1OHLBzfUHKU
         mnu/28+6nu/GdEVVwMVtthq25C0Giz0nks2VqsACi6usFHyo9Cr2P20h6MEGp0J8SL4I
         h5G/pdoJwCKPpptjSb7It7zq43b21QExldN2m371iHwHuXMTOMnBMM7qu1Nti79wQBwm
         ct6Wn46Z4lLjETplHYYUMvGRlMB3Y8pn38JeTw6MReoEL9dejLj/e+lwvpCJu90kWNx+
         SYzY4Gc/SZizKLhap92vd0PNJuCkCCKsV6Z7PLnFOOqPng0X9irEBmZu/x/LsKucjw2n
         +xrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778187760; x=1778792560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obVEZUPYeGxmy9MT3rfYBiKEPiqB1fkSFgdgZq4fiG4=;
        b=sgwxFoMAnNPYS9wQKJJxKOETTcBMooghnWLjJ+Oq3vOttaHciNaE5dCouEXVwsoQQ7
         XlqDFztjpusYhL9CRG80YUa+7ptBAH+wnN+vgc88ETkvoBr0xF3c206R0xx99i2nUjES
         dZnSHESpEk1wmlSw8rxjPqHCrZ5BPSfmlH1A+SccW96UENwJ2dx31RcvRkqbg61kDWfT
         LLUvFnfgAxXFq/PKRFvbGHo4eDzU3BKJrr9XZUYg7kVpxE0EC/dAFP86wkwu5Xm7k2xU
         b1HZeWELJ5HqVKF5AaKRfACkWcjVoO8ORnD5UVEnlOBJe4s+6m/bmEawjZsBf7mOn9WZ
         Duqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187760; x=1778792560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=obVEZUPYeGxmy9MT3rfYBiKEPiqB1fkSFgdgZq4fiG4=;
        b=OTu/h4RXLV2uecIEaePFJGFwKrm6hB6NEvx2xg/0754CeyBfiVFv0p7/7MIC2BtaaP
         3T+iB7+WaRqOge7VIR4awiL1c56EOwlk5GG7w9K8FmQGG0vqs4WecxP9oCtzom/m7IaQ
         xe6ltqHNzXNsBKc29q7sebQnuacwpB2oAQLI8klAtCwYrCgbEaelrAlaDdVmC9BxhrYf
         Jj2Ja5AMMX+ZkLi6hUzGCnJloAwBC5iNz8gesHbxmmyHQpVnJxOQjZCDWYw1Kq9jkdSv
         invtfwmB57cHrmrN2032felIT/pVvrTrKaJHJQGBi555YPriprkjBFVjemn3a92362gD
         y27w==
X-Forwarded-Encrypted: i=1; AFNElJ8ZthPPTfAT/y1n76ykXWpl2l39anFB1T7WASadxGwPUkdXKwXvRrCb4ZuYG/RH9yvclLkGTMto2DINFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjGIss/68ReybsCsh1kjpwm/BOOtAv5HsLlN2ttQ/l3AKLsixy
	yC/2dlFHKZJFXqMtSymDYrvc19o/ZTtORM54olCvS/8f9fDfcVWAmpgQw+PCxEdKuEb8FUxluZQ
	ztn3vosLtXWWbxO8nc6EX2SqwOFXRsUw=
X-Gm-Gg: AeBDiesuTUOcjmj+wEDESZW1ihRLvZ6uh/N85NREi/MfTQoI1L2l+hcnK1qfA1OoCYk
	pP9VQ+WoaQvdRNrrLXfmmHR7XfeN5r4PnjyB7DCRG5rNOZwYD2j8upEFz8I/cGvJ0ozcNo3uhxG
	faMNNOBWuSMi7T5dtxveKw7k7kB9wBUNP3oRHlFYwwyMFZaK1AkgaaspSK16PTLzqiByJWC+sO4
	WSuglVIsM9qiZb/2iHEiwDh72YkD4rMKh6sagtjj0pgL42GuTGlJe5jvkp9U5tXRDXFWBc0En2i
	4sVawCfz0Z4hIRElXuo6w2w7UQRdGcZ3ndd2sQ==
X-Received: by 2002:a05:6870:c2a5:b0:434:2752:34db with SMTP id
 586e51a60fabf-434f57e6d6dmr6811252fac.5.1778187760085; Thu, 07 May 2026
 14:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506174412.2606010-2-u.kleine-koenig@baylibre.com>
 <69fbbba5.050a0220.1ee6cd.0145@mx.google.com> <afxV1qkHJaHbmtk2@monoceros>
In-Reply-To: <afxV1qkHJaHbmtk2@monoceros>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 7 May 2026 23:02:22 +0200
X-Gm-Features: AVHnY4J3Sot_AQyZc09VwReKkdHezVTxsWY_fzurl7nQR-tYnVhQFJPsXPzAT_Q
Message-ID: <CAPybu_2rOFQ=RiXNZqVS=wKcg2t3A=xdrHEPNZ=wCJKp_WkYiw@mail.gmail.com>
Subject: Re: media: pci: Use PCI_DEVICE macros and drop zeros from
 pci_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7D9DB4EF17A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60860-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ricardoribalda@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

Hi Uwe

On Thu, May 7, 2026 at 11:12=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Wed, May 06, 2026 at 03:07:33PM -0700, Patchwork Integration wrote:
> > Dear Uwe Kleine-K=C3=B6nig (The Capable Hub):
> >
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> >
> > # Test media-patchstyle:./0001-media-pci-Use-PCI_DEVICE-macros-and-drop=
-zeros-from-.patch media style
> > ERROR: ./0001-media-pci-Use-PCI_DEVICE-macros-and-drop-zeros-from-.patc=
h: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
>
> I don't understand that one. Ricardo has nothing to do with creating and
> applying the patch so far, so why should there be an S-o-b by them?

Ignore that one. I screwed up setting up the git repository in the CI
server. Sorry about that. It is already fixed


>
> > # Test checkpatch:./0001-media-pci-Use-PCI_DEVICE-macros-and-drop-zeros=
-from-.patch checkpatch
> > CHECK: No space is necessary after a cast
> > #2473: FILE: drivers/media/pci/saa7146/hexium_gemini.c:365:
> > +.driver_data =3D (unsigned long) &hexium_gemini_4bnc,
> >
> > CHECK: No space is necessary after a cast
> > #2486: FILE: drivers/media/pci/saa7146/hexium_gemini.c:369:
> > +.driver_data =3D (unsigned long) &hexium_gemini_dual_4bnc,
> >
> > CHECK: No space is necessary after a cast
> > #2524: FILE: drivers/media/pci/saa7146/hexium_orion.c:429:
> > +.driver_data =3D (unsigned long) &hexium_hv_pci6,
> >
> > CHECK: No space is necessary after a cast
> > #2527: FILE: drivers/media/pci/saa7146/hexium_orion.c:432:
> > +.driver_data =3D (unsigned long) &hexium_orion_1svhs_3bnc,
> >
> > CHECK: No space is necessary after a cast
> > #2530: FILE: drivers/media/pci/saa7146/hexium_orion.c:435:
> > +.driver_data =3D (unsigned long) &hexium_orion_4bnc,
>
> I didn't introduce these, but can cleanup that en passant. IMHO it's ok
> to leave it as is because I will touch these lines in the (hopefully
> near) future anyhow to make them
>
>         .driver_data_ptr =3D &hexium_orion_4bnc,
>
> .
>
> Please tell me about your expectations here.
>
> Best regards
> Uwe



--=20
Ricardo Ribalda

