Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C7236D59F
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 12:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239190AbhD1KTc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 06:19:32 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:35213 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239178AbhD1KTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 06:19:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id bhHFlUpapk1MGbhHJlO0c6; Wed, 28 Apr 2021 12:18:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619605125; bh=Mcc6qQJcVnFqpe1epH9TBa4iegLkZXWcaWZuZSY8oo0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=sWSB4Aal2i/bG/cv2iuhsihS/sv51lt/j6bM0R5FVfybsIvPEWn57JplF5hbOeLx9
         PLk/4ZMgqLV4MqvI7D31iPAX+OTkORfgwIl7AYmJpJwr8YkXLGG0zQLmFy3nW8k2cu
         53ck2CkC9EW9LZkh95c0MCuosoqZQeDUROpL9KVFDIo9cLiT8N1a9rF87z/PQQuzy5
         UtkzvpyMV+AXDr7xsQs/0KY1VWxUphwgqR3hY3HuPz5wPzsff4YkJpHgdAU0/xkc64
         BfoRYlot6eIYu+BI6rNR89nTdsaESSLrPy0u0q0cPHo79RyZY0FBNzByJg1d+WmmqU
         1wT6cJ05iayPg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [RFC PATCH 0/5] v4l2-ctrls: refactor and add dynamic array support
Date:   Wed, 28 Apr 2021 12:18:36 +0200
Message-Id: <20210428101841.696059-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfByuEbTvMV2rhHditWDUjUTOYLU8/+Pgr/BmhcOouCc0LV68opItVakHC53Ja5EEdQvq3E037ws6IQ4pGdZGiwJRbMgXaKxm/EKDS4xHnn1jbGHz/mZN
 bzdj7acWRkeYguyk5HIaffCXwLnnV2JYMHGNs4kTNKhLbYsAScENl3v0lDabC2Tuz2e9MlKlBd+h6fZf1ZjJ+MYe+A3bJGbgf24DyhdMnBkOHzlNVuopx7yV
 4OOYcZfBHu7pqYbUh1CPGEUJlvLvsLKKkUlZuQslzIfgXky/HO40XehnLLT/WX9L
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series adds support for dynamic arrays, something that
is very helpful for stateless codecs.

The first patch fixes a bug in the control framework: if a request
was queued up without any controls, then after completion the request
would still have no controls, so it was impossible to read the state
of the controls at completion time. Note that drivers can also set
control values themselves, so this information would be lost as well.

The v4l2_ctrl_request_complete() was modified to attempt to create
a request control object if it was missing.

This patch will need to be backported to older kernels as well,
but I wait with the details until 5.13-rc1 is released as it is a
bit easier to tell for which kernels this patch applies cleanly.

The second (huge!) patch splits up v4l2-ctrls.c into four source
files. It became unmanageable, and splitting it up made it much
easier to maintain. I hope it reaches the mailinglist, it might
be too big. If it doesn't arrive, then you can find it in my
git repo:

https://git.linuxtv.org/hverkuil/media_tree.git/commit/?h=ctrl-refactor&id=db91a8696a76e62304d73759a3de6b92bacb7085

The third patch adds the new flag + documentation.

The fourth patch adds the actual support for dynamic arrays.

The fifth patch adds a dynamic array test control to vivid which
allowed me to test this feature. I'll post a separate patch that
adds compliance tests for this to v4l2-compliance.

I hope the stateless codec devs can test this to see if it meets
their needs. Regardless of that, I do want to get the first two
patches merged as soon as possible once the rc1 is released and
merged in our master branch.

Especially the refactoring in the second patch was a great help
in understanding the code.

Regards,

	Hans

Hans Verkuil (5):
  v4l2-ctrls: always copy the controls on completion
  v4l2-ctrls: split up into four source files
  videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
  v4l2-ctrls: add support for dynamically allocated arrays.
  vivid: add dynamic array test control

 .../media/v4l/vidioc-queryctrl.rst            |    8 +
 .../media/videodev2.h.rst.exceptions          |    1 +
 drivers/media/mc/mc-request.c                 |    3 +-
 .../media/test-drivers/vivid/vivid-ctrls.c    |   15 +
 drivers/media/v4l2-core/Makefile              |    5 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      | 1278 +++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 2009 +++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 1571 +++++
 drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   95 +
 drivers/media/v4l2-core/v4l2-ctrls-request.c  |  501 ++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 5035 -----------------
 include/media/v4l2-ctrls.h                    |   42 +-
 include/uapi/linux/videodev2.h                |    1 +
 13 files changed, 5519 insertions(+), 5045 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-api.c
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core.c
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-defs.c
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-priv.h
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-request.c
 delete mode 100644 drivers/media/v4l2-core/v4l2-ctrls.c

-- 
2.30.2

