Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4DB58ECA8
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 15:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbiHJNCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 09:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232445AbiHJNBc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 09:01:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E95861D7E
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 06:01:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29F4B61425
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 13:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF950C433C1;
        Wed, 10 Aug 2022 13:01:29 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/6] media/pci/ngene/ngene.h: remove #ifdef NGENE_V4L
Date:   Wed, 10 Aug 2022 15:01:22 +0200
Message-Id: <20220810130127.2707169-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810130127.2707169-1-hverkuil-cisco@xs4all.nl>
References: <20220810130127.2707169-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the dead code under NGENE_V4L.

Among others, this removes references to the old videobuf framework
that isn't actually used by this driver.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/ngene/ngene.h | 78 ---------------------------------
 1 file changed, 78 deletions(-)

diff --git a/drivers/media/pci/ngene/ngene.h b/drivers/media/pci/ngene/ngene.h
index 3d296f1998a1..d1d7da84cd9d 100644
--- a/drivers/media/pci/ngene/ngene.h
+++ b/drivers/media/pci/ngene/ngene.h
@@ -596,43 +596,6 @@ struct mychip {
 	int capture_source[MIXER_ADDR_LAST + 1][2];
 };
 
-#ifdef NGENE_V4L
-struct ngene_overlay {
-	int                    tvnorm;
-	struct v4l2_rect       w;
-	enum v4l2_field        field;
-	struct v4l2_clip       *clips;
-	int                    nclips;
-	int                    setup_ok;
-};
-
-struct ngene_tvnorm {
-	int   v4l2_id;
-	char  *name;
-	u16   swidth, sheight; /* scaled standard width, height */
-	int   tuner_norm;
-	int   soundstd;
-};
-
-struct ngene_vopen {
-	struct ngene_channel      *ch;
-	enum v4l2_priority         prio;
-	int                        width;
-	int                        height;
-	int                        depth;
-	struct videobuf_queue      vbuf_q;
-	struct videobuf_queue      vbi;
-	int                        fourcc;
-	int                        picxcount;
-	int                        resources;
-	enum v4l2_buf_type         type;
-	const struct ngene_format *fmt;
-
-	const struct ngene_format *ovfmt;
-	struct ngene_overlay       ov;
-};
-#endif
-
 struct ngene_channel {
 	struct device         device;
 	struct i2c_adapter    i2c_adapter;
@@ -709,18 +672,6 @@ struct ngene_channel {
 	int                   tvnorm_num;
 	int                   tvnorm;
 
-#ifdef NGENE_V4L
-	int                   videousers;
-	struct v4l2_prio_state prio;
-	struct ngene_vopen    init;
-	int                   resources;
-	struct v4l2_framebuffer fbuf;
-	struct ngene_buffer  *screen;     /* overlay             */
-	struct list_head      capture;    /* video capture queue */
-	spinlock_t s_lock;
-	struct semaphore reslock;
-#endif
-
 	int running;
 
 	int tsin_offset;
@@ -863,35 +814,6 @@ struct ngene_info {
 	int (*switch_ctrl)(struct ngene_channel *, int, int);
 };
 
-#ifdef NGENE_V4L
-struct ngene_format {
-	char *name;
-	int   fourcc;          /* video4linux 2      */
-	int   btformat;        /* BT848_COLOR_FMT_*  */
-	int   format;
-	int   btswap;          /* BT848_COLOR_CTL_*  */
-	int   depth;           /* bit/pixel          */
-	int   flags;
-	int   hshift, vshift;  /* for planar modes   */
-	int   palette;
-};
-
-#define RESOURCE_OVERLAY       1
-#define RESOURCE_VIDEO         2
-#define RESOURCE_VBI           4
-
-struct ngene_buffer {
-	/* common v4l buffer stuff -- must be first */
-	struct videobuf_buffer     vb;
-
-	/* ngene specific */
-	const struct ngene_format *fmt;
-	int                        tvnorm;
-	int                        btformat;
-	int                        btswap;
-};
-#endif
-
 
 /* Provided by ngene-core.c */
 int ngene_probe(struct pci_dev *pci_dev, const struct pci_device_id *id);
-- 
2.35.1

