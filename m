Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C865ED5A24
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 06:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfJNER0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 00:17:26 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46509 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfJNER0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 00:17:26 -0400
Received: by mail-oi1-f193.google.com with SMTP id k25so12628751oiw.13
        for <linux-media@vger.kernel.org>; Sun, 13 Oct 2019 21:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aIvxNgQjoEzpFK4ydVxPDff8pQyvZq8x0BSerjgFU0A=;
        b=rnML8ukIXnTfWnk9kWkAoODQ1Bt93iW0D5GILeYe82vptIaLAFNE5lWMXYGR0Qb0tY
         jo/AJlJ8eNc/ubMuSMymemRN7eYqwyECMHBmasGLWYj3Jd7MkHD/XfJu2Tne5yE0Cnej
         t+lpZItHiEOgqca489DSdTT/Hq9MBS8OPHxVUaDnd5THDCowMPFUFEN4PvWFrV3kbcn7
         7txT/ZZ8ovblh7BaNrnY2Nralm7spJMKD+6YYWuiLFfbzBovUt6JSQUURaYpSgMkuAZk
         +e3RRZVMhNCJz05LV+2hJO8SuFkISdX0zqnIglC35js8fjT9e/aOMQrBaZSy6v+W3glS
         aOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aIvxNgQjoEzpFK4ydVxPDff8pQyvZq8x0BSerjgFU0A=;
        b=Oi1r54lxidfRkn+RjEu3j5KamYqIWyGen/IQdAhYVIPMqgkT98eepcZ4GU0jtCIJ+P
         zLJDkFZwg/72ZOIoTRE60ZYBRtkMLWQRv1jcxh2IzbeKQop7qFodb4vxbZsebI4R4dpg
         t2MVPtQSMyDZtGaodX9GCna43IpKmNEqN44j7FmIcYHuYoXRkoEyw6xKcyl4C2FO7NKM
         XVnC2eODgR3intSQSYpPjVeQDR9gjsHYFEuesbd40ntBHtcANnSA1kv5b5LGhXswk0CR
         oXpXmaPNz9LTHgHrJxcZmUjjNksHPajcz6F53hNhbOtwfvnN4YpfYSYmhPjYpavSINvc
         2olg==
X-Gm-Message-State: APjAAAW6fU8C8FX4N3T6ah6MbDU12bpN2OkWuLb7gaRGt9GmAx/NASsm
        TfHM6HmMOpX6MTEVpEJ3/aEZyW33
X-Google-Smtp-Source: APXvYqyN1tx9Dnd5fAYdvR54JhK2SEutzyeMkFBNfyALq3RKYOBt3+DWJfyV6ZFzJGo8dX+zixrcoA==
X-Received: by 2002:a05:6808:b2b:: with SMTP id t11mr21724101oij.141.1571026645181;
        Sun, 13 Oct 2019 21:17:25 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l19sm4887918oie.22.2019.10.13.21.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 21:17:24 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 3/8] cec-follower: create digital ARIB channels
Date:   Sun, 13 Oct 2019 23:17:16 -0500
Message-Id: <20191014041721.52025-4-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This table will allow proper testing of digital tuner control features.
There are three channels per TSID/ONID/SID combination along with channel
data for the following digital ARIB broadcast systems:
  - ARIB-BS
  - ARIB-T

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 3a71a890..4fd65876 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -9,8 +9,60 @@
 #include "cec-follower.h"
 
 #define NUM_ANALOG_FREQS 3
+#define NUM_DIGITAL_CHANS 3
 #define TOT_ANALOG_FREQS (sizeof(analog_freqs_khz) / sizeof(analog_freqs_khz[0][0][0]))
 
+struct service_info {
+	unsigned tsid;
+	unsigned onid;
+	unsigned sid;
+	unsigned fmt;
+	unsigned major;
+	unsigned minor;
+};
+
+/*
+ * This table contains the digital television channels for ARIB (ISDB).  There
+ * are a total of three channels that are identified by digital IDs or by
+ * channel.
+ *
+ * CEC 17 of the 1.4 specification lists the available digital identification
+ * methods, IDs, and channel data.
+ *
+ * Digital channel data for ARIB-BS is from:
+ *
+ * https://sichbopvr.com/frequency-tables/19-20E
+ *
+ * No public data was found for ARIB-BS so data is just copied.
+ *
+ * Digital channel data for ARIB-T is from:
+ *
+ * https://sichbopvr.com/frequency-tables/Brazil/Rio%20de%20Janeiro/Rio%20De%20Janeiro
+ */
+static const struct service_info digital_arib_data[2][1][NUM_DIGITAL_CHANS] =
+{
+	// satellite
+	{
+		// arib-bs
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 1032, 1, 30203, 1, 0, 30203 },
+			{ 1046, 1, 30505, 1, 0, 30505 },
+			{ 1060, 1, 30609, 1, 0, 30609 }
+		}
+	},
+	// terrestrial
+	{
+		// arib-t
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 1519, 1519, 48608, 1, 0, 48608 },
+			{ 1624, 1624, 51992, 1, 0, 51992 },
+			{ 1905, 1905, 60960, 1, 0, 60960 }
+		}
+	}
+};
+
 /*
  * This table contains analog television channel frequencies in KHz.  There are
  * a total of three frequencies per analog broadcast type and broadcast system.
-- 
2.23.0

