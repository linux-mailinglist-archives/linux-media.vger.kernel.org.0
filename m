Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49D8440874
	for <lists+linux-media@lfdr.de>; Sat, 30 Oct 2021 13:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhJ3LEJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Oct 2021 07:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231810AbhJ3LEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Oct 2021 07:04:09 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301DDC061570;
        Sat, 30 Oct 2021 04:01:39 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id ee16so34354688edb.10;
        Sat, 30 Oct 2021 04:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QGrekgbhQDI8M3Dxp2q88/NqHjo+Cc9//ctqA2W6E8s=;
        b=AOGINxs1YZCauF45Tsj87bHBCpHZ0WVF8NkGkK5fhl7Bjj50a3KrUUG2Xc+/buSvET
         LrCxOlwZ6awLQ2X+25mUdId/24gEgS9OzxICiYDxDzKv5NBwjSIuiKk/VqqohZNmAezQ
         kwF8RFglHXcWvds9pAWBmBmfo/dU5q3hDR+E2JGFP9QruqpGuXNGX+kgeq8E9rRRSGYd
         Ja/shFarKAbAY3UpvVunoX14Jou3Er9yKRx92OSdZbVSzRIvhEYl9qE5tqyYaLVBvf4H
         E/0ptl3IlMZaT304ThdaZTFa6KSlnFPZTkFzvb47FkG5VOIFYPyJ1QjG+jeEv+T/NsJB
         NiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QGrekgbhQDI8M3Dxp2q88/NqHjo+Cc9//ctqA2W6E8s=;
        b=7fe9Sa9uW7ziTFBoUhc31rwQKdeuOBA54EVk1Ywm0pGmQ/TmdesNszWUg7je+n7b7j
         Tx80EukfQCJv+77sb/S1M+Ia2FcKnbyAB0aH23vifD/+WouJxWw1OvbvM/D6gyNlVF03
         oYSUf8InIXPQ1iC8Y35G67EC4ugjSpEppihYal45t10UXY9lmDQ1JJsctIqGvHnu7DwW
         IOPJmwWfk1FNi0KE0bBGH3Z5UCGvcqrO9dLpSN8dTpd6dJMHxloELt6RvXFpR1esh31f
         nNbm0HzGwgOg3qa7/LlJrHrkPUFeyiRYXoV+tWJNfLaR6GlJjOOjsVBqGktdoyRLNgx7
         mPjg==
X-Gm-Message-State: AOAM532xDsJwzfhawDtY5/zY90epteOpmyogbldsSqVsspcVysXQ5UW4
        JLK5wNcmd8rxJ4hN3+EHUj7cJXfjMadCi777rM4=
X-Google-Smtp-Source: ABdhPJzzdiMxl0wsnyA/iGXVkWCo9XSsUKXRuW3arv9QvvQ6mTy+F0nWIUO9uR6HfvrwYZRsKIAJ+30A+ITSPVRjxcg=
X-Received: by 2002:a05:6402:205a:: with SMTP id bc26mr11270348edb.119.1635591697586;
 Sat, 30 Oct 2021 04:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211017161958.44351-1-kitakar@gmail.com> <00dd9a0286e194696f6cc083a98de47d709b1d9e.camel@gmail.com>
 <20211028115802.49258990@sal.lan> <1a1da60c4464bd163e9c401e04db3b58172ae7fc.camel@gmail.com>
 <20211030114923.4feb5a4d@sal.lan>
In-Reply-To: <20211030114923.4feb5a4d@sal.lan>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 30 Oct 2021 14:01:01 +0300
Message-ID: <CAHp75VexkxSx=aqB+a0LANR9ViMRX3z7jq9h8haR7BQojYqzuQ@mail.gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 30, 2021 at 1:49 PM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
> Em Sat, 30 Oct 2021 18:50:14 +0900
> Tsuchiya Yuto <kitakar@gmail.com> escreveu:

...

> What I'm saying is that, IMHO, we should:
>
> 1. Fix the ioctls in order to allow a normal app to use it. I'm
>    already doing some work on this sense. We should ensure that the
>    driver will pass v4l2-compliance tests on this step;
>
> 2. remove VIDEO_ATOMISP_ISP2401, making the driver to auto-detect the
>    register address differences between ISP2400 and ISP2401;
>
> 3. Cleanup the driver code, removing the abstraction layers inside it;
>
> 4. Migrate the sensor drivers out of staging (or re-using existing
>    drivers);
>
> 5. Remove the logic which sets up pipelines inside it, moving it to
>    libcamera and implement MC support;
>
> 6. Move it out of staging.
>
> This is easily said than done, as steps 2-6 are very complex and will
> require lots of work. Also, both ISP2400 and 2401 should be tested
> while doing some of those major reworks, in order to avoid breakages.

This is a great roadmap nevertheless!
However, we missed one important step here, i.e. persuade Intel to
clarify license of the firmware (for distirbution) and make sure we
have it in Linux firmware project, so it won't get lost.


> Btw, v4l2grab app (at v4l-utils) already works. This is a very simple
> app, written to allow stream testing. It doesn't do anything fancy,
> like trying to enumerate the formats, and it needs to be set to a
> resolution lower than the one announced by the sensor, probably due
> to some bug at the COPY pipeline settings at atomisp driver.
>
> qv4l2, for instance, causes a driver OOPS when it calls G/S_PRIORITY
> ioctls.


-- 
With Best Regards,
Andy Shevchenko
