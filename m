Return-Path: <linux-media+bounces-67576-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kxUoBCBPVmrQ3AAAu9opvQ
	(envelope-from <linux-media+bounces-67576-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 17:00:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 255F57562FD
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 17:00:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=jC5SAS1P;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67576-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67576-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 562A03035B6C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2248B480325;
	Tue, 14 Jul 2026 14:55:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B8B48123B
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 14:55:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040905; cv=none; b=GC3kLS97/uxDagXdeeVGnPRcNSFr2+W/YKFGbK1YHSMqFVJy6raUTZPdpE9A9XZepU6p4O18ey/ZXSUuc1rfXsjOy0+XUQdmcb3Comg/IVzZy9ldHDS5G23MWlrktrIIXXFokvjnlhwAVYkz4XFtG29iAhkak9Rlc7nTpW3zODA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040905; c=relaxed/simple;
	bh=k83a3OVYpdq0z9t5DX2/SnPMtp87t5xpuZAXdVCLjVg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kBic6viaNjeDk0o1nWJvOpYjIeHZzLkCPZjcOLsP/uQJDlw8ro5GLSKWtooOb+3iTH4dkqWOCjo380+3fsns88l1N01G449rJpEyVlU5j1+ZGvVq/btIZIR4iVNcxe/b46ZHMkmAj1NS3sAjVRpPE6scBIryW+/ab8LPtcfkbAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=jC5SAS1P; arc=none smtp.client-ip=209.85.219.43
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so37770566d6.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 07:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784040903; x=1784645703; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k83a3OVYpdq0z9t5DX2/SnPMtp87t5xpuZAXdVCLjVg=;
        b=jC5SAS1PKSsxWbgU+UjbR4VKNHTWjLN1UGjUVzY84hkww9KyosWcxJzFaBNsalJdvw
         NbzJ3dgdNNUkdlShSOCciYIzdhSZaT5X6Nnk/ek+q7tSvNb6RKR3dseQR/2oNeIW1SKM
         ZHSHXbbsPIl2swFE/RXjo23LENmadbQHWjisiOg7mdM1bKMLNTw6L+5B3LTdcfvwcLKS
         nTLiaAWd952B8pHBxlCPWkTu3TqHOw36GHatcR9Ky/s+h/HaQlY0FnUc2NURYMHn0Psh
         WfnluqFIflKGD/7W2jMPwff//skd37xSJnhLpEwvUFn+M4ykU4vSdMM/KvuglZMU2bKX
         BPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040903; x=1784645703;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k83a3OVYpdq0z9t5DX2/SnPMtp87t5xpuZAXdVCLjVg=;
        b=Mgu/uGjEddgFcFSzDSxFbtUS5puV1ASsxSru/NZyg5z4YbxMH/nn0R/94cenQltkLW
         RfAAbsCh0+Z6UK+6kkta5hpa8v6UOrGyhA6uVl2PDTIr9Q+0kLxOxxHMN/rQytXrCBpP
         O8IQabrk/NGzhMcDpj2NDh/lKVLQvMhqlDYXF5Y9uUtd4nanRFFr0jAUnHP4ZoGWwyGC
         DDRt2IRhLtOu3ve57EdsIIg1tBCnsdYtUxujjmZ/VYk5nql1tkwIxuuuoSz25EpxW3Fu
         8sdmRahx34xjv8f+ZGNMGdLlWigHbozBjZq0FA6VEY/KZyaGQzqwoodJAruZU2v2ugo4
         zhsA==
X-Forwarded-Encrypted: i=1; AHgh+Rqj6bjoiq9DMurhoq/OnlePHPOsFlP6Ih+akqArxxuDdw/PlRO29jh3w4wBVbGZmi74njMjjVUvJTzbEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOqmLljQmg4N37NXePlnKO5GyXoJaDL1qBaP4DEcm4XXIu2Gh0
	eNmgJqus2CGsHBs3YgtY7tBDAJ7NjjHJfRmyGinrYgvz4JUpD0dj+opnf82VMyDaACw=
X-Gm-Gg: AfdE7cnDVzLB1wOUTuhxQaulU3SwuZr3eZAplCAX9rT814FOv50YHZmdG7Tpwn9AWW8
	PngAyZELZhlZzjqmyXJjxyaC15fJDJE/P1OdxaJezCDc+9iXCT5RxvtO3sxNHw8e1hPr8+OuhgP
	Vep/3rrwGOb2k852GtEy/s1/tnP4S9u+v9qL0Fl92bsfAMdFl9P8Z3WKpQK5+U7F9d760lpbFcJ
	dDx+8XrOklDnBc2Z1v+6N4MQ0hh2WWNjNPgAmnP+FYbGN4brECdVF1maSu2O7Bbnpn1TjiqdbU6
	HgocKNNHqDFfcWqNednUgezUq+bu5jB7XGPOnHx55/2nTdDnejBwj9oGfgi4Q3YMF2Nl/XLEpEJ
	p4kAh7lRNnrC6A49qqnmfZ44m8njaeQ9ZMU2PcClpxwoYkfpX9xGIRmDXSankWJCKjI5BX3xjRw
	nMS3wCMbzy5It24nY+1A==
X-Received: by 2002:a05:620a:4104:b0:915:f27f:e70e with SMTP id af79cd13be357-92ef2b534dfmr1387598085a.23.1784040903030;
        Tue, 14 Jul 2026 07:55:03 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b4b1bbsm1510584885a.2.2026.07.14.07.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:55:02 -0700 (PDT)
Message-ID: <619056acd2d8493315e8ca1055d4ce0068e3e95f.camel@ndufresne.ca>
Subject: Re: [RFC] media: Question about reserving V4L2 UAPI control IDs for
 out-of-tree rgb133 kernel driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Przemek Gajos <przemek.gajos@datapath.co.uk>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org
Date: Tue, 14 Jul 2026 10:55:00 -0400
In-Reply-To: <fb3f8857.AVEAAKBfiogAAAAAAAAAA-L_6E0AAYDONroAAAAAABudwwBqVkiC@mailjet.com>
References: 
	<fb3f8857.AVEAAKBfiogAAAAAAAAAA-L_6E0AAYDONroAAAAAABudwwBqVkiC@mailjet.com>
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
	protocol="application/pgp-signature"; boundary="=-TrpDy+PfQmV2+fjPvLHW"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-67576-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:przemek.gajos@datapath.co.uk,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ndufresne.ca:from_mime,ndufresne.ca:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,datapath.co.uk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 255F57562FD


--=-TrpDy+PfQmV2+fjPvLHW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 14 juillet 2026 =C3=A0 15:32 +0100, Przemek Gajos a =C3=A9crit=C2=
=A0:
> Hello,
>=20
> I maintain the rgb133 V4L2 kernel driver, which is currently out of tree.
>=20
> The driver historically uses V4L2_CID_PRIVATE_BASE (0x08000000) as the ba=
se
> for its private controls. With the modern V4L2 control framework this is =
now
> rejected, e.g. v4l2_ctrl_new() fails to create such controls under my 7.0=
-
> based kernel.

I could not find specific changes between 6.19 and 7.0 that would explain t=
his
failure. Perhaps you could share a bit more details on what you are doing, =
and
how it fails ? Are you using v4l2_ctrl_new_custom() ?

>=20
> I would like to ask whether the media maintainers would accept a request =
to
> reserve a dedicated block of custom control IDs in the V4L2 UAPI header
> (include/uapi/linux/v4l2-controls.h) for our driver?
> On initial research, I have not found any information about restricting i=
t for
> out of tree drivers.
>=20
> If this is acceptable in principle, I can prepare a patch for review.

Up-streaming is the path forward.

Nicolas

>=20
> Thank you,
> Przemyslaw Gajos
> Technical Lead - Embedded
> Datapath Ltd
> przemek.gajos@datapath.co.uk

--=-TrpDy+PfQmV2+fjPvLHW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalZNxAAKCRDZQZRRKWBy
9LQmAPoDjl12KNAo+K6sqBSF2ngi31cvO508L4MJC42JH9UVFAD/aP9mlsPdMLp3
MLQ12cpwPmClwluTkZkQtFMbEjUMUgI=
=AruM
-----END PGP SIGNATURE-----

--=-TrpDy+PfQmV2+fjPvLHW--

