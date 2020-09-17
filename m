Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8294926DF26
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 17:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgIQPJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 11:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbgIQPH7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 11:07:59 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C05DC061223;
        Thu, 17 Sep 2020 07:08:28 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u9so1190715plk.4;
        Thu, 17 Sep 2020 07:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zeRj3f6nyWLRdKoz6U7zTVJ0r+VVM/E42TLCww5Jge8=;
        b=GRhGAYpUbLQLD7rsHRD8Gt6k1AOgGiS8JgVFi1Z9AyzpAxgzpscPl7516mOzlQRaig
         HwoyNmxJ2Y1GITM61jjkMvzoVaIJGmsdrPO9L/S2hsHmFmyjOAtQF3TGzXrLBmqzDYQm
         ea2JHqKxKAwiVsprqTXNxrS8Oq5eWc2LQGiErzRamqG+OB9mGqJUnOdOIH1MO0jwMQCv
         xt9nr1FAo0ozDMPKqgA/h+2kSjIhpNPzh/Tl8aATX7Ua3wKL+91wNAt1Lz5lUuIre2yW
         HTo25DJKhYQ94jTe6CELMtUdoHG6mP+QczAbBaN8cOTcsdAt4tanwXUduvfzuETGyLsE
         qO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zeRj3f6nyWLRdKoz6U7zTVJ0r+VVM/E42TLCww5Jge8=;
        b=J1CkNHcSIVO02OfeP0QyGB4DnEyzKjF9bg3Gd5t5nvQYfBWTwiXEwgKhu5cluzDsHp
         2H7e2aNlPAbPixRq9bZ4KqXcQE+niaegW2oKPNCim8Y0XNjVjqOwLOgtj11cXf1ByqFu
         yrJSSeMqhxibiUN8yUrzTwRyuFekaQKueAJ63ehggLu23HxZyDKfbPoyBfhJRzJ5HJf4
         nrQjWIY1f+9afTW8WbK+GdLBqPl0TmHQhujY0JDCQ/M10A6oMKDvJm7DoYDuqFrpaFYt
         kRIJJrTj6rKTWfkHKGVcXMRQ6aRzBldGDhboDNvXi+QE+x674glruYGL7JhEwQlZMnyB
         qxnQ==
X-Gm-Message-State: AOAM533697Y8qtHUSIR5xUTQuDUCJvGXkQhw0aHAUitjEIVT1G2KznDP
        XlEwsLrOBjtAM8PUCr/fWfwRDJQZevmvW00GNhE=
X-Google-Smtp-Source: ABdhPJyh5SCZniVNl+/4l5cUoMNIO4kYJ+q3Jqvhcbm1nkQPGtZAzykiqRLIOqvGCrV8bWOIU+GOb4AQ/Szk8cTgcqo=
X-Received: by 2002:a17:902:b7c7:b029:d1:cc21:9c38 with SMTP id
 v7-20020a170902b7c7b02900d1cc219c38mr17716244plz.21.1600351707970; Thu, 17
 Sep 2020 07:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200916213618.8003-1-djrscally@gmail.com> <20200917075356.GA3333802@kroah.com>
 <d97fb93f-5258-b654-3063-863e81ae7298@gmail.com> <53787a36-4473-9336-6719-270930db2735@ideasonboard.com>
In-Reply-To: <53787a36-4473-9336-6719-270930db2735@ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Sep 2020 17:08:09 +0300
Message-ID: <CAHp75VcjSZC7BG9ckFTogTK0xXog9tev8i3w=P0iN4JRQY05XQ@mail.gmail.com>
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
To:     kieran.bingham@ideasonboard.com
Cc:     Dan Scally <djrscally@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        jorhand@linux.microsoft.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 4:31 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> On 17/09/2020 10:47, Dan Scally wrote:
> > On 17/09/2020 08:53, Greg KH wrote:
> >> On Wed, Sep 16, 2020 at 10:36:18PM +0100, Daniel Scally wrote:

> >>>  drivers/staging/media/ipu3/Kconfig       |  15 +
> >>>  drivers/staging/media/ipu3/Makefile      |   1 +
> >>>  drivers/staging/media/ipu3/cio2-bridge.c | 448 +++++++++++++++++++++++
> >> Why does this have to be in drivers/staging/ at all?  Why not spend the
> >> time to fix it up properly and get it merged correctly?  It's a very
> >> small driver, and should be smaller, so it should not be a lot of work
> >> to do.  And it would be faster to do that than to take it through
> >> staging...
> > I was just under the impression that that was the process to be honest,
> > if that's not right I'll just move it directly to drivers/media/ipu3
>
> The IPU3 driver is still in staging (unless I've missed something), so I
> think this cio2-bridge should stay with it.

You missed something.
https://elixir.bootlin.com/linux/v5.9-rc5/source/drivers/media/pci/intel

IPU3 from Freescale (IIRC) is a different story.

> Hopefully with more users of the IPU3 brought in by this cio2-bridge,
> that will help gather momentum to get the IPU3 developments required
> completed and moved into drivers/media.

-- 
With Best Regards,
Andy Shevchenko
