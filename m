Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D1E40AD61
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbhINMUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:20:03 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:54812 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232865AbhINMUA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:20:00 -0400
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id PpLxmzRdxps7PQ7HjmGPUr; Tue, 14 Sep 2021 12:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631621495; bh=fd+eZviUQarNNvgOrI8lsYyJLLboBowTzurihqHiSuY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=UDkQ8eGiKsSzR3JgMFLNQWS8B3kimHaUCbzgRuiEZXM/qp/kHrqsxns1Qgym82gNq
         G4b9po1w+XN02gGyCz1KPqfiXE98MV4ecym75Iwmonm9cU6qg09vSaql/o0DretXk1
         7S2k0fSFxXneVNdGs/vC54BITPT/P2+4o8hrEZyrcwXW42k87ny0BuZLb/39F1Zfg8
         ivgOzh5gxTxroDjFp52+Y52WbLSK3OiKsjsr6AuV4HKsNgf+qLQw6Nv6ZpSJWmWdPM
         c6w+tWQm+PV17TGutumZFG7cODW1yRrVBsAdaAUZ5hV+E2m5/qb/FLx1QE2wAr9m2i
         HUkwVAswtji+w==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id Q7Hdmcu7dcHSBQ7Himpv12; Tue, 14 Sep 2021 12:11:35 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61409177
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=oQ9W4QiKeHPeSB6vl44A:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 06/11] edid-decode: linefeed before fail
Date:   Tue, 14 Sep 2021 05:11:24 -0700
Message-Id: <20210914121129.51451-7-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210914121129.51451-1-joevt@shaw.ca>
References: <20210914121129.51451-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNrjUQAZyNVYZxAgiJFVPxcFej2K5CIOnSPeakpm7sfQfeTpkFkOLj7J3vOkbCvNL9yNJ1lsSd7Syzhb5KuMjakAiJlryVfFGfv5znRcvMxigs4qv7it
 Ge1OUTz46QGbHveQ88Tj6+oLvdRJQ3cBHf796IO+y8ZTRhhJI2v8s55yGgK2qnT3bGP11uStngMfFkG/prjNDwHWvSQqP8OeCXs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Always output linefeed before fail message. See example dell-up2715k-dp1-optomedia-cmv535.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-base-block.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parse-base-block.cpp b/parse-base-block.cpp
index 32d2079..5840fd8 100644
--- a/parse-base-block.cpp
+++ b/parse-base-block.cpp
@@ -700,9 +700,9 @@ void edid_state::detailed_display_range_limits(const unsigned char *x)
 		base.max_display_pixclk_khz = x[9] * 10000;
 		printf(", max dotclock %d MHz\n", x[9] * 10);
 	} else {
+		printf("\n");
 		if (base.edid_minor >= 4)
 			fail("EDID 1.4 block does not set max dotclock.\n");
-		printf("\n");
 	}
 
 	if (has_sec_gtf) {
-- 
2.24.3 (Apple Git-128)

