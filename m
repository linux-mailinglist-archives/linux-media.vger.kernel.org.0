Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3D06AB78A
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 13:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391473AbfIFLzy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 07:55:54 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39124 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391385AbfIFLzx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 07:55:53 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so3371443pgi.6
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 04:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dv10oi4TdbY6GR7F0KvTrO/w4iPoPdTVV/y/o4NNX6o=;
        b=c0lVH9cOm3zHz4NMOBRVGBZoCbDf8i3w3fPDv5bdKxyWiMxaom7gCnLiER203ZATFJ
         aL4zQq8tRMEIY9ub5UVH65YMzfAinCgXvY7e6DW4yszEo7z9k8jCSN9i8i1ZjzEvi5ae
         p9x4crPH7IoNeuVl4uIU0aWCAPlQxyzZDWJ+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dv10oi4TdbY6GR7F0KvTrO/w4iPoPdTVV/y/o4NNX6o=;
        b=pNWOxY/HJvYIZv8rOBu6uun0dLHTCmWo2tnksOodSc3pr+yPyFlS0SaiNxTKhlf96Q
         XIHLU4xmSgGQVbTpJmPAGw2wKyUsDmgi8/yhHy3QC+KbFpcBwS97btK7Wpwt07A6qHNk
         csvRqFaiwDRGXgwaoSgNyrz5oVKf6LYZrMeNaxt0J+GcWM1EislbVqvhbxzLCEY4X8Ma
         SKWeVG7sAl5eNuYdP6m3/bwSDDvv94v2l0E7wUCoz9F6mFmbGKC+UX6dgtdOj7Ahffo2
         AP8mz+xXrye41huofJYq4CMB8VLCLu8g+Ty25ZgAmi0IyDKYs1asWdyh1JTIzMYAgy+9
         5dWA==
X-Gm-Message-State: APjAAAW906z1HgoNZw8n95G26TFvGDQxGcUQ4OkUTN7HTECVMlppsIJD
        q6oF+jfhe/HnBs/1vLfYks/8eg==
X-Google-Smtp-Source: APXvYqyME97NICevcotb4UXynBjruBzW7ohMgRIdClQ531LCsicIQ9luh+MM35ZK2xOCnemHLa0siQ==
X-Received: by 2002:a63:5f09:: with SMTP id t9mr7631568pgb.351.1567770952532;
        Fri, 06 Sep 2019 04:55:52 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id o22sm3667394pjq.21.2019.09.06.04.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 04:55:51 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 08/13] media: add Mediatek's MM21 format
Date:   Fri,  6 Sep 2019 20:55:08 +0900
Message-Id: <20190906115513.159705-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906115513.159705-1-acourbot@chromium.org>
References: <20190906115513.159705-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Mediatek's non-compressed 8 bit block video mode. This format is
produced by the MT8183 codec and can be converted to a non-proprietary
format with the MDP3 component.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 51b912743f0f..666d90a71f41 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1330,6 +1330,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
 	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
 	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
+	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit block format"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 530638dffd93..e0db23e655bf 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -724,6 +724,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
+#define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
-- 
2.23.0.187.g17f5b7556c-goog

