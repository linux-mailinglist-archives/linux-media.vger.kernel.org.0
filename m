Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E73956951D
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 16:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390837AbfGOOYB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 10:24:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:56474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390828AbfGOOYA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 10:24:00 -0400
Received: from sasha-vm.mshome.net (unknown [73.61.17.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF07621537;
        Mon, 15 Jul 2019 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563200639;
        bh=GDWlb0iaTA6dl1TidLEP2nJJYe+KUFxZF38qJmpJ2fM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qaNhaXW7RlX6/k/VNGq9h5nAzA78uDPBI42/nTcEFy5cFlTJwarK7A+9jSE93ghsn
         W/NcchgC7KO365+bUJTpDGs9W99tBXGGYI7qCjMZavlKc7yidnxAA82LEoTdNGFPwg
         sqCXr5JjSO/FWJuW0ubKZeO1Sdxs+PPG+bRydTbA=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 100/158] media: vimc: cap: check v4l2_fill_pixfmt return value
Date:   Mon, 15 Jul 2019 10:17:11 -0400
Message-Id: <20190715141809.8445-100-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715141809.8445-1-sashal@kernel.org>
References: <20190715141809.8445-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: André Almeida <andrealmeid@collabora.com>

[ Upstream commit 77ae46e11df5c96bb4582633851f838f5d954df4 ]

v4l2_fill_pixfmt() returns -EINVAL if the pixelformat used as parameter is
invalid or if the user is trying to use a multiplanar format with the
singleplanar API. Currently, the vimc_cap_try_fmt_vid_cap() returns such
value, but vimc_cap_s_fmt_vid_cap() is ignoring it. Fix that and returns
an error value if vimc_cap_try_fmt_vid_cap() has failed.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
Suggested-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/vimc/vimc-capture.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 65d657daf66f..8e014cc485f0 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -132,12 +132,15 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
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
2.20.1

