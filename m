Return-Path: <linux-media+bounces-39584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8DB22740
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 14:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3B7D16A117
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 12:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E087822DA08;
	Tue, 12 Aug 2025 12:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VYlGXz1h"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E333C2F;
	Tue, 12 Aug 2025 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002693; cv=none; b=TMqwr/mV/fwY6/CFxksA7gbdXpw/8mytaWDSpB7vYI70vpRwBFnWoP5pCaV7vmmvl8fDblztg08qJyAuD2GWwwtwEjZrzbX7OuIkYSfnWjStM/xrgM3YFkcyWvczEybBIbEhQasOMguBuau5RZOQN5h9UfP606bj7xPt6r3GowY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002693; c=relaxed/simple;
	bh=zMiRV+p+DUcdpzuTRwPcyJNdY52FdWHiETIA/GgW848=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TKfGLPaibjLJSowvP+oiRFd8cJo/Q9i90b5gjh026DuKreeZkWhI+l/33ePL9I6kbhknwcMnJRUPd6DWv6U2v9o9U5loAqpdgQDlvcY7A7AY4iXOoi99AifHRzLGhts/EBLzfK2Xr5GCNIxbMDhFXstIMXsDR7yyQXRfZz1slHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VYlGXz1h; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755002689;
	bh=zMiRV+p+DUcdpzuTRwPcyJNdY52FdWHiETIA/GgW848=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VYlGXz1hiPGGu1TBTb2QI72OdiYPHXlCYWNxCdy6xpdu/HKnD74CDfQgSt9VgmyYf
	 TylHrl3NC+EFCO4C9GoOVmibBiaDdwiN2rzbgC9ENXuEGN5V4/Yl5lMV2QFV3BtLiE
	 X7N+Ff+Fd0GdMm3zSzN/1GTAfgF/wYBOiLXbTZQV1ZnrcVrUllN80vH61by23Y9x+O
	 fqn7yJvwm/Xfgi1+7qgJNif1EzpVB7LIPAWnjEUfb9uVYHbeAZXd9joP4nipfLn1Cb
	 cLs1aFozax3A9mbZo1gx4Zpd2IIn51u+/zJEKW20JYvGHXl1OsqHCj6CMODtxu3JSu
	 WENTFidEoBo9Q==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B8BB17E107A;
	Tue, 12 Aug 2025 14:44:48 +0200 (CEST)
Message-ID: <a66feb89fa02f05b187e5603ffc3b1501ef3cbd5.camel@collabora.com>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Alex Bee <knaerzche@gmail.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 08:44:46 -0400
In-Reply-To: <91864a1c047d2bdfce202b070716a694ede47d5e.camel@collabora.com>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
		 <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
		 <1dd29158-0660-4254-ac00-1316768d9b82@kwiboo.se>
	 <91864a1c047d2bdfce202b070716a694ede47d5e.camel@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-Y2sl7uZiPmx/2tINlSGb"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Y2sl7uZiPmx/2tINlSGb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I forgot,=20

Le mardi 12 ao=C3=BBt 2025 =C3=A0 08:38 -0400, Nicolas Dufresne a =C3=A9cri=
t=C2=A0:
> > JCT-VC-HEVC_V1 on GStreamer-H.265-V4L2SL-Gst1.0:
> >=20
> > - DBLK_D_VIXS_2 (fail)
> > - DSLICE_A_HHI_5 (fail)
> > - EXT_A_ericsson_4 (fail)
> > - PICSIZE_A_Bossen_1 (error)
> > - PICSIZE_B_Bossen_1 (error)
> > - PICSIZE_C_Bossen_1 (error)
> > - PICSIZE_D_Bossen_1 (error)
> > - SAODBLK_A_MainConcept_4 (fail)
> > - SAODBLK_B_MainConcept_4 (fail)
> > - TSUNEQBD_A_MAIN10_Technicolor_2 (error)

I'me getting the same result if I force a single job in fluster. The test I
posted was with 2 jobs. Detlev found that the iommu reset is required in mo=
re
cases on RK3588/3576, perhaps the HEVC decoder in older hardware needs the =
same,
I will try and report.

Nicolas

--=-Y2sl7uZiPmx/2tINlSGb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJs3PwAKCRBxUwItrAao
HF5IAJ9I+Gxb7MlBwyEmKIXw1+qOngNv3QCgtFeTxOPKSG0sAWm3UYeR1QhlsMQ=
=9ofb
-----END PGP SIGNATURE-----

--=-Y2sl7uZiPmx/2tINlSGb--

