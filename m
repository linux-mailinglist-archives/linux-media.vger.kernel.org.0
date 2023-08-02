Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D926176D802
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 21:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbjHBTiM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 15:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233881AbjHBTiD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 15:38:03 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E645213D
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 12:38:02 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-56ce1bd7fc4so72868eaf.2
        for <linux-media@vger.kernel.org>; Wed, 02 Aug 2023 12:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691005082; x=1691609882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQWBYItDM3IpMYj280RjhkrKn4zwz2mAJ2QKY3r7sCY=;
        b=dLxeoQv15cRZRqH7c0jR/6veDK4uPtMWr3u+CFxaR4Zwz5A6rlMyfLcCh60pZNrv7e
         3/try1jP/2YrlYriBFrgdPS8kyjY8WPdHG8Ree1VAbhJfX5nldLmpXR/DO8liTElZ+ks
         WX2HzzHA8sxaDMnJbM81Fd80ijTBTZ4bs9fzMeOkoYt5MRRsjLYbqZ/DqdDl+UMRwrKT
         6oGPJoFNWKIvRflOzK8xsVfNI7HbtFkTwaRVmBOi3PulNqIeTRvZ3qZMzWKjmKR+WR1i
         qloNwyi+ST5oPmh6loU2O4fJ/YAAbznFQJbdR8u9Z6vWFoUO4v/IEJssijMx4Rwhol+d
         OU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691005082; x=1691609882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQWBYItDM3IpMYj280RjhkrKn4zwz2mAJ2QKY3r7sCY=;
        b=GdkedcCgA3510iIo8qLL00izF6OZ80aCliME7PS+bbRd5UbWBu74lbPClsxVswAFx2
         e0tpPfPZb5FmzppZpvmm2b7xyGHw3QNPQhrDwPoWT9F5fQcXiNr+FokAY991a+RlNtx3
         pVuv8bnOYHp8bgAsTme6bk2tUuE1nvEjd5/Ozd90VKD452IMMI9PSz8zHLhFcFeV5POD
         usGHQkqmweHpi2iICQfAAQqEkkngAzzMuDqFXp3JxQQvSu152uEDREnKtigFDu2CntQe
         c9sHwC75kgw9hPEIwbAUeGkVayb+wKjUdeekzuqtYE8beNgKdYHr3M9GxxY9oU/giuSg
         WmMw==
X-Gm-Message-State: ABy/qLZDuQNE5vrVVEf8HlJFcR6j4U7pYcaASoh7lTU5Hvu+SwB4pMiD
        fAYrnu6PFFJnQQ5lrLy3XMCUDPbLRqNBko4R97g=
X-Google-Smtp-Source: APBJJlGc+Xm46RrnjzDUi1XginMvYLT3uk13HEQK2R7mHIUEoqxNWY9JmY2q+xJWIMqYzKbnmjteRS5pcVn86qE+VKE=
X-Received: by 2002:a4a:8299:0:b0:565:cf26:5a10 with SMTP id
 e25-20020a4a8299000000b00565cf265a10mr12550397oog.0.1691005082212; Wed, 02
 Aug 2023 12:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230802173046.368434-1-hdegoede@redhat.com> <20230802173046.368434-22-hdegoede@redhat.com>
In-Reply-To: <20230802173046.368434-22-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 2 Aug 2023 22:37:26 +0300
Message-ID: <CAHp75VcxOTP-rdWy5CVq4m-DPCoB3fuGfBf5uP8sxqBa4v1WRQ@mail.gmail.com>
Subject: Re: [PATCH v4 21/32] media: ov2680: Make setting the mode algorithm based
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 2, 2023 at 8:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Instead of using a long fixed register settings list for each resolution,
> calculate the register settings based on the requested width + height.
>
> This is based on atomisp-ov2680 commit 0611888592df ("media: atomisp:
> ov2680: Make setting the modes algorithm based").
>
> This will allow future enhancements like adding hblank and vblank control=
s
> and adding selection support.
>
> This also adds properly programming the ISP window and setting
> the manual ISP window control bit in register 0x5708, this is
> necessary for the hflip and vflip conrols to work properly.

...

>  struct ov2680_mode {
>         struct v4l2_mbus_framefmt       fmt;
>         struct v4l2_fract               frame_interval;

> +       bool                            binning;

You might save a (few) byte(s) by moving this to be the last one.

> +       u16                             h_start;
> +       u16                             v_start;
> +       u16                             h_end;
> +       u16                             v_end;
> +       u16                             h_output_size;
> +       u16                             v_output_size;
> +       u16                             hts;
> +       u16                             vts;
>  };


> +       sensor->mode.h_start =3D ((OV2680_NATIVE_WIDTH - width) / 2) & ~1=
;
> +       sensor->mode.v_start =3D ((OV2680_NATIVE_HEIGHT - height) / 2) & =
~1;

~BIT(0) in both cases?

...

> +       width =3D min_t(unsigned int, ALIGN(format->format.width, 2),
> +                     OV2680_NATIVE_WIDTH);
> +       height =3D min_t(unsigned int, ALIGN(format->format.height, 2),
> +                      OV2680_NATIVE_HEIGHT);

Wondering if you can switch these to use min() (with a strict type checking=
).
It might require adding U/UL to the respective constants.

--=20
With Best Regards,
Andy Shevchenko
