Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39F205AB327
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 16:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237298AbiIBOOJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 10:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239027AbiIBONw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 10:13:52 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004B1EB854
        for <linux-media@vger.kernel.org>; Fri,  2 Sep 2022 06:41:36 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9C61A1C000B; Fri,  2 Sep 2022 15:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1662126040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=0NcbvYXLclUCK1lNUt5M9EgQVyJYJNCE+rmi9X/Gizk=;
        b=G004DTPzRh9P2u0eqniZQGTfCvw2V+4Gfq78mHSw2SJdOu4c7GOXLa0Oi4TOkYP874B6A8
        9fpqY0VvvMBlqyWe+YtEAbltfVH5ttPj7atdJA3NJLP3Xft3v7THMw6aC0QmJjwNSKt31B
        uNT623HlC7hegVe+BqMPz7TsLZgMJ24=
Date:   Fri, 2 Sep 2022 15:40:39 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        linux-media@vger.kernel.org
Subject: Cedrus -- video encoding on PinePhone?
Message-ID: <20220902134039.GA27386@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

AFAICT... PinePhone should support hw-accelerated encoding of JPEGs
and h.264...? But driver is in staging, support for encoding is not
there, and userland support is partly available for decoding but not
encoding?

I guess that adding the encoding support and the userland stuff is not
a stuff for weekend? Main camera sensor does have JPEG support, so
MJPEG video is possible without cedrus, but h.264 should provide
better compression and there's no JPEG support on selfie camera.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYxIH1wAKCRAw5/Bqldv6
8gNHAJ4vJVkQ/+eckPZU9GiKBzG6Etx6FgCfZSZ7gOktw8jQ/s0wyJKKUNqNWLU=
=BBCl
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
