Return-Path: <linux-media+bounces-66517-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r5KmHpzgR2rbgwAAu9opvQ
	(envelope-from <linux-media+bounces-66517-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 18:17:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA67042FF
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 18:17:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=s6tPSq6Q;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66517-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66517-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15F963003711
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 16:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920222E173D;
	Fri,  3 Jul 2026 16:17:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE1E26CE39
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 16:17:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095445; cv=none; b=q9iHwpMOutMllhN8eFyTgpWsGtvjCxSo4HtxlG6/uK+6e9WZJJMMq9OBKwBMVV93Si6fphspCHaqUBZjxKV2oYPLIJvkcHAxHJhg6m0MYJ7VBC3UitEx8OTtMzTEFsyww9ioCN+zqcRGf/5LyhDaR4pJJeAeWjSEoOsWn4mrS0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095445; c=relaxed/simple;
	bh=DbDwH4gMpyIpRZUwhzcPGFVwBtF5moFEWKcVDDFftm8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XR5y1Ohd2pl6BYa/zrUav9KSKsz1ly4z2FehKFBjde9bm8k/2D8KBQvST6u41rzTjHqroEnn6AsfBUQQb11kqR32RsTa3phZNkv6PR6WOpbtk/FcrFuwMYflMwTV4agYFUEMgMYKD07H28R2OCSFx6V+PBSymLX+LuFDOhx4RZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=s6tPSq6Q; arc=none smtp.client-ip=209.85.219.42
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso13793276d6.1
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783095442; x=1783700242; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DbDwH4gMpyIpRZUwhzcPGFVwBtF5moFEWKcVDDFftm8=;
        b=s6tPSq6QRgKerFxRHprrb3wJo0aBXKcTtKQUFMtqMlyLK//2sitg7t+hMWOzEkJPHb
         pDeEtgnQ2Dhw4NwPMyLNYOBgU2/NF0qdP/p+AHXOPzUx7rPOkD7OL0/W37C6aee3LohQ
         KSBpyfmFkLJvBFgILDo5pHVH1FVjoalIZwymHNM7LB/QGDJIusjWn7Tw4w0BAlUNhsAZ
         koWGnY7t2r1Q9WOOfBud7GCzmEaZU+dLM0+T/ESWklkiVOsMch9hmVtWwDi69EsMq3Ye
         2E0uIncvlAe7K2DiqotbelnQ0a2FQ6hAnt2CYwcioI/xFq5qU+dhFqE4SlfsMbODfpnv
         dv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783095442; x=1783700242;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbDwH4gMpyIpRZUwhzcPGFVwBtF5moFEWKcVDDFftm8=;
        b=TTEjp20YMlx0aCrULFDW0TIqB5ZfCs+3SOuT3RvfbMeheslEzL235ZAb+jlbZo3roE
         3Ylr4mfkDnkzbOE7dJ68tV3TslklStVIdNPxEyS507zkc6QJZRfAnGgCm/MC7fy3dReR
         PNiBMOclCAWDL/dntabLgF06bH9OWI6LmJgqNh5u9otWhAM6A3oHGLVjz6+cqQfGEvM/
         tKKu2fquQSBG1DmviwG8fUsJ8lcwHjzFb5h4kOL/DVD2ePcLnSqQKKL1vgZjbbT6m7Lo
         V9v3jygogxxbHQbxNhoMxAGR6zq9lS2N2AajfNrZf8Cm5QnUifuy/Yc4z+AlaqIwBj3i
         t1Rw==
X-Forwarded-Encrypted: i=1; AHgh+Rob83Mjx63BPxJ7UB0+/K3unLZEG80TJw76CSgEMxlYViuz3oDDCe1QVuyNW+7Ay1YcKDbckJA9xFKnew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZtGukhNytIDyaQH8sPDHisn8hcJqDIF8OurdFGg8hgYRvBzWx
	ygc32MGUu1hLcrwJgl/JJf4NGy2suG0V9SbuX9qNXV59Kr1MnGQQCyqreBvFkvD6Z5PGcNowJK6
	BhkUuwR0=
X-Gm-Gg: AfdE7cnEtsB9HdAymmOHCziaEpmhNVbf6JOHCSYfavk24GgBE31MRbB406wluy9kaxI
	Z6PY9PzhSKBKFyI24itVWIU9mi2StWlQmCm17qw76UP8i3OOYXjix+E5SR6TnWGegeoW+07jZlc
	F+g8PeG2Q3y9n6cCepMdIIFER5wjC8HIxabhd2bFqtoUjxPZRbDzORbi6gY/JYNP3SkVY1pLCm2
	McUp2xnOc48baIsqvWhfEhGDvFnWjNbj4bTKYekWOpYwUub4s+lswnFQvB23Gbw0vPJHNUKSSOL
	Wj6CRMxHfprlBz5ZPPUs+pZHVlzH7wzYuL9SKCHOholxIzKvA7BmUb5fdkad0bLnnvVvzJyKCQj
	8LVp7roN75jnJVJSID4Sx7fTJX5SUTZBJgcBYTLwvJ33qNm8lgWdIXRb1GsQppI/TWpmbKYSBj3
	9F6YTHLfLNOrdNFtFyd7+u9vrAAoxtdooS
X-Received: by 2002:a05:6214:3010:b0:8f1:4bff:24dd with SMTP id 6a1803df08f44-8f5bbb16173mr70228566d6.5.1783095442334;
        Fri, 03 Jul 2026 09:17:22 -0700 (PDT)
Received: from [192.168.42.165] (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e942af0sm59453166d6.14.2026.07.03.09.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:17:21 -0700 (PDT)
Message-ID: <2dd5cef71eb1ce5c246e64105ebd0d5cd593a0e0.camel@ndufresne.ca>
Subject: Re: [PATCH 00/41] media: ipu6: Add support for ipu7 hardware
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Antti Laakso <antti.laakso@linux.intel.com>,
 linux-media@vger.kernel.org, 	mchehab@kernel.org,
 sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com, ong.hock.yu@intel.com
Date: Fri, 03 Jul 2026 12:17:17 -0400
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3C4wGLGtl4vTTGK5+AbH"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:antti.laakso@linux.intel.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66517-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DBA67042FF


--=-3C4wGLGtl4vTTGK5+AbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 03 juillet 2026 =C3=A0 18:24 +0300, Antti Laakso a =C3=A9crit=
=C2=A0:
> Hello,
>=20
> The 7th Gen Intel Imaging Processing Unit is a PCI device including
> input system and processing system. This set adds support for ISYS
> in IPU7.
>=20
> At this point only IPU7 is supported, not 7.5.

Is this implementation replacing the staging driver in
./drivers/staging/media/ipu7 ? Can you outline the plan ? Compare this
implementation against the other one ? Or perhaps its just a different comp=
onent
of the camera?

Nicolas

>=20
> Device matching related code will still be subject to rework for
> a later version of this set.
>=20
> Antti Laakso (41):
> =C2=A0 media: ipu6: Replace internal hw flag
> =C2=A0 media: ipu6: Rename pointer to firmware context
> =C2=A0 media: ipu6: Rename buttress_ipc pointer
> =C2=A0 media: ipu6: Remove duplicate warnings in cpd validation
> =C2=A0 media: ipu6: Remove unused ipu6 firmware struct
> =C2=A0 media: ipu6: Cleanup ipu6_mmu_init()
> =C2=A0 media: ipu6: Simplify firmware com arguments
> =C2=A0 media: ipu6: Add IPU7 pci IDs
> =C2=A0 media: ipu6: Add ipu7 match tables
> =C2=A0 media: ipu6: Prepare buttress for ipu7 support
> =C2=A0 media: ipu6: Use single struct for registers
> =C2=A0 media: ipu6: Rename IPU subsys ID
> =C2=A0 media: ipu6: Add ipu7 buttress support
> =C2=A0 media: ipu6: Prepare mmu code for hw variation
> =C2=A0 media: ipu6: Add ipu7 mmu support
> =C2=A0 media: ipu6: Add ipu7 cpd handling
> =C2=A0 media: ipu6: Rename isys fw msg union
> =C2=A0 media: ipu6: Move isys isr handlers down to fw file
> =C2=A0 media: ipu6: Move hw specific buffer handling down
> =C2=A0 media: ipu6: Isolate hw specific buffer handling
> =C2=A0 media: ipu6: Add isys firmware ops
> =C2=A0 media: ipu6: Add ipu7 fw com methods
> =C2=A0 media: ipu6: Add ipu7 fw isys ops
> =C2=A0 media: ipu6: Add ipu7 csi2 register definitions
> =C2=A0 media: ipu6: Add ipu7 isr handler
> =C2=A0 media: ipu6: Add ipu7 csi phy driver
> =C2=A0 media: ipu6: Parse bus type for ipu7
> =C2=A0 media: ipu6: Enable ipu7 isys interrupts
> =C2=A0 media: ipu6: Skip watermark configuration for ipu7
> =C2=A0 media: ipu6: The SPC init is valid only for ipu6
> =C2=A0 media: ipu6: The VC arbitration mechanism is ipu6 only
> =C2=A0 media: ipu6: Move buttress mem alloc out from probe
> =C2=A0 media: ipu6: Read correct SKU ID for ipu7
> =C2=A0 media: ipu6: Add support for fixed iova region
> =C2=A0 media: ipu6: Make fw mapping function more generic
> =C2=A0 media: ipu6: Move isys fw mapping to pci_probe
> =C2=A0 media: ipu6: Add check for pkg_dir before freeing
> =C2=A0 media: ipu6: Map ipu7 firmware
> =C2=A0 media: ipu6: Set model name for ipu7
> =C2=A0 media: ipu6: Set ipu7 as supported for ipu6 driver
> =C2=A0 media: ipu6: Add ipu7 as supported device
>=20
> =C2=A0drivers/media/pci/intel/ipu6/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 10 +-
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-bus.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 +
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-buttress.c=C2=A0 |=C2=A0 580 ++++=
+---
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-buttress.h=C2=A0 |=C2=A0=C2=A0 48=
 +-
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-cpd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 184 ++-
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-cpd.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 43 +
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-dma.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 30 +-
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-dma.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-fw-isys.c=C2=A0=C2=A0 |=C2=A0 584=
 +++++++-
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-fw-isys.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 48 +-
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |=C2=A0=C2=A0=C2=A0 5=
 +
> =C2=A0.../media/pci/intel/ipu6/ipu6-isys-queue.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 87 +-
> =C2=A0.../media/pci/intel/ipu6/ipu6-isys-queue.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 6 +-
> =C2=A0.../media/pci/intel/ipu6/ipu6-isys-video.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 168 +--
> =C2=A0.../media/pci/intel/ipu6/ipu6-isys-video.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-isys.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 405 ++----
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-isys.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 55 +-
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 292 ++++
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 120 +-
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-mmu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 158 ++-
> =C2=A0.../intel/ipu6/ipu6-platform-buttress-regs.h=C2=A0 |=C2=A0 103 ++
> =C2=A0drivers/media/pci/intel/ipu6/ipu6.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 396 +++---
> =C2=A0drivers/media/pci/intel/ipu6/ipu6.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 210 +--
> =C2=A0drivers/media/pci/intel/ipu6/ipu7-boot.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 408 ++++++
> =C2=A0drivers/media/pci/intel/ipu6/ipu7-boot.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 41 +
> =C2=A0drivers/media/pci/intel/ipu6/ipu7-fw-com.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 74 +
> =C2=A0drivers/media/pci/intel/ipu6/ipu7-fw-com.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 53 +
> =C2=A0drivers/media/pci/intel/ipu6/ipu7-fw-isys.c=C2=A0=C2=A0 |=C2=A0 788=
 +++++++++++
> =C2=A0drivers/media/pci/intel/ipu6/ipu7-fw-isys.h=C2=A0=C2=A0 |=C2=A0 296=
 ++++
> =C2=A0.../media/pci/intel/ipu6/ipu7-isys-csi-phy.c=C2=A0 | 1074 +++++++++=
++++++
> =C2=A0.../media/pci/intel/ipu6/ipu7-isys-csi-phy.h=C2=A0 |=C2=A0=C2=A0 16=
 +
> =C2=A0.../pci/intel/ipu6/ipu7-isys-csi2-regs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 1188 +++++++++++++++++
> =C2=A0drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 601 +++++++++
> =C2=A0drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 146 ++
> =C2=A0.../media/pci/intel/ipu6/ipu7-platform-regs.h |=C2=A0=C2=A0 32 +
> =C2=A0include/media/ipu6-pci-table.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 =
3 +
> =C2=A036 files changed, 6977 insertions(+), 1283 deletions(-)
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs=
.h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu7-platform-regs.=
h

--=-3C4wGLGtl4vTTGK5+AbH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCakfgjQAKCRDZQZRRKWBy
9BUlAP9W5OfZxHNj2LYls3D10iTn2WDv+d+dZs5viiiFuQcIhwEAuXzmzlu+ltl4
nJnY+J/EeRMOS/iXwo6mJaLPpeiMxg4=
=MCrg
-----END PGP SIGNATURE-----

--=-3C4wGLGtl4vTTGK5+AbH--

