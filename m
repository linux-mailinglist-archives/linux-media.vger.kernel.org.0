Return-Path: <linux-media+bounces-15386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB5B93E683
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 17:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3B7BB20C2D
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 15:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26467A15C;
	Sun, 28 Jul 2024 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVvGQW4L"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F279DC7;
	Sun, 28 Jul 2024 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181497; cv=none; b=Rae/Nq3wO1bwuyx9tHjHqRI8QIh8k9ya1zHP8neidlhzbM/Qy549a+g5yzcI3uOCjE/pAj5tJBwY5KFQrnScp7nxzoa2QD++/WreYiXo4kDR9bLwnneuRFGzRjanmDVAYY+pMOVaO4XZmRayOOpxpWrA2U3LoEHmAkijGKcvZEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181497; c=relaxed/simple;
	bh=exxRV37Ako513hSB/j6t4F+oK/EExgBsefaCM8SAAMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8T2oYGDcIo1X5BzIZu3gzJCFFQlSGoUms7FTzo7q1KYpZX24croDm1U/008uZT6MXIhbO7GX/9vNm9O3VXPWkhtvvb5p5/tDjj+G1DJ+lVlZ0GOjAvaeS5l2g5thRJCrmCeMaonVYLw1snNxJFR3jWiS1TRGpergbW4q8I3pNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVvGQW4L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0C4C32782;
	Sun, 28 Jul 2024 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181496;
	bh=exxRV37Ako513hSB/j6t4F+oK/EExgBsefaCM8SAAMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fVvGQW4L/zIZOWN9gkaU4x5UuCCnJoUMzT7t95nRRzzMS9r11WhmsIt/C/8+E6m5L
	 FluBRz4Wgf4g+ptvyILSnrt/pEk0ukKHRUylQHIjt0kPUSEKg73EEauofizbEgVGMe
	 ZsjhDDnTjkBOHyombXyyBdt3Ms5MkdFJyo/UzspF0oGrobrTGt+w9y7fR3MVkFOSny
	 PaSujKiWFEu0cSLpBU3yryc6oCN315QjoslR3Y6py8M27EHQ6A1lXJeKsOIr/N0+1W
	 P0hhIbWf4N025uiX0YaZcJNTZ7ZiUSLnhwmz3YEpeArrqLNreo+TlknOPZpB0hK/Uq
	 tW5IxtbIYKU5w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chi Zhiling <chizhiling@kylinos.cn>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 28/34] media: xc2028: avoid use-after-free in load_firmware_cb()
Date: Sun, 28 Jul 2024 11:40:52 -0400
Message-ID: <20240728154230.2046786-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit

From: Chi Zhiling <chizhiling@kylinos.cn>

[ Upstream commit 68594cec291ff9523b9feb3f43fd853dcddd1f60 ]

syzkaller reported use-after-free in load_firmware_cb() [1].
The reason is because the module allocated a struct tuner in tuner_probe(),
and then the module initialization failed, the struct tuner was released.
A worker which created during module initialization accesses this struct
tuner later, it caused use-after-free.

The process is as follows:

task-6504           worker_thread
tuner_probe                             <= alloc dvb_frontend [2]
...
request_firmware_nowait                 <= create a worker
...
tuner_remove                            <= free dvb_frontend
...
                    request_firmware_work_func  <= the firmware is ready
                    load_firmware_cb    <= but now the dvb_frontend has been freed

To fix the issue, check the dvd_frontend in load_firmware_cb(), if it is
null, report a warning and just return.

[1]:
    ==================================================================
     BUG: KASAN: use-after-free in load_firmware_cb+0x1310/0x17a0
     Read of size 8 at addr ffff8000d7ca2308 by task kworker/2:3/6504

     Call trace:
      load_firmware_cb+0x1310/0x17a0
      request_firmware_work_func+0x128/0x220
      process_one_work+0x770/0x1824
      worker_thread+0x488/0xea0
      kthread+0x300/0x430
      ret_from_fork+0x10/0x20

     Allocated by task 6504:
      kzalloc
      tuner_probe+0xb0/0x1430
      i2c_device_probe+0x92c/0xaf0
      really_probe+0x678/0xcd0
      driver_probe_device+0x280/0x370
      __device_attach_driver+0x220/0x330
      bus_for_each_drv+0x134/0x1c0
      __device_attach+0x1f4/0x410
      device_initial_probe+0x20/0x30
      bus_probe_device+0x184/0x200
      device_add+0x924/0x12c0
      device_register+0x24/0x30
      i2c_new_device+0x4e0/0xc44
      v4l2_i2c_new_subdev_board+0xbc/0x290
      v4l2_i2c_new_subdev+0xc8/0x104
      em28xx_v4l2_init+0x1dd0/0x3770

     Freed by task 6504:
      kfree+0x238/0x4e4
      tuner_remove+0x144/0x1c0
      i2c_device_remove+0xc8/0x290
      __device_release_driver+0x314/0x5fc
      device_release_driver+0x30/0x44
      bus_remove_device+0x244/0x490
      device_del+0x350/0x900
      device_unregister+0x28/0xd0
      i2c_unregister_device+0x174/0x1d0
      v4l2_device_unregister+0x224/0x380
      em28xx_v4l2_init+0x1d90/0x3770

     The buggy address belongs to the object at ffff8000d7ca2000
      which belongs to the cache kmalloc-2k of size 2048
     The buggy address is located 776 bytes inside of
      2048-byte region [ffff8000d7ca2000, ffff8000d7ca2800)
     The buggy address belongs to the page:
     page:ffff7fe00035f280 count:1 mapcount:0 mapping:ffff8000c001f000 index:0x0
     flags: 0x7ff800000000100(slab)
     raw: 07ff800000000100 ffff7fe00049d880 0000000300000003 ffff8000c001f000
     raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
     page dumped because: kasan: bad access detected

     Memory state around the buggy address:
      ffff8000d7ca2200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
      ffff8000d7ca2280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     >ffff8000d7ca2300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                           ^
      ffff8000d7ca2380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
      ffff8000d7ca2400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     ==================================================================

[2]
    Actually, it is allocated for struct tuner, and dvb_frontend is inside.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/tuners/xc2028.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/tuners/xc2028.c b/drivers/media/tuners/xc2028.c
index 5a967edceca93..352b8a3679b72 100644
--- a/drivers/media/tuners/xc2028.c
+++ b/drivers/media/tuners/xc2028.c
@@ -1361,9 +1361,16 @@ static void load_firmware_cb(const struct firmware *fw,
 			     void *context)
 {
 	struct dvb_frontend *fe = context;
-	struct xc2028_data *priv = fe->tuner_priv;
+	struct xc2028_data *priv;
 	int rc;
 
+	if (!fe) {
+		pr_warn("xc2028: No frontend in %s\n", __func__);
+		return;
+	}
+
+	priv = fe->tuner_priv;
+
 	tuner_dbg("request_firmware_nowait(): %s\n", fw ? "OK" : "error");
 	if (!fw) {
 		tuner_err("Could not load firmware %s.\n", priv->fname);
-- 
2.43.0


