Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C44BAD5A26
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 06:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfJNER2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 00:17:28 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:36274 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbfJNER1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 00:17:27 -0400
Received: by mail-ot1-f45.google.com with SMTP id 67so12682883oto.3
        for <linux-media@vger.kernel.org>; Sun, 13 Oct 2019 21:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bxAoAwAMlBRF6nMXriA3UWjsclNqIFChN0e9ZS9nAkY=;
        b=Sg0h1NdgtQeBe7LSBd4GFrGVe8kkV2bh/OB0UUj53F2mEdrmJzzhYXG3wKdvBYCMTj
         UrYzKKCnjIi6u8+6zDs80J/dwqQnDbiCDyt+FlYd9cDeBBMz0myJA/Dvik4CouIAWDZJ
         DB8uRtxX3WaWrgVn1wGINFBz2Fxg+K+ThL7XwZRhc96ztS0NXOemwq41GJV7C9Utwv1n
         PbJ1OLhn0/uyyPFiOQ++Z4Il9gCfv+DCJHqbKYz7j2fCtu8hTUYBQTi87tT7rhE5YDD4
         t+rlwmTLzWRBQpxoNLu17sam43sSlwPwLQIGBKTLhhD9359bk4GmxqKZ20xKGCMmI9jV
         QBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bxAoAwAMlBRF6nMXriA3UWjsclNqIFChN0e9ZS9nAkY=;
        b=rFA/oe3mkitSKqlOhm3vOzPuEHkbMz3Z14L1iQrtGUgeiUIjEDfWg++PhyNGr3bhUN
         gSaDTRbiDgluexzTjAJtT95SmSG974w6Q7hZJi4uG68BiFlyWCTMKtcfGWxr3QkPXBGr
         9nAxjfvQyL8K6+4a3/q8HLD5XgW/Qkxo7yQi2pXrH1WNskKEvrtyJyrjcgi3XmvEoGa+
         cVrjWKqb1UNTeSvFKTQzAkFcviI834ttn65XdYfI307FyU9ZYdGW5kO8iZqifUcXcq4E
         rQR8HsSy39haitLJP9UbG29Wo29ox19X7ym6BbUOd4Rm3hOKQ1gE1HcH8/gl6zInPN0K
         kPWw==
X-Gm-Message-State: APjAAAUxS/HmfNxiNcwQ5+5HiQvypdtCaavz6h3CmjEx4TulHe9Zfrau
        JJXWJrNw3qim3LFloflbn+C4MOPT
X-Google-Smtp-Source: APXvYqxVfPwCuXytEGCFMLLh9TLxGsPK17ipiI47c28ccMqAO4/uzDF2GFH12S1XXJTdd8NQRPa/8g==
X-Received: by 2002:a05:6830:1f1b:: with SMTP id u27mr13893255otg.269.1571026646901;
        Sun, 13 Oct 2019 21:17:26 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l19sm4887918oie.22.2019.10.13.21.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 21:17:26 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 5/8] cec-follower: create digital DVB channels
Date:   Sun, 13 Oct 2019 23:17:18 -0500
Message-Id: <20191014041721.52025-6-c0d1n61at3@gmail.com>
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
data for the following digital DVB broadcast systems:
  - DVB-S2
  - DVB-T

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 4a4d2c7f..04e7e4c3 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -108,6 +108,47 @@ static const struct service_info digital_atsc_data[2][1][NUM_DIGITAL_CHANS] =
 	}
 };
 
+/*
+ * This table contains the digital television channels for DVB.  There are a
+ * total of three channels that are identified by digital IDs or by channel.
+ *
+ * CEC 17 of the 1.4 specification lists the available digital identification
+ * methods, IDs, and channel data.
+ *
+ * Digital channel data for DVB-S2 is from:
+ *
+ * https://www.satellite-calculations.com/DVB/getchannellist.php?1west/Swedish_Nordig_Channel_List.htm
+ *
+ * Digital channel data for DVB-T is from:
+ *
+ * https://sichbopvr.com/frequency-tables/Denmark/Hovedstaden/Copenhagen
+ * https://sichbopvr.com/frequency-tables/Sweden/Skane%20Lan/Malm%c3%b6
+ *
+ */
+static const struct service_info digital_dvb_data[2][1][NUM_DIGITAL_CHANS] =
+{
+	// satellite
+	{
+		// dvb-s2
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 61, 70, 7193, 1, 0, 24 },
+			{ 65, 70, 7040, 1, 0, 72 },
+			{ 28, 70, 7012, 1, 0, 101 }
+		}
+	},
+	// terrestrial
+	{
+		// dvb-t
+		{
+			// tsid, onid, sid, fmt, major, minor
+			{ 1002, 8400, 2025, 1, 0, 21 },
+			{ 1004, 8400, 84, 1, 0, 31 },
+			{ 1004, 8945, 1040, 1, 0, 1040 }
+		}
+	}
+};
+
 /*
  * This table contains analog television channel frequencies in KHz.  There are
  * a total of three frequencies per analog broadcast type and broadcast system.
-- 
2.23.0

