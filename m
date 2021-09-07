Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE604022E2
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 06:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233130AbhIGElh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 00:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233071AbhIGEla (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Sep 2021 00:41:30 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5224FC061575;
        Mon,  6 Sep 2021 21:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=zQBa6rh27PGE3wkubOhbLzF3Gt/qmyP7Pg4wfjAggnQ=; b=JOzPiwD1+jsYJR3wixQfVIRdL6
        S8kz1iSEIdnyt83hIPtmiEoP4sSVJrZgr753CuYPgZCUbXPpepwfGdhz18SAJD58TcUd98rhICj7N
        jNZ7biMI0A8NtSGKaqNRSlwijifDVDp4X5aZCaC4ZadOeu1brw4ytAEhosoYoOdU8nKh7xg6VF4Vx
        W0UqMTFO/OqmVKeTzzYDLKtASSBFmpGT/WCwWpYlE5ETdkO3ljuN6F+G92iT2eLrOiqeIzgQTgIBB
        yHm/354NWba2B3QztIY+5p3s2z0/4FNo7eMHww/CSpniLeBIA/jmpQyPB9KZWGRaLzWY4HjL9MBeu
        XQbVkzcQ==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mNSuF-002Rre-Gd; Tue, 07 Sep 2021 04:40:23 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: s5p-jpeg: rename JPEG marker constants to prevent build warnings
Date:   Mon,  6 Sep 2021 21:40:22 -0700
Message-Id: <20210907044022.30602-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The use of a macro named 'RST' conflicts with one of the same name
in arch/mips/include/asm/mach-rc32434/rb.h. This causes build
warnings on some MIPS builds.

Change the names of the JPEG marker constants to be in their own
namespace to fix these build warnings and to prevent other similar
problems in the future.

Fixes these build warnings:

In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c:14:
../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
   43 | #define RST                             0xd0
      | 
../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
   13 | #define RST             (1 << 15)

In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-s5p.c:13:
../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
   43 | #define RST                             0xd0
../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
   13 | #define RST             (1 << 15)

In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos4.c:12:
../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
   43 | #define RST                             0xd0
../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
   13 | #define RST             (1 << 15)

In file included from ../drivers/media/platform/s5p-jpeg/jpeg-core.c:31:
../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
   43 | #define RST                             0xd0
../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
   13 | #define RST             (1 << 15)

Also update the kernel-doc so that the word "marker" is not
repeated.

Fixes: bb677f3ac434 ("[media] Exynos4 JPEG codec v4l2 driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
---
v2: change all JPEG marker macros to be in their own namespace (as
    suggested by Mauro)

 drivers/media/platform/s5p-jpeg/jpeg-core.c |   18 +++++------
 drivers/media/platform/s5p-jpeg/jpeg-core.h |   28 +++++++++---------
 2 files changed, 23 insertions(+), 23 deletions(-)

--- linux-next-20210906.orig/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ linux-next-20210906/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -1140,8 +1140,8 @@ static bool s5p_jpeg_parse_hdr(struct s5
 			continue;
 		length = 0;
 		switch (c) {
-		/* SOF0: baseline JPEG */
-		case SOF0:
+		/* JPEG_MARKER_SOF0: baseline JPEG */
+		case JPEG_MARKER_SOF0:
 			if (get_word_be(&jpeg_buffer, &word))
 				break;
 			length = (long)word - 2;
@@ -1172,7 +1172,7 @@ static bool s5p_jpeg_parse_hdr(struct s5
 			notfound = 0;
 			break;
 
-		case DQT:
+		case JPEG_MARKER_DQT:
 			if (get_word_be(&jpeg_buffer, &word))
 				break;
 			length = (long)word - 2;
@@ -1185,7 +1185,7 @@ static bool s5p_jpeg_parse_hdr(struct s5
 			skip(&jpeg_buffer, length);
 			break;
 
-		case DHT:
+		case JPEG_MARKER_DHT:
 			if (get_word_be(&jpeg_buffer, &word))
 				break;
 			length = (long)word - 2;
@@ -1198,15 +1198,15 @@ static bool s5p_jpeg_parse_hdr(struct s5
 			skip(&jpeg_buffer, length);
 			break;
 
-		case SOS:
+		case JPEG_MARKER_SOS:
 			sos = jpeg_buffer.curr - 2; /* 0xffda */
 			break;
 
 		/* skip payload-less markers */
-		case RST ... RST + 7:
-		case SOI:
-		case EOI:
-		case TEM:
+		case JPEG_MARKER_RST ... JPEG_MARKER_RST + 7:
+		case JPEG_MARKER_SOI:
+		case JPEG_MARKER_EOI:
+		case JPEG_MARKER_TEM:
 			break;
 
 		/* skip uninteresting payload markers */
--- linux-next-20210906.orig/drivers/media/platform/s5p-jpeg/jpeg-core.h
+++ linux-next-20210906/drivers/media/platform/s5p-jpeg/jpeg-core.h
@@ -37,15 +37,15 @@
 #define EXYNOS3250_IRQ_TIMEOUT		0x10000000
 
 /* a selection of JPEG markers */
-#define TEM				0x01
-#define SOF0				0xc0
-#define DHT				0xc4
-#define RST				0xd0
-#define SOI				0xd8
-#define EOI				0xd9
-#define	SOS				0xda
-#define DQT				0xdb
-#define DHP				0xde
+#define JPEG_MARKER_TEM				0x01
+#define JPEG_MARKER_SOF0				0xc0
+#define JPEG_MARKER_DHT				0xc4
+#define JPEG_MARKER_RST				0xd0
+#define JPEG_MARKER_SOI				0xd8
+#define JPEG_MARKER_EOI				0xd9
+#define	JPEG_MARKER_SOS				0xda
+#define JPEG_MARKER_DQT				0xdb
+#define JPEG_MARKER_DHP				0xde
 
 /* Flags that indicate a format can be used for capture/output */
 #define SJPEG_FMT_FLAG_ENC_CAPTURE	(1 << 0)
@@ -187,11 +187,11 @@ struct s5p_jpeg_marker {
  * @fmt:	driver-specific format of this queue
  * @w:		image width
  * @h:		image height
- * @sos:	SOS marker's position relative to the buffer beginning
- * @dht:	DHT markers' positions relative to the buffer beginning
- * @dqt:	DQT markers' positions relative to the buffer beginning
- * @sof:	SOF0 marker's position relative to the buffer beginning
- * @sof_len:	SOF0 marker's payload length (without length field itself)
+ * @sos:	JPEG_MARKER_SOS's position relative to the buffer beginning
+ * @dht:	JPEG_MARKER_DHT' positions relative to the buffer beginning
+ * @dqt:	JPEG_MARKER_DQT' positions relative to the buffer beginning
+ * @sof:	JPEG_MARKER_SOF0's position relative to the buffer beginning
+ * @sof_len:	JPEG_MARKER_SOF0's payload length (without length field itself)
  * @size:	image buffer size in bytes
  */
 struct s5p_jpeg_q_data {
