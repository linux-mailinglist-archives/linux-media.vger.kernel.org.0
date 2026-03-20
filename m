Return-Path: <linux-media+bounces-56527-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAqJF+ZHvWlr8gIAu9opvQ
	(envelope-from <linux-media+bounces-56527-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:13:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C62DAC5F
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44119313CD7C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D073B8BD5;
	Fri, 20 Mar 2026 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NYXT4OKD"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924443A4F35;
	Fri, 20 Mar 2026 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012226; cv=none; b=kVpryiflam+8YRT3ohYggFLDSn6y2cu22F7+lI2vBaF6H1P7HG0Cqo1Bk0MGrkThTR7XTICfxju6Tx6ZE5BJAyhg4oY+Iw6DTHgUEZ+nCsiRdnxy+sw2O9+ol5kZsDqqWtO/TDpGfwh/ZEMNw1XaLcuJHJmmiPSr5IiHarYeLsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012226; c=relaxed/simple;
	bh=ifATUcW7DWuBHecdArq6aT4AJccdVJ7KXJNjJs6AB/M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tJg3FCUJm8oHA5aiY9KVW/jYaB7E+EpViQdUCbd7rmekVG7a+k/oaIJtu8YV25JoFNaPUOUuvwwGugidKucYXAOuHLhj0yoG7ffas6MWb1/JIMOJNbFhJ4NU+VmYSlQf8PuiTnvLb/0GR18Yb0xqSJqC/5qiqwkRbb3ksk/S2bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NYXT4OKD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774012223;
	bh=ifATUcW7DWuBHecdArq6aT4AJccdVJ7KXJNjJs6AB/M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NYXT4OKDxR71XnYfyMTBSqcjqtlVrKQU/gxxxeVDFU/pOAT797efWm2A3UmvCHbyy
	 oitbB5r1aRUey51OdrvwfhhGIoNgB/QaOT5ThKHY/Bo1aXjkUePb0PpnO0RZHqWFa8
	 j5krSyz9N0rogyqUsguBnwFLHi+1ZnuDoplaxAtCNs8+M+01G+7ULGMcEmJhycoaur
	 Nsh/Vr34voZFlJjpl7UmlU70cDJMOq6/X8Al1VNQ24k0glZCTcn5Y+tJarMf0PmHlf
	 UOG/NXTAZQH721kEtgRWZXk8Hv3xdRzYWhxrk0pH7Eoix3f5WGxaYS1gnbS4Koihsx
	 DNbAQyW+8Mn0Q==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38B0117E0280;
	Fri, 20 Mar 2026 14:10:20 +0100 (CET)
Message-ID: <38e0241fe56f9d3af2de57b6380368fdcf5acc64.camel@collabora.com>
Subject: Re: [PATCH v8 0/9] Enable video decoder & encoder for MT8189
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Irui Wang <irui.wang@mediatek.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz	
 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>, Tiffany
 Lin	 <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>, George Sun <george.sun@mediatek.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel	
 <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Fri, 20 Mar 2026 09:10:17 -0400
In-Reply-To: <20260320055940.15961-1-kyrie.wu@mediatek.com>
References: <20260320055940.15961-1-kyrie.wu@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-67RujEEiCsWXeIp1gjT6"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,mediatek.com,kernel.org,collabora.com,xs4all.nl,chromium.org,arndb.de,vger.kernel.org,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56527-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C48C62DAC5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-67RujEEiCsWXeIp1gjT6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kyrie, Yunfei, Irui,

Le vendredi 20 mars 2026 =C3=A0 13:59 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
>=20
[...]
> This series patches dependent on:
> [1]
> https://patchwork.linuxtv.org/project/linux-media/patch/20260211054149.27=
249-2-yunfei.dong@mediatek.com/
> [2]
> https://patchwork.linuxtv.org/project/linux-media/patch/20260302035244.89=
94-2-irui.wang@mediatek.com/

While this one is now ready, it still can't be merge, because the other ser=
ies
it depends one have not been updated to use the pdata properly. In fact, it=
s
quite likely that some of the patches in this serie must be moved up the ch=
ain.
This type of linked submission is making my life extremely difficult, and c=
auses
massive delays.

Basically, in a chain of 3 series (and probably 4 since the first one does =
not
apply), the refactoring that causes all the series to not be accepted is
happening in the third one. Angelo and I have been clear for weeks, if you =
need
a constant value for a platform, it goes in the platform data. Don't do swi=
tch
of strcmp at runtime, these are constants and we already did string matchin=
g to
in the probe to find this pdata. Once the missing data is added, simply mak=
e a
final patch adding the pdata structure for the platform. Use this v8 of the
MT8189 support as reference, it is as I said ready, but it does not apply d=
ue to
broken dependencies.

I can't easily fix this, so please work together, synchronize your submissi=
ons
so that we can get the MT8196 and MT8189 support finally merged.

regards,
Nicolas

--=-67RujEEiCsWXeIp1gjT6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab1HOQAKCRDZQZRRKWBy
9FzIAP4oohtwocrtFhnn2WfKDHxvJ5uVcuOyFDF7hFnej0jx7wEAy97yTrE8Oj2B
qJZbPwpS2fk4KcvWecW4UPbX07ZLIAE=
=sleb
-----END PGP SIGNATURE-----

--=-67RujEEiCsWXeIp1gjT6--

