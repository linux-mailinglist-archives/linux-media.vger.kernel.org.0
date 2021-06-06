Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F7639CDDE
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 09:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhFFHXH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 03:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhFFHXG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Jun 2021 03:23:06 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54BCC061766
        for <linux-media@vger.kernel.org>; Sun,  6 Jun 2021 00:21:06 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id l10-20020a17090a150ab0290162974722f2so8463649pja.2
        for <linux-media@vger.kernel.org>; Sun, 06 Jun 2021 00:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cEFcRT1a+4r2BQ//zhk6sWBfu7ihbZimnmlf/OOAxxs=;
        b=BJAZW45LbpmUHlAOToEU350tnrOHtWIWvydbLSUnLstYEfSppJOyafVY536FwJs/Ge
         1GAY4nVhHNekIKRZac+/GqJnYVsN+iqIlDADvxQC+9sTWGudJ0oAnT/53FSDgv0y1qUJ
         oH2J0hIWdG/RCBzQbJEmuRDYZ22tTFtzyjA5jJedg2PexlWkOf0dG8uGiXFI8T5Vy8+w
         uOKa4ZGZ8bt3PkJqZdz8d35kh/z6I49o6zhNDMAJhyqAI+qcPKtYc9YC2GVjhKyXMvBR
         ai/Dc6AceMgC6qg4yeF4XPlvD+PERPUMzar56HzhA/cOtkqIzJ5enuZFb4UiKJBvmJOa
         +F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cEFcRT1a+4r2BQ//zhk6sWBfu7ihbZimnmlf/OOAxxs=;
        b=ibuL9y8ob1n6aDnfhrGPREp5v8JDdUL5EDRI2UE15hvQKA+A/3tIZ6t1SQJRgQpPgb
         jmSzHe2t3os2XAyKyMjnmxp5GrJMcXbBGt6UAF+8vIpkV8cN+5R2mCYwStFMjjSf32B1
         WS7pY9Y3W1ROBqegIjlTYOpEFWK7TxI/9bP/eThewZMbNYxt0TNcwoERTKTrhmiyM3vI
         HQMAnjzQ/hYpR0j+3tk46hpuWeO3eGdweodfJ3tJbWpgzZBnRiLI8Y+zbyuQvT3FSSbG
         FHTegOo4emuPpU8T+kMjREbdvnTiunYnAkr2TV/Oio7celu0ePP1/TrlmnPnNreFJGPC
         P5vA==
X-Gm-Message-State: AOAM532ooOC9/czpSxTT4cZsheME7EI2z4kWTCFVmDMaf7FsUp+e0F2o
        yW7gijfIi8gcyhWla7zUtj8U5NEJ+jKVBwQayeY=
X-Google-Smtp-Source: ABdhPJz8zn/aBwiTtigOdfzzQlEC/6tQAvyb3hV5aIu7efq+/SK1V0k9qkRWou517CAu0MlxE2KM4J/oIcm2ggyOTxk=
X-Received: by 2002:a17:902:6b42:b029:107:a6d5:fc8a with SMTP id
 g2-20020a1709026b42b0290107a6d5fc8amr12339755plt.76.1622964066185; Sun, 06
 Jun 2021 00:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210605115456.14440-1-euphoriccatface@gmail.com>
 <20210605115456.14440-2-euphoriccatface@gmail.com> <20210605160028.6ec30b8a@coco.lan>
 <20210605165335.26313de9@coco.lan>
In-Reply-To: <20210605165335.26313de9@coco.lan>
From:   Seongyong Park <euphoriccatface@gmail.com>
Date:   Sun, 6 Jun 2021 16:20:53 +0900
Message-ID: <CAJp=mWRihf_AiLXojoeeY6JTqA=-mD11+aWZToRcw2ozWoB5zw@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: video-i2c: frame delay based on last frame's
 end time
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Seongyong Park <euphoriccatface@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

2021=EB=85=84 6=EC=9B=94 5=EC=9D=BC (=ED=86=A0) =EC=98=A4=ED=9B=84 11:53, M=
auro Carvalho Chehab <mchehab@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
> you would need to use:
>
>         usleep_range(min_delay_us, max_delay_us);
>
> instead of:
>
>         schedule_timeout_interruptible(schedule_delay);
>
> in order to tell the realtime clock about a dead line for
> sleeping.
>
> Thanks,
> Mauro

Okay, I have tried `usleep_range()` instead, and it indeed shows
improvement in the frame rate.
Now it's basically the same as before my patch, except for
`jiffies_to_usecs()` and then `usleep_range()`.

...
         int schedule_delay;
+        uint64_t schedule_delay_us;

        try_to_freeze();
...
        if (time_after(jiffies, start_jiffies + delay))
            schedule_delay =3D delay;

-        schedule_timeout_interruptible(schedule_delay);
+        schedule_delay_us =3D jiffies_to_usecs(schedule_delay);
+        usleep_range(schedule_delay_us * 3/4, schedule_delay_us);
     } while (!kthread_should_stop());

     return 0;
...

I decided to keep the `if (...) schedule_delay =3D delay;` part.
The concern was that my RPi Zero was having quite a bit of constant
drift, like showing 3FPS when set to 4FPS, 6FPS when 8FPS, 10FPS when
16FPS, and so on.
Now that I've confirmed the timing's good enough (usually ~0.5 FPS
faster than the frame rate given), there's no need for me to bother
anymore.

I'll send another patchset if it doesn't look too bad.

Thank you very much.
Seongyong Park
