Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318CA44619F
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 10:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232907AbhKEJyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 05:54:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:48410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232829AbhKEJyW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 05:54:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B68F061186;
        Fri,  5 Nov 2021 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636105902;
        bh=Ml1rfA4759bCJ5hExUvKB1NFiv0eVVSsg8nOvtDZBbI=;
        h=From:To:Cc:Subject:Date:From;
        b=mIB09qWmFGjke32DY9JU0Z3Kx9NJLP67npOZ9e/UNJPxyYaOzctnYqMJHndrXUZYO
         VYb1rYQ6CgfiCKn7L08lM2fW4obNi7uQ628Ph+GMsrKjBf5HAtgG5RV6e6BU5velQZ
         P3JggRcQ8VP3xYu6PJn4eryRpiO2hZp+pzWgG7AiFuITFqdM97GOJLmKUA+g1MDw+S
         x0SlAsc0QwTig06RkbDI9UCaAMReBB/gJxZ/eteh2dLtGuWqSdt86VLsxH3tNIxgJa
         H6Hy9g9XymrUxrCcZapjLa/8lo9R0tuDA+YIpSMTRNg95Wz4tvnXi8EOZuYlFnwiKQ
         ETZDOtjAl4o2Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mivsp-006s87-CB; Fri, 05 Nov 2021 09:51:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alan <alan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: allocate a v4l2_fh at open time
Date:   Fri,  5 Nov 2021 09:51:38 +0000
Message-Id: <7a59d8613331d242624e887d9089ded399015a97.1636105894.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This avoids an OOPS when VIDIOC_*_PRIORITY calls are used.

[   90.820011] BUG: kernel NULL pointer dereference, address: 0000000000000020
[   90.820021] #PF: supervisor read access in kernel mode
[   90.820026] #PF: error_code(0x0000) - not-present page
[   90.820030] PGD 1221bc067 P4D 1221bc067 PUD 1221bd067 PMD 0
[   90.820042] Oops: 0000 [#1] SMP
[   90.820048] CPU: 0 PID: 2007 Comm: qv4l2 Tainted: G         C        5.15.0-rc4+ #77
[   90.820055] Hardware name: ASUSTeK COMPUTER INC. T101HA/T101HA, BIOS T101HA.306 04/23/2019
[   90.820059] RIP: 0010:v4l2_prio_change+0xf/0x40 [videodev]
[   90.820096] Code: 48 8b 47 20 8b 40 44 25 ff ff 0f 00 48 8b 04 c5 20 58 44 c0 c3 66 0f 1f 44 00 00 0f 1f 44 00 00 8d 42 ff 83 f8 02 77 21 31 c0 <39> 16 74 20 8d 02 f0 ff 04 87 8b 06 89 c1 83 e9 01 83 f9 02 77 04
[   90.820103] RSP: 0018:ffffb348c142fd70 EFLAGS: 00010246
[   90.820109] RAX: 0000000000000000 RBX: ffff95575fbe2760 RCX: ffffb348c142fe48
[   90.820114] RDX: 0000000000000002 RSI: 0000000000000020 RDI: ffff955740996088
[   90.820118] RBP: 0000000040045644 R08: ffffffffc070da80 R09: 0000000000004000
[   90.820122] R10: 0000000000000000 R11: 0000000000000000 R12: ffff955766725300
[   90.820126] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000044
[   90.820131] FS:  00007f848526b900(0000) GS:ffff9557bbe00000(0000) knlGS:0000000000000000
[   90.820137] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   90.820141] CR2: 0000000000000020 CR3: 00000001221bf000 CR4: 00000000001006f0
[   90.820146] Call Trace:
[   90.820155]  __video_do_ioctl+0x37d/0x3b0 [videodev]
[   90.820189]  video_usercopy+0x188/0x7a0 [videodev]
[   90.820218]  ? v4l_print_control+0x20/0x20 [videodev]
[   90.820247]  ? swake_up_one+0x39/0x70
[   90.820258]  ? rcu_core+0xff/0x2e0
[   90.820267]  ? sched_clock_cpu+0x9/0xa0
[   90.820275]  ? irqtime_account_irq+0x38/0xb0
[   90.820282]  v4l2_ioctl+0x46/0x50 [videodev]

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 7df982c80b1a..41fa0ca2d8d4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -782,6 +782,15 @@ static int atomisp_open(struct file *file)
 	 * FIXME: revisit this with a better check once the code structure
 	 * is cleaned up a bit more
 	 */
+dev_info(isp->dev, "opening v4l2 fh\n");
+	ret = v4l2_fh_open(file);
+	if (ret) {
+		dev_err(isp->dev,
+			"%s: v4l2_fh_open() returned error %d\n",
+		       __func__, ret);
+		rt_mutex_unlock(&isp->loading);
+		return ret;
+	}
 	if (!isp->ready) {
 		rt_mutex_unlock(&isp->loading);
 		return -ENXIO;
@@ -1046,7 +1055,7 @@ static int atomisp_release(struct file *file)
 	rt_mutex_unlock(&isp->mutex);
 	mutex_unlock(&isp->streamoff_mutex);
 
-	return 0;
+	return v4l2_fh_release(file);
 }
 
 /*
-- 
2.31.1

