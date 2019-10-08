Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D9ACF3B7
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 09:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730327AbfJHH2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 03:28:20 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40010 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbfJHH2T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 03:28:19 -0400
Received: by mail-pf1-f196.google.com with SMTP id x127so10274146pfb.7
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 00:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/NI5jAsWoenSw6DcaYONbSjsN7QFysG4vREcdAB5gqA=;
        b=oQA5kBQ3fTu/33mrffZpUh6YMweNhxJu59ttW5NMiRB8cA+rSsvMMDSS93oOvqLodR
         L9NuH3F4qft0v6ddAtWJVoQmQVarhxgJRXOfqTBIA79ofpLAjWZSuDTELT3pO/mG7zpv
         UBu8mfmsBCTXCafP+HJV47pYObKWjCHITmARspJj8K5zn+E6dXYvrla2lVx8Yl3/XWgK
         54U1o3UimQ8rUPQwZTFnCwGBaPMNFpipTztepe8R+1Ml2SbznDqYMcBuSjaSXUlklV0J
         IKc2FFQgvx68QL8BGxNDwkeCIFv3SKdgvIDdwiZYN1jz9+NUY2CrU75r64lfCHBR3Aad
         9eFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/NI5jAsWoenSw6DcaYONbSjsN7QFysG4vREcdAB5gqA=;
        b=KN0dZgRg4Lpqqe8kys2IEJlCwenEp+wqY+giIOkn23S0D72euywSiEkBvrJUGhMvhj
         NbhYdrLLU89/4CgAgeyUISby3wSC9c9B7R0QDjlPDDPrHeUfSfUDlxGJW2Qs7EQHLwTB
         YZMy6X5R51nQZEltcgHL0SBPep21Wv/NtR1zz/j6fRb+MVv+T8FsZujDVON7V+38/C4S
         dsGHl9ZQ/aLY4hFhuu6yGzg45Pdy0gulg2TIQnD7EMJkM21H7PUCyZYkB91BeoOvuwnk
         DQsQW7IVlX//ZWROIc61swENt51P8sPt5nuWTFCQJc3ur+0Sdiw/2nXsmcr3PVFEkSUv
         JYGw==
X-Gm-Message-State: APjAAAWu+1H1ufLg92N7iU3mxjMMhZwB83R6ucQFWygW/rcUWk0tArQm
        NSNaVq653geAcpPu3+Nh3/a6qzLP
X-Google-Smtp-Source: APXvYqzmtbZ2AUhd5LrLr/VNyD3yUYqij+bdsE7+VJDc1G3tnUbaqCae7w1OA2UQNY0f4NplxhU/EA==
X-Received: by 2002:a63:5058:: with SMTP id q24mr34599492pgl.24.1570519697336;
        Tue, 08 Oct 2019 00:28:17 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.202.140])
        by smtp.gmail.com with ESMTPSA id w14sm29663090pge.56.2019.10.08.00.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 00:28:16 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v10 2/3] v4l2-core: Add new metadata format
Date:   Tue,  8 Oct 2019 12:57:56 +0530
Message-Id: <20191008072757.22752-3-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008072757.22752-1-bnvandana@gmail.com>
References: <96d53360-5520-f253-db8e-995bf5920746@xs4all.nl>
 <20191008072757.22752-1-bnvandana@gmail.com>
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

