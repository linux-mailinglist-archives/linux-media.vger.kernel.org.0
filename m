Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A243B1A12A4
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 19:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgDGRZc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 13:25:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42600 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgDGRZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 13:25:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E3CA929677F
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH] media: staging: rkisp1: remove TODO item - uapi structs compatibility
Date:   Tue,  7 Apr 2020 19:25:22 +0200
Message-Id: <20200407172522.20340-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

remove the TODO item:

* Make sure uapi structs have the same size and layout in 32 and 62 bits,
and that there are no holes in the structures (pahole is a utility that
can be used to test this).

It was tested with pahole and found compatible.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
I tested it using a script that compiles a code that includes the header
both for arm and arm64 and compare the sha1 of the pahole results:

git clone --single-branch --branch rkisp1 git@gitlab.collabora.com:dafna/v4l2-ctrl-abi-check.git
./run-rkisp1.sh

 drivers/staging/media/rkisp1/TODO | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
index 0aa9877dd64a..f495b8177767 100644
--- a/drivers/staging/media/rkisp1/TODO
+++ b/drivers/staging/media/rkisp1/TODO
@@ -4,9 +4,6 @@ cio2_parse_firmware in drivers/media/pci/intel/ipu3/ipu3-cio2.c.
 * Fix pad format size for statistics and parameters entities.
 * Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
 * Fix checkpatch errors.
-* Make sure uapi structs have the same size and layout in 32 and 62 bits,
-and that there are no holes in the structures (pahole is a utility that
-can be used to test this).
 * Review and comment every lock
 * Handle quantization
 * Document rkisp1-common.h
-- 
2.20.1

