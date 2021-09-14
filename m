Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A043940AD60
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232902AbhINMUC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:20:02 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:57301 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232702AbhINMT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:19:59 -0400
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Sep 2021 08:19:58 EDT
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id PqodmL4uTczbLQ7Himm22q; Tue, 14 Sep 2021 12:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631621494; bh=HP5AfHzdvFtxdz8Kyqg1cR/DQGImE8rOlkFwmFp4qjo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=veLJB61JANk9YKy9XN6lvoykzlp1cQ5KAZuwYj4Y1xk6L3wkQW3WzPlcEHokzKHnt
         YpXGBAIb5eSevOoqSzO2x/iTEncnYYIYU7VUoEdxOpDWhseLWYatc4Lpw8P5QcfXp1
         s96TqDJrKenFaMfh/Iz1KrB3bgxb/olQZCAu2RYL4D05JgoPE/H1iOi3glGfIvml6r
         VSbQuWMCYuVnGXzjvHwccBG97FRQSKEapDTsGppawWul7hE4iIFmo+qef2CAawnPTN
         0SLpTci7G3l3mwY2QX2S5E5v8sNYGeHbKVQidyD3e2gc9EiBMI/QRg7p5WVBn8wZjW
         SIq/n0SxnnxLA==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id Q7Hdmcu7dcHSBQ7Himpv0t; Tue, 14 Sep 2021 12:11:34 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61409176
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=FfBoY9JkhA89F12Tr8UA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 05/11] edid-decode: fix standard timing vertical pixels
Date:   Tue, 14 Sep 2021 05:11:23 -0700
Message-Id: <20210914121129.51451-6-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210914121129.51451-1-joevt@shaw.ca>
References: <20210914121129.51451-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGNgsy3UaltUbouhe8WgPYFBvOGJS9DNYYGgmGOoFpgsVjFzQ2PmoE62ACfwzcm2G0vwahbgEwMwf3vbf/Ay8NqOQkA1ddBfPlTtY/0Q8epgK/d5PmD7
 NdXPdP4sZtfCEpA/M46a9PiUzpWuPShUVTtV0jLCwEh+SKH0gFlFvh8k0dIQY4hgAx71B8mlfUiw9Xhmb5sPQsIFmHWMg7h8+eA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't do ceiling to nearest 8 pixels for active vertical lines. See examples elo-4600l-hdmi and kogan-kaled24144f-hdmi.

Section 3.9 and 3.10.3.6 of EDID 1.4 does not say vertical lines must be a multiple of 8.  This line of code appears to have been added to satisfy the 3rd example in VTB-EXT spec but that example has an incorrect HAP indicator decimal value so it cannot be trusted. Also, all 3 examples have an incorrect vertical refresh value as noted in parse-vtb-ext-block.cpp. The VESA DMT spec has the following examples that are not a multiple of 8 lines which support this change:
1400x1050 4:3
1440x900 16:10
1600x900 16:9
1680x1050 16:10

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-base-block.cpp | 1 -
 1 file changed, 1 deletion(-)

diff --git a/parse-base-block.cpp b/parse-base-block.cpp
index e2901a6..32d2079 100644
--- a/parse-base-block.cpp
+++ b/parse-base-block.cpp
@@ -573,7 +573,6 @@ void edid_state::print_standard_timing(const char *prefix, unsigned char b1, uns
 		break;
 	}
 	vact = (double)hact * vratio / hratio;
-	vact = 8 * ((vact + 7) / 8);
 	refresh = (b2 & 0x3f) + 60;
 
 	formula.hact = hact;
-- 
2.24.3 (Apple Git-128)

