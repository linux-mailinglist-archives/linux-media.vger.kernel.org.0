Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93F71ECA08
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgFCHCA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:02:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:43408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgFCHBH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:07 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D72A20872;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=5+spvHFVv9/Zby40LDALwvi1QN6xquc/OnWOGsCbRRg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ex6liaXDWT0dsrR9Mht02ZWbAGkEwQhVriWidZ+IntRTb3MbIyFAy0FpnK6x/LZtG
         Zi/XKYU4z+8FgO3eHqbFmjrR8e+sEn0h9IeHffIhRBAtcYTSCABN24vTPKvB+CI4w6
         xBGZB6UVGyz+8vuM/4IJbO6Tb+9QYeN1sX5ERvZM=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j8z-NE; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/15] media: atomisp: set DFS to MAX if sensor doesn't report fps
Date:   Wed,  3 Jun 2020 09:00:59 +0200
Message-Id: <79b4062a8efa176ffa0f1f898cf8de64807173ac.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the sensor doesn't implement support for g_frame_interval,
it won't return the expected fps rate.

Instead of keeping DFS on its minimal value (which will likely
not work), set it to the max.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6c324815c0f6..845fa851029a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -243,8 +243,12 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 	}
 
 	fps = atomisp_get_sensor_fps(asd);
-	if (fps == 0)
-		return -EINVAL;
+	if (fps == 0) {
+		dev_info(isp->dev,
+			 "Sensor didn't report FPS. Using DFS max mode.\n");
+		new_freq = dfs->highest_freq;
+		goto done;
+	}
 
 	curr_rules.width = asd->fmt[asd->capture_pad].fmt.width;
 	curr_rules.height = asd->fmt[asd->capture_pad].fmt.height;
-- 
2.26.2

