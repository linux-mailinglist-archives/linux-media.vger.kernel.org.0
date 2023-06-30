Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A840C743D36
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 16:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbjF3OJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 10:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232717AbjF3OJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 10:09:31 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8EE2680
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:09:11 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so3059307e87.2
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688134149; x=1690726149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVGRufNculx7xMBXbh/mgyyW0SNYQElz9JgiQrm0XxU=;
        b=pbd9xlWm1hM/wHks/3ODZnKfUmPeX09zyGrxbnEoQ8d325PGPR0rhabOYwJpCXGnmr
         9+nodHnteITwsFVH10v4Bww1JpdW9l4Ppnop/BNV65jtuaCzBFfDF5eML+Nfpgs1sOyN
         UCg4vsqoQ76aOKMBFjIVsRXg9A0Gs59IoaWfoOkmTjhN2sM0YvaF+Ppffv4ckUy49N/i
         o7KNHcimKE+Vuxyi7SzhfhGUF/mVextdMCUwPD3Y/CPodnkfAOsaNV+qmauf+jI737KL
         nBtC+7gjLn5bTpiTDG4Dszc5KBFkau8KMLxWumA9qrOlSDYrK6nYFTl8JI+FtBULraxr
         qBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688134149; x=1690726149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVGRufNculx7xMBXbh/mgyyW0SNYQElz9JgiQrm0XxU=;
        b=l9LmSVBCTF9VlDX8nEhhsKeojlIlbqw+e6WA/0lAJX/OKurgrIJr9qvotcOMiQkVcv
         MqjE3P3llLmT6qsfuLfNIBQat2LxM244CuSwYGKqwcFCdrttddn++8uKy27EYeU2it30
         kCD3alCUGBRi25O79W4ucXwWpQGrG/K0zc3SdoltAVObRW1JjJivxzSD2BV7hJ1Ay3T5
         IxuJJ3z50k5nnGODMyCWpplQ0QMxOrkp9FHJdU1nXuw2TocVDhJpEhYa1Sy86CLFRIu4
         1TFNLjzTyGTcZq+5oJvrTElAcLiQZzcPGsf8tbaupeuGL6MVtYy/0SrlF1AnMxI6ugeB
         QV3g==
X-Gm-Message-State: ABy/qLZQ6aXoREGVVqWOYUPrIhNDVVYkcV4+U2i/5mgFJwwq1Y8TGYB7
        l7Ja3jUrFN6Ey+SM2QxGFJGxCerRaqtoZFehrOc=
X-Google-Smtp-Source: APBJJlEdWKL2cNBXpPL7yFL5KZ18GhEjAaUT3Na7xPG6msbZ0kFZT3sMoRHhJYq2qUxvEmvcvX/q/XdpleAatQwHtlY=
X-Received: by 2002:a05:6512:3e27:b0:4fb:8616:7a03 with SMTP id
 i39-20020a0565123e2700b004fb86167a03mr3195020lfv.4.1688134148814; Fri, 30 Jun
 2023 07:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110643.209761-1-hdegoede@redhat.com> <20230630110643.209761-5-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-5-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jun 2023 17:08:32 +0300
Message-ID: <CAHp75VcdP67ETJhy-2mV3TfC0e=awMnv_du0CkaHFuGubB8R3w@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] media: ipu-bridge: Allow building as module
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
> After commit f54eb0ac7c1a ("media: ipu3-cio2: rename cio2 bridge to ipu
> bridge and move out of ipu3") the ipu-bridge code is always builtin

built in

> even if all (its only) consumers are build as modules.

I'm not sure I understood the remark in parentheses correctly. All of
its consumers are the only consumers of this module?

> Fix this by turning "config IPU_BRIDGE" into a pure library Kconfig
> option (not user selectable, must be selected by consumers) and
> re-introducing the CIO2_BRIDGE Kconfig bits in .../pci/intel/ipu3/Kconfig
> which were dropped to still allow building ipu3-cio2 without ipu-bridge
> support.

...

>  config IPU_BRIDGE
> -       bool "Intel IPU Sensors Bridge"
> -       depends on VIDEO_IPU3_CIO2 && ACPI
> -       depends on I2C
> -       help
> -         This extension provides an API for the Intel IPU driver to crea=
te
> -         connections to cameras that are hidden in the SSDB buffer in AC=
PI.
> -         It can be used to enable support for cameras in detachable / hy=
brid
> -         devices that ship with Windows.
> -
> -         Say Y here if your device is a detachable / hybrid laptop that =
comes
> -         with Windows installed by the OEM, for example:
> -
> -               - Microsoft Surface models (except Surface Pro 3)
> -               - The Lenovo Miix line (for example the 510, 520, 710 and=
 720)
> -               - Dell 7285
> -
> -         If in doubt, say N here.
> +       tristate
> +       depends on ACPI && I2C

Can we leave

  depends on I2C

line untouched?

--=20
With Best Regards,
Andy Shevchenko
