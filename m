Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFC621F17D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 14:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728131AbgGNMis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 08:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbgGNMis (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 08:38:48 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5375CC061755
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 05:38:48 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id F2CEF2A0CCA
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 0/4] media: staging: rkisp1: fix possible race conditions in capture
Date:   Tue, 14 Jul 2020 14:38:28 +0200
Message-Id: <20200714123832.28011-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset fixes several issues found in capture related
to buffer managings.

Patch 1 - The first patch removes an optimization that seems not useful.
The optimization configures the next buffer in case the capture
already streams and the first buffer is queued just before
the first irq. This is an unlikely scenario. Also
the code reads the field 'frame_sequence' which is updated
on v-start interrupt by 'rkisp1-isp'. Laurent Pinchart mentioned
in a comment that reading the frame_sequence outside of irq
handlers should be avoided due to possible race conditions.

https://patchwork.kernel.org/patch/11066513/#22823561

The entity 'rkisp1-params' also reads 'frame_sequence' outside of the irq handler
a patch(set) will be sent to fix that too.

Patch 2 - The second patch uses buf.lock to protect buf.curr and buf.next
in places where they are not protected.

Patch 3 - moves the code that manages the buffers to be together
with the code that configure the next buffer address to the registers.
This is a preparation for patch 4.

patch 4 - The function 'rkisp1_stream_start' uses the function
'rkisp1_handle_buffer' in order to manage the buffers and configure
the address registers before stream starts. But the function
'rkisp1_handle_buffer' also contains other code that is not needed for
stream start
The patch replace it with calls to rkisp1_set_next_buf.

Dafna Hirschfeld (4):
  media: staging: rkisp1: cap: don't set next buffer from
    rkisp1_vb2_buf_queue
  media: staging: rkisp1: cap: protect buf.curr and buf.next with
    buf.lock
  media: staging: rkisp1: cap: move code that manages the buffers to
    rkisp1_set_next_buf
  media: staging: rkisp1: cap: in stream start, replace calls to
    rkisp1_handle_buffer with rkisp1_set_next_buf

 drivers/staging/media/rkisp1/rkisp1-capture.c | 52 +++++++------------
 1 file changed, 20 insertions(+), 32 deletions(-)

-- 
2.17.1

