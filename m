Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93B7B19653B
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2020 11:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgC1K4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 06:56:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41994 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgC1K4T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 06:56:19 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:90b5:2774:1094:333f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E879628FC8E;
        Sat, 28 Mar 2020 10:56:17 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/3] media: staging: rkisp1: add support for RGB formats
Date:   Sat, 28 Mar 2020 11:56:03 +0100
Message-Id: <20200328105606.13660-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for RGB formats in rkisp1, (currently only RGB565 is correctly captured)
The patchset is rebased on top of patch
"media: staging: rkisp1: cap: remove field fmt_type from struct rkisp1_capture_fmt_cfg"

patches summary:

patch 1: fix a redundant call to v4l2_format_info in the resizer code
patch 2: fix a bug that changes the default hdiv,vdiv in the resizer scale for RGB formats.
This bug changes the YUV ratios from 4:2:2 to 4:4:4 and the capture for RGB times out
patch 3: removes the restriction in the validation function of the capture that forces the
mbus encoding to be the same as the capture encoding. This is because for RGB formats
the mbus format should be MEDIA_BUS_FMT_YUYV8_2X8

Dafna Hirschfeld (3):
  media: staging: rkisp1: rsz: get the capture format info from the
    capture struct
  media: staging: rkisp1: rsz: change (hv)div only if capture format is
    YUV
  media: staging: rkisp1: cap: enable RGB capture format with YUV media
    bus

 drivers/staging/media/rkisp1/rkisp1-capture.c |  7 +++++--
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 19 ++++++++++++++-----
 2 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.17.1

