Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195F61D9D63
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 19:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbgESRAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 13:00:47 -0400
Received: from mout.gmx.net ([212.227.15.19]:55225 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728725AbgESRAq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 13:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1589907565;
        bh=3kGcF2WlvSw8bGxCId+mveFxPfrt8ZeCxWDEYopxkLg=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=lFVFyUueNYbCYsI0ZHKMplHkSj7COiLcPsjC5WeypZ85z5RuwMJoLXrNagwHjaLt/
         6pHKCXDP5KNdQTjLIFvtOlekjuJR/4y16giJA0ru822y73F9FxLRK6EOsN7DkPw1u/
         X02r1LjB+YBY5wDyKGFxulFg8y//f4lPhEePY4Dg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ubuntu ([83.52.229.196]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M7b6l-1jgrPk0ZEj-007zZt; Tue, 19
 May 2020 18:59:25 +0200
Date:   Tue, 19 May 2020 18:59:11 +0200
From:   Oscar Carter <oscar.carter@gmx.com>
To:     "Lev R. Oshvang ." <levonshe@gmail.com>
Cc:     Oscar Carter <oscar.carter@gmx.com>,
        Kees Cook <keescook@chromium.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        kernel-hardening@lists.openwall.com,
        linux1394-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH] firewire: Remove function callback casts
Message-ID: <20200519165910.GA3187@ubuntu>
References: <20200516173934.31527-1-oscar.carter@gmx.com>
 <CAP22eLF2Q3O+=tnHRKE5q=jn9gw2G1rjAKiewM4qGsf4WYvP0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP22eLF2Q3O+=tnHRKE5q=jn9gw2G1rjAKiewM4qGsf4WYvP0Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:0J0WtcfxzxFR84Tcrgx30v/9Nawjh8IZRpCrftihGrTqQzOKRSG
 PitIITQ6EIR4P7ZxPWADYT+xpl4GjpOv305jmagTza1M8Smuw8See9+u4kx7K1qZ81u10vx
 XaV4hQ6f6gcisxdp+ifA0bu5KH39ciBB/QtgLw7+JCSSpvr3Nv1T4keImRi+O3dI8l3yqtl
 mNS3zOx8oYUGTJUa7u2+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eD9m8/+8xhQ=:+q/C9d6cPE4qJiSZKCXvO4
 hWf4bTDr2rlIi6H5bRDj/GDab724U/FkITmQ/UloFTuJOV3Mbz4mzbFsQTskz8772li9wi/Hi
 E4sgR45NS5HBJfRIkcA4JYYVU65xsTQ4ugZLWCOi+vPuGC+v3i9acpkWGIBbMFi1HV/4Gva0a
 p0fD221QzTcOpecD/5MjeQPAaxWp9ICimNaGg5UD2XOQYu6O5zAicpI1OSBCbSf7QJ3w5Ap7j
 mT3zTR8ytagSBDuQG/7u80PhUhcv5g2Kizu0gJ+/X2kt9yPgT1F9jpKeAFPs1imn0uHX3Ip/s
 VWgtCNhP8+LSGBGQsPE0pCry5S7p0XWVqAYDDtRT6gMQvQE1QqXbe2QB6YPqLEJSIj0XqM5vV
 gft2LtAVZJ+Pbd5lzlKXHgYA3TZTsNBrHJHy+xvY5+t7jyP19zpKadRyfWCep2yGfuY/dg7Uz
 sgBQ+sL/kEGzNn6iYf5wok67j0xrYmEncwuDspB6H/AYbgw65md4p/Swqh48p0ddm0CaqfN+U
 edtsUZXYXyBZ367B2DLmtJMQQDk6uZeZ8KuPmKpWL6vKFKmJxV8a0VCXUVgfEXfosV5k0yD85
 AMdv2BDbY72OgD6FRARq/qp1+vbzXfndCRh9LieUeZAzgZy1tC+oPjB/B4xuzSpr3Kca5tR+C
 5IElLwr4XTb/83IW6f2SZWHakY/7AgBjdxS15audEE+mStXOoOmWW2fg39O2L7QoYuC3M46ky
 8mUEILgywUyiHFFHokEUiGtajfr3JghGqvISBS3raZX15r76DkNBIt63OpuiQL0wJMBAJE4ue
 eyC+TH8S3AfhZLGxjKyDve9XvVm02agPaJU+hEsKMMPtYpikeNx/QRUTm2wxcFzEl45WpxnYO
 N/ZOmCvEu6ui6i8j8I7PPuxDim2r49HUwbnByQOnikctTz8B4p7rJdKEmXfyfUfTxpQKmNkPx
 1JMM4Xcqu8rQGswIwaCy4AU8PS2YLng32qVg/+SdCycp2q1TLo/XWJ5VRUa0NulIYVpevya2j
 3k+26flYB4idzhAzjVrXeRlYRpkqzCGbModPIj0Dx9N1I1NAJ69ED+//SazqHz1HtK8DcHGN0
 F9IK+DXYYbJgD40g2uIL0J+BLNbk2LL+j6zCakssiYjbP6eIAJmJaI3cQqwWlKTRHzPSqqP4U
 8YntOafyXiCt8Sc4llHHjcMNlkaIB1N0JoQkW9Yk/9j1tc2RiXr4rBv17nCleJ6Br9VQm2n8Q
 0Q6DtG455oyXZtWN4
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, May 17, 2020 at 07:43:21PM +0300, Lev R. Oshvang . wrote:
>
> Hi Oscar,
> I would recommend to explicitly set NULL to _cb and use if elif to
> exclude the case where botm _cb paraneters are passed as NULLs :
> > +
>   ctx->callback.mc =3DNULL:
>   ctx->callback.sc =3D NULL;
> > +       if (cb_sc)
> > +               ctx->callback.sc =3D cb_sc;
>
> > +       elif (cb_ms)
> > +               ctx->callback.mc =3D cb_mc;
> > +         else
>                     return -EINVAL;

Ok, I will do the changes you suggested and I will resend a new version.

> Hope you get the point.
> Lev

Thanks,
Oscar Carter
