Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8640A747FF2
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 10:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbjGEImc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 04:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbjGEImT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 04:42:19 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814A81732
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 01:42:17 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51d7e8dd118so8055361a12.1
        for <linux-media@vger.kernel.org>; Wed, 05 Jul 2023 01:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688546536; x=1691138536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FglXjk7aBuZtPrvgUm360HH2ph7F/WhD4X1K/nNCPYs=;
        b=WH6ps54Tnxe03BOcq4exV6+OxPPmMyiB9PZGOp3Rg4VnFSZLGYk0wGCyCy5E/QIJ5P
         EIgVeoF7L/eaf95xL+hLK65mebxfHQSh2p8CVkjYgJXHFhs2gnCltC8kcfuvhJtsySSU
         IZV5LWFoR6qXqRx+btaGfHGpbRi54O+xBUQufjyrqnozeZVu2rSqnl56d2vXb5bGWZtT
         HlcjKSc08/pSsFmeVQ+o6YTYhbOrQ0YhveqEcK4XI5bv9htMMqqVLWeAqS7FuPHQzMq1
         0NkqeXaBpbLHPTrw6WvH3r7C361XmcVAl0XqLPKWm8LZkkCxPvosyzNso9fAYon/oEko
         U4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688546536; x=1691138536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FglXjk7aBuZtPrvgUm360HH2ph7F/WhD4X1K/nNCPYs=;
        b=UuIFg3PD4lMnqa44uNzeqI9PfmFlpv96OBhnORO04QhdTAPOxUJkd5RzqOgD8+5WwI
         n1Ux5CFAWZvAVrPos7SI8rqntrgigmdGjm2o46ULHpfQOdeioku0khEokpHzK0zD+7qi
         T39sEWPuMQ+Fvx5DFiwA/qJoNAsRFOOJT1w/BKKAjKjxytEB9fPYnCQSgyOIUZdtRdQo
         aTll/mXM/aENzT6w07AZIImAPQDwQi7xwIJFobvP8/alQPOMaF9pgnR//dY84/cUBpy9
         rnURVUkcSvClsW0SDvAqu3FQ9AGZ9DGYaG8r+L76DlMlj1rFk/bprsrotSdOBjgwMJMN
         /7bw==
X-Gm-Message-State: ABy/qLZhE94t07BMK4YrqBnrZJ7eZqA0KcYwUxrtdc1oDjNs3VvpXAEB
        tG32OygHlX+KM6R8lePDSTrUnVN1WxKKlOJOYtA=
X-Google-Smtp-Source: APBJJlE79mbIANcVNkklRVAWNI/gfYc7vg1RgPjvYhkepIn8Plp9mG6UiawUxlgkQAYY/j0ccXoqHMUMcjhib2lRg0A=
X-Received: by 2002:aa7:d8da:0:b0:51d:9232:2b5b with SMTP id
 k26-20020aa7d8da000000b0051d92322b5bmr13123663eds.4.1688546535802; Wed, 05
 Jul 2023 01:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110643.209761-1-hdegoede@redhat.com> <20230630110643.209761-14-hdegoede@redhat.com>
 <CAHp75Vcp9aoKOw-gPeXvJ9VuO5nGN=g5HHjAxWwNyNzo6J2Amw@mail.gmail.com> <26ce49af-1267-0a9d-5eb7-f15a94395328@redhat.com>
In-Reply-To: <26ce49af-1267-0a9d-5eb7-f15a94395328@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 5 Jul 2023 11:41:39 +0300
Message-ID: <CAHp75VduNtkTQDsKxivxET6XNw=riZr8ZYA2hUz=bOqOGYCGUA@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] media: atomisp: csi2-bridge: Switch to new
 common ipu_bridge_init()
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

On Tue, Jul 4, 2023 at 10:21=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 6/30/23 16:45, Andy Shevchenko wrote:

...

> >> +               dev_err(&adev->dev, "Invalid lane-count: %d\n", sensor=
->lanes);
> >
> > Yeah, I think we would be consistent in using the ACPI handle to print
> > the messages from ACPI sensor devices.
>
> I do agree that we need to be consistent, but I regret having switched
> to using the handle for this in the csi2-bridge code. The dmesg logs
> this results in are much harder to read. Most devices typically have
> 2 different sensors and normally it is quite easy to see in the logs
> which GPIOs, etc. are being used for the sensor.
>
> But after the move to using the ACPI handle for logging the logs
> show up prefixed with \_SB_.I2C2.CAM8 resp CAM2 rather then with
> OVTI2680 and INT0310 making it much harder to figure on what
> is going on (first need to do
> "cat /sys/bus/i2c/devices/i2c-OVTI2680:00/firmware_node/path"
> to find out which path belongs to which sensor).
>
> So I would rather get rid of the handle based logging, because it
> is very cumbersome to use.

I see, you are right. The ACPI handle may not be the best for Linux
kernel drivers.

> I'll add an extra patch to the next version of the set to switch all
> the logging to using the acpi_device for logging.

Sounds good.

--=20
With Best Regards,
Andy Shevchenko
