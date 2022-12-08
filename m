Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E957646A31
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 09:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiLHIMN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 03:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiLHIMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 03:12:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FFA5657D
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 00:12:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EA1E3B81CB2
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 08:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D66CC433D6;
        Thu,  8 Dec 2022 08:12:02 +0000 (UTC)
Message-ID: <bc6c24ec-72ea-64a1-9061-311cc7339827@xs4all.nl>
Date:   Thu, 8 Dec 2022 09:12:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] atomisp: use vb2_start_streaming_called()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't touch q->start_streaming_called directly, use the
vb2_start_streaming_called() function instead.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index cb01ba65c88f..4f35e8f8250a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -636,10 +636,10 @@ static int atomisp_enum_input(struct file *file, void *fh,
 static unsigned int
 atomisp_subdev_streaming_count(struct atomisp_sub_device *asd)
 {
-	return asd->video_out_preview.vb_queue.start_streaming_called
-	       + asd->video_out_capture.vb_queue.start_streaming_called
-	       + asd->video_out_video_capture.vb_queue.start_streaming_called
-	       + asd->video_out_vf.vb_queue.start_streaming_called;
+	return vb2_start_streaming_called(&asd->video_out_preview.vb_queue) +
+	       vb2_start_streaming_called(&asd->video_out_capture.vb_queue) +
+	       vb2_start_streaming_called(&asd->video_out_video_capture.vb_queue) +
+	       vb2_start_streaming_called(&asd->video_out_vf.vb_queue);
 }

 unsigned int atomisp_streaming_count(struct atomisp_device *isp)
-- 
2.35.1

