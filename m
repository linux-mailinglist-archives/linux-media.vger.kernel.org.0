Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30E6E67CF37
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjAZPHN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:07:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbjAZPHK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:07:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F169D6BBCD
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:07:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AC714B81E06
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9D8C433D2;
        Thu, 26 Jan 2023 15:07:06 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 06/17] media: dvb-frontends: cxd2880: return 0 instead of 'ret'.
Date:   Thu, 26 Jan 2023 16:06:46 +0100
Message-Id: <20230126150657.367921-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since 'ret' is known to be 0, just return '0'. This fixes 10 smatch warnings:

cxd2880_tnrdmd_dvbt.c:836 cxd2880_tnrdmd_dvbt_check_demod_lock() warn: missing error code? 'ret'
cxd2880_tnrdmd_dvbt.c:841 cxd2880_tnrdmd_dvbt_check_demod_lock() warn: missing error code? 'ret'
cxd2880_tnrdmd_dvbt.c:896 cxd2880_tnrdmd_dvbt_check_ts_lock() warn: missing error code? 'ret'
cxd2880_tnrdmd_dvbt.c:901 cxd2880_tnrdmd_dvbt_check_ts_lock() warn: missing error code? 'ret'
cxd2880_tnrdmd_dvbt.c:904 cxd2880_tnrdmd_dvbt_check_ts_lock() warn: missing error code? 'ret'
cxd2880_tnrdmd_dvbt2.c:1027 cxd2880_tnrdmd_dvbt2_check_demod_lock() warn: missing error code? 'ret'
cxd2880_tnrdmd_dvbt2.c:1032 cxd2880_tnrdmd_dvbt2_check_demod_lock() warn: missing error code? 'ret'
cxd2880_tnrdmd_dvbt2.c:1087 cxd2880_tnrdmd_dvbt2_check_ts_lock() warn: missing error code? 'ret'
cxd2880_tnrdmd_dvbt2.c:1092 cxd2880_tnrdmd_dvbt2_check_ts_lock() warn: missing error code? 'ret'
cxd2880_tnrdmd_dvbt2.c:1095 cxd2880_tnrdmd_dvbt2_check_ts_lock() warn: missing error code? 'ret'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 .../dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt.c    | 14 +++++++-------
 .../dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2.c   | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt.c
index fe3c6f8b1b3e..c7e79da8c432 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt.c
@@ -833,12 +833,12 @@ int cxd2880_tnrdmd_dvbt_check_demod_lock(struct cxd2880_tnrdmd
 		else
 			*lock = CXD2880_TNRDMD_LOCK_RESULT_NOTDETECT;
 
-		return ret;
+		return 0;
 	}
 
 	if (sync_stat == 6) {
 		*lock = CXD2880_TNRDMD_LOCK_RESULT_LOCKED;
-		return ret;
+		return 0;
 	}
 
 	ret =
@@ -854,7 +854,7 @@ int cxd2880_tnrdmd_dvbt_check_demod_lock(struct cxd2880_tnrdmd
 	else
 		*lock = CXD2880_TNRDMD_LOCK_RESULT_NOTDETECT;
 
-	return ret;
+	return 0;
 }
 
 int cxd2880_tnrdmd_dvbt_check_ts_lock(struct cxd2880_tnrdmd
@@ -893,15 +893,15 @@ int cxd2880_tnrdmd_dvbt_check_ts_lock(struct cxd2880_tnrdmd
 		else
 			*lock = CXD2880_TNRDMD_LOCK_RESULT_NOTDETECT;
 
-		return ret;
+		return 0;
 	}
 
 	if (ts_lock) {
 		*lock = CXD2880_TNRDMD_LOCK_RESULT_LOCKED;
-		return ret;
+		return 0;
 	} else if (!unlock_detected) {
 		*lock = CXD2880_TNRDMD_LOCK_RESULT_NOTDETECT;
-		return ret;
+		return 0;
 	}
 
 	ret =
@@ -915,5 +915,5 @@ int cxd2880_tnrdmd_dvbt_check_ts_lock(struct cxd2880_tnrdmd
 	else
 		*lock = CXD2880_TNRDMD_LOCK_RESULT_NOTDETECT;
 
-	return ret;
+	return 0;
 }
diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2.c
index dd32004a12d8..a9ab983348c8 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2.c
@@ -1024,12 +1024,12 @@ int cxd2880_tnrdmd_dvbt2_check_demod_lock(struct cxd2880_tnrdmd
 		else
 			*lock = CXD2880_TNRDMD_LOCK_RESULT_NOTDETECT;
 
-		return ret;
+		return 0;
 	}
 
 	if (sync_stat == 6) {
 		*lock = CXD2880_TNRDMD_LOCK_RESULT_LOCKED;
-		return ret;
+		return 0;
 	}
 
 	ret =
@@ -1045,7 +1045,7 @@ int cxd2880_tnrdmd_dvbt2_check_demod_lock(struct cxd2880_tnrdmd
 	else
 		*lock = CXD2880_TNRDMD_LOCK_RESULT_NOTDETECT;
 
-	return ret;
+	return 0;
 }
 
 int cxd2880_tnrdmd_dvbt2_check_ts_lock(struct cxd2880_tnrdmd
@@ -1084,15 +1084,15 @@ int cxd2880_tnrdmd_dvbt2_check_ts_lock(struct cxd2880_tnrdmd
 		else
 			*lock = CXD2880_TNRDMD_LOCK_RESULT_NOTDETECT;
 
-		return ret;
+		return 0;
 	}
 
 	if (ts_lock) {
 		*lock = CXD2880_TNRDMD_LOCK_RESULT_LOCKED;
-		return ret;
+		return 0;
 	} else if (!unlock_detected) {
 		*lock = CXD2880_TNRDMD_LOCK_RESULT_NOTDETECT;
-		return ret;
+		return 0;
 	}
 
 	ret =
@@ -1106,7 +1106,7 @@ int cxd2880_tnrdmd_dvbt2_check_ts_lock(struct cxd2880_tnrdmd
 	else
 		*lock = CXD2880_TNRDMD_LOCK_RESULT_NOTDETECT;
 
-	return ret;
+	return 0;
 }
 
 int cxd2880_tnrdmd_dvbt2_set_plp_cfg(struct cxd2880_tnrdmd
-- 
2.39.0

