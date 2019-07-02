Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2F5C5D36A
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfGBPtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:49:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58372 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbfGBPtF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 11:49:05 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:c7f4:61e7:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 39A21289C89;
        Tue,  2 Jul 2019 16:49:00 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 2/7] media: vimc: video: Add write file operation
Date:   Tue,  2 Jul 2019 12:47:47 -0300
Message-Id: <20190702154752.14939-3-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702154752.14939-1-andrealmeid@collabora.com>
References: <20190702154752.14939-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add write on the list of vb2 file operations. This is required to
create a V4L2 output device.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---
 drivers/media/platform/vimc/vimc-video.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/vimc/vimc-video.h b/drivers/media/platform/vimc/vimc-video.h
index d329345cc77f..22cb0e2dbdbb 100644
--- a/drivers/media/platform/vimc/vimc-video.h
+++ b/drivers/media/platform/vimc/vimc-video.h
@@ -35,6 +35,7 @@ static const struct v4l2_file_operations vimc_vid_fops = {
 	.open		= v4l2_fh_open,
 	.release	= vb2_fop_release,
 	.read           = vb2_fop_read,
+	.write          = vb2_fop_write,
 	.poll		= vb2_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap           = vb2_fop_mmap,
-- 
2.22.0

