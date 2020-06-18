Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B011FF31A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 15:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729460AbgFRNdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 09:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbgFRNdG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 09:33:06 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C017AC06174E
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 06:33:04 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id v19so1918830qtq.10
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 06:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KzC03s71VEdQX33g+J1UgLz2onI9vRrnRw0hKM/tFZ4=;
        b=GPUNRC/nkS7fQZMhohs1Sm//fIgtgVElwB+o3SPBn1Ht6rx9t3Pv7ZAeo6Al9ElWZm
         /Nq3atKTf02FQHDuua+11+niJonp5uymLpVmvgHLRSpluJFLXjt4h67dUy7nt/5HDDWc
         GsuSHoe734zjj2eqVZf/4NKQjbLKKY1bTt/LLi8L87qja16KC8IFOdotr0/onClZQyZM
         NK+ZQezowtJIeyjhZ1HhD7w+Tk9Ot4N3ZBC37l5QpNOx8RvqCw0waCBYpc00ttykI05Y
         noCmLFupU4F51Fov/6Fmn7e3KyXBEKW4ZuEk10Vm/xttoJ/livfNz5EeQsFiBxl7zXGE
         4P/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KzC03s71VEdQX33g+J1UgLz2onI9vRrnRw0hKM/tFZ4=;
        b=e2dvrYXptBjwoiEoVL8IYWHD65NlhuA8jIcpP7zUYEOCy+K1LebMhQjGLFsmBZdS2n
         xoIw696DUwkvtihVmGmthcRax/gGXy91wwMiWJhu01+oKd+4YnqGh+NUKc7y39pMVqd5
         +kjHcNtHn71BFkTDW+L5b+DjL5t4du0K0SHsaGu8Bs2w4qkU6+8k4XHn3aCVaDaLOSI7
         n6kg/nDc07z44zeViOqbh9IBI8UeEIuquzP5u7Vbe8+ZHXRJ5AbNsAGuJiVv6jNIvtfV
         1jV53xYemtttdJ1rJKdEHmK/YL0Nd/0eNQENI2f5vwb2l15bz/mbn4sJuwcW+TG1+CPY
         TK1w==
X-Gm-Message-State: AOAM532R1xq7UB7ijFlnyMOmyM/teYaDUtAwo1rlSi8nEkpyu6360iT2
        eThH4RG4f6Q/7J3R5PZ/Rzr9M4WXCB3zFL7z
X-Google-Smtp-Source: ABdhPJwUEors+kvEd9jzPgZYwzUTFyHTr3Xz6A26Hxws7YM7qmdULbRIhUoXtJ+zrtguN2XiGzK+8A==
X-Received: by 2002:ac8:4e86:: with SMTP id 6mr4446576qtp.390.1592487183638;
        Thu, 18 Jun 2020 06:33:03 -0700 (PDT)
Received: from ariel-arch.fibertel.com.ar (201-212-81-161.cab.prima.net.ar. [201.212.81.161])
        by smtp.gmail.com with ESMTPSA id c4sm2994265qko.118.2020.06.18.06.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 06:33:03 -0700 (PDT)
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        ariel@vanguardiasur.com.ar, gjasny@googlemail.com
Subject: [PATCH v1 0/1] Add support for meson building
Date:   Thu, 18 Jun 2020 10:33:02 -0300
Message-Id: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

After a couple of RFCs, here's the final patchset adding support for the
meson build system.

All functionality provided by the autotools based build was ported to
meson, except sync-with-kernel. I guess we can add it at some later
point and have this merged anyway.

Native and cross compilation has been tested with several options. Any
feedback, testing or suggestions are welcome. Looking forward to see
this merged in the next release hopefully :-)

Here's a simple comparison between meson and autotools performance for a
native build:

    $ time meson build/
        [...]
        real    0m3.172s
        user    0m2.698s
        sys     0m0.577s
    $ time ninja -C build/ -j4
        [...]
        real    0m19.533s
        user    1m11.860s
        sys     0m7.956s

    $ time (./bootstrap.sh && ./configure)
        [...]
        real    0m19.289s
        user    0m16.448s
        sys     0m2.756s
    $ time make -j4
        [...]
        real    0m55.250s
        user    2m29.425s
        sys     0m10.829s

This patchset was developed on top of v4l-utils tag: v4l-utils-1.20.0:

    commit 3b22ab02b960e4d1e90618e9fce9b7c8a80d814a
    Author: Gregor Jasny <gjasny@googlemail.com>
        Prepare for 1.20.0 release

You can find the patch pushed to the following branch:

    https://gitlab.com/adalessandro/v4l-utils/-/tree/v4l-utils-1.20.0-meson-v1

Regards,

Ariel D'Alessandro (1):
  Add support for meson building

 .gitignore                                    |   1 +
 contrib/cobalt-ctl/meson.build                |   8 +
 contrib/decode_tm6000/meson.build             |  14 +
 contrib/gconv/meson.build                     |  42 +++
 contrib/meson.build                           |  13 +
 contrib/rds-saa6588/meson.build               |   7 +
 contrib/test/meson.build                      | 143 ++++++++++
 contrib/xc3028-firmware/meson.build           |  11 +
 gen-version.sh                                |  36 +++
 lib/libdvbv5/meson.build                      | 152 +++++++++++
 lib/libv4l-mplane/meson.build                 |  16 ++
 lib/libv4l1/meson.build                       |  52 ++++
 lib/libv4l2/meson.build                       |  64 +++++
 lib/libv4l2rds/meson.build                    |  27 ++
 lib/libv4lconvert/meson.build                 | 107 ++++++++
 lib/meson.build                               |  11 +
 libdvbv5-po/meson.build                       |   3 +
 meson.build                                   | 255 ++++++++++++++++++
 meson_options.txt                             |  42 +++
 utils/cec-compliance/meson.build              |  24 ++
 utils/cec-ctl/meson.build                     |  18 ++
 utils/cec-follower/meson.build                |  21 ++
 utils/cx18-ctl/meson.build                    |   8 +
 utils/dvb/meson.build                         |  70 +++++
 utils/gen_media_bus_format_codes.sh           |   7 +
 utils/gen_media_bus_format_names.sh           |   7 +
 utils/ir-ctl/meson.build                      |  23 ++
 utils/ivtv-ctl/meson.build                    |  13 +
 .../bpf_protocols/clang_sys_includes.sh       |   9 +
 utils/keytable/bpf_protocols/meson.build      |  31 +++
 utils/keytable/meson.build                    |  74 +++++
 utils/keytable/rc_keymaps/meson.build         | 147 ++++++++++
 utils/libcecutil/meson.build                  |  45 ++++
 utils/libmedia_dev/meson.build                |  14 +
 utils/libv4l2util/meson.build                 |  16 ++
 utils/media-ctl/meson.build                   |  43 +++
 utils/meson.build                             |  46 ++++
 utils/qv4l2/meson.build                       |  80 ++++++
 utils/qvidcap/meson.build                     |  82 ++++++
 utils/rds-ctl/meson.build                     |  13 +
 utils/v4l2-compliance/meson.build             |  60 +++++
 utils/v4l2-ctl/meson.build                    |  75 ++++++
 utils/v4l2-dbg/meson.build                    |  16 ++
 utils/v4l2-sysfs-path/meson.build             |  14 +
 v4l-utils-po/meson.build                      |   3 +
 version.h.in                                  |   1 +
 46 files changed, 1964 insertions(+)
 create mode 100644 contrib/cobalt-ctl/meson.build
 create mode 100644 contrib/decode_tm6000/meson.build
 create mode 100644 contrib/gconv/meson.build
 create mode 100644 contrib/meson.build
 create mode 100644 contrib/rds-saa6588/meson.build
 create mode 100644 contrib/test/meson.build
 create mode 100644 contrib/xc3028-firmware/meson.build
 create mode 100755 gen-version.sh
 create mode 100644 lib/libdvbv5/meson.build
 create mode 100644 lib/libv4l-mplane/meson.build
 create mode 100644 lib/libv4l1/meson.build
 create mode 100644 lib/libv4l2/meson.build
 create mode 100644 lib/libv4l2rds/meson.build
 create mode 100644 lib/libv4lconvert/meson.build
 create mode 100644 lib/meson.build
 create mode 100644 libdvbv5-po/meson.build
 create mode 100644 meson.build
 create mode 100644 meson_options.txt
 create mode 100644 utils/cec-compliance/meson.build
 create mode 100644 utils/cec-ctl/meson.build
 create mode 100644 utils/cec-follower/meson.build
 create mode 100644 utils/cx18-ctl/meson.build
 create mode 100644 utils/dvb/meson.build
 create mode 100755 utils/gen_media_bus_format_codes.sh
 create mode 100755 utils/gen_media_bus_format_names.sh
 create mode 100644 utils/ir-ctl/meson.build
 create mode 100644 utils/ivtv-ctl/meson.build
 create mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
 create mode 100644 utils/keytable/bpf_protocols/meson.build
 create mode 100644 utils/keytable/meson.build
 create mode 100644 utils/keytable/rc_keymaps/meson.build
 create mode 100644 utils/libcecutil/meson.build
 create mode 100644 utils/libmedia_dev/meson.build
 create mode 100644 utils/libv4l2util/meson.build
 create mode 100644 utils/media-ctl/meson.build
 create mode 100644 utils/meson.build
 create mode 100644 utils/qv4l2/meson.build
 create mode 100644 utils/qvidcap/meson.build
 create mode 100644 utils/rds-ctl/meson.build
 create mode 100644 utils/v4l2-compliance/meson.build
 create mode 100644 utils/v4l2-ctl/meson.build
 create mode 100644 utils/v4l2-dbg/meson.build
 create mode 100644 utils/v4l2-sysfs-path/meson.build
 create mode 100644 v4l-utils-po/meson.build
 create mode 100644 version.h.in

-- 
2.26.2

