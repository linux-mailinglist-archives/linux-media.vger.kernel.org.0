Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 377B7113F7C
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 11:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729068AbfLEKgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 05:36:55 -0500
Received: from mx1.emlix.com ([188.40.240.192]:40552 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbfLEKgz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Dec 2019 05:36:55 -0500
X-Greylist: delayed 486 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Dec 2019 05:36:54 EST
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id A514260935;
        Thu,  5 Dec 2019 11:28:46 +0100 (CET)
To:     kyungmin.park@samsung.com, a.hajda@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sebastian Gross <sebastian.gross@emlix.com>
Subject: [PATCH] media: i2c: s5c73m3: Fix number in auto focus cluster
Organization: emlix
Message-ID: <ca1fd4e9-7b90-9c23-3df8-5036996f7a75@emlix.com>
Date:   Thu, 5 Dec 2019 11:31:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As of `s5c73m3.h` the auto focus cluster in `s5c73m3_ctrls` has 5 and not 6
controls.

Signed-off-by: Sebastian Gross <sebastian.gross@emlix.com>
---
  drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c b/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c
index 8911660da86f..71cf68a95bb2 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c
@@ -547,7 +547,7 @@ int s5c73m3_init_controls(struct s5c73m3 *state)
  				V4L2_CTRL_FLAG_UPDATE;
  	v4l2_ctrl_auto_cluster(2, &ctrls->auto_iso, 0, false);
  	ctrls->af_status->flags |= V4L2_CTRL_FLAG_VOLATILE;
-	v4l2_ctrl_cluster(6, &ctrls->focus_auto);
+	v4l2_ctrl_cluster(5, &ctrls->focus_auto);
  
  	state->sensor_sd.ctrl_handler = hdl;
  
-- 
2.24.0
