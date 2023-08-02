Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 834E676D818
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 21:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbjHBTlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 15:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjHBTlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 15:41:24 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA9AD9
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 12:41:23 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6bb07d274feso224064a34.0
        for <linux-media@vger.kernel.org>; Wed, 02 Aug 2023 12:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691005283; x=1691610083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0FWD+U2LDHtrMPlYQ90Igdt+uxvF4o8M/4AeLWa7g4=;
        b=NqNHnZ4aqioHfHQYw4IcXiXfXLwVQ4fkWdK1+KmNMTpUibQK553A/CTYN0rLyCrJr6
         Ik7FHeEJya3RpnlWhscFwM/xg3fOKnl13ml8bANriYErmtQJCs8t5rCojhdQ/6ukMuhI
         fprShT2EmT7cR9LshXHAH9y0TdDRi9FApISvklPSyhJP/e+FQq3QTYy0n78qCKF0gQmj
         nvcwtKBdEdzAykQNgw1sZiUPjL2HVrA0wYsia7SYdDibNZPp0sc0qzKG/DbCVWM5q5+d
         HAENXT5KRhiNhEnOHtuV5jrJ3B3CJpZ0rH3luCop0h7n1llmdGZmlSHyD8MLhSZCyrSQ
         K3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691005283; x=1691610083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0FWD+U2LDHtrMPlYQ90Igdt+uxvF4o8M/4AeLWa7g4=;
        b=Ilw5qX6JxpN85otNhB5NkgxGUKRC+jKS+ZjybJtkQCHUggXltEuzx5eQqa2WkRVoWV
         ThdTXwHZvkGFQjzv3HzmyGbv9lT50oxTWgMrMRImn2cFmuFuE5j+H1Qe0eBKr21+pv6f
         QPDK0pkwe1I+jpHNQfNPVS4xQwXcO9qMNwvO4DG66wOlhDwfQGyrSFe47enkPEj4IbNn
         YtxZSVXB89SpyqhutTDEjaXUQbFC8vht7j4j7SaOn26H9/9XwbBjPC8a28EpFmgnipWE
         MAt9jUC70Wkpci5FfpWrWopYQcClZ/eY+MKiDpehgOqDWxjDYSaLTm7ksU2FgvdplPkW
         R+8g==
X-Gm-Message-State: ABy/qLY3Gehtz8WBWXRi1sOIOWEqNBEZmiU/5ME/A4axsxm7S2gD26FQ
        5Gg5yj4lIkVwSCcvqgmatqddASeBvpR7tgNMxAM=
X-Google-Smtp-Source: APBJJlFfBYZlvCMt5w/705mdjZ7QJ484fVmGgMwhNu/MO0xj860j4L1sJvjii2dCCPGbSpsvq7GtIYdw8rc4U7YTjyc=
X-Received: by 2002:a05:6870:5690:b0:1b7:43ba:3249 with SMTP id
 p16-20020a056870569000b001b743ba3249mr19393896oao.3.1691005283194; Wed, 02
 Aug 2023 12:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230802173046.368434-1-hdegoede@redhat.com> <20230802173046.368434-24-hdegoede@redhat.com>
In-Reply-To: <20230802173046.368434-24-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 2 Aug 2023 22:40:47 +0300
Message-ID: <CAHp75VfH6YBgp49+mkcZcSBS7kghvK3Cxatq_MARS1t+E3E+hQ@mail.gmail.com>
Subject: Re: [PATCH v4 23/32] media: ov2680: Implement selection support
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
> Implement selection support. Modelled after ov5693 selection support,
> but allow setting sizes smaller than crop-size through set_fmt() since
> that was already allowed.

...

>  struct ov2680_mode {
> +       struct v4l2_rect                crop;
>         struct v4l2_mbus_framefmt       fmt;
>         struct v4l2_fract               frame_interval;
>         bool                            binning;

>  };

It might be useful to run pahole to check if you can make it shorter
and for how many bytes.

...

> -       width =3D min_t(unsigned int, ALIGN(format->format.width, 2),
> -                     OV2680_NATIVE_WIDTH);
> -       height =3D min_t(unsigned int, ALIGN(format->format.height, 2),
> -                      OV2680_NATIVE_HEIGHT);

Ah, short-live min_t(), but still...

...

> +       /* Make sure the crop rectangle isn't outside the bounds of the a=
rray */
> +       rect.width =3D min_t(unsigned int, rect.width,
> +                          OV2680_NATIVE_WIDTH - rect.left);
> +       rect.height =3D min_t(unsigned int, rect.height,
> +                           OV2680_NATIVE_HEIGHT - rect.top);

And here?

--=20
With Best Regards,
Andy Shevchenko
