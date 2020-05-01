Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386EB1C0F4F
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 10:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgEAISY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 04:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728277AbgEAISV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 04:18:21 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F83C035494
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 01:18:21 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 59C5FC63DC; Fri,  1 May 2020 09:18:19 +0100 (BST)
Date:   Fri, 1 May 2020 09:18:19 +0100
From:   Sean Young <sean@mess.org>
To:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, rosenp@gmail.com, hverkuil@xs4all.nl,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [RFC PATCH v3 1/1] Add support for meson building
Message-ID: <20200501081819.GA29107@gofer.mess.org>
References: <20200429151639.5003-1-ariel@vanguardiasur.com.ar>
 <20200429151639.5003-2-ariel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429151639.5003-2-ariel@vanguardiasur.com.ar>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 29, 2020 at 12:16:39PM -0300, Ariel D'Alessandro wrote:
> Supports building libraries and tools found in contrib/, lib/ and
> utils/ directories, along with the implemented gettext translations.
> 
> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> ---
>  .gitignore                                    |   1 +

-snip-

> diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
> new file mode 100644
> index 00000000..751cb702
> --- /dev/null
> +++ b/utils/keytable/meson.build
> @@ -0,0 +1,70 @@
> +ir_keytable_sources = files(
> +    'ir-encode.c',
> +    'ir-encode.h',
> +    'keymap.c',
> +    'keymap.h',
> +    'keytable.c',
> +    'parse.h',
> +    'toml.c',
> +    'toml.h',
> +)
> +
> +ir_keytable_deps = []
> +
> +if not get_option('bpf').disabled() and prog_clang.found() and dep_libelf.found()
> +    ir_keytable_sources += files(
> +        'bpf.c',
> +        'bpf.h',
> +        'bpf_load.c',
> +        'bpf_load.h',
> +    )
> +    ir_keytable_deps += [
> +        dep_libelf,
> +    ]
> +    subdir('bpf_protocols')
> +endif
> +
> +ir_keytable_system_dir = udevdir
> +ir_keytable_user_dir = get_option('sysconfdir') / 'rc_keymaps'
> +
> +ir_keytable_c_args = [
> +    '-DIR_KEYTABLE_SYSTEM_DIR="@0@"'.format(ir_keytable_system_dir),
> +    '-DIR_KEYTABLE_USER_DIR="@0@"'.format(ir_keytable_user_dir),
> +]
> +
> +ir_keytable_incdir = [
> +    utils_common_incdir,
> +    v4l2_utils_incdir,
> +]
> +
> +ir_keytable = executable('ir-keytable',
> +                         sources : ir_keytable_sources,
> +                         install : true,
> +                         dependencies : ir_keytable_deps,
> +                         c_args : ir_keytable_c_args,
> +                         include_directories : ir_keytable_incdir)
> +
> +man_pages += [[ meson.current_source_dir(), 'ir-keytable', 1 ]]
> +man_pages += [[ meson.current_source_dir(), 'rc_keymap', 5 ]]
> +
> +ir_keytable_sysconf_files = files(
> +    'rc_maps.cfg',
> +)
> +install_data(ir_keytable_sysconf_files,
> +             install_dir : get_option('sysconfdir'))
> +
> +subdir('rc_keymaps')
> +install_data(ir_keytable_rc_keymaps,
> +             install_dir : udevdir / 'rc_keymaps')
> +
> +ir_keytable_udev_rules = files(
> +    '70-infrared.rules',
> +)
> +install_data(ir_keytable_udev_rules,
> +             install_dir : udevdir / 'rules.d')
> +
> +ir_keytable_systemd_files = files(
> +    '50-rc_keymap.conf',
> +)
> +install_data(ir_keytable_systemd_files,
> +             install_dir : systemd_systemdir / 'systemd-udevd.service.d')

There seems to be no way overriding systemd_systemdir or udevdir. This
would be very useful.

I don't think this can be done with autoconf either, so this is probably
a nice to have. However with autoconf I can do "make -k install" to
skip installing system udev/systemd files, but I don't know how to do
with ninja.

Lastly the meson build does not support sync-with-kernel. We can add
this at some later point, I suppose.


Sean
