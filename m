Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBDA4428BF
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 08:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhKBHqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 03:46:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:36414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229526AbhKBHqK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 03:46:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82BB4604AC;
        Tue,  2 Nov 2021 07:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635839015;
        bh=XMiM7tUILn/CdFEk3cemcDSZQDQhzya53qvDkGv3u6o=;
        h=From:To:Cc:Subject:Date:From;
        b=JYclfm0lVXHBLetU46MAWvUcbPBBl7lXgkoGwISBPdHyRJQg8pVNvb7WyJJB/nzvl
         TNwYT1hYi02L0fdIBX0YbQo7Ok0Xz83g5XLIMf79FYMAjCthEHTww2oJHltJSaPS0k
         W/BWs2/rjjYUnQ7c5rhN0Ai9RwYdOaeTNkiO7b78uDuIVOcylT16dwcuL2Z5U5+Klp
         /iMGXXZFq0RrQb5oaQ3ygFoeacvzK17tlk9x2P27PCrMTXKzTLoorIj0RShOvmCYtK
         Xe3bsTBsDG6tsvDDhEPeQ2SEInQ3/NsDydI9IX8362TqWRA4jlkrY7oVvMRJJjTkWA
         tdDRkhXAeRf6w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mhoSC-004WRy-LT; Tue, 02 Nov 2021 07:43:32 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: align sizes returned by g_fmt
Date:   Tue,  2 Nov 2021 07:43:31 +0000
Message-Id: <5682e37ff93ec19c0fbc5dd6614d6f57281ea663.1635839008.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Repeat the same round logic used inside s_fmt here, for the sake
of sanity.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 936516daec7d..8df052f6190d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -892,8 +892,8 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 	}
 
 	depth = atomisp_get_pixel_depth(f->fmt.pix.pixelformat);
-	f->fmt.pix.bytesperline = (f->fmt.pix.width * depth) >> 3;
-	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
+	f->fmt.pix.bytesperline = DIV_ROUND_UP(f->fmt.pix.width * depth, 8);
+	f->fmt.pix.sizeimage = PAGE_ALIGN(f->fmt.pix.height * f->fmt.pix.bytesperline);
 
 	/*
 	 * FIXME: do we need to setup this differently, depending on the
-- 
2.31.1

