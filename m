Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF9FC1A29FC
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 21:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgDHT4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 15:56:40 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:45692 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgDHT4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 15:56:40 -0400
Received: by mail-qk1-f195.google.com with SMTP id m67so1555156qke.12
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 12:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QS1m0Gz596ww46kdFQG/58cv60xXaysBnvQPT43bOqE=;
        b=FjMxa+cK/px71iDjYT7EwcXwmse3It41Fr9ihUUK23q3kvC0i8JYZyCK+llqr/pZ+6
         xk3WPGkfmxXhJZRlgc7maQ9u6ZBLUkLloylnCCueeuxnNMjvqp5hTeicRQDmpaLF6vkb
         QKo9XssfUyAPD9OVO+Ws2Xoit4Ittm8HFB2nH7YdzTOe0pmp9pQSey8ZgIb/KTkcznKt
         xYk6PyCLcxOSp8SWN+hd/rP54b0aXfG87t+flMZvhPje2NDTuuQ8dA4M/vYYWHklIsnX
         vU05xtdoFowp48QxMaGoRF8i+S6Ohfc9VcnnYSK0iAhPJgGRfm5RWuaQGw3gkyHPDcrK
         k5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QS1m0Gz596ww46kdFQG/58cv60xXaysBnvQPT43bOqE=;
        b=lnW99U4BDH31J8+GoiG2pOxh98uKC278eIzIGQ2K5byb4W11ONrgTRGFrOdom07ZHO
         Ai8MBEM1aL95koe1lUHPoS5L8bhzBhd8jZATi3G++rXnNJWquFnunGOAdQCJKT6Za4DB
         J/ma/dUtcQRkrxV1w9oIKyjAGVHVghWGY3wYj/xc4hsUS9Zd+rSETE24g7HuS6bFxQku
         M+Z3e7Iml86jV1YLqViJ+R1t5ZuV3Es8+DoVe4QmYRNwfAfb733WtzPlT9r5V6bd3Hf9
         uaCEyYRw+6OZ3l6Q5fcBLIrBqoCmDNc4+xrKT81omYVAe5Wafh+wTtJW6H5PuI91vXT7
         sfqQ==
X-Gm-Message-State: AGi0PuYWgcs1Tdb0g9eagLw6ukueH5uSD9Cb0EUYslWiDEhIa9sHfzvu
        Kle9CPk5PgxD0j4wsrQecmqIgrrLjBM=
X-Google-Smtp-Source: APiQypIuJUQWuB5PFomvzS1lHmIEhEx0Kb4KrHlp2va8uGE406GwmZtaN+XtRp6q69MvCZIKhqvv+Q==
X-Received: by 2002:a37:317:: with SMTP id 23mr9027540qkd.233.1586375797085;
        Wed, 08 Apr 2020 12:56:37 -0700 (PDT)
Received: from localhost.localdomain ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id w30sm21090615qtw.21.2020.04.08.12.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:56:36 -0700 (PDT)
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        ariel@vanguardiasur.com.ar
Subject: [RFC PATCH v2 0/1] Introduce support for meson building
Date:   Wed,  8 Apr 2020 16:56:10 -0300
Message-Id: <20200408195611.55421-1-ariel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is another step on adding meson build support to v4l-utils,
following Ezequiel's initial work.

As you might see, there's still work to do, like porting contrib/. This
RFC is mainly to continue reviewing lib/ and utils/.

Most of the support is added porting rules from the autotools scripts,
so we could probably add further improvements to meson scripts and
tweak the build options later on, if needed.

Please feel free to feedback as much as you want.

Thanks!
Ariel D'Alessandro

Ariel D'Alessandro (1):
  Add support for meson building

 .gitignore                                    |   1 +
 gen-version.sh                                |  36 +++++
 lib/libdvbv5/meson.build                      | 142 +++++++++++++++++
 lib/libv4l-mplane/meson.build                 |  16 ++
 lib/libv4l1/meson.build                       |  53 +++++++
 lib/libv4l2/meson.build                       |  65 ++++++++
 lib/libv4l2rds/meson.build                    |  28 ++++
 lib/libv4lconvert/meson.build                 | 105 +++++++++++++
 lib/meson.build                               |  14 ++
 meson.build                                   | 132 ++++++++++++++++
 meson_options.txt                             |  39 +++++
 utils/cec-compliance/meson.build              |  24 +++
 utils/cec-ctl/meson.build                     |  18 +++
 utils/cec-follower/meson.build                |  21 +++
 utils/cx18-ctl/meson.build                    |   7 +
 utils/dvb/meson.build                         |  69 ++++++++
 utils/gen_media_bus_format_codes.sh           |   7 +
 utils/gen_media_bus_format_names.sh           |   7 +
 utils/ir-ctl/meson.build                      |  17 ++
 utils/ivtv-ctl/meson.build                    |  13 ++
 .../bpf_protocols/clang_sys_includes.sh       |   9 ++
 utils/keytable/bpf_protocols/meson.build      |  31 ++++
 utils/keytable/meson.build                    |  70 +++++++++
 utils/keytable/rc_keymaps/meson.build         | 147 ++++++++++++++++++
 utils/libcecutil/meson.build                  |  45 ++++++
 utils/libmedia_dev/meson.build                |  14 ++
 utils/libv4l2util/meson.build                 |  16 ++
 utils/media-ctl/meson.build                   |  46 ++++++
 utils/meson.build                             |  50 ++++++
 utils/qv4l2/meson.build                       |  75 +++++++++
 utils/qvidcap/meson.build                     |  75 +++++++++
 utils/rds-ctl/meson.build                     |  13 ++
 utils/v4l2-compliance/meson.build             |  60 +++++++
 utils/v4l2-ctl/meson.build                    |  75 +++++++++
 utils/v4l2-dbg/meson.build                    |  16 ++
 utils/v4l2-sysfs-path/meson.build             |  13 ++
 version.h.in                                  |   1 +
 37 files changed, 1570 insertions(+)
 create mode 100755 gen-version.sh
 create mode 100644 lib/libdvbv5/meson.build
 create mode 100644 lib/libv4l-mplane/meson.build
 create mode 100644 lib/libv4l1/meson.build
 create mode 100644 lib/libv4l2/meson.build
 create mode 100644 lib/libv4l2rds/meson.build
 create mode 100644 lib/libv4lconvert/meson.build
 create mode 100644 lib/meson.build
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
 create mode 100644 version.h.in

-- 
2.25.1

