Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1841F418771
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhIZIgW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:36:22 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:37615 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229574AbhIZIgV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:36:21 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id U6HQmeyzXczbLUPcTmV5Ve; Sun, 26 Sep 2021 08:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645285; bh=7fKbMSEs01uEFsGkVJtcAlEb1v3XpiubqdD722oM1FY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=HF+T7mEjy/rfbBvRKhwHjTEbviwznaJhRGaqJddRdpBWmKfJXUP0skToIiTPAjjG2
         SarXOUWnfg+tgnZ5rlhu3jFfe33SMSsWXLLAMZH/CAhzOYQ08vM0+TuNasJac4oAcK
         9tgUQpdGmEh24GefIAPnsVxFdS1DlsNSTmrdopoeviDNV6iBd9F5+s/swaBrMHcpyb
         7SkAVO7OSdssg108q81HomcCdGjpr+28/ORbOQCnueuzbVKaDujKP2+8JkUwqa7ntk
         vwXvCSnax6yWEfRR/NlM+dcI3lf2yDyFK7foiIUmUTReoSs1UMY+zgi1uHoYYOD4cm
         AZxy2arGDdS4g==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPcQm9l35U9pxUPcTmdRJ6; Sun, 26 Sep 2021 08:34:45 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=615030a5
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=2kVt1EyJOXHpImby__wA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 22/29] edid-decode: DisplayID non-0 filler fixes
Date:   Sun, 26 Sep 2021 01:33:23 -0700
Message-Id: <20210926083330.5206-23-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMSYf/bEfKSgHZGtRkmNbJlHIJUQlYGecVYv5/+SwrI/lkbVYidu9MToZ9RqszxS29kV6X0MUXaQFkLDvqXDzKXwdYG2NFOq0S302O5Y7TtObb8VRdRV
 00OuAkYOOcrTA8jYZ4UrCdUmF5zpJVQzEzRQA5ZkeEYbfrY//Mj17ZBaHeaFWLRHeULRVUpznAXIT3jJcuFv3Xud5/QY635WcyY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's probably not a Product Identification Data Block or any kind of block so data_block should be cleared (so that the block name doesn't appear in the Failures section for this fail).
Output hex data because it might contain interesting data (it's at least known to be not zero).

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-displayid-block.cpp | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index 5266bb3..dc2ec7b 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1745,8 +1745,11 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 
 		if (!tag && !len) {
 			// A Product Identification Data Block with no payload bytes is not valid - assume this is the end.
+		data_block.clear(); // Probably not a Product Identification Data Block so clear this.
 		if (!memchk(x, length)) {
+			printf("  Filler:\n");
 				fail("Non-0 filler bytes in the DisplayID block.\n");
+			hex_block("    ", x, length);
 			}
 		return length;
 		}
-- 
2.24.3 (Apple Git-128)

