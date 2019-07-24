Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 157F972D74
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 13:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbfGXL1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 07:27:21 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:36679 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727442AbfGXL1V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 07:27:21 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qFQSh3s6JLqASqFQVhNKzD; Wed, 24 Jul 2019 13:27:19 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 01/14] v4l2-ioctl.c: OR flags in v4l_fill_fmtdesc(), not don't overwrite
Date:   Wed, 24 Jul 2019 13:27:03 +0200
Message-Id: <20190724112716.30288-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
References: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDQrmu0wN0i89gUYIxlcH+2uzmvQrLzJ406BxzG2GisP/f+GtoM+UfN1PNKKIum/qZ4z/k9WPoYlLQ6KQ3Ss+ATINCqYL4PFKcSKLGj/Dqn0h49MdJIY
 qthESU5LXlxr0ge+/f4kBhzDGjr3hdrUOwNcs5Z2v4HV1HmfXx3Vhh+UbJBQGRIYDFu3/CY6dRxDR/U+3IB28yg5Y6+deKYZowzbs38yambdAVrPerYSTq+k
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a driver sets a FMT flag in the enum_fmt op, then that will be
ignored since v4l_fill_fmtdesc() overwrites it again.

v4l_fill_fmtdesc() should OR its flag, not overwrite it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 80efc581e3f9..911a20f915c5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1390,7 +1390,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 
 	if (descr)
 		WARN_ON(strscpy(fmt->description, descr, sz) < 0);
-	fmt->flags = flags;
+	fmt->flags |= flags;
 }
 
 static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
-- 
2.20.1

