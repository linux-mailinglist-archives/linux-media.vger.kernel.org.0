Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E60B336FCA
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbhCKKUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:50 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39781 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232291AbhCKKUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:34 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQilKo7E; Thu, 11 Mar 2021 11:20:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458032; bh=Hy0B6jiqMHFgTtfzVc2eFMIcPgLixh2vldi29+/CjPQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=s8YLljaBf6Cx8VNMI8tK3AWQ8pClpm5zhLLv4wlblnfAQTtM5T30chjur1KIlR1Bj
         5jzLyrfZxk0P/Oh1OzUbg4oF3iDu/hBdWgAlrhNibpbtCVwQ9xDTOwNcQubqOThwHZ
         8SOvzDKJSPr2O9zHW9aIUeu/RRlXiMLxLi47ftoHoDc+PFapmuqxVbgduOMGQl86Vs
         sWfY+/R8pOE+AJ99uVchAXwKtlMRIIsF5H/4qR3aGSCWgX5zGUsEbU7qYbVpU++ZBJ
         5xs/kvheCh4R7WOvTA5spaHDInT86zDDgV1mOxikeuaumNO18uVWhjiH00FR2yGi0M
         7e9XZ4YV2xyiQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>
Subject: [PATCH 12/13] mtk-vcodec: fix kernel-doc warnings
Date:   Thu, 11 Mar 2021 11:20:21 +0100
Message-Id: <20210311102022.96954-13-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLx/wZwxglH1uzuHex+D9yPTHmOkKy+SuzZvsDHT2L6/ezlgzzQVdjD+PlAAZMzllcKYQ5c4qUTmHj2G4OkzL98CahcH21lsSFDzFqVOF2Z2y/Q3o1jb
 dcAA34jTR3cGFuqzRA5shWPnNKNgmY0M8nhCG/dhHNB1UiPJ5ztnhnfLhratyRBVhqmjoWxgh7eMwEkK40f1CSgoqw5jaeYSpRRh8dQfEQZ5dDVKXi3SFg7E
 KXxDII/+jLtW0WQOIxH/mRRzFS8fMOdwTjFNc3KZdLibiDE2y1Qw+Z6ujrTOZIw0L4bfl2fJ+Sr4MXlwv/A5Pw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mtk_vcodec_drv.h:
	It's '@var:', not '@var - '.
	In two places 'struct' was used instead of 'enum'.

vdec_drv_if.h:
	It's '@var:', not '@var :'.
	In one place 'struct' was used instead of 'enum'.

venc_ipi_msg.h:
	It's '@data:', not '@data[8]:', i.e. arrays do not include the
	size in kernel-doc.
	It's '@var:', not 'var:'.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h | 14 +++++++-------
 drivers/media/platform/mtk-vcodec/vdec_drv_if.h    |  8 ++++----
 drivers/media/platform/mtk-vcodec/venc_ipi_msg.h   | 14 +++++++-------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 3dd010cba23e..43be6b5a405a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -59,12 +59,12 @@ enum mtk_instance_type {
 
 /**
  * enum mtk_instance_state - The state of an MTK Vcodec instance.
- * @MTK_STATE_FREE - default state when instance is created
- * @MTK_STATE_INIT - vcodec instance is initialized
- * @MTK_STATE_HEADER - vdec had sps/pps header parsed or venc
+ * @MTK_STATE_FREE: default state when instance is created
+ * @MTK_STATE_INIT: vcodec instance is initialized
+ * @MTK_STATE_HEADER: vdec had sps/pps header parsed or venc
  *			had sps/pps header encoded
- * @MTK_STATE_FLUSH - vdec is flushing. Only used by decoder
- * @MTK_STATE_ABORT - vcodec should be aborted
+ * @MTK_STATE_FLUSH: vdec is flushing. Only used by decoder
+ * @MTK_STATE_ABORT: vcodec should be aborted
  */
 enum mtk_instance_state {
 	MTK_STATE_FREE = 0,
@@ -75,7 +75,7 @@ enum mtk_instance_state {
 };
 
 /**
- * struct mtk_encode_param - General encoding parameters type
+ * enum mtk_encode_param - General encoding parameters type
  */
 enum mtk_encode_param {
 	MTK_ENCODE_PARAM_NONE = 0,
@@ -112,7 +112,7 @@ struct mtk_codec_framesizes {
 };
 
 /**
- * struct mtk_q_type - Type of queue
+ * enum mtk_q_type - Type of queue
  */
 enum mtk_q_type {
 	MTK_Q_DATA_SRC = 0,
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
index 270d8dc9984b..ec8f4e8d3d23 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
@@ -14,10 +14,10 @@
 
 
 /**
- * struct vdec_fb_status  - decoder frame buffer status
- * @FB_ST_NORMAL	: initial state
- * @FB_ST_DISPLAY	: frmae buffer is ready to be displayed
- * @FB_ST_FREE		: frame buffer is not used by decoder any more
+ * enum vdec_fb_status  - decoder frame buffer status
+ * @FB_ST_NORMAL: initial state
+ * @FB_ST_DISPLAY: frame buffer is ready to be displayed
+ * @FB_ST_FREE: frame buffer is not used by decoder any more
  */
 enum vdec_fb_status {
 	FB_ST_NORMAL		= 0,
diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
index 2feb0365179f..5f53d4255c36 100644
--- a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
@@ -52,7 +52,7 @@ struct venc_ap_ipi_msg_init {
  *			(struct venc_vp8_vsi/venc_h264_vsi *)
  * @param_id:	parameter id (venc_set_param_type)
  * @data_item:	number of items in the data array
- * @data[8]:	data array to store the set parameters
+ * @data:	data array to store the set parameters
  */
 struct venc_ap_ipi_msg_set_param {
 	uint32_t msg_id;
@@ -92,7 +92,7 @@ struct venc_ap_ipi_msg_enc {
  *
  * @base:	base msg structure
  * @data_item:	number of items in the data array
- * @data[8]:	data array to store the set parameters
+ * @data:	data array to store the set parameters
  */
 struct venc_ap_ipi_msg_enc_ext {
 	struct venc_ap_ipi_msg_enc base;
@@ -158,7 +158,7 @@ struct venc_vpu_ipi_msg_init {
  * @venc_inst:	AP encoder instance (struct venc_vp8_inst/venc_h264_inst *)
  * @param_id:	parameter id (venc_set_param_type)
  * @data_item:	number of items in the data array
- * @data[6]:	data array to store the return result
+ * @data:	data array to store the return result
  */
 struct venc_vpu_ipi_msg_set_param {
 	uint32_t msg_id;
@@ -171,10 +171,10 @@ struct venc_vpu_ipi_msg_set_param {
 
 /**
  * enum venc_ipi_msg_enc_state - Type of encode state
- * VEN_IPI_MSG_ENC_STATE_FRAME:	one frame being encoded
- * VEN_IPI_MSG_ENC_STATE_PART:	bit stream buffer full
- * VEN_IPI_MSG_ENC_STATE_SKIP:	encoded skip frame
- * VEN_IPI_MSG_ENC_STATE_ERROR:	encounter error
+ * @VEN_IPI_MSG_ENC_STATE_FRAME:	one frame being encoded
+ * @VEN_IPI_MSG_ENC_STATE_PART:		bit stream buffer full
+ * @VEN_IPI_MSG_ENC_STATE_SKIP:		encoded skip frame
+ * @VEN_IPI_MSG_ENC_STATE_ERROR:	encounter error
  */
 enum venc_ipi_msg_enc_state {
 	VEN_IPI_MSG_ENC_STATE_FRAME,
-- 
2.30.1

