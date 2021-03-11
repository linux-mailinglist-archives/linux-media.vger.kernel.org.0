Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF03336FC6
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbhCKKUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:50 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51799 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232287AbhCKKUc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:32 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQglKo6U; Thu, 11 Mar 2021 11:20:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458032; bh=zD8DZonyIpHWHuwKQFh3ozi+YfAWMvfDvdzCBPVNJp4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=pRmCqVly3T9NrdE2AmyG3o0P/BVdWb21s/GCFSyoBAoqurez8638DgE4wRq2U7RKz
         HQJopZjNfkEj4kO8pWVJTQpJF5zEUynWPFtPlxia5PvfXHOf5haB2AFHtRjW14leAv
         ZrNhgHa7vmqw5dOFGGyjDMdYe6yjZZi7OfniJKCdZOhqHYSznnKlTaaTbyCJXUR4rT
         9bKGovbBl+JvMfoKUNERldg37RBIl66sRvqjC0NrTV0OfHzA0HdBI1t9rhfrSYgdlX
         ZkS3ZEEJDBKvlrXjtB1HXfRlYZxGYTcJsGoZid5VmSOOGS5mkHOlVNkGUvud/ve/Xx
         23wyEZenaS7Mw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH 10/13] mtk-jpeg/mtk_jpeg_core.h: fix kernel-doc warnings
Date:   Thu, 11 Mar 2021 11:20:19 +0100
Message-Id: <20210311102022.96954-11-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLx/wZwxglH1uzuHex+D9yPTHmOkKy+SuzZvsDHT2L6/ezlgzzQVdjD+PlAAZMzllcKYQ5c4qUTmHj2G4OkzL98CahcH21lsSFDzFqVOF2Z2y/Q3o1jb
 dcAA34jTR3cGFqG4XbtvsAHrspmJ3CLeBG2MJ/QqLES/llMOot1TY3H8wAbM8esS7N7aONHeRdAe9obEZTObpS6wpAxCbPdMq0mBPRHwHpF6aDXbLG4xY1RQ
 wl+J5osHj35C8CqT42oZbqN3iD8+qhpDDdjVHao/ds8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missing 'struct' keywords and fix typos in two struct member
names.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Xia Jiang <xia.jiang@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 68e634f02e00..595f7f10c9fd 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -45,11 +45,11 @@ enum mtk_jpeg_ctx_state {
 };
 
 /**
- * mtk_jpeg_variant - mtk jpeg driver variant
+ * struct mtk_jpeg_variant - mtk jpeg driver variant
  * @clks:			clock names
  * @num_clks:			numbers of clock
- * @format:			jpeg driver's internal color format
- * @num_format:			number of format
+ * @formats:			jpeg driver's internal color format
+ * @num_formats:		number of formats
  * @qops:			the callback of jpeg vb2_ops
  * @irq_handler:		jpeg irq handler callback
  * @hw_reset:			jpeg hardware reset callback
@@ -75,7 +75,7 @@ struct mtk_jpeg_variant {
 };
 
 /**
- * struct mt_jpeg - JPEG IP abstraction
+ * struct mtk_jpeg_dev - JPEG IP abstraction
  * @lock:		the mutex protecting this structure
  * @hw_lock:		spinlock protecting the hw device resource
  * @workqueue:		decode work queue
@@ -105,7 +105,7 @@ struct mtk_jpeg_dev {
 };
 
 /**
- * struct jpeg_fmt - driver's internal color format data
+ * struct mtk_jpeg_fmt - driver's internal color format data
  * @fourcc:	the fourcc code, 0 if not applicable
  * @hw_format:	hardware format value
  * @h_sample:	horizontal sample count of plane in 4 * 4 pixel image
@@ -127,7 +127,7 @@ struct mtk_jpeg_fmt {
 };
 
 /**
- * mtk_jpeg_q_data - parameters of one queue
+ * struct mtk_jpeg_q_data - parameters of one queue
  * @fmt:	  driver-specific format of this queue
  * @pix_mp:	  multiplanar format
  * @enc_crop_rect:	jpeg encoder crop information
@@ -139,7 +139,7 @@ struct mtk_jpeg_q_data {
 };
 
 /**
- * mtk_jpeg_ctx - the device context data
+ * struct mtk_jpeg_ctx - the device context data
  * @jpeg:		JPEG IP device for this context
  * @out_q:		source (output) queue information
  * @cap_q:		destination (capture) queue queue information
-- 
2.30.1

