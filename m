Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 481983B148
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 10:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388662AbfFJIw4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 04:52:56 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55866 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387890AbfFJIw4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 04:52:56 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9D02F260DB0;
        Mon, 10 Jun 2019 09:52:54 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 0/3] media: uapi: h264: First batch of adjusments
Date:   Mon, 10 Jun 2019 10:52:47 +0200
Message-Id: <20190610085250.3255-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is a first batch of adjustments to the stateless H264 decoder
uAPI. The first one is about adding support for per-frame decoding,
which is the only mode supported on some codecs (the hantro G1 block
supports per-slice decoding but not in an way that would allow
efficient multiplexing of several decoding contexts).

The second modification drops the P0/B0/B1 ref lists from the
decode_params control. These lists are no longer needed now that we know
we can build them kernel side based on the DPB.

There are few more changes in the pipe, but I'd like to sync with Paul,
Jonas, Jernej and Nicolas before modifying:
* Enforce order of the scaling list (looks like the rockchip and cedrus
  have different expectations)
* Pass top/bottom field info as flags in the DPB entry: the field
  attached to the capture buffer is not accurate as capture bufs might
  contain both top/bottom (meaning they are actually interlaced), but a
  coded frame might contain only one of these fields. Note
  that there's also a problem with the output -> capture field flag
  propagation we have in copy_metadata() because a coded slice might
  contain only data for top or bottom, but the capture frame might
  contain both. Doing capture->field = output->field means we're lying
  about what's inside the capture buffer (not sure we have
  implementation checking that)
* s/dpb/refs/: looks like we're abusing the term DPB which is supposed
  to be implementation specific. What's provided by the bitstream is a
  list of references that will be used to decode a frame
* ... (add your own)

Feel free to comment on these changes and/or propose alternatives.

Regards,

Boris

Changes in v2:
* Allow decoding multiple slices in per-slice decoding mode
* Minor doc improvements/fixes

Boris Brezillon (3):
  media: uapi: h264: Clarify our expectations regarding NAL header
    format
  media: uapi: h264: Add the concept of decoding mode
  media: uapi: h264: Get rid of the p0/b0/b1 ref-lists

 .../media/uapi/v4l/ext-ctrls-codec.rst        | 56 +++++++++++++++----
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++
 include/media/h264-ctrls.h                    | 13 +++++
 3 files changed, 68 insertions(+), 10 deletions(-)

-- 
2.20.1

