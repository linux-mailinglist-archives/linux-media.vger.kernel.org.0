Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA9815A40A5
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiH2Bdm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiH2Bdl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:33:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804C02E6AE
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:33:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECF55481;
        Mon, 29 Aug 2022 03:33:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661736816;
        bh=2MC5a+NNQ8BnQ+nGX4FhqTB1CCv8EsYwl2Hp2EE+qic=;
        h=From:To:Cc:Subject:Date:From;
        b=ft4ur8iaWKEZdp8CvDkiPWXXbTtOtwpXEmWcvjmWT7hZb/6Scn48vCGVUe+HFMAwE
         +N7mXtTE7ne4nEzKMbTaY0BVzRVBekC++Iz6jfzwYvDxOXo490mHb3Y2yTKc9Hyuxu
         mF6zd+/DLt0xsPcmE1DN1t0cTaxrHqRU3dh0iRAw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
Subject: [PATCH v6 00/13] Add support for meson building
Date:   Mon, 29 Aug 2022 04:33:14 +0300
Message-Id: <20220829013327.5791-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everybody,

This series picks the v5 Ariel's conversion of v4l-utils to meson and
rebases it on the latest upstream master branch, with an additional set
of fixups that fix miscellaneous small issues and addresses review
comments on v5.

The base commit is f50720c40409, with two additional patches that I have
just posted to the linux-media mailing list to fix issues with Doxygen
(see [1] and [2]).

The fixup commits are marked with [FIXUP]. I have kept them separate to
outline differences compared to v5, and they can be squashed into their
respective base patch if they're accepted.

A branch that includes this series, as well as the two base patches, can
be found at

	git://linuxtv.org/pinchartl/v4l-utils.git meson

[1] https://lore.kernel.org/linux-media/YwwT8%2FClGTBnejuS@pendragon.ideasonboard.com/T/#t
[2] https://lore.kernel.org/linux-media/20220829012344.5483-1-laurent.pinchart@ideasonboard.com/T/#u

Ariel D'Alessandro (5):
  Move README to markdown syntax
  Add support for meson building
  Copy Doxygen configuration file to doc/
  meson: Add support for doxygen documentation
  Makefile.am: Distribute meson related files

Laurent Pinchart (8):
  [FIXUP] meson: Drop unneeded bpf option check
  [FIXUP] meson: Avoid double-quoting strings
  [FIXUP] meson: Use external_program object directly without calling
    path()
  [FIXUP] meson: Specify check kwarg to run_command()
  [FIXUP] meson: Replace deprecated get_cross_property() with
    get_external_property()
  [FIXUP] meson: Fix SDL dependency fallback check
  [FIXUP] meson: Set the default build type to debugoptimized
  [FIXUP] doc: Fix Doygen deprecation warnings

 .gitignore                                    |    1 +
 INSTALL.meson.md                              |  142 +
 Makefile.am                                   |    5 +-
 README                                        |  274 --
 README.md                                     |  332 +++
 contrib/Makefile.am                           |    3 +-
 contrib/cobalt-ctl/Makefile.am                |    2 +
 contrib/cobalt-ctl/meson.build                |    8 +
 contrib/decode_tm6000/Makefile.am             |    2 +
 contrib/decode_tm6000/meson.build             |   14 +
 contrib/gconv/Makefile.am                     |    2 +-
 contrib/gconv/meson.build                     |   44 +
 contrib/meson.build                           |   13 +
 contrib/rds-saa6588/Makefile.am               |    2 +
 contrib/rds-saa6588/meson.build               |    7 +
 contrib/test/Makefile.am                      |    3 +-
 contrib/test/meson.build                      |  143 +
 contrib/xc3028-firmware/Makefile.am           |    2 +-
 contrib/xc3028-firmware/meson.build           |   11 +
 doc/Doxyfile.in                               | 2293 +++++++++++++++++
 doc/meson.build                               |   34 +
 lib/Makefile.am                               |    2 +-
 lib/libdvbv5/Makefile.am                      |    2 +-
 lib/libdvbv5/meson.build                      |  159 ++
 lib/libv4l-mplane/Makefile.am                 |    2 +
 lib/libv4l-mplane/meson.build                 |   23 +
 lib/libv4l1/Makefile.am                       |    2 +-
 lib/libv4l1/meson.build                       |   62 +
 lib/libv4l2/Makefile.am                       |    2 +-
 lib/libv4l2/meson.build                       |   71 +
 lib/libv4l2rds/Makefile.am                    |    2 +
 lib/libv4l2rds/meson.build                    |   37 +
 lib/libv4lconvert/Makefile.am                 |    2 +-
 lib/libv4lconvert/meson.build                 |  117 +
 lib/meson.build                               |   11 +
 libdvbv5-po/meson.build                       |    3 +
 meson.build                                   |  336 +++
 meson_options.txt                             |   50 +
 utils/Makefile.am                             |    2 +-
 utils/cec-compliance/Makefile.am              |    2 +-
 utils/cec-compliance/meson.build              |   23 +
 utils/cec-ctl/Makefile.am                     |    2 +-
 utils/cec-ctl/meson.build                     |   18 +
 utils/cec-follower/Makefile.am                |    2 +-
 utils/cec-follower/meson.build                |   19 +
 utils/cx18-ctl/Makefile.am                    |    2 +
 utils/cx18-ctl/meson.build                    |    8 +
 utils/dvb/Makefile.am                         |    2 +-
 utils/dvb/meson.build                         |   70 +
 utils/gen_media_bus_format_codes.sh           |    7 +
 utils/gen_media_bus_format_names.sh           |    7 +
 utils/ir-ctl/Makefile.am                      |    2 +
 utils/ir-ctl/meson.build                      |   23 +
 utils/ivtv-ctl/Makefile.am                    |    2 +
 utils/ivtv-ctl/meson.build                    |   13 +
 utils/keytable/Makefile.am                    |    3 +-
 utils/keytable/bpf_protocols/Makefile.am      |    3 +-
 .../bpf_protocols/clang_sys_includes.sh       |    9 +
 utils/keytable/bpf_protocols/meson.build      |   31 +
 utils/keytable/meson.build                    |   81 +
 utils/keytable/rc_keymaps/meson.build         |  150 ++
 utils/libcecutil/Makefile.am                  |    2 +-
 utils/libcecutil/meson.build                  |   45 +
 utils/libmedia_dev/Makefile.am                |    2 +-
 utils/libmedia_dev/meson.build                |   14 +
 utils/libv4l2util/Makefile.am                 |    2 +-
 utils/libv4l2util/meson.build                 |   16 +
 utils/media-ctl/Makefile.am                   |    2 +
 utils/media-ctl/meson.build                   |   43 +
 utils/meson.build                             |   46 +
 utils/qv4l2/Makefile.am                       |    3 +-
 utils/qv4l2/meson.build                       |   80 +
 utils/qvidcap/Makefile.am                     |    3 +-
 utils/qvidcap/meson.build                     |   82 +
 utils/rds-ctl/Makefile.am                     |    1 +
 utils/rds-ctl/meson.build                     |   17 +
 utils/v4l2-compliance/Makefile.am             |    2 +-
 utils/v4l2-compliance/meson.build             |   59 +
 utils/v4l2-ctl/Makefile.am                    |    2 +-
 utils/v4l2-ctl/meson.build                    |   75 +
 utils/v4l2-dbg/Makefile.am                    |    2 +-
 utils/v4l2-dbg/meson.build                    |   20 +
 utils/v4l2-sysfs-path/Makefile.am             |    2 +
 utils/v4l2-sysfs-path/meson.build             |   14 +
 v4l-utils-po/meson.build                      |    3 +
 85 files changed, 4939 insertions(+), 299 deletions(-)
 create mode 100644 INSTALL.meson.md
 delete mode 100644 README
 create mode 100644 README.md
 create mode 100644 contrib/cobalt-ctl/meson.build
 create mode 100644 contrib/decode_tm6000/meson.build
 create mode 100644 contrib/gconv/meson.build
 create mode 100644 contrib/meson.build
 create mode 100644 contrib/rds-saa6588/meson.build
 create mode 100644 contrib/test/meson.build
 create mode 100644 contrib/xc3028-firmware/meson.build
 create mode 100644 doc/Doxyfile.in
 create mode 100644 doc/meson.build
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

-- 
Regards,

Laurent Pinchart

