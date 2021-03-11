Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B0F336FCB
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbhCKKUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:50 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45183 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232288AbhCKKUd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQilKo74; Thu, 11 Mar 2021 11:20:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458032; bh=qNxrkRMXKi/bb8P+7RX0kKhuYKLfo/iim0B/1Ob2i9o=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=SRgwXo91GcSIrhMEO63D5e/ar/efchBfNCmtLEiwx65Td9zwOww6wgHp/vXzVZVhK
         YhKMvR33kHLVA0NypGN3YDK76ZQ9vAKvedP8yDj9M9WE9dRvNfEa+MqQe5kdlgWrt0
         EHrOJ917k444bOunVAc3eV7Kw6W9TREmctrhyManc2tKO6d8COGp5JUfsPHHkUpl1Y
         TOsmh5lPb25GE7yQ2wO/eYr9wi5vHpUx9YrAYachiGB+tGflF5boHjGrLrmxfTqa07
         3+E7dMymCB68cA/w2HRi0oGCmM2ZyqTpIzEFQSgNg5u4+GJaeGE+fFNosSsnD8DK7d
         mijRNhusXEGGQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eizan Miyamoto <eizan@chromium.org>
Subject: [PATCH 11/13] mtk-mdp: fix kernel-doc warnings
Date:   Thu, 11 Mar 2021 11:20:20 +0100
Message-Id: <20210311102022.96954-12-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLx/wZwxglH1uzuHex+D9yPTHmOkKy+SuzZvsDHT2L6/ezlgzzQVdjD+PlAAZMzllcKYQ5c4qUTmHj2G4OkzL98CahcH21lsSFDzFqVOF2Z2y/Q3o1jb
 dcAA34jTR3cGFqG4XbtvsAHrspmJ3CLeBG2MJ/QqLES/llMOot1TY3H8wAbM8esS7N7aONHeRdAe9obEZTObpS6wpAxCbPdMq0nHj9PMahP58a1VxL80mh0Y
 xROt9vOB803iTlfsvctQYWwPHtBpVik0BsZ5/tx0HuM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mtk_mdp_comp.h: MTK_MDP_COMP_TYPE_MAX was undocumented, but it
is also unused, so just remove it.

mtk_mdp_core.h: add missing '*' inside comment blocks, add a
missing : after '@ctrls' and add a missing struct keyword.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Eizan Miyamoto <eizan@chromium.org>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h | 10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 1bf0242cce46..7897766c96bb 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -19,7 +19,6 @@ enum mtk_mdp_comp_type {
 	MTK_MDP_RSZ,
 	MTK_MDP_WDMA,
 	MTK_MDP_WROT,
-	MTK_MDP_COMP_TYPE_MAX,
 };
 
 /**
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
index a7da14b97077..a6e6dc36307b 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
@@ -52,8 +52,8 @@ struct mtk_mdp_pix_align {
  * @depth: per plane driver's private 'number of bits per pixel'
  * @row_depth: per plane driver's private 'number of bits per pixel per row'
  * @flags: flags indicating which operation mode format applies to
-	   MTK_MDP_FMT_FLAG_OUTPUT is used in OUTPUT stream
-	   MTK_MDP_FMT_FLAG_CAPTURE is used in CAPTURE stream
+ *	   MTK_MDP_FMT_FLAG_OUTPUT is used in OUTPUT stream
+ *	   MTK_MDP_FMT_FLAG_CAPTURE is used in CAPTURE stream
  * @align: pointer to a pixel alignment struct, NULL if using default value
  */
 struct mtk_mdp_fmt {
@@ -168,14 +168,14 @@ struct mtk_mdp_dev {
 };
 
 /**
- * mtk_mdp_ctx - the device context data
+ * struct mtk_mdp_ctx - the device context data
  * @list:		link to ctx_list of mtk_mdp_dev
  * @s_frame:		source frame properties
  * @d_frame:		destination frame properties
  * @id:			index of the context that this structure describes
  * @flags:		additional flags for image conversion
  * @state:		flags to keep track of user configuration
-			Protected by slock
+ *			Protected by slock
  * @rotation:		rotates the image by specified angle
  * @hflip:		mirror the picture horizontally
  * @vflip:		mirror the picture vertically
@@ -183,7 +183,7 @@ struct mtk_mdp_dev {
  * @m2m_ctx:		memory-to-memory device context
  * @fh:			v4l2 file handle
  * @ctrl_handler:	v4l2 controls handler
- * @ctrls		image processor control set
+ * @ctrls:		image processor control set
  * @ctrls_rdy:		true if the control handler is initialized
  * @colorspace:		enum v4l2_colorspace; supplemental to pixelformat
  * @ycbcr_enc:		enum v4l2_ycbcr_encoding, Y'CbCr encoding
-- 
2.30.1

