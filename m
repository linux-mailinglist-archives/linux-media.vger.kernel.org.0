Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448E9229910
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 15:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbgGVNOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 09:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgGVNOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 09:14:51 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0FBC0619DC
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 06:14:51 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id ga4so2122877ejb.11
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JzjZ60VevyHxyvse9/8XcRfKtGPd4fyIXYCgchbbD1Q=;
        b=XrIA2b9CAos5sb2NXEU0bdZEPAPAtgKAJDOrsUSUoQ2dHggN7DzK0wjlFsH5s4ycow
         ytH5G68S6aH1A0XWzM6c1c58oO/H0GIsOhD7fpDfFh6uMfgRQ5fl4McmcjtZ8ya3cNMr
         O4DbiA3NqXpB1bjDbaOjAMyBUAhUzbw9mrw6w977dWGoFw5FuI9zdbDmAXGa+fk9VIBc
         ung7J1Bsm8z6E7U+aMv/HuztpZ9Hzph1i2quMORPdsnh1+vQm3EmfJUiMvml1QtfHoq5
         EHEX+YA+JtZ/AB8Lj1SXnML0d0FiqAh7mqef+bmtjv6kBOP0ATTOh/Rzx2izm5DCGFSV
         w8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JzjZ60VevyHxyvse9/8XcRfKtGPd4fyIXYCgchbbD1Q=;
        b=JQdgoNFyE5p6eaDLot3EE9JRBnp//1bovCXlcDjDbA7YQ3zVNWzFRfciHTDYt4DJQA
         GU8sBfLzwdNo3uLfZedd6i/BPJgm0FN1YIpIdd64tSTeTV32CDqTC5LaNJpPecDIs0f/
         MqJQxhp9rvUYwjZQNISJUBBDliYS0vR6L8sk4nJfEtuqRwQYjdF/RHnKMd3XyEvvIZxh
         xLIddvmlSqvEfsGdIpZmWiKPCV8ytVkaHE/R/fv5FCrhZxEPynAHDRlTf/mgVa1S5ZNl
         OCJ4dmlLgNalb87vSyhsJuH2wnPRwUIlid1ZDkmJpzKqo9Sq2McX4G1sBg602y3Q3sYc
         RdlA==
X-Gm-Message-State: AOAM530nU4HK7kIOWHr32XXKgexbyYqYShtDdwWY2S69ZCo8Bn6YAfTm
        4qyNxQCdnFTysNMIzmKMtGpTsj/pS0UhvtprfewB6A==
X-Google-Smtp-Source: ABdhPJx4I4Au5xy8c2ePSBJN/5ygSh/1YRtnxwHiCNkRvJAVVliy0+x85xJgnid2mkWJrk9liyyJl7540eSByL3WpD0=
X-Received: by 2002:a17:906:a1c7:: with SMTP id bx7mr29514854ejb.388.1595423690158;
 Wed, 22 Jul 2020 06:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200721151434.115651-1-ariel@vanguardiasur.com.ar>
In-Reply-To: <20200721151434.115651-1-ariel@vanguardiasur.com.ar>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 22 Jul 2020 10:14:38 -0300
Message-ID: <CAAEAJfDxtb4=NMCk8=Y=mw9-VdZ7Ag+q0D5VkyEzR4i6wHm=1Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Add support for meson building
To:     "Ariel D'Alessandro" <ariel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, sean@mess.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        kieran.bingham@ideasonboard.com, gjasny@googlemail.com,
        xavier.claessens@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        user.vdr@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ariel,

Thanks a lot for picking this up and pushing forward.

Do you think you can amend the README with instructions
how to build using meson and any other relevant information
you think would make sense?

(I'm aware this is scope creeping, but extra points for markdown conversion).

I think it would be relatively easy to do the Buildroot package port as well,
and so we'd have Debian and Buildroot ready, which would serve
as references.

Cheers,
Ezequiel

On Tue, 21 Jul 2020 at 12:15, Ariel D'Alessandro
<ariel@vanguardiasur.com.ar> wrote:
>
> Hello there,
>
> Here's another step on porting v4l-utils to meson build system.
> Following the discussion thread for v1, several changes were added (see
> Changelog below).
>
> Tested Debian/Ubuntu packaging scripts from Gregor Jasny, which can be
> found in branch `meson-build` from:
>
>     https://git.launchpad.net/\~libv4l/+git/v4l-utils-packaging
>
> This patchset was developed on top of v4l-utils tag: v4l-utils-1.20.0:
>
>     commit 3b22ab02b960e4d1e90618e9fce9b7c8a80d814a
>     Author: Gregor Jasny <gjasny@googlemail.com>
>         Prepare for 1.20.0 release
>
> You can find the patch pushed to the following branch:
>
>     https://gitlab.com/adalessandro/v4l-utils/-/tree/v4l-utils-1.20.0-meson-v2
>
> Further testing, deeper reviews, more comments, are all welcome :-)
>
> Changes from v1:
>
>   * Updated project version to 1.21.0.
>   * Fixed clang includes in keytable bpf compilation.
>   * Improved variable reutilization in meson scripts.
>   * Set libraries version and soversion.
>   * Control symbol visibility.
>   * Install empty 'protocols' directory in keytable user dir.
>   * Fixed svg filenames in qv4l2 and qvidcap.
>   * Added support for Doxygen documentation (html and man).
>   * Updated required meson version to v0.53 (for fs module).
>   * Added new files to EXTRA_DIST in each Makefile.am.
>
> Regards,
>
> Ariel D'Alessandro (1):
>   Add support for meson building
>
>  .gitignore                                    |    1 +
>  Makefile.am                                   |    3 +-
>  contrib/Makefile.am                           |    3 +-
>  contrib/cobalt-ctl/Makefile.am                |    2 +
>  contrib/cobalt-ctl/meson.build                |    8 +
>  contrib/decode_tm6000/Makefile.am             |    2 +
>  contrib/decode_tm6000/meson.build             |   14 +
>  contrib/gconv/Makefile.am                     |    2 +-
>  contrib/gconv/meson.build                     |   44 +
>  contrib/meson.build                           |   13 +
>  contrib/rds-saa6588/Makefile.am               |    2 +
>  contrib/rds-saa6588/meson.build               |    7 +
>  contrib/test/Makefile.am                      |    3 +-
>  contrib/test/meson.build                      |  143 +
>  contrib/xc3028-firmware/Makefile.am           |    2 +-
>  contrib/xc3028-firmware/meson.build           |   11 +
>  doc/Doxyfile.in                               | 2351 +++++++++++++++++
>  doc/meson.build                               |   34 +
>  gen-version.sh                                |   36 +
>  lib/Makefile.am                               |    2 +-
>  lib/libdvbv5/Makefile.am                      |    2 +-
>  lib/libdvbv5/meson.build                      |  154 ++
>  lib/libv4l-mplane/Makefile.am                 |    2 +
>  lib/libv4l-mplane/meson.build                 |   23 +
>  lib/libv4l1/Makefile.am                       |    2 +-
>  lib/libv4l1/meson.build                       |   61 +
>  lib/libv4l2/Makefile.am                       |    2 +-
>  lib/libv4l2/meson.build                       |   70 +
>  lib/libv4l2rds/Makefile.am                    |    2 +
>  lib/libv4l2rds/meson.build                    |   36 +
>  lib/libv4lconvert/Makefile.am                 |    2 +-
>  lib/libv4lconvert/meson.build                 |  113 +
>  lib/meson.build                               |   11 +
>  libdvbv5-po/meson.build                       |    3 +
>  meson.build                                   |  263 ++
>  meson_options.txt                             |   50 +
>  utils/Makefile.am                             |    2 +-
>  utils/cec-compliance/Makefile.am              |    2 +-
>  utils/cec-compliance/meson.build              |   24 +
>  utils/cec-ctl/Makefile.am                     |    2 +-
>  utils/cec-ctl/meson.build                     |   18 +
>  utils/cec-follower/Makefile.am                |    2 +-
>  utils/cec-follower/meson.build                |   21 +
>  utils/cx18-ctl/Makefile.am                    |    2 +
>  utils/cx18-ctl/meson.build                    |    8 +
>  utils/dvb/Makefile.am                         |    2 +-
>  utils/dvb/meson.build                         |   70 +
>  utils/gen_media_bus_format_codes.sh           |    7 +
>  utils/gen_media_bus_format_names.sh           |    7 +
>  utils/ir-ctl/Makefile.am                      |    2 +
>  utils/ir-ctl/meson.build                      |   23 +
>  utils/ivtv-ctl/Makefile.am                    |    2 +
>  utils/ivtv-ctl/meson.build                    |   13 +
>  utils/keytable/Makefile.am                    |    3 +-
>  utils/keytable/bpf_protocols/Makefile.am      |    3 +-
>  .../bpf_protocols/clang_sys_includes.sh       |    9 +
>  utils/keytable/bpf_protocols/meson.build      |   39 +
>  .../user_dir_protocols/README.md              |    1 +
>  utils/keytable/meson.build                    |   74 +
>  utils/keytable/rc_keymaps/meson.build         |  147 ++
>  utils/libcecutil/Makefile.am                  |    2 +-
>  utils/libcecutil/meson.build                  |   45 +
>  utils/libmedia_dev/Makefile.am                |    2 +-
>  utils/libmedia_dev/meson.build                |   14 +
>  utils/libv4l2util/Makefile.am                 |    2 +-
>  utils/libv4l2util/meson.build                 |   16 +
>  utils/media-ctl/Makefile.am                   |    2 +
>  utils/media-ctl/meson.build                   |   43 +
>  utils/meson.build                             |   46 +
>  utils/qv4l2/Makefile.am                       |    3 +-
>  utils/qv4l2/meson.build                       |   80 +
>  utils/qvidcap/Makefile.am                     |    3 +-
>  utils/qvidcap/meson.build                     |   82 +
>  utils/rds-ctl/Makefile.am                     |    1 +
>  utils/rds-ctl/meson.build                     |   13 +
>  utils/v4l2-compliance/Makefile.am             |    2 +-
>  utils/v4l2-compliance/meson.build             |   60 +
>  utils/v4l2-ctl/Makefile.am                    |    2 +-
>  utils/v4l2-ctl/meson.build                    |   75 +
>  utils/v4l2-dbg/Makefile.am                    |    2 +-
>  utils/v4l2-dbg/meson.build                    |   16 +
>  utils/v4l2-sysfs-path/Makefile.am             |    2 +
>  utils/v4l2-sysfs-path/meson.build             |   14 +
>  v4l-utils-po/meson.build                      |    3 +
>  version.h.in                                  |    1 +
>  85 files changed, 4468 insertions(+), 25 deletions(-)
>  create mode 100644 contrib/cobalt-ctl/meson.build
>  create mode 100644 contrib/decode_tm6000/meson.build
>  create mode 100644 contrib/gconv/meson.build
>  create mode 100644 contrib/meson.build
>  create mode 100644 contrib/rds-saa6588/meson.build
>  create mode 100644 contrib/test/meson.build
>  create mode 100644 contrib/xc3028-firmware/meson.build
>  create mode 100644 doc/Doxyfile.in
>  create mode 100644 doc/meson.build
>  create mode 100755 gen-version.sh
>  create mode 100644 lib/libdvbv5/meson.build
>  create mode 100644 lib/libv4l-mplane/meson.build
>  create mode 100644 lib/libv4l1/meson.build
>  create mode 100644 lib/libv4l2/meson.build
>  create mode 100644 lib/libv4l2rds/meson.build
>  create mode 100644 lib/libv4lconvert/meson.build
>  create mode 100644 lib/meson.build
>  create mode 100644 libdvbv5-po/meson.build
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
>  create mode 100644 utils/keytable/bpf_protocols/user_dir_protocols/README.md
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
>  create mode 100644 v4l-utils-po/meson.build
>  create mode 100644 version.h.in
>
> --
> 2.26.2
>
