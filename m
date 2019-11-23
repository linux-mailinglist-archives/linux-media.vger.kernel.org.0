Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34B99107F6D
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKWQqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:46:18 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.137]:37162 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbfKWQqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:46:17 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id YYXziRYDERnrKYYY3iYY1J; Sat, 23 Nov 2019 09:46:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527576;
        bh=45pz/308vOm0ht33y3DGrmVZ6xsAostU8WmNOxgwIg0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=slJlpizL+02sfUW3oYFuSvreumhlsan4W9NiGCL4MJqnQonmm0rDm390TqYF6gX13
         fcpdz2rWBlN6C+76hn6M9XLDdlqsUc5nHJZBkzi3TGAXAAyOLnx789JmyWi2FLtzof
         adzXFLzpdZc4Flw1I9OcebfQR1KIcBvnvlE5efeKcCI2rbDWWVx+SO/hqTLUfIdEHY
         yfgKymrDPhlBHnKoT57gw3VqFNyX4lWJPNaZ6uIrBrvhddc56SFBQc7OCLoGvZ3WdJ
         MDJoFWuo9IHqyi6LcBiT9/4+Fn1AUfVeYqVxU3OUyF05W9vss8PYbHB3EVFYhCPp25
         nZsrn4LjCc2Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527576;
        bh=45pz/308vOm0ht33y3DGrmVZ6xsAostU8WmNOxgwIg0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=slJlpizL+02sfUW3oYFuSvreumhlsan4W9NiGCL4MJqnQonmm0rDm390TqYF6gX13
         fcpdz2rWBlN6C+76hn6M9XLDdlqsUc5nHJZBkzi3TGAXAAyOLnx789JmyWi2FLtzof
         adzXFLzpdZc4Flw1I9OcebfQR1KIcBvnvlE5efeKcCI2rbDWWVx+SO/hqTLUfIdEHY
         yfgKymrDPhlBHnKoT57gw3VqFNyX4lWJPNaZ6uIrBrvhddc56SFBQc7OCLoGvZ3WdJ
         MDJoFWuo9IHqyi6LcBiT9/4+Fn1AUfVeYqVxU3OUyF05W9vss8PYbHB3EVFYhCPp25
         nZsrn4LjCc2Ew==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=LX1Smp8SeW7qzEvS9iwA:9
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, joevt <joevt@shaw.ca>
Subject: [PATCH 04/10] edid-decode: add front porch, pulse width, and back porch
Date:   Sat, 23 Nov 2019 08:45:58 -0800
Message-Id: <20191123164604.268-5-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191123164604.268-1-joevt@shaw.ca>
References: <20191123164604.268-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNqLdg9ZMaVKC21oywaFt3H2bmA4YWhViyWonWA1WjvSCAEe3Hxa+KbFs9/SNd4ZO7JkIwMXwq2UloVIL/JtoYTG6UZAghSoIQ1tAq28T9I+4o2kIusj
 94N4R7mU4NjgkzMPk420nSsXDfywUqT72ReQMGimik884sXR9gG/i2L30LqzQ1p0adqWTZp/wT2Jyvr0RrPkEFILxSRUOtiZU4g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For detailed timings, add front porch, pulse width, and back porch numbers in parenthesis (smaller integers are easier to comprehend, useful when comparing or editing timings in SwitchResX or other custom timing editors, negative values will be more apparent - this can happen for back porch when offset and width exceed total blanking).
Also, add missing VertFreq and HorFreq values to DisplayID type 1 timings.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/edid-decode.c b/edid-decode.c
index e1386ce..b833178 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -1083,14 +1083,14 @@ static int detailed_block(const unsigned char *x, int in_extension)
 	hor_mm = x[12] + ((x[14] & 0xf0) << 4);
 	vert_mm = x[13] + ((x[14] & 0x0f) << 8);
 	printf("Detailed mode: Clock %.3f MHz, %u mm x %u mm\n"
-	       "               %4u %4u %4u %4u hborder %u\n"
-	       "               %4u %4u %4u %4u vborder %u\n"
+	       "               %4u %4u %4u %4u (%3u %3u %3d) hborder %u\n"
+	       "               %4u %4u %4u %4u (%3u %3u %3d) vborder %u\n"
 	       "               %chsync %cvsync%s%s %s\n"
 	       "               VertFreq: %.3f Hz, HorFreq: %.3f kHz\n",
 	       pixclk_khz / 1000.0,
 	       hor_mm, vert_mm,
-	       ha, ha + hso, ha + hso + hspw, ha + hbl, hborder,
-	       va, va + vso, va + vso + vspw, va + vbl, vborder,
+	       ha, ha + hso, ha + hso + hspw, ha + hbl, hso, hspw, hbl - hso - hspw, hborder,
+	       va, va + vso, va + vso + vspw, va + vbl, vso, vspw, vbl - vso - vspw, vborder,
 	       phsync, pvsync, syncmethod, x[17] & 0x80 ? " interlaced" : "", stereo,
 	       refresh, (float)pixclk_khz / (ha + hbl)
 	      );
@@ -2563,13 +2563,15 @@ static void parse_displayid_detailed_timing(const unsigned char *x)
 	vspw++;
 	
 	printf("  Detailed mode: Clock %.3f MHz, %u mm x %u mm\n"
-	       "                 %4u %4u %4u %4u\n"
-	       "                 %4u %4u %4u %4u\n"
-	       "                 %chsync %cvsync\n",
+	       "                 %4u %4u %4u %4u (%3u %3u %3d)\n"
+	       "                 %4u %4u %4u %4u (%3u %3u %3d)\n"
+	       "                 %chsync %cvsync\n"
+	       "                 VertFreq: %.3f Hz, HorFreq: %.3f kHz\n",
 	       (float)pix_clock/100.0, 0, 0,
-	       ha, ha + hso, ha + hso + hspw, ha + hbl,
-	       va, va + vso, va + vso + vspw, va + vbl,
-	       phsync, pvsync
+	       ha, ha + hso, ha + hso + hspw, ha + hbl, hso, hspw, hbl - hso - hspw,
+	       va, va + vso, va + vso + vspw, va + vbl, vso, vspw, vbl - vso - vspw,
+	       phsync, pvsync,
+	       ((float)pix_clock * 10000.0) / ((ha + hbl) * (va + vbl)), ((float)pix_clock * 10.0) / (ha + hbl)
 	      );
 }
 
-- 
2.21.0 (Apple Git-122.2)

