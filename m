Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 382CF7150D2
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 23:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjE2VGY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 17:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjE2VGX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 17:06:23 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1142FC7
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 14:06:18 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-62603efd2e3so17926016d6.1
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 14:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685394377; x=1687986377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIi2UgPYOf4zaHwqQWUqhrK9HQ/3227lMkJh8gF+0c8=;
        b=VbFIibKNICSQMVPvQsfTm0LewvDVb3HtSqxdhFbVfZ7mkc+iEcm3RNN0Q/GkvaB7Tp
         9xB+irANIhzZ/eyErpFNoxLCbtrcgQtzWqu7EnQqlQPjvNOK/mIZDJbQrKtcKDl+ePJP
         7FtKHb5itqbDbjUU1OfPkzeMksHbCPwT3eGWK5u+d9CPwd6mCT6cxS/bXrzIeoJcVrqq
         kxNrQHbL7stH2r3OqIPn6I5DqrQjmkg4WKJXseAnDYuZ78v1xUIVsPxOO+Wswi+EvH7z
         OAJwcE8DbYyi+XuAfhPEcQJkVbpjmjF7ysS0FUnog5dh3v3atCzKJ43+cXSyrf62cWIA
         HcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685394377; x=1687986377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIi2UgPYOf4zaHwqQWUqhrK9HQ/3227lMkJh8gF+0c8=;
        b=h2x68IktFsPX+phvL94zO/7+vlSan34XwKpgcB7XVN5DC52zU7mGBFfPwNRidrtuRu
         EopqU2Y6oEP3lOS55swDFAR18EAglx/5Ju5OtrsS/5PAX9NDRjY/YLnwqJzr4yERqS8P
         u49bj6BRzj0w1rtHjP+qlSD5Fjl5azsPnsE/L+DCNOs4R/M6X9obKfLEmfe1QC1u+9Gm
         1cw1cUo3wEPG6P0KWuTWu2k65VdM7VYetrEzOnuiBnwb32o+1S1E5bPZiks1oboGeVjV
         hqgrPIpJ+w8bABjTBprQt9Hy921e6+C6DjwuAfhTgipMRLheDAmm24gSB8b0Tq1oWjX9
         Xtig==
X-Gm-Message-State: AC+VfDwffnPmgmCLVvZpfLVU9DGv/njMVom4QfBjcSic890v0hGHlxgT
        7hqE3ABHc+rjG09c8RUpBrQiak508txpjT+JfEk=
X-Google-Smtp-Source: ACHHUZ4JOFDcEwhVLywyNAGeEB3mg4jMqs8j9AGEhrV3sg4lDkrl7KFSPp/5Y1UUKZsFAhsVIq7YBIe4M7OVJapSmhg=
X-Received: by 2002:a05:6214:dcd:b0:625:aa49:19f2 with SMTP id
 13-20020a0562140dcd00b00625aa4919f2mr12414054qvt.63.1685394377120; Mon, 29
 May 2023 14:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-15-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-15-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 00:05:41 +0300
Message-ID: <CAHp75VeCfTjw_Lu5SUx6u-O7QtFe2QXvCy2wZLSajJi6WDFiwQ@mail.gmail.com>
Subject: Re: [PATCH 14/21] media: atomisp: Refactor atomisp_try_fmt() / atomisp_set_fmt()
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
> There are a number of bugs in atomisp_try_fmt_cap() and atomisp_set_fmt()=
:
>
> 1. atomisp_try_fmt_cap() uses atomisp_adjust_fmt() which adds the sensor
>    padding to the width passed to atomisp_adjust_fmt() to calculate
>    bytesperline. This is buggy for 2 reasons:
>
>    a) The width passed to atomisp_adjust_fmt() already contains
>       the sensor padding.
>
>    b) The fmt returned by atomisp_try_fmt_cap() is the fmt outputted by
>       the ISP and the sensor padding applies to the input side of the ISP
>       not the output side. The output side of the ISP has its own padding=
 /
>       pitch requirements which have nothing to do with the sensor.
>
>    Both these issues are fixed in this refactor by switching to
>    ia_css_frame_pad_width() to calculate the padding.
>
> 2. atomisp_set_fmt() takes the passed in bytesperline value without
>    doing any validation on it and then passes this unchecked value to
>    the configure_output() callback.
>
>    If bytesperline converted to pixels is > 1920 ia_css_binary_find()
>    will fail to find a valid binary for the preview pipeline triggering
>    a dump_stack_lvl() call inside ia_css_binary_find() and causing
>    atomisp_set_fmt() to fail.
>
>    This is fixed by making atomisp_set_fmt() call atomisp_try_fmt()
>    first which we override the userspace specified bytesperline with
>    the correct value.
>
> Besides this bug there is also a bunch of weirdness and a lot of
> duplication in the code:
>
> 1. atomisp_try_fmt_cap() adds the sensor padding itself but then
>    it gets substracted again in atomisp_adjust_fmt() not doing
>    the addition + substraction in the same place makes the code hard
>    to follow (weirdness).
>
> 2. atomisp_set_fmt() starts with basically an atomisp_try_fmt() call,
>    except that the only atomisp_try_fmt() caller: atomisp_try_fmt_cap()
>    adds the sensor padding itself rather then letting atomisp_try_fmt()
>    do this (duplication).
>
> 3. Both atomisp_try_fmt_cap() and atomisp_set_fmt() contain code to
>    lookup the bridge-format matching the requested pixelformat and
>    both will fallback to YUV420 if this is not set (duplication).
>
> 4. Both atomisp_try_fmt_cap() and atomisp_set_fmt() contain code to
>    fill in the passed in v4l2_pix_format struct (duplication).
>
> Cleanup all of this (and fix the bugs mentioned above) by:
>
> 1. Adding a new atomisp_fill_pix_format() helper which properly uses
>    ia_css_frame_pad_width() to calculate bytesperline.
>
> 2. Move all sensor padding handling to atomisp_try_fmt() and
>    make atomisp_try_fmt() fill the passed in v4l2_pix_format struct.
>
> 3. This reduces atomisp_try_fmt_cap() to just a small wrapper around
>    atomisp_try_fmt().
>
> 4. Replace the DIY try_fmt code at the beginning of atomisp_set_fmt()
>    with atomisp_try_fmt(), this will also override/fix the bytersperline
>    passed by userspace.
>
> 5. Replace the DIY v4l2_pix_format fillint at the end of atomisp_set_fmt(=
)

filling ?

>    with atomisp_fill_pix_format().

...

> +static void atomisp_fill_pix_format(struct v4l2_pix_format *f,
> +                                   u32 width, u32 height,
> +                                   const struct atomisp_format_bridge *b=
r_fmt)
>  {

  size_t bytes; // unsigned int / u32 whatever name

> +       f->width =3D width;
> +       f->height =3D height;
> +       f->pixelformat =3D br_fmt->pixelformat;
> +
> +       /* Adding padding to width for bytesperline calculation */
> +       width =3D ia_css_frame_pad_width(width, br_fmt->sh_fmt);

  bytes =3D DIV_ROUND_UP(br_fmt->depth * width, BITS_PER_BYTE);

> +       if (br_fmt->planar) {
> +               f->bytesperline =3D width;
> +               f->sizeimage =3D PAGE_ALIGN(height * DIV_ROUND_UP(br_fmt-=
>depth * width, 8));

  ... =3D PAGE_ALIGN(height * bytes);

> +       } else {
> +               f->bytesperline =3D DIV_ROUND_UP(br_fmt->depth * width, 8=
);

  ... bytesperline =3D bytes;

> +               f->sizeimage =3D PAGE_ALIGN(height * f->bytesperline);
> +       }

...

> +       /*
> +        * FIXME: do we need to setup this differently, depending on the

to set this up

> +        * sensor or the pipeline?
> +        */

--=20
With Best Regards,
Andy Shevchenko
