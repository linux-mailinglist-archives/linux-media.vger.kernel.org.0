Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E16712EE3
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 23:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjEZVYX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 17:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjEZVYW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 17:24:22 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B683999
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 14:24:19 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-75b0df81142so162477985a.2
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685136259; x=1687728259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LhDocfihllz36C8kpXLnxq8knDMrabwWcvhfX5ATgc=;
        b=s0jnCppG+/OmCYznpI+0bfq6rMZppSaEqlcef1pDcsf/7vRgezG/nzPEm63oB2r4jT
         cj7yKwEabioBA2r2IYMOXCBkTEbhOug9vKcPqWem0+WSGjxNC7gLzHJHo2JenY+b1XjS
         oBkF2XW0vpDg/tDOQ5/FpKgXwa+Rx9hxcC2EoGXugSWBstVmCXdgGexrXI1aVSR0lKEY
         BcMg5NUZjSvFYsoL25KwoUiwDFQPTzcwxBpwHwq3BKLd8DbIQmtK1lBN80EEKYkFAH0u
         N+JOoTUQdcQ5xLpnLcYIOQhquUtcBSLrzZO7nUXZ9olNpaRu+xLnfjSTFXXPv2bW2W4u
         uRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685136259; x=1687728259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LhDocfihllz36C8kpXLnxq8knDMrabwWcvhfX5ATgc=;
        b=Eup/K5lb3NdUo6f5vyV7Z0K1ViX5ocMzeMltx1J0XDpV11ZOSVcmX7qWzukmGr178V
         80em4q5Vq6jWQibH3HsHylcNuG5P/+WkK52qlOMXOEYRDT3LVe8i254zxV3AKO/uFZoX
         hSFDggaPfpg0pXnBai1k+K9UfgzhKsx5uVkQ8EiZlLkqaUbLzJCLIYGoHxF+Xo9R3O51
         378nuG3lZ+BwbAqgpw4LdcGnnD1I33ZRrwdCUY2C0Oopv+gZ01F0iQy82ugl0gr7bsg+
         nv1+1qoo6ce0LikEy7lyj2+ijXI1kJEOlzJGEmzL+af3kPiC2Ck36hrxEfFRUzdEktoO
         BXug==
X-Gm-Message-State: AC+VfDzMW1AsUwIeTWtx4f9RV83zzoHX7gw/jEPMeRKzKacsUs/hQlNF
        ijsjWS12B1JPBVkJUjyBlgFfDo5d8kQsUw+N+AQ=
X-Google-Smtp-Source: ACHHUZ4Hd751FpkNiG5f78V0ksaTU31xwpqRWM6Ac3WfwdTZCdyuBBMf6OoKpfIsMd5NFm8/5xkqbO8eirZ2i+6s0B8=
X-Received: by 2002:a05:620a:6888:b0:75b:23a0:de90 with SMTP id
 rv8-20020a05620a688800b0075b23a0de90mr831751qkn.14.1685136258842; Fri, 26 May
 2023 14:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230525190100.130010-1-hdegoede@redhat.com>
In-Reply-To: <20230525190100.130010-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 27 May 2023 00:23:42 +0300
Message-ID: <CAHp75VcSF0VDmsqQQR56PY=CUZ57czZcXgcjKScNDehvJTx-dA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] media: atomisp: Add support for v4l2-async sensor registration
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
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

On Thu, May 25, 2023 at 10:01=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Hi All,
>
> Here is a new version of my v4l2-async sensor registration support
> for atomisp. I have merged all the prep / cleanup patches which Andy
> already gave his Reviewed-by for in my media-atomisp branch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=3D=
media-atomisp
>
> This v2 series applies on top of that branch!
>
> This v2 series is the remainder (and core part) of
> my previous 2 related patch-series:
>
> https://lore.kernel.org/linux-media/20230518153733.195306-1-hdegoede@redh=
at.com/
> https://lore.kernel.org/linux-media/20230518153214.194976-1-hdegoede@redh=
at.com/
>
> The big change in this v2 is making atomisp_csi2_bridge_init() also
> add the ACPI GPIO mappings to the sensors it finds / it is adding
> fwnode graph endpoints for. Combined with making sensor drivers
> check there is a fwnode graph endpoint (and return -EPROBE_DEFER if not)
> before trying to get GPIOs so that the mappings are in place before
> getting the GPIOs.
>
> Thank you Sakari for suggesting this nice solution.

Indeed, it looks nicer!

So far I looked into this series and for non-commented ones:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Patch 1    Adds the v4l2-async sensor registration support
> Patch 2-3  Convert the ov2680 and gc0310 drivers to this
> Patch 4    Removes some now dead code
> Patch 5    Moves the now fully standard / no custom atomisp API
>            gc0310 sensor driver to drivers/media/i2c
>
> Patches 1-4 only touch atomisp code and build on top of previous
> work so I plan to merge these through my media-atomisp branch.
>
> Patch 5 also depends on all the others, so it should also
> get merged through my media-atomisp branch. Sakari may I have
> your Ack for this ?  Alternatively we could delay the move to
> the next kernel cycle and then it could be merged directly
> into some other linux-media branch. Either way works for me.

--=20
With Best Regards,
Andy Shevchenko
