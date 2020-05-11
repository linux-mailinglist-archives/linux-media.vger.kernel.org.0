Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C121CCF1E
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 03:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgEKBZx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 May 2020 21:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727789AbgEKBZw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 May 2020 21:25:52 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0E5C061A0E
        for <linux-media@vger.kernel.org>; Sun, 10 May 2020 18:25:52 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id k19so3242567pll.9
        for <linux-media@vger.kernel.org>; Sun, 10 May 2020 18:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aSYsvPNtmzRvpPUvQgJbBEd3TsrxkeW0SIef6rMzOLI=;
        b=GdVJVUAP7SzKlW7icsnQuJUQqLYLe6L3dYz5UlI1aBiFiMZX89KynLj+NdG3/3/L5F
         1t30NCxUZl0l+jbW6MqAyB3LwFm82IOEcsBzZONdAGcDrRQG3bSTKAmG5H8IrWEu+hhy
         LUNiZE9mbhlQUrx0ySWpPChC1QpxBTaXAXP8yqqonm0A2+6lSBiyDl/YYx2vjE4sfuJu
         h78yfPDo+Qw4Ndq4MEoeTNthUWlJ68BsNYYEwNECLGj5sh9G/tsxUk5BeVGh+VcN7PkO
         bWKk7FIEvwAi4xHNlRFiPzV9zsTzzM+2DLSL48ToxybpVXTiJdNSUMuJE7CTvT1TOiqw
         xrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aSYsvPNtmzRvpPUvQgJbBEd3TsrxkeW0SIef6rMzOLI=;
        b=qnrBHzJGkGv676xB6u84c2R18Y3Y8vFA+icmOonZaIK3JW3CKHuEAWYP64cVuQeo2P
         cZni4BPjfL6bdbI4PWmEKkOLG7l24J6HvbISKRDiTvzP4LXbswXuQVnQrZyk248PHhsj
         mgmpaU0PruiUy/3sjxDBzxAfBZ15VSP/r5UWMskl2p93BroScmPemw7usZAOoRp3rVDg
         UyYh/3Zn/3Oyt+QmEs/arU30cQ+2xjjjz3xOrv2RPw8+bEMaGvxF60bZQ4fuBgE20tS1
         sXGBssBoIFm7PQWauTh67uc5mlV2GmwTwhvMyzIKasHyMupUO4M++5192/cH9ZMu36dS
         pQGQ==
X-Gm-Message-State: AGi0Puan8eqGuTpwSAhDaSd/nbx//UZXWumd1DiUcgLzZQQdZaG7FFcy
        SyABbXucIc17hozcOU5rC9o+shiiHpM=
X-Google-Smtp-Source: APiQypLqKFRBvpjaPO1VHT/3gN1JVTn34TpRgYQev5w3F73ZABreFZMxZnhGWC9VSSPrH8u5BtQWDw==
X-Received: by 2002:a17:902:9f8a:: with SMTP id g10mr12925903plq.233.1589160352001;
        Sun, 10 May 2020 18:25:52 -0700 (PDT)
Received: from mangix-trapnet.lan (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id l1sm4630674pgj.48.2020.05.10.18.25.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 18:25:51 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/3] utils: switch strstr to std variant
Date:   Sun, 10 May 2020 18:25:48 -0700
Message-Id: <20200511012549.1145814-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511012549.1145814-1-rosenp@gmail.com>
References: <20200511012549.1145814-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

strstr has const overloads in std, avoiding pointless conversions.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/libcecutil/cec-log.cpp       | 2 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 4 ++--
 utils/v4l2-ctl/v4l2-ctl-misc.cpp   | 6 +++---
 utils/v4l2-dbg/v4l2-dbg.cpp        | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cpp
index 9410c071..0dcb4675 100644
--- a/utils/libcecutil/cec-log.cpp
+++ b/utils/libcecutil/cec-log.cpp
@@ -62,7 +62,7 @@ static void log_arg(const struct cec_arg *arg, const char *arg_name, __u32 val)
 		}
 		return;
 	case CEC_ARG_TYPE_U16:
-		if (strstr(arg_name, "phys-addr"))
+		if (std::strstr(arg_name, "phys-addr"))
 			printf("\t%s: %x.%x.%x.%x\n", arg_name, cec_phys_addr_exp(val));
 		else
 			printf("\t%s: %u (0x%04x)\n", arg_name, val, val);
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 47f5da1a..0640a521 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -1190,13 +1190,13 @@ void common_get(cv4l_fd &_fd)
 				char *q;
 
 				buf[len] = 0;
-				while ((q = strstr(p, "START STATUS"))) {
+				while ((q = std::strstr(p, "START STATUS"))) {
 					p = q + 1;
 				}
 				if (p) {
 					while (p > buf && *p != '<') p--;
 					q = p;
-					while ((q = strstr(q, "<6>"))) {
+					while ((q = std::strstr(q, "<6>"))) {
 						memcpy(q, "   ", 3);
 					}
 					printf("%s", p);
diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
index 6db87568..deb481b4 100644
--- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
@@ -212,11 +212,11 @@ void misc_cmd(int ch, char *optarg)
 				jpegcomp.quality = strtol(value, 0L, 0);
 				break;
 			case 17:
-				if (strstr(value, "dht"))
+				if (std::strstr(value, "dht"))
 					jpegcomp.jpeg_markers |= V4L2_JPEG_MARKER_DHT;
-				if (strstr(value, "dqt"))
+				if (std::strstr(value, "dqt"))
 					jpegcomp.jpeg_markers |= V4L2_JPEG_MARKER_DQT;
-				if (strstr(value, "dri"))
+				if (std::strstr(value, "dri"))
 					jpegcomp.jpeg_markers |= V4L2_JPEG_MARKER_DRI;
 				break;
 			case 18:
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index 86266376..06301ae0 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -784,14 +784,14 @@ list_done:
 				char *q;
 
 				buf[len] = 0;
-				while ((q = strstr(p, "START STATUS"))) {
+				while ((q = std::strstr(p, "START STATUS"))) {
 					found_status = true;
 					p = q + 1;
 				}
 				if (found_status) {
 					while (p > buf && *p != '<') p--;
 					q = p;
-					while ((q = strstr(q, "<6>"))) {
+					while ((q = std::strstr(q, "<6>"))) {
 						memcpy(q, "   ", 3);
 					}
 					printf("%s", p);
-- 
2.26.2

