Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD6B6DC525
	for <lists+linux-media@lfdr.de>; Mon, 10 Apr 2023 11:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjDJJhb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Apr 2023 05:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbjDJJha (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Apr 2023 05:37:30 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291994EE6
        for <linux-media@vger.kernel.org>; Mon, 10 Apr 2023 02:37:27 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id d10so1459817qka.3
        for <linux-media@vger.kernel.org>; Mon, 10 Apr 2023 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681119446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jthNyQkmn9jVGfXHEJznswalLNKHvuA3wBbZAlFBgM=;
        b=ixlyzKwk9nLyfIFudo2nN6bGufDge92EL6hb7lFtW8wPyI2OUoGFi2sFg2fVhw5/tv
         6GarRqhTrOLIJjiEaF5LuxL09mI3Ijz/f/qu15qi3BB2JDZq5cbXKIIynrCKvVsZplGF
         M+U0D6atE/P8TZdmmTQiUrLeSLzE3ccME9+gd9xhvuH/GB2QA+NWqp6HgfQprb43e6eC
         C38dEdkQhcgjnTLO4T5b52t3TdE+nwz+TBMOf/RaQI2WhcKI4C1Rd6b8D2k+tlNe/1xJ
         hfUNfQ8m/eb2iskySHp1h0vhtQBtAGIcpybf7k4YPYiqbVugsOoGnUiPZupl8CQLOn5N
         ThKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681119446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jthNyQkmn9jVGfXHEJznswalLNKHvuA3wBbZAlFBgM=;
        b=7A77T667LgPQYUQObvqsy3D5uvae2xT76FeRKWpcmLHJmjJzcrg9Xt1mmqYQ90i9Iw
         I1dyh1utLYVssvT+Eg10IES1DntVpImJCFBmTSxT3QsMngugGtGej2VF9ixnxRduZX4N
         N7SNA/S+6OGqJNDjwqov+8gTcoJq2I739s/TLIVQ7NF2q++Qro9VFCCMpgy6EU+QDSbf
         yKl3la5NTuMINJFv2R614ETp6Qo7H/VdscFP0iSpSFkOHVssi1yMHBRyFw3cVGejk7YG
         JsvJSGEJgFx+sCEl7bFFI+E4VE60woyXmjY0EmJ73kZunc6U1PTbNc991hQDB33oFd4v
         x1Iw==
X-Gm-Message-State: AAQBX9dgHSZZYwKfP2elwk+ISir8rH4On8ERHgaAsqZw1NuxkQ10q2pu
        aNW40PSosjjJhPj7Z8kUHRxmlnnLoiZPlF6PQzZ8+LYaczg=
X-Google-Smtp-Source: AKy350bk1n4WY3nxbMaUru+S3zykyBQmFjYm2yrfkUptem2sQyypM5XJ2uKLGPb7Jhl9NtswVe0FPV3XUbitrDTXbMY=
X-Received: by 2002:a05:620a:400a:b0:746:7857:d28b with SMTP id
 h10-20020a05620a400a00b007467857d28bmr3330927qko.14.1681119446583; Mon, 10
 Apr 2023 02:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-2-hdegoede@redhat.com>
 <CAHp75Vea_S-Sw+BYFCPbZ_aTy83kotMOofpqjyGYO7sVywpdYg@mail.gmail.com> <c9a85d8a-b920-391a-8738-ec34d3c88eae@redhat.com>
In-Reply-To: <c9a85d8a-b920-391a-8738-ec34d3c88eae@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 10 Apr 2023 12:36:50 +0300
Message-ID: <CAHp75VdcL3b7XkgoGJm=Q-GU4p0qkZy8OrCSHCQwcC9c0SR7jA@mail.gmail.com>
Subject: Re: [PATCH 01/28] media: atomisp: Add v4l2_get_acpi_sensor_info() helper
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

On Sun, Apr 9, 2023 at 3:28=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 4/2/23 08:17, Andy Shevchenko wrote:
> > On Sat, Apr 1, 2023 at 4:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:

...

> >> +       obj =3D acpi_evaluate_dsm_typed(adev->handle, &intel_sensor_mo=
dule_guid,
> >> +                                     0x00, 0x01, NULL, ACPI_TYPE_STRI=
NG);
> >> +       if (obj) {
> >> +               dev_info(dev, "Sensor module id: '%s'\n", obj->string.=
pointer);
> >> +               if (module_id_str)
> >> +                       *module_id_str =3D kstrdup(obj->string.pointer=
, GFP_KERNEL);
> >> +
> >> +               ACPI_FREE(obj);
> >> +       }
> >
> >> +       if (!soc_intel_is_byt() && !soc_intel_is_cht())
> >> +               return 0;
> >
> > So, you (might) call the previous _DSM for any SoC, is it intentional?
>
> Yes the previous _DSM which gives a sensor-module-id string is also used =
on IPU3 and IPU6 so we want to at least try it on all x86/ACPI platforms. I=
f the _DSM with that GUID is not supported then the call should be harmless=
.

Still there is a probability to have it being run on some broken ACPI
tables on non-BYT/CHT platforms. Yes, it will be very unlikely, but
still I think the more robust is to check for SoC CPU ID first.

--=20
With Best Regards,
Andy Shevchenko
