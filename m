Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30918417E3A
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344443AbhIXXd3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:29 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:56763 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235822AbhIXXd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:27 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id ToZ0mdihEczbLTufYmRrV8; Fri, 24 Sep 2021 23:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526312; bh=ovZtVaWTCfAoDAgt+l/yTO5EoQzPB5vB+xXZhhZTSVA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=sqBiT5u3dm1OuSFDEMX+cV+/eUdScRUuyLW2ZlsSS6XYUur713X1YUFqG/BX6sIu0
         0e3RyrwMrEaSEOpWx7CLcGT7YebyMednDSaQ2hxXwUYyEczsSzz31AkWI+ZnjeGlvf
         fJwHZT3mlSJ2CHVURwC3Z1biBLRuG0HzHayVFiIESEafmxHJ+VcTCVekMYfZ/0+7Zc
         ENCZOAm4k8ZAn0CdIafdAKatf5WJtB0y8NW/YsyCGMWxzLsIZXOSLQTzSQByFk4yfF
         SoiMAWpBgz5dYWefJwBjLwq6aXaQkHImim+0y0YU+T6PyxAgJXwdaCjSalJTKL0hEg
         Q8z2t5coOczVQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufYmYw6s; Fri, 24 Sep 2021 23:31:52 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5fe8
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=ywt57WX9DDL8cH32plEA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 02/28] edid-decode: fix standard timing vertical pixels
Date:   Fri, 24 Sep 2021 16:31:23 -0700
Message-Id: <20210924233149.10028-3-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
References: <20210924233149.10028-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfB/vY64pWYCOyim2laaLaDJ7D2Hlz41YgpkPdxiZ5pG2nm9sWG1DfrFJWviVt6q1JOEBWKtn4NgkwIycAasG/gPmKeUFlfd5BpXCmfarJqxxsFdFHjYd
 wGiMTE2ufuJ1nWeqP3V9ZfCdiYYQPxkThCe448Y7LOotWOo4aZ13FqIprNrTjc8bv05XcX8u13JPUHu28Z6Dn/zQWt9kSrPXin0=
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

