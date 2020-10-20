Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74AA9293C13
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 14:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406489AbgJTMoW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 08:44:22 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39255 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406485AbgJTMoW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 08:44:22 -0400
Received: by mail-ot1-f68.google.com with SMTP id f10so1573708otb.6;
        Tue, 20 Oct 2020 05:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WWPewNSOY3SiiT7uUQmWm+BqSC1/njsbhzjqRt/2knw=;
        b=HjxrBUJ509tB7KCxym89LkgZHij1fxfVH//sJKuB4Yw/6TCsx3lXVWsv4us8gvZOiy
         h+oDZ7GIyF+Pp2arwenbDSL3ST2d7CZT7F37dS82I9koL3z1BuWe5CgQHNaNXcFEo/ha
         13/eQ94vpa/NL71cI94w2DpE61IGI9H8nThahK6ttFby8Oqiyoxqyi4L9t/VybZfBPwT
         aLYwZP8hz1hB7alE22iQexINqe0uvVfKMJBnorKDMoq7wJwVFxl59aPSBQtG+moL5Y4c
         EAxcjSfC0NJLWLTumoueSF+EdPrSA6s6qxk2lHIomqY3BhjRkwDbJDj2D5W7vZ+UNzFz
         UZmg==
X-Gm-Message-State: AOAM532SwmVJcDldg/VmGmp9tXq7jb1/3ljlP+mGoElMZIb3bcWgdxKE
        hqfUQhfL6Ry7cziQZdqe2PYbGXPBCCnziG5uaoQ=
X-Google-Smtp-Source: ABdhPJyX+2+jJiqejYrdJK/32fDTwvhU81MkMEoY8uYHEhJzDEFkSQ/6zJS0ZRJ5mX268k3UQ9Oj2qsiTbYoIidVi+k=
X-Received: by 2002:a9d:734f:: with SMTP id l15mr1676996otk.260.1603197859733;
 Tue, 20 Oct 2020 05:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201019225903.14276-1-djrscally@gmail.com> <20201019225903.14276-4-djrscally@gmail.com>
In-Reply-To: <20201019225903.14276-4-djrscally@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 20 Oct 2020 14:44:08 +0200
Message-ID: <CAJZ5v0g=2rQkEr-_QnhvLLgaPyX8OhUHe27n-XZ98q31BHBEPA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/9] software_node: Fix failure to hold refcount in software_node_get_next_child
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh@kernel.org>,
        David Miller <davem@davemloft.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Petr Mladek <pmladek@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        tian.shu.qiu@intel.com, Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        yong.zhi@intel.com, "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kitakar@gmail.com, dan.carpenter@oracle.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 20, 2020 at 12:59 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> The software_node_get_next_child() function currently does not hold a kref
> to the child software_node; fix that.
>
> Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v3:
>         - split out from the full software_node_graph*() patch
>
>  drivers/base/swnode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index f01b1cc61..741149b90 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -450,7 +450,7 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
>                 c = list_next_entry(c, entry);
>         else
>                 c = list_first_entry(&p->children, struct swnode, entry);
> -       return &c->fwnode;
> +       return software_node_get(&c->fwnode);
>  }
>
>  static struct fwnode_handle *
> --

This should be sent as a separate fix AFAICS.
