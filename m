Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE9943F938
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 10:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbhJ2IwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 04:52:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:49080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232505AbhJ2IwJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 04:52:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D72CB61157;
        Fri, 29 Oct 2021 08:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635497380;
        bh=nHj/PtqTShC5DJeCKQQ6eaD/es2mjzAYoWFJcIhmDyQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=omM6eedfyGm8EOPeolv3AjpcpBnkgylGVXH0NDzaresfz2OK8yi5u/04BNzSu1ToZ
         AyOz/2aSChTYh5OIaDVRL2WJCzi3x9VP/Ihw3MHhA2d+wzUFqiOXMDn1cwKECD94yr
         9aViirPeb87jr/TvGbpwcAPWOSJezoO00R4xDaf3Oz7SMFLRx9BbjTp/ZBXOTp+mtU
         YMXtgQL2CPpsjVIfBn35EHV5eq+3w7K6rpsmBOPnjlP6K6otzggVH7n2Gyhso/R8tR
         NHdNJa9yggC3y6VjQcTC8BHMg8kaF8ypITbnfIp43grtkWiqFJS6FiM9kxVpdBQujA
         /59rfnQxw9AEQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mgNZx-002sAM-S6; Fri, 29 Oct 2021 09:49:37 +0100
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
Subject: [PATCH 2/2] media: atomisp: set default mode
Date:   Fri, 29 Oct 2021 09:49:36 +0100
Message-Id: <543e61dd07c90a7d8577b3a94696edc77953b9d8.1635497370.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <750e50daa3ed65a7eb060cb0eb5cfc60dc9386be.1635497370.git.mchehab+huawei@kernel.org>
References: <750e50daa3ed65a7eb060cb0eb5cfc60dc9386be.1635497370.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Without setting a default mode at open(), applications that
don't call VIDIOC_SET_PARM with a custom atomisp parameters
won't work, as the pipeline won't be set:

	atomisp-isp2 0000:00:03.0: can't create streams
	atomisp-isp2 0000:00:03.0: __get_frame_info 1600x1200 (padded to 0) returned -22

So, as an step to allow generic apps to use this driver, put
the device's run_mode in preview after open.

After this patch, using v4l2grab starts to work:

	$ v4l2grab -D -f 'NV12' -x 1600 -y 1200 -d /dev/video2 -u
	$ nvt/raw2pnm -x1600 -y1200 -f NV12 out017.raw out017.pnm
	$ feh out017.pnm

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 72cbdce2142a..7df982c80b1a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -893,6 +893,11 @@ static int atomisp_open(struct file *file)
 	else
 		pipe->users++;
 	rt_mutex_unlock(&isp->mutex);
+
+	/* Ensure that a mode is set */
+	if (asd)
+		v4l2_ctrl_s_ctrl(asd->run_mode, ATOMISP_RUN_MODE_PREVIEW);
+
 	return 0;
 
 css_error:
-- 
2.31.1

