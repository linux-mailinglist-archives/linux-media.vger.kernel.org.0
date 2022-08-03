Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4FA58885D
	for <lists+linux-media@lfdr.de>; Wed,  3 Aug 2022 09:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237342AbiHCH6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Aug 2022 03:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231671AbiHCH6J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Aug 2022 03:58:09 -0400
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C73C2A27D
        for <linux-media@vger.kernel.org>; Wed,  3 Aug 2022 00:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1012; q=dns/txt; s=iport;
  t=1659513488; x=1660723088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uTsi0YtiuJEWTjPUw+2nguny/j74yIfn5d+HmlvbUZM=;
  b=bUy7BfHLdau35D4jS/luJR73ikAkwwZkqE2DujGhUuhCDrYeWKIgNlhi
   pRauKc8R6LnOW2QpcmEkR5QYFu0OyuiwdLbMZZ5tBlXjSbhSPt7IKwct2
   gvk2l/u/Dosm0r1QRZXyE3ZwyAAT+qz2z+2hIQ/9kj1rNViIGKQ3md71P
   Y=;
X-IronPort-AV: E=Sophos;i="5.93,213,1654560000"; 
   d="scan'208";a="693810"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 03 Aug 2022 07:58:06 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 2737w5S9024084;
        Wed, 3 Aug 2022 07:58:06 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH v2 1/5] media: videodev2.h: add V4L2_CAP_EDID_MEMORY
Date:   Wed,  3 Aug 2022 09:58:46 +0200
Message-Id: <20220803075850.1196988-2-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803075850.1196988-1-hljunggr@cisco.com>
References: <20220803075850.1196988-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-10.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add capability flag to indicate that the device is an EDID memory device.

Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
---
 include/uapi/linux/videodev2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 343b95107fce..1837e89b350d 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -451,6 +451,7 @@ struct v4l2_capability {
 #define V4L2_CAP_VIDEO_CAPTURE		0x00000001  /* Is a video capture device */
 #define V4L2_CAP_VIDEO_OUTPUT		0x00000002  /* Is a video output device */
 #define V4L2_CAP_VIDEO_OVERLAY		0x00000004  /* Can do video overlay */
+#define V4L2_CAP_EDID_MEMORY		0x00000008  /* Is an EDID memory only device */
 #define V4L2_CAP_VBI_CAPTURE		0x00000010  /* Is a raw VBI capture device */
 #define V4L2_CAP_VBI_OUTPUT		0x00000020  /* Is a raw VBI output device */
 #define V4L2_CAP_SLICED_VBI_CAPTURE	0x00000040  /* Is a sliced VBI capture device */
-- 
2.37.1

