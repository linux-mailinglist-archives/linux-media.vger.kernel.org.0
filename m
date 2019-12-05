Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26B76113C68
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 08:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbfLEHeT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 02:34:19 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.138]:35562 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfLEHeT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 02:34:19 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id cleQi8c1NRnrKcleTi9Y2R; Thu, 05 Dec 2019 00:34:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1575531257;
        bh=UOIozgZnL+femg7nbXbBvFmc5AKDVGKw7DX8bbcGI9k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FpXNbVVh9SPlgOQWOXcAmxEt8DliJ+1yzKPnufZaGwq9Rq+vWiQHMQCFyQkc9RK0w
         jFWmrbjZZ/j4AdarISqadZ1HcAGkxs+K16EPSqwx+hX7oPjIkOTj6wiqjL7X3ETOwY
         FfxsiQJAzEcYWIqdQP/izC3IiPfgnMShSStcdl7fMQpEdgOoV95yFGskUFPA5faOOq
         ZWx/kot8Mf3yDdEm/NHAlCsC+D8O7yVJyj5YZac6HUr1W6Zco5oMEgi0vWSOHk0aUQ
         zOe2CaYFFyxhNGN0g9ISaRBHoG4FVv2OgbxdhKlWXwu+SInLcgrCZ8H/wWhyxxCbtY
         637hgufBS4mwQ==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=2EPVxaLeQsKgbbdgV34A:9
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 2/5] edid-decode: Change horizontal frequency to kHz
Date:   Wed,  4 Dec 2019 23:34:11 -0800
Message-Id: <20191205073414.53672-2-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191205073414.53672-1-joevt@shaw.ca>
References: <20191205073414.53672-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGKGFL3pWD/mknp2ADiM5nC+muuLz2pocAWuchsn0pq459OfyvE68G8q2KvmWX9t/TvrnQMTbkCqnOz+Xwcxk4JQqbCv4cUHJZ2KnkZnjzJo8U4luiXY
 0QkVFGVzP3+qNqHmlukUoSHHAzuAfGoN/5LXpeYjQPprzNqNK3begSmhi7KXtX14Obvuq1UB7B7BOA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change Monitor Ranges error message to use kHz for horizontal frequency.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.cpp | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/edid-decode.cpp b/edid-decode.cpp
index eac47c5..0c6c237 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -735,26 +735,22 @@ int edid_state::parse_edid()
 		 * EDID 1.4 states (in an Errata) that explicitly defined
 		 * timings supersede the monitor range definition.
 		 */
+		char buf[512];
+		snprintf(buf, sizeof(buf),
+			"One or more of the timings is out of range of the Monitor Ranges:\n"
+			"    Vertical Freq: %u - %u Hz (Monitor: %u - %u Hz)\n"
+			"    Horizontal Freq: %.3f - %.3f kHz (Monitor: %.3f - %.3f kHz)\n"
+			"    Maximum Clock: %.3f MHz (Monitor: %.3f MHz)\n",
+			min_vert_freq_hz, max_vert_freq_hz,
+			min_display_vert_freq_hz, max_display_vert_freq_hz,
+			min_hor_freq_hz / 1000.0, max_hor_freq_hz / 1000.0,
+			min_display_hor_freq_hz / 1000.0, max_display_hor_freq_hz / 1000.0,
+			max_pixclk_khz / 1000.0, max_display_pixclk_khz / 1000.0);
+		
 		if (edid_minor < 4) {
-			fail("One or more of the timings is out of range of the Monitor Ranges:\n"
-			     "    Vertical Freq: %u - %u Hz (Monitor: %u - %u Hz)\n"
-			     "    Horizontal Freq: %u - %u Hz (Monitor: %u - %u Hz)\n"
-			     "    Maximum Clock: %.3f MHz (Monitor: %.3f MHz)\n",
-			     min_vert_freq_hz, max_vert_freq_hz,
-			     min_display_vert_freq_hz, max_display_vert_freq_hz,
-			     min_hor_freq_hz, max_hor_freq_hz,
-			     min_display_hor_freq_hz, max_display_hor_freq_hz,
-			     max_pixclk_khz / 1000.0, max_display_pixclk_khz / 1000.0);
+			fail("%s", buf);
 		} else {
-			warn("One or more of the timings is out of range of the Monitor Ranges:\n"
-			     "    Vertical Freq: %u - %u Hz (Monitor: %u - %u Hz)\n"
-			     "    Horizontal Freq: %u - %u Hz (Monitor: %u - %u Hz)\n"
-			     "    Maximum Clock: %.3f MHz (Monitor: %.3f MHz)\n",
-			     min_vert_freq_hz, max_vert_freq_hz,
-			     min_display_vert_freq_hz, max_display_vert_freq_hz,
-			     min_hor_freq_hz, max_hor_freq_hz,
-			     min_display_hor_freq_hz, max_display_hor_freq_hz,
-			     max_pixclk_khz / 1000.0, max_display_pixclk_khz / 1000.0);
+			warn("%s", buf);
 		}
 	}
 
-- 
2.21.0 (Apple Git-122.2)

