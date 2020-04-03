Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC2319DDFE
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 20:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403925AbgDCScv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 14:32:51 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36533 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728329AbgDCScv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 14:32:51 -0400
Received: by mail-pg1-f193.google.com with SMTP id c23so3920284pgj.3;
        Fri, 03 Apr 2020 11:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FzPfvi3I/HmH3OyF3HqqnKY2AW2ORrTIHByXu3Bwni8=;
        b=lH7T1YpxFgux3nqxzeng0K2rPNoR2sfinwJlU96tTh5l3OmatqWHV0mZcgeAKR7Y8R
         Ft2/GO0QrOd97Ck5Gy4eLeCizaIt+4GFz2g6tiga3K2b/KmDsiF8TzYKIRIS5DAOGAYD
         Hw6cmIjC8Xe+R5c3yJwySVbvLY8MophPyx/jp4Tyq76vvxL0/f2d0XA+5TLj+klW9Umq
         7KA+v3ZLzuTC7tRsCW48A3WaU24znc9ilEvSu9kITrf3bsqQPibq+/QBmveNZX0venkL
         M1FtNDuE6OyTLizs8iBsv6acltEm58mJH5Em/HLgAeVPZhTM5nfLvkz3KBj2eygy7zGg
         hUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FzPfvi3I/HmH3OyF3HqqnKY2AW2ORrTIHByXu3Bwni8=;
        b=FDIRp//eO3Ywu1rzsHuskPCZuPwqfVQ+75RsnEL4h9LYTx5OTlrD3X9TejzR83MUrh
         8nYRKJMM1/WLGTLdgiUjzmjNCGcVm9bo0KRFhlEdPB3mIwPeh9aXG08Wsr9+2aSOnyiL
         /Ukbh8nlYg7bBuPeFThuzoeJG7hUrhNRcTD6Hm1GVLYroXeHK4zIEnCuMEaNEsKl9uju
         jXcTOH/uoPLI8d/U451WoK7ggZEpsgy2Q5WBuH5suAQXILPtxo2LCBbHzc8YkEFbp1C1
         0mkhEolKwhewmeT0Jg2zG36rtdvFUy6JpdArl5xU8cBig9tPjn7xVflYdyvQCHRH+voL
         9WpA==
X-Gm-Message-State: AGi0PuY7ceDbE1zouWAwCFFt5p4LoSRZSlJq9Vp21Ilbevp/Qp6CEpYb
        KRUrebegV/XSQkJg6J7q7RNNT4LnAS1gW7Nr6Oo=
X-Google-Smtp-Source: APiQypIinwhumgGUt5DCeRKHr/ntgaMAqGInmnYQfu/+UNIt74kFm7mloe68bJzGZFPbOBTMbIZcwwsq2pTaxMlkK+E=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr9915310pgb.203.1585938770173;
 Fri, 03 Apr 2020 11:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk> <b1e6213ba9f67da8278dd5c5f5e4def8ab927c83.camel@perches.com>
 <20200403193242.38611906@coco.lan> <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
In-Reply-To: <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 3 Apr 2020 21:32:42 +0300
Message-ID: <CAHp75Vf+m_qzOwZb38dObLpKV2N27-J_7beqffhFVoSHaNV2vg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
To:     Joe Perches <joe@perches.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 3, 2020 at 8:54 PM Joe Perches <joe@perches.com> wrote:
> On Fri, 2020-04-03 at 19:32 +0200, Mauro Carvalho Chehab wrote:
> > Em Fri, 03 Apr 2020 09:56:42 -0700
> > Joe Perches <joe@perches.com> escreveu:

> It _might_ be useful to use a CONFIG_MEDIA_SUPPORT guard
> in lib/vsprintf for this.

No need. FourCC, if Sakari makes it more generic, can be used for
other purposes, e.g. printing component names from the chips (not
related to media at all).

-- 
With Best Regards,
Andy Shevchenko
