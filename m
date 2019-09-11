Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 902E0B04A5
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 21:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbfIKTtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 15:49:42 -0400
Received: from mail-ed1-f51.google.com ([209.85.208.51]:46908 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728395AbfIKTtm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 15:49:42 -0400
Received: by mail-ed1-f51.google.com with SMTP id i8so21767691edn.13
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2019 12:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=v3mgNJx4oG3sOd0s0/8iNdeiQGEHPFmY0wcwefa76ac=;
        b=Iw7ZAVq0XliGKL+EWtqH0rdNmLLCbg3UPsmQyGopj5KGDTEMrNkKBiGTL66WciZ08g
         dFu6JtGz5RHbUWUPH85QeJJsOfkXw3QbAnsL6KjmQHe9bwoVU9UCSM3i6APX/3eX/JPh
         VpkXEhOVqDEwqlqn8FNN59lZ/+cfhCmYIXZMYGlP5SwCdgdSbq2ssVk8U5PC56BaGSKQ
         cR8A9Z4v3MiHZyQHT9ofeGTEJdzXpMhJZADeYELFxRkxAU4ko0jtDLhKek5RIkacJI33
         93Ow04E/yn3uh/xuP8zZjOYrNZIee8E7+QTPp29Qyor31e3n2Svk8BFX7/rGjHKOx7A2
         yGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=v3mgNJx4oG3sOd0s0/8iNdeiQGEHPFmY0wcwefa76ac=;
        b=J0+DWVXidJ1WAHaJZDF/N+xCvGrv5TcBB4ZZk97c9HTXDNFdl+0KHhqtRGbgj1ZSFR
         iHJw99mfVXTC0yxETtAsDkU1pTO2EornJhSFTsmWD0BhQtT8VZvsnkAQsf73mQZg2QdY
         FH06Bfs5Gt1/lNf/2D3SD/c9JjayFL6+FPgiZAZEDEQH1DEk7Y+ZAX9SNHs1mDVTEsC2
         aY1fjsz0aHXM7rDAp781VsHq1X/YPvrIqpOsyREFKru2E+46AkeTfwTIIx0wfXFULFwW
         s7Eyx1rxzxKro05swqmZll471rBb5DwlsnNVVvKE05E1mIiFSPwD633EY+0EINHChm1q
         vyHw==
X-Gm-Message-State: APjAAAUO5KLmkD7TsO2xza1Akfxs62sXH6CWZ4WvEGPDHfBGu9baIPdr
        EqF7An/VVpxATSekn1RqRtpaLxynzaGEMQ==
X-Google-Smtp-Source: APXvYqwyvHcR4sCaGmFTbCVqN+AbRRwLHK9jU9Me2Ux6oKu2c1pYWT41ezAIZ4sUJIP99Cq5Dw/dKw==
X-Received: by 2002:a17:906:3715:: with SMTP id d21mr30787397ejc.24.1568231380558;
        Wed, 11 Sep 2019 12:49:40 -0700 (PDT)
Received: from tpx230-nicolas.home ([86.85.109.110])
        by smtp.gmail.com with ESMTPSA id a11sm4356622edf.73.2019.09.11.12.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 12:49:39 -0700 (PDT)
Message-ID: <c7b62640ae0e57a9da0c6c5245b5454af08ad2a0.camel@ndufresne.ca>
Subject: Re: [PATCH 0/4] Enable Hantro G1 post-processor
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>
Date:   Wed, 11 Sep 2019 15:49:38 -0400
In-Reply-To: <6e493142690d48ee7e65c1cb2a4d6aec1e3b671b.camel@collabora.com>
References: <20190903181711.7559-1-ezequiel@collabora.com>
         <CAAFQd5AdikoN+7TG=0ZGFkSzaK2UFHM4VG7SYtfUtmjQgD61zA@mail.gmail.com>
         <6e493142690d48ee7e65c1cb2a4d6aec1e3b671b.camel@collabora.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-a9ozNFCk/x1M6OTkHF6F"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-a9ozNFCk/x1M6OTkHF6F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 11 septembre 2019 =C3=A0 09:27 +0100, Ezequiel Garcia a =C3=A9c=
rit :
> On Mon, 2019-09-09 at 16:07 +0900, Tomasz Figa wrote:
> > Hi Ezequiel,
> >=20
> > On Wed, Sep 4, 2019 at 3:17 AM Ezequiel Garcia <ezequiel@collabora.com>=
 wrote:
> > > Hi all,
> > >=20
> > > This series enables the post-processor support available
> > > on the Hantro G1 VPU. The post-processor block can be
> > > pipelined with the decoder hardware, allowing to perform
> > > operations such as color conversion, scaling, rotation,
> > > cropping, among others.
> > >=20
> > > The decoder hardware needs its own set of NV12 buffers
> > > (the native decoder format), and the post-processor is the
> > > owner of the CAPTURE buffers. This allows the application
> > > get processed (scaled, converted, etc) buffers, completely
> > > transparently.
> > >=20
> > > This feature is implemented by exposing other CAPTURE pixel
> > > formats to the application (ENUM_FMT). When the application
> > > sets a pixel format other than NV12, the driver will enable
> > > and use the post-processor transparently.
> >=20
> > I'll try to review the series a bit later, but a general comment here
> > is that the userspace wouldn't have a way to distinguish between the
> > native and post-processed formats. I'm pretty much sure that
> > post-processing at least imposes some power penalty, so it would be
> > good if the userspace could avoid it if unnecessary.
> >=20
>=20
> Hm, that's true, good catch.
>=20
> So, it would be desirable to retain the current behavior of allowing
> the application to just set a different pixel format and get
> a post-processed frame, transparently.
>=20
> But at the same time, it would be nice if the application is somehow
> aware of the post-processing happening. Maybe we can expose a more
> accurate media controller topology, have applications enable
> the post-processing pipeline explicitly.

How it works on the stateful side is that userspace set the encoding
type (the codec), then passes a header (in our case, there will be
parsed structures replacing this) first. The driver then configure
capture format, giving a hint of the "default" or "native" format. This
may or may not be sufficient, but it does work in giving userspace a
hint.

>=20
> Thanks for the feedback,
> Ezequiel
>=20

--=-a9ozNFCk/x1M6OTkHF6F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXXlP0gAKCRBxUwItrAao
HNw+AKCQcVOG1SaxOGLL555nItsPa9cvMQCeK4EDSk7KrRai+IkgEBCyQDHa8Yo=
=ffC4
-----END PGP SIGNATURE-----

--=-a9ozNFCk/x1M6OTkHF6F--

