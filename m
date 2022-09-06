Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366525AF800
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 00:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiIFW3b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 18:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbiIFW33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 18:29:29 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0481C3F
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 15:29:22 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 97F2A1C0001; Wed,  7 Sep 2022 00:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1662503361;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DpjCfSGDXyen05P+WpTgk8hDS0lG8BpBA6if6qhZ0UA=;
        b=bmh51zQUREtQTWuLyXiPA0j/EaAQ9OfEwnZ+gAsLzeSrvWIT6sax2V5L2gSBpV5F1Efm1D
        5ho2ODF3D+SxA6QBhGmfSNuCJZs26y3BCUp+VfOgSZF+iUCBwtPUX3SzdVPJDUjABqwhcD
        F+o/GyNcbRujPDbGKXaTYEJzi14Q8XM=
Date:   Wed, 7 Sep 2022 00:29:21 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     mripard@kernel.org, linux-media@vger.kernel.org
Subject: Re: Cedrus -- video encoding on PinePhone?
Message-ID: <20220906222920.GA3435@duo.ucw.cz>
References: <20220902134039.GA27386@duo.ucw.cz>
 <YxXo8+Bjqp6JknqA@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <YxXo8+Bjqp6JknqA@aptenodytes>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Encoding in MJPEG doesn't seem very viable, or maybe only for very short =
clips.
> Also note that a big factor for encoding videos from cameras is the reduc=
tion
> of noise: the usual level of noise coming out of the sensor makes it very
> difficult to get reasonable compression rates.

AFAICT MJPEG on 2Mpix source should give about 900MB/minute, so 5
minute clips should be doable given enough free space on flash.

PinePhone has smart sensor (and provides JPEGs) so I guess it already
deals with the noise somehow?

Thanks for the pointers, I'll go through the videos.

Best regards,
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYxfJwAAKCRAw5/Bqldv6
8mnWAJ4mDF2yzk5OaYy+qmLt9a/jsxnGdACfRD3nGQum6F+kKju3u3RCKcOO6Qk=
=ysdo
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
