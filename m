Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96C794D4751
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 13:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235637AbiCJMxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 07:53:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbiCJMxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 07:53:40 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FB313D42
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 04:52:39 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id w7so9257509lfd.6
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 04:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=KecklTzUxsTn1dI/iNil2JTRptVyGgMUnWchsg5/ZhQ=;
        b=P61i4YgcoqrGDRMhgV1s4b0PZZM5vvV0pzB0NrtoDNDU0WC0rtFt9SLgtYahW4gnOw
         tbJpNis2gG0HWgd6aNIaU35OkV7WXFnLIE71WPuqVuj7CP6gITqYRhZK90tRCQqB/3Uf
         jdTriCP5SodJjaa4MwrfMpFXVNJ1XOOUAgGwA74PwzPtbyYqOhtXRyISb39KHyIxMtgf
         NwXaryvz8BLgXo+T4U5Z1vcEFJTA14uMtAKEMyvehdb9zmkuVn07tJYHDqa5aq8gRw2H
         Zl2gzGrjCWJ1yxrs8ArdsUsIAuwZ2023MvMCzBXprLcSeGHvo/zVptO8DvegdKc2VeE9
         z4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=KecklTzUxsTn1dI/iNil2JTRptVyGgMUnWchsg5/ZhQ=;
        b=eip8pLzkTKOxtGZ+4H7t0LBXIWh0OHUJldfzfEeRELGvaqzFaE3p3I+BtvVQ9uQExx
         4Adk3UyqOUqzfbBnYTIVYWp7/9EiLQkBrwCTl2FD8T16S6Cvi2BxBxzrc7N89b/jtRuc
         V2leL8ABjdPZOihAmhykrM/sl1LNPdr+qE+/62/GoIKuhaImCYhjdoTGGG4XWB/TUMfi
         rhx0wrXHhEzA0KqYIwzW4d2CQ3DMUPLYYUd934O6t1m8StceL8/Ylh53lIgk1CcZfkK0
         1ojPfCzdnmjZq8srqw/PLFqfcigSvNyBFPXH/nlm4jmtMRXnvdmJvwYD1xIpuRDgyJxV
         ETOQ==
X-Gm-Message-State: AOAM531bgzUhqz7s58R0Aud3uzUHgPbqoyEOiof79SolJZaXhehllx16
        njOatI7pGlta0Mk0SN7pUTE=
X-Google-Smtp-Source: ABdhPJyGLi1cJBcK8i/nXWuD6TGCF7jOkZ5xlk18mnEjpR+7SJ6YyX/vHPt8GxUEG3UhI9CbUuQQZg==
X-Received: by 2002:a05:6512:2828:b0:448:2339:591f with SMTP id cf40-20020a056512282800b004482339591fmr2847999lfb.274.1646916757650;
        Thu, 10 Mar 2022 04:52:37 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2424d000000b0044859fdd0b7sm694768lfl.301.2022.03.10.04.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 04:52:37 -0800 (PST)
Date:   Thu, 10 Mar 2022 14:52:34 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Shashank Sharma <contactshashanksharma@gmail.com>,
        linux-media@vger.kernel.org,
        Shashank Sharma <shashank.sharma@amd.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Message-ID: <20220310145234.42df05be@eldfell>
In-Reply-To: <537898d2-3168-b4b0-abb2-81a2b184ab55@xs4all.nl>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
        <faf5be22-07a2-f928-085e-1a1e2aa01b12@xs4all.nl>
        <20220308163053.70c81c0d@eldfell>
        <ac619e70-bedf-8855-f3e5-7f2aa3dc4f17@xs4all.nl>
        <20220309160933.78aba02a@eldfell>
        <0504cf48-ee7f-3de8-fc3b-5e5b14aeeed1@xs4all.nl>
        <20220309175713.7eecddae@eldfell>
        <537898d2-3168-b4b0-abb2-81a2b184ab55@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BBFbTvcYXAEQfYaX0vH6l0B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/BBFbTvcYXAEQfYaX0vH6l0B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Mar 2022 17:00:37 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> Hi Pekka,
>=20
> On 3/9/22 16:57, Pekka Paalanen wrote:
> > On Wed, 9 Mar 2022 15:45:29 +0100
> > Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >  =20

...

> >> CI is already done: it's build every day together with the kernel medi=
a code
> >> and v4l-utils in my daily build. Results of that are posted on the lin=
ux-media
> >> mailinglist. =20
> >=20
> > Nice, but that is after merging patches, right? I was thinking
> > pre-merge. =20
>=20
> Not sure what useful pre-merge testing can be done other than just runnin=
g 'make' :-)

To ensure that patches that are not intended to change the output
indeed do not change the output, or do not introduce crashes. Other
popular tests are checking for compiler warnings against a specific
compiler version, and commit messages e.g. for S-o-b if that's used.

For example wayland-scanner (a code generator) has tests in the Wayland
test suite that verify the output for certain test inputs does not
change. The test inputs and reference outputs are committed into git.
If a patch intentionally changes the output, then that patch also
includes changes to the reference output files. Simply reading a patch
will also show how the output changed.

But your test corpus is huge, and this method does not scale up to that
directly. You could maybe have a few chosen test EDIDs for this, but
running the full corpus needs something quite different. Maybe the full
corpus is best the way you do it now.


Thanks,
pq

--Sig_/BBFbTvcYXAEQfYaX0vH6l0B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIp9JIACgkQI1/ltBGq
qqcR0Q/7BAyIEuIJotZ5k6zdkf0kyrSZ9ogb+L725C7XFgR+yWDPaJM7P1XszbkH
TpNFPU9R65ysOG9jWBC25LDZ0ayEsNmOu3nBhokMCSbFxFs+87Tu7T0ZM/gHAlSp
JhAnigEmM3c9hMAvCU73Yq8gw5Ub6GLxe5cISX1JhzPJZY1/LqM74EqnS75FT+jY
95C3Qi8D6MCS1qr6Y6uJVKPc/pa5QoaDRc7Cn1W5G3f9jTjYMwqzt+KvVb81ljzM
3iOv/SGcgtw9VBsyRn7Jz15KNIOgYUJXgbRXPtfpoH+EYh2YDptUCt99C8/Y40iQ
BxDRwEPQzB4rZlq9BWC6QQrVl5pjmYBTOHDU6izfc5DBrXk4oYsP98ChBZr7Xu9I
ujlWiPlVBDflz0psMHC17CFlJPS3phLEiVIfbEBVF83GZEE8nAcLXKCbcwtJKwoz
/w+Ku5hHP525+wCyICroCl/X0zyVSo8/d89jyPBvaRL5RiRX4Kh58qXhjBuhHvLS
ZR7CJNLNmlt3fBN6o7Q51R/ssOgLWq4jD12uKwv8Pkk9GuPrvUuTZT5T/k3Pu8OY
O/hdtFNi4ZdDKiqx92NnD9EYGMwkUTHaf8AxaJx7Ph/f9h25dDGJQXdRjSvHlpIF
t9feqqKPP7tmfoIwPL6hAqi5N0SBHFJ/j8wyIi+i29IuErfCmbQ=
=584K
-----END PGP SIGNATURE-----

--Sig_/BBFbTvcYXAEQfYaX0vH6l0B--
