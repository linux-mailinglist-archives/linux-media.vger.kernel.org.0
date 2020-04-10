Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD0C1A4CB4
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2020 01:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDJXtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 19:49:40 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44570 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgDJXtk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 19:49:40 -0400
Received: by mail-ed1-f68.google.com with SMTP id cb27so4227870edb.11
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2020 16:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Y0AqICzz6YXUN+/S/8xSrWj9VTXHTJ3wdYM2BfSzJg=;
        b=HZDdczKldeyJ8a7FFvOnmWeNgDF8BTOvkiyF6VONe+tIw26TDZTL0Q0hbqkFhsSMso
         ooegPBkIaIB1SwR/JgrKzCn0GL2bmTFInksH4oz6QMi+u1JdTmhoeFenlLHse13NRGNk
         D8xDlH2R5qYX5Jx172cK4UgQNtVsmTgPTzfXypaC9DfsugXQaFxzeQ9dkuyjbeHON/ou
         xhixE7aQXdFw1RLIgYbNJTdP3A7EA0sqlpLL0x4gKSPTG/b0MBEMVLWxJI7QgzXyoARd
         QRWfcrCiH7JUCSWqkPXvuZjb4pFQzVlOTuQmfkkHfe5WU0Aumq6HwnGuHJOMjLNY/tJ8
         uWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Y0AqICzz6YXUN+/S/8xSrWj9VTXHTJ3wdYM2BfSzJg=;
        b=oUUg6LWZjPiS7TgJVdTAdnXZZEX+QIYevyUD9vKbBAl4QMbEuHxN7RObet3n94jXWZ
         vyIbRnLRruJ8+DgWWUduefPK0aU/Lo6cDz+uPjUUpOI0THrxVk6VoL0naLflJZc662wS
         cNZNmjHctDGcCrAcYU3zimQQ9EhJrKESH7q9NZacFanT6F8gWcGZSdhOBNT9HbPg7EdF
         JOYgEnT8hlvQAp6SIu+i+g1THEoaw+igameiFn9VrL+T6lPqeDZYZ7xECDyaBmAiTO8R
         pUE0en3+nrqOJMlGw7gFQ7xWEyFa6mRInUXh1Wy9l5959QUz+Llg6g+1Z5Ip3LKsxtry
         Obew==
X-Gm-Message-State: AGi0PuaYGUcCoRB4n63ewle04Q/ASLnvPIIKWeSaYMHNGR9hSUOSl2dg
        faOczksxhyffKILXBBIEsiHl1hmSEaL8slWWYtA3Nw==
X-Google-Smtp-Source: APiQypIfnzbIGvnD9hfsPjp6BIZqmvJ7W1+dzRf+wwdbw0uzHy1COLV5z2Nfxmwb5v5Ukvz1sI0xDkRm8rB6LdT/feE=
X-Received: by 2002:a17:906:af6f:: with SMTP id os15mr6193537ejb.78.1586562578696;
 Fri, 10 Apr 2020 16:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195611.55421-1-ariel@vanguardiasur.com.ar> <20200408195611.55421-2-ariel@vanguardiasur.com.ar>
In-Reply-To: <20200408195611.55421-2-ariel@vanguardiasur.com.ar>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 10 Apr 2020 20:49:27 -0300
Message-ID: <CAAEAJfBd3vN_qs1gad7-YyXC5zrhJ76B97o-io3gfEss0UX9dQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] Add support for meson building
To:     "Ariel D'Alessandro" <ariel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, sean@mess.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Ariel,

First of all, thanks for picking up this task! I'm happy to see it
moving forward.

On Wed, 8 Apr 2020 at 16:56, Ariel D'Alessandro
<ariel@vanguardiasur.com.ar> wrote:
>
> Currently supports building libraries and tools found in lib/ and
> utils/ directories.
>
> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> ---
>  .gitignore                                    |   1 +
>  gen-version.sh                                |  36 +++++
>  lib/libdvbv5/meson.build                      | 142 +++++++++++++++++
>  lib/libv4l-mplane/meson.build                 |  16 ++
>  lib/libv4l1/meson.build                       |  53 +++++++
>  lib/libv4l2/meson.build                       |  65 ++++++++
>  lib/libv4l2rds/meson.build                    |  28 ++++
>  lib/libv4lconvert/meson.build                 | 105 +++++++++++++
>  lib/meson.build                               |  14 ++
>  meson.build                                   | 132 ++++++++++++++++
>  meson_options.txt                             |  39 +++++
>  utils/cec-compliance/meson.build              |  24 +++
>  utils/cec-ctl/meson.build                     |  18 +++
>  utils/cec-follower/meson.build                |  21 +++
>  utils/cx18-ctl/meson.build                    |   7 +
>  utils/dvb/meson.build                         |  69 ++++++++
>  utils/gen_media_bus_format_codes.sh           |   7 +
>  utils/gen_media_bus_format_names.sh           |   7 +
>  utils/ir-ctl/meson.build                      |  17 ++
>  utils/ivtv-ctl/meson.build                    |  13 ++
>  .../bpf_protocols/clang_sys_includes.sh       |   9 ++
>  utils/keytable/bpf_protocols/meson.build      |  31 ++++
>  utils/keytable/meson.build                    |  70 +++++++++
>  utils/keytable/rc_keymaps/meson.build         | 147 ++++++++++++++++++
>  utils/libcecutil/meson.build                  |  45 ++++++
>  utils/libmedia_dev/meson.build                |  14 ++
>  utils/libv4l2util/meson.build                 |  16 ++
>  utils/media-ctl/meson.build                   |  46 ++++++
>  utils/meson.build                             |  50 ++++++
>  utils/qv4l2/meson.build                       |  75 +++++++++
>  utils/qvidcap/meson.build                     |  75 +++++++++
>  utils/rds-ctl/meson.build                     |  13 ++
>  utils/v4l2-compliance/meson.build             |  60 +++++++
>  utils/v4l2-ctl/meson.build                    |  75 +++++++++
>  utils/v4l2-dbg/meson.build                    |  16 ++
>  utils/v4l2-sysfs-path/meson.build             |  13 ++
>  version.h.in                                  |   1 +
>  37 files changed, 1570 insertions(+)
>  create mode 100755 gen-version.sh
>  create mode 100644 lib/libdvbv5/meson.build
>  create mode 100644 lib/libv4l-mplane/meson.build
>  create mode 100644 lib/libv4l1/meson.build
>  create mode 100644 lib/libv4l2/meson.build
>  create mode 100644 lib/libv4l2rds/meson.build
>  create mode 100644 lib/libv4lconvert/meson.build
>  create mode 100644 lib/meson.build
>  create mode 100644 meson.build
>  create mode 100644 meson_options.txt
>  create mode 100644 utils/cec-compliance/meson.build
>  create mode 100644 utils/cec-ctl/meson.build
>  create mode 100644 utils/cec-follower/meson.build
>  create mode 100644 utils/cx18-ctl/meson.build
>  create mode 100644 utils/dvb/meson.build
>  create mode 100755 utils/gen_media_bus_format_codes.sh
>  create mode 100755 utils/gen_media_bus_format_names.sh
>  create mode 100644 utils/ir-ctl/meson.build
>  create mode 100644 utils/ivtv-ctl/meson.build
>  create mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
>  create mode 100644 utils/keytable/bpf_protocols/meson.build
>  create mode 100644 utils/keytable/meson.build
>  create mode 100644 utils/keytable/rc_keymaps/meson.build
>  create mode 100644 utils/libcecutil/meson.build
>  create mode 100644 utils/libmedia_dev/meson.build
>  create mode 100644 utils/libv4l2util/meson.build
>  create mode 100644 utils/media-ctl/meson.build
>  create mode 100644 utils/meson.build
>  create mode 100644 utils/qv4l2/meson.build
>  create mode 100644 utils/qvidcap/meson.build
>  create mode 100644 utils/rds-ctl/meson.build
>  create mode 100644 utils/v4l2-compliance/meson.build
>  create mode 100644 utils/v4l2-ctl/meson.build
>  create mode 100644 utils/v4l2-dbg/meson.build
>  create mode 100644 utils/v4l2-sysfs-path/meson.build
>  create mode 100644 version.h.in
>
[..]
> diff --git a/meson_options.txt b/meson_options.txt
> new file mode 100644
> index 00000000..c46eed32
> --- /dev/null
> +++ b/meson_options.txt
> @@ -0,0 +1,39 @@
> +# Features
> +option('jpeg', type : 'feature', value : 'auto')
> +option('udev', type : 'feature', value : 'auto')
> +
> +# Options
> +option('bpf', type : 'boolean',
> +       description : 'Enable IR BPF decoders')

I think BPF and the Qt tools should be auto features.
Something along these lines seems to work here:

diff --git a/meson.build b/meson.build
index 428fd403bee6..328a68c83768 100644
--- a/meson.build
+++ b/meson.build
@@ -37,7 +37,7 @@ v4l2_utils_incdir = include_directories(
 )

 prog_bash = find_program('bash')
-prog_clang = find_program('clang')
+prog_clang = find_program('clang', required : get_option('bpf'))
 prog_grep = find_program('grep')
 prog_perl = find_program('perl')

diff --git a/meson_options.txt b/meson_options.txt
index c46eed327781..4b5d1f4613b7 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -1,10 +1,10 @@
 # Features
 option('jpeg', type : 'feature', value : 'auto')
 option('udev', type : 'feature', value : 'auto')
+option('bpf', type : 'feature', value : 'auto',
+       description : 'Enable IR BPF decoders')

 # Options
-option('bpf', type : 'boolean',
-       description : 'Enable IR BPF decoders')
 option('libdvbv5', type : 'boolean',
        description : 'Enable libdvbv5 compilation')
 option('qv4l2', type : 'boolean',
diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
index e1e5b3851e95..2630b02aa164 100644
--- a/utils/keytable/meson.build
+++ b/utils/keytable/meson.build
@@ -11,7 +11,7 @@ ir_keytable_sources = files(

 ir_keytable_deps = []

-if get_option('bpf')
+if get_option('bpf').enabled()
     ir_keytable_sources += files(
         'bpf.c',
         'bpf.h',

I guess there could be something similar to do for Qt tools.
This way, we won't fail the build if that's not present.

Thanks,
Ezequiel
