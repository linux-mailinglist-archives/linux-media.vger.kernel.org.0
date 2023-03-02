Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E246A831E
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 14:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjCBNDl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 08:03:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjCBNDk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 08:03:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A235919F2B
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 05:03:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5AE4FB811F3
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 13:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A53BC4339B;
        Thu,  2 Mar 2023 13:03:36 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 04/17] staging: media: av7110: replace BUG_ON by WARN_ON
Date:   Thu,  2 Mar 2023 14:03:17 +0100
Message-Id: <20230302130330.1125172-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
References: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
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

No need for BUG_ON, WARN_ON is a lot friendlier.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/av7110/av7110.c    | 6 ++++--
 drivers/staging/media/av7110/av7110_hw.c | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index df81a9b744c2..a5a431c14ea7 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1106,9 +1106,11 @@ static int dvb_get_stc(struct dmx_demux *demux, unsigned int num,
 	struct av7110 *av7110;
 
 	/* pointer casting paranoia... */
-	BUG_ON(!demux);
+	if (WARN_ON(!demux))
+		return -EIO;
 	dvbdemux = demux->priv;
-	BUG_ON(!dvbdemux);
+	if (WARN_ON(!dvbdemux))
+		return -EIO;
 	av7110 = dvbdemux->priv;
 
 	dprintk(4, "%p\n", av7110);
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/media/av7110/av7110_hw.c
index 93ca31e38ddd..a0be37717259 100644
--- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -1007,7 +1007,8 @@ static int OSDSetBlock(struct av7110 *av7110, int x0, int y0,
 
 	if (av7110->bmp_state == BMP_LOADING) {
 		/* possible if syscall is repeated by -ERESTARTSYS and if firmware cannot abort */
-		BUG_ON (FW_VERSION(av7110->arm_app) >= 0x261e);
+		if (WARN_ON(FW_VERSION(av7110->arm_app) >= 0x261e))
+			return -EIO;
 		rc = WaitUntilBmpLoaded(av7110);
 		if (rc)
 			return rc;
-- 
2.39.1

