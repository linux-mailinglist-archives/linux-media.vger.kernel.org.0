Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1B36CB9ED
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 14:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbfJDMIu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 08:08:50 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41505 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729468AbfJDMIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 08:08:50 -0400
Received: by mail-pf1-f196.google.com with SMTP id q7so3776693pfh.8
        for <linux-media@vger.kernel.org>; Fri, 04 Oct 2019 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/NI5jAsWoenSw6DcaYONbSjsN7QFysG4vREcdAB5gqA=;
        b=S+G2WxDfEm3kXUXF20pDUPhyJ8KRS48b3dwDmgR9ZWdhHxedsvfmBX6k/1iqQrDGtc
         MFFXYSXNesEicmOyUP8XxM+gh12LskaPxwK2dW8NmtT7xZEaiuHhf42AkVgM+1m8xzF9
         mdS8gMAUqTdjWjOdHJ38ZQ4keR/PIOrqhNOBjBIBlHmHoWmloYI8FBprJJRX1dMy/Jxy
         Tr0kh1e4zhthPKdUMEAfQ9hbMqNe2kd8zqj6sTLUe9IpiRRXou3tZZY+pWglsX0BDxkl
         dDEq0OiZSPhPwuTERh8hepygk2jGayxKAX9wXaL896w8aSVW/1CaTLwfnOcAbq7RtDpL
         T+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/NI5jAsWoenSw6DcaYONbSjsN7QFysG4vREcdAB5gqA=;
        b=D6wSXHownLDVi4tstxokmfXy24bSFeKjPQiiq7fyTp32i+YhlDknS4SEHhwx4hPBVc
         rTU4Dg7PBe32RmrgMNBOzmRoDKfLVOAu5NcY0CBoKMtWnwAX7WPs+jfYXwPogIzxB32g
         6Ty/o8EAdhg00GDY93lEoNWwKrKImd8iZrDJUtyKvCl/tyofTqMe6GWHSYz1UOtSqHgf
         9KM4YwHNWHZsh6UmUsz/tptw35HFYSDM5IDB5bUtk/B3edk8yyMkvJsh+kcB5Db9K4RE
         yhf8NToR81CogXyGTvdBvl9oMnhAo+SmwHRU7sfafvdpjQt32PXFAuHUm3xe+bY7qeCq
         CpFg==
X-Gm-Message-State: APjAAAX6TzNkgFhw66bWT1tZcud0ZK5X7TK/G0KSrDnTMGAMk1bgsEJt
        I7D0loZ0tANQJiBKQp5Yri9Z31Cj
X-Google-Smtp-Source: APXvYqyxa6OGFE8VzVHQ77T2yYPIugvu9FCm73Tbqi+gpwG1kunpD7ISOoMqNGtdaSn5j4U8ymPpjQ==
X-Received: by 2002:a63:7153:: with SMTP id b19mr14864148pgn.10.1570190929571;
        Fri, 04 Oct 2019 05:08:49 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.195.107])
        by smtp.gmail.com with ESMTPSA id e184sm8162435pfa.87.2019.10.04.05.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 05:08:49 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v3 1/2] v4l2-core: Add new metadata format
Date:   Fri,  4 Oct 2019 17:38:36 +0530
Message-Id: <20191004120837.31614-2-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004120837.31614-1-bnvandana@gmail.com>
References: <787ff1cb-dde3-800a-9dde-68f1db5e4897@xs4all.nl>
 <20191004120837.31614-1-bnvandana@gmail.com>
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

