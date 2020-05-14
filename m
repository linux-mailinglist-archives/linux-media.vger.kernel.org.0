Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FECD1D35EE
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbgENQDW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQDV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:03:21 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1E1C061A0C;
        Thu, 14 May 2020 09:03:21 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id u5so1423002pgn.5;
        Thu, 14 May 2020 09:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0+vgRUi2Cw6OQUIzVG2SQIiqB95rjj/yXNRfFtp+ZZQ=;
        b=a3sxaPR6bZoBkYvsbXEEqvNMgq9czEdqOb/JwY6+1C7HJ+bw7FFbu9t7mSJ409L+kE
         tTbWX82kuQn674VDPeyT4NqEFtzpo83hrc2W5qugwKE4ET6mWcnty+5fIBm5n1syZXzI
         0HLNgB7uFsbVcTmz7BbEr1qEF3IMROfcXYvLbcTzajjtIniLoBkvT7x/lHVm+SvYkCXD
         VhqdRpGNgW42MtinKI3Lh5gK1IMYZ8C9EEULuPpdpzz4JtirccqAheMHaCm9n0Iss2IY
         fJ2Ct/yxJ+GyqObaQD5eLgSwqZV25PcAGaGyFXm8O9MjgLzrkOI9IX5BdBysw5o/Wknx
         n+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0+vgRUi2Cw6OQUIzVG2SQIiqB95rjj/yXNRfFtp+ZZQ=;
        b=keFFG1rAgROwa4C7iLiP7i/mzKA9tA4DtMlgxlrb8cF1HIUbZ5Nu86Ds5mP1wn24GB
         CTrVCaQmd9IX9oPvFw9i6R4OPOSiLsjONKojxncZfLYoeJ8oDHVMYW1rbqOsAMhmq2C6
         yKlPwjho/DEaekQuH1YHfPqZnEvE1uXMMqZ6DyxX4901D4qZnq6FM2pg88vNohmf+VBo
         9EeR+AzRiNHODvzzw5hUXrWZRyz070vsBQJcx/w/vXLoRIUHGpn7Gsw82RxLNP1kpLu2
         Kqynyd+ZMny137O4icImqmnvc0zeqA7dG6xPnHHVmZD5Qhie1/OAb/EWr6ul71Y/h5cU
         PC7A==
X-Gm-Message-State: AOAM533XsWhxAVDez8PV3kpcKqoDoOx/EZUat4+hDs4XedvNmlD99lmv
        n+gnxa78WTexJUVVKfBWIhY=
X-Google-Smtp-Source: ABdhPJxS1tydaOlU0q18OhkSEwfnyWX7EesrdokZbnrifiBg3PN6dwqQZBzpXF7MTJFRRAzwqcfbeQ==
X-Received: by 2002:a62:1b87:: with SMTP id b129mr5031639pfb.162.1589472200343;
        Thu, 14 May 2020 09:03:20 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:03:19 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 14/14] media: vivid: add cache_hints module param
Date:   Fri, 15 May 2020 01:01:53 +0900
Message-Id: <20200514160153.3646-15-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

Add a cache_hints module param to control per-queue user space cache
hints support.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/admin-guide/media/vivid.rst     | 9 +++++++++
 drivers/media/test-drivers/vivid/vivid-core.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 52e57b773f07..6d7175f96f74 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -293,6 +293,15 @@ all configurable using the following module options:
 		- 0: vmalloc
 		- 1: dma-contig
 
+- cache_hints:
+
+	specifies if the device should set queues' user-space cache and memory
+	consistency hint capability (V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS).
+	The hints are valid only when using MMAP streaming I/O. Default is 0.
+
+		- 0: forbid hints
+		- 1: allow hints
+
 Taken together, all these module options allow you to precisely customize
 the driver behavior and test your application with all sorts of permutations.
 It is also very suitable to emulate hardware that is not yet available, e.g.
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 6c740e3e6999..5c986df4a8d4 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -169,6 +169,14 @@ MODULE_PARM_DESC(allocators, " memory allocator selection, default is 0.\n"
 			     "\t\t    0 == vmalloc\n"
 			     "\t\t    1 == dma-contig");
 
+static unsigned int cache_hints[VIVID_MAX_DEVS] = {
+	[0 ... (VIVID_MAX_DEVS - 1)] = 0
+};
+module_param_array(cache_hints, uint, NULL, 0444);
+MODULE_PARM_DESC(cache_hints, " user-space cache hints, default is 0.\n"
+			     "\t\t    0 == forbid\n"
+			     "\t\t    1 == allow");
+
 static struct vivid_dev *vivid_devs[VIVID_MAX_DEVS];
 
 const struct v4l2_rect vivid_min_rect = {
@@ -819,6 +827,7 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->lock = &dev->mutex;
 	q->dev = dev->v4l2_dev.dev;
 	q->supports_requests = true;
+	q->allow_cache_hints = (cache_hints[dev->inst] == 1);
 
 	return vb2_queue_init(q);
 }
-- 
2.26.2

