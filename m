Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA4C4688A7
	for <lists+linux-media@lfdr.de>; Sun,  5 Dec 2021 01:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhLEAWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Dec 2021 19:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhLEAWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Dec 2021 19:22:01 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A52EC0613F8
        for <linux-media@vger.kernel.org>; Sat,  4 Dec 2021 16:18:35 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id x3-20020a05683000c300b0057a5318c517so8554620oto.13
        for <linux-media@vger.kernel.org>; Sat, 04 Dec 2021 16:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dXf1OcxDWLdTQ0vxU++3flLW+ML8+UeIv5ErzA5lngA=;
        b=MZUhphslBqiF0hlSyXGyN5lwgxpRhnn8Dq2M67z2Vy7MBf+hb5mCf16DSVzhrP5rXL
         nxJDoKDnjtplZI1WhoAe7eoJFQX3+2G3HdfF7wxIJNKl2O8keczqj0YILFjMXYF7yG7Q
         zq7kz4JMbmN5cT6dddipJX+e4IbDusO6xiKZIp4QOgy5cJKvsBZc/FdWwIT4QeDkDpjS
         tvciR+wzTtK2v2W0baWbg1r09okAVzBSue30LhvyFGhX4lfA9sY9jfzmW4NgbHIUYSAh
         kXxalhIdEpLPF0LOqNisimhYFGPuYxJagG/osvVQK9v2AUhzbO8yAYxJ5qDabUF4Xv52
         oJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dXf1OcxDWLdTQ0vxU++3flLW+ML8+UeIv5ErzA5lngA=;
        b=Bj2OvaWj3RmMsaSYguFjkkWwR2JAVcU9BoppJVGcbZMOgVrmbfZF37Q1kZ0zl+g9A2
         uRAYItiHlRTQw4ywenMQgdOBSmzMvaszkWuBMOH3VLwS3lscRTGTdpGkUuaCaeF5cKZ9
         3dbk9PxlLBAw7aPh8XkY+J5rUftIICp3uR+51wbUMoXjLgwdXkDD6MzSYGYWEo5soGT1
         AVg/oJhKONxgG8DDC6a2MM2xc1ZHrv8BVD/BVCBRiN79J8wsBGRnoYbugdOhLm1X+Yr+
         8UgFIZ8og7iqlltsk+abUS2wIcyfvX6w4huDOt7XNk4psB/i1NNUeY/DViGwxrpsehAY
         N8Ww==
X-Gm-Message-State: AOAM532UE/hNGnqEyvPZ7eA1IPDCFgJ/wa2CZNztKYtz0QDdeTHfbnX4
        gWGIKodVLifDnm0gStAzv5sYRDiBZbHKwhtnVlpUAw==
X-Google-Smtp-Source: ABdhPJzNzlUlTUhD3wBB9Sj2OD6rY6mUp4ITHg7cAJd+oeHBFxdF470nQNzDzVyiTH6JURzX6Crz33LJWzGziKWyE0E=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr22849074otj.35.1638663514254;
 Sat, 04 Dec 2021 16:18:34 -0800 (PST)
MIME-Version: 1.0
References: <a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl>
In-Reply-To: <a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 5 Dec 2021 01:18:23 +0100
Message-ID: <CACRpkdYrZ2pyj+_yS6gn1n-TCQtHMqwrg+4eJRmiKGGyDNPnbQ@mail.gmail.com>
Subject: Re: gpiod_set_value(): BUG: sleeping function called from invalid context
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 1, 2021 at 10:40 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:

> [ 1674.787685]  ___might_sleep+0x148/0x180
> [ 1674.791572]  __might_sleep+0x54/0x90
> [ 1674.795195]  mutex_lock+0x28/0x80
> [ 1674.798556]  pinctrl_get_device_gpio_range+0x3c/0x110

There is the error ^

> gpiod_set_value() is supposed to be usable from an atomic context, so this
> appears to be a bug. It's probably been there for quite a long time. I suspect
> OPEN_DRAIN isn't very common, and I think this might be the first time I tested
> this driver with this kernel config option set.

Nah has nothing to do with open drain :)

> Any suggestions?

pinctrl_get_device_gpio_range() needs to be modified to not take a mutex
because mutex:es can sleep.

static int pinctrl_get_device_gpio_range(unsigned gpio,
                                         struct pinctrl_dev **outdev,
                                         struct pinctrl_gpio_range **outrange)
{
        struct pinctrl_dev *pctldev;

        mutex_lock(&pinctrldev_list_mutex);

BLAM!

And this definitely needs to be called on this path so no way out
of that.

This mutex pinctrldev_list_mutex is there to protect from devices coming
and going as we look for devices with ranges on.

One way to solve it would be to simply replace it with a spinlock, maybe
that works? (Check the code carefully so there are no things like calls
into drivers that may fire interrupts etc...)

If it still need to be sleepable (mutex-ish) you need to convert it to
use RCU I think? (Which would be pretty cool anyway.)

Yours,
Linus Walleij
