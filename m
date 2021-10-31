Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3274C440DED
	for <lists+linux-media@lfdr.de>; Sun, 31 Oct 2021 12:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhJaL1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 07:27:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:47130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229697AbhJaL1i (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 07:27:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D18F60F58;
        Sun, 31 Oct 2021 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635679506;
        bh=/ba630/yMxIG0G/HrfuOl0TTd12zVAhW+3p5jt4O1qg=;
        h=From:To:Cc:Subject:Date:From;
        b=oc2RO08dPHGJIm4glq6KAAnyX1wJ3BcD1+WsaqgNw7C5s7sWu6Qf4EUW2Vm6UsAsn
         QV2meBXVjguJoYt5SVMRQ1eoRT2pyC31iglV8D5F6Pkqg4/36ERdF7S/B6vdd8BsTg
         1gO8Nn8NZsVCHFf6ZF/ii+64U7GyKjRUqsCbIMP/6erYsHzEfiSTT8CUDZcCekLiA3
         /wDiP/+hf7Vq0OygRfpYk7Tke8GXHhvWOo7z4OkDjWm0D20Myxqsi3+Zns0U8bg9ST
         P1bOAn/Ircmq2S55sgWZNYpKDJfq45eyq/V/O7qUc8oRtZ3c5nY9z7fiplI4UsLq3v
         TKJh1orqxpkrw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mh8xT-003wZJ-Cp; Sun, 31 Oct 2021 11:25:03 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 1/3] media: atomisp: don't print errors for ignored MBUS formats
Date:   Sun, 31 Oct 2021 11:25:00 +0000
Message-Id: <dc24ab2a6c9bb0831e1bb732d3377529fb0ead87.1635679495.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bayer formats aren't currently available for userspace
to select: those are marked as IA_CSS_FRAME_FORMAT_RAW and
trying to get them result on binary firmware load errors:

	[74625.258097] atomisp-isp2 0000:00:03.0: Using binary isp_preview_var_isp2 (id 22), type 0, mode 1, continuous true
	[74625.258146] atomisp-isp2 0000:00:03.0: Seeking for binary failed at:
	[74625.258161] CPU: 3 PID: 2792 Comm: v4l2grab Tainted: G         C        5.15.0-rc4+ #77
	[74625.258190] Hardware name: ASUSTeK COMPUTER INC. T101HA/T101HA, BIOS T101HA.306 04/23/2019
	[74625.258208] Call Trace:
	[74625.258231]  dump_stack_lvl+0x46/0x5a
	[74625.258272]  ia_css_binary_find+0xa7d/0xcf0 [atomisp]
	[74625.258570]  load_preview_binaries+0x323/0x3c0 [atomisp]
	...
	[74625.265892] atomisp-isp2 0000:00:03.0: can't create streams
	[74625.265937] atomisp-isp2 0000:00:03.0: __get_frame_info 1604x1200 (padded to 0) returned -22
	[74625.265962] atomisp-isp2 0000:00:03.0: Can't set format on ISP. Error -22

As those formats are ignored by purpose, it doesn't make any sense
to print a message like:

	atomisp_enum_fmt_cap(): format for code 3007 not found.

for those.

Yet, some day it would be interesting to also report the bayer
formats, letting userspace to decode them on a different way.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index f082d7a67875..8f0a9a69f075 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -829,8 +829,6 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		f->pixelformat = format->pixelformat;
 		return 0;
 	}
-	dev_err(isp->dev, "%s(): format for code %x not found.\n",
-		__func__, code.code);
 
 	return -EINVAL;
 }
-- 
2.31.1

