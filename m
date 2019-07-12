Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 700A367346
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 18:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbfGLQ2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 12:28:31 -0400
Received: from mout.gmx.net ([212.227.15.19]:49123 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727009AbfGLQ2b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 12:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562948903;
        bh=0v2GSQrHHHdinzNIn48VYqxmuxIigsWUdNFabboBIIY=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=PRlazr2XvN94f1Ee4MRNpoWrccBMTkg96wWuZ1w8JGBwK64ugKWCPZ/IgbEN7IQ92
         xIjsy65tmG8rrWZ+GTJuuIrNYE0gDeDcjAGXxWvK8L/G7ga57hu1i0xHIjXLO8b0Em
         IzWA8uiTSkFqDQTT66iL1f0kgxMywdVkKdEZPoRE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([178.9.169.7]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Me8RK-1i7Tq43t6c-00Ptif; Fri, 12
 Jul 2019 18:28:23 +0200
Date:   Fri, 12 Jul 2019 18:26:43 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Sean Young <sean@mess.org>, Brad Love <brad@nextdimension.cc>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v1] media: dvb: Add devm_dvb_register_adapter
Message-ID: <20190712162618.GK22408@latitude>
References: <a69ec163-8515-2e86-e2e7-0da61beda6e1@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y0Ed1hDcWxc3B7cn"
Content-Disposition: inline
In-Reply-To: <a69ec163-8515-2e86-e2e7-0da61beda6e1@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:HZohHom4qTQCvZGqYcZoXBdr+y69orypk8hvUfHgre2YvdaMjW9
 ZPfdHyPJ1kMQqGic753D6/WwwKeBUWjw1+STb1NwoW/UV5GQ12BVEj6R7HWOke8oxjfnVMU
 XYNFA1vCDeeFxKr39OYEYDHAUP2GhQypHIUp15pcOmmREsJoSfox76D5MjoLMkCJibzaGDI
 TuoNUMthCwKH78gqQ/cqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XDv5GFV2yQY=:bBeOGwyNRc/OKwTcbOu26e
 3DdMTELSaOkywNl/ZYakRMFpaV0l1dt7+E1+lirjISAFlXQUfzuXO/7xAI/3QhE4nCB3a8ip/
 De7I6/sQgTmnZyPWpx+k5W0wTjJow5Lwe5yDuxgWdiEgEIAt2snFsjw8ObUx/EpC6Dapur1A+
 +fA0l9ranBmlPtdg+nCnfS7gaaJyCvoLa9rFuGImSxJalQaXUyiy3m7KSDg+w3EHlNZtuT6e1
 PtN98Lqs6gwiT/pEdA6Bw2YvHena7Sj/iEyVgxFFtk3bmTplbDBA/4pfSS6Js5gzz9Vgf0k7N
 YTJM4BtlBAAXiznVRwc9vUciveUQTDPCleEeV64hca1FjckiHf3dG7/6MQxOPG8bCFVo1/XpO
 j5yDgyu6SBFXPY+WIoXEfFqgmkCuVRdEPOn7Jlf2Qsb22KSM9IOHlWRcobqk//rJ9SMpMUT6w
 JfYXvZsKe/KwoK0Xjot4ZQaZNocusPXhtjzq7yqjuq4QRVfOMF0oDiPAmjnfQoTHyIN9DyKYP
 SayuHjTmOs0zBF+8m3jSLcU6MkXBQ5D/YXHlSBP2A8nQY/F98DDts0e/5vRM8u5B0Aa9wa76v
 TCsVRZQHDkjFPQmT0TbtPwX73ZGFt75ccj00UIjG3o3N+IdqJDJ3P78fT7Pkq0FIwxqneZ/xn
 65NjUq7A8fJ5iT92UYTGpwVNTUstPtOYaKZ99MNLYuhq2qDVt9ZrNsFleaA2gyuyGerN+11eB
 Za/NgsfN7d3Z53HemN4khnVfUw6HeEpSUpcw20Ry8ge1aQhMn/bVYsJmbFPszR5998SnV02Mt
 DYR4t2Flv6Pby36FbSzaWRgyE6nma6dNmW6q/Vqg98zr3Aa9arKVxjY7uIEdPAQ/dimXIHcov
 S5bsYIGXl9O07EGKK+b8eGmThZQSvhgi2AIuKJN47a3REG+o79wM5/gbh7k0PIsDAv3qDsAuf
 uKBdaiA2IJkiF/bSt+wymXxbqN1THBLFELte3gYdrQ4/WbwUSe9aXcvnjrjFglAEBDYeeOwsc
 lcnDAhHegPT0oB0VsmyY5oTFzsYv0L2QlcgDWswZLUcEmCG0UQ3oWy9WJ1SaHbN8wI09UETwG
 Jb403wu6GXnjwA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--y0Ed1hDcWxc3B7cn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

some comments below.

On Fri, Jul 12, 2019 at 04:19:20PM +0200, Marc Gonzalez wrote:
> Add devm* variant for automagic resource release.

S-o-b missing.

> +int devm_dvb_register_adapter(struct device *dev, struct dvb_adapter *ad=
ap,
> +		const char *name, struct module *module, short *adapter_nums)
> +{
> +	int v1, v2;
> +
> +	v1 =3D dvb_register_adapter(adap, name, module, dev, adapter_nums);
> +	if (v1 < 0)
> +		return v1;
> +
> +	v2 =3D devm_add_action_or_reset(dev, unregister_adapter, adap);
> +	if (v2 < 0)
> +		return v2;
> +
> +	return v1;
> +}
> +EXPORT_SYMBOL(devm_dvb_register_adapter);

What non-negative numbers can dvb_register_adapter and
devm_add_action_or_reset return, and what are their meanings? Why should
devm_dvb_register_adapter return the (non-negative) return value of
dvb_register_adapter?
(I really don't know, because I'm not familiar with the media/DVB subsystem)

*If* the non-negative return values don't matter, I'd simplify the code
to something like this:

	int res;

	res =3D dvb_register_adapter(adap, name, module, dev, adapter_nums);
	if (res < 0)
		return res;

	res =3D devm_add_action_or_reset(dev, unregister_adapter, adap);
	if (res < 0)
		return res;

	return 0;

(or even 'return devm_add_action_or_reset(...)' directly)


> +int devm_dvb_register_adapter(struct device *dev, struct dvb_adapter *ad=
ap,
> +		const char *name, struct module *module, short *adapter_nums);

I think this function should also be added to
Documentation/driver-model/devres.rst (previously called devres.txt),
considering that most (or all?) devm_ functions are listed there.


Thanks,
Jonthan Neusch=C3=A4fer

--y0Ed1hDcWxc3B7cn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl0otMMACgkQCDBEmo7z
X9spOw//dlNEDalt11qdH6GGG6pV6zehngmU4rCRTuA3CfUDxzVbHEWipVWi3WV0
lLl5tddj89jWpXj5Ho6vdo5Z10bsMH79JQgYfWCjjTD7mL1E3xnleqwTG4a9HvR5
Ds1wj/oPOc8IOnejFaXk/yBXNYKjYICrTA3WSDCt4jU9IErJ6GQwDn3eV8ZKn4bD
GhkyRBLMYowF2QN+KJwBeFxnAJZ7V0Ukg4yB/bybfBI+PUHvUMRfncMcI5KzluIy
DM6IxlFZxtrVmlifE6wV4VUhcxPfWvRN/LBVmEXp7dA29r4oygTRTs8aQqm9s4Kn
OgZ53z9VVwmku9BFnB9fNpPTmui9/DydxMFzW+S+LVDDUmvEfnDDdZ7zdMTj/D2a
YQAGLg1eRDllqWOThOHlLnawwak4/qmcoojJOPyxud0zV4Uzt0ChyhClnrI5MvT6
BDGa82drBsHYaXy2//raqcvs/wbb+1Zk+8sYkiW7tcWoJgmOX/IymVRN8oD9FBhi
SkaiGvPGtFM2BYnLXldYigm9kvYpC4KsISqJVXLZE2ICUc++5KXjKI+Uscw/WW6M
Zzuhv0kQuw0M5eW1Z37GEDGFlXA5lcGP+Csfg3+6NWEw2EX/xJzDCYV3focXIzSL
Pi8fwexihQ2WxRVsi89OHBRI/xrSYfHj69I9iLr9YLnnLXX98q8=
=M7DF
-----END PGP SIGNATURE-----

--y0Ed1hDcWxc3B7cn--
