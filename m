Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 903BD751EE
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 16:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388312AbfGYO5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 10:57:38 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36026 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387834AbfGYO5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 10:57:37 -0400
Received: by mail-qk1-f193.google.com with SMTP id g18so36625052qkl.3;
        Thu, 25 Jul 2019 07:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/sZ3dfUSQ6KnBW/7AX8FrL1hyAhE5ay1aT0trt9B7DQ=;
        b=gMcWXMUYrvRjARggA/D9a+QetJxb3fRuLUIzAIadsP0+faSpat0+gtwxw91zyllR+b
         MJ234saxngJhlgOSqxyxxqBnJZWV/IALMs/675i4WjXuSzud/p4YSQLR+XKNjUcXVhe9
         mYw+cSE33c0G7JNwovaQgXYXEr3cbaNR3FnDZ25XBk2chCIzWjiKHXhgceHfQNYjdTPi
         o3BOlcmAKLVoeYJh7sXmjwBWH5WeKZ6KykDA/ztL/iE5j+0ADsp/YmQaMfqOQbFRFTlp
         cTdjrSoFpGxcSZosVO75s0gYOvt7vOzE/Zy2iZCTOOc5EIVdK+yAGSL0F/MpBJbh9qvh
         QijQ==
X-Gm-Message-State: APjAAAUw3q9GAMsxbzLupDk5nUJFQvgo1B59twMadqV91Q4uIsDWtw61
        u+ey67UBvHW/ldjLS7OXY+v9mvinDa55LviaUBk=
X-Google-Smtp-Source: APXvYqz+NXd6vVM9HrUlkLjGG9pqAy+X64YcVWOLrp5ORl3jhLSD3n/NzhHjZFyzH8nnubMnpOYx6hSeDedJ4OqRXBw=
X-Received: by 2002:a37:5f45:: with SMTP id t66mr59680105qkb.286.1564066656770;
 Thu, 25 Jul 2019 07:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190725131257.6142-1-brgl@bgdev.pl>
In-Reply-To: <20190725131257.6142-1-brgl@bgdev.pl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 25 Jul 2019 16:57:20 +0200
Message-ID: <CAK8P3a1FXyRRi5q48h-=egFjgoRJvy6_zuO9MQaAOMA-bsJKRA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: make DaVinci part of the ARM v5 multiplatform build
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 25, 2019 at 3:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This series makes DaVinci part of the multiplatform build for ARM v5.
>
> First three patches fix build errors spotted and fixed by Arnd with v1.
>
> The fourth patch adds necessary bits and pieces for davinci to support
> multiplatform build and the last one actually adds all davinci boards
> to multi_v5_defconfig.
>
> Tested on da850-lcdk with both multi_v5 as well as davinci_all defconfigs.
>
> v1 -> v2:
> - added patches from Arnd that fix build errors spotted when building
>   random configurations (much appreciated)
> - rebased on top of v5.3-rc1

> Arnd Bergmann (3):
> staging: media/davinci_vpfe: fix pinmux setup compilation
>  media: davinci-vpbe: remove obsolete includes
>  davinci: fix sleep.S build error on ARMv4
>
> Bartosz Golaszewski (2):
>  ARM: davinci: support multiplatform build for ARM v5
>  ARM: multi_v5_defconfig: make DaVinci part of the ARM v5 multiplatform build


Thanks a lot for reposting the series!

I wonder how we shoud deal with the dependencies now that the two media
patches got merged in the linux-media tree.

It would be tempting to just merge the arch/arm/ changes, but that creates
a bisection problem when the vpbe driver is enabled. I don't care
about the staging driver really as that one is broken anyway, but including
the "media: davinci-vpbe: remove obsolete includes" fix would be better
here.

Mauro, any idea for how to handle that? Should we apply an identical
patch to the davinci tree, or maybe only have it the ARM tree and you
drop it from your tree (I don't know if you have a rule against rebasing).
Sorry for not coordinating with Bartosz before I sent the patch again
earlier this week.


      Arnd
