Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8895E19F3C4
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 12:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgDFKoj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 06:44:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39775 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbgDFKoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 06:44:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id k15so7338073pfh.6;
        Mon, 06 Apr 2020 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xpsSm03PNhhxTrDlHzFJiusW57aSpekqQTtY3BOaBJM=;
        b=UAAKjx9GNKdrzDHCWGjcfG41gX/Cbvy7YW/ZDTHOCFMSnTDLchGMzaZssW3ScDGV/Z
         7xchbKVwU0h/QPo1jv8RAxe5RxVcjUPD53V97HNIiPvht7dfc+zCDKwkcES05y/PEtcJ
         rAg9Ae8Xo+ud9jnCybuOAMh4CNwue3K2HYxbG27mWvt9yKfXUcPcaS6xcjuzQ8ulKDvC
         KIyQgQAo+c3WbeESfa6Vq+e6Apnszf/AWiZRxO5elgadEPGV4l3sV10OmnSeWfDDmNSY
         Em2V4dRFPNjfWO03MliMwvxHo6lpw6Vnq/29y40ardOztBxJlJp5++zzfo/YXPNqEom1
         KrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xpsSm03PNhhxTrDlHzFJiusW57aSpekqQTtY3BOaBJM=;
        b=XwHe5Ywnbw0sfDM4gbQ9NaQvl+QahJLoSGnKJNynsfjii94FugyMU7DoKs+K3SX3BX
         V7D3oun34EoffqBsA9e0W3n0rZuYWBY8l81ktQpBwlR+wNPXsgZd9tHbXNqeAcEVowP3
         3kM+nGnOpzP1yZHmaqWMI0LWFbt7VlEdKif7kH5kp4mkJf1Jqn3Hv9GjjESmeoJQ6g0g
         VfFPPdcxIa0J2/0wUj4LrU3wmtW4FuG0O5OW639fVS3CmNXZ/YMBPCFxFdXXyMrE0G8/
         1o5HehrJlGlFjtClllYFuqNIkG4y+j0Kr7Lj15t27Eihg8VXPtm7eSfonM0Q3eFRIqyL
         hd8w==
X-Gm-Message-State: AGi0PubUTGYaICDcGaf/jmc6rzOX4rkrLPfkyUz1bPsiNLWctBEVh47W
        OMKXNcpTMZ6IBOjnYHdtye5wSudGasmrNIsuka4=
X-Google-Smtp-Source: APiQypLVSCmp8W0PDDGXSdgvI9VwsRklH3NMg3fhaSk4LJ3JUwswPj1zXOnxcgmDKNT+oXenNn+9hpYhOP+QXuhOQUU=
X-Received: by 2002:a05:6a00:2b4:: with SMTP id q20mr21324803pfs.36.1586169878219;
 Mon, 06 Apr 2020 03:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk> <b1e6213ba9f67da8278dd5c5f5e4def8ab927c83.camel@perches.com>
 <20200403193242.38611906@coco.lan> <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
 <CAHp75Vf+m_qzOwZb38dObLpKV2N27-J_7beqffhFVoSHaNV2vg@mail.gmail.com> <20200406094645.5f96457a@coco.lan>
In-Reply-To: <20200406094645.5f96457a@coco.lan>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 6 Apr 2020 13:44:30 +0300
Message-ID: <CAHp75Vdp+PXaJxrm99DgpJSS+6PcD1FfAfE3U1auFr2oxk5-tA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Joe Perches <joe@perches.com>,
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

On Mon, Apr 6, 2020 at 10:46 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Em Fri, 3 Apr 2020 21:32:42 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> > On Fri, Apr 3, 2020 at 8:54 PM Joe Perches <joe@perches.com> wrote:
> > > On Fri, 2020-04-03 at 19:32 +0200, Mauro Carvalho Chehab wrote:
> > > > Em Fri, 03 Apr 2020 09:56:42 -0700
> > > > Joe Perches <joe@perches.com> escreveu:
> >
> > > It _might_ be useful to use a CONFIG_MEDIA_SUPPORT guard
> > > in lib/vsprintf for this.
> >
> > No need. FourCC, if Sakari makes it more generic, can be used for
> > other purposes, e.g. printing component names from the chips (not
> > related to media at all).
> >
>
> Hmm... not 100% sure about what you're meaning with "component names".

4cc is pretty much wide standard, media is just one of (famous) users of it.

As I emphasized the example I referring to has nothing to do with media.

Now, I have already two examples:
- component name inside hardware register (used by Synopsys DesignWare)
- CSRT table in ACPI uses this code for vendor ID.

-- 
With Best Regards,
Andy Shevchenko
