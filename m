Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA39B48D52B
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 10:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbiAMJtZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 04:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbiAMJtZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 04:49:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E16FC06173F
        for <linux-media@vger.kernel.org>; Thu, 13 Jan 2022 01:49:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ABA397;
        Thu, 13 Jan 2022 10:49:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642067362;
        bh=aEWXauqWqOpI1f8qgJfK14VUaEozVdXRx55yg68nNPs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=q0TjwYYIKhKmqUo4Y7Rz9E9YWdCHis9UliPH36pUpLS6iCa/PIP7Md7P7iCjC2J6C
         vcRPR7LKEj2D2Qa6pzZ/B412ekoOmGT6vDux8pZsngNHm39mh9z6d41/AZ1q2uWfDx
         FPthjVeZmKMS9C4jrm4NsMdq57ig19iKxRNFMkoo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220112122809.9244-1-dlp@qtec.com>
References: <20220112122809.9244-1-dlp@qtec.com>
Subject: Re: [PATCH v2] media: docs: v4l2grab.c.rst: change unintended assignment
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Daniel Lundberg Pedersen <dlp@qtec.com>
To:     Daniel Lundberg Pedersen <dlp@qtec.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org
Date:   Thu, 13 Jan 2022 09:49:20 +0000
Message-ID: <164206736017.10801.16432071785442911966@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thanks for fixing up and sending a v2.

Quoting Daniel Lundberg Pedersen (2022-01-12 12:28:09)
> Example should be comparing errno to EINTR instead of doing assignment.
>=20
> Signed-off-by: Daniel Lundberg Pedersen <dlp@qtec.com>

I think my tag from the previous patch still holds here for the change
itself.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

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
