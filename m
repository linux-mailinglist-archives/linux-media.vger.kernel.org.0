Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7318148B428
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 18:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344138AbiAKRki (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 12:40:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55612 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343983AbiAKRkf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 12:40:35 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4CF9340;
        Tue, 11 Jan 2022 18:40:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641922834;
        bh=unsOPN5uRnvfu4mw3ZzfkPgBAGkc3Q9S11AaXfySRRU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UHuBqpvKxWuM0ZnBMK4P0LUJ0vJkPIOBRAtFTn0TgkXjQjEl6++GEKflWya5hvQ8m
         Y7oFMjlEixKRcNjW1hd8j6Ac99thDK5QwOtGIysm7zzZQ41rZECeISymyzVF9MeThG
         qGXickBrjddg5nEuVuqgHkgevoMTwtbYQ7i/93yQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220111164855.147487-1-dlp@qtec.com>
References: <20220111164855.147487-1-dlp@qtec.com>
Subject: Re: [PATCH] media: docs: Change unintended assignment in v4l
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Daniel Lundberg Pedersen <dlp@qtec.com>
To:     Daniel Lundberg Pedersen <dlp@qtec.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org
Date:   Tue, 11 Jan 2022 17:40:31 +0000
Message-ID: <164192283176.10801.16438722671029975593@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Daniel Lundberg Pedersen (2022-01-11 16:48:55)
> Example should be comparing errno to EINTR instead of doing assignment.
>=20

Ouch - that's not helpful in documentation indeed.
Good spot, and fix.

It might help to say 'in v4l2grab' in the $SUBJECT rather than 'v4l' as
that would be a bit more specific.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Daniel Lundberg Pedersen <dlp@qtec.com>
> ---
>  Documentation/userspace-api/media/v4l/v4l2grab.c.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/v4l2grab.c.rst b/Docum=
entation/userspace-api/media/v4l/v4l2grab.c.rst
> index eaa0f95048e7..c98a78d63a8b 100644
> --- a/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
> +++ b/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
> @@ -134,7 +134,7 @@ file: media/v4l/v4l2grab.c
>                             tv.tv_usec =3D 0;
> =20
>                             r =3D select(fd + 1, &fds, NULL, NULL, &tv);
> -                   } while ((r =3D=3D -1 && (errno =3D EINTR)));
> +                   } while ((r =3D=3D -1 && (errno =3D=3D EINTR)));
>                     if (r =3D=3D -1) {
>                             perror("select");
>                             return errno;
> --=20
> 2.33.1
>
