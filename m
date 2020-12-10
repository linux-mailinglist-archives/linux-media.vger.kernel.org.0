Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05ED42D5B2E
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 14:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387816AbgLJNEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731240AbgLJNEy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:04:54 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF3FC0613D6;
        Thu, 10 Dec 2020 05:04:14 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id o4so4179122pgj.0;
        Thu, 10 Dec 2020 05:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=92Wh2LQtBXzTX4NkNdCAHhIqaKi2BFUPf+cbDuzZ2dM=;
        b=FBMPE2JaoBmrOk3y40Mrmo8b1Mvkmv7ogxXi/Fxml/kMrLZjoWb3g6V1eeHeaSuBf6
         lpP6yv9RhhduV0xpST+COmF6of3lXMi9gdBpiz16bzy7tscOk2EdY8Oa5EJll5qrMII7
         rMGmNJmTsIg+86qlY0EF9tEuPhIopz0sTxiYSrPJFA6wQi510LFJQxKGBH90CVlOjT6T
         8wisBOIVM8xpVLOUpvDc7PeJTu5hKYlpznhQVb0wdXzBuzeI9ZnTyEII/X+zoEuZTOmy
         e0q+nZlanVaFzW9lBFv9yM/QNrG+7Fhf+HYGlM59T7cJlFye0iospfsZZ+1JLXWmD0Sp
         t2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=92Wh2LQtBXzTX4NkNdCAHhIqaKi2BFUPf+cbDuzZ2dM=;
        b=H3tWHBd0rSkIVcg99qFd6KcJNbxHElVdKAoHnyeNgu3afc1dwxAJlOb7wyNUWsu0nL
         jU/tn1T7+sPYLlfG2MxrKgFAsHTzdGCJXjn6gq2Nu/31VPgzWV9rj7VX9O1hgcm0H+NL
         GNR8/unGpqJL+ujpWdX/vdXvSWN98WBJPrI7ixDf6KOJiMF1nyDGc1z/rQVVWLXfZHu+
         kF1bVXI7zqXlfaiZd6lpdbBgc6+Qk7LtditmVuH5w4X1XG4h0eOJR3o08FrlF0dEnvTu
         WUvX8Eb1+k0qbncQUVtoVrmhH8ZkjEb7aGeGND05v18uysXokeLkPMYuDtLfIRGGfpxG
         lOFA==
X-Gm-Message-State: AOAM5331z9D9CVBytrM7oyo9y48+HxNqGmvohqUVYCeD+6uXkOUqOrYR
        VsG3JBlQZzoY59YdXA29/Av2//c7CGCyWc5MBj0=
X-Google-Smtp-Source: ABdhPJx6pQh8UTUI6wTm+2am3BYMKhPGQWSY4Ulu5ZwL6w0nVgmYWZh7f4gx79f7WBvYQAFphvYasrY2UUg54Dkc8U8=
X-Received: by 2002:a17:90a:34cb:: with SMTP id m11mr7555981pjf.181.1607605454205;
 Thu, 10 Dec 2020 05:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20201113105441.1427-1-sakari.ailus@linux.intel.com> <X9Hdg3lJm+TZAQGX@alley>
In-Reply-To: <X9Hdg3lJm+TZAQGX@alley>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 10 Dec 2020 15:05:02 +0200
Message-ID: <CAHp75VcY_b7uaGWoEa1Y6YDk0MmmzC4hV2yx8zVT7J-fD67Hyg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
To:     Petr Mladek <pmladek@suse.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 10, 2020 at 2:16 PM Petr Mladek <pmladek@suse.com> wrote:
> On Fri 2020-11-13 12:54:41, Sakari Ailus wrote:
> > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > so the same implementation can be used.
> >
> > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> Andy, Rasmus,
>
> the last version looks fine to me. I am going to push it.
> Please, speak up if you are against it.

My concerns are:
- not so standard format of representation (why not to use
string_escape_mem() helper?) or is it?
- no compatibility with generic 4cc
  (I would rather have an additional specifier here for v4l2 cases.
OTOH generic %p4cc to me sounds like an equivalent to %4pEh (but we
have similar cases with MAC where %6ph is the same as %pM).

But I'm not insisting on them, consider it like just my 2 cents to the
discussion.

-- 
With Best Regards,
Andy Shevchenko
