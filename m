Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD4071FD6E
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 11:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbjFBJRE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 05:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235060AbjFBJQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 05:16:34 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3DD99
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 02:16:23 -0700 (PDT)
X-GND-Sasl: paul.kocialkowski@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1685697382;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZDZ8A88qzqlmgNcCQxQm365P8tXVF2RjC5ggqad7VeA=;
        b=EfwN2z4XhXav+1+cwPOySChJAksnAo1SZOMERHGEIarvo4Doje7OXbVisfEK8Ai4l/gJQC
        dYw2JdgCFr9OhHzYRX0bft0q7X2d70JkPLCuZ9ABfbRmJAv3+yXgy19EiUiJAjUf6994Gy
        lMw/LIEUIp3gr6xkh3XGeQra7zCtg4SLqGArzyOiEhd6rZUnwf5ArfElXPMrpSZL0SnlFj
        ZriBRfyeagU1rB3Dfy0RwyXmeK3h4MMCTN9ifmH5/dZ2qN3FdRO2ptBw98/Cr5HEfaJPCx
        p+AyDLEUE9D/Ca+uTQI6cmtWZLz4y5DgDY0jNE/83EVjN2gr9JOyNy2R5LZUTQ==
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C10EA4000E;
        Fri,  2 Jun 2023 09:16:21 +0000 (UTC)
Date:   Fri, 2 Jun 2023 11:16:21 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Martijn Braam <martijn@brixit.nl>
Cc:     regressions@lists.linux.dev, jernej.skrabec@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [REGRESSION] breakage in sun6i-csi media api
Message-ID: <ZHmzZUkcFK8Gq_JL@aptenodytes>
References: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/xVHL15dNVBeKuec"
Content-Disposition: inline
In-Reply-To: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--/xVHL15dNVBeKuec
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martijn,

On Thu 01 Jun 23, 23:19, Martijn Braam wrote:
> It seems like this commit:
>=20
> media: sun6i-csi: Add bridge v4l2 subdev with port management
>=20
> Has changed the way the media pipeline on a64 devices, in my case the PIN=
E64
> PinePhone works. Since this is an API towards userspace and there's active
> applications that use it I think this counts as a regression.

Do you have more details on what changed specifically?

The commit added a bridge subdev in addition to the video node, which is
generally a better description of the CSI hardware and also a necessity
to support the ISP data flow.

Maybe your userspace application is not configuring the bridge media block =
with
the right format, which results in a mismatch?

Some work was started to achieve automatic format propagation, perhaps it
would be enough to solve your issue.

Cheers,

Paul

> #regzbot introduced: 0d2b746b1bef73de62d2d311e594a7ffed4ca43
>=20
> Greetings,
> Martijn Braam

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--/xVHL15dNVBeKuec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmR5s2UACgkQ3cLmz3+f
v9EPcAf+JBtBZe84LRoJz9yWU23a/bmOt82xy1iit1iEr0HX5IDfh6VADtUyLsuP
W0tp3SYomGnCRO7Hb5VhFskMbHPaOLHCUhPmY06XQXzIQq8SsA8OA2pAjD89CoLC
Yd61Jab/h70X5JA6LvV8BlxxM8gF++fnBjs1obmVRLF4cb96bys4Ah8gQcM8tsk5
Eskvk7RcghYyQjkcUwgYEY0nsa+JrkydEtpUVBxFrRffMayLrWBoEdToiY0usbCu
CBm/jP3XG7O/Nhc+8wC1bgUZEJgNmpPihVNohoLwA+NVyO5PItN02tlf+c6gZFlN
uu4SaQrJbZHbLveaM3ZmM+/N8XQnTA==
=7j7K
-----END PGP SIGNATURE-----

--/xVHL15dNVBeKuec--
