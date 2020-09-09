Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D90F262B04
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 10:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729824AbgIIIzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 04:55:10 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49940 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728617AbgIIIzI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Sep 2020 04:55:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7E65C1C0B8A; Wed,  9 Sep 2020 10:55:05 +0200 (CEST)
Date:   Wed, 9 Sep 2020 10:55:04 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sean Young <sean@mess.org>
Cc:     Jia-Ju Bai <baijiaju@tsinghua.edu.cn>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: pci: ttpci: av7110: avoid compiler optimization
 of reading data[0] in debiirq()
Message-ID: <20200909085504.GC10891@amd>
References: <20200830082042.17462-1-baijiaju@tsinghua.edu.cn>
 <20200830083036.GA17715@gofer.mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Content-Disposition: inline
In-Reply-To: <20200830083036.GA17715@gofer.mess.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-08-30 09:30:36, Sean Young wrote:
> On Sun, Aug 30, 2020 at 04:20:42PM +0800, Jia-Ju Bai wrote:
> > In debiirq(), data_0 stores the value of data[0], but it can be dropped
> > by compiler optimization. Thus, data[0] is read through READ_ONCE().
> >=20
> > Fixes: 6499a0db9b0f ("media: pci: ttpci: av7110: fix possible buffer ov=
erflow caused by bad DMA value in debiirq()")
> > Reported-by: Pavel Machek <pavel@ucw.cz>
>=20
> Pavel reported that your patch was garbage, if you are trying to defend
> against a malicious pci device. READ_ONCE() will not help here.

I would not use exactly those words, but agreed; we should have some
explanation that it is feasible to protect against malicious av7110
device, first.

Best regards,
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9YmGgACgkQMOfwapXb+vJcyACdHNjDsWpkdnGiw1AzX4GVKKMq
9doAn3RKQdPt0oR/tMJKZAqP5cVJgjI9
=xtrY
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
