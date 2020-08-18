Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D422487C9
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 16:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgHROhb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 10:37:31 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:43011 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727000AbgHROhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 10:37:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 82jnkV8V2uuXO82jokcevB; Tue, 18 Aug 2020 16:37:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597761441; bh=M6LeDk4CJSSSzGixbCqBtXnAaLvbaDpBpM7YyOyfwD0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=CGq7QfGIyuP0nCzuvL+HwxaYmMdgl2foLT2rPOfiIIo9+QD1KDXi0s2w4q2gox/Eo
         rQ7VFjKitr/rjG7QxGJGdd3E4kF0tJGo0iwvlDxmInG3I/PZ5/Izr+5109cHc0VB3/
         8m/b2/JuozIw3oVDFyoieLbzaR+wB1B8Bm0c3QNsM33U1qs/bHYjb1VbkpdulBhymC
         Yiq869FKRxcj/F6Vts4WWu/QciMcu+mqAS+jj6gKo65XRq0+fDaTc4a6YvInmswoFI
         11xsC+gPDXJbSKuRO730DA3FogzRpG4DvzO2JkK/zqVF/q1hP8+Vz2D7stjKVSzf/q
         OOk6FmfmJGAuw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCHv2 00/12] Add support for read-only requests
Date:   Tue, 18 Aug 2020 16:37:07 +0200
Message-Id: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfA0k2tI+AHClOJ99FFOT8pgIXTj8/BfkUuKUAUzo3ZMByzTjo28bOSrG78gds6jsLKcJwRVoTfJXUJPf5mf2fl57zpZsTnfdTop9q2TtEi4VKKjAv443
 DQfYy1wCw4QWHvvIo7V7j9JyqVQv2rzQvCSBd/NDSflB469oFOvlt4XSXV7iMkZRgmoe4/QSvXezTu6Q73eXG7HzH0jyCwFwZCOaV79E3fWyR6WSho3EgwyJ
 5lAR/Svz9kc6NXAz+JnSK1rgByjb87PxjhIKhA/+pjJVAi3OTMuckjf1JaPAW52cME1wmIdjngUSLDBRYu5AXcl7OHkk7ESmaOSYMz78kn0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read-only requests do not contain any configuration values when queued
(only buffers can be part of a read-only request), but they do allow the
driver to associate additional information with the completed request.

This is useful to e.g. add per-frame metadata such as HDMI InfoFrames to
a captured buffer.

While working on this I discovered that the Request API is also missing a
feature: if userspace did not set any controls, then the request object
will not contain a control object (that's created only if the user sets a
control in the request).

This is fine for e.g. stateless codecs since they require that each request
contains controls, so this is always done. And this is also the reason that
this hasn't been a problem before, since the Request API is almost exclusively
used by stateless codecs.

But for e.g. vivid this means that the completed request does not contain
any controls in the request with the values of the time that the frame was
captured (or output).

In addition, if a driver needs to set a status control, then that control
won't be part of the request either.

This series adds a v4l2_ctrl_request_add_handler() function that can be
called in the req_validate() callback of the request. If the request
doesn't contain a control object, then it will add a new one.

This series adds read-only request support to vivid, vim2m and vicodec, and
adds new helper functions to vb2 (vb2_request_buffer_first) and v4l2-mem2mem.c
(v4l2_m2m_request_validate).

In addition, the first patch of this series adds debugfs support to the
media device to be able to keep track of outstanding requests and request
objects. Without this it is next to impossible to check if all requests and
request objects are properly released after all file handles are closed.

This series supersedes this old RFC series:

https://patchwork.linuxtv.org/project/linux-media/cover/20200728094851.121933-1-hverkuil-cisco@xs4all.nl/

I'll also post an RFC patch for v4l-utils that adds support for this to
v4l2-ctl and v4l2-compliance.

Regards,

	Hans


Hans Verkuil (12):
  media/mc: keep track of outstanding requests
  vivid: add read-only int32 control
  media: document read-only requests
  videodev2.h: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
  videobuf2-core: add vb2_request_buffer_first()
  v4l2-ctrls.c: add v4l2_ctrl_request_add_handler
  vivid: call v4l2_ctrl_request_add_handler()
  vivid: add ro_requests module option
  v4l2-mem2mem.c: add v4l2_m2m_request_validate()
  vim2m: use v4l2_m2m_request_validate()
  vim2m: support read-only requests on the capture queue
  vicodec: add support for read-only requests

 Documentation/admin-guide/media/vivid.rst     | 10 +++
 .../mediactl/media-request-ioc-queue.rst      |  5 ++
 .../media/mediactl/request-api.rst            | 11 +++
 .../media/v4l/vidioc-reqbufs.rst              |  6 ++
 .../media/common/videobuf2/videobuf2-core.c   | 22 ++++++
 .../media/common/videobuf2/videobuf2-v4l2.c   |  4 +-
 drivers/media/mc/mc-device.c                  | 27 +++++++
 drivers/media/mc/mc-devnode.c                 | 13 ++++
 drivers/media/mc/mc-request.c                 |  8 ++-
 .../media/test-drivers/vicodec/vicodec-core.c | 70 +++++++++----------
 drivers/media/test-drivers/vim2m.c            | 13 +++-
 drivers/media/test-drivers/vivid/vivid-core.c | 52 ++++++++++++++
 drivers/media/test-drivers/vivid/vivid-core.h |  1 +
 .../media/test-drivers/vivid/vivid-ctrls.c    | 13 ++++
 .../test-drivers/vivid/vivid-kthread-cap.c    | 10 +--
 drivers/media/v4l2-core/v4l2-ctrls.c          | 35 ++++++++++
 drivers/media/v4l2-core/v4l2-mem2mem.c        | 45 ++++++++++--
 include/media/media-device.h                  |  9 +++
 include/media/media-devnode.h                 |  4 ++
 include/media/media-request.h                 |  2 +
 include/media/v4l2-ctrls.h                    | 21 ++++++
 include/media/v4l2-mem2mem.h                  | 28 +++++++-
 include/media/videobuf2-core.h                |  8 +++
 include/uapi/linux/videodev2.h                |  1 +
 24 files changed, 368 insertions(+), 50 deletions(-)

-- 
2.27.0

