Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C07C1C3FCB
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 18:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgEDQ1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 12:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728158AbgEDQ1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 12:27:35 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F59C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 09:27:34 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t12so11819575ile.9
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vems/syeWDuHZxfDxCxSkbWqojVpVjsZQKfB682BvMY=;
        b=ubk6me6pEGKBggtqvApwVlh70BBPX0f0m5eA4Q1WZ8GsbedeOugLSOyVSTDzWCAMhJ
         a7eCR/c3m5l025gtR30RU7FAnlf3NzsjLu96ph2xcgpmCowKyrlPYAHylM+tDhutQMB5
         raU9//eHhdVcjJUwm7mbV/icflBj/eufcFz9aFed3ngeyzFYlMNlJrPynWf6djYmR/Ub
         NKETFL9980l0xPeFT1DsYUHtgUUwnoGoSZS8e3QF43cKPeiua3J5sITi9MhXEmv4aiDI
         lHq/d9SkIoXueVFiE8kihpW2NxBKiLQe+C7xHPxcfdoNvMMLSoNPlNmKJXpFMFFCBZRD
         LcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vems/syeWDuHZxfDxCxSkbWqojVpVjsZQKfB682BvMY=;
        b=blsonFZRw7uolWjSE7mmDfgkIX6wT0uqvOThONjrAqs+K5Uxm8hMtouC9Dcec2MtyT
         KzKVxLEM1PXtjn+M+IFVMNYzoG9f2Lb/8bLWO8rCOyJ88sm3kUDtMvszJkNy1zEyyN9B
         uAGZ0/w0OObxzKDm1ASsAi+ICAWoL84UK9ZVz41snKbF6jLZTTUHQ28+GYQTgCLltn1M
         waaQn481wFrAghzW7taEvYalcV6nQZ3qBpqRGZ195DGCak1bKBa+AFASxHlD1Gvj5x/U
         1DAAUhp59PbEL0CPYBBrrN/6auMv/hCFPmPcG00Ug4c1ewJGuAv/jeI9vB6Y9Mn/9FHr
         vJDw==
X-Gm-Message-State: AGi0PuYaB9rtUsHs+l4clvTSrPsrzN2WLP1+wVLL5XPcJ2XV29g0OBtO
        KdhNQiSkmDlf5A3Hb4QzQIO0ElDnMsQJQXxwJKFKkA==
X-Google-Smtp-Source: APiQypLZJlejyJHYRbGILBMYWMB1UymktCGjlunt+QvgEaV8j7JfhqsDLs7nuBxdfhi67LUUBokONNhN7FEGPG3NNqE=
X-Received: by 2002:a92:5d0f:: with SMTP id r15mr16915355ilb.251.1588609653225;
 Mon, 04 May 2020 09:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200429151639.5003-1-ariel@vanguardiasur.com.ar>
 <20200429151639.5003-2-ariel@vanguardiasur.com.ar> <20200501081819.GA29107@gofer.mess.org>
In-Reply-To: <20200501081819.GA29107@gofer.mess.org>
From:   "Ariel D'Alessandro" <ariel@vanguardiasur.com.ar>
Date:   Mon, 4 May 2020 13:27:22 -0300
Message-ID: <CADutaf3s91o8D+2389iMH-TmuX4euC+m3Gu2St0uDb+6RoJ-ZQ@mail.gmail.com>
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
Thanks for the feedback!

On Fri, May 1, 2020 at 5:18 AM Sean Young <sean@mess.org> wrote:
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
> -snip-
>
> > diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
> > new file mode 100644
> > index 00000000..751cb702
> > --- /dev/null
> > +++ b/utils/keytable/meson.build
> > @@ -0,0 +1,70 @@
> > +ir_keytable_sources = files(
> > +    'ir-encode.c',
> > +    'ir-encode.h',
> > +    'keymap.c',
> > +    'keymap.h',
> > +    'keytable.c',
> > +    'parse.h',
> > +    'toml.c',
> > +    'toml.h',
> > +)
> > +
> > +ir_keytable_deps = []
> > +
> > +if not get_option('bpf').disabled() and prog_clang.found() and dep_libelf.found()
> > +    ir_keytable_sources += files(
> > +        'bpf.c',
> > +        'bpf.h',
> > +        'bpf_load.c',
> > +        'bpf_load.h',
> > +    )
> > +    ir_keytable_deps += [
> > +        dep_libelf,
> > +    ]
> > +    subdir('bpf_protocols')
> > +endif
> > +
> > +ir_keytable_system_dir = udevdir
> > +ir_keytable_user_dir = get_option('sysconfdir') / 'rc_keymaps'
> > +
> > +ir_keytable_c_args = [
> > +    '-DIR_KEYTABLE_SYSTEM_DIR="@0@"'.format(ir_keytable_system_dir),
> > +    '-DIR_KEYTABLE_USER_DIR="@0@"'.format(ir_keytable_user_dir),
> > +]
> > +
> > +ir_keytable_incdir = [
> > +    utils_common_incdir,
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +ir_keytable = executable('ir-keytable',
> > +                         sources : ir_keytable_sources,
> > +                         install : true,
> > +                         dependencies : ir_keytable_deps,
> > +                         c_args : ir_keytable_c_args,
> > +                         include_directories : ir_keytable_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'ir-keytable', 1 ]]
> > +man_pages += [[ meson.current_source_dir(), 'rc_keymap', 5 ]]
> > +
> > +ir_keytable_sysconf_files = files(
> > +    'rc_maps.cfg',
> > +)
> > +install_data(ir_keytable_sysconf_files,
> > +             install_dir : get_option('sysconfdir'))
> > +
> > +subdir('rc_keymaps')
> > +install_data(ir_keytable_rc_keymaps,
> > +             install_dir : udevdir / 'rc_keymaps')
> > +
> > +ir_keytable_udev_rules = files(
> > +    '70-infrared.rules',
> > +)
> > +install_data(ir_keytable_udev_rules,
> > +             install_dir : udevdir / 'rules.d')
> > +
> > +ir_keytable_systemd_files = files(
> > +    '50-rc_keymap.conf',
> > +)
> > +install_data(ir_keytable_systemd_files,
> > +             install_dir : systemd_systemdir / 'systemd-udevd.service.d')
>
> There seems to be no way overriding systemd_systemdir or udevdir. This
> would be very useful.

There's a way, as follows:

Meson way:
    $ meson -Dsystemdsystemunitdir=$my_path build/
    $ meson -Dudevdir=$my_path build/

Autoconf way:
    $ ./configure --with-systemdsystemunitdir=$my_path
    $ ./configure --with-udevdir=$my_path

The above will set systemd_systemdir or udevdir with the specified path.

> I don't think this can be done with autoconf either, so this is probably
> a nice to have. However with autoconf I can do "make -k install" to
> skip installing system udev/systemd files, but I don't know how to do
> with ninja.

Shall we provide an option to skip installing these system files?

> Lastly the meson build does not support sync-with-kernel. We can add
> this at some later point, I suppose.

True, that's not done yet. We should support it in the meson build in order
to replace autotools completely. I'll try to tackle that down ASAP.

Regards,
Ariel
