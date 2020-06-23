Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AC9205A95
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 20:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733191AbgFWS26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 14:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732549AbgFWS26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 14:28:58 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F624C061573;
        Tue, 23 Jun 2020 11:28:58 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3DB212A376B
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [RFC 0/7] media: Clean and make H264 stateless uAPI public
Date:   Tue, 23 Jun 2020 15:28:02 -0300
Message-Id: <20200623182809.1375-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The recent patch posted by Jernej (which I'm including for context),
encouraged me to address all the known issues in the uAPI.

I hope we can finally make this uAPI interface
public; it would be nice to address the other codec
interfaces so we can move the codec drivers out of staging.

It should be noted that there is already GStreamer native
support for this interface, which will be part of 1.18,
once it's released [1], as well as support in Chromium [2].

The basic idea here is to sanitize the interface,
making sure the structs are aligned to 64-bit,
adding reserved fields for padding where suitable.

These reserved fields can then be used to support future extensions,
in case such need appears.

In addition to this, moving the slice invariant fields
to the per-frame control, makes the frame-mode driver
implementation much nicer and the interface; see patch 6/7 for details.

I'm not adding a MAINTAINERS entry, but I'd like to do so,
so we make sure any uAPI changes are sent to those involved.

Another potential change is the addition of a "Since:" tag to the
control specification, so we can document which kernel version
added the interface. This might prove useful if reserved
fields are then used to extend the interface.

Finally, I'm sneaking here a change from Philipp Zabel
which apparently fell thru the cracks.

[1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/tree/master/sys/v4l2codecs
[2] https://chromium.googlesource.com/chromium/src.git/+/refs/heads/master/media/gpu/v4l2/

Ezequiel Garcia (5):
  fixup! media: uapi: h264: update reference lists
  media: uapi: h264: increase size of fields
  media: uapi: h264: pad v4l2_ctrl_h264_pps to 64-bit
  media: uapi: h264: Clean slice invariants syntax elements
  media: uapi: make H264 stateless codec interface public

Jernej Skrabec (1):
  media: uapi: h264: update reference lists

Philipp Zabel (1):
  media: uapi: h264: clarify pic_order_cnt_bit_size field

 .../media/v4l/ext-ctrls-codec.rst             | 135 ++++++++++++------
 drivers/media/v4l2-core/v4l2-ctrls.c          |  31 ++++
 drivers/media/v4l2-core/v4l2-h264.c           |   8 +-
 .../staging/media/hantro/hantro_g1_h264_dec.c |  21 ++-
 drivers/staging/media/hantro/hantro_h264.c    |   3 +-
 drivers/staging/media/hantro/hantro_hw.h      |   5 +-
 drivers/staging/media/rkvdec/rkvdec-h264.c    |   6 +-
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  15 +-
 include/media/v4l2-ctrls.h                    |   3 +-
 include/media/v4l2-h264.h                     |   5 +-
 .../linux/v4l2-h264-ctrls.h}                  |  73 ++++++----
 11 files changed, 194 insertions(+), 111 deletions(-)
 rename include/{media/h264-ctrls.h => uapi/linux/v4l2-h264-ctrls.h} (88%)

-- 
2.26.0.rc2

