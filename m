Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009E01E1F5E
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 12:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731859AbgEZKJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 06:09:39 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46337 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728799AbgEZKJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 06:09:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id dWWajU9GZDazBdWWejeM92; Tue, 26 May 2020 12:09:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590487776; bh=Fd2wtWKsTOX8ZabhZKVTzNhwCYWrqSGq0nY+z6uYHIY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type:From:
         Subject;
        b=L7oJlAaeMs60YIMu6gBk0bqgbB38nGrvdMorC7NmZpPrzvLlibMzFJh1dquK9N2A2
         wuVdq3KfSWdHKqKax/GjFFWz0tG8km6Oq5dGbwvo7UrVSfJryAQkqrwndgAHTbuvDZ
         QjHPxqZGcqotRMEUd6JOHKXk2LCrUxp2VCHiO5nV0lZhapX9cYE0uRIIbyNUkn9p8N
         W0CrdtBAFxMC/seAqHcbbTxAIW5N8dCkhTUJHUvVlsDNiSvQ7SaLv/D+Tiwb0NIJoZ
         rnH+PrCcMz0tDEIPsy//SKnhYQSox+0GcRkDXGVH7Z3ST0jxCsypO4SPudU+sjpHWn
         y+VkIRwIxhhBQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCHv3 0/5] Stateful Encoding: final bits
Date:   Tue, 26 May 2020 12:09:27 +0200
Message-Id: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNw29mmW3/J4npWRVe+AkVhJVLy+YKY5aZKlW0sjPPNEqfCXvsNuv/ueAoW0/SuJDJ5yTwzVs8XuDXUK4M+mn2D5JN2hcUaMYydasMwJCoPIrdW7x8W/
 zw63bcAGr5mEEn2yPBcH9kVOBzR1VuO8glUP1awy0f9saiNujISdICoqU4G3TvYnKb9gU04QUE1vuFf73SwvPPmdnYhb5zG7ByY+DTVM3kU19bgjAcM9yYj5
 qoo4mATxRbrTK2TPmnegd1m4FufVAyU/bdJucVsiKbDzJzQuHS7Tqb2+Z7H7FdsC
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds the encoder spec and updates the VIDIOC_G/S_PARM
documentation.

This is a follow-up of the original "Stateful Encoding: final bits"
series (1). 

The patches in that series that add support for V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
and V4L2_BUF_FLAG_TOO_SMALL have been dropped (the first is not necessary
and the second can be skipped for now, see the irc discussion with
Nicolas [3]).

The encoder spec has been updated since [2] with the following
changes:

- Document the optional VIDIOC_ENUM_FRAMEINTERVALS ioctl.

- Document how to use VIDIOC_S_PARM:

  1) calling S_PARM for the OUTPUT queue sets both the raw frame interval
     (this is a hint only) and the coded frame interval.

  2) calling S_PARM for the CAPTURE queue sets the coded frame interval
     only. This is optional and can be used for off-line encoding. In
     that case the OUTPUT frame interval can be used by the driver to
     schedule multiple encoders.
 
  Ideally S_PARM for the OUTPUT queue would just provide a hint, but
  existing encoder drivers all use S_PARM for the OUTPUT queue to
  define the coded frame interval, and that can't be changed.

- Added a note that if a capture buffer is too small it will be
  returned with V4L2_BUF_FLAG_ERROR and that more work has to be
  done to properly support this corner case.

- Clarify in the 'Encoding' section that there are more reasons
  why 'a buffer queued to OUTPUT may result in more than one buffer
  produced on CAPTURE'.

Added in v3:

- Fix some minor typos.

- Make it more explicit that setting S_PARM(OUTPUT) also sets the
  CAPTURE frame interval.

- Added a new V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL flag to indicate
  that S_PARM(CAPTURE) can be set separately.

I think that with these changes this stateful encoder spec is ready
to be merged.

Regards,

	Hans

[1] https://lore.kernel.org/linux-media/20191119113457.57833-6-hverkuil-cisco@xs4all.nl/T/
[2] https://www.mail-archive.com/linux-media@vger.kernel.org/msg149211.html
[3] https://linuxtv.org/irc/irclogger_log/v4l?date=2020-05-19,Tue

Hans Verkuil (4):
  vidioc-g-parm.rst: update the VIDIOC_G/S_PARM documentation
  dev-decoder.rst: small fixes
  videodev2.h: add V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL flag
  dev-encoder.rst: add reference to V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL

Tomasz Figa (1):
  media: docs-rst: Document memory-to-memory video encoder interface

 .../userspace-api/media/v4l/dev-decoder.rst   |   6 +-
 .../userspace-api/media/v4l/dev-encoder.rst   | 729 ++++++++++++++++++
 .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
 .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
 .../userspace-api/media/v4l/v4l2.rst          |   2 +
 .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
 .../media/v4l/vidioc-enum-fmt.rst             |  30 +-
 .../userspace-api/media/v4l/vidioc-g-parm.rst |  51 +-
 .../media/videodev2.h.rst.exceptions          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 10 files changed, 830 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst

-- 
2.25.1

