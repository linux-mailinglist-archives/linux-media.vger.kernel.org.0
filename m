Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042E6113C6A
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 08:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbfLEHeU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 02:34:20 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.139]:50071 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbfLEHeT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 02:34:19 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id cleQi8c1NRnrKcleUi9Y2X; Thu, 05 Dec 2019 00:34:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1575531258;
        bh=9jgLmRUJppl8fTv8RqvEy6Yj+h0K2PiErNbGyAsLog0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=P5jax9qB7LqrAiWB1L7bHOzUgvjst1gAM7UuK8HmRd50M6oPPxNWdhXDZdrp1T5ir
         D1O2qycMzPzbAni3QyZxliYDhXZFeGsqHpNig8RwSxVh6KVm1RJuZfAVM8gKBZkZnc
         eoFMj6PA2boSb5B43UcV/lnNE3UyAEwZ83xbXteMuwxssDdgr5wXzdkLg6KHmqFcHq
         KkWgzMqJB+ASevCMaSnGRipBuna3WhQHEy8O7gwK5NnioosCA6ivYaUrvJ2BOb8x7x
         4qkzReIpIfZyFDcc5bKCQThTarj5oGsHLj1Y440ggWvqA4vii5OqTVSZ1mNyECrwYz
         hPoX9btYeqE/g==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=4RC6wy0rsmmAbLfipA8A:9
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 5/5] edid-decode: add missing space
Date:   Wed,  4 Dec 2019 23:34:14 -0800
Message-Id: <20191205073414.53672-5-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191205073414.53672-1-joevt@shaw.ca>
References: <20191205073414.53672-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNRI+2yjonfkxDYFUh+DoQZcda613OpF0rHNVmDO9sa+XCCITWfYq1AbNTewEU5yr7FjT9a/mz74d5y3Tr70uw8baeFfGUQiqgKY8696Niy2pyHU1dfD
 6ZmCgEa8Mlb1HQMLkq6niES9CIK05wGDz/04Cbm/SYRVlhRmFNAAboAcVUolDAS+FLPEQn2xb6UaVQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Space character was missing from error message.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index e52822a..5c1a679 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -1480,7 +1480,7 @@ void edid_state::parse_cta_block(const unsigned char *x)
 		fail("Both the serial number and the serial string are set\n");
 	if (!has_cta861_vic_1 && !has_640x480p60_est_timing)
 		fail("Required 640x480p60 timings are missing in the established timings"
-		     "and the SVD list (VIC 1)\n");
+		     " and the SVD list (VIC 1)\n");
 	if ((supported_hdmi_vic_vsb_codes & supported_hdmi_vic_codes) !=
 	    supported_hdmi_vic_codes)
 		fail("HDMI VIC Codes must have their CTA-861 VIC equivalents in the VSB\n");
-- 
2.21.0 (Apple Git-122.2)

