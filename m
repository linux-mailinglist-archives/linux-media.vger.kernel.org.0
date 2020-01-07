Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 303DD13285D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 15:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgAGOCM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 09:02:12 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:53814 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbgAGOCL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 09:02:11 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iopQs-0002Js-TP; Tue, 07 Jan 2020 14:02:07 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: v4l2-core: fix uninitialized structure fields being returned to userspace
Date:   Tue,  7 Jan 2020 14:02:06 +0000
Message-Id: <20200107140206.103711-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where v4l2_event_dequeue fails the structure ev is not
being filled and this garbage data from the stack is being copied
to the ev32 structure and being copied back to userspace on the
VIDIOC_DQEVENT_TIME32 ioctl.  Fix this by ensuring the ev structure
is zero'd to ensure uninitialized data is not leaked back.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index de926e311348..a376b351135f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -394,7 +394,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 	case VIDIOC_DQEVENT_TIME32: {
 		struct v4l2_event_time32 *ev32 = arg;
-		struct v4l2_event ev;
+		struct v4l2_event ev = { };
 
 		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
 			return -ENOIOCTLCMD;
-- 
2.24.0

