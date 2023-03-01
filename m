Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D703C6A6B98
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 12:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjCALTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 06:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjCALTD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 06:19:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1FA2A991
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 03:19:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56DB1B80FF2
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 11:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5080AC4339C;
        Wed,  1 Mar 2023 11:18:59 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 7/9] videodev.h: drop V4L2_FBUF_CAP_LIST/BITMAP_CLIPPING
Date:   Wed,  1 Mar 2023 12:18:48 +0100
Message-Id: <20230301111850.607515-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
References: <20230301111850.607515-1-hverkuil-cisco@xs4all.nl>
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

These two capabilities are no longer supported, so no
longer define them when compiling the kernel.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/uapi/linux/videodev2.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 1befd181a4cc..ba36faada5ae 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1213,8 +1213,10 @@ struct v4l2_framebuffer {
 /*  Flags for the 'capability' field. Read only */
 #define V4L2_FBUF_CAP_EXTERNOVERLAY	0x0001
 #define V4L2_FBUF_CAP_CHROMAKEY		0x0002
+#ifndef __KERNEL__
 #define V4L2_FBUF_CAP_LIST_CLIPPING     0x0004
 #define V4L2_FBUF_CAP_BITMAP_CLIPPING	0x0008
+#endif
 #define V4L2_FBUF_CAP_LOCAL_ALPHA	0x0010
 #define V4L2_FBUF_CAP_GLOBAL_ALPHA	0x0020
 #define V4L2_FBUF_CAP_LOCAL_INV_ALPHA	0x0040
-- 
2.39.1

