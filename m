Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B23E3A2A5F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbhFJLiT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:38:19 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56353 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230146AbhFJLiT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:38:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rIytl7kZmhqltrIyxlXjQt; Thu, 10 Jun 2021 13:36:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623324981; bh=4hbAZLAx/4vRn5DRneqDIlDUz8Sz88lhlaMDEJF8kbA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=W5JCjoY59zujjEi9rRat1YJFxza86BQyuHOeG7W4nIx4jHQ8nJOTznD68S0QoW3m9
         U7CSP2JTR+iH4iTc6YDXW1j4DwT4IC0tMQXUjbGbIxHVFvtKeEgt0r6NnHNiN3bpFb
         rgGIpxp+K5WOqV+LypSqLvqg65oYuUmBmB3kTdiozp1ldP6EyqfSc3DpeThhbB5txn
         WxfEkBXq8SxQyRPZrpYbFVmI1V26ipVsU3KgSBIKXPNgehlxk+Oymjk/Q9ID4PhFUM
         Tq+uhVpiC+iiNU6PFtay4TfaChvPrfvSCuQ1zJ/Xdb1mNPh4tRpFaHgcH3ioDjAIM8
         E4kCl+9uUm6Vw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [RFC PATCHv2 00/11] Dynamic arrays and read-only requests
Date:   Thu, 10 Jun 2021 13:36:04 +0200
Message-Id: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfBNfF+B7EUERI9OemAcDtF+Hp6YAXqza2NS5NHa0o/x6Gachu0hwD9towXnh46Z394DGW6lXEIkYU0nvqK56E+HfUXp+tJBGRliNYXo3/YxhLzmJJk62
 yhbDH7/Mb8pcNmq7FtdypRq2yttW9ljtjGrCAEo3gFFtNJzcKtcJAnHN9ewKgRsvAmqJg7NoqCcqNatlTb8+bGfkyrWc/IGQeNtzT/g9Fjs8llmxru8WS5wG
 mXeIOeqWkvV2UBoEZAdESgaY76A9WfTo9AfLgF14uJB0wTVbryX99VrVR21kFJRvovPp8iKowgmcF5jqWtB6Si0oLDcBpQ5F9aE8IeIpmmbzle80suPhVHe7
 m7HeX9Pu7i3EBzeLTamjd4bk5yn4iQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This RFC series adds support for dynamic arrays and for read-only
requests. This respins and combines these older series:

Adding dynamic array controls:

https://patchwork.linuxtv.org/project/linux-media/cover/20210428101841.696059-1-hverkuil-cisco@xs4all.nl/

Adding support for read-only requests:

https://patchwork.linuxtv.org/project/linux-media/cover/20200818143719.102128-1-hverkuil-cisco@xs4all.nl/

The dynamic array support (patches 1-3) is pretty much the same as the
original series, just rebased.

The read-only request support (patches 4-11) is greatly simplified compared
to the original due to this patch that was merged recently:

https://patchwork.linuxtv.org/project/linux-media/patch/20210428101841.696059-2-hverkuil-cisco@xs4all.nl/

This made the read-only request implementation a lot easier.

Patches 1-3 and 4-11 are independent of one another.

The only reason this series is marked RFC is that it needs some
documentation improvements (or at the least, verification that
everything is properly documented), and it needs a real driver
that implements the feature.

I have CC-ed those who I know are/have been working on either
dynamic arrays or read-only requests, so if you want to get this
into the kernel, then submit patches for a driver, and include the
support from this RFC series.

I'll post a short series next for v4l-utils, adding support for
these two features.

Regards,

	Hans

Hans Verkuil (11):
  videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
  v4l2-ctrls: add support for dynamically allocated arrays.
  vivid: add dynamic array test control
  media: document read-only requests
  videodev2.h: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
  videobuf2-core: add vb2_request_buffer_first()
  videobuf2-v4l2.c: vb2_request_validate: support RO requests
  v4l2-mem2mem.c: allow requests for capture queues
  vivid: add ro_requests module option
  vim2m: support read-only requests on the capture queue
  vicodec: add support for read-only requests

 Documentation/admin-guide/media/vivid.rst     |  10 +
 .../mediactl/media-request-ioc-queue.rst      |   5 +
 .../media/mediactl/request-api.rst            |  11 ++
 .../media/v4l/vidioc-queryctrl.rst            |   8 +
 .../media/v4l/vidioc-reqbufs.rst              |   6 +
 .../media/common/videobuf2/videobuf2-core.c   |  22 +++
 .../media/common/videobuf2/videobuf2-v4l2.c   |  23 ++-
 .../media/test-drivers/vicodec/vicodec-core.c |  67 +++----
 drivers/media/test-drivers/vim2m.c            |  10 +-
 drivers/media/test-drivers/vivid/vivid-core.c |  10 +
 .../media/test-drivers/vivid/vivid-ctrls.c    |  15 ++
 drivers/media/v4l2-core/v4l2-ctrls-api.c      | 103 +++++++---
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 182 ++++++++++++++----
 drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   3 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c  |  13 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c        |  16 +-
 include/media/v4l2-ctrls.h                    |  42 +++-
 include/media/videobuf2-core.h                |   8 +
 include/uapi/linux/videodev2.h                |   2 +
 19 files changed, 440 insertions(+), 116 deletions(-)

-- 
2.30.2

