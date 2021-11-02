Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191CF442753
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 07:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhKBG5T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 02:57:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:53642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhKBG5S (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 02:57:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7266560F58;
        Tue,  2 Nov 2021 06:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635836084;
        bh=4Hivgiy714oTIsz9VsX8ACzEnLl+2pVgbQlZi2tljEM=;
        h=From:To:Cc:Subject:Date:From;
        b=YpzQGVlwJA2B2PgR7pBCo+JLvRS3+zUHmpxiWGFQo5bTkvHjetAzfkHylO8mTVmS1
         DKHgFdTs20uZ7Q3u4PnqRARRMuFBpKIlazeEuI05kgiQ//u6rEGvPPjiv0mX5B12Pl
         u5j/2uwRuo2Uz0EKwC3HI71OgaywOC8XpuprojLxdEaFmW0pGHHujeRZKddQBW6fcx
         xzl8lFuW7BKv2u2Fyx5+mdStr44l2w+mAnjsUTY0V6qj1tolpUC+BsBZRtos3mN5X4
         JHZrygrOUDzwKwavlZb5NY6au6I6A6nUfyPB80r/wW/XiC5vcnTgFyVdJUTVlu/f/v
         NYfqpY8eg3weg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mhngw-004TUF-8Z; Tue, 02 Nov 2021 06:54:42 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Baokun Li <libaokun1@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH] media: atomisp: add a default case at __get_frame_info()
Date:   Tue,  2 Nov 2021 06:54:41 +0000
Message-Id: <175426fbef213fe76e3bdd60a64ee03f2a0dd3af.1635836077.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The switch() logic there misses a break and a default case.
That makes it more prone to problems as the code change.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 1309855bb6c8..a8972b231e06 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2691,9 +2691,11 @@ static int __get_frame_info(struct atomisp_sub_device *asd,
 		*info = p_info.output_info[1];
 		dev_dbg(isp->dev, "getting second main frame info.\n");
 		break;
+	default:
 	case ATOMISP_CSS_RAW_FRAME:
 		*info = p_info.raw_output_info;
 		dev_dbg(isp->dev, "getting raw frame info.\n");
+		break;
 	}
 	dev_dbg(isp->dev, "get frame info: w=%d, h=%d, num_invalid_frames %d.\n",
 		info->res.width, info->res.height, p_info.num_invalid_frames);
-- 
2.31.1

