Return-Path: <linux-media+bounces-47062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 765BDC5C383
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 10:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 272314F6A18
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 09:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E913019C1;
	Fri, 14 Nov 2025 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="VG3Ln/dr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CE93016F5;
	Fri, 14 Nov 2025 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111595; cv=none; b=eVAbuMsRrGOQSgXUiN6+Aw95Llo4Vchgx/cXdatnbvliASNS/iEkqpFSDyT3rmVIdbE9e52KlVEyAvbD/++/8sNOLq0mMzJfhv7Nj1vToeRTz4PvoaCyOn+sjKnlcpoQauf8HjAWQQ8+3H2d2TOMyXr65QaNMthhAZMS/fQKfrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111595; c=relaxed/simple;
	bh=RIY07XPyKe5L+ZeyK6GDW5uwco2GOJNBREhd2oMdYSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GKUqKToKD7qfeb58+grAfiRogphDXg+kwro3R95tA27fN4qn0lkDfRvn0340nrXsZKnnGMdMufH3d1hxuBC/EetXLmJQRGPn/MZKDZyWWBgDJHw6GOUzVT7BL1fTDJ9NxQEdBXn1m3tCUeSaodBCcC7EVX4nh/ZjodZ9VpXy0Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=VG3Ln/dr; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2998aa759;
	Fri, 14 Nov 2025 17:13:00 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: jonathanh@nvidia.com
Cc: skomatineni@nvidia.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] media: tegra-video: Fix memory leak in __tegra_channel_try_format()
Date: Fri, 14 Nov 2025 09:12:57 +0000
Message-Id: <20251114091257.1616738-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a81a3b14503a1kunmddf594931af9e5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGBhCVh8fTU1JSR8eHklMSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZS1VLVUtVS1kG
DKIM-Signature: a=rsa-sha256;
	b=VG3Ln/drpj/G7iSWk9NkqHBaJSeDGnNoErI3r+/ZQ/i4CwelOL+mXsxrERiOm2nYMN78TMPfqNbdaAFjhDeXlRgkKOJFcbrNZiHuxZFiuRILG/CJaQHPwpsDq1s63F3esQWsRJEZtrPy6i+d9H+GFzpCrAcPwDH2zdqTaoiOunI=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=GEFFh+Nwict6VejMdzW7BfYMOeEGIwcjfqJ7sedV6Q4=;
	h=date:mime-version:subject:message-id:from;

The state object allocated by __v4l2_subdev_state_alloc() must be freed
with __v4l2_subdev_state_free() when it is no longer needed.

In __tegra_channel_try_format(), two error paths return directly after
v4l2_subdev_call() fails, without freeing the allocated 'sd_state'
object. This violates the requirement and causes a memory leak.

Fix this by introducing a cleanup label and using goto statements in the
error paths to ensure that __v4l2_subdev_state_free() is always called
before the function returns.

Fixes: 56f64b82356b7 ("media: tegra-video: Use zero crop settings if subdev has no get_selection")
Fixes: 1ebaeb09830f3 ("media: tegra-video: Add support for external sensor capture")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/staging/media/tegra-video/vi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157..14b327afe045 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -438,7 +438,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 		.target = V4L2_SEL_TGT_CROP_BOUNDS,
 	};
 	struct v4l2_rect *try_crop;
-	int ret;
+	int ret = 0;
 
 	subdev = tegra_channel_get_remote_source_subdev(chan);
 	if (!subdev)
@@ -482,8 +482,10 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 		} else {
 			ret = v4l2_subdev_call(subdev, pad, get_selection,
 					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
+			if (ret) {
+				ret = -EINVAL;
+				goto out_free;
+			}
 
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
@@ -495,14 +497,15 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 
 	ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
 	if (ret < 0)
-		return ret;
+		goto out_free;
 
 	v4l2_fill_pix_format(pix, &fmt.format);
 	chan->vi->ops->vi_fmt_align(pix, fmtinfo->bpp);
 
+out_free:
 	__v4l2_subdev_state_free(sd_state);
 
-	return 0;
+	return ret;
 }
 
 static int tegra_channel_try_format(struct file *file, void *fh,
-- 
2.34.1


