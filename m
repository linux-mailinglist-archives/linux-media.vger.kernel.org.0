Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E9FEDA5D
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 09:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfKDIKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 03:10:01 -0500
Received: from mail-lj1-f182.google.com ([209.85.208.182]:40974 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfKDIKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 03:10:01 -0500
Received: by mail-lj1-f182.google.com with SMTP id m9so16465375ljh.8
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2019 00:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=jAh4Ir6YI01Po8Rrt302LLjQS0UDCdFC21obhwktKKM=;
        b=I8tP4KnvbmpxTZbccjk5peUulHTdqqnrhm3CQJZR03R9gFZg9ERq8HTOLzUXE0Xfds
         C7FyREpI45XAebUAJZjBXKkfgR/Le+Z/kYkYLbWzsNIyeAIVnKzlIW+TfWoLARTF2pqg
         mLfMdDPk+V22pLjjtYx87cfG4G9tZKsPXYQ7kdKZoWfDgK0LmJMTVDjTuaELIdohA6rZ
         sHNz2V8nI7e/Z7ZgyaH534ks2q2AUtOU7HvU5QXRQ1lbkj7qkyw9w4RkvMd/huZvdxko
         zENyp9yk54vmy9zn9Wh/68m3wbaQgrlquLUW4C39QYEeeQK/CtlZHUUONeXpfNi4Cya9
         Nmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=jAh4Ir6YI01Po8Rrt302LLjQS0UDCdFC21obhwktKKM=;
        b=JrgzG9xB+9VQL0Y69P87gCC4AUPTk9HxnxSdsKMavWnrZZGvlw99VhOjcFCTgMHseH
         lQLr8WxGY+EQB00I08xZcHoHVyk0WjDzt0ttKyFg3GJN1t9XTPGyTgVHbT9hpjujfREi
         IVJe1YGnsGNR0w/qt12tWqueui+tzcRb1ILcYRGLbtoPKEMr341QNbgtTRe7MtEnUMls
         Z0qeMSx/8MOM9Vw48CUNCztefDDvH61bqsSl2mGelhj5+4oNspewwBz0mE/I7dd4kNdj
         vfNIkCFsVS9rYcet4BAKDGaZHQm/b5AlSy8/9RM56/iDlHLKxi8OGA3Na0CwVkSgjeFL
         WQyA==
X-Gm-Message-State: APjAAAVvKVyaOOZ42n0+qBwePUg9QhX5PSB1HNN+s24jPyLnhzgqSZwa
        oatkJa4OjfKZ8COFqDF3bo8=
X-Google-Smtp-Source: APXvYqzQ/ea91+LBbqhPZIBPIxj9ANpVYKHROAVNg0yjsJUdMAW1M/MyRKMVD/KpA4k3GEXtYyq/Xg==
X-Received: by 2002:a2e:9006:: with SMTP id h6mr10374439ljg.231.1572854997069;
        Mon, 04 Nov 2019 00:09:57 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id y20sm10996993ljd.99.2019.11.04.00.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 00:09:56 -0800 (PST)
Date:   Mon, 4 Nov 2019 10:09:47 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Stefan Agner <stefan@agner.ch>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: Re: Overlay support in the i.MX7 display
Message-ID: <20191104100947.4e198e72@eldfell.localdomain>
In-Reply-To: <67057f1082886726268f346f49c23051@agner.ch>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
        <67057f1082886726268f346f49c23051@agner.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e=q1D7mzEva2su.1QAh3bOj"; protocol="application/pgp-signature"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/e=q1D7mzEva2su.1QAh3bOj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sun, 03 Nov 2019 19:15:49 +0100
Stefan Agner <stefan@agner.ch> wrote:

> Hi Laurent,
>=20
> On 2019-11-01 09:43, Laurent Pinchart wrote:
> > Hello,
> >=20
> > I'm looking at the available options to support overlays in the display
> > pipeline of the i.MX7. The LCDIF itself unfortunaltey doesn't support
> > overlays, the feature being implemented in the PXP. A driver for the PXP
> > is available but only supports older SoCs whose PXP doesn't support
> > overlays. This driver is implemented as a V4L2 mem2mem driver, which
> > makes support of additional input channels impossible. =20
>=20
> Thanks for bringing this up, it is a topic I have wondered too:
> Interaction between PXP and mxsfb.
>=20
> I am not very familiar with the V4L2 subsystem so take my opinions with
> a grain of salt.
>=20
> >=20
> > Here are the options I can envision:
> >=20
> > - Extend the existing PXP driver to support multiple channels. This is
> >   technically feasible, but will require moving away from the V4L2
> >   mem2mem framework, which would break userspace. I don't think this
> >   path could lead anywhere.
> >=20
> > - Write a new PXP driver for the i.MX7, still using V4L2, but with
> >   multiple video nodes. This would allow blending multiple layers, but
> >   would require writing the output to memory, while the PXP has support
> >   for direct connections to the LCDIF (through small SRAM buffers).
> >   Performances would thus be suboptimal. The API would also be awkward,
> >   as using the PXP for display would require usage of V4L2 in
> >   applications. =20
>=20
> So the video nodes would be sinks? I would expect overlays to be usable
> through KMS, I guess that would then not work, correct?
>=20
> >=20
> > - Extend the mxsfb driver with PXP support, and expose the PXP inputs as
> >   KMS planes. The PXP would only be used when available, and would be
> >   transparent to applications. This would however prevent using it
> >   separately from the display (to perform multi-pass alpha blending for
> >   instance). =20
>=20
> KMS planes are well defined and are well integrated with the KMS API, so
> I prefer this option. But is this compatible with the currently
> supported video use-case? E.g. could we make PXP available through V4L2
> and through DRM/mxsfb?
>=20
> Not sure what your use case is exactly, but when playing a video I
> wonder where is the higher value using PXP: Color conversion and scaling
> or compositing...? I would expect higher value in the former use case.

Hi,

mind, with Wayland architecture, color conversion and scaling could be
at the same level/step as compositing, in the display server instead of
an application. Hence if the PXP capabilities were advertised as KMS
planes, there should be nothing to patch in Wayland-designed
applications to make use of them, assuming the applications did not
already rely on V4L2 M2M devices.

Would it not be possible to expose PXP through both uAPI interfaces? At
least KMS atomic's TEST_ONLY feature would make it easy to say "no" to
userspace if another bit of userspace already reserved the device via
e.g. V4L2.


Thanks,
pq

--Sig_/e=q1D7mzEva2su.1QAh3bOj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2/3MsACgkQI1/ltBGq
qqdpEBAAmNfygARUAyKcE6MX4N3BWar06RgawzfoTi1vt4pdpOMy9af+ZdogZ+B2
+9rE3w61jZxbutPrcKgdKwjCrNXW36I/fm6bbKPABisU1oE3HU2hW2ccj5jq9iQw
XbZUQ/Dc5qOahtd8p15Da5ur1pid5bkMkhuwlOyMPn4an/q1Kgno2gOdF8P1epH0
U5rHpOwoBiZq3RgRwLbRXs6zbGnte4UCqrTg2EITGAfTK8SsrU9Bimr5qgkCZOwC
oIhLPXHWPPJ/d4DzzfeXoL5wcZsUfWcjxHtpEZFQYpb2f4lhXUSh5Vh6Q4YtObyM
DTtMuNzBJVt5JoJFoQ+qqbGoJjfAwWTMcXG4BX0oUytYb6hJRymfmTSXWzRhwWMK
xeO9ss0fWkMwepN+e6mhq0CcgzUvy1Grw4+nsOrniXFMh3/dAPseF6hmmC0dIDBc
IOnN7fg19QBXjvHuYbr0EmyYTLxohRTb2b3bC6O9qQ35ntqDkjAkqNgGqnIzh4pc
mW4gggTzq5K71jIcAnfhW04SnDqGvZxau02Ho97uYFZnuAF8ty7KBiQAnok6Y3nA
bcruCDV9BL7F7wbtb5M/lh3w7PWGmUI4AeSKVFP+xS5XQBVpycpXVv/t7Kza9eud
SOWtvLQse0nKRt3NIRn8pcwaO/NH4z3ud3SDBr4a3n6+BINvrJI=
=uT+K
-----END PGP SIGNATURE-----

--Sig_/e=q1D7mzEva2su.1QAh3bOj--
