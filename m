Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 859796D39F3
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 21:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbjDBTOJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 15:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDBTOI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 15:14:08 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6800826A6
        for <linux-media@vger.kernel.org>; Sun,  2 Apr 2023 12:14:07 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id ga7so26458527qtb.2
        for <linux-media@vger.kernel.org>; Sun, 02 Apr 2023 12:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680462846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5v9GlX1T7ZM1sBgeii4HjL7yxvfpgxFNmJU4LIcBn7I=;
        b=a3FGW9JxiJPGrj08W/SVrKDz3RYlqTwwM3J6EODEiFEWXgguVJmFMNB92g54bszws9
         LADuqy+ddIWoJt0m8n2tRNkwYBv69gx4s2LPtEmzEgPQ0rBDDgygPG7tuZ5YPkGdOfq6
         MkvreOPfi7rS6yz+9+7U8M4NwDVA8U4E7ana4AkhZQaXiRiNL0YeyDhaF4IIyVzuD3vt
         H2Pg6s7l7G9/5/XWP67lgBVRCTBcLddrJqtZooI/huStcC0hoKu6UzfmY3JwfPAsjJqX
         RqLedHdnZEL7qNr5chNYV5PP8GhuGRdaclhrMSleeYjWtmfhsXqD9Dj/V4JLdhqrXkgZ
         eMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680462846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5v9GlX1T7ZM1sBgeii4HjL7yxvfpgxFNmJU4LIcBn7I=;
        b=a9f455xETLuJwAmcYMmeU0QmCKgq3pDRRJlUmVRbuTDkzww+6CjQY+vrz1Obqxj+8Z
         29VA0+YLsJY54cXwzbxXyhgFuNyRzBKCLVGk7hgy5Jb4cEtL0XdVUWdH3QTxnBQHuYIP
         8fGyfnEtfX5AvC8oAposdqTRt9gm+VZevtAoeJvTsxE2X/vwSKChTvONmGqoOgcq2Iok
         0dIy1i7pVq6Ai/cRIyZcuvdc679iZNIryS0EZ/BTnOVIWAZzRNBwCHtZ4sbqDQpFxDRt
         k20ibLgyW7a2m2uPmvmvqhV1BRjbVl0BbP5EfiwQTNH3n37pn/lxowC2hOI5Y+gSR+Vf
         1IrQ==
X-Gm-Message-State: AO0yUKWasnq8gBvjdrwdY76B/rL9gqIgj5+obKPA66CiH8EivvX/ylt8
        bHe2f/oGSWIwumJVOq/f36gt1cRmpd9rZ/CTKZY=
X-Google-Smtp-Source: AK7set/J3ZuetDvEIfnxajUZIDdEnzej4WLxI7Z3rJ4otOxkOG/elIxSZuspm9fmQuwZHIGd7EhXdJXkBzkYhx+GzMg=
X-Received: by 2002:a05:622a:199a:b0:3e2:efb6:9d9e with SMTP id
 u26-20020a05622a199a00b003e2efb69d9emr11632222qtc.0.1680462846534; Sun, 02
 Apr 2023 12:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Apr 2023 21:13:30 +0200
Message-ID: <CAHp75Vd8kcr0YCU7_oCSc8YqW5ZarP4RpQLexGV10A-auZi=Fg@mail.gmail.com>
Subject: Re: [PATCH 00/28] media: atomisp: Further sensor rework + exotic
 features removal
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 1, 2023 at 4:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi All,
>
> Here is another set of atomisp patches from yours truely.
>
> This basically consists of 2 parts:
>
> 1.  Further sensor driver modernization to work towards using standard
>     v4l2 sensor drivers instead of atomisp specific copies
> 1a. For some sensors some GPIOs have different polarity depending on
>     which board they are on and the order in which GPIOs are listed in
>     in the ACPI resources also is not consistent between boards.
>     Fixing this without relying on per board DMI quirks requires parsing
>     the results of a special Intel ACPI _DSM. Add a new
>     v4l2_get_acpi_sensor_info() helper for this
> 1b. Convert the gc0310 driver to use ACPI runtime pm instead of relying
>     on the direct PMIC poking from atomisp_gmin_platform
>
> 2.  Further work on removing various exotic features, specifically
>     prep work + remove support for streaming from 2 sensors at once,
>     as discussed here:
>     https://lore.kernel.org/linux-media/5309d845-063b-6dd9-529d-0f8265429=
0f2@redhat.com/

Traditionally, for the non-commented ones:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

For the rest depending on the severity of the comment. Feel free to
add my tag where it makes sense in your opinion (no discussion
required).


> Regards,
>
> Hans
>
>
> Hans de Goede (28):
>   media: atomisp: Add v4l2_get_acpi_sensor_info() helper
>   media: atomisp: ov2680: Use v4l2_get_acpi_sensor_info() for the GPIO
>     lookups
>   media: atomisp: ov2680: Error handling fixes
>   media: atomisp: gc0310: Remove some unused structure definitions
>   media: atomisp: gc0310: Remove GC0310_TOK_*
>   media: atomisp: gc0310: Simplify gc0310_write_reg_array()
>   media: atomisp: gc0310: Remove enum gc0310_tok_type
>   media: atomisp: gc0310: Replace custom reg access functions with smbus
>     helpers
>   media: atomisp: gc0310: Remove non working flip-controls
>   media: atomisp: gc0310: Remove read-only exposure control
>   media: atomisp: gc0310: Drop custom ATOMISP_IOC_S_EXPOSURE support
>   media: atomisp: gc0310: Add exposure and gain controls
>   media: atomisp: gc0310: Add error_unlock label to s_stream()
>   media: atomisp: gc0310: Modernize and simply set_fmt(), get_fmt(),
>     etc.
>   media: atomisp: gc0310: Delay power-on till streaming is started
>   media: atomisp: gc0310: Add runtime-pm support
>   media: atomisp: gc0310: Use devm_kzalloc() for data struct
>   media: atomisp: gc0310: Switch over to ACPI powermanagement
>   media: atomisp: Remove duplicate atomisp_[start|stop]_streaming
>     prototypes
>   media: atomisp: Remove continuous mode related code from
>     atomisp_set_fmt()
>   media: atomisp: Remove custom V4L2_CID_FMT_AUTO control
>   media: atomisp: Remove snr_mbus_fmt local var from atomisp_try_fmt()
>   media: atomisp: Remove unused ATOM_ISP_MAX_WIDTH_TMP and
>     ATOM_ISP_MAX_HEIGHT_TMP
>   media: atomisp: Remove atomisp_try_fmt() call from atomisp_set_fmt()
>   media: atomisp: Drop support for streaming from 2 sensors at once
>   media: atomisp: Remove struct atomisp_sub_device index field
>   media: atomisp: gmin_platform: Make DMI quirks take precedence over
>     the _DSM table
>   media: atomisp: gmin_platform: Add Lenovo Ideapad Miix 310 gmin_vars
>
>  .../media/atomisp/i2c/atomisp-gc0310.c        | 999 ++++--------------
>  .../media/atomisp/i2c/atomisp-ov2680.c        |  33 +-
>  drivers/staging/media/atomisp/i2c/gc0310.h    | 416 +++-----
>  drivers/staging/media/atomisp/i2c/ov2680.h    |   1 -
>  .../media/atomisp/include/linux/atomisp.h     |   2 -
>  .../atomisp/include/linux/atomisp_platform.h  |   2 +
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 356 ++-----
>  .../media/atomisp/pci/atomisp_compat.h        |   4 +-
>  .../media/atomisp/pci/atomisp_compat_css20.c  |  89 +-
>  .../staging/media/atomisp/pci/atomisp_fops.c  |   9 +-
>  .../media/atomisp/pci/atomisp_gmin_platform.c | 289 ++++-
>  .../media/atomisp/pci/atomisp_internal.h      |  20 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  64 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.h |   3 -
>  .../media/atomisp/pci/atomisp_subdev.c        | 111 +-
>  .../media/atomisp/pci/atomisp_subdev.h        |   6 -
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  36 +-
>  17 files changed, 844 insertions(+), 1596 deletions(-)
>
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko
