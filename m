Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE15D16031A
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2020 10:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgBPJSl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Feb 2020 04:18:41 -0500
Received: from gofer.mess.org ([88.97.38.141]:56183 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbgBPJSl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Feb 2020 04:18:41 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A2F45C6383; Sun, 16 Feb 2020 09:18:39 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] Fix build failure on s390x
Date:   Sun, 16 Feb 2020 09:18:39 +0000
Message-Id: <20200216091839.31183-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See: https://bugzilla.redhat.com/show_bug.cgi?id=1800228

/usr/bin/ld: .libs/libdvbv5_la-dvb-fe.o:(.bss+0x8): multiple definition of `delivery_system_name'; .libs/libdvbv5_la-dvb-v5.o:/builddir/build/BUILD/v4l-utils-1.18.0/lib/libdvbv5/dvb-v5.h:29: first defined here
/usr/bin/ld: .libs/libdvbv5_la-dvb-fe.o:(.bss+0xa8): multiple definition of `dvb_v5_name'; .libs/libdvbv5_la-dvb-v5.o:/builddir/build/BUILD/v4l-utils-1.18.0/lib/libdvbv5/dvb-v5.h:28: first defined here
/usr/bin/ld: .libs/libdvbv5_la-dvb-fe.o:(.rodata+0x3ec): multiple definition of `fe_bandwidth_name'; .libs/libdvbv5_la-dvb-v5.o:/builddir/build/BUILD/v4l-utils-1.18.0/lib/libdvbv5/dvb-v5.h:20: first defined here

delivery_system_name etc are being defined both in lib/libdvbv5/dvb-v5.c and
lib/libdvbv5/dvb-v5.h.

Signed-off-by: Sean Young <sean@mess.org>
---
 lib/libdvbv5/gen_dvb_structs.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/libdvbv5/gen_dvb_structs.pl b/lib/libdvbv5/gen_dvb_structs.pl
index 7e1d645c..d15d1fc3 100755
--- a/lib/libdvbv5/gen_dvb_structs.pl
+++ b/lib/libdvbv5/gen_dvb_structs.pl
@@ -419,6 +419,9 @@ sub output_arrays($$$$$)
     }
     printf OUT " %s[%i]", $name, $size;
   } else {
+    if ($decl) {
+      printf OUT "extern ";
+    }
     printf OUT "const %s%s[%i]", $type, $name, $size + 1;
   }
 
-- 
2.24.1

