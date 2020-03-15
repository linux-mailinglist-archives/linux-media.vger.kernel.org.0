Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51895185FDB
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 21:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbgCOUyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 16:54:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41678 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729152AbgCOUyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 16:54:39 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C1B5828A3FD
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [RFC PATCH v4l-utils 0/1] Introduce the meson build system
Date:   Sun, 15 Mar 2020 17:54:20 -0300
Message-Id: <20200315205421.28797-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here's a first step towards using meson:

    https://mesonbuild.com/

As you can see, this doesn't include all tools and libraries
(are there any libv4l1 users?), but otherwise tries to cover
as much as possible.

I'm sending this early patch, hoping to get some reviews
and possibly some testing.

Let me know what you think.

Thanks,

Ezequiel Garcia (1):
  Add support for meson building

 gen-version.sh                      |  36 ++++++++++
 lib/libdvbv5/meson.build            |  87 ++++++++++++++++++++++
 lib/libv4l2/meson.build             |  43 +++++++++++
 lib/libv4lconvert/meson.build       |  79 ++++++++++++++++++++
 lib/meson.build                     |   6 ++
 meson.build                         | 108 ++++++++++++++++++++++++++++
 meson_options.txt                   |  19 +++++
 utils/cec-compliance/meson.build    |  39 ++++++++++
 utils/cec-ctl/meson.build           |  33 +++++++++
 utils/cec-follower/meson.build      |  35 +++++++++
 utils/gen_media_bus_format_codes.sh |   7 ++
 utils/gen_media_bus_format_names.sh |   7 ++
 utils/ir-ctl/meson.build            |  30 ++++++++
 utils/libcecutil/meson.build        |  46 ++++++++++++
 utils/media-ctl/meson.build         |  35 +++++++++
 utils/meson.build                   |  32 +++++++++
 utils/v4l2-compliance/meson.build   |  52 ++++++++++++++
 utils/v4l2-ctl/meson.build          |  65 +++++++++++++++++
 version.h.in                        |   1 +
 19 files changed, 760 insertions(+)
 create mode 100755 gen-version.sh
 create mode 100644 lib/libdvbv5/meson.build
 create mode 100644 lib/libv4l2/meson.build
 create mode 100644 lib/libv4lconvert/meson.build
 create mode 100644 lib/meson.build
 create mode 100644 meson.build
 create mode 100644 meson_options.txt
 create mode 100644 utils/cec-compliance/meson.build
 create mode 100644 utils/cec-ctl/meson.build
 create mode 100644 utils/cec-follower/meson.build
 create mode 100644 utils/gen_media_bus_format_codes.sh
 create mode 100644 utils/gen_media_bus_format_names.sh
 create mode 100644 utils/ir-ctl/meson.build
 create mode 100644 utils/libcecutil/meson.build
 create mode 100644 utils/media-ctl/meson.build
 create mode 100644 utils/meson.build
 create mode 100644 utils/v4l2-compliance/meson.build
 create mode 100644 utils/v4l2-ctl/meson.build
 create mode 100644 version.h.in

-- 
2.25.0

