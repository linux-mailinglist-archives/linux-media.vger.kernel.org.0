Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE136C6CA7
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 16:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232204AbjCWPyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 11:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbjCWPyK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 11:54:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02C91E1E2
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 08:53:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4997C627C5
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 15:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2836DC4339C;
        Thu, 23 Mar 2023 15:53:52 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 07/19] staging: media: av7110: replace BUG_ON by WARN_ON
Date:   Thu, 23 Mar 2023 16:53:31 +0100
Message-Id: <20230323155343.2399473-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
References: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
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
2.39.2

