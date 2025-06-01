Return-Path: <linux-media+bounces-33783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C98ACA3D5
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 01:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D57018874F1
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 23:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EDDB28BAB9;
	Sun,  1 Jun 2025 23:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsnKy5ta"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A5528BAA1;
	Sun,  1 Jun 2025 23:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820641; cv=none; b=EV/Rli167laenesh3cygGJCLtVUM6dCPPwxOySmzzKDYiVZERfV41k+QvpqfJ3enWBE2YKgY+JoqE9E84UBPun4CtaZ6GCb4vWQTmhToM+9s3gZvibB6bAupwfDjMzh4Z6gEHbh9ACaevfSY5I8xmxxTJWR40od8hKrdzgZe0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820641; c=relaxed/simple;
	bh=iFtuyAwbz+GsTdsY9gBdkxZEz7gIkMicr6z563Tlceo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rQcWfgPfJ1FPVb3sUJcWmTCP48GiVhWgPGNtwxAWBlpqWPWZ80y11zvoa60+aQ6u0D24uvWSJlG/sd9CcdxuY4T0Xiga6sbmkyhh3zQvYYjkk3TH3uTzgD/90pRi/SfGUkDKEl2clCkj3KU6wffSmugv0LZT+hETBA0WmA5RVuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsnKy5ta; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0914C4CEE7;
	Sun,  1 Jun 2025 23:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820640;
	bh=iFtuyAwbz+GsTdsY9gBdkxZEz7gIkMicr6z563Tlceo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SsnKy5taTuw27huGwaXXkpB8scfojnBoywupj6j/ylbdyV6yHc7gAfltAMtr1rgZV
	 nzi1Z4NQw10P2Bo5K3GNVOkxO4E0y6cApPMpwe272IVxpHfSO/Y3brswrSsftB3y4P
	 tAXua4UYs3H7E+68yFHrajtLWyNa1AFmAMp7Hiau/h2GBzkkwwe7S0sB4Q0Gi6BFOZ
	 tx+Mgipjj/O410nF9UAwD9xtcHjocBkYpdqnmN6B3ePl+YfBknU+PJCreLd4X/Z/EI
	 fdrlb1h+8ROR4O/xrGy9lmMew1qJOrvVVA7/eWM/QC69SHl2PoCBme3H9mu9wIf90j
	 e3nRmHYaY0TiA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 024/102] media: i2c: imx334: Enable runtime PM before sub-device registration
Date: Sun,  1 Jun 2025 19:28:16 -0400
Message-Id: <20250601232937.3510379-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tarang Raval <tarang.raval@siliconsignals.io>

[ Upstream commit 01dfdf6a80c57151af0589af0db7adbbdd1361c7 ]

Runtime PM is fully initialized before calling
v4l2_async_register_subdev_sensor(). Moving the runtime PM initialization
earlier prevents potential access to an uninitialized or powered-down
device.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees.
**Analysis:** **1. Pattern Recognition from Similar Commits:** The
provided historical commits show a clear pattern: - **Similar commits
marked YES**: imx355 and smiapp drivers with identical runtime PM
ordering fixes - **Similar commits marked NO**: imx319, ov4689, ov2740
commits that appear to be more general cleanup/improvement rather than
bug fixes **2. Code Analysis:** The imx334 commit makes the exact same
critical fix as the accepted imx355 commit: **Before (problematic):**
```c ret = v4l2_async_register_subdev_sensor(&imx334->sd); // Device
becomes accessible /bin /bin.usr-is-merged /boot /dev /etc /home /init
/lib /lib.usr-is-merged /lib64 /lost+found /media /mnt /opt /proc /root
/run /sbin /sbin.usr-is-merged /snap /srv /sys /tmp /usr /var ... model/
prompt/ src/ target/ pm_runtime_set_active(imx334->dev); // Runtime PM
enabled AFTER pm_runtime_enable(imx334->dev); ``` **After (fixed):**
```c pm_runtime_set_active(imx334->dev); // Runtime PM enabled BEFORE
pm_runtime_enable(imx334->dev); ret =
v4l2_async_register_subdev_sensor(&imx334->sd); // Device becomes
accessible ``` **3. Bug Significance:** The commit message explicitly
states this prevents "potential access to an uninitialized or powered-
down device." This is a **race condition bug** where: - The sensor
device becomes accessible via v4l2_async_register_subdev_sensor() -
Other components (like ipu-bridge) may immediately try to access the
device via runtime PM - If runtime PM isn't initialized yet, these
accesses will fail **4. Backport Criteria Assessment:** ✓ **Fixes a
user-affecting bug**: Race condition causing device access failures ✓
**Small and contained**: Only reorders initialization, no logic changes
✓ **No architectural changes**: Pure initialization ordering fix ✓
**Minimal regression risk**: The change aligns with established patterns
✓ **Follows stable tree rules**: Important bugfix with minimal risk **5.
Consistency with Accepted Patterns:** The imx355 commit (marked YES) has
an identical issue and fix pattern. The key difference from rejected
commits is that imx355 and imx334 explicitly mention preventing device
access failures, while others were general improvements. **6. Error
Handling Analysis:** The commit properly adds runtime PM cleanup in
error paths: ```c error_media_entity: pm_runtime_disable(imx334->dev);
pm_runtime_set_suspended(imx334->dev); ``` This is a critical race
condition fix that prevents real-world device access failures, follows
established successful backport patterns, and has minimal risk - making
it an excellent stable backport candidate.

 drivers/media/i2c/imx334.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index a544fc3df39c2..b51721c01e1d6 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -1391,6 +1391,9 @@ static int imx334_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
+	pm_runtime_set_active(imx334->dev);
+	pm_runtime_enable(imx334->dev);
+
 	ret = v4l2_async_register_subdev_sensor(&imx334->sd);
 	if (ret < 0) {
 		dev_err(imx334->dev,
@@ -1398,13 +1401,13 @@ static int imx334_probe(struct i2c_client *client)
 		goto error_media_entity;
 	}
 
-	pm_runtime_set_active(imx334->dev);
-	pm_runtime_enable(imx334->dev);
 	pm_runtime_idle(imx334->dev);
 
 	return 0;
 
 error_media_entity:
+	pm_runtime_disable(imx334->dev);
+	pm_runtime_set_suspended(imx334->dev);
 	media_entity_cleanup(&imx334->sd.entity);
 error_handler_free:
 	v4l2_ctrl_handler_free(imx334->sd.ctrl_handler);
-- 
2.39.5


