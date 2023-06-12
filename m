Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E0972C832
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 16:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237485AbjFLOXg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 10:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237650AbjFLOXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 10:23:20 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E9B423C;
        Mon, 12 Jun 2023 07:21:24 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-3f9eea9d0a1so18176851cf.1;
        Mon, 12 Jun 2023 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686579678; x=1689171678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//gr08G4E9x97zoXLjFQxJE0puyHEflMAsoYK5q/Yyo=;
        b=FjheNVl1afDXFESoQJ7WOmgcvD7DN6iygsjtM0+Y5q2UyQu40IKpT08R0HoMXLe3uz
         pH2CWk12DAF9IE2ZE737sDr4Uzp2wfU6dgEnn6B+8cC1UTrLnUJ4MiLo6V7UQpqs/3y5
         3vGyldCNkjZr9iSJyQnMMKAsnsUWJXeuQxyryKo3xenOoRzwNvWS4D03G60FPwHZ23ky
         i7LA9mfdJFBNHOLhCP6etlY9dcs247ciJ2XybKbRqek5OhVGo/pBurtv/qPmriHRIJBo
         n3/OlnTb51gSrKQ9D4rkNu2IwnVpeQGTev1JLzikJlp6xUHUBItFwXXQXAvqk5zAVpiQ
         +Ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686579678; x=1689171678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//gr08G4E9x97zoXLjFQxJE0puyHEflMAsoYK5q/Yyo=;
        b=Gr+/iTG231yC7vXIdeCUyf+m0Pv3iMVnMKO6z0fxGYNYh7XWYO8qUjwiXoE59zERgw
         LGc7AC+tzwA5IvR11IAH3uft5TzrMg5NFBXOFdU4Fog+sp+w38DVsIN9slL18da4jhIj
         t5y1rUqfgZU30Rq/TUbc/ABIjc76S2yu7F0K5POFQwjYyXWEq8VmVEYB8MQZ+bMfQQY+
         elUndePk8NcmJRQLdQWBZ3wPetPpYgTP9u78uSRPflpEher6tQfyAg3gtz5Pvmqgmkbj
         z7Ediwkw9aCIulEdwmiTRcz/KG4kWIOrEhkysTT+GSnuGoehQOomZK3Ypx5Wsx9/Qn88
         EJLQ==
X-Gm-Message-State: AC+VfDyBxBguXFWXaCoqYWOQjinx34pOUOlw7BKM7ocVQ8WJO25MZQSX
        H85gOhERA1wKJlAZsh2GIJ27KsXknnMd31wz/MI=
X-Google-Smtp-Source: ACHHUZ4g12xl/+ZG+MszeC+uYwvO7EihSH5FLjABuYJrCwARhPwGhQVTuMP+EbEzyNwgWfz9xTj8HTh8iSZrLckWGwE=
X-Received: by 2002:a05:6214:c67:b0:628:ed0e:a165 with SMTP id
 t7-20020a0562140c6700b00628ed0ea165mr11528457qvj.58.1686579678391; Mon, 12
 Jun 2023 07:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230612141632.5232-1-hdegoede@redhat.com> <20230612141632.5232-2-hdegoede@redhat.com>
In-Reply-To: <20230612141632.5232-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Jun 2023 17:20:42 +0300
Message-ID: <CAHp75VfGJLkxsn9C0K1FB5pQ1Bkrsp00mh7MXGDQ2N5nDsL8Xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: int3472: discrete: Log a warning if the
 pin-numbers don't match
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
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

On Mon, Jun 12, 2023 at 5:16=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The INT3472 discrete code assumes that the ACPI GPIO resources are
> in the same order as the pin-info _DSM entries.
>
> The returned pin-info includes the pin-number in bits 15-8. Add a check
> that this matches with the ACPI GPIO resource pin-number in case
> the assumption is not true with some ACPI tables.

...

> +       u8 active_value, pin, type;

> +       /* Bits 15-8 contain the pin-number on the GPIO chip */
> +       pin =3D (obj->integer.value >> 8) & 0xff;

All the same here, as long as the pin is u8, the ' & 0xff' is no-op as
it's already implied.

> +       if (pin !=3D agpio->pin_table[0])
> +               dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d=
 resource %d\n",

%u
%u

> +                        func, agpio->resource_source.string_ptr, pin,
> +                        agpio->pin_table[0]);


--=20
With Best Regards,
Andy Shevchenko
