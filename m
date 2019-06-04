Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99BAD3413F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 10:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfFDIMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 04:12:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39839 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfFDIMP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 04:12:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id z23so13660967wma.4
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yQXP72QDH89SHzqYkQnP3HRmmf1rIc2N1HI7LGwB++k=;
        b=C0KzRf15ilzKl3KsWkhPtML7FzaOhTusEoAmhVxHkDeKACOjFIA1keeflNBBG1mXIu
         TUuCFWIEFPcMjKWacpLISB3NFnEnq9VBRr9BjlqEdQXkIH/QRhx3nm918RH95wqsEmKt
         QO4JGSLVs7erDC6TKcMbZEqs0BN9iCDNcziYA1CjnV+9BIIkgJyW19fRdzWODWLqoLm8
         Qy/1Gh+gPA13ckJvqpEtgWOiTk9d3GkGtMp0qV8PXYgcjrYADiNdzLItu+/JNEaNDIOD
         anOdiKPEFruexpwjm98u/GUojBvPxlitrN7xwq0DXnovodM7qEfjOLwjS53l3Jf8nn8O
         /10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yQXP72QDH89SHzqYkQnP3HRmmf1rIc2N1HI7LGwB++k=;
        b=Yr8PDbs441PwzkZFt16BFg6W9l8+85blMX/RihzOqvUjz1WmKsi19nH8DIR4fLzmaf
         SV364SvVcjvSbngV3wTKr3XPcYG+VpaCHRyazT7x6MVy6dZys3wm4BnFEqIwmDsd3xcH
         zZOBQrTuGAoiS1Api3r1f4RwG/w8s7wi+Pry086BT28hhMlG8IwDizlJ9ayy5vYGmnvz
         8E4O+opc0WpJn1h7+kypazCY9o0B6UZ8Qh/6Lhh3gtnNjjkHFD2gUBD5rT9XUaV8k9fn
         /fF0i6Nn2J9IN3uwcqlfmKQtHw7eay2ITYdzoKWfcd4mq630DF5TBEj2JupNnq69WSBY
         yrKQ==
X-Gm-Message-State: APjAAAV+vemXgw2PobM2mQlbjzwYwSYw2GjolX7AnEhPfH8msLPj49JY
        hFZ+D7xxHHLZ1IEefRg7TA3HBibp
X-Google-Smtp-Source: APXvYqzBYYi4bjfcBE7Ua5PtIRWJ4co7GJTEyLduDw6JJJliLF8fRhpMSkcYkOFF6GNvUCIkozGVrw==
X-Received: by 2002:a1c:21c4:: with SMTP id h187mr17484586wmh.27.1559635933003;
        Tue, 04 Jun 2019 01:12:13 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id l7sm8403957wmh.20.2019.06.04.01.12.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 01:12:12 -0700 (PDT)
Date:   Tue, 4 Jun 2019 10:12:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH RFC 5/6] media: cedrus: Make the slice_params array size
 limitation more explicit
Message-ID: <20190604081210.GA9048@ulmo>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
 <20190603110946.4952-6-boris.brezillon@collabora.com>
 <1764986.tDiRxPxGAQ@jernej-laptop>
 <0fbe395c644bfba4830e98d208c143b8a265498a.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <0fbe395c644bfba4830e98d208c143b8a265498a.camel@ndufresne.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 07:55:48PM -0400, Nicolas Dufresne wrote:
> Le lundi 03 juin 2019 =C3=A0 23:48 +0200, Jernej =C5=A0krabec a =C3=A9cri=
t :
> > Dne ponedeljek, 03. junij 2019 ob 13:09:45 CEST je Boris Brezillon napi=
sal(a):
> > > The driver only supports per-slice decoding, and in that mode
> > > decode_params->num_slices must be set to 1 and the slice_params array
> > > should contain only one element.
> >=20
> > What Cedrus actually needs to know is if this is first slice in frame o=
r not. I=20
> > imagine it resets some stuff internally when first slice is processed.
> >=20
> > So if driver won't get all slices of one frame at once, it can't know i=
f this=20
> > is first slice in frame or not. I guess we need additional flag for thi=
s.
>=20
> A first slice of a frame comes with a new timestamp, so you don't need
> a flag for that.

But slices for the same frame will all have the same timestamp, so we
can't use the timestamp to tell the individual slices apart.

I mentioned this in that other thread, but I think it'd be useful to
pass along the number of each of the slices. Drivers can use this in
order to conceal errors when corrupt slices are detected during the
decode operation.

So if we also passed a slice index along with the offset of the slice in
the bitstream, that should give us enough information to achieve both. A
slice with index 0 is obviously going to be the first slice in a frame.

Thierry

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2J9YACgkQ3SOs138+
s6GkxQ/9EzDkz8UFmJRspzm1Sf9Xn0KKXZyOBLrtico/EsTdR6WDHrx2GGmv8BQJ
7t+VBniFtxi8ZwLa7nHJ3iBOXzwGxlqP1029ktC4twuwLAofBVNDNjN0Y+ugra9M
qprUmE+IcPB33TzggIb1rn+DYvnhCIu65q+j9n5MrGwdTO0kTxg5CsZpEnnmcRpC
1gC5YTRAH+Ly9Xjrk6gXDyZH58woWo0A37QYM18mNfX1/t3rTEoGMIw3nTXUyOES
cFrlTfTg74LsvZ+R4CtiVF4Ih47Nym7JljsI9/Saqq+IU3qktYYL+ewLH/CjoRu8
nInQZZuDjehNw+R0dLLPDBHUBvgUEnijdbB7aNLUSOgpRLEB5gElgn2dabMmg4wS
K4g6aIHNCAvLhk1LnmRxK6d5FRMEAXeR13ltkbuFaBwzczqE4E9VN8urWDWSGD4R
SGXv6jgqDe2HPccEGZnj/LKRpV2c4pcreB77HEDEaJmlFD5ckFgKHP8Uj9Q4Q5jo
gRn6EGXfYnKWy9/kEvgz9GT0DVOveWbmBji7kpovt7rl5qdhOJtjXAjuMr15A+PT
AvisZl67LI95pjQrnbB31XwDp+GcqNbRMqPX5NBMz/MuSCiMhXaQWd0M5vn1k000
6dGNRZ7qMbS+MS3iQ0bvTDxjzswULZncKyqXoRihyKSQpQYfo8w=
=Fbv3
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
