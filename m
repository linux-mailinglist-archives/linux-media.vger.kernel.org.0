Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5405107F6C
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfKWQqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:46:17 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.138]:37152 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbfKWQqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:46:16 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id YYXziRYDERnrKYYY3iYY1F; Sat, 23 Nov 2019 09:46:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527575;
        bh=wtC6XX3sKWCeRGLsI8xkJDFX/3yt6H8wpQGBSPJXp4w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=G0KjjcVp9YFFOO97MjNL/CH3RYi6hFtXW8l+e1xwlP8kVJEfj4JObaCe7qN6cnoXc
         XM95JnL0IfgY0V5+EaA5+d8ehpjMfoex/a7Clv6Tpcssw18bwhc5HyB7NUlOcc7bMD
         97FuugtX1woQMUyLJwVlMbGrxT/KL2EmebqTAZVqGSb9gC33yJ2myx8hwZX2BNbXyU
         DhhviWFRe+QiIm+46AZBl0Wh9t00iG3JaJ/bD7k/w9BUI2o0oJuDCcJGLr1pT+LRa9
         j1Is+IV72R9ke204JoRv0ZFhOMHXz+6jpJtyKhwstE1CAq20LpGROC3jntsl4BQm+X
         Y3AUgZTTg9ILg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527575;
        bh=wtC6XX3sKWCeRGLsI8xkJDFX/3yt6H8wpQGBSPJXp4w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=G0KjjcVp9YFFOO97MjNL/CH3RYi6hFtXW8l+e1xwlP8kVJEfj4JObaCe7qN6cnoXc
         XM95JnL0IfgY0V5+EaA5+d8ehpjMfoex/a7Clv6Tpcssw18bwhc5HyB7NUlOcc7bMD
         97FuugtX1woQMUyLJwVlMbGrxT/KL2EmebqTAZVqGSb9gC33yJ2myx8hwZX2BNbXyU
         DhhviWFRe+QiIm+46AZBl0Wh9t00iG3JaJ/bD7k/w9BUI2o0oJuDCcJGLr1pT+LRa9
         j1Is+IV72R9ke204JoRv0ZFhOMHXz+6jpJtyKhwstE1CAq20LpGROC3jntsl4BQm+X
         Y3AUgZTTg9ILg==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=_r8jtnByQG3AnPmwQugA:9
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, joevt <joevt@shaw.ca>
Subject: [PATCH 03/10] edid-decode: correct calculation of DisplayID type 1 timings
Date:   Sat, 23 Nov 2019 08:45:57 -0800
Message-Id: <20191123164604.268-4-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191123164604.268-1-joevt@shaw.ca>
References: <20191123164604.268-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOY6nnjBSesckqm77OB5dyWnLm6UQqNHBC7vZ047/8VRMvM6rNflFdVjf6nubFnhlRqoWuSaML5TpDL7gY6UtKQ9Pk5mYHLY/Ck9TSN39sE3kukH3vL+
 3vxf2yAYlkIAJKUDOtsw1JO9FDvEwO4CMcloVDH5RyAXMv0G7K9p+3yC/+wlJXV5bal3MLmvPjTsW9WVRaM91d6qU+HCWJvN14g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix DisplayID type 1 timing calculations which is missing the +1 increment for pix_clock,ha,hbl,hso,hspw,va,vbl,vso,vspw.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/edid-decode.c b/edid-decode.c
index b2e57a3..e1386ce 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -2550,6 +2550,18 @@ static void parse_displayid_detailed_timing(const unsigned char *x)
 	vspw = x[18] | (x[19] << 8);
 	pvsync = ((x[17] >> 7) & 0x1 ) ? '+' : '-';
 
+	pix_clock++;
+
+	ha++;
+	hbl++;
+	hso++;
+	hspw++;
+	
+	va++;
+	vbl++;
+	vso++;
+	vspw++;
+	
 	printf("  Detailed mode: Clock %.3f MHz, %u mm x %u mm\n"
 	       "                 %4u %4u %4u %4u\n"
 	       "                 %4u %4u %4u %4u\n"
-- 
2.21.0 (Apple Git-122.2)

