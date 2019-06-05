Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B924535C2E
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 13:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfFEL7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 07:59:11 -0400
Received: from ns.iliad.fr ([212.27.33.1]:35984 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbfFEL7L (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 07:59:11 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 5815820985;
        Wed,  5 Jun 2019 13:59:10 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 4977C20109;
        Wed,  5 Jun 2019 13:59:10 +0200 (CEST)
Subject: [PATCH] media: docs: fix minor typos
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <e9d01085-168f-2cd8-9aef-e8b632489b8e@free.fr>
 <20190604142658.0ea99881@coco.lan>
 <1f9dc1b2-b147-c2e3-19c8-3f46f2ad524e@free.fr>
 <20190605053206.26ab1cf0@coco.lan>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <e6affc25-3fd7-a3bc-76ae-c9e09a17a3a1@free.fr>
Date:   Wed, 5 Jun 2019 13:59:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605053206.26ab1cf0@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jun  5 13:59:10 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix minor typos in the DVB demux documentation.

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
 Documentation/media/kapi/dtv-core.rst | 6 +++---
 include/media/dvbdev.h                | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/media/kapi/dtv-core.rst b/Documentation/media/kapi/dtv-core.rst
index ac005b46f23e..82c5b85ed9b1 100644
--- a/Documentation/media/kapi/dtv-core.rst
+++ b/Documentation/media/kapi/dtv-core.rst
@@ -11,12 +11,12 @@ Digital TV devices are implemented by several different drivers:
 
 - Frontend drivers that are usually implemented as two separate drivers:
 
-  - A tuner driver that implements the logic with commands the part of the
-    hardware with is responsible to tune into a digital TV transponder or
+  - A tuner driver that implements the logic which commands the part of
+    the hardware responsible for tuning into a digital TV transponder or
     physical channel. The output of a tuner is usually a baseband or
     Intermediate Frequency (IF) signal;
 
-  - A demodulator driver (a.k.a "demod") that implements the logic with
+  - A demodulator driver (a.k.a "demod") that implements the logic which
     commands the digital TV decoding hardware. The output of a demod is
     a digital stream, with multiple audio, video and data channels typically
     multiplexed using MPEG Transport Stream [#f1]_.
diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index 881ca461b7bb..551325858de3 100644
--- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -86,8 +86,8 @@ struct dvb_frontend;
  * @priv:		private data
  * @device:		pointer to struct device
  * @module:		pointer to struct module
- * @mfe_shared:		mfe shared: indicates mutually exclusive frontends
- *			Thie usage of this flag is currently deprecated
+ * @mfe_shared:		indicates mutually exclusive frontends.
+ *			Use of this flag is currently deprecated.
  * @mfe_dvbdev:		Frontend device in use, in the case of MFE
  * @mfe_lock:		Lock to prevent using the other frontends when MFE is
  *			used.
-- 
2.17.1
