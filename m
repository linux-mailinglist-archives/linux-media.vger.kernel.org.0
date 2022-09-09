Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0685B3ADF
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 16:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbiIIOln (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 10:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbiIIOlk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 10:41:40 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B785CFA68B
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 07:41:35 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E4AEE200002;
        Fri,  9 Sep 2022 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1662734493;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NNPj2Tj19RHW7eeiGxO2UYEtG5OTbUFhAgJmANF827w=;
        b=KmNkL7xDw/k9IG5J+Kr/ltn+4bABSH2hOwZ5NyXFcyriZdiBbunb23Ua4a6+yFE+sj/ujx
        JartuYzbUc8dzH7f5H5NKFndSnl/yYC5tY3qMX316Ac6IOFDfUAMge/Ji6KtOEE4zDUkN4
        1Dugb1WjE+Agw3kAeg9pQ0quUCdZZsSVd05XU/cuc81TNg0YE5em3GnWSQLBT1kYbCVr7P
        PaGPZv21XpANMz+8GKE5tWd2eimtcWvTf7fz3LgtBwltQLMcMSWYr4OWVc2jnDgHSwO0Zr
        7LGBNPjr2Q+2PyHLVHIwsgOt4sDow2Vxd/DzKY2OV7CsSnRWMlBq++XLHvoq2g==
Date:   Fri, 9 Sep 2022 16:41:31 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/1] sun6i-mipi-csi2: Depend on PHY_SUN6I_MIPI_DPHY
Message-ID: <YxtQm37sI84KR98M@aptenodytes>
References: <20220905100054.3259357-1-sakari.ailus@linux.intel.com>
 <YxtHBbvZ2sq6KIyp@aptenodytes>
 <YxtPZpA1YBRgjBA3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GcMm0XNZ21vt32Az"
Content-Disposition: inline
In-Reply-To: <YxtPZpA1YBRgjBA3@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--GcMm0XNZ21vt32Az
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Fri 09 Sep 22, 14:36, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Fri, Sep 09, 2022 at 04:00:37PM +0200, Paul Kocialkowski wrote:
> > Hi Sakari,
> >=20
> > On Mon 05 Sep 22, 13:00, Sakari Ailus wrote:
> > > PHY_SUN6I_MIPI_DPHY is not a freely selectable option and so may not
> > > always be available. Depend on it instead.
> >=20
> > I don't get what you mean by "not a freely selectable option".
> > It's definitely a tristate. Also no build issue will occur if it's
> > unselected (but I guess that's not the point here).
>=20
> It depends on a number of other configuration options. You can force the
> value of the option itself but not its dependencies. This can lead to bui=
ld
> errors dependin on the values of the options PHY_SUN6I_MIPI_DPHY needs.

Ah yes I see, it's the usual issue with select selecting the option regardl=
ess
of its dependencies. My bad.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--GcMm0XNZ21vt32Az
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmMbUJsACgkQ3cLmz3+f
v9HMgAf/Z3U+GrB7ihvM1iThxpmGXG8W8DWqodelNSd6VGadSpYJvE8cEB2QPe0K
c7It+RAacEYnc/t+ermafXMAQ6wQqX+Ifc1iSxSxejZjUlzB2LnrLZp6VYNjXgIx
IAxykavi7aOZwWY0CfPki9AiyT/oBDAb2K59Lwq55nJwb6V7QvC40UCXhAshqMUG
SDHwd2epXvj1lDovbpPvM4+dqwBrJmjShTaj6JhDPr0CFY4xqdmhQ/jZWq7aNOyO
A0D8/5ivrEjzejcpuivl/CABXTYrLDzwAV90wY6OgcTnrMfWVzCTQMAyIrs2ufLQ
yOau9m3u9B9T5qU3JBqXPVC5aJrS4A==
=TScE
-----END PGP SIGNATURE-----

--GcMm0XNZ21vt32Az--
