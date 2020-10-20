Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE6C9293D74
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 15:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407535AbgJTNjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 09:39:09 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37730 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407502AbgJTNjI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 09:39:08 -0400
Received: by mail-oi1-f195.google.com with SMTP id t77so2169715oie.4;
        Tue, 20 Oct 2020 06:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BxJlx6pvHjP1AQK4j2Jcw8y8hDgZxG6mfPqiNVIjJ5w=;
        b=fmv3MmA4LpzkZbt42HD1T67yi5xrd0Tyah+lrFpqfjtNRpoNMotAQ3HPrYdz8fHH6L
         Tf7RaZctRHOeqgvuJkaEp3XKBtdTd9KWRmfmEWiJOKcBjBQ9EiMokD2kP/VFNo2sFKuo
         oLjabfjK0SHJYOLLj//9K5Oqt1W4s+agf8M2kn7c+RfjHHtWswz1Is6aufXv4cFvj5zJ
         TY+7HLneInETpGsTM8zu0rg0CL6FCEgCX8AwOT9kMw3JJBMLO3MdRnJvikBOAz5vl/IB
         bXHNtGuu3KOhzvlrM4nwUCRLNukj0o1EUP5g+2a7NpH7vV47pbz+3qc4Y4/I6TAbK3Pe
         HK2g==
X-Gm-Message-State: AOAM531SBRKC8D3PEK/FrZKpZM/qqmK96of7nWvWAY0TqZH3/ObV0YAv
        45Jjl0EUopkY9O6Eo/MGQVR3yBF/itsMIi7NFps=
X-Google-Smtp-Source: ABdhPJzT6cqLpBvUBXFLCluyCa/o4pUCtLFkTS9+V0g2qzG7LFC5myzDh1BcSd4EZ5XfyRV7z12YT6pHGoYvw/u1fkY=
X-Received: by 2002:aca:5256:: with SMTP id g83mr1936922oib.71.1603201146736;
 Tue, 20 Oct 2020 06:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201019225903.14276-1-djrscally@gmail.com>
In-Reply-To: <20201019225903.14276-1-djrscally@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 20 Oct 2020 15:38:55 +0200
Message-ID: <CAJZ5v0g2hQV9RNq3LZqrpQ5LP0rR+fxwdWcwwnzWh1g2dLdmjw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/9] Add functionality to ipu3-cio2 driver allowing
 software_node connections to sensors on platforms designed for Windows
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
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
        kitakar@gmail.com, dan.carpenter@oracle.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[Fix the Linus Walleij's address.]

On Tue, Oct 20, 2020 at 12:59 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> Hello all
>
> This series adds support to the ipu3-cio2 driver for fwnode connections
> between cio2 and sensors to be defined via software_nodes. The final patch
> in the series deals wholly with those changes - the preceding patches are
> either supporting changes to accommodate that or incidental fixes along
> the way:
>
> 1/9 adds a function to drivers/base/swnode.c unwinding arrays of software
> nodes in reverse order
>
> 2/9 uses that function in lib/test_printf.c
>
> 3/9 fixes what seems to me to be a bug in the existing swnode.c code in
> that software_node_get_next_child() does not increase the refcount of the
> returned node (in contrast to, for example, of_get_next_child_node() which
> does increase the count)
>
> 4/9 adds the fwnode_graph*() family of functions to the software_node
> implementation
>
> 5/9 adds a T: entry to MAINTAINERS for the ipu3-cio2 driver
>
> 6/9 renames the ipu3-cio2.c file to ipu3-cio2-main.c and fixes Makefile
> to accommodate that change
>
> 7/9 alters the ipu3-cio2 driver to check if the pci_dev's fwnode is a
> software_node and pass flags to fwnode_graph_get_endpoint_by_id() if so
>
> 8/9 alters match_fwnode() in v4l2-async.c to additionally try to match on
> a fwnode_handle's secondary if the primary doesn't match
>
> 9/9 alters the ipu3-cio2 driver to do the actual building of software_node
> connections between the sensor devices and the cio2 device.
>
> This is still not ready for integration - hence the RFC label - as there
> is ongoing work to extend the ipu3-cio2 driver further to parse ACPI
> to discover resources such as regulators and GPIOs that are defined there
> in unusual ways and map them to the sensor devices so that their drivers
> can consume them transparently through the usual frameworks. Given this
> has changed quite extensively from v2 though, I wanted to submit it for
> feedback at this point in case it needs further large scale change.

I would appreciate it if you posted the next version of this series
(all patches) to linux-acpi@vger.kernel.org for easier review.

Thanks!
