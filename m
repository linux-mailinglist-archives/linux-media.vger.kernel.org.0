Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC6D6D5DAE
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 12:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234392AbjDDKjX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 06:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbjDDKjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 06:39:20 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76549171D;
        Tue,  4 Apr 2023 03:39:13 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id eh3so128611837edb.11;
        Tue, 04 Apr 2023 03:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680604752;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TAuZ0PtqVxheJX/XYIa5i4oZ4FXMmbdGspIEeO9eUw=;
        b=bgyCThAF+8sMIDcasIh8qSZ6FAcAjCDfLXxzuuotVVkJIyTRRxDa+eSmuUsKEA7iLj
         lrnsRhWkKneIigE0RwZsthL7h+BI/ZnlgEoMZRezQun9D2Hgcn3rLt6X1/q6hATzdAXK
         AZFBbOx+U6NPmVyqXn8IsnZ3cVWuWKZC+ANq2K4UP3EhScpl0NlHpOLzZaiwBhSmt1P+
         5H8ZCLryyDbZ+8y0w8+9KnyYJZmuSGhCqLDHM0g4hD/cushyjxmtEnrlWLVBfyzTentm
         B6YyZWu3pZZWup9tlBQUwvv2zvwxk/Ugt/G2NwpMPyEXmF62N0ybTHUXT+x+Mt4gMn+T
         Tq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680604752;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TAuZ0PtqVxheJX/XYIa5i4oZ4FXMmbdGspIEeO9eUw=;
        b=g0C0I3J+OtcLtvnL9lczQRq4RDzHB8ptXwYtI3sf+rrZaARk2RyUC65XKwRSPi5J+x
         6FwNS6UDV1eMQGRsFMwvn9bO6WUh0Zycr4N7W84+YKPqkqKMbauF+RaXqIAyuQ5WB83S
         b39b+5v3olzlFwP47m+lyrEEhvAGKyNQ3RXnV+3VUeLqfFc9mfUUjliL9LzQmQ6P9Ida
         3mJlb5mBYAHSXNMGiEnyMRE3Oq+O/WrsYyw6vTqFPF+4h7OBp6g/aQlDHkEJII4fZv8i
         uGy89fgZ3i+XsFg8B1KVwSGN8cjpT9W0qd82vGEFH2jShI97216qAhfu+Hzbsg9DGXFJ
         SJlg==
X-Gm-Message-State: AAQBX9cKWoGvZtHGX9+4nw+91wjTszrOm2a4AHK9Mcrpxal9DnpS5MT5
        PDE46g8NfeYq0R+CXgrSYiE=
X-Google-Smtp-Source: AKy350aIS/qxzfWTte5DntlDSUzLqJrxd469YnglrNx8o7gMuZnHY5R9pwDwGKxEmiCggwCN2qNVOA==
X-Received: by 2002:a05:6402:1611:b0:501:e22f:86b9 with SMTP id f17-20020a056402161100b00501e22f86b9mr1922202edv.36.1680604751865;
        Tue, 04 Apr 2023 03:39:11 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s17-20020a50ab11000000b004af7191fe35sm5726232edc.22.2023.04.04.03.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 03:39:11 -0700 (PDT)
Date:   Tue, 4 Apr 2023 12:39:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 035/117] media: vde: Convert to platform remove callback
 returning void
Message-ID: <ZCv-ThTIKwSfa04P@orome>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-38-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="B6X9HR6LpXW+mtR8"
Content-Disposition: inline
In-Reply-To: <20230326143224.572654-38-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--B6X9HR6LpXW+mtR8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 26, 2023 at 04:31:02PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/media/platform/nvidia/tegra-vde/vde.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--B6X9HR6LpXW+mtR8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQr/k0ACgkQ3SOs138+
s6GKPA/+MBOnENM2ZHI9eWMwJrKYN73vSF7agqISx7bWAgVX73nqugtTbPQLQZZN
hDrdM9ZKaGXM+cgpSDDkMXBfaq/Dm02l5aFE0/hs8oIQS/FyqQg0hqkCoW7BfFek
pdYyGTpW+CUWWc3f12MIw4r401XyfJxJzjV8pw0VupJpPWiGxRabuh9m23MmeTm4
lzT3lc3CnEorX86mm2HI5UnLX0Zk86WH9QBkF8CcJsUfv0fM0YKA2KQxghHulJ8K
4TQ3EgUnDOMA6qnUpIPt8lPFDwnxMpxeQjrhCLbjjRFI6nu1wfMuF82cYopw/Ol4
ndnI6/wP4VMOfJ0XjpoKLWMLUv19NX6+iDtLON3voY1ssGPu/svl4k0KjYZ7PMnT
5nDvM9JFrpAK/6o3mtMtzGV3x7ge7+s5gu/lLzfAODK3Npwfl/kZI4EIRw8rmchn
0+EV4ZCwuMpmGCFy4ahJGuufCW6OxNRcZVHRFE3TsCPBwcjBIqLTZNZsnucFTCjc
LwuZ9WB3plV2hgrBIK0VyyUSUR3cR+9wEiXnM7dGgnfOdMUbK6+/pQOGBPcmDv0F
f7cP09r6ec+iGlU4Q/X4qitn6OJk3i1pSQHeEyUFb6IWSyWbXq5WKuFwIt6u2Ug6
Fo0npGuvOKj+zJoixu6yInwv+EDmckuCZdhja8OuHmEDdY9gBCQ=
=Qywk
-----END PGP SIGNATURE-----

--B6X9HR6LpXW+mtR8--
