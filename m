Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF9F3140D3
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 21:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233846AbhBHUqs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 15:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbhBHUon (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 15:44:43 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43754C06178C;
        Mon,  8 Feb 2021 12:43:47 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id x136so3904027pfc.2;
        Mon, 08 Feb 2021 12:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=obDV9I3X9Q9ETr/d7/JJJtO01x++Iqx0cP/5PJD8kOk=;
        b=krXYUzcpYuvD1i4Y1QB/c/ebFNqSUJQasnj0UlR4ZOJhwuTXeBM4WQqNK1QfLdmYdl
         sanEroE1KhDL8GhqPd5nsfpXjukIJgbZyZ18x0+xK3xTKwOlziFm04okzHYWrcpQ5Mfj
         iQU7Ke85+pcGCCZSAeZ/5cfchfsXB0lq4/T1iO/ayC9qoGkHn4e29QPdhHYFweU3gXB6
         MrDyZ6A+lPDNXs/sKni/w8Z/xtOsbB+YiRdKxgOH4vGvNLq4joNr+xuNsj4ac/UFijfa
         mqafLQDRU7gqNmKtFFGCBk6dArQgWaMNN5FXS0ufyMgs+IvsPEG8dPpBBozPNF10I0Rn
         CEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=obDV9I3X9Q9ETr/d7/JJJtO01x++Iqx0cP/5PJD8kOk=;
        b=Ywx1S61xXW5h4BZGrS/S06FBTWAySupeXmJ91MyGJp1hY7An7a5ELBuralMNqekacP
         GxTQCk8pyWZ09F0//dyv9Dy9EKDhG34cJ7j6sY034WtSIUhx6WlNhLZ0ys9Qion56YMo
         DcnSYxFGEG19MFv6YXWLwCzt/2QrWCK1pnG2/Idzu2Xs1RvnSrcz1ae3JarWXh500gaI
         9gAMtSov8nEAaBZoCU3m5Tx50weEaqXKsKUB/dvPdJm6K2QaplUFph0ivxdeWuBeTosL
         /HAMEkLd+dva0zL6qoyQ7HIm91FXb56Mxyw0FGchzQuefu1myaIZdmZ1bzdD1WcX53Sj
         bTPg==
X-Gm-Message-State: AOAM532Iz2o1RPKHhQHWOoxK6CZ1PHCGz/fVzfLuxQc1CLdIGsMe3ucl
        dRxej3qsModVSLsBavYowhST1fQd7t8n5y3mqAc=
X-Google-Smtp-Source: ABdhPJzAaCj3xJyegMBtVD1UqGu/aOrXEVvKz91WjdC0gh3MwYnVNuYrDZ7UPAwQqWbt56zsMOdVKOXqiJXSEcvj7yw=
X-Received: by 2002:a63:3d0:: with SMTP id 199mr15739479pgd.4.1612817026721;
 Mon, 08 Feb 2021 12:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com> <20210208200903.28084-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20210208200903.28084-2-sakari.ailus@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Feb 2021 22:43:30 +0200
Message-ID: <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>,
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

On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by fourccs. The fourcc encoding is the same for both
> so the same implementation can be used.

Thank you for an update with the examples how current users will be
converted. Below review is based on the users I had seen so far and
assumptions made in this code. I see that it's tagged by maintainers,
but I can't help to comment again on this. In any case the decision is
up to them.

...

> +V4L2 and DRM FourCC code (pixel format)
> +---------------------------------------
> +
> +::
> +
> +       %p4cc
> +
> +Print a FourCC code used by V4L2 or DRM, including format endianness and
> +its numerical value as hexadecimal.
> +
> +Passed by reference.
> +
> +Examples::
> +
> +       %p4cc   BG12 little-endian (0x32314742)

This misses examples of the (strange) escaping cases and wiped
whitespaces to make sure everybody understands that 'D 12' will be the
same as 'D1 2' (side note: which I disagree on, perhaps something
should be added into documentation why).

...

> +static noinline_for_stack
> +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> +                   struct printf_spec spec, const char *fmt)
> +{

> +       char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];

Do we have any evidence / document / standard that the above format is
what people would find good? From existing practices (I consider other
printings elsewhere and users in this series) I find '(xx)' form for
hex numbers is weird. The standard practice is to use \xHH (without
parentheses).

> +       char *p = output;
> +       unsigned int i;
> +       u32 val;
> +
> +       if (fmt[1] != 'c' || fmt[2] != 'c')
> +               return error_string(buf, end, "(%p4?)", spec);
> +
> +       if (check_pointer(&buf, end, fourcc, spec))
> +               return buf;
> +
> +       val = *fourcc & ~BIT(31);
> +
> +       for (i = 0; i < sizeof(*fourcc); i++) {
> +               unsigned char c = val >> (i * 8);

...

> +               /* Weed out spaces */
> +               if (c == ' ')
> +                       continue;

None of the existing users does that. Why?

> +               /* Print non-control ASCII characters as-is */
> +               if (isascii(c) && isprint(c)) {
> +                       *p++ = c;
> +                       continue;
> +               }
> +
> +               *p++ = '(';
> +               p = hex_byte_pack(p, c);
> +               *p++ = ')';
> +       }
> +
> +       strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
> +       p += strlen(p);
> +
> +       *p++ = ' ';
> +       *p++ = '(';

> +       p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> +                              sizeof(u32));

This is perfectly one line (in this file we have even longer lines).

> +       *p++ = ')';
> +       *p = '\0';
> +
> +       return string(buf, end, output, spec);
> +}

-- 
With Best Regards,
Andy Shevchenko
