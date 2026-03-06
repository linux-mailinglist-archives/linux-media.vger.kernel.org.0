Return-Path: <linux-media+bounces-54814-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGlKMJT9qmkIZQEAu9opvQ
	(envelope-from <linux-media+bounces-54814-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:15:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30554224A6C
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 230603081B2F
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 16:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CD63EBF2C;
	Fri,  6 Mar 2026 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="0MUkHfXC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6FF3ED11C
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813634; cv=none; b=tZMNFa+1h3EHdGGiWxHMxU7ZKA0ls9FBg+OOsM6qPXVHXVAOJ2La+dxPQQvJx9pY1KBGo2+YDJOPU44rLUN7wyWkxMlaklzKLoJ+nLI7jj/2i135lbQGVofjkVwuRbgT1SBtbnE+sQYu8YIMp1IYFg+SGjsHWNRRKFMeDgNPQqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813634; c=relaxed/simple;
	bh=OUSir8S/zhK7ivuDE0CcUsce8AzOWObUyer1c+B3St4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GXoD7KvWZ9EpJCShRZu6NesIzc7P8LnWsB3+q1Ye9ObG/rDXjc+vSgG1NdzrrStVBlJGzsjxxk/HYF+vO4QSfMrfa/92J1FHba8xheuJcJvPPFcBuNjQOlcLHc8k31EjEWKRaTdTpkz/XT1cEvpr5OjwIZv0g/BsLfa5ENBGzbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=0MUkHfXC; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50697d6a69cso47977551cf.2
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 08:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1772813631; x=1773418431; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OUSir8S/zhK7ivuDE0CcUsce8AzOWObUyer1c+B3St4=;
        b=0MUkHfXC+024RoD5WhlFPGQ2MjTKZf/H7EIqSEBvx0o8gpNY1Uy8OPDyqY1AnUFiNm
         Sh3v4K/Crmpn606JN/U+vtVKQKTFQZOE2MpRpKExG9s+NgkkLwLO4bvSs1ll26Ddo+/l
         OrP6/L2m3JJsJb2bnAp32p1R2vhWdV36/eX1D3dHz+1MhsOhCj1beYbi3szXtmmtnpe/
         sD1W3U/vA/6ZeSzvbSPJPK6nS6S9S+tW1pglyq/amy7IK5V0ut5p1geNGCUiZSEXd4eQ
         xeOZBYjBPQfpgjBTunhuiy0LDPk/P0bkbYmJbzw3Z7+hxpOTw9Vw0jIX6xoqR/f725zv
         wFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772813632; x=1773418432;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUSir8S/zhK7ivuDE0CcUsce8AzOWObUyer1c+B3St4=;
        b=nXq/b7BPBDdlyM4u9HCJ599VxkSMNDOLl9XOpbw1xuRQVFDF8N2Xo8rdG45mgvta63
         8eCBrgfGV8wfxWIKxshKfORZSXj7oMpZzWuQVHPXwruOf3pCPZu29ZLO1HaDcPhwIc4t
         DWdmtMsrpJyYk+UI+Y59zbfUH6qzLrOPA2Ei3AjNjZgg2Yg1Q8DwDEqcz2sFIFCv4CQQ
         gAfwfy1+MbyzEpCvQiO90DURXy0Gyo9vasTSzJXCC404bOa67RzuDe8P7II2Qp+zVq8p
         CvHcQMpRR6ykzWeALgTd5h9xlgzguN23w1ZXieI3JsDQIfj7zjmpA/wXKV/myGZeH8Hw
         3KRw==
X-Forwarded-Encrypted: i=1; AJvYcCVRarRMJjZfa6sNWtxYQELxdv8ztt3Z1XAD+tqObOuxyMX7kGoq91udjLLmNTdEtbKulGZL7taTBacjZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaG8Ok7LXZ4+1/T9AJ2OIsw5MOxG7nnwKTOzsz+npsVa7TmMjh
	rzMCp9YrLaeCXHGfxKxJigLSgGBEsicPw71seLmNvkQF3QTKiSOLVZHuDKHWBGX7B/Y=
X-Gm-Gg: ATEYQzyKNRHFlazwDeBmyttC3/yzBKrk7RyRqbFDEbhs9hMJvjtYh3nQEwKaulbV+Hs
	7or84JXhpf+BVS83d4H3PeMVUyDnxj2ODzZcx7y+NtIbhViiFzb1EHBcdFOcKjdrTTsQqnmbIar
	bJH2Uh4WZSf+0Zqddb8y29BGYc8RYkP+i/TPXZ9dwFV4aCKUNyoFOA5N8Cvc/qfQfwowqD2DTwH
	I7Qkyql8LaZkt3vkU1uPoMfulDineQzwsHljqOJMlfWFap3Lhn95weN+sjajCj+e9BRpgQk310+
	TopYWuf9S51vBHdod8cgKhlyjXebaHa7DBuyXB/1Eb+DtHlj4HCvYCTvLWTaKLN6IIw5WmSfBhI
	L25au/UTbA0bFwLQ6dvJU0VRL5aFfi34KBWasW9OomwiWlwFaxjamdFoFks6sZsEqsWUri9B4n/
	5NaQg5oXJB/fAaE1v0vtpeDL+Tql5Y
X-Received: by 2002:ac8:5d48:0:b0:506:a624:1939 with SMTP id d75a77b69052e-508f4969e31mr30903851cf.51.1772813631526;
        Fri, 06 Mar 2026 08:13:51 -0800 (PST)
Received: from ?IPv6:2606:6d00:15:210e::5ac? ([2606:6d00:15:210e::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a3140d77bsm14381336d6.5.2026.03.06.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:13:50 -0800 (PST)
Message-ID: <76fe124bc112126324d7ed05188518cef7223609.camel@ndufresne.ca>
Subject: Re: [syzbot] Monthly media report (Mar 2026)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: syzbot <syzbot+list844890cacd1fd70d3d36@syzkaller.appspotmail.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Date: Fri, 06 Mar 2026 11:13:48 -0500
In-Reply-To: <69a696be.050a0220.21ae90.0009.GAE@google.com>
References: <69a696be.050a0220.21ae90.0009.GAE@google.com>
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
	protocol="application/pgp-signature"; boundary="=-S5LKW6m1KmTHW8rPZQPS"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 30554224A6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-54814-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-media,list844890cacd1fd70d3d36];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,goo.gl:url,syzkaller.appspot.com:url]
X-Rspamd-Action: no action


--=-S5LKW6m1KmTHW8rPZQPS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 03 mars 2026 =C3=A0 00:07 -0800, syzbot a =C3=A9crit=C2=A0:
> Hello media maintainers/developers,
>=20
> This is a 31-day syzbot report for the media subsystem.
> All related reports/information can be found at:
> https://syzkaller.appspot.com/upstream/s/media
>=20
> During the period, 8 new issues were detected and 1 were fixed.
> In total, 32 issues are still open and 103 have already been fixed.
>=20
> Some of the still happening issues:
>=20
> Ref=C2=A0 Crashes Repro Title
> <1>=C2=A0 2684=C2=A0=C2=A0=C2=A0 Yes=C2=A0=C2=A0 KASAN: slab-use-after-fr=
ee Read in dvb_device_open
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://syzkaller.appspot.com/bug?exti=
d=3D1eb177ecc3943b883f0a
> <2>=C2=A0 451=C2=A0=C2=A0=C2=A0=C2=A0 Yes=C2=A0=C2=A0 KASAN: slab-use-aft=
er-free Read in em28xx_release_resources
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://syzkaller.appspot.com/bug?exti=
d=3D16062f26c6480975e5ed
> <3>=C2=A0 340=C2=A0=C2=A0=C2=A0=C2=A0 Yes=C2=A0=C2=A0 KMSAN: uninit-value=
 in dvbdmx_release_ts_feed
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://syzkaller.appspot.com/bug?exti=
d=3D01d4620886bee3db0e74
> <4>=C2=A0 137=C2=A0=C2=A0=C2=A0=C2=A0 No=C2=A0=C2=A0=C2=A0 KASAN: vmalloc=
-out-of-bounds Write in tpg_fill_plane_buffer (4)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://syzkaller.appspot.com/bug?exti=
d=3Ddac8f5eaa46837e97b89

I'm quite new to this initiative, but I work with a few other initiative in
other project. What is the process for relevant maintainer to gain access t=
o the
reproducing code ? Specifically this issue has been looked at by Hans, but =
he
never figured out what the robot found and could reproduce.

With ZDI and other initiative, we have private back channel, and they provi=
de C
code so we can go straight into fixing and validating.

cheers,
Nicolas

> <5>=C2=A0 124=C2=A0=C2=A0=C2=A0=C2=A0 Yes=C2=A0=C2=A0 general protection =
fault in dvb_usbv2_generic_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://syzkaller.appspot.com/bug?exti=
d=3Df9f5333782a854509322
> <6>=C2=A0 120=C2=A0=C2=A0=C2=A0=C2=A0 No=C2=A0=C2=A0=C2=A0 KASAN: slab-us=
e-after-free Write in as102_release (2)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://syzkaller.appspot.com/bug?exti=
d=3D47321e8fd5a4c84088db
> <7>=C2=A0 111=C2=A0=C2=A0=C2=A0=C2=A0 Yes=C2=A0=C2=A0 general protection =
fault in vidtv_psi_desc_assign
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://syzkaller.appspot.com/bug?exti=
d=3D1f5bcc7c919ec578777a
> <8>=C2=A0 34=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 No=C2=A0=C2=A0=C2=A0 general p=
rotection fault in vidtv_psi_ts_psi_write_into
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://syzkaller.appspot.com/bug?exti=
d=3D814c351d094f4f1a1b86
> <9>=C2=A0 11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Yes=C2=A0=C2=A0 BUG: corrupted=
 list in az6007_i2c_xfer
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://syzkaller.appspot.com/bug?exti=
d=3D0192952caa411a3be209
> <10> 4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Yes=C2=A0=C2=A0 KASAN: slab-us=
e-after-free Read in v4l2_release (2)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://syzkaller.appspot.com/bug?exti=
d=3Da658d41cf8564471775e
>=20
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ=C2=A0for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>=20
> To disable reminders for individual bugs, reply with the following comman=
d:
> #syz set <Ref> no-reminders
>=20
> To change bug's subsystems, reply with:
> #syz set <Ref> subsystems: new-subsystem
>=20
> You may send multiple commands in a single email message.

--=-S5LKW6m1KmTHW8rPZQPS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaar9PQAKCRDZQZRRKWBy
9PdGAQD1IDHHTZefY4q4rzQZHJFkuEwhIjdvVXWJSiUKTVC7UAEAxnrnJq+FEHYp
RINcJgRyWDt5g0p7FSJiasp86IoPdwQ=
=iQEk
-----END PGP SIGNATURE-----

--=-S5LKW6m1KmTHW8rPZQPS--

