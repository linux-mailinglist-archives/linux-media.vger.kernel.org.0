Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3062743DA6
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 16:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbjF3OjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 10:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232543AbjF3OjI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 10:39:08 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FCF3A81
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:39:07 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51dd0205b2cso3320874a12.1
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688135946; x=1690727946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UFB87q2kv8WaQOK3N2yemLotG6FuDt2f/A2jhtIoDw=;
        b=Cs+sO7YKmvVcUYO+9dx87zV3i0zsTjn/8sY+0qsEXY+ppfXcm0xVSkBJJxwpb1lydm
         R0QxwrsHo5ghKP7Rkh5D8LneKfv2txKh4id0BDds3PQ/3nGcZ3Vy01cMfK7tqEbwsu72
         cg2+KQXLZFlzr04rXtfD0PKJAchbXVhzudSQqm8zE23mWoAVTUe2A8PDmhtSa/zVrIx0
         DE5cDo1x73+Dr6BBOMQfffOFJLg8zgQKka7ZSmlvgYVk3gWCFAtjY20nLsN47yhMxRMZ
         eUR+5zbjl6Np0QozocZXRp4djl1La2Svxx02+L6PC6OyQfl1obrB3NQPXhKNjCRrJe8P
         gDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688135946; x=1690727946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UFB87q2kv8WaQOK3N2yemLotG6FuDt2f/A2jhtIoDw=;
        b=SEimpoLD1pkQWRTTgXZkwbUemnY1DwVbZVTmLTZaM2SXk5YI/gkUTMMrn//59P3aOP
         vLAoWaSAdopk2Ro1udubS2+7DKiAKh/V+fGpFHMxMgCb07b4TSRQHOfQ3ljBC8nk8rJe
         8lEIhRA2NSzdF+uzCT7TDUFodqFE5hHjmKX+wf8zQ1G05KDLiQbEHtHzZDHbHr58AfoY
         x0V+rYeI9Ydz82dZBFnnzXJtpWdPEpfEq2UIjYGnuL8ZB7vmGDSwLaXRKcM5oB0Vxkz+
         p3PriRJAQGcAjlyYYr0DvEfzdveGVNYJM7UZe/amy0z+87bxwstYukHgSjFs8igTJRtR
         ME3g==
X-Gm-Message-State: AC+VfDxm9ZheEzF6w7P7UvEagojtSrJ92UdUbJE+hYbDaiwOmqKMG+en
        wojvyjhGxzjv+BBJFqRkvyjLV/9Pmrpm+ztYBLA=
X-Google-Smtp-Source: ACHHUZ6QtHYNa0x/Mcbb7OWl4iEN/o3ZtEJSizEcOkZl96brYL0oVcWlp9o2oYIy2tLek76Ul7S219IuejJLBNBYQuE=
X-Received: by 2002:a05:6402:4486:b0:51b:cd0f:562 with SMTP id
 er6-20020a056402448600b0051bcd0f0562mr6826929edb.4.1688135945536; Fri, 30 Jun
 2023 07:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110643.209761-1-hdegoede@redhat.com> <20230630110643.209761-13-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-13-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jun 2023 17:38:29 +0300
Message-ID: <CAHp75Vdp6TQOdX1Jq=bL=SJ_27nAzpnQGV+NauXYQM2UjSfqNQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] media: ipu-bridge: Add GalaxyCore GC0310 to ipu_supported_sensors[]
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
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

On Fri, Jun 30, 2023 at 2:07=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The GalaxyCore GC0310 is used together with the atomisp no various

on ?

> devices, add it to ipu_supported_sensors[].

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/int=
el/ipu-bridge.c
> index eb7c56e8ef9f..07a34f20af8e 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -36,6 +36,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
>         IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
>         /* Omnivision ov13b10 */
>         IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
> +       /* GalaxyCore GC0310 */
> +       IPU_SENSOR_CONFIG("INT0310", 0),
>  };
>
>  static const struct ipu_property_names prop_names =3D {
> --
> 2.41.0
>


--=20
With Best Regards,
Andy Shevchenko
