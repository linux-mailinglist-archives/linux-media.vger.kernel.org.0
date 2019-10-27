Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40D50E62F9
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2019 15:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfJ0OTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Oct 2019 10:19:18 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:33751 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726541AbfJ0OTS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Oct 2019 10:19:18 -0400
Received: from [192.168.43.5] ([188.206.65.12])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OjNvi88SPfrRWOjNzibLbu; Sun, 27 Oct 2019 15:19:15 +0100
Subject: Re: [PATCH v4l-utils v2 2/2] keytable: cannot load BPF decoders from
 udevd
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org
References: <20191024153305.22150-1-sean@mess.org>
 <20191024153305.22150-2-sean@mess.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <db373e7d-4ead-7b4f-1e2b-d5dd18975184@xs4all.nl>
Date:   Sun, 27 Oct 2019 15:18:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024153305.22150-2-sean@mess.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAJC36+cC4SANGikMlNHf7Bx/sgJE3cdVn/bOQIxokhNZ5pSN6e+VOnVWBJ/cg6/YbpxXB7RXxm+OeA2Z5d+hQ7e8bxXRNfpD8kiMnhMd3csgZyhA4Tu
 DlbcKh5el7lBLaJk1345nKQYHWttShCx6PXWv30LACBNxHEI4UPHj6Ydr41S0I6Lrm5HUMg4CoaSLoDrx15r4W3w4G97lVt6i+c=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

After this was installed on my debian system (running the 'testing' 
version of debian) the laptop would no longer boot since the 
systemd-udevd service failed to load.

My laptop runs systemd 242.

After removing the installed 50-rc_keymap.conf it worked again.

So either this file is no good, or it requires a newer systemd for it to 
work.

Regards,

	Hans

On 10/24/19 5:33 PM, Sean Young wrote:
> By default udevd is not allowed to execute BPF syscalls. Implement
> workaround as suggested in:
> 
> 	https://github.com/systemd/systemd/issues/13787
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>   configure.ac                     | 6 ++++++
>   utils/keytable/50-rc_keymap.conf | 3 +++
>   utils/keytable/Makefile.am       | 3 ++-
>   v4l-utils.spec.in                | 2 ++
>   4 files changed, 13 insertions(+), 1 deletion(-)
>   create mode 100644 utils/keytable/50-rc_keymap.conf
> 
> diff --git a/configure.ac b/configure.ac
> index c84067ae..01a24a28 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -362,6 +362,11 @@ AC_ARG_WITH(udevdir,
>      	[],
>   	[with_udevdir=`$PKG_CONFIG --variable=udevdir udev || echo /lib/udev`])
>   
> +AC_ARG_WITH(systemdsystemunitdir,
> +	AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [set systemd system unit directory]),
> +	[],
> +	[with_systemdsystemunitdir=`$PKG_CONFIG --variable=systemdsystemunitdir systemd || echo /lib/systemd/system`])
> +
>   # Generic check: works with most distributions
>   def_gconv_dir=`for i in /lib64 /usr/lib64 /usr/local/lib64 /lib /usr/lib /usr/local/lib; do if @<:@ -d \$i/gconv @:>@; then echo \$i/gconv; break; fi; done`
>   
> @@ -384,6 +389,7 @@ AC_SUBST([libv4lconvertprivdir], [$libdir/$with_libv4lconvertsubdir])
>   AC_SUBST([keytablesystemdir], [$with_udevdir/rc_keymaps])
>   AC_SUBST([keytableuserdir], [$sysconfdir/rc_keymaps])
>   AC_SUBST([udevrulesdir], [$with_udevdir/rules.d])
> +AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir/systemd-udevd.service.d/])
>   AC_SUBST([pkgconfigdir], [$libdir/pkgconfig])
>   AC_SUBST([gconvsysdir], [$with_gconvdir])
>   
> diff --git a/utils/keytable/50-rc_keymap.conf b/utils/keytable/50-rc_keymap.conf
> new file mode 100644
> index 00000000..6066c50c
> --- /dev/null
> +++ b/utils/keytable/50-rc_keymap.conf
> @@ -0,0 +1,3 @@
> +# ir-keytable needs access to bpf in order load BPF decoders
> +[Service]
> +SystemCallFilter=bpf
> diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
> index d7b30e2c..dfcd7609 100644
> --- a/utils/keytable/Makefile.am
> +++ b/utils/keytable/Makefile.am
> @@ -3,6 +3,7 @@ man_MANS = ir-keytable.1 rc_keymap.5
>   sysconf_DATA = rc_maps.cfg
>   keytablesystem_DATA = $(srcdir)/rc_keymaps/*
>   udevrules_DATA = 70-infrared.rules
> +systemdsystemunit_DATA = 50-rc_keymap.conf
>   
>   ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h
>   
> @@ -18,7 +19,7 @@ ir_keytable_LDFLAGS += $(LIBELF_LIBS)
>   SUBDIRS = bpf_protocols
>   endif
>   
> -EXTRA_DIST = 70-infrared.rules rc_keymaps rc_keymaps_userspace gen_input_events.pl gen_keytables.pl ir-keytable.1 rc_maps.cfg rc_keymap.5
> +EXTRA_DIST = 70-infrared.rules 50-rc_keymap.conf rc_keymaps rc_keymaps_userspace gen_input_events.pl gen_keytables.pl ir-keytable.1 rc_maps.cfg rc_keymap.5
>   
>   check:
>   	@$(foreach keymap,$(wildcard $(keytablesystem_DATA)),./ir-keytable --test-keymap=$(keymap);)
> diff --git a/v4l-utils.spec.in b/v4l-utils.spec.in
> index d9d46706..a368d3fe 100644
> --- a/v4l-utils.spec.in
> +++ b/v4l-utils.spec.in
> @@ -121,6 +121,7 @@ make doxygen-run
>   
>   %install
>   %{!?_udevrulesdir: %global _udevrulesdir /lib/udev/rules.d}
> +%{!?_systemdsystemunitdir: %global _systemdsystemunitdir /lib/systemd/system}
>   %make_install
>   find $RPM_BUILD_ROOT -name '*.la' -exec rm -f {} ';'
>   rm -f $RPM_BUILD_ROOT%{_libdir}/{v4l1compat.so,v4l2convert.so}
> @@ -142,6 +143,7 @@ desktop-file-validate $RPM_BUILD_ROOT%{_datadir}/applications/qv4l2.desktop
>   %config(noreplace) %{_sysconfdir}/rc_maps.cfg
>   %{_udevrulesdir}/70-infrared.rules
>   %{_udevrulesdir}/../rc_keymaps/*
> +%{_systemdsystemunitdir}/50-rc_keymap.conf
>   %{_bindir}/cx18-ctl
>   %{_bindir}/cec*
>   %{_bindir}/dvb*
> 

