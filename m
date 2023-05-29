Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF19715125
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 23:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjE2V5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 17:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjE2V5r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 17:57:47 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C347CF
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 14:57:46 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6260a2522d9so16712806d6.3
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 14:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685397465; x=1687989465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVVQfazhdCrMqCL15DahVev5EouULW2J949cPBl6/k4=;
        b=eBQX+r6wnwWAMCnEZNDyTMza7KMuB+yJlkgepojn5iB+kaXJWUPQvyj35dHywbYCvd
         6n2ItmocM2Eugix1//qIjo/KFSPKTgGw7GEQ6Xtk5SWr4AbELwkOggYfbUYd0oAUmE6Z
         VanFDvPK5VKX0JmLb4v5eMOmJjRMJg8MWEsOIHgfYgh+le4jLJpulukLbvma0gBTQhd7
         1Tj4ByjzgFiRj6CUMfwTZfUa1A+xb/qUyyqK1xhFIUqnF6c3xpc0yNo2t6YojLHhR7yE
         lqQEzq6D41mKg94mjHfzrVp38GRiEPK28LpfyuQefpFNzNJv+bLY69gIMHZ3u8BgeOAe
         4gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685397465; x=1687989465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVVQfazhdCrMqCL15DahVev5EouULW2J949cPBl6/k4=;
        b=EEvqXbu7V8x7FlkATaJIsmog5VVnqDc9WjR6FvleHhCGHEkoM0k6kPb+YgRD2iptp3
         YeWViDB4QRDS6/ZWQR58qays04rYV+XBCJN+7iTcOI+obkRmD9oJDho5mswZT/JsvK/V
         Nrr5Z/5c2N4pDUgSOL7j6gV7VB8bBg0Een7XhwvPL4aDqoamPyJHMBpyfd87qkG4bTh4
         Tceyk2MNUGsYnZTor8PZShjaJSiSGo7jERQ0cT5PaKewztmAZn+KSUMI/x3h7kdct35g
         Ceztcg3lhe1ukue+RhRwZJJyxJt8j+8fMVxSIYGv2KRJCUqw2Fprqjf5J//ahk0kL3CM
         p7NA==
X-Gm-Message-State: AC+VfDzmYe+wHHmM0T/MZRjb9kLU1p9vLc0sNIxHGCliV5obSU7lyvmU
        LsBj9jdy9WKTQoLiFzDBgBPGEiOOXD5ZYWKrFHM=
X-Google-Smtp-Source: ACHHUZ5hybZMfB0KdkwC7aswhOK1xvRikFUHlKCHf6hUhWEQy4AWwKUgYpiY3DsQtlBXz7RV3qkW7nuolVoZ0SaOQes=
X-Received: by 2002:a05:6214:226a:b0:623:8510:8f8e with SMTP id
 gs10-20020a056214226a00b0062385108f8emr51325qvb.33.1685397465419; Mon, 29 May
 2023 14:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-2-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 00:57:09 +0300
Message-ID: <CAHp75Vepr8ffhEH9YQqKi7-Bkr51mtrc1jV33KbBY2GCYjix_w@mail.gmail.com>
Subject: Re: [PATCH 01/21] media: atomisp: Update TODO
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
> A lot of work has been done on the atomisp driver lately.
>
> Rewrite the TODO file to drop all the already fixed items:
>
> * Moved to videobuf2 + fixed mmap support
> * Whole bunch of v4l2 API fixes making more apps work
> * v4l2-async sensor probing support
> * pm-runtime support (for some sensor drivers at least)
> * buffer MM code was cleaned up / replaced when moving the videobuf2
>
> And add a new TODO list (retaining some of the old items) split
> into items which absolutely must be fixed before the driver can
> be moved out of staging:
>
> 1. Conflicting hw-ids with regular sensor drivers
> 2. Private userspace API stuff
>
> As well as a list of items which also definitely needs to be fixed
> but which could also be fixed after moving the driver out of staging.

...

> +Required firmware
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> +The atomisp driver requires the following firmware:
>
> +- for BYT: /lib/firmware/shisp_2400b0_v21.bin
> +
> +  With a version of "irci_stable_candrpv_0415_20150423_1753" to check
> +  the version run: "strings shisp_2400b0_v21.bin | head -n1" .
> +
> +  The shisp_2400b0_v21.bin file with this version can be found on
> +  the Android factory images of various X86 Android tablets such as
> +  e.g. the Chuwi Hi8 Pro.
>
>  - for CHT: /lib/firmware/shisp_2401a0_v21.bin
>
> +  With a version of "irci_stable_candrpv_0415_20150521_0458"
> +
> +  This can be found here:
>    https://github.com/intel-aero/meta-intel-aero-base/blob/master/recipes=
-kernel/linux/linux-yocto/shisp_2401a0_v21.bin

Can you add md5/SHA-1/SHA-256 sum(s) for the firmwares?

...

> +1. items which MUST be fixed before the driver can be moved out of stagi=
ng:

Items

...

> +* Remove/disable private ioctls

IOCTLs

...

> +* Without a 3A library the capture behaviour is not very good. To take a=
 good
> +  picture, the exposure/gain needs to be tuned using v4l2-ctl on the sen=
sor
> +  subdev. To fix this support for the atomisp needs to be added to libca=
mera.

this, support

...

> +  This MUST be done before moving the driver out of staging so that we c=
an
> +  still make changes to e.g. the mediactl topology if necessary for
> +  libcamera integration. Since this would be a userspace API break this

break, this

> +  means that at least proof-of-concept libcamera integration needs to be
> +  ready before moving the driver out of staging.

...

> +2. items which SHOULD also be fixed eventually:

Items

--=20
With Best Regards,
Andy Shevchenko
