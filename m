Return-Path: <linux-media+bounces-7388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2654B880D08
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 09:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9B961F2429C
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 08:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DC72C68F;
	Wed, 20 Mar 2024 08:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="noP2sn+w"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic304-19.consmr.mail.sg3.yahoo.com (sonic304-19.consmr.mail.sg3.yahoo.com [106.10.242.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4CA374C3
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710923432; cv=none; b=EHeasZe4iGMvWZXSNNySg5LUDQ2V2skoiU22qF186piElXYCOeMYXbes81GoXq+3tAN3xx/aggtZOpRUbr3x+ZmbyPamipl8IK5fImSEbQNS00CSF5zJRmXi5XaEgf+cdjyi36q6/ghaZu/TUPBsQqy9c7LtYotHYHvkgkO9x6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710923432; c=relaxed/simple;
	bh=vM7ouAyWEuJjASToGDROx3MVONyts0rJcZqkzfTUCu8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=gjp00VsiBat8QWJl46QW75z1R5NhBAAVnl39F35wc5wATeCXPvEmu1xITx8CBCKF4D/VtRNALHsRcitsydZ66DgK+62R6Qx8Rvd4fKZJgxJxLBcJzQPhoQgQCprB5R+yHbrIkNblOjNNcdkj4f9sa6X36TvPv2gluQg1RBOxr0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=fail smtp.mailfrom=fedoraproject.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=noP2sn+w; arc=none smtp.client-ip=106.10.242.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fedoraproject.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1710923426; bh=vM7ouAyWEuJjASToGDROx3MVONyts0rJcZqkzfTUCu8=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=noP2sn+wewTlwTNPKUkJIuq1bZAv2S/KdKHstSoat3jpFxPPeXZI1TE21YxPLRHMVUjP40tB43CpDm9xIEC66CXvihN5jPaA+fSQMarx7WApFWP88GDPQ0Rtfs92W+ZagSzp/i+/4lrM1JQIXmqYXYC2lJtO5RJGFg3FC5hXiUtetoNwymqJZ2J0eJemo2on+VigMrT1Fd7g82MsPJ30mEp14dypkUm3fI7KvhzsIl+FvZt+jNQgqxq6D/m9u73W5wQzhZiN6AC2LPYbTMH/7+To5LYJLQDnW6yI/et8G23yNVCZlWkkctkVewx9/SMUkPcs8PWOHM0flRkhZDFbUw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1710923426; bh=SSKkUaQm717VrK1PDxsX1I4ImxowrMjAYRvOhvP0nNz=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=kiUNAB/pE/sOzpQ9H1NvwMSGSRlDpQYVeh2botDg/6yEtEqI/3okFHMMjmBE/36LNj75lehd01xxcjM4z4HLosltEWHxjfyoWHKZOOOST0pKsobNKYpjfYxgaNZSn33JJQhhv3fbix9jAwAsDp/9hq+OHnzFu+kuHL6BzF3ulz+e+LPpDKxfG29Ap4J+xzEwCPCRZZecFWIV5RQzYX0D/u/7DgYki+GVrYitFiMZck339r1B5OgGLaKbEK2i8ea3K47pj5sMVcPNuRcmYPcvDxTPU1JoeAEJRsUHv9ZmZYCb52oYCy+wA0TfGf87+ahv01e9vjfPiSgvylr5MBQInw==
X-YMail-OSG: FO7QXWEVM1l6dPUS_cbMyn4NtrTsh9cbiBZ22GoTkeVhN62eDidheaAvMzivnvB
 gQ0bTIh6BN0oiMtEmFnEDPcNxIUGuThJfyoiduWA1cx2dkJV9h1B7Weq0bkeFhN1fKwoGdYZ7MnH
 Lu3s.J8HTvUPvaC4xnCAcXT.Bh9mTqzaEw1b_H6PyyqjhrtXHkRqESBU5a.md27r1W1PIYIqbK4c
 lrTGucaJH8q112JfkafZB4XFaBOYzT62489gOkuAb.TNwz_IzSuV8JYGbVx0BO209SaxrDzQG.jq
 7wvqMnDHHK41McV4iBXBfNp7txA6Vi8dgDdP6HsokZ2PUIHFLYJ6MFbcjpuaZGY_VwAXei0fQP3o
 8BgtcFkI7yhciYs6vVgaxZ3tj.FEzDJ01HirmZLOnWHHvAO8sqg_7hQ_MFFcqhV4z8g1I_BQ_cHJ
 5Ftl0ZmEFfklYcWKzBLOc7443HBQCLJlYRcFCOE4bdr9S3XF0vTNeS2g2.2PHRGk6ZJcrY8hT29L
 Okbrz.lF_o4Sgxn3mTMi1CJsLj_pQx7VPkxvRY2CXuGoQxLCE4e5iLTrGLKEHik.JyuXxOUVSlMS
 sYjk6KUiFosv1q_hgaeXjTK0WLaHeJiWdvG6XrUGt_T_zn8JXyXYjmvL8h.FeFzUBbm.qwkzobG9
 77haExagGdHTP6l2XIO2qv70rmaJIcVOKzc2ZxHbGtTk7D8TS6FJfmoN7h4gfi1Epsm1V6q5aeqK
 u61f8vQJ_Fy3.bFUj1tPP0TTa4JNllCWzdR3pdp2dY2RGzH4.QA0gdxI5HXHKSKpTOIsF2IyvVrP
 GyeIVpt2mmlD6xRUBxEpVvtJerQBqmBiCSAZEvWf0gZ01JFqXbfKf2uO9L9_STAsvuZrHQUOutTu
 zDhdBQU_MpXxEjtedal48amVRDxA_LQrmhbgNGFP_BaFtpDuRltnQH5Hhzz_ODrBeFJgxTU1BeX8
 Sh_BSU53QftexN8yC8eubv.C8GRZKHALeD7Wh8j4zMiBpj.tLGziC1VmO.8Y__Te28HT2Q6EkL_g
 Y8zogasANLd20SyvXGseb.bRX0WEZJRnte9_93fUxuQW_FwDZKgMNH7UvYmZ4yRml_LqikUH8fGn
 t2cDf5cA8Nojq2u5x8NTN8O1Iv245NlMEm288Ht0b3iCR35NFIgpVR1YMHIxuu_6pv4tp.QKIJPp
 FWXfUTlhzjRDzEOj_6FNc1sdRb.XZsq57nBOCliY6yFxC0a3RQDu.e6zESSeOLbL.v1eoheSg62U
 V91DeUqAFglKy5XR41sXuY2C91zenk0Dq4pK4l0UGfXydwVt9Ksxxkv5cOjLpCWSVqErwXScOfah
 zudVeDMy.wTUSRrLn6NLgZGnXmVAoO7jULt3GcTRxyOnFLYBN5SEmDpXPyJDj0rACzuIO4qZeLQn
 sllD2NdfQ6kyehUAISNyhksQEcNOy.vX34a7VkA483OFvJhH8wkVKuSrP0mJ_hupj7CaocZpX5ZZ
 cYXZQ5Zw.i.8W7.daKPo.56_oMEaWf27fOUr7VUk8WmYqtLE6OZIFOy2Hm_vWSBDlguD3PG4ygeU
 4QgOYT8skcPquD9IDZv_JLC2uRZH1C_rxM2xrLWnMfGJuntXXGsTVQloiCfbQ0_wUdEV5hEaIdzf
 WWbDYPrBpG.4JhkXY2uNtClKhX48SUA67uoyAf2K.OsAzLTlCicHkID9QWga8qm0DtBgq9zjzXAb
 Jq73g01p2_6L_Ri8VqX9C.7sdoxVFVRlQgO0MkfirBV4JajH3ipRix1VziDJaTPGWQmYBpPO8GXC
 AB.GdS3vtkVWfn7NYf7iMbdfS9fORHXs_fb7C92s52JrVptDBmKIicHAOlk7sIusqDawto.jBTL5
 v2GBqxRf3OsqjIVmybxo3k0D4MBtKQYhzhQJKTALPCzHhezMJMZ_VuL3A6vMGlAuHaSKbNvM.9Y8
 nQzPVdh3Ol4KamhmQdVj8G4gR8os8id1ngyMPF6iZyKUPWBzwB7dqpRQ2aODb8O3hOD62fmN6E_I
 AUPApIM5SmO9DAd1iLIBFaKzBl_a4.RjtiwRIMv_pbJ0zAJrMFdifFUD3sUSFX_DnQ7vTBIIjXxQ
 tprGBgFILwP3ON2.AOXe64zcGw.yu0UN4yoDMyOMeDRM85yq9mmIeBIUT0UyxIxDaTPEqt9R5OM2
 nWT8pow82zexmADMg7y1WrssMu5pRc3i.pWa0wg.Yv8QY_i5PxAIyb1x9wgUFG5rAIa6n4c9SlCG
 r5ca_aFP_SqlU362KQuRzg5xpH8p5SjZbrrDkjFG0PMMHCYAqJorS6jXZM83DHEwsMoBRccMR2ed
 fv3kL3vrwgf.v70vvda0tag--
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: aa3910ca-7ec8-40e5-8b54-81bb575e253b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.sg3.yahoo.com with HTTP; Wed, 20 Mar 2024 08:30:26 +0000
Date: Wed, 20 Mar 2024 07:39:32 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
Reply-To: P J P <pj.pandit@yahoo.in>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc: "yasunari.takiguchi@sony.com" <yasunari.takiguchi@sony.com>
Message-ID: <1813944346.4222082.1710920372587@mail.yahoo.com>
In-Reply-To: <20240311100407.1271331-1-ppandit@redhat.com>
References: <20240311100407.1271331-1-ppandit@redhat.com>
Subject: Re: [PATCH] media: cxd2880: Add terminating new line to Kconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.22129 YMailNorrin

>From: Prasad Pandit <pjp@fedoraproject.org>
>diff --git a/drivers/media/dvb-frontends/cxd2880/Kconfig b/drivers/media/d=
vb-frontends/cxd2880/Kconfig
>index 9d989676e800..94a8e0b936b9 100644
>--- a/drivers/media/dvb-frontends/cxd2880/Kconfig
>+++ b/drivers/media/dvb-frontends/cxd2880/Kconfig
>@@ -5,4 +5,4 @@ config DVB_CXD2880
> =C2=A0 =C2=A0depends on DVB_CORE && SPI
> =C2=A0 =C2=A0default m if !MEDIA_SUBDRV_AUTOSELECT
> =C2=A0 =C2=A0help
>-=C2=A0=C2=A0=C2=A0 =C2=A0 Say Y when you want to support this frontend.
>\ No newline at end of file
>+=C2=A0=C2=A0=C2=A0 =C2=A0 Say Y when you want to support this frontend.
>--=20
>2.44.0

Ping...! (just checking)
---
=C2=A0 -Prasad

