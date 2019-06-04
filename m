Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 575C434A7C
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 16:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfFDObr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 10:31:47 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:33107 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbfFDObr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 10:31:47 -0400
Received: by mail-qk1-f194.google.com with SMTP id r6so2963086qkc.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=lpMbX7yCKeBLjSzSFMujL+/bYIjss2dHqErGBTSmo4g=;
        b=cjUhj0EcvEwaFAxKt6va/V+5mkRtS1e+/RvCwmVDoaYLY7QRRZnGCIIoONrzIBE6Hg
         7XsaVab06rwj2i1PShbKVXHT3J+G6cGzmzGD0YwYkRo49vCyYl460hhgT6vUablv3Txq
         sZ1/ZI6Lec+S4GpKq7LXHsvFyD+NGlw/2eJild6a9tUqgLUBxeyWkBTfTgJSTUoAAH3T
         G9+yeUIOLEFc7w/VlwvWrUWiOlvWnl+W3j07AGmx1fyXo9T6kiaR6CjlDkzH5eQKfInE
         7m6opE9ONMKfCil5PojZ495pXDcyhcBlGiL1UIX2/IGTjwexidfNVvotn7XyE5IMZyJb
         tpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=lpMbX7yCKeBLjSzSFMujL+/bYIjss2dHqErGBTSmo4g=;
        b=Iy6RzLoPapXEz2vsGAS3DkrfY/lTxXoOphMoccmQocqf6Eov9jnjxKPOJ//Nx8WhM2
         qDXRJOQ+BsXOCvofehP/c4+SebESL3hZrge3e1AsIPT/GNw4fzn5zZlh1JoRYZ/wg25S
         5YUE+Q5euhLKHV57dZgBXYKiOCL5EcXwGa9fqyTwxDJAL3FAwKtfq9nmhbbj0N4GNmae
         p9HMhAvtgndp0+d5k2LWLuccGRg7hZkicIftEKvtdMJ+61jYjqMGvi/EZZRb5iosZwER
         dd4TeW1EUogcCPyJAYDifh+xCyyNE5+IvfnsmXfKZgqjusrGdHGJ0iPg7ljyz3o9cBmU
         blGg==
X-Gm-Message-State: APjAAAVrMEptvs3HjxcVYsfBxQK9+27XHXC327OnMILBiYZkOd0lpqXt
        Fc6Op2Ti00Z+9QDyrAEFsG0dMg==
X-Google-Smtp-Source: APXvYqwwtN5JQIFFrkllbBJjIQZBCJ6diRa0u2wZ9I+nMSfg3+GgVmZuqFINiXeX17iBb4p+UhabHw==
X-Received: by 2002:a05:620a:16a6:: with SMTP id s6mr28087860qkj.39.1559658706412;
        Tue, 04 Jun 2019 07:31:46 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id w16sm8378719qtc.41.2019.06.04.07.31.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 07:31:44 -0700 (PDT)
Message-ID: <cb3dff3942ba0468e65855cfdc35e92611bb5c82.camel@ndufresne.ca>
Subject: Re: [PATCH RFC 5/6] media: cedrus: Make the slice_params array size
 limitation more explicit
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
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
Date:   Tue, 04 Jun 2019 10:31:42 -0400
In-Reply-To: <20190604081210.GA9048@ulmo>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
         <20190603110946.4952-6-boris.brezillon@collabora.com>
         <1764986.tDiRxPxGAQ@jernej-laptop>
         <0fbe395c644bfba4830e98d208c143b8a265498a.camel@ndufresne.ca>
         <20190604081210.GA9048@ulmo>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-q7XX1/2Re2+2duMofTCg"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-q7XX1/2Re2+2duMofTCg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 04 juin 2019 =C3=A0 10:12 +0200, Thierry Reding a =C3=A9crit :
> On Mon, Jun 03, 2019 at 07:55:48PM -0400, Nicolas Dufresne wrote:
> > Le lundi 03 juin 2019 =C3=A0 23:48 +0200, Jernej =C5=A0krabec a =C3=A9c=
rit :
> > > Dne ponedeljek, 03. junij 2019 ob 13:09:45 CEST je Boris Brezillon na=
pisal(a):
> > > > The driver only supports per-slice decoding, and in that mode
> > > > decode_params->num_slices must be set to 1 and the slice_params arr=
ay
> > > > should contain only one element.
> > >=20
> > > What Cedrus actually needs to know is if this is first slice in frame=
 or not. I=20
> > > imagine it resets some stuff internally when first slice is processed=
.
> > >=20
> > > So if driver won't get all slices of one frame at once, it can't know=
 if this=20
> > > is first slice in frame or not. I guess we need additional flag for t=
his.
> >=20
> > A first slice of a frame comes with a new timestamp, so you don't need
> > a flag for that.
>=20
> But slices for the same frame will all have the same timestamp, so we
> can't use the timestamp to tell the individual slices apart.
>=20
> I mentioned this in that other thread, but I think it'd be useful to
> pass along the number of each of the slices. Drivers can use this in
> order to conceal errors when corrupt slices are detected during the
> decode operation.

This is already passed as this is part of the slice header that we both
pass and parse to structure. Each slice have it's first MB indicated
(that standard to H264) and you can deduce the lost slice from that.

>=20
> So if we also passed a slice index along with the offset of the slice in
> the bitstream, that should give us enough information to achieve both. A
> slice with index 0 is obviously going to be the first slice in a frame.

We do this in per-frame mode only. The offset of the slice in the
bitstream is always 0 in per-slice mode, since each v4l2 input buffer
is a slice.

>=20
> Thierry

--=-q7XX1/2Re2+2duMofTCg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPaAzgAKCRBxUwItrAao
HFvjAKDefyfuVxzUhiYLWPRfREZ845FmXACgl6U75rVPqfshqyI8GpoLqGYspNs=
=eUpG
-----END PGP SIGNATURE-----

--=-q7XX1/2Re2+2duMofTCg--

