Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD0D8184EC8
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 19:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgCMSj2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 14:39:28 -0400
Received: from mga05.intel.com ([192.55.52.43]:11667 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbgCMSj2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 14:39:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Mar 2020 11:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; 
   d="scan'208";a="246763975"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga006.jf.intel.com with SMTP; 13 Mar 2020 11:39:25 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 13 Mar 2020 20:39:24 +0200
From:   Ville Syrjala <ville.syrjala@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH] edid-decode: Fix decoing of DispID physical enclosure bit
Date:   Fri, 13 Mar 2020 20:39:24 +0200
Message-Id: <20200313183924.10820-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The interpretation of the physucal enclosure bit is backwards.
Fix it to match the spec.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 parse-displayid-block.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index e6c8d95dcaa1..b436f343fa63 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -913,9 +913,9 @@ static void parse_displayid_tiled_display_topology(const unsigned char *x, bool
 	default: printf("Reserved\n"); break;
 	}
 	if (caps & 0x80)
-		printf("    Tiled display consists of multiple physical display enclosures\n");
-	else
 		printf("    Tiled display consists of a single physical display enclosure\n");
+	else
+		printf("    Tiled display consists of multiple physical display enclosures\n");
 	printf("    Num horizontal tiles: %u Num vertical tiles: %u\n",
 	       num_h_tile + 1, num_v_tile + 1);
 	printf("    Tile location: %u, %u\n", tile_h_location, tile_v_location);
-- 
2.24.1

