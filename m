Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDA41C07FC
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 22:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgD3UdP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 16:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgD3UdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 16:33:15 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE09C035494
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 13:33:15 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id u189so2683740ilc.4
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 13:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bh2oJ/XVgYbiwcViNXU7Wr2Slvtj+Iv0KAYIbg/TCVU=;
        b=gO1UQD3j0EyTMqSrhJ7Yh0DuiACJTvn61/AGJbCPB/vq5AdDJAR7R58zSuJiecC50i
         Nj5LTFM0kF1YAueboWXB9Aj0UkJ/+GUp/UJsUFDCt8tJb4FTUs/Ku+wIXNDF7aZIzo0f
         UkKMKEE76datx/4y3bhQkuQjjlM9+RUTLEmFKABGJSp6k5X5M6HHNRcR3Gg31fWYnCtM
         ssc3vfSCDwryD0Owdniq+LvTQn+So5c9qQEtBsw03CmUOo014Ructl0XD+IQZZaNc2Nu
         YvKQ742zaxiuTdZIgU0V11ZKmpGFdmEbjm+xo+ECkKn7yUu49Odo8qb4K9mGVkFJVQbi
         CW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bh2oJ/XVgYbiwcViNXU7Wr2Slvtj+Iv0KAYIbg/TCVU=;
        b=Rq8DL8yQf5MIQ0J7UZMNbMUx3L1smXKhECzgcIxxqLglHa/EonTbMqSRgV7GyXa85S
         3rYvBJ0Iny19WDNDQKgIyKFQNI7Sb68u4pXRtoLEf6DMl7XKZMUHjIk6DdTAemEfRDNL
         18qFyaKfS1GnPja90Kd0LyAzXUQNvXHZERWxcNHNAcaiQwlDjQJGEksx0f8V8HYkX80O
         kPV1/zOw7KfIA7g0m3z8KPTyj39hyCXxmNHSOZGg0WV98kJjvQR2/gRlJbeXOraRONKa
         /lyJHQjMFnIhphWBIPPKlYJr+TzLo0eAbqV9Ins85GEVa+JBVbGyRleweCRtZwbTsC2M
         osIw==
X-Gm-Message-State: AGi0PuaKPyKMHvDn0kwwMZx8o0I0iBOqa2cNk4IBBH9JceJ+aZXpy8sQ
        6aM65FiWHL4iI6/boohtbvUUq67i3dvwTxnj799zlw==
X-Google-Smtp-Source: APiQypL2zKplW9etbDIRkHGYcvPRSmYJJprYefEdlrJ2pZ++aSYKQnhzayNkkVXSiXFIyV9DfVTAAzUZe4qMgKmu6Eg=
X-Received: by 2002:a92:5d0f:: with SMTP id r15mr164679ilb.251.1588278794535;
 Thu, 30 Apr 2020 13:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200429151639.5003-1-ariel@vanguardiasur.com.ar>
 <20200429151639.5003-2-ariel@vanguardiasur.com.ar> <20200430194840.GA19358@gofer.mess.org>
In-Reply-To: <20200430194840.GA19358@gofer.mess.org>
From:   "Ariel D'Alessandro" <ariel@vanguardiasur.com.ar>
Date:   Thu, 30 Apr 2020 17:33:01 -0300
Message-ID: <CADutaf0-=r-zwf7Z90XJq3+PnpyEYOVv5LBi5DQDzYKVkTV4Zw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/1] Add support for meson building
To:     Sean Young <sean@mess.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Rosen Penev <rosenp@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

On Thu, Apr 30, 2020 at 4:48 PM Sean Young <sean@mess.org> wrote:
>
> On Wed, Apr 29, 2020 at 12:16:39PM -0300, Ariel D'Alessandro wrote:
> > Supports building libraries and tools found in contrib/, lib/ and
> > utils/ directories, along with the implemented gettext translations.
> >
> > Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> > ---
> >  .gitignore                                    |   1 +
>
> ...
>
> > +# Detect system gconv directory
> > +gconvsysdir = get_option('gconvsysdir')
> > +
> > +# Generic check: works with most distributions
> > +gconv_dirs_generic = [
> > +    '/lib',
> > +    '/lib64',
>
> On Fedora 32 (just released yesterday), I have to /lib64 before /lib in this
> list. Otherwise, dep_jis becomes /lib/gconv/libJIS.so, which is the 32
> bit version. It should be /lib64/gconv/libJIS.so

Makes sense. I'll keep the directories order as it is in the configure.ac file.

>
> > +    '/usr/lib',
> > +    '/usr/lib64',
> > +    '/usr/local/lib',
> > +    '/usr/local/lib64',
> > +]
> > +
> > +if gconvsysdir == ''
> > +    foreach dir : gconv_dirs_generic
> > +        dir = dir / 'gconv'
> > +        if fs.is_dir(dir)
> > +            gconvsysdir = dir
> > +            break
> > +        endif
> > +    endforeach
> > +endif
> > +
> > +# Debian/Ubuntu-specific check: should be aligned with the debian package
> > +gconv_dirs_debian = [
> > +    'alphaev67-linux-gnu',
> > +    'arm-linux-gnueabi',
> > +    'arm-linux-gnueabihf',
> > +    'i686-kfreebsd-gnu',
> > +    'i686-linux-gnu',
> > +    'mips-linux-gnu',
> > +    'mips64-linux-gnuabi64',
> > +    'mips64-linux-gnuabin32',
> > +    'mips64el-linux-gnuabi64',
> > +    'mips64el-linux-gnuabin32',
> > +    'mipsel-linux-gnu',
> > +    'mipsisa32r6-linux-gnu',
> > +    'mipsisa32r6el-linux-gnu',
> > +    'mipsisa64r6-linux-gnuabi64',
> > +    'mipsisa64r6-linux-gnuabin32',
> > +    'mipsisa64r6el-linux-gnuabi64',
> > +    'mipsisa64r6el-linux-gnuabin32',
> > +    'powerpc-linux-gnu',
> > +    'powerpc64-linux-gnu',
> > +    's390-linux-gnu',
> > +    'sparc64-linux-gnu',
> > +    'sparcv9-linux-gnu',
> > +    'x86_64-linux-gnu',
> > +    'x86_64-linux-gnux32',
> > +]
> > +if gconvsysdir == ''
> > +    foreach dir : gconv_dirs_debian
> > +        dir = '/usr' / 'lib' / dir / 'gconv'
> > +        if fs.is_dir(dir)
> > +            gconv_dir = dir
> > +            break
> > +        endif
> > +    endforeach
> > +endif
> > +
> > +dep_jis = cc.find_library('JIS', required : get_option('gconv'), dirs : gconvsysdir)
> > +dep_jisx0213 = cc.find_library('JISX0213', required : get_option('gconv'), dirs : gconvsysdir)
> > +
> > +dep_jpeg = dependency('libjpeg', required : get_option('jpeg'))
> > +if dep_jpeg.found()
> > +    dep_jpeg_priv_libs = '-ljpeg'
> > +endif
>
>
> Looks great otherwise, thank you for doing this!
>
>
> Sean
