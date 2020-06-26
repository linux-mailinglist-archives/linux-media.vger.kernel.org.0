Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D3420B6A5
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 19:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgFZRMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 13:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgFZRMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 13:12:24 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2A1C03E979;
        Fri, 26 Jun 2020 10:12:23 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9AC972A5D20
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 0/2] media: hantro/rkvdec handle unsupported H.264 bitstreams
Date:   Fri, 26 Jun 2020 14:11:28 -0300
Message-Id: <20200626171130.27346-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Small patchset to add a check at TRY_EXT_CTRLS time,
via the H264 SPS control and reject unsupported bitstreams.

Properly refusing to decode unsupported bitstreams
allows applications to cleanly fallback to software
decoding.

Note that Rockchip VDEC hardware is capable of decoding High-10
and High-422 bitstreams. This needs more work, so for now
they are refused.

The same approach can be use on Cedrus, but since I'm not
very familiar there, I'll leave that to others.

Applies on top of media master.

Ezequiel Garcia (2):
  rkvdec: h264: Refuse to decode unsupported bitstream
  hantro: h264: Refuse to decode unsupported bitstream

 drivers/staging/media/hantro/hantro_drv.c | 29 ++++++++++++++++++++---
 drivers/staging/media/rkvdec/rkvdec.c     | 27 +++++++++++++++++++++
 2 files changed, 53 insertions(+), 3 deletions(-)

-- 
2.26.0.rc2

