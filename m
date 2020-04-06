Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD3819FD8B
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 20:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgDFSwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 14:52:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57686 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgDFSwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 14:52:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 4B17A296AE6
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 0/3] rkisp1: use enum v4l2_pixel_encoding instead of rkisp1_fmt_pix_type
Date:   Mon,  6 Apr 2020 20:52:32 +0200
Message-Id: <20200406185235.21238-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The enum v4l2_pixel_encoding can be used instead of rkisp1_fmt_pix_type.
This allows cleanup of the enum rkisp1_fmt_pix_type. Also, since the
v4l2_pixel_encoding can be retrieved from the info->pixel_enc of the
capture formats, the field fmt_type can be dropped from the struct
rkisp1_capture_fmt_cfg.

Patch 1: replace rkisp1_fmt_pix_type with v4l2_pixel_encoding
Patch 2: drop the field fmt_type from the struct rkisp1_capture_fmt_cfg
Patch 2: rename the fields fmt_type to the more informative name pixel_enc

Changes from v1:
v1 was a single patch that only drops the fmt_type from the struct
rkisp1_capture_fmt_cfg and adds a function rkisp1_pixel_enc_to_fmt_pix
which is in v2 not needed.

Changes from v2:
Add patch 3 that rename the fields fmt_type to pixel_enc

Dafna Hirschfeld (3):
  media: staging: rkisp1: replace rkisp1_fmt_pix_type with
    v4l2_pixel_encoding
  media: staging: rkisp1: cap: remove field fmt_type from struct
    rkisp1_capture_fmt_cfg
  media: staging: rkisp1: change fields names from fmt_type to pixel_enc

 drivers/staging/media/rkisp1/rkisp1-capture.c | 51 +------------------
 drivers/staging/media/rkisp1/rkisp1-common.h  | 11 +---
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 42 +++++++--------
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 12 ++---
 4 files changed, 31 insertions(+), 85 deletions(-)

-- 
2.20.1

