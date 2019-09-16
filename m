Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A166B36C1
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 11:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731547AbfIPJAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 05:00:51 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:33583 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729808AbfIPJAv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 05:00:51 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9msJiUOo68SjN9msLiWV3y; Mon, 16 Sep 2019 11:00:49 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] v4l2-ioctl.c: use new V4L2_FOURCC_CONV/ARGS macros
Date:   Mon, 16 Sep 2019 11:00:47 +0200
Message-Id: <20190916090047.122078-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916090047.122078-1-hverkuil-cisco@xs4all.nl>
References: <20190916090047.122078-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBKUNAtJA02TwDJGfI0gzwqKrt/XUx/l9vp2yjnt4oQxuIpKKbR08s9ZYvRK53ZHWZSJPU/M7BQmuTVaupZuIZ0JlQGjlukv38iBLTXh5GrPi6Zq4sAP
 LlfV61JkZEqHXtQvFvB1v1OJcQn1H5dmjIDFbGjDepaT5fkjbi/J9QO5r36wAli7W2cUCYdKxM3IrmhSikdvhAxM0ZQYUG+i1F7JQGYpoR/hqsa/UMd0c1zq
 dM49qc124C2/6jdtKbcpDT4nHbavKzqbMRs09r6I8mfKxc/eCko4fSwUd7bErXx2NbkDrCPzs/oN0ATRCXPs8YakMVocBvjJ1g5VoUF7vp306XXEghogeJBJ
 QsMaZGKp
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use these new standard macros to log the fourcc value in a
human readable format.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 51b912743f0f..80030533e1b8 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1383,12 +1383,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 				return;
 			WARN(1, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
 			flags = 0;
-			snprintf(fmt->description, sz, "%c%c%c%c%s",
-					(char)(fmt->pixelformat & 0x7f),
-					(char)((fmt->pixelformat >> 8) & 0x7f),
-					(char)((fmt->pixelformat >> 16) & 0x7f),
-					(char)((fmt->pixelformat >> 24) & 0x7f),
-					(fmt->pixelformat & (1UL << 31)) ? "-BE" : "");
+			snprintf(fmt->description, sz, V4L2_FOURCC_CONV,
+				 V4L2_FOURCC_ARGS(fmt->pixelformat));
 			break;
 		}
 	}
-- 
2.20.1

