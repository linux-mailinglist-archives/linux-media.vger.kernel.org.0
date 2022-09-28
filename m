Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDDA45EDBA1
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 13:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbiI1LWY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 07:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbiI1LWW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 07:22:22 -0400
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466AADCEA2
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 04:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=857; q=dns/txt; s=iport;
  t=1664364141; x=1665573741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lrzpd5WOwWl7gM6g3AAVbvIN+JM6yWCsWR2pFThbQPA=;
  b=QxAIgtqVMlwHSS0LOm3e4WlRN7R8iM1sR5GphDfIWZAud7fIo4/Tuq47
   uohqXtmJZ1dGaMN0kuUZ0lg4F5sgwUsVN9RLXdasqMxG0aGUZmW+OC5JM
   8PjGQHyOiK0F08OlsBc+e/ERJEzgIn+94d1lJG/WdZ/mXKVI8AdV8QgmW
   w=;
X-IronPort-AV: E=Sophos;i="5.93,352,1654560000"; 
   d="scan'208";a="4146646"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 Sep 2022 11:21:15 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 28SBLFel008487;
        Wed, 28 Sep 2022 11:21:15 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH v3 1/5] media: videodev2.h: add V4L2_CAP_EDID
Date:   Wed, 28 Sep 2022 13:21:43 +0200
Message-Id: <20220928112147.358745-2-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928112147.358745-1-hljunggr@cisco.com>
References: <20220928112147.358745-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-9.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
2.37.3

