Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADC952AB28
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 20:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352340AbiEQSp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 14:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352352AbiEQSp1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 14:45:27 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C7310FE8
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 11:45:24 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id y41so17654770pfw.12
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 11:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mV/CodTz7Z8B4eDDmmvtlxXq5m1Ig0T7xZuL/eV2jp0=;
        b=Uy3wKTRaB+ir3y8m3qnwaEwB9Xypr5MXwqcCqZ5NxLdl+N0nkdpO3sM/A+hSpZhNF0
         TnyZVlCuK72o09BlCX9cVg/EUDd96B+04tRNz7EAnLnCeZsgOKek45d0V5stMF2Oqm3G
         raXpIFQYXLisCpzfdRab4j1JpKLmR4SK2YrnADrO4JXarb6v5XjB2l5um129FP4diIl+
         b2pmvwxF0o9Dh2E99t0ZicIEdUe0TCFqH9N/4HWoBWL9M87E3UwHjES8Tl1V8oFNs9HW
         LX9eiCpQWiIKmZ/XUNkfl61U95zJELugVHRiw9qkh+obuYNk/MnIvAw/I5G0FpxrAvi1
         /qmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mV/CodTz7Z8B4eDDmmvtlxXq5m1Ig0T7xZuL/eV2jp0=;
        b=mdWm1Pj1xZuFObrUyYLJrcSGCzGw6jl+qQd88dIFNbVkmqK01XTsblH9qWDY7Bxk51
         /QYapOOYLVwH86USNgMJfF9O7Edtf3l4D8qGeYNppWo97VRIjs7d3K+Xj1XbuO1khgYN
         oIkxLwN4kFxPPzyQocaissVjfvWWveWu4/CNG+J4rXTHWPdDLI6YS52gNMHzyfJkRRo+
         lrKQN3J2YZ+PsPbJQ0pHYTx0Ie08jvbaXUrI1jcD4c5Td15TiC2mkXSlVHmHstGb6pnV
         BY8bzXNEw8Ys6Rb8IV5/atp48h8B1q+uTJZiyT1nwtySm4VR4k4vLS4gJbZgFieEP4cX
         e/rA==
X-Gm-Message-State: AOAM531bGqefskg32900KIb0NB2jH3DXYy7nGP+VMEuJ8At6atsiLoT4
        6I00xt2fOa8qbCsOYfd6uDrenb5DStWkV9XZhhBhaI4qzjs=
X-Google-Smtp-Source: ABdhPJwu80pfMT67tgPDHyPgDWbAsCo5bzGNv/UvcdFjQampI6bioXyZ5QtLmqdLkt18Iwn+N5T+XgkJWfJ+8Ev6ofI=
X-Received: by 2002:a05:6a00:2186:b0:4f7:5544:1cc9 with SMTP id
 h6-20020a056a00218600b004f755441cc9mr23725519pfi.62.1652813124348; Tue, 17
 May 2022 11:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <CACBf5_XDzBAAPwx9wn-p-moLyWGzx5o_cnFKPqZuS7puvZbmGg@mail.gmail.com>
In-Reply-To: <CACBf5_XDzBAAPwx9wn-p-moLyWGzx5o_cnFKPqZuS7puvZbmGg@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 17 May 2022 15:45:12 -0300
Message-ID: <CALF0-+XP0km6uKtbteST_Mm5nFQtxgeqKcoz-GoOKy_CHQwmLQ@mail.gmail.com>
Subject: Re: STK1160 USB VIDEO CAPTURE DRIVER kconfig compatibility issues
To:     Steven Rosenberg <steven.rosenberg@devalore.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steven,

I think your mail didn't get delivered because it's HTML and mailing
list filter this. Plain-text is required.

El mar, 17 may 2022 a la(s) 10:10, Steven Rosenberg
(steven.rosenberg@devalore.com) escribi=C3=B3:
>
> Dear Ezequiel Garcia,
>
>
>
> We are using the linux 3.10.73 package [1], which includes your "drivers/=
media/usb/stk1160/ Kconfig" file. We are upgrading versions of Yocto and th=
e current version of kconfiglib.py gives errors [2]. There is indeed an ext=
ra dot on line 20. Perhaps you have already fixed this in a later version  =
of this linux package so that we can avoid adding a patch? If so or if you =
have another solution, please advise accordingly. Currently your Kconfig fi=
le for this version of Linux is not compatible with the current version of =
 kconfiglib.

Thanks for the report. The extra dot was apparently introduced by
commit "[media] rename most media/video usb drivers to media/usb",
and later fixed in commit "[media] stk1160: Build as a module if SND
is m and audio support is selected".
See: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3Ddfb9f94e8e5e7f73c8e2bcb7d4fb1de57e7c333d

3.10 is EOLed so you will have to patch this yourself.

PS: If you still want to use 3.10, I would suggest you should be using
3.10.108 (latest stable).

Thanks,
Ez



>
>
>
>
>
>
> [1] https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.10.73.tar.xz
>
> [2]
>
>
> kconfiglib.KconfigError: drivers/media/usb/stk1160/Kconfig:20: error: cou=
ldn't parse '.': unknown token at start of line
>
> ERROR: config analysis failed:
>
> DEBUG: Python function do_kernel_configcheck finished
>
>
> With Best Regards.
>
>
> Steven Rosenberg.



--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
