Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 100AF11A197
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 03:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfLKCsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 21:48:11 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:33134 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726974AbfLKCsL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 21:48:11 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 7A8A34A84162F91C0B49;
        Wed, 11 Dec 2019 10:48:09 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.183) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Wed, 11 Dec 2019
 10:47:59 +0800
To:     <tglx@linutronix.de>, <crope@iki.fi>,
        <linux-media@vger.kernel.org>, <rfontana@redhat.com>,
        <gregkh@linuxfoundation.org>, <erik.andren@gmail.com>,
        <hverkuil@xs4all.nl>, <brijohn@gmail.com>, <lcostantino@gmail.com>,
        <hverkuil@xs4all.nl>, <suweifeng1@huawei.com>
CC:     Mingfangsen <mingfangsen@huawei.com>, <guiyao@huawei.com>
From:   Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: [PATCH] media: usb/cpia2: fix start_offset+size Integer Overflow in,
 cpia2_remap_buffer
Message-ID: <83ed0748-634d-4146-d216-53681bc3b553@huawei.com>
Date:   Wed, 11 Dec 2019 10:47:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.220.183]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Weifeng Su <suweifeng1@huawei.com>

CVE-2019-18675: The Linux kernel through 5.3.13 has a start_offset+size
IntegerOverflow in cpia2_remap_buffer in drivers/media/usb/cpia2/cpia2_core.c
because cpia2 has its own mmap implementation. This allows local users
(with /dev/video0 access) to obtain read and write permissions on kernel
physical pages, which can possibly result in a privilege escalation.

Here, we fix it through proper start_offset value check.

CVE Link: https://nvd.nist.gov/vuln/detail/CVE-2019-18675
Signed-off-by: Weifeng Su <suweifeng1@huawei.com>
Reviewed-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 drivers/media/usb/cpia2/cpia2_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cpia2/cpia2_core.c b/drivers/media/usb/cpia2/cpia2_core.c
index 20c50c2d042e..26ae7a5e3783 100644
--- a/drivers/media/usb/cpia2/cpia2_core.c
+++ b/drivers/media/usb/cpia2/cpia2_core.c
@@ -2401,7 +2401,7 @@ int cpia2_remap_buffer(struct camera_data *cam, struct vm_area_struct *vma)

 	if (size > cam->frame_size*cam->num_frames  ||
 	    (start_offset % cam->frame_size) != 0 ||
-	    (start_offset+size > cam->frame_size*cam->num_frames))
+	    (start_offset > cam->frame_size*cam->num_frames - size))
 		return -EINVAL;

 	pos = ((unsigned long) (cam->frame_buffer)) + start_offset;
-- 
2.24.0.windows.2


