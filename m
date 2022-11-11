Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18CA3625B2C
	for <lists+linux-media@lfdr.de>; Fri, 11 Nov 2022 14:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbiKKNaC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Nov 2022 08:30:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233320AbiKKNaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Nov 2022 08:30:01 -0500
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDE65E9E9
        for <linux-media@vger.kernel.org>; Fri, 11 Nov 2022 05:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=857; q=dns/txt; s=iport;
  t=1668173400; x=1669383000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l61nc6jTSve+abgAe6wJ5HU8sDPRl07m3i6nXaXSrnM=;
  b=IHj8dO1CvDNcNWO9QrsESY38hZkRTaKLOL+TdRf16ipgRQLxmKtE4qzB
   khUrFpbGPLN5jI56SZklm5s6Q9m56dVcGkHlhl0Ao/6Rvkewoz4Li5CZS
   KSuSiFGjTERCZjoemSCII/8mzu+pPGLmyBmJJItrUl7mOR3dWejspYTFV
   w=;
X-IronPort-AV: E=Sophos;i="5.96,156,1665446400"; 
   d="scan'208";a="4893679"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 11 Nov 2022 13:28:54 +0000
Received: from office-260.rd.cisco.com ([10.47.79.110])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 2ABDSsVO020236;
        Fri, 11 Nov 2022 13:28:54 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH v4 1/5] media: videodev2.h: add V4L2_CAP_EDID
Date:   Fri, 11 Nov 2022 14:29:02 +0100
Message-Id: <20221111132906.2212662-2-hljunggr@cisco.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221111132906.2212662-1-hljunggr@cisco.com>
References: <20221111132906.2212662-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.79.110, [10.47.79.110]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_PASS,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add capability flag to indicate that the device is an EDID-only device.

Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
---
 include/uapi/linux/videodev2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 054fc8bbdb22..2ea95639f441 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -480,6 +480,7 @@ struct v4l2_capability {
 #define V4L2_CAP_META_CAPTURE		0x00800000  /* Is a metadata capture device */
 
 #define V4L2_CAP_READWRITE              0x01000000  /* read/write systemcalls */
+#define V4L2_CAP_EDID			0x02000000  /* Is an EDID-only device */
 #define V4L2_CAP_STREAMING              0x04000000  /* streaming I/O ioctls */
 #define V4L2_CAP_META_OUTPUT		0x08000000  /* Is a metadata output device */
 
-- 
2.38.0

