Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD464452A2
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhKDMIk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:08:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:37104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230148AbhKDMIi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 08:08:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92F8661205;
        Thu,  4 Nov 2021 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636027560;
        bh=zKYFDeJdHKeabqGOf8jmwAC943X5J5YwD8rVjIfscQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F7PgpKEy+UMz4cDYjY3KLLDHSpq8r7AXvriKwsZt3evbRMGkw0J9tGJnGbgBJ+DJk
         V2x1evx6jrl6V3undp8zzaU0RLH83sW642RJ0jSFhw0wMnBr/LFV8Sn59qqpH3TqwO
         uge3yikL3/g6vStULK+rM/k29cdN/wuDCNDJ+C4MFO/krtOyKgZD0a15Qzzkqg2M31
         Pc7xdmp2Ptpu7I8EZDRm3S7BVbtwKky51M0zmPdvDRu5crVyqZso0tWwhgMRAYAK28
         ZHfdoU0mu8X+dRhXwVcIg+sM/E+fCPbWCKF0Qz3fCWIl4h4wvGi7ra0yaip9LH56np
         +3wLkj6GEw6AA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mibVG-005nHn-6o; Thu, 04 Nov 2021 12:05:58 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Subject: [PATCH 4/7] media: atomisp: fix enum_fmt logic
Date:   Thu,  4 Nov 2021 12:05:53 +0000
Message-Id: <9f379a26b8651b7ed22be1da1ab9885fb1d1cfa1.1636026959.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636026959.git.mchehab+huawei@kernel.org>
References: <cover.1636026959.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the enum lists the sensor's native format as a
supported format. However, trying to setup a pipeline using
it doesn't work.

So, exclude such formats from the enum.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/7] at: https://lore.kernel.org/all/cover.1636026959.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 8df052f6190d..30483a84ed80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -775,6 +775,7 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 	struct v4l2_subdev_mbus_code_enum code = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
+	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev *camera;
 	unsigned int i, fi = 0;
 	int rval;
@@ -806,15 +807,15 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		return rval;
 
 	for (i = 0; i < ARRAY_SIZE(atomisp_output_fmts); i++) {
-		const struct atomisp_format_bridge *format =
-			    &atomisp_output_fmts[i];
+		format = &atomisp_output_fmts[i];
 
 		/*
 		 * Is the atomisp-supported format is valid for the
 		 * sensor (configuration)? If not, skip it.
+		 *
+		 * FIXME: fix the pipeline to allow sensor format too.
 		 */
-		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW
-		    && format->mbus_code != code.code)
+		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
 			continue;
 
 		/* Found a match. Now let's pick f->index'th one. */
-- 
2.31.1

