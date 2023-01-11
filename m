Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44782665977
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 11:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238726AbjAKKxx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 05:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238134AbjAKKxR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 05:53:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211822603
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 02:53:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BA57AB81BAD
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 10:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5F3C433D2;
        Wed, 11 Jan 2023 10:53:13 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 11/13] dvbdev.h: remove DVB_DEVICE_VIDEO/AUDIO/OSD
Date:   Wed, 11 Jan 2023 11:52:56 +0100
Message-Id: <20230111105258.547471-12-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111105258.547471-1-hverkuil-cisco@xs4all.nl>
References: <20230111105258.547471-1-hverkuil-cisco@xs4all.nl>
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

Now that the av7110 driver has been removed, we can also remove
these old defines.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/admin-guide/media/dvb_intro.rst |  8 +-------
 drivers/media/dvb-core/dvbdev.c               |  6 ------
 include/media/dvbdev.h                        | 11 -----------
 3 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/Documentation/admin-guide/media/dvb_intro.rst b/Documentation/admin-guide/media/dvb_intro.rst
index 44eac9b3be6c..392fd7e247cc 100644
--- a/Documentation/admin-guide/media/dvb_intro.rst
+++ b/Documentation/admin-guide/media/dvb_intro.rst
@@ -77,15 +77,9 @@ Depending on the card's feature set, the Device Driver API could also
 expose other device nodes:
 
 * /dev/dvb/adapter0/ca0
-* /dev/dvb/adapter0/audio0
 * /dev/dvb/adapter0/net0
-* /dev/dvb/adapter0/osd0
-* /dev/dvb/adapter0/video0
 
-The ``/dev/dvb/adapter0/ca0`` is used to decode encrypted channels. The
-other device nodes are found only on devices that use the av7110
-driver, with is now obsoleted, together with the extra API whose such
-devices use.
+The ``/dev/dvb/adapter0/ca0`` is used to decode encrypted channels.
 
 Receiving a digital TV channel
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 0ed087caf7f3..04ea6e4f0f3c 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -42,15 +42,12 @@ static LIST_HEAD(dvb_adapter_list);
 static DEFINE_MUTEX(dvbdev_register_lock);
 
 static const char * const dnames[] = {
-	[DVB_DEVICE_VIDEO] =		"video",
-	[DVB_DEVICE_AUDIO] =		"audio",
 	[DVB_DEVICE_SEC] =		"sec",
 	[DVB_DEVICE_FRONTEND] =		"frontend",
 	[DVB_DEVICE_DEMUX] =		"demux",
 	[DVB_DEVICE_DVR] =		"dvr",
 	[DVB_DEVICE_CA] =		"ca",
 	[DVB_DEVICE_NET] =		"net",
-	[DVB_DEVICE_OSD] =		"osd"
 };
 
 #ifdef CONFIG_DVB_DYNAMIC_MINORS
@@ -60,15 +57,12 @@ static const char * const dnames[] = {
 #define DVB_MAX_IDS		4
 
 static const u8 minor_type[] = {
-       [DVB_DEVICE_VIDEO]      = 0,
-       [DVB_DEVICE_AUDIO]      = 1,
        [DVB_DEVICE_SEC]        = 2,
        [DVB_DEVICE_FRONTEND]   = 3,
        [DVB_DEVICE_DEMUX]      = 4,
        [DVB_DEVICE_DVR]        = 5,
        [DVB_DEVICE_CA]         = 6,
        [DVB_DEVICE_NET]        = 7,
-       [DVB_DEVICE_OSD]        = 8,
 };
 
 #define nums2minor(num, type, id) \
diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index 29d25c8a6f13..d5fc1a1986e7 100644
--- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -46,13 +46,6 @@
  * @DVB_DEVICE_DVR:		Digital TV digital video record (DVR).
  * @DVB_DEVICE_CA:		Digital TV Conditional Access (CA).
  * @DVB_DEVICE_NET:		Digital TV network.
- *
- * @DVB_DEVICE_VIDEO:		Digital TV video decoder.
- *				Deprecated. Used only on av7110-av.
- * @DVB_DEVICE_AUDIO:		Digital TV audio decoder.
- *				Deprecated. Used only on av7110-av.
- * @DVB_DEVICE_OSD:		Digital TV On Screen Display (OSD).
- *				Deprecated. Used only on av7110.
  */
 enum dvb_device_type {
 	DVB_DEVICE_SEC,
@@ -61,10 +54,6 @@ enum dvb_device_type {
 	DVB_DEVICE_DVR,
 	DVB_DEVICE_CA,
 	DVB_DEVICE_NET,
-
-	DVB_DEVICE_VIDEO,
-	DVB_DEVICE_AUDIO,
-	DVB_DEVICE_OSD,
 };
 
 #define DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr) \
-- 
2.39.0

