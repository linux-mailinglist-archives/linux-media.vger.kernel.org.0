Return-Path: <linux-media+bounces-64250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VaiPLP8kJ2pjsgIAu9opvQ
	(envelope-from <linux-media+bounces-64250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 22:24:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 098E065A694
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 22:24:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=xzzdQXmw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64250-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64250-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B24CF30780CF
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 20:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679C5395ACC;
	Mon,  8 Jun 2026 20:22:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30436D512
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 20:22:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780950165; cv=none; b=hYU3gHP1JOFGVS1b+d/TYtADU1ZlVIh3P8QAb89gW+D0peJBv5JgcIb7IVLTZ6GJSJ1FNwNGMH2+G2ic9jI+FAAxpgQxWWdhw4Od5tzCLtsbOrKDH89Od3bYI0Z/mC9WHAeWHFQ+EhU0+FnOc+6NfbtMpUFP3qGhGNfLXklmTMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780950165; c=relaxed/simple;
	bh=vQEEMft7f0pvYlAEq6RrP5hBFk6klhTFUMQXwCgeb60=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fO1Yn4m8D4RWfTZnhRzqGunPz0fzwmeU/plSDS3hdnxeXPkzF7Xaw501M6Prw1RCGVuAyL8KovcEHoUFZ2BvY7RgC8puYyaboVfGpvZpeT0aes81TMFR8Pazzo/UtmfzqVp4XeK/YRcEQWKeR9NZ+ZvMjl9JeMsrJB6hMgF6szc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=xzzdQXmw; arc=none smtp.client-ip=209.85.219.54
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ce3876a50cso48990846d6.0
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1780950164; x=1781554964; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vQEEMft7f0pvYlAEq6RrP5hBFk6klhTFUMQXwCgeb60=;
        b=xzzdQXmweWPr4CsDg0bP1U+RvFsoBJAOkKcjudJzlXLPZ1R3NZ0wddK/Nvh6OQpFCr
         +hnZG2Z2yoPE3gPsUcuJ07oYAJo6nowbtDFqakMk5dHpWmBonES5d2yE2aD+cp+4WZtQ
         gbJI9KbEFFqqIhWNmbaLNZfCXZOWab3p/cg6QubS6tHYo+S0uHDigReOxpU8B+U3p3wy
         XWiHH1xfcW19nCDLBX3A56/RXR67oc/p3LIJNs8gtXBAx3ccpnzPhp9G2IG97SB45ekT
         9n1cmgb8+H2V7ZMLL07WC194XnTA80uMA85K48F8T7jPrE02m7yRoMVAVNRs/fBYJoPB
         75eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780950164; x=1781554964;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQEEMft7f0pvYlAEq6RrP5hBFk6klhTFUMQXwCgeb60=;
        b=ivvRxMKCnx/rdvtyUuMF3J9Bq4P2GJL8FQkXOiQ5wxbTiPGiNMpMUknZN/TF4w8ZXq
         6Mx7oTseR1WFRcHsgqyRfT2rbxBKaJWt91ORfBpMOdcDCwkTcy3RL8aHSKgIdWMf8TRq
         zwKtoUrkzf85hnXiyzcUiB+z07lWQVS8UgvTP0Yxi8C113+Urv3aHzSlHvpAoxtZVnmm
         2Jeuq/oNyDLfktfX6lqh5Q2FidYYgjoq+HXkiUWd0lVGbde+qtJlWnKOfrtIgaiWrfxI
         40k/iX6rtByMs6BAhCN7+xa1rRzPEr8/JcBGKAOm0t1Kvd+LKPNO5o32O07VQFlrC9xt
         6DRw==
X-Forwarded-Encrypted: i=1; AFNElJ/SNpkBFMO3SrYe+SIPlog05iq/Ed5jXNSddax6u+ZBistfgikHBrUCNz0ZsCXmWPSddSJ8Wfbezsswlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN3XBBKVaU9/X5oG5mgURLoFAu5IMkq/qqqCZKnwKCWcVDZdUS
	8eYjhhmF3PiM9sJJlysspOTnik6btHm+Artd0hPvTGVSA1hVsW9eSAATQvT4a8BW3uU=
X-Gm-Gg: Acq92OFaeXLbyJwe4XxS2UiXZPyKEDp1ORuAgZxObD6rv9pxyzN/5I5+X0RRAkwrBHc
	oZg3CYWk4DQ+tgqwYbSTFpPhdae69bKjYR5w+oWxP5r6xiIsQIgMNRpKhJgS8ajBPnFJ9Uhb2lD
	CcKwn7IiyMcccOPlBvnTAFxvj9JhYwD16u6b7zmuQjlPBqvsRjX5SN6HvKyZzO9wLWjfqD67SSW
	sh0vpdDuw/9e11cxxatxwhtcaJL41gvLFz08Ovl5ras6T0d1aahboguAo5Uq2tUfe85ifDujaGC
	k308iYNudX4ePV+6IHDOSza7pat8cC417VhF7AjEluMUjJyR889PYv0TdKD6/Sgr5vj/gQ48Sgd
	7WCCPpc1eFCwsx/9EYZNeuBOvfgzelwaNwWjcMcpOYno8Ti7RqSPMJ27GvRHj0H90VC/vyXc0fj
	fdDYtIkaSTvceGzhWnLlkHrlyfkP5L51rKKjhXjIuza8ztUeugx/UPoaA6R+26sx1QafIIsvAzS
	lRC1wc=
X-Received: by 2002:a0c:f147:0:20b0:8ac:8938:ee55 with SMTP id 6a1803df08f44-8cee5fe0585mr223459246d6.11.1780950163732;
        Mon, 08 Jun 2026 13:22:43 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0521f2sm177874226d6.31.2026.06.08.13.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:22:42 -0700 (PDT)
Message-ID: <25a232dca0236788c75231c43ee8a01741148c37.camel@ndufresne.ca>
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal
 de-blocking edges y=4 and y=12
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Simon Wright <simon@symple.nz>, Detlev Casanova
	 <detlev.casanova@collabora.com>, linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Date: Mon, 08 Jun 2026 16:22:41 -0400
In-Reply-To: <66768711-6943-43f5-95fa-3d97dc638844@symple.nz>
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
	 <5797ac61-dc61-4182-ac60-cc377564ff90@collabora.com>
	 <2565c949-a558-415f-8c79-e47812db8341@symple.nz>
	 <e3b93bda-fed8-4f21-b3d8-cdf28bfaba1c@collabora.com>
	 <4358f22d-247c-43d3-89d4-27b57bbe90aa@symple.nz>
	 <66768711-6943-43f5-95fa-3d97dc638844@symple.nz>
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
	protocol="application/pgp-signature"; boundary="=-CvLQQKJzZSf22y9CSCbT"
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-64250-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:simon@symple.nz,m:detlev.casanova@collabora.com,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ndufresne.ca:mid,ndufresne.ca:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 098E065A694


--=-CvLQQKJzZSf22y9CSCbT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

Le lundi 08 juin 2026 =C3=A0 17:11 +1200, Simon Wright a =C3=A9crit=C2=A0:
> It's an un-primed hardware state after power-up, not BL31 and not a
> per-frame register. The Rockchip BSP runs a one-shot priming decode at
> every decoder power-on -- rk3576_workaround_run() in
> drivers/video/rockchip/mpp/hack/mpp_hack_rk3576.c builds a tiny
> self-contained H.264 task and runs it through the decoder at probe and
> on every pm_runtime resume. Mainline rkvdec has no equivalent, so the
> first decode(s) after each power-up run with indeterminate internal
> deblock state.

another one, in the link, it says you have compared SRAM vs DRAM for RCB, t=
o
rule out the location of the RCB data as a problem. You haven't dumped the =
RCB
data before and after in a way that the state of the RCB data could not be
compared against Detlev (working) case. It if was an RCB data state, it way
simpler to just initialize it.

Nicolas

--=-CvLQQKJzZSf22y9CSCbT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaickkQAKCRDZQZRRKWBy
9EtkAP9weWAy5NLYKRn7EY1Ggsgr5cAq1cssShILvEtBU4INagD/bFytns+fyCZU
R4jXlzRX20D2NO/HyrfvKhg0fyGMVwE=
=XYhp
-----END PGP SIGNATURE-----

--=-CvLQQKJzZSf22y9CSCbT--

