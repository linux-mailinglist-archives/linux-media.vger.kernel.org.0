Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD11E75FC
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 17:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390884AbfJ1QVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 12:21:09 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:56965 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728780AbfJ1QVJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 12:21:09 -0400
Received: from [172.20.7.25] ([77.158.50.100])
        by smtp-cloud9.xs4all.net with ESMTPA
        id P7lOiM0GmsBskP7lSiBPfS; Mon, 28 Oct 2019 17:21:06 +0100
Subject: Re: [PATCH v4l-utils] 50-rc_keymap.conf prevents debian testing from
 booting
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org
References: <20191028145604.22907-1-sean@mess.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3293723b-722f-6226-5742-09e7a071ca86@xs4all.nl>
Date:   Mon, 28 Oct 2019 17:21:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028145604.22907-1-sean@mess.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCu5IO5YI6OxtgQ5OZHwOu+wNZOmR013l3pzOrwaceT4DmvYIvR7hWXg3YHwARitygpCSOQdoe6ZjQpbjf29+hbRDbJnKXj/rN+CZUfYf4O12Yv2yXX6
 xTc/Lcf7dDw/gP0AjADAGsn61cEKMkLgzWU7FYLZUSJH9M7tOtQWYdleaoJaQIt3Mw7g9E1JNl3elC/xjIxoJYtmE3dHvOKN9KI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/28/19 3:56 PM, Sean Young wrote:
> If SystemCallFilter is not set for systemd-udevd, then 50-rc_keymap.conf
> restricts the service to _only_ the bpf syscall, preventing the system
> from booting.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>

Tested-by: Hans Verkuil <hverkuil@xs4all.nl>

Thanks! I think this should be merged quickly since it is not nice when
v4l-utils suddenly prevents your system from booting the next time.

Especially when you discover this two hours before you have to leave
for the airport to travel to the ELCE conference where you are
speaker the next day...

Just saying :-)

Regards,

	Hans

> Signed-off-by: Sean Young <sean@mess.org>
> ---
>   configure.ac               | 6 ++++++
>   utils/keytable/Makefile.am | 2 ++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/configure.ac b/configure.ac
> index 01a24a28..8585a79d 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -521,6 +521,12 @@ AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgcon
>   AS_IF([test x$enable_libdvbv5 = xno], [AC_SUBST([ENFORCE_LIBDVBV5_STATIC], ["-static"])])
>   AS_IF([test x$enable_libv4l = xno],   [AC_SUBST([ENFORCE_LIBV4L_STATIC],   ["-static"])])
>   
> +# Since systemd v239, udevd is not allowed to execute BPF systems calls;
> +# add an override to allow bpf(2) in that case. On earlier versions, the
> +# override will restrict udevd to bpf syscall only and will stop the system
> +# from booting. This is also true on current debian versions.
> +AM_CONDITIONAL([HAVE_UDEVDSYSCALLFILTER], [grep -s SystemCallFilter $with_systemdsystemunitdir/systemd-udevd.service])
> +
>   # misc
>   
>   if test "x$linux_os" = "xyes"; then
> diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
> index dfcd7609..4724897e 100644
> --- a/utils/keytable/Makefile.am
> +++ b/utils/keytable/Makefile.am
> @@ -3,7 +3,9 @@ man_MANS = ir-keytable.1 rc_keymap.5
>   sysconf_DATA = rc_maps.cfg
>   keytablesystem_DATA = $(srcdir)/rc_keymaps/*
>   udevrules_DATA = 70-infrared.rules
> +if HAVE_UDEVDSYSCALLFILTER
>   systemdsystemunit_DATA = 50-rc_keymap.conf
> +endif
>   
>   ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h
>   
> 

