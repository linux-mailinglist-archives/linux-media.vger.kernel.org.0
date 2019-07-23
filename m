Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41E5C71830
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 14:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbfGWMZ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 08:25:56 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:50197 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726687AbfGWMZ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 08:25:56 -0400
Received: from [IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2] ([IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ptrZhvH5yLqASptrehIu7k; Tue, 23 Jul 2019 14:25:55 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] sh_veu: convert to struct v4l2_fh
Message-ID: <f46e2c33-3126-6bde-aba7-e49906c78722@xs4all.nl>
Date:   Tue, 23 Jul 2019 14:25:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP6CVQXK0ITsct7Uc4/S0iBsQOgTfBeQGk0SwXEwnDET1i2iQ813LuSz+zgCSbjO4p8cxOnu1MfTYVrH4i2E6WeQkg3Xk8WeWWqZkGasRytPC3zzFyJr
 t7xk4BkfmF8jvgl+fs/iCHD99G6ZigAUcB1objGN27sYJGNuQim7MfWsFW/893ingzJXb5gxeX7wbtCQPJfrKmza3tETh4RcEZxdlysXb9ePdBf92ciWd/xx
 lmQG2lc5WYdyDR3zz4lBG+vU+uPWzwA8oLMCrOleoxff6mfOf9yk7wFRi7Nnmu0betT8Rsi2Qc3VAIyrZgmPfdpzBB5UXmhqDQHUY3q2rvs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver didn't use struct v4l2_fh, so add it.

This is a very basic conversion. I can't test this on real hardware,
so I didn't dare to also convert the driver to start using the
v4l2-mem2mem ioctl/fop helpers.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/sh_veu.c b/drivers/media/platform/sh_veu.c
index 4be6efd47d33..2b4c0d9d6928 100644
--- a/drivers/media/platform/sh_veu.c
+++ b/drivers/media/platform/sh_veu.c
@@ -81,6 +81,7 @@
 struct sh_veu_dev;

 struct sh_veu_file {
+	struct v4l2_fh fh;
 	struct sh_veu_dev *veu_dev;
 	bool cfg_needed;
 };
@@ -961,12 +962,14 @@ static int sh_veu_open(struct file *file)
 	if (!veu_file)
 		return -ENOMEM;

+	v4l2_fh_init(&veu_file->fh, video_devdata(file));
 	veu_file->veu_dev = veu;
 	veu_file->cfg_needed = true;

 	file->private_data = veu_file;

 	pm_runtime_get_sync(veu->dev);
+	v4l2_fh_add(&veu_file->fh);

 	dev_dbg(veu->dev, "Created instance %p\n", veu_file);

@@ -996,6 +999,8 @@ static int sh_veu_release(struct file *file)
 	}

 	pm_runtime_put(veu->dev);
+	v4l2_fh_del(&veu_file->fh);
+	v4l2_fh_exit(&veu_file->fh);

 	kfree(veu_file);

