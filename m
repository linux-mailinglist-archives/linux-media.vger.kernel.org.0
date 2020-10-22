Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9FA296030
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502123AbgJVNji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2444217AbgJVNjh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:39:37 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D57DC0613CE;
        Thu, 22 Oct 2020 06:39:37 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id o1so1045363pjt.2;
        Thu, 22 Oct 2020 06:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b3AVo2emPLkcZF8hW3nQ46IEFziYrCYUxWf0tqXrKb4=;
        b=uuzbSiMIqbW4lrdsO5PXIzxsvCt/uxlqrBpaQ1b8FLTBQYLFDsNfYey2hRinJQp2FH
         IoL4UG+O9do4Wr0hLc3LO3xAKMyEzONxuocxYYfGoMZ1xWUXGWSTegnUY0YOPaan4uyt
         FhAMGAylucQbDRT+vZjrSspmz5lmG4FtSSXekAxd0KIXMXqeXp7js+g7EENQVpznCK99
         P70k/RZvRkfm8FJu2+5g5N6xgOG8XY+r5ZCxDMljHLqSmKQhYpA6pgJXvtRloi6Z8Pqi
         A9zS0CngtsnNoRz6X9FUoKIaYIameFxKlVxeX2XKrUJFxE2s41ffqVnqsN+v3tQelkKf
         FX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b3AVo2emPLkcZF8hW3nQ46IEFziYrCYUxWf0tqXrKb4=;
        b=QnI18eRM6QYSgiF2rt4P+TeBpyyj0XDWMv96cEWHYUJAQGkalvJz/GKBuG/uzIdp+K
         YaYRbKbadxrI2GDjbu23l47ytyTvHm7mCPrIX6OqH9DXAfX0uhKu/9UjNxTsbbNJ0IPx
         PEUOmluc+dhn66PlLNyzCz5SqKU0urILcqEdQQeYClU8vYfFBV3oSf9LqlBsILFjg/Pr
         Y1Trh0/46Ae9zXaS6CtWjGrh3dpiaYnlPWgRc0uSGYYaizY6gnIIBz9FEtKpnQSfaqor
         SbNLqBuLQudlC1wxyUCXanX5JAoOnewNQsxotGcoexOhpQ/ME4OoOwF2tDy0bswbaNOf
         ucSw==
X-Gm-Message-State: AOAM530/29b65hzgQvzpKxJHi7sxMZsvy8E2G1uByVT6GT6YwnqN3T3d
        7f+IhvrRQx0W98tRY0dnLH4X5ufMyNtBSgC/308=
X-Google-Smtp-Source: ABdhPJwUPybuMxgPq8dMoHqmmBjU6A75kvif4dG6aK5EaG1sAwDerRoIr5JrRgv4UmK8xFGVjML4nPKdLllGXgzu6Go=
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr2468573pjb.129.1603373976635;
 Thu, 22 Oct 2020 06:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201019225903.14276-1-djrscally@gmail.com> <20201019225903.14276-10-djrscally@gmail.com>
 <20201020094113.GG4077@smile.fi.intel.com> <4ce5b55f-f492-2b52-5571-86ee346db795@gmail.com>
In-Reply-To: <4ce5b55f-f492-2b52-5571-86ee346db795@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 22 Oct 2020 16:40:25 +0300
Message-ID: <CAHp75VfhxL2iyp_sNwmDyCG6-6bE5QZYd3Ubp=egZhTCcB=jgg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Petr Mladek <pmladek@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tsuchiya Yuto <kitakar@gmail.com>, dan.carpenter@oracle.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 22, 2020 at 3:59 PM Daniel Scally <djrscally@gmail.com> wrote:
> On 20/10/2020 10:41, Andy Shevchenko wrote:

...

> >> +static const char * const port_names[] = {
> >> +    "port0", "port1", "port2", "port3"
> > + comma.
> I think 4 ports is the maximum for CIO2 device, so this shouldn't ever
> get extended?

It's better for at least teaching purposes (if anybody takes this
driver as an example for anything) if you have really believe that no
new generation will have more than that.

...

> >> +    if (is_software_node(dev_fwnode(&pci_dev->dev)))
> > Can we use the same check as for _build call above?
>
> And just set a flag in struct cio2? sure.

I meant can we use exact conditional w/o any additional flags added?

-- 
With Best Regards,
Andy Shevchenko
