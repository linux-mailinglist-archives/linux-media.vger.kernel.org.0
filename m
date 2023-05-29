Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5DCD7150C2
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 22:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjE2U6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 16:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjE2U6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 16:58:30 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB2FDC
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 13:58:29 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6259c242c96so19147396d6.3
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 13:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685393908; x=1687985908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wex1t4p8vc5FHp3UocS2+D8jLYoXryO1xiW8fbqf3SQ=;
        b=LUSe00oWaC756W4tMx+vWytCq53z1oDgkr+RGBoPhz0DzV2sBi5QflnZWM0WXQX2DT
         Q2i4QiZBNKm3X/lSycNAUG/BCuejWLJAOakAA3vrAXkZQ6Ta+OQA34P9/1Okc22zRqY5
         6Ey4/3zCMBvTobJCAOgoRSzJt3d0EmPr1JaOejirrHOw3AGURU8yZWi9A4lzxnEakoM0
         3XtRVkNtRzPCChGSTWD7V8NObUveGBQ34i2oUHaZNlmJ7FswSJajvlCzo7Di2EnCh9jI
         WBbcPQ7tBbKlZ2kPoWsq89nNXP4Q/ShdUJtvTPweg2itW4/jQc1I06Zfgf1DSg6+WQYn
         RO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685393908; x=1687985908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wex1t4p8vc5FHp3UocS2+D8jLYoXryO1xiW8fbqf3SQ=;
        b=guZXkgmgJ9unF+Ny119obg/m8qgEwMT5Z61IWPWFwQ3iecPeCNuKmh2Tr7wWhK/1po
         05S+lfvE22p50xHhU/1ayy7omy/kCXUu60bmZ7aIg9qkOUCK78pD+h+y6yW3E/m+da9A
         2WiQtWWqQGbY7HXeKXmgAfjTdrxtgale4ESzuS17dW3nCBb65F/U9mywuOiPPasf7IVP
         HDA5PGdEXfUAXSecODLwl5/r4Ld16tj8AK1c3rSSakQK9qLyyBQIaCzGIy59kPOvtmrg
         tBosdNA3vBVg/PVGQ6co9nMnUcXTLLCl0pJH41CRrR+Oczmio0C9qxZ7yJn/Ye9u290l
         EYRA==
X-Gm-Message-State: AC+VfDwkNDZngjYhf9zuCAKpcVqxr4b98WOALIR+m7KrbFxorXn+Ll/D
        VssZn0OIxSj9XlcSaeakFQAKibMpAzq6HW/LvjqqqC+hIuM=
X-Google-Smtp-Source: ACHHUZ53yeNLpZonvK+ffgfB1KtH4mOfKrjFv5Ox1XzovUNIfKqOqT5j2xazTUSW00vp0r7iH6+VWG4rAlflvczltLE=
X-Received: by 2002:a05:6214:d8a:b0:625:aa1a:b6de with SMTP id
 e10-20020a0562140d8a00b00625aa1ab6demr10725931qve.64.1685393908685; Mon, 29
 May 2023 13:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-14-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-14-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 May 2023 23:57:52 +0300
Message-ID: <CAHp75VfOfSs=mH90yusTwD1uVA4pLabvPSiZPbw_o9JuNnMR-w@mail.gmail.com>
Subject: Re: [PATCH 13/21] media: atomisp: Add ia_css_frame_pad_width() helper function
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Factor the code to go from width to a properly aligned pitch out of
> ia_css_frame_info_set_width().
>
> This is a preparation patch to fix try_fmt() calls returning a bogus
> bytesperline value.

...

> +       /*
> +        * frames with a U and V plane of 8 bits per pixel need to have

Frames

> +        * all planes aligned, this means double the alignment for the
> +        * Y plane if the horizontal decimation is 2.
> +        */
> +       if (format =3D=3D IA_CSS_FRAME_FORMAT_YUV420 ||
> +           format =3D=3D IA_CSS_FRAME_FORMAT_YV12 ||
> +           format =3D=3D IA_CSS_FRAME_FORMAT_NV12 ||
> +           format =3D=3D IA_CSS_FRAME_FORMAT_NV21 ||
> +           format =3D=3D IA_CSS_FRAME_FORMAT_BINARY_8 ||
> +           format =3D=3D IA_CSS_FRAME_FORMAT_YUV_LINE)
> +               return CEIL_MUL(width, 2 * HIVE_ISP_DDR_WORD_BYTES);

> +       else if (format =3D=3D IA_CSS_FRAME_FORMAT_NV12_TILEY)
> +               return CEIL_MUL(width, NV12_TILEY_TILE_WIDTH);
> +       else if (format =3D=3D IA_CSS_FRAME_FORMAT_RAW ||
> +                format =3D=3D IA_CSS_FRAME_FORMAT_RAW_PACKED)
> +               return CEIL_MUL(width, 2 * ISP_VEC_NELEMS);
> +       else

All 'else':s can be dropped.

> +               return CEIL_MUL(width, HIVE_ISP_DDR_WORD_BYTES);
> +}

--=20
With Best Regards,
Andy Shevchenko
