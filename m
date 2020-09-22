Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3E9273CBC
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 09:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgIVHzT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 03:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgIVHzR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 03:55:17 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07514C061755;
        Tue, 22 Sep 2020 00:55:17 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id nw23so21422381ejb.4;
        Tue, 22 Sep 2020 00:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P22t681K3K6oM9ouAXbMdzIDaBOSsnrR2/jvxdmlo8A=;
        b=ddOEu0ndSoHiNRkDH4m0ehG4Ha8b2DU4nBrrIRUXJ/rfuKmT0GhCRIbd7t7ELXvZRF
         2RVJwAu4O7pVmUvqNR3OAVnIxp36BPzl+9ih3TNcjVDZHxHT71KH0gs9Rlrt2bm5RW1G
         7ZqgnThRMgRjQuUtuVK5KZ3aazv5F4+b56D51vihtxrsrTPn2kdbRio8XaMZcrENXW6k
         HhpcM/Wa49QnPOD1Dr3xdztR5oyg0SI/bK25EYKQOMsQJxJxwIL5EWkjvu8JmvC9ccJO
         soDpFgQySGaodBzlslvDN33XxzUA+s6i/DKUxnTLB6tjXLeTEu2y/A7LelE2h3ycJAKa
         ui1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P22t681K3K6oM9ouAXbMdzIDaBOSsnrR2/jvxdmlo8A=;
        b=B3Wuj0KdC2ygJo6H5yOTfVUaAfWtimP1Rdd+XnIgo6LK0yGG8dq/PJPNPQrqre6dmZ
         BMoWEKC5OTH4kxR0S0t8Naemm20w/4q1XjlcdF2ut334tn4QWsMkWC7OXZqW6PAz2BHo
         irWSC0A45tLNmqonirVGhDwHPt61EQMivW2BPFs9wPwd+4cAZF3gUkiQupAoUAneTWJP
         1qDBQeBZFWYQi1nLamu8B5goPDqR09MUL2N0LXzORFsqFbhRW3LnWUQokiddswYGmym2
         bgRWlM7c9+A1z3hjvTNHjXdQhquFDln+1K5YsvEma9zXcW8fZK5zxJObtxPoODHlUi8B
         Iqbw==
X-Gm-Message-State: AOAM5332gOJEENkoAl2Og4ncA9ulv74q7BbPrcS6FcaJjx7E0U4sih4e
        UQBb8kW2Jn0uoEZ2kauFDUabbRJUmT8=
X-Google-Smtp-Source: ABdhPJy8vy64IVPhwycK7YOML21tKq21KM+H8NPb2W1WboMLYS6Odg+ZcjowDtsPkTHswNddMbrPTA==
X-Received: by 2002:a17:906:cf9b:: with SMTP id um27mr3615010ejb.66.1600761315744;
        Tue, 22 Sep 2020 00:55:15 -0700 (PDT)
Received: from localhost (pd9e51aa4.dip0.t-ipconnect.de. [217.229.26.164])
        by smtp.gmail.com with ESMTPSA id w1sm10254124eds.18.2020.09.22.00.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 00:55:14 -0700 (PDT)
Date:   Tue, 22 Sep 2020 09:55:13 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        jacopo+renesas@jmondi.org, luca@lucaceresoli.net,
        leonl@leopardimaging.com, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] media: i2c: imx274: Fix Y_OUT_SIZE register
 setting
Message-ID: <20200922075513.GC3994831@ulmo>
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
 <1600724379-7324-2-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline
In-Reply-To: <1600724379-7324-2-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 02:39:37PM -0700, Sowjanya Komatineni wrote:
> As per Sony IMX274 Y_OUT_SIZE should be the height of effective
> image output from the sensor which are the actual total lines
> sent over MIPI CSI to receiver.
>=20
> So, Y_OUT_SIZE should be same as crop height and this patch fixes it.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/media/i2c/imx274.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9preEACgkQ3SOs138+
s6H1PA/+LeZXqaxZyKg9s/EErvQKGgMPicukSNVbRPXQCUGOhErP8ofOj81WZL8X
cNx9hRf+8JsgiSEro2JFe2wywp8ltH+n0j/GIrM+LNz2GRxiEzrR6nyfVA1dMD1u
mIgGD3m63nzJogmkwkDEueVK/YjOpMvkj2EUQbxuPE8DRNazKSGm6gj+/JaruAG3
JMHwiIfoK5+ex1WsIkanI1ozcQheN7HOsOC3+5cwaqeiV373Q162x7upW9c9++vj
ER54+MhetaqR5hXYoQ8AlOD8XGOUfpD97tHNWnuBAfp2PfUVnpJlXUMQnq6entNA
jQfnviG420JoIjumkfZgOpfswX7TMJlsk++l9cLNGPQav4L8joYvZTycDunVmV8x
nNQ84ippNR2/CueI1imyWOprc0WAqj9xFcrWsP32/FieQ2kSwXYy+vpKI99b4U6E
XbmXIs3KZNG/hlhAhSOrayFwtCvCbT5fnInH5dZqQSSkBKHlloz+FRq+UtyIRKHE
VDbYceLFJ04CXVtO/2MJdSqKHJsYymFCOdLlAaTm1sdV/hZV19ztNafASpzS+JoY
xYQ0LTh70AW6TNx05hlmg6CGZCNkiJslJS1Dh1qux1SKRggyr0ytMgsAnT8W6Xho
S7IxxMt5Vh/4S9mUEAWDV+RP+60qbtM3eaQYtF4Gb4tzVAAXqnw=
=Q3UG
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
