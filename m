Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C353459A6
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCWI0W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:26:22 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46009 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229963AbhCWI0P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:26:15 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id OcMcluhb0UzyrOcMflOjn8; Tue, 23 Mar 2021 09:26:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616487974; bh=5NqRUxMY5yKHS+Wm4cbacqDnceHfDCrWRSYIxSM17Fg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=URyAdsQdOmnlzqWJrFQHWvlUXzNGtBJOnIh4OjS3iK2xhN0q5YUSTQPKwY+//4OmH
         wzW7C18VSQHyyaLdOmtngeqRTEgIzgpB6/x8Ti1bF/UqBTMuUOSoiBllmrLDAJspCF
         /zYf0s2+52nnpiOTi4dyHQk+LzbRdOkAUZ3hwOpld38kLq5XsRVncBr70zI1vGxpib
         pLB/GCyksbXUzN79/TGnLogWlaQe57gmAqZR1tX8ExG4yDicoEjJdERVA2MKZYSsum
         FChOmUHCqW9v/+lMhlSHd8xsbd67wAvLJCaFOUsg6G8vTv7xm82O+MuG++GRgVTLDf
         7Mqx9TzU9/tqw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] s3c-camif/camif-core.h: fix kernel-doc warnings
Message-ID: <6d45dc10-0b14-1593-e88d-8e5ac9750586@xs4all.nl>
Date:   Tue, 23 Mar 2021 09:26:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNESF3/cPLaKTHIWNFUHCE+uFdNIoQQSNZRiZDC0vhejas2Pr1N3FAnzfrzBMoLdORCbojFg6jC6vqyAU8FxFGw+tnpLKqreFOFWLxuF7w3Uz/FI/gtZ
 iz48JkH99HoJ3H4Ii8/cXse9ReYwXa/WNvN3Ccf826/FgGzhkMvZWl8rfsq4paKB0GJ2ek2ptMgbPgRo2YYSREITGER2UOf+LZYkL8eFtABO/YpqZyt3Kkt5
 TnfrdpgvcnXU4egGCrS1IXXBZIgQddIic2K+jLxn6DCfVpprdCydavJ77Qemsg7F
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes these warnings:

drivers/media/platform/s3c-camif/camif-core.h:156: warning: Function parameter or member 'pix_limits' not described in 's3c_camif_variant'
drivers/media/platform/s3c-camif/camif-core.h:156: warning: Function parameter or member 'has_img_effect' not described in 's3c_camif_variant'
drivers/media/platform/s3c-camif/camif-core.h:156: warning: Function parameter or member 'vp_offset' not described in 's3c_camif_variant'
drivers/media/platform/s3c-camif/camif-core.h:232: warning: Function parameter or member 'vdev' not described in 'camif_vp'
drivers/media/platform/s3c-camif/camif-core.h:232: warning: Function parameter or member 'vb_queue' not described in 'camif_vp'
drivers/media/platform/s3c-camif/camif-core.h:232: warning: Function parameter or member 'offset' not described in 'camif_vp'
drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'ctrl_test_pattern' not described in 'camif_dev'
drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'ctrl_colorfx' not described in 'camif_dev'
drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'ctrl_colorfx_cbcr' not described in 'camif_dev'
drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'colorfx' not described in 'camif_dev'
drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'colorfx_cb' not described in 'camif_dev'
drivers/media/platform/s3c-camif/camif-core.h:297: warning: Function parameter or member 'colorfx_cr' not described in 'camif_dev'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/s3c-camif/camif-core.h b/drivers/media/platform/s3c-camif/camif-core.h
index f937e638490f..f3442e251bc9 100644
--- a/drivers/media/platform/s3c-camif/camif-core.h
+++ b/drivers/media/platform/s3c-camif/camif-core.h
@@ -144,8 +144,10 @@ struct camif_pix_limits {
 /**
  * struct s3c_camif_variant - CAMIF variant structure
  * @vp_pix_limits:    pixel limits for the codec and preview paths
- * @camif_pix_limits: pixel limits for the camera input interface
+ * @pix_limits:       pixel limits for the camera input interface
  * @ip_revision:      the CAMIF IP revision: 0x20 for s3c244x, 0x32 for s3c6410
+ * @has_img_effect:   supports image effects
+ * @vp_offset:        register offset
  */
 struct s3c_camif_variant {
 	struct vp_pix_limits vp_pix_limits[2];
@@ -183,9 +185,10 @@ struct camif_dev;
  * @irq:	    interrupt number for this data path
  * @camif:	    pointer to the camif structure
  * @pad:	    media pad for the video node
- * @vdev            video device
+ * @vdev:           video device
  * @ctrl_handler:   video node controls handler
  * @owner:	    file handle that own the streaming
+ * @vb_queue:       vb2 buffer queue
  * @pending_buf_q:  pending (empty) buffers queue head
  * @active_buf_q:   active (being written) buffers queue head
  * @active_buffers: counter of buffer set up at the DMA engine
@@ -202,6 +205,7 @@ struct camif_dev;
  * @rotation:	    current image rotation value
  * @hflip:	    apply horizontal flip if set
  * @vflip:	    apply vertical flip if set
+ * @offset:	    register offset
  */
 struct camif_vp {
 	wait_queue_head_t	irq_queue;
@@ -248,7 +252,13 @@ struct camif_vp {
  * @sensor:       image sensor data structure
  * @m_pipeline:	  video entity pipeline description
  * @ctrl_handler: v4l2 control handler (owned by @subdev)
- * @test_pattern: test pattern controls
+ * @ctrl_test_pattern: V4L2_CID_TEST_PATTERN control
+ * @ctrl_colorfx: V4L2_CID_COLORFX control
+ * @ctrl_colorfx_cbcr:  V4L2_CID_COLORFX_CBCR control
+ * @test_pattern: test pattern
+ * @colorfx:	  color effect
+ * @colorfx_cb:   Cb value for V4L2_COLORFX_SET_CBCR
+ * @colorfx_cr:   Cr value for V4L2_COLORFX_SET_CBCR
  * @vp:           video path (DMA) description (codec/preview)
  * @variant:      variant information for this device
  * @dev:	  pointer to the CAMIF device struct
