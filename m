Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2A9FD737F
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 12:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730974AbfJOKkt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 06:40:49 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33879 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730937AbfJOKks (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 06:40:48 -0400
Received: by mail-pg1-f195.google.com with SMTP id k20so4536028pgi.1
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 03:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/NI5jAsWoenSw6DcaYONbSjsN7QFysG4vREcdAB5gqA=;
        b=L/Gqz4W6Dk+CQBm8tiNraol/UJ2Zl7f9MKVUhee8vkbpxbOvZ0enWF6T1oN3xZyR3c
         bIdqHtqZveGMXu/VWBRHfKA2COcuCTQO16//ntQL8T4Fl2Hum6Y75SYnh94ZoYnmLety
         OJJhXnQkQtx0YmUh4btMLCJHnDBT/POrsshH/3ywLmMnn3D9J9P19OUjLdPhIwGraeDO
         5JEQo874ayAxGlE4xE2wHC9+GKQsMLZy0kYe+iwSGaW3WEL/fLw3NPTk0vnZ3loU3r3z
         w7xv7hZaGyMydks2XgEvmpOy3La9PmfXb4Tk6hSr4FQlPBSgKQniQPztzsDFx2UeQSvR
         pOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/NI5jAsWoenSw6DcaYONbSjsN7QFysG4vREcdAB5gqA=;
        b=dA+EbDmL0JTbjxURMFmh5MSIimzk6oCQ8RCKfvJZvySoyQojvBOqX0QdOq5k1GWJYK
         dxDp2Yi01TO2uJEG4jnv5jkWrQI7i51cxDZtyz4ZpGOYUZz6AcFWn7bNt5+SKkHb4AY8
         BoCX283JRRxpTY3CTfdBOOazVeV5r3EWQB3ZB0ACYF1Mfbs1VgYQQLfNQo1U/kZ9doaq
         X7zC/gS7OxhkuW97kZDQiEgyNZx+fXMRSfGTCER+vrmf1XRVvaTbaDNUSscE4uU6I80z
         lVDZOHDALmwpWJJRoURAJqPWeNqozOfBd93WhWPaBTavVIxK7Vrso/rmReo4Xu8ImLT0
         cgOQ==
X-Gm-Message-State: APjAAAVMVKYsB3nLycGPbvgnP2CuYWhXz2lKHA1DT+bmqc8Ar6iU5kdt
        WAel9NEaGOuoFa9zFBCPB2TXhH8Z
X-Google-Smtp-Source: APXvYqwEZP1XKqeMKc2LS0az31Iw9EmFqyHDS9gYCsxfPPrQjVK131ENawGea4AaajFl3E8QfrJI7A==
X-Received: by 2002:a63:5448:: with SMTP id e8mr10569230pgm.10.1571136047530;
        Tue, 15 Oct 2019 03:40:47 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.198.230])
        by smtp.gmail.com with ESMTPSA id r18sm15306328pgm.31.2019.10.15.03.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 03:40:47 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v11 2/3] v4l2-core: Add new metadata format
Date:   Tue, 15 Oct 2019 16:10:16 +0530
Message-Id: <20191015104017.13722-3-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015104017.13722-1-bnvandana@gmail.com>
References: <20191008072757.22752-1-bnvandana@gmail.com>
 <20191015104017.13722-1-bnvandana@gmail.com>
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

