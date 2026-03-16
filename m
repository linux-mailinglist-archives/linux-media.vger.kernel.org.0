Return-Path: <linux-media+bounces-55941-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEOXEsMjuGk8ZgEAu9opvQ
	(envelope-from <linux-media+bounces-55941-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:37:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A8F29C8AA
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A79D302C6D4
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964813AA1B2;
	Mon, 16 Mar 2026 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="u1VWQwa5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0953AA1A0
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674781; cv=none; b=cZ6b+Jd9OOW3MtW0TMJlzzmbv3lWbkfImm6dfLloucx2T0WDYGBYo4Oq01byuEfmweEoyYE2YCHAR+21aDthrl6kS3NLQT3OMY9Lbx1JQa2ykpVSc9rFLzmly2hepXwJDVL9rvdwarJZvrXJxyvZbhmt7wGLNw9MLDWN0sK4WnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674781; c=relaxed/simple;
	bh=ChNwrvwut9AH8kQhXrPmezqcMvifV/XRrhrpWQpij9s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UMl4lfPbU+1qYXsC1DXEwjh41yNXP+w31gfhuNfek5prIWJrStlYDKsFxUXknvbn9YusKdTFwUQAzzVlPwOYuIwUwBlLn3rUEvzwV5fsS2VV6FR6mcEFzuPXcmebtZfOBTf2v40Y0FZDa561OqO/cQCZ2mQ4WOsjkvnaAgfkNXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=u1VWQwa5; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8cd751a4e93so274880785a.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773674777; x=1774279577; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ChNwrvwut9AH8kQhXrPmezqcMvifV/XRrhrpWQpij9s=;
        b=u1VWQwa5ye9ZBXKUG6uLwhPpkJoxE/ivguem9y5a2s5fFljWwfgpRqGdGFVtdej8mm
         Sc61rUkgkaaovXoNyiKW1O9gRYoaCokdpJ3Po6Lz4/jJlrZLiDM9WgR0QC3MwpZhOsf8
         sejh8E7RrvsIB195GxxOotAa75Ws6uXHopvaclIm7NvzfjfVfC764YOEebrejH11Un2H
         cOCk6qTiwinH4T4FTCQzGIaG3w2mQQLA1YYlEnhr6dItWYcPKZxww+EFM6QqIFMB1PUV
         k7YfcMpiNVKwpfIGXhSj3xxY+nOxC4seSXRZeLwpIT0H5ggitqMRACu21yVCWQ75jIxI
         UhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674777; x=1774279577;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChNwrvwut9AH8kQhXrPmezqcMvifV/XRrhrpWQpij9s=;
        b=hZFPSWeLRn4SUpiDGorpOhS/kfS9lN0CMEh5vr6LhV2E93c3tUn6m4fDhWhhYTC/o/
         UanK8hLczQrG+enrrzTd90Sfei1ihLMNiRlmv5dRh3mEu+tYWPKCn5nnMGyed1cqJuwM
         Bqef9XLRqUYXZktOmy5cARc6WO8HyBSO6qdhPoS2ESM4e1uA7MPCl9GNshwQbc7Todo0
         0z/MQ9r7WuAgnDT1J2lsqNZU2JXcx82z4k3Yh9nisoKsRXHUl6zcN7yCYenwZYCMBuc6
         IxQQJLsRTCNpp4whB3iJ/KJZ5w3K7z56GhTiH3ODyxvlV0LMiLmzUCVNdYI6X3C4cTWX
         TPbw==
X-Gm-Message-State: AOJu0YzabZAUCPjLwms9aY0Zfe0KCgg49NR3lH93fPypODqTi+wzKtv8
	ZbC14kjjGYMiPcNhZykPPOzd31R4tsfMKGL4o+7w+pYcBVAS5WU6Qb26lkbeeUDsHyI=
X-Gm-Gg: ATEYQzxoxzZgCLzme+p1csMfW2aOYIZlum9Dl570saw17niIoQjPCrSa+APWWyaN4Tu
	8AxbW5sp6ci3+zcBmmbVhXhlDToIzUZlfMUrDlLO8wYa0oL1ryG3sr6iwpY6K/Ko2aWeo9trBks
	DFfFryvm1KiTVO3SR78rtSG62GXtuSEtdZxeWMTgDmj50G0Xr3Qp4X1+uMdJ3SA1BhOoSeVMXAE
	Le6AjdcglPUsR8aUxeC7ftU7Oro8O+pA/N0eK8PQauqJinyd1lRn4PgNfTar2vj0T7smJ9mXXmp
	nKeKr9+YRABH//oOlOY8xPn4KBzNLERZaWfZjzfHuzCl1qM0VjON+eJ0CE182bHv5gI4U64FPka
	4Lo6hiO+TOMANHhibVn3F15gn+WJof0RbR2mjOIaXmCg0DZPT+4daNuL50PuDURSnVAuDbnxxo6
	iAPe4NdnZWZYtfljvk3D7vt2Sme6N4
X-Received: by 2002:a05:620a:170f:b0:8c9:e989:9d97 with SMTP id af79cd13be357-8cdb5b56e2fmr1651069785a.68.1773674776906;
        Mon, 16 Mar 2026 08:26:16 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fddfe8sm1228675185a.12.2026.03.16.08.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:26:15 -0700 (PDT)
Message-ID: <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Francesco Dolcini <francesco@dolcini.it>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	benjamin.gaignard@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, 	conor+dt@kernel.org,
 p.zabel@pengutronix.de, sebastian.fricke@collabora.com, 
	shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com,
 devicetree@vger.kernel.org, 	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 regressions@lists.linux.dev
Date: Mon, 16 Mar 2026 11:25:53 -0400
In-Reply-To: <20260312173349.GA137045@francesco-nb>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
	 <20260312173349.GA137045@francesco-nb>
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
	protocol="application/pgp-signature"; boundary="=-6HvdHsM5JK0qWfzveRb3"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55941-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,xs4all.nl,collabora.com,pengutronix.de,linaro.org,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,pengutronix.de:email,ndufresne.ca:mid,ndufresne-ca.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,toradex.com:email]
X-Rspamd-Queue-Id: A1A8F29C8AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-6HvdHsM5JK0qWfzveRb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 mars 2026 =C3=A0 18:34 +0100, Francesco Dolcini a =C3=A9crit=C2=
=A0:
> Hello,
>=20
> On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com=C2=A0wrot=
e:
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > Fix a kernel panic when probing the driver as a module:
> >=20
> > =C2=A0 Unable to handle kernel paging request at virtual address
> > =C2=A0 ffffd9c18eb05000
> > =C2=A0 of_find_matching_node_and_match+0x5c/0x1a0
> > =C2=A0 hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> >=20
> > The imx8mq_vpu_shared_resources array is referenced by variant
> > structures through their shared_devices field. When built as a
> > module, __initconst causes this data to be freed after module
> > init, but it's later accessed during probe, causing a page fault.
> >=20
> > The imx8mq_vpu_shared_resources is referenced from non-init code,
> > so keeping __initconst or __initconst_or_module here is wrong.
> >=20
> > Drop the __initconst annotation and let it live in the normal .rodata
> > section.
> >=20
> > A bug of __initconst called from regular non-init probe code
> > leading to bugs during probe deferrals or during unbind-bind cycles.
> >=20
> > Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e6=
6@kernel.org/
> > Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> > Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia=
23b42rj3wlmpl67@rvkbuirx7kkp/
> > Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while deco=
ding H.264 and HEVC")
> > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com=
>
> > Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>=20
> What's the plan to merge this? It fixes a quite severe regression,
> a boot failure.

To be decided this week. The commit message does not say if it was released=
, or
came in RCs (and I didn't check myself yet). I'd say, if its the first one,=
 it
will go through next and backports, otherwise its is really tight to get th=
at
into the RC series, but serious enough. Please fill the gap if you have tim=
e,
and I'll handle it later, probably tomorrow.

Nicolas

--=-6HvdHsM5JK0qWfzveRb3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabghAgAKCRDZQZRRKWBy
9NFwAP9sVkqCaBiBRpXCvZHE5Oa05+dzKFdWC5+h1oxIeJJ4dQD/VD/qrH1k6wW/
L9bxPFGmfGPNVwVSrJM7fk/6BwpNMg0=
=TFXY
-----END PGP SIGNATURE-----

--=-6HvdHsM5JK0qWfzveRb3--

