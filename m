Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022E73B9AA1
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 04:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234644AbhGBCEM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 22:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234596AbhGBCEM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 22:04:12 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01F3C061762
        for <linux-media@vger.kernel.org>; Thu,  1 Jul 2021 19:01:40 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14d:72b1:a2ff:e85c:7833:5d85:73d6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5945A1F446E3;
        Fri,  2 Jul 2021 03:01:36 +0100 (BST)
From:   daniel.almeida@collabora.com
To:     hverkuil@xs4all.nl, jernej.skrabec@gmail.com,
        ezequiel@collabora.com, paul.kocialkowski@bootlin.com,
        mripard@kernel.org
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        Daniel Almeida <daniel.almeida@collabora.com>
Subject: [RFC,WIP PATCH 0/2] cedrus: h264: add support for dynamically allocated ctrl arrays
Date:   Thu,  1 Jul 2021 23:01:27 -0300
Message-Id: <20210702020129.470720-1-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel Almeida <daniel.almeida@collabora.com>

So far the Cedrus driver is able to decode a slice at a time in slice
mode.

Use the new flag "V4L2_CTRL_FLAG_DYNAMIC_ARRAY" and the new h264 slice
array decode mode to support passing an array with all the slices at once 
from userspace.

The device will process all slices in this array before calling
v4l2_m2m_buf_done_and_job_finish, significantly reducing the
amount of back and forth of data.

This is marked as WIP because currently only the first slice will
decode, all subsequent slices in the same frame will return
CEDRUS_IRQ_ERROR. Also I haven't quite polished this yet.

It is marked as RFC because I am not sure whether adding a new entry
in v4l2_stateless_h264_decode_mode was the right call. Also, apparently 
only the slice offset is needed for subsequent slices (i.e. slice->header_bit_size),
so I am a bit unsure whether userspace has to fill all fields for slices
2..n

Daniel Almeida (2):
  media: cedrus: fix double free
  Cedrus: add support for dynamic arrays in H264

 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 35 ++++++++++++--
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 18 ++++++++
 .../staging/media/sunxi/cedrus/cedrus_dec.c   | 33 +++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 46 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 35 +++++++++++++-
 include/uapi/linux/v4l2-controls.h            |  7 +++
 7 files changed, 163 insertions(+), 12 deletions(-)

-- 
2.32.0

