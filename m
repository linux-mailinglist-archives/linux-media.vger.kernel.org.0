Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1B9314FE
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 20:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfEaS4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 14:56:23 -0400
Received: from mail-qt1-f181.google.com ([209.85.160.181]:33857 "EHLO
        mail-qt1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfEaS4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 14:56:23 -0400
Received: by mail-qt1-f181.google.com with SMTP id h1so2199701qtp.1
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 11:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=OF8s8wFLLIKNk3l53fAzYniQ4I8LsDVMIJaUKC/k2oY=;
        b=sA39sDvOrY418P+xobBCHLG53atEY2Q+nTw0C+rvigojoHGAt3ar4RBDnTIHTyS5d9
         TgSNvtrmSetBaew4OYxg7m0UDlhr3sMYRt+0Nd3VFBKUk9piq6EaTfAcKYQgel3/9GTt
         A2eH0qZX2uOn9Zq6IusH0hB7pkOuvwRZOogx42DA/oqH43fdae1o5M6pY218ZNBFiocu
         U+bf7GEf7UP6U9HFu15NVG+OyoZdabjhiJwRBR9Dw4IiKfxVRMLjot0S/NDLsJbsSlDj
         B4lHv9SABIx3/0YNn9Qz8FPRAyIEzX5QZqbaLBVG7MVic4lCQIqswSjC06t+KC1tWNr7
         VW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=OF8s8wFLLIKNk3l53fAzYniQ4I8LsDVMIJaUKC/k2oY=;
        b=iI6vAy/FPi+iCwlb1l7XqjnvhSz99ktEnGSuwnLwgvhoJ7qG/yuFjM4jDUoVldV2Ia
         X3zHyRxlcMy/HFtpreZ5z5OABDqdYXJhFsA7lqFEXiRvUjQy0gijBIxWnpnoRlj0BJCk
         HNoeegL1XLCYad1OgECEOeh2+MFN8X04hA5h7AYmuw/XEQ5r0vkuOzSZCdRff3WNpuLI
         7kcJNdAV17XtRq+7KCzajao+gxbnKfGIKgz/eWlYmukIRjispVtRTwHR1NpB8OVV6Jh8
         EdQsSiSrOdqwQ1uEzKqp4jcwT1XhxUYuhL6kdWH9+HOhLj8zkXLj+pIVlu+dFZVz1PuP
         KB3g==
X-Gm-Message-State: APjAAAWNC3OEErr2N5dUO6d73zmItz8HMWyqILMLk7RZMrAvakFWy8Hb
        e23x4vFPaDNWeqaDll2ZeHLTNq5GGmE=
X-Google-Smtp-Source: APXvYqzCa+NNkdVwHSERZHUV6OFs7hI92lt28aGx+J23M6XhHufWIzcBBB3iatWuUQZPYYgImD5Uvw==
X-Received: by 2002:ac8:35f6:: with SMTP id l51mr10618861qtb.136.1559328982341;
        Fri, 31 May 2019 11:56:22 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id b2sm5480888qtb.7.2019.05.31.11.56.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 11:56:20 -0700 (PDT)
Message-ID: <b3b0b4c03eb672edc2e82e183c84f73a6c906c09.camel@ndufresne.ca>
Subject: Re: [ANN] Patchwork version upgrade
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org
Date:   Fri, 31 May 2019 14:56:19 -0400
In-Reply-To: <20190531124050.3f06e1b8@coco.lan>
References: <20190531124050.3f06e1b8@coco.lan>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-kI7+owTvEHD0O+/AAh0T"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-kI7+owTvEHD0O+/AAh0T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 31 mai 2019 =C3=A0 12:40 -0300, Mauro Carvalho Chehab a =C3=A9c=
rit :
> Hi all,
>=20
> For a long time, we were running an old Patchwork version. The thing is t=
hat
> we had applied some patches on the top of it, and the upgrade was not
> trivial.
>=20
> Today, we upgraded it to its latest stable version. Just like before,
> you can access it via:
>=20
> 	https://patchwork.linuxtv.org

Thanks for upgrading this. A slight issue I saw is that light yellow on
white which is not readable.

regards,
Nicolas

--=-kI7+owTvEHD0O+/AAh0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPF40wAKCRBxUwItrAao
HCETAKCclZvm7F2LenbXY5raaqjNWix0nwCgzYh+4Hlyv27lNqX4ob8mW+vzbVI=
=3Y8X
-----END PGP SIGNATURE-----

--=-kI7+owTvEHD0O+/AAh0T--

