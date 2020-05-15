Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1571D507B
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 16:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgEOOaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 10:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726185AbgEOOaD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 10:30:03 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2DCBC061A0C
        for <linux-media@vger.kernel.org>; Fri, 15 May 2020 07:30:02 -0700 (PDT)
Received: from localhost.localdomain (p200300cb871f5b0000f307f9e92f920a.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:f3:7f9:e92f:920a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E14252A2401;
        Fri, 15 May 2020 15:30:00 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 0/4] media: staging: rkisp1: various fixes to capture formats
Date:   Fri, 15 May 2020 16:29:48 +0200
Message-Id: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset fixes some issues in the supported capture formats
of rkisp1.

Patches Summary:

1. Replaces the format V4L2_PIX_FMT_RGB24 with format V4L2_PIX_FMT_XBGR32 which
is the format the device supports.

2. Uses the vdiv, hdiv of the yuv422 explicitly instead of defining macros.
This is a cleanup patch to make it clear where those values are taken from.

3. In case of YUV444 format, the memory input format should stay YUV422
and not be converted by the resizer. This patch fixes it

4. remove support of BGR666 format since it is not supported by the device.

The fixes to formats V4L2_PIX_FMT_XBGR32, V4L2_PIX_FMT_YUV444M
were tested.

Changes from v1:
In v1 I sent a single patch
"media: staging: rkisp1: cap: change RGB24 format to XBGR32"
This patchset reword the commit log of that patch and includes
the 3 other patches.


Dafna Hirschfeld (4):
  media: staging: rkisp1: cap: change RGB24 format to XBGR32
  media: staging: rkisp1: rsz: use hdiv, vdiv of yuv422 instead of
    macros
  media: staging: rkisp1: rsz: set output format to YUV422 if cap format
    is YUV444
  media: staging: rkisp1: cap: remove support of BGR666 format

 drivers/staging/media/rkisp1/rkisp1-capture.c |  6 +---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 28 +++++++++----------
 2 files changed, 15 insertions(+), 19 deletions(-)

-- 
2.17.1

