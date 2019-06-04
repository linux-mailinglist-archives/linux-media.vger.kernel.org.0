Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 222C834DD7
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbfFDQlq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:41:46 -0400
Received: from ns.iliad.fr ([212.27.33.1]:48618 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727451AbfFDQlq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 12:41:46 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id C4A7620066;
        Tue,  4 Jun 2019 18:41:44 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id B374020042;
        Tue,  4 Jun 2019 18:41:44 +0200 (CEST)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [RFC] Documentation clarifications
Message-ID: <e9d01085-168f-2cd8-9aef-e8b632489b8e@free.fr>
Date:   Tue, 4 Jun 2019 18:41:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Jun  4 18:41:44 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Not sure about these changes, hence the RFC (some are quite trivial)

diff --git a/Documentation/media/kapi/dtv-core.rst b/Documentation/media/kapi/dtv-core.rst
index ac005b46f23e..9a74b8ba64b7 100644
--- a/Documentation/media/kapi/dtv-core.rst
+++ b/Documentation/media/kapi/dtv-core.rst
@@ -11,8 +11,8 @@ Digital TV devices are implemented by several different drivers:
 
 - Frontend drivers that are usually implemented as two separate drivers:
 
-  - A tuner driver that implements the logic with commands the part of the
-    hardware with is responsible to tune into a digital TV transponder or
+  - A tuner driver that implements the logic which commands the part of
+    the hardware responsible for tuning into a digital TV transponder or
     physical channel. The output of a tuner is usually a baseband or
     Intermediate Frequency (IF) signal;
 
diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index 881ca461b7bb..8e47411cf1d9 100644
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
