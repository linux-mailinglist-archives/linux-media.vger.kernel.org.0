Return-Path: <linux-media+bounces-55955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMtBHA1FuGmLbAEAu9opvQ
	(envelope-from <linux-media+bounces-55955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:59:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE229EAEE
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D0293042248
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5EC33BBCC;
	Mon, 16 Mar 2026 17:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="xzRdNsBi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AD333B95A
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683958; cv=none; b=jvQTiJM/rv3+SUENfcgvPptHrY5LiV14RSf8Sy9XBxfpGCu49WtYsCuYWntNnDExaD6dxD0kXQCERln21ktwxfTfohFQHU3qRVKp5DH3nHTFx3Bdk+jw3MfqOzmhRI+s1TziP9k9aO74aOkBQeiWrWAlfsO+2yo8kKSBwr/5/nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683958; c=relaxed/simple;
	bh=y5avfKnjh41/JWQRZgxs/uL4wWWciPPQDolHRgDT7YE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lHO+vxqdSprC+j+zZn9WtW8Dp7f0p9kvZA+J21z2estcOPSm0qkTmjwE2JkCUzporpB6r+g/VX2hStC269befQV5wuftp9DP5ZhTQk8usheXJwRXkbww1rrNajGY3ilgqL9dOTDTuDzF1nvSW4LjO0sL6NK0G7PynBITBui5QQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=xzRdNsBi; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8cbb6d5f780so475000185a.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773683955; x=1774288755; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y5avfKnjh41/JWQRZgxs/uL4wWWciPPQDolHRgDT7YE=;
        b=xzRdNsBiFegG+d1BrpQ142gBqmVPVv+2cnSRyXjM06xenDt67P3eop9W4kDZBvYHSF
         TjmbpiVxD/OfH/WR3tahzJHmbNusqQu2Y/1SRhYgaZKghsn8XS8RBG//T0zK71PDcLhp
         rlLQH1emp0IJElc4wJWXKDcaCJlQQAMqjVUI7l5MgmXhz6CCYkC2E0cSG9c+gNS/S4PV
         IXYPv4B8zJOJyRFDXo6QEph5h7sSLHu1oui5erGfAU7XrWcR2svweMyPlWmZ0Yhs0C+X
         LZyfUV2oo8fvQHfVY0TA1+uRtnAimySl2JgrlhAz/V2CU/p2MDldlx7vW9kXrJnZ0JLh
         vdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773683955; x=1774288755;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5avfKnjh41/JWQRZgxs/uL4wWWciPPQDolHRgDT7YE=;
        b=jstmuUgB7ulGZ1NJpRfYo2i7vaPTyP+DzdWwHNVk6NPgTOPI6Zrsf83i5bl3/uq5dw
         TpFpBNd3s8xTOnDKrhnNqmuBgZYHWJfoZ1X5g6EEJsMMFBuybCgSCuLl+CBTSR+JfAzY
         wHvZfrVFZkH2WcQa1IipgrDuLH5p7be8CDSRSrmmcRPBok/0nylmiaLypexS38vvRanE
         k49fDMnt/hO485HuMXyanmH7TzOSiXPBh0PlCN8i1vuErIGUq/EraUYK3plvaJNRnPT5
         ldf9xAu5yhAziaLwesPLIJFpgFdC5oSMKP6bN3zyDz69KbNcSY9EWqxgCDkiVNIqq+4Y
         S8oA==
X-Forwarded-Encrypted: i=1; AJvYcCW+OMneeRVkDQpO20RSaDMkZoe99Y0qHcfb7GVGqBtdp9Tp+/3TpTiL3LQH5GCVzG01QpNCysuz8idCsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Eihmf6m5U1y1byN0XJTg4ogSnoUdUt4ycskAfiSBGQ5cCBdJ
	tUsroSBGGDBVNl62g17k6iVdz4MICyITPhkmJRso9hJRn68ypQhdRhlq5gIx2SRGAYZy7gSjDxB
	RnOtJfFIRUcqQ
X-Gm-Gg: ATEYQzwATtQk22Mnofoe864wGZ6XJG+daFcxFCbHkSwpX+FQ1uiFD85/ZgJTtlje3kL
	SQV6JUWqkDRutQPW89OB6vY1qszTx4liRpEF7w8wR2qOA1llUEK40WuQrzdySA+tj0zvnKY0NLt
	sVFfRmoEeJgE7rpNMHotQKlEh3r2Jdnll2w1N/K1bxq7uxjEWbuij+teGW6o1zKbWtBfdgyWYm8
	UmvR23bJlnrnGNXoCBmHlIDsynoea1f7pyL8sS52W57sPlzPienmgCJYiCxJThW/GT1pNIpX3W+
	enL7W8e0yaaAPjEmXS6lTCZTrqqUgvV6+ZWwoa+qYy8UDTQdH5jk5A3BfD/LatzBLHuVk2XZMoV
	w9fZ7pTYoSRYBLGBA4n5d68FvTFfmEngVscI+57xR7vDqsP1nGMgHmZXwZXMbOcHF7aG7Z+6dLH
	ENufhy6z9faNl1+ZhNoKjhFhVC3ISY
X-Received: by 2002:a05:620a:4713:b0:8cd:9aba:f5fb with SMTP id af79cd13be357-8cdb5aa56famr1781220785a.30.1773683954881;
        Mon, 16 Mar 2026 10:59:14 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda21484casm1257452685a.40.2026.03.16.10.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:59:14 -0700 (PDT)
Message-ID: <56de4e9b3478a576475e0d246904b20da417c69a.camel@ndufresne.ca>
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: ming.qian@oss.nxp.com, linux-media@vger.kernel.org, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com, robh@kernel.org,
 	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com,
 devicetree@vger.kernel.org, 	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 regressions@lists.linux.dev
Date: Mon, 16 Mar 2026 13:59:12 -0400
In-Reply-To: <20260316155727.GA43134@francesco-nb>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
	 <20260312173349.GA137045@francesco-nb>
	 <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
	 <20260316155727.GA43134@francesco-nb>
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
	protocol="application/pgp-signature"; boundary="=-hJdAk5mQN9OAKDcOs1p8"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55955-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[oss.nxp.com,vger.kernel.org,kernel.org,xs4all.nl,collabora.com,pengutronix.de,linaro.org,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,ndufresne-ca.20230601.gappssmtp.com:dkim,qualcomm.com:email,nxp.com:email,pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0AE229EAEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-hJdAk5mQN9OAKDcOs1p8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 16 mars 2026 =C3=A0 16:57 +0100, Francesco Dolcini a =C3=A9crit=C2=
=A0:
> On Mon, Mar 16, 2026 at 11:25:53AM -0400, Nicolas Dufresne wrote:
> > Le jeudi 12 mars 2026 =C3=A0 18:34 +0100, Francesco Dolcini a =C3=A9cri=
t=C2=A0:
> > > Hello,
> > >=20
> > > On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com=C2=A0=
wrote:
> > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > >=20
> > > > Fix a kernel panic when probing the driver as a module:
> > > >=20
> > > > =C2=A0 Unable to handle kernel paging request at virtual address
> > > > =C2=A0 ffffd9c18eb05000
> > > > =C2=A0 of_find_matching_node_and_match+0x5c/0x1a0
> > > > =C2=A0 hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> > > >=20
> > > > The imx8mq_vpu_shared_resources array is referenced by variant
> > > > structures through their shared_devices field. When built as a
> > > > module, __initconst causes this data to be freed after module
> > > > init, but it's later accessed during probe, causing a page fault.
> > > >=20
> > > > The imx8mq_vpu_shared_resources is referenced from non-init code,
> > > > so keeping __initconst or __initconst_or_module here is wrong.
> > > >=20
> > > > Drop the __initconst annotation and let it live in the normal .roda=
ta
> > > > section.
> > > >=20
> > > > A bug of __initconst called from regular non-init probe code
> > > > leading to bugs during probe deferrals or during unbind-bind cycles=
.
> > > >=20
> > > > Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.=
com>
> > > > Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc4=
41e66@kernel.org/
> > > > Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > > Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so=
62ia23b42rj3wlmpl67@rvkbuirx7kkp/
> > > > Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while =
decoding H.264 and HEVC")
> > > > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm=
.com>
> > > > Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > >=20
> > > What's the plan to merge this? It fixes a quite severe regression,
> > > a boot failure.
> >=20
> > To be decided this week. The commit message does not say if it was rele=
ased, or
> > came in RCs (and I didn't check myself yet). I'd say, if its the first =
one, it
> > will go through next and backports, otherwise its is really tight to ge=
t that
> > into the RC series, but serious enough. Please fill the gap if you have=
 time,
> > and I'll handle it later, probably tomorrow.
>=20
> This fixes commit e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error
> while decoding H.264 and HEVC"), that was merged in 7.0-rc1.
>=20
> As of now, because of that, 7.0-rc is not booting on affected platforms
> (i.MX8MP), to me this needs to get merged before 7.0 is released.

Thanks for the info (thanks Thorsten too, pointing out it got picked for
backport into 6.19). This saves me a bit of time, I was away all week last =
week.

So this will be picked for RC, I should have it sent to Mauro by tomorrow.

regards,
Nicolas

--=-hJdAk5mQN9OAKDcOs1p8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabhE8AAKCRDZQZRRKWBy
9AjoAQC6Fq8nqFrDJHKmYMEmzqQfCe3plFtnxVAGHFpFY/s7owD/TGsDX0oH8gNo
OmK1Jt0VdfCP+LlxOL41kFaZW/vHqQU=
=61za
-----END PGP SIGNATURE-----

--=-hJdAk5mQN9OAKDcOs1p8--

