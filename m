Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C68E417E41
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344932AbhIXXdd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:33 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:56763 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344739AbhIXXda (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:30 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id TmS9mdUgaczbLTufcmRrW7; Fri, 24 Sep 2021 23:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526316; bh=j76fWglIaXkfahquGvSRBH9ZojoB9Q+Ieie2r7+JesY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=cHJL2LWssfEv9dBwGS2AF9aLaVrXtCahIPWHfm5XQC72jZ3CotJdPVhqVsW35Dw7l
         VYMck4Y8kEM7BWpnOMmepVfMQ09Va8fL0714PKhbTfePXxmL739WfAd/80902HKMGg
         H3Gt5V4D69IbKNLAK9xgwQ/lxn1wdlJH+It61nWVxErO2iI9AXuYMZvvq627FLRTWH
         lyjm+OvkDz1uocVE1jnuDDy3RQ4XOE8NH/QGOxFLHok5f3YgRPMhfrSVYekH9s8YZA
         pwZmC6YeTWq5+mYQOh1rK/W5xG3qiLC8cnS1bbsoyjFPPrSw36fnLy3Y410Y0lT/kN
         LRu7IE+bcVqwg==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufcmYw7y; Fri, 24 Sep 2021 23:31:56 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5fec
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=_zDHQJX43gnR_71ToFUA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 09/28] edid-decode: update Microsoft expected length
Date:   Fri, 24 Sep 2021 16:31:30 -0700
Message-Id: <20210924233149.10028-10-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
References: <20210924233149.10028-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfM6vBya/JtPlqJ+3uLcUigZfWUzkRgLkDxv1WIQbXKP7tmE5PDW+lA9IEQ86cic8KGcDtoTnYhDxmLA/BGnnZQuE/Yzv1yem24vkwOmMr2qQ2gCiTml1
 id+7ZjHOMXk32mRqvXK8VZ8iMx68SUnM1j7fqHALam9+x1HqaR93fEc3Mc2ZDscNolqIEjwgafv7TyxQ/4U91SYMV0X2BYp/bVc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since we excluded the size of the OUI from the length in a previous commit, we need to decrease the expected length accordingly.
See example DELA07B/5F1B08ADB0A0, LENB800/61B4B713B745

Really, length checks should probably be done in the parse function. If length is greater than expected then parse up to the expected length and output the rest as hex with a warning. If length is less than expected then parse up to the length and warn that some expected bytes are missing.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index d6c797d..ea55c99 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2249,7 +2249,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 			cta_amd(x, length);
 			break;
 		}
-		if (oui == 0xca125c && length == 0x15) {
+		if (oui == 0xca125c && length == 0x12) {
 			cta_microsoft(x, length);
 			break;
 		}
-- 
2.24.3 (Apple Git-128)

