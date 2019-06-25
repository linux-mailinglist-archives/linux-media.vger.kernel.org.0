Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7F6355135
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729599AbfFYOLR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:11:17 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50531 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728703AbfFYOLR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:11:17 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1hfmAF-00042o-Ts; Tue, 25 Jun 2019 16:11:15 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hfmAF-0007xt-Bi; Tue, 25 Jun 2019 16:11:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, pawel@osciak.com, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 0/2] vb2: check for events before checking for buffers
Date:   Tue, 25 Jun 2019 16:11:11 +0200
Message-Id: <20190625141113.30301-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The patches fix a race condition in the poll functions of v4l2 devices.

Whenever a driver returns a buffer with the V4L2_BUF_FLAG_LAST flag set, it
must also return a V4L2_EVENT_EOS. Checking for events before checking for
buffers creates a race condition where drivers can return the buffer and event
between the checks and thus only signal the buffer without the event.
Reordering the checks avoids the race condition.

I discovered this issue in the allegro-dvt driver [0].

Michael

[0] https://lore.kernel.org/linux-media/20190527154557.62278063@litschi.hi.pengutronix.de/

Michael Tretter (2):
  media: vb2: reorder checks in vb2_poll()
  media: v4l2-mem2mem: reorder checks in v4l2_m2m_poll()

 .../media/common/videobuf2/videobuf2-v4l2.c   |  8 ++--
 drivers/media/v4l2-core/v4l2-mem2mem.c        | 47 +++++++++++--------
 2 files changed, 32 insertions(+), 23 deletions(-)

-- 
2.20.1

