Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA17D5A25
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 06:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfJNER1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 00:17:27 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45440 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbfJNER0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 00:17:26 -0400
Received: by mail-oi1-f194.google.com with SMTP id o205so12637713oib.12
        for <linux-media@vger.kernel.org>; Sun, 13 Oct 2019 21:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oGNbmBwj0JjfEcBW0P62i/gOOANlcCdmKdVj4D8Mn0Y=;
        b=qpjmwvpXp8rSDUGY/GWzMdmkutHgHbL7tWJlBkgHSRInykcHtOHCrUGZr2bLVY1tlp
         RfjiPZftad6wUwwpLUgOuzoLRSVyJ8f+bPM44ns80ImzrM79KzB1KfPXCmp4517LDwhC
         iBAIf5znGLr/rgMX+4xhKTFCh6VeJVNrd+Q+vuvSUK12xAdh00LCjlJWq3Qo/OODncQR
         mJpUcGZriGuJ5ttNCxLkDLSB2pC/8FIRIIcfog8QWlK2YgTZC7JdLLHNVtkgfR0oOYsU
         qtJ68700/uRAIibTe41pSbeXwXC6jNUeM4qnJQucobb14dD5cxXMGCnCYpQk4QvMh7TH
         K9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oGNbmBwj0JjfEcBW0P62i/gOOANlcCdmKdVj4D8Mn0Y=;
        b=hkofaEWaCTIs3lLacIIZJm9Gvzf1kUnVExbtY4h+Z5y5E2Hn5QlrhcSCd4EOp+r3iX
         VJSbsSNrp+BUzY9Qgm3nulV/pjz/WWuZufVb5tF2zoRRYMlfTChLlNOWogAymEEMWYUi
         XmVKlOhkInXI2fa4BPXh0uygenkwa9qF5DcLZwqWlCEQSCOKFgC3l14NnnGK8KvcCAS4
         h9KZ7Yo11/xWn0baHRiNmimVU/RlcyRZUVAkKLH9qr/DnUVpHWY3DeUcrWLvMjYheE0K
         fRcUNQvs5DVnumYPH235ahpsfOzjQj8Z86hmyXUQA4g60EbVt3nYKgzsC2beMnXEbo7P
         5axQ==
X-Gm-Message-State: APjAAAXlTPZuW7zAe3Z/docXJ4PjZ80xhBuPWKzH5eADMWQCAx2ozdYB
        4H/GZ0AQ8+NXyVVcZd+ueEUcXnta
X-Google-Smtp-Source: APXvYqx72cG7Imz24iiytGfZBJqDvgecNAxz+MuMoSal2y8Qy0kDWMXaH23L+4v7pFxlaUoRMOBe8w==
X-Received: by 2002:aca:abc4:: with SMTP id u187mr22058175oie.178.1571026645965;
        Sun, 13 Oct 2019 21:17:25 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l19sm4887918oie.22.2019.10.13.21.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 21:17:25 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 4/8] cec-follower: create digital ATSC channels
Date:   Sun, 13 Oct 2019 23:17:17 -0500
Message-Id: <20191014041721.52025-5-c0d1n61at3@gmail.com>
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
There are three channels per TSID/program number combination along with
channel data for the following digital ATSC broadcast systems:
  - ATSC-SAT
  - ATSC-T

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 4fd65876..4a4d2c7f 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -63,6 +63,51 @@ static const struct service_info digital_arib_data[2][1][NUM_DIGITAL_CHANS] =
 	}
 };
 
+/*
+ * This table contains the digital television channels for ATSC.  There
+ * are a total of three channels that are identified by digital IDs or by
+ * channel.
+ *
+ * CEC 17 of the 1.4 specification lists the available digital identification
+ * methods, IDs, and channel data.
+ *
+ * Digital channel data for atsc-sat is from:
+ *
+ * https://sichbopvr.com/frequency-tables/28-50E
+ *
+ * No public data was found for atsc-sat so data is just copied.
+ *
+ * Digital channel data for atsc-t is from:
+ *
+ * https://sichbopvr.com/frequency-tables/United%20States/Illinois/Caseyville
+ *
+ * ATSC does not use ONIDs and SID will be used as the program number.  All ATSC
+ * channel number formats are 2 part.
+ */
+static const struct service_info digital_atsc_data[2][1][NUM_DIGITAL_CHANS] =
+{
+	// satellite
+	{
+		// atsc-sat
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 2065, 0, 50316, 2, 3, 50316 },
+			{ 2090, 0, 50882, 2, 3, 50882 },
+			{ 2122, 0, 55295, 2, 3, 55295 }
+		}
+	},
+	// terrestrial
+	{
+		// atsc-t
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 1675, 0, 1, 2, 4, 1 },
+			{ 1675, 0, 2, 2, 4, 2 },
+			{ 1675, 0, 3, 2, 4, 3 }
+		}
+	}
+};
+
 /*
  * This table contains analog television channel frequencies in KHz.  There are
  * a total of three frequencies per analog broadcast type and broadcast system.
-- 
2.23.0

