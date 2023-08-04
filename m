Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2655776FF27
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 13:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbjHDLBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 07:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbjHDLAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 07:00:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91BD4EDE
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 03:59:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4985661F94
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 10:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61522C433C7
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 10:59:12 +0000 (UTC)
Message-ID: <3749dea8-09c2-658d-68a4-19f7a8e06856@xs4all.nl>
Date:   Fri, 4 Aug 2023 12:59:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: usb: pvrusb2: fix inconsistent indenting
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This resolves a new smatch warning;

drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 75c89b07e86a..29cc207194b9 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -3285,12 +3285,14 @@ int pvr2_hdw_get_cropcap(struct pvr2_hdw *hdw, struct v4l2_cropcap *pp)
 /* Return information about the tuner */
 int pvr2_hdw_get_tuner_status(struct pvr2_hdw *hdw,struct v4l2_tuner *vtp)
 {
-	LOCK_TAKE(hdw->big_lock); do {
+	LOCK_TAKE(hdw->big_lock);
+	do {
 		if (hdw->tuner_signal_stale) {
 			pvr2_hdw_status_poll(hdw);
 		}
 		memcpy(vtp,&hdw->tuner_signal_info,sizeof(struct v4l2_tuner));
-	} while (0); LOCK_GIVE(hdw->big_lock);
+	} while (0);
+	LOCK_GIVE(hdw->big_lock);
 	return 0;
 }

-- 
2.40.1

