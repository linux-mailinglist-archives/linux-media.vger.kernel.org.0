Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550FC1BE25A
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 17:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgD2PQt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 11:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgD2PQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 11:16:48 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F16C03C1AD
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 08:16:48 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id h124so2284200qke.11
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iJJZSSZBDxrYd3Iw8y6t7LleITOoKpnV8+aFNzkLH6g=;
        b=Z7gHTBDgWgwDVPHr+JBvEhKRyKehZOLlaa9iuDe+qnu/0rphzw4CvuyZU7g1dmESEB
         HwCJZQZYo5fepCj2N54XPPhlyLdhqsMY1CXkxEmPmZtnIEZ+eyoWJ9R8cKYN9MqeduQO
         5NmlPa19Viyf5K2wImkOcvjRE4auFTPcGegmG31C66ThCayT4M8ZQk5SY6xU91/xOLe5
         fDHuyI1gpukZ2taTAh5Pd2nUf6V19tZ4iqgWqGIVTmy3Aina4LOc7zuwn2cR2uOtNs4N
         7jkE5JZwtYFu4/F12ZSUZJ68vo0gVEcO//m89oT+EOkMdXnPE8Cux5IDuA2/99esQJ3q
         UkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iJJZSSZBDxrYd3Iw8y6t7LleITOoKpnV8+aFNzkLH6g=;
        b=YV8qIqVTSD08ZlhxQ22kesvDK7+wksAr62FnYh7pAGzmz4Vq5dGE9ebLRNG4M146bH
         9jqkKjv2JII0tPmgnLxKyfMvGtEYNaDxr3chA43/FItu7fy0FIe87bKJBRWkDFIG+0eP
         dxtLblow8imNEf+tuLVHcsR2GVas1HtlDimw+bXkHx7fwlmmY7XBJYsjdHEipetoKsqv
         d0etb4BwJz0JUsq99jkAbI5yrc8wUQYwiDCngO+T6Exw0FpDRQItO52sK5U/Msf66clQ
         +o3YkTOtU0JSnexpEK7OhuBvwZANeWQW63h7BbtWxx6KUykPOS6hj2R5Z8If4l3wSA9p
         feGw==
X-Gm-Message-State: AGi0Pubmyw8jFJtPp8mvIzYBr4b6z9QTB4/aJw9LZJn9OjOLGljCtdCJ
        rwL28AdaNXpxNUqX3D1+UeG+gIW/IHvgrQ==
X-Google-Smtp-Source: APiQypJMZ/3rme3twuYLSpxuqW+ks1hcTkdACopRqPZwQx8Db/eD2AG5d2GjKlVZ8Ij6ALTx03P34Q==
X-Received: by 2002:a37:a3d8:: with SMTP id m207mr33360001qke.371.1588173407683;
        Wed, 29 Apr 2020 08:16:47 -0700 (PDT)
Received: from localhost.localdomain (38-151-126-200.fibertel.com.ar. [200.126.151.38])
        by smtp.gmail.com with ESMTPSA id c139sm15981716qkg.8.2020.04.29.08.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 08:16:47 -0700 (PDT)
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org
Cc:     rosenp@gmail.com, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com, ariel@vanguardiasur.com.ar
Subject: [RFC PATCH v3 0/1] Add support for meson building
Date:   Wed, 29 Apr 2020 12:16:38 -0300
Message-Id: <20200429151639.5003-1-ariel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Finally got some time to put another patchset together.

Any feedback, testing or suggestion is welcome. I'll be submitting this
patchset soon if no further major changes are needed.

I'd like to get some comments from v4l-utils developers about the
feature options mainly. I tried keeping the configuration behaviour
from autotools scripts as much as possible. 

Changes from v2:

  * Added support to build contrib/.
  * Added support for gettext translations.
  * Move several boolean options to features.
  * Libraries in lib/ are now defined as library() instead of
    shared_library(), so default_library option is used.
  * Minor fixes on lib/ utils/ support.

This patchset has been developed on top of v4l-utils commit:

    commit 9c3d3fde6b5c5102293edbb25d1f4a73d39dc04e
    Author: Rosen Penev <rosenp@gmail.com>
        utils: do not use empty void with C++

Thanks!

Ariel D'Alessandro (1):
  Add support for meson building

 .gitignore                                    |   1 +
 contrib/cobalt-ctl/meson.build                |   7 +
 contrib/decode_tm6000/meson.build             |  13 +
 contrib/gconv/meson.build                     |  42 ++++
 contrib/meson.build                           |  10 +
 contrib/rds-saa6588/meson.build               |   6 +
 contrib/test/meson.build                      | 132 +++++++++++
 contrib/xc3028-firmware/meson.build           |  10 +
 gen-version.sh                                |  36 +++
 lib/libdvbv5/meson.build                      | 151 ++++++++++++
 lib/libv4l-mplane/meson.build                 |  16 ++
 lib/libv4l1/meson.build                       |  53 +++++
 lib/libv4l2/meson.build                       |  65 +++++
 lib/libv4l2rds/meson.build                    |  28 +++
 lib/libv4lconvert/meson.build                 | 105 +++++++++
 lib/meson.build                               |  11 +
 libdvbv5-po/meson.build                       |   3 +
 meson.build                                   | 222 ++++++++++++++++++
 meson_options.txt                             |  42 ++++
 utils/cec-compliance/meson.build              |  24 ++
 utils/cec-ctl/meson.build                     |  18 ++
 utils/cec-follower/meson.build                |  21 ++
 utils/cx18-ctl/meson.build                    |   7 +
 utils/dvb/meson.build                         |  69 ++++++
 utils/gen_media_bus_format_codes.sh           |   7 +
 utils/gen_media_bus_format_names.sh           |   7 +
 utils/ir-ctl/meson.build                      |  17 ++
 utils/ivtv-ctl/meson.build                    |  13 +
 .../bpf_protocols/clang_sys_includes.sh       |   9 +
 utils/keytable/bpf_protocols/meson.build      |  31 +++
 utils/keytable/meson.build                    |  70 ++++++
 utils/keytable/rc_keymaps/meson.build         | 147 ++++++++++++
 utils/libcecutil/meson.build                  |  45 ++++
 utils/libmedia_dev/meson.build                |  14 ++
 utils/libv4l2util/meson.build                 |  16 ++
 utils/media-ctl/meson.build                   |  41 ++++
 utils/meson.build                             |  44 ++++
 utils/qv4l2/meson.build                       |  80 +++++++
 utils/qvidcap/meson.build                     |  82 +++++++
 utils/rds-ctl/meson.build                     |  13 +
 utils/v4l2-compliance/meson.build             |  60 +++++
 utils/v4l2-ctl/meson.build                    |  75 ++++++
 utils/v4l2-dbg/meson.build                    |  16 ++
 utils/v4l2-sysfs-path/meson.build             |  13 +
 v4l-utils-po/meson.build                      |   3 +
 version.h.in                                  |   1 +
 46 files changed, 1896 insertions(+)
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
2.25.1

