Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20B6AC9CDC
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 13:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbfJCLJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 07:09:14 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42347 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729589AbfJCLJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 07:09:13 -0400
Received: by mail-pg1-f193.google.com with SMTP id z12so1545561pgp.9
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 04:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/NI5jAsWoenSw6DcaYONbSjsN7QFysG4vREcdAB5gqA=;
        b=FNyvbygC5VW7JGq48Dk45mfjHKKj32L8NnABu3Q8TyYZQWoOAqFEkxj8a5FIrT5B/h
         bVrcd1Aa5q809VQBrGKaRrykTwHT76NnugNZbQ8oiQXXOhkko2N7/NZgrG+XBh0V0eEo
         Un5G60vJEvhqLCCL0jOtmvy6dLginDovDL1kloAgo+v1ub/L9zRTlD6GD00f0lpbQsOe
         3HEh9EnAiiG3XWWgUtPsU0/j1NLMscuMQe5X98+yeN6yLgvpdHk+Ba54hnJmS8HtVElg
         aqIpiJWPGXDkwasWgTzeYyPOZlFtIFBWRKLxxBJycEcEmxmcfN1B2qDa79k2fOBu2cTf
         wLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/NI5jAsWoenSw6DcaYONbSjsN7QFysG4vREcdAB5gqA=;
        b=PTKCM7XXdW7RBTZi1xPGSsYo2+XWfauRErlH71BBkGNg95CzOxqMGgvlyP6YHzsCS9
         Iwu35TkHgVOFRxfLKC3YnOSt9zcBKhnHFINMNjj4I6KECtxndp+YYLGHa5Cbm16cb1T2
         v7AgsTKVCAEsTeq+h9lNrY2lrxrQQegR2tCd4xP5NbAZpHJ07klBCVZv0/+CkQVy0DAA
         9pXr9XZ3OUsMkrsUTzuUdbggjlrQm2fF9EM51pvgI0R3/Wpg/JPVVGefy2RWc9Lmlk4P
         KLZdimhb+WyKNhWcMZJxod9mSVdrEcOykpvhjaRIErF+yxGPazMgNvIIea7zIDF/MwRW
         Nopg==
X-Gm-Message-State: APjAAAVyGe9tRl0SiGD9cvMsLw3YHlXfkK+eP/KhWk0WK60VnDoWwU/V
        WA8P/WA+UHQbwtAShrT7Nr1g+PJJ
X-Google-Smtp-Source: APXvYqxTdifAoAE9IQwQxJAH+vDH6R9IeTF62tKC9H/fMesYr/CHJlUzEvVd/p9BiA9NFG3SUdwi6g==
X-Received: by 2002:a63:fc55:: with SMTP id r21mr8719183pgk.432.1570100951176;
        Thu, 03 Oct 2019 04:09:11 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.207.214])
        by smtp.gmail.com with ESMTPSA id i16sm3169060pfa.184.2019.10.03.04.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 04:09:10 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v2 1/2] v4l2-core: Add new metadata format
Date:   Thu,  3 Oct 2019 16:38:57 +0530
Message-Id: <20191003110858.7120-2-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003110858.7120-1-bnvandana@gmail.com>
References: <9439560a-dbc7-9aeb-a27b-314ace85dc81@xs4all.nl>
 <20191003110858.7120-1-bnvandana@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new metadata format to support metadata output in vivid.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 20b3107dd4e8..2753073cf340 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1340,6 +1340,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
 	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
 	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
+	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 530638dffd93..a82181e27c5a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -755,6 +755,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
 #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
+#define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
 
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
-- 
2.17.1

