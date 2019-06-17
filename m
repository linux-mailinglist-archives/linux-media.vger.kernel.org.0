Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64238488E5
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 18:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbfFQQ3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 12:29:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55100 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbfFQQ3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 12:29:17 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:d719:ae74:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 031F626D0BB;
        Mon, 17 Jun 2019 17:29:13 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH] media: vimc: cap: check v4l2_fill_pixfmt return value
Date:   Mon, 17 Jun 2019 13:28:02 -0300
Message-Id: <20190617162802.10042-1-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_fill_pixfmt() returns -EINVAL if the pixelformat used as parameter is
invalid or if the user is trying to use a multiplanar format with the
singleplanar API. Currently, the vimc_cap_try_fmt_vid_cap() returns such
value, but vimc_cap_s_fmt_vid_cap() is ignoring it. Fix that and returns
an error value if vimc_cap_try_fmt_vid_cap() has failed.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
Suggested-by: Helen Koike <helen.koike@collabora.com>
---
Hello,

This commit was suggest by Helen at "[v3,05/14] media: vimc: cap:
refactor singleplanar as a subset of multiplanar"

 drivers/media/platform/vimc/vimc-capture.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 946dc0908566..664855708fdf 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -142,12 +142,15 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
 	struct vimc_cap_device *vcap = video_drvdata(file);
+	int ret;
 
 	/* Do not change the format while stream is on */
 	if (vb2_is_busy(&vcap->queue))
 		return -EBUSY;
 
-	vimc_cap_try_fmt_vid_cap(file, priv, f);
+	ret = vimc_cap_try_fmt_vid_cap(file, priv, f);
+	if (ret)
+		return ret;
 
 	dev_dbg(vcap->dev, "%s: format update: "
 		"old:%dx%d (0x%x, %d, %d, %d, %d) "
-- 
2.22.0

