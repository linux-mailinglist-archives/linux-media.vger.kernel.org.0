Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7331945B871
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 11:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241523AbhKXKhm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 05:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233492AbhKXKhl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 05:37:41 -0500
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9FDC061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 02:34:31 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ppbcmdq25CMnAppbgmvMg1; Wed, 24 Nov 2021 11:34:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637750068; bh=D5o5PJjXGJe4cWIfjdudMr22Gsvm7oBIaLHv47QfP6Y=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pxuxWchMZKdjCy35y0SnSVE6LwsKwgwLA2mJ/Pm54n7vVhBfmC9qG8iQ3iXtNXtiP
         fShJoRsVPCUKWkrKA9S3BCAYI2S9ixY5/hQEa6C9sHDg19G+Fj9pW2K3Kmqb4NPuiK
         F8Q2vLHC1EWqBuMEq9bAM5efhPHUgQd3+fcGMAZBV2HxwnKPrGJH9I5DKEMyki+hSX
         LtqoTd1C2a/BLX5g6nOOUc7EX9eOSJxzBbjpS3J2/iaRrgasxumJOythjuQy5/No6o
         El6lMUVaMV/GPLN4AoR2YzVGbIbMsvdPgEzLwDmk+51N2mJ6ezzwdzAA0g8Hel8pxt
         63e8heBB031Uw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mike Isely <isely@pobox.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] pvrusb2: fix inconsistent indenting
Message-ID: <9e64da73-4b2d-204c-d225-7504b9ebc341@xs4all.nl>
Date:   Wed, 24 Nov 2021 11:34:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFhQKnn778zMC8mSo6Cj83fD4j7AONw2fvsSsdv6JkfTmKAF6jnrO0vpLCB3EiQ4n4tqUlkWd8aCqYLTdVe7ei2Do4PL8HI1GoeJ06gUx8p3ZCukaWNt
 11VSTodeH5KRw3bQL0B1ryxTfs3j7RbGhH1Pa1UHVXimvRPahfDFJWSOaloD2ee07izvSa2eUyQRp5KkymugJcFUVLs8dsOenP6+5U9BJ3WNoICOxVPuN8ON
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix these smatch warnings:

drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c |  4 +--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c     | 33 +++++++++++----------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
index f6005d1296ef..c8102772344b 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
@@ -188,8 +188,8 @@ static int pvr2_encoder_cmd(void *ctxt,
 	}


-	LOCK_TAKE(hdw->ctl_lock); while (1) {
-
+	LOCK_TAKE(hdw->ctl_lock);
+	while (1) {
 		if (!hdw->state_encoder_ok) {
 			ret = -EIO;
 			break;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 3915d551d59e..cd7b118d5929 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -1718,16 +1718,16 @@ int pvr2_hdw_get_streaming(struct pvr2_hdw *hdw)
 int pvr2_hdw_set_streaming(struct pvr2_hdw *hdw,int enable_flag)
 {
 	int ret,st;
-	LOCK_TAKE(hdw->big_lock); do {
-		pvr2_hdw_untrip_unlocked(hdw);
-		if ((!enable_flag) != !(hdw->state_pipeline_req)) {
-			hdw->state_pipeline_req = enable_flag != 0;
-			pvr2_trace(PVR2_TRACE_START_STOP,
-				   "/*--TRACE_STREAM--*/ %s",
-				   enable_flag ? "enable" : "disable");
-		}
-		pvr2_hdw_state_sched(hdw);
-	} while (0); LOCK_GIVE(hdw->big_lock);
+	LOCK_TAKE(hdw->big_lock);
+	pvr2_hdw_untrip_unlocked(hdw);
+	if (!enable_flag != !hdw->state_pipeline_req) {
+		hdw->state_pipeline_req = enable_flag != 0;
+		pvr2_trace(PVR2_TRACE_START_STOP,
+			   "/*--TRACE_STREAM--*/ %s",
+			   enable_flag ? "enable" : "disable");
+	}
+	pvr2_hdw_state_sched(hdw);
+	LOCK_GIVE(hdw->big_lock);
 	if ((ret = pvr2_hdw_wait(hdw,0)) < 0) return ret;
 	if (enable_flag) {
 		while ((st = hdw->master_state) != PVR2_STATE_RUN) {
@@ -3394,7 +3394,8 @@ void pvr2_hdw_cpufw_set_enabled(struct pvr2_hdw *hdw,
 	int ret;
 	u16 address;
 	unsigned int pipe;
-	LOCK_TAKE(hdw->big_lock); do {
+	LOCK_TAKE(hdw->big_lock);
+	do {
 		if ((hdw->fw_buffer == NULL) == !enable_flag) break;

 		if (!enable_flag) {
@@ -3457,8 +3458,8 @@ void pvr2_hdw_cpufw_set_enabled(struct pvr2_hdw *hdw,
 			pvr2_trace(PVR2_TRACE_FIRMWARE,
 				   "Done sucking down EEPROM contents");
 		}
-
-	} while (0); LOCK_GIVE(hdw->big_lock);
+	} while (0);
+	LOCK_GIVE(hdw->big_lock);
 }


@@ -3473,7 +3474,8 @@ int pvr2_hdw_cpufw_get(struct pvr2_hdw *hdw,unsigned int offs,
 		       char *buf,unsigned int cnt)
 {
 	int ret = -EINVAL;
-	LOCK_TAKE(hdw->big_lock); do {
+	LOCK_TAKE(hdw->big_lock);
+	do {
 		if (!buf) break;
 		if (!cnt) break;

@@ -3498,7 +3500,8 @@ int pvr2_hdw_cpufw_get(struct pvr2_hdw *hdw,unsigned int offs,
 			   "Read firmware data offs=%d cnt=%d",
 			   offs,cnt);
 		ret = cnt;
-	} while (0); LOCK_GIVE(hdw->big_lock);
+	} while (0);
+	LOCK_GIVE(hdw->big_lock);

 	return ret;
 }
-- 
2.33.0

