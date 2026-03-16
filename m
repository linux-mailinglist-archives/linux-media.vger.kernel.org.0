Return-Path: <linux-media+bounces-55952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DKfFt0/uGnSawEAu9opvQ
	(envelope-from <linux-media+bounces-55952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:37:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0AA29E623
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2A20300D372
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7653016F1;
	Mon, 16 Mar 2026 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="CR2cezEc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307DB327BFC
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 17:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773682646; cv=none; b=JQkvLRyzFESN82ljXWUUGVMDUU5Se8Ud0SMaxLolRQ3ldOFp2LcG5ys90El9TqQCN75tj3F+ZMFz1Ul56K74ol2doaq0Q+SrDVMeZPWEa8HtYc3MkzlKeiljwdHWD4ysoyiHYOSe/jy1oAO6AYff1MxXm/KJM5STAlzX/8wyezI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773682646; c=relaxed/simple;
	bh=fYb6sHXn7pJsZ6vBGxZq8vNzfRcMGkZh4X8AJVjPgDk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OLcFBuJH+wNkNzK2vh3MtxuJe+6oTC9no6huFzvvRT9nwI49hxcgCuJiYczYiNJKy9xLbx+AFr4WdU3gVJgllwu4rHFvNLMqI3MJC8TGTX/Fbb8af0P/2r3iN0kk7hV99TGfN8s8RNGCTREuK6vhJVBJ9/U/oVt7FXXBL1CnawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=CR2cezEc; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-899fbf92bdbso63885406d6.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773682644; x=1774287444; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fYb6sHXn7pJsZ6vBGxZq8vNzfRcMGkZh4X8AJVjPgDk=;
        b=CR2cezEcc7IcJd+/kAnmtdi8ajWLY76td/NKOTgQmtOmJsPhojNULmfUVAh7KPMVo2
         uZb+t7uRls0npuPUFRwVUZMyIr2EAPD8bhOsOrMVplLtiYwrZgjlGH+5XrPpFJUvp5Vh
         AkCnkY75PKxBWYmQnAQq5M11MqtiFCEBNWs2+kDDH1znx75K9hH9YF1qPS3/hEqrgKQG
         Vj/IhL6YnL3iFeZiLxU/RWZdvxZWShdG8BK2ESQG2l95RKUEWb1hoTCPmo9zNjkinfuI
         wW+D8G8VMRojnx6bm/+iJ7FVdgJNYN/r3G/eSnTpmMJzzy0+y4fD+qEgMEaw0xkjkjIU
         hamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682644; x=1774287444;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYb6sHXn7pJsZ6vBGxZq8vNzfRcMGkZh4X8AJVjPgDk=;
        b=CTqH2WwXvf5EyHWk66UuSoNTDtTLDy5LV3p+kpXyRvqUJLE18kp/Z8ObHhptrcARtj
         W/9vJLk1325JKYSH90hdY9R/JMxCAsmMFViwaLhnw3oi+x/JaEGyWeuQYlQ+DeQqp7cR
         1s2pmfkM83gsAgdWhR/osi2104X0Y12p+9rraHOpdLF6ugQTntdT64mr9r/M3Jld2xfn
         3fQkc9PlnxNIISU8QDgpX57I1elnVFLYG/OmVqOF0xqiMfNMTJOryxH+3LAjwzR0o6N6
         aRDuGnmfs9HkFvonDteWsO1+ZIJ5mrXPMtmUyYq3j+fbGDh7/nMPerMztk+c1prS0Fz6
         rYjw==
X-Gm-Message-State: AOJu0YyrKHFWyHe4BsNur+cq4Y1UaBH8En72Qf/VPnf1uxchstkZ2m0q
	OkBHUqWj5VJ+vlmWLzWUktqTtgVUYtdxFBxVEIcRnAzk/Ua2JK9uJajw1ogPXTdlzrg=
X-Gm-Gg: ATEYQzxYf56RVMBSoflFO5GfnER2a19LlMuFS6tMDXEI0dDbMjy5jw9tH1cGgSot09G
	KLFJiNy3xcKWOSKMqmfEsV0+2VhV87aEuCADeJ4NY5ns0Dy9SI4KJotCy83URDcFFqDd50p00My
	jNNcgLHFdLq0AN3tAK2W5aIt/zuzjG2qe6sf8yeYirCajlTJIitovrOYBKSJzfQugmG2uE75S0P
	SWzu8CohjUZKT64vPv+XHPt1MppKGzfwuoRyY1d7Zbwz29FFk3/PM0ZQtPtfpdHWI8vaUJh5FYt
	9uQjMjXmVqXDu2KwuMla8C01LSVLYNjtR/EBOKyzkyrrhkcWc9UDBsY3otqldY+FjpBiVFO63wV
	tgZ9h2Gfrj586QCkFmyAoEs2FgikFJgU7mXqbbP9ovOSLqP+7418dxDiC7xc+PVs3nclQzNSklM
	dvv1gxceIJYzJ6CzZzA3ThPAW4Bjeu
X-Received: by 2002:a05:6214:3001:b0:89a:125f:37d9 with SMTP id 6a1803df08f44-89a81f60619mr201273256d6.50.1773682643931;
        Mon, 16 Mar 2026 10:37:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a6947c4b8sm121138966d6.20.2026.03.16.10.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:37:23 -0700 (PDT)
Message-ID: <69fea3d9214405996d2ecc50419e539e84f22a3a.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: iris: add new rate control type MBR for
 encoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,  Abhinav Kumar
 <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Mon, 16 Mar 2026 13:37:21 -0400
In-Reply-To: <7f165169-427b-4f5b-9bee-bb227be23d82@oss.qualcomm.com>
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
	 <20260213-b4-add_sc7280_mbr-v1-2-e8d95b4e4809@oss.qualcomm.com>
	 <84895cad-9f1a-4e51-8e43-faf30b4bdabb@oss.qualcomm.com>
	 <7f165169-427b-4f5b-9bee-bb227be23d82@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-dHCDRYTp/XOPcjihgPWz"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-55952-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DF0AA29E623
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-dHCDRYTp/XOPcjihgPWz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 16 mars 2026 =C3=A0 11:52 +0530, Sachin Kumar Garg a =C3=A9crit=C2=
=A0:
>=20
>=20
> On 2/13/2026 3:24 PM, Konrad Dybcio wrote:
> > On 2/13/26 7:04 AM, Sachin Kumar Garg wrote:
> > > Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control to Encoder.
> > > Encoder will choose appropriate quantization parameter and
> > > do the smart bit allocation to set the frame maximum bitrate
> > > level as per the Bitrate value configured.
> > > ---
> > > =C2=A0 drivers/media/platform/qcom/iris/iris_ctrls.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > =C2=A0 .../platform/qcom/iris/iris_hfi_gen1_defines.h=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0 .../media/platform/qcom/iris/iris_platform_gen1.c=C2=A0 |=C2=
=A0=C2=A0 9 +-
> > > =C2=A0 .../platform/qcom/iris/iris_platform_sc7280.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 202
> > > +++++++++++++++++++++
> >=20
> > Is this really only available on 7280?
> >=20
> > Konrad
>=20
> Yes Konrad, in this series we enable V4L2_MPEG_VIDEO_BITRATE_MODE_MBR=20
> only for SC7280 because currently, we have added the support only for=20
> low tier chipset. MBR rate control aims to improve the compression=20
> efficiency of encoder for static and low motion scenes for extremely low=
=20
> bitrate use-case.

Without a spec definition, which constrained the implementations toward
interoperability, this needs to be made vendor specific. That being said, e=
ven
as vendor specific control, I think it deserves more documentation for your
users.

Nicolas

--=-dHCDRYTp/XOPcjihgPWz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabg/0QAKCRDZQZRRKWBy
9F5hAQDkXsgY4OHgrg9Op2qeSXSgs3hkumaPyQN9NN/hrd3dZQD/ewAMalduGh3w
N8XNdHliFkPMAADO4AyWA5qKf0tqcws=
=xtn0
-----END PGP SIGNATURE-----

--=-dHCDRYTp/XOPcjihgPWz--

