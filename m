Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9310417E39
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344108AbhIXXd2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:28 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:36756 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232695AbhIXXd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:27 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id Tq5DmFpKQps7PTufYmwEGn; Fri, 24 Sep 2021 23:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526312; bh=Mkg+GCSYsSnciL68UVjFtP1sBc1Y/KxIcQK8ksuCn7s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=baqHAsBQWfYiENAbwItDlFAIxV5wbrFscUIJv5qjurSFDDUTSXN5/QJ/qLv8Hvq2V
         i63oVDyCMF76Ym9UB/C3TW5oKB4dO9ggSq6q+3dyk/SgH7i7cHvyvC/1QFK6rdB3k4
         7yR/QHeGGsfkmkmN923CLSl9tDL2+b3fkKVHUitrTbv7WWawdqN8LaZzEJqkNr2n4U
         9Dznf9Z/gKeAhSi3N1wrKnhp1hO3Aqf8OqoH1aRCOxZNihGUjOdwuojoFyq9Y6+RrX
         ugtjg6tESsSscUC1nEtBi7Vxg/YX/n4QYAo+dZaPGzIJf3/cla1dlb125AdOfyE+wi
         fUCSTtqrcybjA==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufXmYw6h; Fri, 24 Sep 2021 23:31:52 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5fe8
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=2mh5z2ImN-xkmkKSv0IA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 01/28] edid-decode: remove unnecessary length check
Date:   Fri, 24 Sep 2021 16:31:22 -0700
Message-Id: <20210924233149.10028-2-joevt@shaw.ca>
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

The for loop also checks the length. Nothing will happen if length is zero as expected.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.cpp | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/edid-decode.cpp b/edid-decode.cpp
index d5062dd..d77646d 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -700,9 +700,6 @@ void hex_block(const char *prefix, const unsigned char *x,
 {
 	unsigned i, j;
 
-	if (!length)
-		return;
-
 	for (i = 0; i < length; i += step) {
 		unsigned len = min(step, length - i);
 
-- 
2.24.3 (Apple Git-128)

