Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06FFA665A0E
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 12:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbjAKLZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 06:25:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232575AbjAKLYk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 06:24:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FC817413
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 03:24:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1017F61BB9
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 11:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB2BC433D2;
        Wed, 11 Jan 2023 11:24:37 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 15/16] dvb_demux.h: remove av7110-private fields
Date:   Wed, 11 Jan 2023 12:24:17 +0100
Message-Id: <20230111112418.687882-16-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111112418.687882-1-hverkuil-cisco@xs4all.nl>
References: <20230111112418.687882-1-hverkuil-cisco@xs4all.nl>
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

This driver has been removed, so we can remove these private fields
as well.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/dvb-core/dvb_demux.c | 2 --
 include/media/dvb_demux.h          | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index 398c86279b5b..b380da460295 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -1273,8 +1273,6 @@ int dvb_dmx_init(struct dvb_demux *dvbdemux)
 
 	INIT_LIST_HEAD(&dvbdemux->feed_list);
 
-	dvbdemux->playing = 0;
-	dvbdemux->recording = 0;
 	dvbdemux->tsbufp = 0;
 
 	if (!dvbdemux->check_crc32)
diff --git a/include/media/dvb_demux.h b/include/media/dvb_demux.h
index 3b6aeca7a49e..1580de3dbc80 100644
--- a/include/media/dvb_demux.h
+++ b/include/media/dvb_demux.h
@@ -86,9 +86,6 @@ struct dvb_demux_filter {
 	int index;
 	enum dvb_dmx_state state;
 	enum dvb_dmx_filter_type type;
-
-	/* private: used only by av7110 */
-	u16 hw_handle;
 };
 
 /**
@@ -235,10 +232,6 @@ struct dvb_demux {
 
 	ktime_t speed_last_time; /* for TS speed check */
 	uint32_t speed_pkts_cnt; /* for TS speed check */
-
-	/* private: used only on av7110 */
-	int playing;
-	int recording;
 };
 
 /**
-- 
2.39.0

