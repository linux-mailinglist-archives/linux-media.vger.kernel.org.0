Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67F894A750
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbfFRQpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33615 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbfFRQpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:44 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-97; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 00/28] media: coda: fixes and improvements
Date:   Tue, 18 Jun 2019 18:45:07 +0200
Message-Id: <20190618164535.20162-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this series contains a few fixes for MPEG-2 sequence number counting,
decoder/encoder stop command race conditions and some more work to
further move towards V4L2 stateful decoder API compliance:

Sequence initialization, which lets the firmware parse the bitstream
headers, is reworked to run before the capture queue is streaming,
with some padding acrobatics to work around issues when only headers
or very small buffers are queued initially. A SOURCE_CHANGE event
is issued after sequence initialization completes.

The sequence counting mechanism used to determine the last processed
buffer is replaced with a last buffer flag that is set on the last
queued output buffer and carried over to the corresponding bitstream
metadata, to the decoded internal tiled frame, and finally to the
returned linear capture buffer.

Dynamic parameter change support is added for encoder rate control
or quantization parameters, slice mode, and cyclic intra refresh
interval.

Inbetween there are a few code cleanup patches that introduce, change,
or make use of helper functions, and improve driver structures.

regards
Philipp

Marco Felsch (2):
  media: coda: fix last buffer handling in V4L2_ENC_CMD_STOP
  media: coda: fix V4L2_DEC_CMD_STOP when all buffers are already
    consumed

Michael Tretter (1):
  media: coda: implement CMD_START to restart decoding

Philipp Zabel (25):
  media: coda: use mem2mem try_en/decoder_cmd helpers
  media: coda: fix mpeg2 sequence number handling
  media: coda: add coda_wake_up_capture_queue
  media: coda: split decoder sequence initialization out of start
    decoding
  media: coda: add sequence initialization work
  media: coda: implement decoder source change event
  media: coda: integrate internal frame metadata into a structure
  media: coda: make coda_bitstream_queue more versatile
  media: coda: pad first buffer with repeated MPEG headers to fix
    sequence init
  media: coda: do not enforce 512-byte initial bitstream payload on
    CODA960
  media: coda: flush bitstream ring buffer on decoder restart
  media: coda: increment sequence offset for the last returned frame
  media: coda: allow flagging last output buffer internally
  media: coda: mark the last output buffer on decoder stop command
  media: coda: only set the stream end flags if there are no more
    pending output buffers
  media: coda: mark the last output buffer on encoder stop command
  media: coda: retire coda_buf_is_end_of_stream
  media: coda: only wake up capture queue if no pending buffers to
    encode
  media: coda: flag the last encoded buffer
  media: coda: lock capture queue wakeup against encoder stop command
  media: coda: mark last pending buffer or last meta on decoder stop
    command
  media: coda: mark last returned frame
  media: coda: store device pointer in driver structure instead of pdev
  media: coda: add coda_slice_mode() function
  media: coda: encoder parameter change support

 drivers/media/platform/coda/coda-bit.c    | 403 +++++++++++++++++-----
 drivers/media/platform/coda/coda-common.c | 244 ++++++++++---
 drivers/media/platform/coda/coda-mpeg2.c  |  43 +++
 drivers/media/platform/coda/coda-mpeg4.c  |  38 ++
 drivers/media/platform/coda/coda.h        |  33 +-
 drivers/media/platform/coda/coda_regs.h   |  18 +
 6 files changed, 637 insertions(+), 142 deletions(-)

-- 
2.20.1

