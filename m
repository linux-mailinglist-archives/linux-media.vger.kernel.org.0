Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A7F1EB90D
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 12:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgFBKDC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 06:03:02 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:57727 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726139AbgFBKDC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 06:03:02 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g3l0jWljfCKzeg3l4jIjCB; Tue, 02 Jun 2020 12:03:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591092180; bh=aJj5kAnNbvdoWc+y8QdQsM9Lsb5y+OJNaY5Ima3ONew=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=O1eYJl2ELKfTEgDFwOXprI63XnxuuYb6SVsjcwOYlol+tpD/HNjYR+RHX8LK7BDqq
         C5pju0NsAWBKNuN1qkzhXhtvn01tbFFBYJ2ewxmWVT7A3RgAkO+eJMeSy7QZlvPeFu
         8kP6Yq9/Ge8Op9zKI50s/1CfIXRtzC1n2KJG+OZ1G7RbLe0XhxQxzW6MKH5c7P+r22
         NNpyiIMbu72yxGxaFd8++VB/0obU7Q2gK1caPJ4oh5mqA1XPdy3RKBX3hzhPsHfT/H
         ew6kb7YQwq7pHq9BlKi4V87G7HVBm/NCnZZh8WNEz72vaIrw1zUN1bk30b/L1Ev4Sw
         WVkiag/OENvjw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.9] Finalize stateful encoder support
Message-ID: <741fd4cb-1c56-9546-36da-1993474caf49@xs4all.nl>
Date:   Tue, 2 Jun 2020 12:02:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMTSnIyelNujJqCxYeuuWEc2VRbbGs4E/GLm0qV/1myHwTD/tv3MUvJyaaLz/IQDwvhoeo4VEF18n7yPbfCXsiZgh674QsRiXMLYSJA6xszR8C0LM6O0
 9ZChTobk84kL2RsIf9RW7FtItqX4UCVqVhjOO0LRjxY2efzaZVlvMaTRqstWAp92UTa42cJ13eO7SkPjiOnCaSHt97ieyESyLMfIV9FQpEFI3EmCoSOE2nj3
 tWfdiAoi3HZCceCXs98AtNcLfPe+uAF8V7XSWdeTk/Coj5lSILxkW+X48X9q4hUK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This PR finalizes the stateful encoder support by adding the stateful encoder
spec. It was delayed quite a bit and the main reason was how framerates should
be handled given the constraints of what existing stateful encoder drivers
implemented.

Michael, can you make a allegro patch that sets the V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL
flag in that driver and have it behave according to this updated spec?

Many thanks to all who contributed, with honorable mention of Tomasz who wrote
the original version of this spec.

Regards,

	Hans

The following changes since commit 938b29db3aa9c293c7c1366b16e55e308f1a1ddd:

  media: Documentation: media: Refer to mbus format documentation from CSI-2 docs (2020-05-25 15:47:02 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-stateful-enc

for you to fetch changes up to f73d82aca17259d7409c3bb675c1def0d71041e0:

  dev-encoder.rst: add reference to V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL (2020-06-02 11:05:51 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (4):
      vidioc-g-parm.rst: update the VIDIOC_G/S_PARM documentation
      dev-decoder.rst: small fixes
      videodev2.h: add V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL flag
      dev-encoder.rst: add reference to V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL

Tomasz Figa (1):
      media: docs-rst: Document memory-to-memory video encoder interface

 Documentation/userspace-api/media/v4l/dev-decoder.rst        |   6 +-
 Documentation/userspace-api/media/v4l/dev-encoder.rst        | 729 ++++++++++++++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/dev-mem2mem.rst        |   1 +
 Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst        |   5 +
 Documentation/userspace-api/media/v4l/v4l2.rst               |   2 +
 Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst |  51 +--
 Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst    |  30 +-
 Documentation/userspace-api/media/v4l/vidioc-g-parm.rst      |  51 +--
 Documentation/userspace-api/media/videodev2.h.rst.exceptions |   1 +
 include/uapi/linux/videodev2.h                               |   1 +
 10 files changed, 830 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
