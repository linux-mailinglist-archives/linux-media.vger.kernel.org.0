Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C91541875D
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhIZIfJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:09 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:46574 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229691AbhIZIfJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:09 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id UA72mHBH9ps7PUPbImzSGi; Sun, 26 Sep 2021 08:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645212; bh=ovZtVaWTCfAoDAgt+l/yTO5EoQzPB5vB+xXZhhZTSVA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=anbdp5/4FWe6s8t49xjgGXYD3Xpw4FYODJou8tYLMLgMhyB9LgXtRCy+wQ0SmAZ6E
         Jedm3ZP621vNvv2MVZlEcapjBAHbHywc2wdjL+jqQfExVoVkfPWeoakt8ggVfdIaIm
         87pRLDlKefJ+HH0qZ5/aHsm0acW328aDRWtlFP6Ff3KEOXnY9w7YasZGtcBvSZmeK8
         JvwyNQ09DTB9Bb8cX9ZPc8Xc8HSa4YT+RuSW0oVNCL9lanlXk5y7V/voB1ekWciyje
         ubm2hbn4m1dtngUllywDVEcpddZLJdTqtzoe+NgV2B9TRpnHauGOdWKaU4y7R+9faz
         G0H2gsfCFVRxg==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbIm6iEF; Sun, 26 Sep 2021 08:33:32 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=6150305c
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=ywt57WX9DDL8cH32plEA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 02/29] edid-decode: fix standard timing vertical pixels
Date:   Sun, 26 Sep 2021 01:33:03 -0700
Message-Id: <20210926083330.5206-3-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCwsqoQToehvrwTgF2jkvt73Ak5WocNz1xLu1j8a9055jJ5AiZFhJ+ZZZZRktTUtxEV04TjMvqifMZDXR337K24pFGhQfbG1qUjy22BR0HI4McHEFp4N
 AKsavrqRiySDbX4h+HXUvVTdCG7v6ZI/NMIdQR2/id59D7R3V+TRGM8hVtQRZj0v3eCIp1u6HFtxZ4CprM7Xtwu29n199GicNbU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't do ceiling to nearest 8 pixels for active vertical lines. See examples elo-4600l-hdmi and kogan-kaled24144f-hdmi.

Section 3.9 and 3.10.3.6 of EDID 1.4 does not say vertical lines must be a multiple of 8.  This line of code appears to have been added to satisfy the 3rd example in VTB-EXT spec but that example has an incorrect HAP indicator decimal value so it cannot be trusted. Also, all 3 examples have an incorrect vertical refresh value as noted in parse-vtb-ext-block.cpp. The VESA DMT spec has the following examples that are not a multiple of 8 lines which support this change:
1400x1050 4:3
1440x900 16:10
1600x900 16:9
1680x1050 16:10

Finally, Ref. D-8 of EDID 1.4 says about Section 3.9 that "The Standard Timings Identification code may not be used to identify timings which do not match one of these standard aspect ratios."

If vertical lines is odd then a warning is output. That way an attempt to use ST to describe 1360x768 (a common resolution) will result in a warning (since the nearest result that can be described by an ST is 1360x765).

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-base-block.cpp | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/parse-base-block.cpp b/parse-base-block.cpp
index 174af51..dd56eed 100644
--- a/parse-base-block.cpp
+++ b/parse-base-block.cpp
@@ -573,7 +573,6 @@ void edid_state::print_standard_timing(const char *prefix, unsigned char b1, uns
 		break;
 	}
 	vact = (double)hact * vratio / hratio;
-	vact = 8 * ((vact + 7) / 8);
 	refresh = (b2 & 0x3f) + 60;
 
 	formula.hact = hact;
@@ -605,6 +604,10 @@ void edid_state::print_standard_timing(const char *prefix, unsigned char b1, uns
 		min_vert_freq_hz = min(min_vert_freq_hz, refresh);
 		max_vert_freq_hz = max(max_vert_freq_hz, refresh);
 	}
+
+	// See Ref. D-8 in the EDID-1.4 spec
+	if (vact & 1)
+		warn("Standard Timing %ux%u has a dubious odd vertical resolution.\n", hact, vact);
 }
 
 void edid_state::detailed_display_range_limits(const unsigned char *x)
-- 
2.24.3 (Apple Git-128)

