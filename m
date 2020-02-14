Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 865C815FA88
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 00:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgBNX0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 18:26:50 -0500
Received: from vie01a-dmta-pe02-2.mx.upcmail.net ([62.179.121.158]:42909 "EHLO
        vie01a-dmta-pe02-2.mx.upcmail.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727620AbgBNX0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 18:26:49 -0500
Received: from [172.31.216.235] (helo=vie01a-pemc-psmtp-pe12.mail.upcmail.net)
        by vie01a-dmta-pe02.mx.upcmail.net with esmtp (Exim 4.92)
        (envelope-from <jmccrohan@gmail.com>)
        id 1j2kMA-0006RU-Jy
        for linux-media@vger.kernel.org; Sat, 15 Feb 2020 00:26:46 +0100
Received: from lambda.dereenigne.org ([80.111.203.1])
        by vie01a-pemc-psmtp-pe12.mail.upcmail.net with ESMTP
        id 2kM9jWs4zwlys2kMAjkcZJ; Sat, 15 Feb 2020 00:26:46 +0100
X-Env-Mailfrom: jmccrohan@gmail.com
X-Env-Rcptto: linux-media@vger.kernel.org
X-SourceIP: 80.111.203.1
X-CNFS-Analysis: v=2.3 cv=E5OzWpVl c=1 sm=1 tr=0
 a=fvVEolIEbVZcf0Ui8OJacQ==:117 a=fvVEolIEbVZcf0Ui8OJacQ==:17
 a=xqWC_Br6kY4A:10 a=x7bEGLp0ZPQA:10 a=jIsRohQCbAoA:10 a=l697ptgUJYAA:10
 a=pGLkceISAAAA:8 a=zXBaV5ilAAAA:8 a=vfGikUbcAAAA:8 a=J-Pq5VjxXPGKShaaIsAA:9
 a=IAMIRcQVTcxmHKSHOCwT:22 a=7Y3TZCzBssclSZmI02B1:22
Received: from [::1] (helo=lambda.dereenigne.org)
        by lambda.dereenigne.org with esmtp (Exim 4.93)
        (envelope-from <jmccrohan@gmail.com>)
        id 1j2kM9-001a4d-Dt; Fri, 14 Feb 2020 23:26:45 +0000
From:   Jonathan McCrohan <jmccrohan@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Jonathan McCrohan <jmccrohan@gmail.com>
Subject: [PATCH] Update dvb-t scan files for Ireland (ie-*)
Date:   Fri, 14 Feb 2020 23:26:20 +0000
Message-Id: <20200214232620.376619-1-jmccrohan@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLpe68UVfa+3IPzwVdHcJ2m6qwxILBRG48XfyP+jjvVjTZW0cipnXEAnvk3osSwuAFdLUKj7XDoSXH/+MIKeD3ki2AMLnnOZ8xr2ORR/81wRSpN+esBo
 +M4gu4WHe50SjV7VnC8CTPHUkT/fSBW8Ra6cjjR9ubZ8cbFqeZ//HPYsWC8YsQs+C+YxLPDlqufOxv/8tT3uMi+Wv7pbKPadaxwvf1jnTE72rypztQwD0PyL
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Frequency changes as a result of 700Mhz migration.

Signed-off-by: Jonathan McCrohan <jmccrohan@gmail.com>
---
 dvb-t/ie-CairnHill     |  2 +-
 dvb-t/ie-ClermontCarn  | 10 +++++-----
 dvb-t/ie-Dungarvan     |  2 +-
 dvb-t/ie-HolywellHill  | 10 +++++-----
 dvb-t/ie-Kippure       | 10 +++++-----
 dvb-t/ie-Maghera       |  6 +++---
 dvb-t/ie-MountLeinster |  2 +-
 dvb-t/ie-Mullaghanish  |  2 +-
 dvb-t/ie-SpurHill      |  6 +++---
 dvb-t/ie-ThreeRock     |  2 +-
 dvb-t/ie-Truskmore     | 10 +++++-----
 dvb-t/ie-WoodcockHill  |  2 +-
 12 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/dvb-t/ie-CairnHill b/dvb-t/ie-CairnHill
index d3a5dc5..928436f 100644
--- a/dvb-t/ie-CairnHill
+++ b/dvb-t/ie-CairnHill
@@ -1,5 +1,5 @@
 # Ireland, Cairn Hill
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
 [CH47: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 682000000
diff --git a/dvb-t/ie-ClermontCarn b/dvb-t/ie-ClermontCarn
index 81f17d2..1e98938 100644
--- a/dvb-t/ie-ClermontCarn
+++ b/dvb-t/ie-ClermontCarn
@@ -1,8 +1,8 @@
 # Ireland, Clermont Carn
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
-[CH52: Saorview MUX1]
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
+[CH42: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 722000000
+	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
@@ -12,9 +12,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[CH56: Saorview MUX2]
+[CH45: Saorview MUX2]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 754000000
+	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
diff --git a/dvb-t/ie-Dungarvan b/dvb-t/ie-Dungarvan
index 1c2ccd8..1cc129a 100644
--- a/dvb-t/ie-Dungarvan
+++ b/dvb-t/ie-Dungarvan
@@ -1,5 +1,5 @@
 # Ireland, Dungarvan
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
 [CH55: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 746000000
diff --git a/dvb-t/ie-HolywellHill b/dvb-t/ie-HolywellHill
index 5bb2c58..dae9326 100644
--- a/dvb-t/ie-HolywellHill
+++ b/dvb-t/ie-HolywellHill
@@ -1,8 +1,8 @@
 # Ireland, Holywell Hill
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
-[CH30: Saorview MUX1]
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
+[CH22: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
@@ -12,9 +12,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[CH33: Saorview MUX2]
+[CH25: Saorview MUX2]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 570000000
+	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
diff --git a/dvb-t/ie-Kippure b/dvb-t/ie-Kippure
index 8a7a3be..e283d23 100644
--- a/dvb-t/ie-Kippure
+++ b/dvb-t/ie-Kippure
@@ -1,8 +1,8 @@
 # Ireland, Kippure
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
-[CH54: Saorview MUX1]
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
+[CH34: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 738000000
+	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
@@ -12,9 +12,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[CH58: Saorview MUX2]
+[CH35: Saorview MUX2]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 770000000
+	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
diff --git a/dvb-t/ie-Maghera b/dvb-t/ie-Maghera
index e87acd9..f88e642 100644
--- a/dvb-t/ie-Maghera
+++ b/dvb-t/ie-Maghera
@@ -1,5 +1,5 @@
 # Ireland, Maghera
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
 [CH48: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 690000000
@@ -12,9 +12,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[CH55: Saorview MUX2]
+[CH46: Saorview MUX2]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 746000000
+	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
diff --git a/dvb-t/ie-MountLeinster b/dvb-t/ie-MountLeinster
index 60430a2..17e9ce0 100644
--- a/dvb-t/ie-MountLeinster
+++ b/dvb-t/ie-MountLeinster
@@ -1,5 +1,5 @@
 # Ireland, Mount Leinster
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
 [CH23: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 490000000
diff --git a/dvb-t/ie-Mullaghanish b/dvb-t/ie-Mullaghanish
index 9eb7ceb..d815c3c 100644
--- a/dvb-t/ie-Mullaghanish
+++ b/dvb-t/ie-Mullaghanish
@@ -1,5 +1,5 @@
 # Ireland, Mullaghanish
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
 [CH21: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 474000000
diff --git a/dvb-t/ie-SpurHill b/dvb-t/ie-SpurHill
index 96782fe..7d152f3 100644
--- a/dvb-t/ie-SpurHill
+++ b/dvb-t/ie-SpurHill
@@ -1,5 +1,5 @@
 # Ireland, Spur Hill
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
 [CH45: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 666000000
@@ -12,9 +12,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[CH49: Saorview MUX2]
+[CH39: Saorview MUX2]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 698000000
+	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
diff --git a/dvb-t/ie-ThreeRock b/dvb-t/ie-ThreeRock
index 7df648e..210fdd8 100644
--- a/dvb-t/ie-ThreeRock
+++ b/dvb-t/ie-ThreeRock
@@ -1,5 +1,5 @@
 # Ireland, Three Rock
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
 [CH30: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 546000000
diff --git a/dvb-t/ie-Truskmore b/dvb-t/ie-Truskmore
index 838429c..5dfef70 100644
--- a/dvb-t/ie-Truskmore
+++ b/dvb-t/ie-Truskmore
@@ -1,8 +1,8 @@
 # Ireland, Truskmore
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
-[CH53: Saorview MUX1]
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
+[CH42: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 730000000
+	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
@@ -12,9 +12,9 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[CH57: Saorview MUX2]
+[CH45: Saorview MUX2]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = 3/4
 	CODE_RATE_LP = NONE
diff --git a/dvb-t/ie-WoodcockHill b/dvb-t/ie-WoodcockHill
index 065e6fc..698e781 100644
--- a/dvb-t/ie-WoodcockHill
+++ b/dvb-t/ie-WoodcockHill
@@ -1,5 +1,5 @@
 # Ireland, Woodcock Hill
-# Generated from http://www.comreg.ie/_fileupload/Broadcast_Technical_Parameters.xlsx
+# Generated from https://www.2rn.ie/wp-content/uploads/2019/09/2RN-DTT-Television-Transmission-Network-Sept-2019-Rev.1.2.pdf
 [CH47: Saorview MUX1]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 682000000
-- 
2.24.1

