Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4A36352C7
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 09:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236166AbiKWIdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 03:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiKWIdt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 03:33:49 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB941E0B44
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 00:33:48 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id c1so27113425lfi.7
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 00:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GP8l1iGGwn4fXZb322yNmXnMhiWxUfGRTbBa+6nT3ag=;
        b=grLXygJZO0Bx8iiadWbvlKJmmflKTxZ5vzxphVjLy81hMM1SgiQzoo0Shg5BZVXx/F
         da240dF2jq2j4Xp8zhJTt1v1Jp2vVfQQmzJEFar5V/atAsnyb3GcT/KJL6W1fvHu1nW8
         yw+r3yFPUSqyC6iH0gRMvHdIGp68AvndzFoWLI5ly0HDfvbESRyJzKKJGfmNjBTiKPRY
         MAjRWilMYt0kEY66xv3G13NkdGJKnX0Myfa3Xdv/CVzu3UAG96GERGexZo/vVFqtGj7W
         dbqaz/9Bn9UKFTv8CDXCNPVox0sk3G+lAWuuapn8n2/IR9asGZqZbBzzVKA6EbidNFOo
         dDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GP8l1iGGwn4fXZb322yNmXnMhiWxUfGRTbBa+6nT3ag=;
        b=3vjcWhXsLZzyLznenKIxCcMgglXzwgjiIbWRM1jrJ9Ohy5H+02Vph1VzDKv141/qlB
         iw0d+YMl67oM36Dpb9eZ4l0wKRf3tZi+DWmwQ2sr4Ca3N+Hv8cEHBrhHbTjwFt1bkGdr
         Yr9TWe/V2rl5TlVVZNsQMO82D24JrPJSe7gVxyVAmg99IWPfkQ/HrHKgJxWoWFhwLIn8
         ulgGZUUFp415OtjK7zcWgA7Fld7zspKwzFRzSVFekTk0jjaCqyK6XqmSa1qW2BQY5c3f
         hdSy/3PdOYBF5MiAI71WG/KmNJq/e0+ULlDQBUPpFF/eBaBdWwKqtWU4MzvNGxKOyqKY
         hy5Q==
X-Gm-Message-State: ANoB5pmkpNMwMMvty8ON1qyUuV7ciuUdndJmwhsnNpJrsQJ+PsEAeXSW
        osTHOilKiOo8+Na1Cg+CmKo=
X-Google-Smtp-Source: AA0mqf4IYpzUuisugu07V7ZumpJ7U+9y3CR2RHG/v3U5LmMwrWA44BlVBzqXWZzDZxlQVrY6JNPJDA==
X-Received: by 2002:a19:ca1b:0:b0:4a7:7d62:2807 with SMTP id a27-20020a19ca1b000000b004a77d622807mr10479283lfg.77.1669192427925;
        Wed, 23 Nov 2022 00:33:47 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id p24-20020a2ea4d8000000b002790d8012cfsm2121782ljm.139.2022.11.23.00.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 00:33:47 -0800 (PST)
Date:   Wed, 23 Nov 2022 10:33:38 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Stone <daniel@fooishbar.org>, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: Re: Try to address the DMA-buf coherency problem
Message-ID: <20221123103338.238571e1@eldfell>
In-Reply-To: <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
References: <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
        <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
        <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
        <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
        <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
        <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
        <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
        <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
        <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
        <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
        <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
        <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cajiis7amej/mZobkBvjUIf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/cajiis7amej/mZobkBvjUIf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Nov 2022 18:33:59 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> We should have come up with dma-heaps earlier and make it clear that=20
> exporting a DMA-buf from a device gives you something device specific=20
> which might or might not work with others.
>=20
> Apart from that I agree, DMA-buf should be capable of handling this.=20
> Question left is what documentation is missing to make it clear how=20
> things are supposed to work?

Perhaps somewhat related from Daniel Stone that seems to have been
forgotten:
https://lore.kernel.org/dri-devel/20210905122742.86029-1-daniels@collabora.=
com/

It aimed mostly at userspace, but sounds to me like the coherency stuff
could use a section of its own there?


Thanks,
pq

--Sig_/cajiis7amej/mZobkBvjUIf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmN92uIACgkQI1/ltBGq
qqeufxAArV/1qNM1iUdpazc77pVkdR39lQLHZ5KUA/NcbdEnLh1WkJfTIRjChTEO
EuXBSUYEPBxiwU9ig405p8W5fqIzVneFY4yjtHzB1ugVWwxYSrIVvyljQwihEn8g
X4aB+nwsf2Z23UQEcP4Ov+QlzE34zoMS9JDe9JJ7R8TdUbWWRfR0aJKK5ifNcYGi
6YFW12O6XdNRoJ2mwAqiqIGHO5tlP6ADQHOuhEykrn55oAAwsgLkCpDdxTtcwAbz
r98SgI6Km7S8cnQD5y7yR2gPHENM5P5xhS9SU1Wqc7K2pmgVkT22vgtDP3O+yb2h
cy9ASGQw6Eu71V4Gpz8wnVDzGniqCfnug3fC/HpaO/VSbFG1ahI3eb7fGozDOpTc
sOfmr/72BZvq8rkkVroC/psgmY+j8OS8+y/z+ICD6yItPTwIH+EYOLACSINSkx4k
3hQBs2QH2zyBZMg2LbnjYSYJNwVPbboQme15A0y6bCGYKd6ipxr3Gx35x8EC2+jN
B+HQEfKq5K/dXPL8Aiql/sMcjyo16ejQnBbfwMa9UHwUGG9KhWDxYnCB3CrW1z+Q
eDcROSwnY84xDwApp0aIU+4qMST1QMF1oxf5OIjm1JZcVB4Bv7w6RveUa33aCKeb
SJN5+Ot13ubVvPAaEns8vcw9iRdyy50+i9q7MdBHqtTSrJvO1Vg=
=m2RZ
-----END PGP SIGNATURE-----

--Sig_/cajiis7amej/mZobkBvjUIf--
