Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE8F19D39C
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390440AbgDCJ1s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:27:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53608 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgDCJ1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 05:27:48 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:20a2:167a:3b62:26be])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 92CEE2984F9;
        Fri,  3 Apr 2020 10:27:46 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, sakari.ailus@linux.intel.com
Subject: [PATCH v2 0/2] use enum v4l2_pixel_encoding instead of rkisp1_fmt_pix_type
Date:   Fri,  3 Apr 2020 11:27:36 +0200
Message-Id: <20200403092738.29831-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
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

Changes from v1:
v1 was a single patch that only drops the fmt_type from the struct
rkisp1_capture_fmt_cfg and adds a function rkisp1_pixel_enc_to_fmt_pix
which is in v2 not needed.

Dafna Hirschfeld (2):
  media: staging: rkisp1: replace rkisp1_fmt_pix_type with
    v4l2_pixel_encoding
  media: staging: rkisp1: cap: remove field fmt_type from struct
    rkisp1_capture_fmt_cfg

 drivers/staging/media/rkisp1/rkisp1-capture.c | 51 +------------------
 drivers/staging/media/rkisp1/rkisp1-common.h  | 11 +---
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 42 +++++++--------
 drivers/staging/media/rkisp1/rkisp1-resizer.c |  8 +--
 4 files changed, 29 insertions(+), 83 deletions(-)

-- 
2.17.1

