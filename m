Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFE318FEA9
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 21:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgCWUVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 16:21:21 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38164 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgCWUVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 16:21:21 -0400
Received: by mail-io1-f68.google.com with SMTP id m15so10681967iob.5
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 13:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YldqKF6vwl8ndtx8BsIAInT56cLJBDYRfEjlyZWL6TM=;
        b=SBQ1hn0pmcxJKTYWNW/9LGi0ageOr3+zrLbmh6RWGb9f+S921jXWw0GDlSdyhUQIOo
         bBxmknUN+lXFMLsTpbcdo88T5NYhmRdgNj73RH9BXCKKYEIB6u6nKn4JSWjquIGMyXbZ
         D4tUTBlrMMIjKH6tWER0k6+Xt+cCp4pHFGvC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YldqKF6vwl8ndtx8BsIAInT56cLJBDYRfEjlyZWL6TM=;
        b=MMhBApw+J6naeZUSKI+uLX+KYCmoADS8A0hmTrQ5WVabUG/iyRs1ZnJHcY0p4kcBAg
         /RzrkiNG/UQ3CqEXbvoagWGXOiwhXQlHS/o7enLpWOlx0xYdec2wPdB0iu2ym03Ckfxs
         1B/V+r2h9GWD6MQ/WZLR6Mk6nXjzn7js0QZwkeZ0S+8k41avn7EO8WqV6uaASUwPK1Xm
         W2ER8pEe3iaUZXWRhODoxoKfhiSCFa1KDmRQg3wuauxCXb+f238kh43caPH5ly6HwHSB
         Ul3o3GFCjHf38xplHSs92m4CbKSXAuyFgS7nsJ9V7EXtRSKM658ZKeNUwq8z7MoI0VKI
         dckg==
X-Gm-Message-State: ANhLgQ215iD8pdme6AQidgKhBPTD0VVwJVkQFp/FnyWcFrECuuNuDSV+
        YFlIlVAqkaStYh5J4E9i0+uV0cCfir/3VYK46eshJwrO1HdG2Q==
X-Google-Smtp-Source: ADFU+vuZVgvdTaPwOmBqNWR/raTA/X6KFlm5rOtuwIjbTlQIUbU8J6JTY74VtCu0kyUg7zy6xMjTcDnlUkJOlIGvHZU=
X-Received: by 2002:a6b:ec19:: with SMTP id c25mr5037891ioh.98.1584994879839;
 Mon, 23 Mar 2020 13:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200322011833.231963-1-matt.ranostay@konsulko.com>
 <20200323071335.GA853@valkosipuli.retiisi.org.uk> <CAHp75VfOorFXrR9pVOj7VRH4e4tEUByHbHavffJ9AuRCd=aVzw@mail.gmail.com>
In-Reply-To: <CAHp75VfOorFXrR9pVOj7VRH4e4tEUByHbHavffJ9AuRCd=aVzw@mail.gmail.com>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Mon, 23 Mar 2020 13:21:08 -0700
Message-ID: <CAJCx=g=VzbA71ECjOXy9Dc0HcFWb75Xz01f-XZLWrV25uJKTwg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: video-i2c: fix build errors due to 'imply hwmon'
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 23, 2020 at 12:29 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Perhaps IS_REACHABLE?

Ah learn a new macro everyday. I'll use that for v2

Thanks,

Matt

>
> On Monday, March 23, 2020, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>>
>> On Sat, Mar 21, 2020 at 06:18:33PM -0700, Matt Ranostay wrote:
>> > Fix build fault when CONFIG_HWMON is a module, and CONFIG_VIDEO_I2C
>> > as builtin. This is due to 'imply hwmon' in the respective Kconfig.
>> >
>> > Issue build log:
>> >
>> > ld: drivers/media/i2c/video-i2c.o: in function `amg88xx_hwmon_init':
>> > video-i2c.c:(.text+0x2e1): undefined reference to `devm_hwmon_device_register_with_info
>> >
>> > Cc: rdunlap@infradead.org
>> > Fixes: acbea6798955 (media: video-i2c: add hwmon support for amg88xx)
>> > Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
>>
>> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>> --
>> Sakari Ailus
>
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
