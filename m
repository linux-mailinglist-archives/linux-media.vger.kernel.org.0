Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982F852BC77
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 16:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237997AbiERNaI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 09:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237992AbiERN36 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 09:29:58 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EF06A423
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 06:29:56 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id m23so2590136ljc.0
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devalore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uppEWIa/PX/sGTfdDgvjqOfT1h4/y84EZdPXZO9/TbI=;
        b=VIAUdmk4g10XQ7xgi0Kk5Eac1jq20fLA/HxQ5GZKvOBcw74mRVWI3sV2fnC/C7VWT7
         8wKd155xbWs4+nL7EyF0lgC0fNAdR78+WJbHIGrO2rQv5LzsP5s3t0IOffN4d0CHdRXy
         +/i8YxDJQg5m+BUQONUv74BtvbhRJJySvMw2qEVCTcjYuT8VnUG9iNGrs/shIImQ8o8I
         MWECKcdTpFNY4lL66IqvJGBIkp/1dZBOXTb0dZPEsLIAclhohWLbmpAAcevxvwVjK66j
         772IDk2SWaSmzME9Gx4dQP+hDPm+LJrSZmKCMFK7nYFpIXus6rGWHBpfk5F1aMxlQ+Yz
         L+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uppEWIa/PX/sGTfdDgvjqOfT1h4/y84EZdPXZO9/TbI=;
        b=205KAZA84S5WyYq6wCEaEwn/JdkYK80YDnavpsKjkygYNHm5InavucUS59HhirjpbE
         +W9/NNlkQizmIyqHAErP5hVB62t15s83KarkWDasRugKmyf8xjl+tMTxIcXa9ECybKSw
         o7uqWPhBzgLhM0nrPI53IFfGk3Y9XjdvgBCA1xWCOoOqxASioW/v5ZvGkI6uLuLPi8FQ
         PgKeRR58nCexOPKF0EsNqEPCuUYDL7Knxa61jYdf2wl7PlYguF3QLbSDfaOhcNLMYsgc
         lqi1StaDizhprwSg/Ii0ByLs/Ur94HM+9T+TWdWjh0QWRjzWbVL4oe6EkrWUYYfwrOGe
         QF3A==
X-Gm-Message-State: AOAM533yEc/eA6MdETa4ulHC38DxjwglSa5m3hYO9TPAVuJ9X8Lqd3RX
        XCdqn305XhqgsGtKTbE5AcVG+wGlVDa0Slf2QLlT23PiRexEmg9+zRQ=
X-Google-Smtp-Source: ABdhPJxcJNo/s7N3hlOlIqEa/vTPNigO+zgbis/no2VqQmrVAjLThhAkqsbna+gfzK+/Zv/LTb3cV5CDoiXGAGrOq34=
X-Received: by 2002:a05:651c:895:b0:250:c5ec:bc89 with SMTP id
 d21-20020a05651c089500b00250c5ecbc89mr17639916ljq.251.1652880595148; Wed, 18
 May 2022 06:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <CACBf5_XDzBAAPwx9wn-p-moLyWGzx5o_cnFKPqZuS7puvZbmGg@mail.gmail.com>
 <CALF0-+XP0km6uKtbteST_Mm5nFQtxgeqKcoz-GoOKy_CHQwmLQ@mail.gmail.com> <CACBf5_UoTap2gtHbkRfX6cSza5rHcKZY_HSfzzGV7g+UBMiGNA@mail.gmail.com>
In-Reply-To: <CACBf5_UoTap2gtHbkRfX6cSza5rHcKZY_HSfzzGV7g+UBMiGNA@mail.gmail.com>
From:   Steven Rosenberg <steven.rosenberg@devalore.com>
Date:   Wed, 18 May 2022 16:29:42 +0300
Message-ID: <CACBf5_X4iUpHBagxFao_E4Z_jaM8i6Bb-h1bkXFzhoTPLVdpHw@mail.gmail.com>
Subject: Re: STK1160 USB VIDEO CAPTURE DRIVER kconfig compatibility issues
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Resending in plain text:

---------- Forwarded message ----------
From: Steven Rosenberg <steven.rosenberg@devalore.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-media <linux-media@vger.kernel.org>
Bcc:
Date: Wed, 18 May 2022 16:17:07 +0300
Subject: Re: STK1160 USB VIDEO CAPTURE DRIVER kconfig compatibility issues
Dear Ezequiel,

Thank you for your response. Yes, your patch seemed to work.
Unfortunately, we cannot upgrade the package, there are too many
version specific dependencies. Currently we are getting another error
on the gcc version:

poky-hardknott-25.0.5/build/tmp/work-shared/dcbullet/kernel-source/include/=
linux/compiler-gcc.h:106:1:
fatal error: linux/compiler-gcc10.h: No such file or directory
|   106 | #include gcc_header(__GNUC__)
|       | ^~~~~
| compilation terminated.

There were no errors using Yocto sumo which used gcc version 7.3, but
hardknott uses gcc 10.3. Attempting to set the preferred version in
yocto after adding sumo's gcc 7.3 to the environment did not help.

Maybe you have some idea on how to set the __GNUC__ define for version
7 or some other way to have the linux kernel use gcc 7.3 instead of
the gcc 10.3?

Thank you again for your help, time and consideration.

With Best Regards.

Steven.


On Wed, May 18, 2022 at 4:17 PM Steven Rosenberg
<steven.rosenberg@devalore.com> wrote:
>
> Dear Ezequiel,
>
> Thank you for your response. Yes, your patch seemed to work. Unfortunatel=
y, we cannot upgrade the package, there are too many version specific depen=
dencies. Currently we are getting another error on the gcc version:
>
> poky-hardknott-25.0.5/build/tmp/work-shared/dcbullet/kernel-source/includ=
e/linux/compiler-gcc.h:106:1: fatal error: linux/compiler-gcc10.h: No such =
file or directory
> |   106 | #include gcc_header(__GNUC__)
> |       | ^~~~~
> | compilation terminated.
>
> There were no errors using Yocto sumo which used gcc version 7.3, but har=
dknott uses gcc 10.3. Attempting to set the preferred version in yocto afte=
r adding sumo's gcc 7.3 to the environment did not help.
>
> Maybe you have some idea on how to set the __GNUC__ define for version 7 =
or some other way to have the linux kernel use gcc 7.3 instead of the gcc 1=
0.3?
>
> Thank you again for your help, time and consideration.
>
> With Best Regards.
>
> Steven.
>
>
>
> On Tue, May 17, 2022 at 9:45 PM Ezequiel Garcia <ezequiel@vanguardiasur.c=
om.ar> wrote:
>>
>> Hi Steven,
>>
>> I think your mail didn't get delivered because it's HTML and mailing
>> list filter this. Plain-text is required.
>>
>> El mar, 17 may 2022 a la(s) 10:10, Steven Rosenberg
>> (steven.rosenberg@devalore.com) escribi=C3=B3:
>> >
>> > Dear Ezequiel Garcia,
>> >
>> >
>> >
>> > We are using the linux 3.10.73 package [1], which includes your "drive=
rs/media/usb/stk1160/ Kconfig" file. We are upgrading versions of Yocto and=
 the current version of kconfiglib.py gives errors [2]. There is indeed an =
extra dot on line 20. Perhaps you have already fixed this in a later versio=
n  of this linux package so that we can avoid adding a patch? If so or if y=
ou have another solution, please advise accordingly. Currently your Kconfig=
 file for this version of Linux is not compatible with the current version =
of  kconfiglib.
>>
>> Thanks for the report. The extra dot was apparently introduced by
>> commit "[media] rename most media/video usb drivers to media/usb",
>> and later fixed in commit "[media] stk1160: Build as a module if SND
>> is m and audio support is selected".
>> See: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3Ddfb9f94e8e5e7f73c8e2bcb7d4fb1de57e7c333d
>>
>> 3.10 is EOLed so you will have to patch this yourself.
>>
>> PS: If you still want to use 3.10, I would suggest you should be using
>> 3.10.108 (latest stable).
>>
>> Thanks,
>> Ez
>>
>>
>>
>> >
>> >
>> >
>> >
>> >
>> >
>> > [1] https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.10.73.tar.xz
>> >
>> > [2]
>> >
>> >
>> > kconfiglib.KconfigError: drivers/media/usb/stk1160/Kconfig:20: error: =
couldn't parse '.': unknown token at start of line
>> >
>> > ERROR: config analysis failed:
>> >
>> > DEBUG: Python function do_kernel_configcheck finished
>> >
>> >
>> > With Best Regards.
>> >
>> >
>> > Steven Rosenberg.
>>
>>
>>
>> --
>> Ezequiel Garc=C3=ADa, VanguardiaSur
>> www.vanguardiasur.com.ar
