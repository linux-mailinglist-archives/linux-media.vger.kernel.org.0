Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40CE3A2471
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 08:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhFJGZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 02:25:13 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53773 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230117AbhFJGZK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 02:25:10 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rE5ul5WoZhqltrE5xlWUpb; Thu, 10 Jun 2021 08:23:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623306193; bh=9lBftEg0F8adssEwFw+7ofMqI9mmYiuaYwhtD765ynM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mgrEFbsw/DR5F+9Xgyb4Ph2fsSXPzMubACjwhZziWTNlqog1lGBvmA17CdmBeraFJ
         c9ggWsyKsrAZaeO6r4vcXBSQpFVf+OGXRy3ZW9LvqsVPNGOu5GsR/uVei2xEeBIKVp
         l9GOgzb4acm7OGs6z5QsvLTpxbdOnLYcXUpaqaWiqEb14Mq5Z8ly1BaXXPk0LKymvL
         J6oQIH36kQOrmh3+x8f/u9FbEoMqZhsBf9Z1cOM1EYL5bkKDqY6whHxfm89mbaOZ8Y
         cCLL1J0q8wh01hQTiZKd2e9if9b/ZneuocX0mpRssrA4TiJOQiE1ndRnjX15J4H73l
         YTixf1zGwPPUg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] mtk-vcodec: fix kerneldoc warnings
Message-ID: <a8a0144c-99a0-20f2-169f-fd9aa1a7bd54@xs4all.nl>
Date:   Thu, 10 Jun 2021 08:23:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLi4SL2EKHkzs2c/duNR3bRIyCXSlzhgKIKILT8mIvBDUBHHTJBApaR0ez0OblyfUj0bQxNm19mgya88JeV1k7Xf5pCOG7ZH7WnMoUDrlqM+44iMp8sZ
 Hxf+5Qo8FXYmrwdu6QvMzjxLlSTphbSnOhDoOyK7M/2yF10/ovdjJw+1bJ9TUX1RR9tyGO0h6LQ1KUNMKKKh46/MJdVQWNMLpcagn8BnNaWLjgtg3bLbAyxN
 LIPgqQAURuMsAghDZCnIbDqbDK+8bbFafALCkoan1PQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following kerneldoc warnings:

drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'AP_IPIMSG_ENC_INIT' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'AP_IPIMSG_ENC_SET_PARAM' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'AP_IPIMSG_ENC_ENCODE' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'AP_IPIMSG_ENC_DEINIT' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'VPU_IPIMSG_ENC_INIT_DONE' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'VPU_IPIMSG_ENC_SET_PARAM_DONE' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'VPU_IPIMSG_ENC_ENCODE_DONE' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Enum value 'VPU_IPIMSG_ENC_DEINIT_DONE' not described in enum 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Excess enum value 'VPU_IPIMSG_ENC_XXX_DONE' description in 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:31: warning: Excess enum value 'AP_IPIMSG_ENC_XXX' description in 'venc_ipi_msg_id'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:120: warning: Enum value 'VENC_IPI_MSG_STATUS_OK' not described in enum 'venc_ipi_msg_status'
drivers/media/platform/mtk-vcodec/venc_ipi_msg.h:120: warning: Enum value 'VENC_IPI_MSG_STATUS_FAIL' not described in enum 'venc_ipi_msg_status'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_SYS' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_MISC' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_LD' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_TOP' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_CM' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_AD' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_AV' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_PP' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_HWD' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_HWQ' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_HWB' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VDEC_HWG' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'NUM_MAX_VDEC_REG_BASE' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VENC_SYS' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'VENC_LT_SYS' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:50: warning: Enum value 'NUM_MAX_VCODEC_REG_BASE' not described in enum 'mtk_hw_reg_idx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:58: warning: Enum value 'MTK_INST_DECODER' not described in enum 'mtk_instance_type'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:58: warning: Enum value 'MTK_INST_ENCODER' not described in enum 'mtk_instance_type'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_NONE' not described in enum 'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_BITRATE' not described in enum 'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_FRAMERATE' not described in enum 'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_INTRA_PERIOD' not described in enum
'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_FORCE_INTRA' not described in enum
'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:87: warning: Enum value 'MTK_ENCODE_PARAM_GOP_SIZE' not described in enum 'mtk_encode_param'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:103: warning: Function parameter or member 'fourcc' not described in 'mtk_video_fmt'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:103: warning: Function parameter or member 'type' not described in 'mtk_video_fmt'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:103: warning: Function parameter or member 'num_planes' not described in 'mtk_video_fmt'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:103: warning: Function parameter or member 'flags' not described in 'mtk_video_fmt'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:112: warning: Function parameter or member 'fourcc' not described in 'mtk_codec_framesizes'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:112: warning: Function parameter or member 'stepwise' not described in 'mtk_codec_framesizes'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:120: warning: Enum value 'MTK_Q_DATA_SRC' not described in enum 'mtk_q_type'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:120: warning: Enum value 'MTK_Q_DATA_DST' not described in enum 'mtk_q_type'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'visible_width' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'visible_height' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'coded_width' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'coded_height' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'field' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'bytesperline' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'sizeimage' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:134: warning: Function parameter or member 'fmt' not described in 'mtk_q_data'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:177: warning: Function parameter or member 'clk_name' not described in 'mtk_vcodec_clk_info'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:177: warning: Function parameter or member 'vcodec_clk' not described in
'mtk_vcodec_clk_info'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:185: warning: Function parameter or member 'clk_info' not described in 'mtk_vcodec_clk'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:185: warning: Function parameter or member 'clk_num' not described in 'mtk_vcodec_clk'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:198: warning: Function parameter or member 'vdec_clk' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:198: warning: Function parameter or member 'larbvdec' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:198: warning: Function parameter or member 'venc_clk' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:198: warning: Function parameter or member 'larbvenc' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:198: warning: Function parameter or member 'dev' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:198: warning: Function parameter or member 'mtkdev' not described in 'mtk_vcodec_pm'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:300: warning: Function parameter or member 'decoded_frame_cnt' not described in
'mtk_vcodec_ctx'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:332: warning: Function parameter or member 'min_bitrate' not described in
'mtk_vcodec_enc_pdata'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:405: warning: Function parameter or member 'venc_pdata' not described in 'mtk_vcodec_dev'
drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h:405: warning: Function parameter or member 'decode_workqueue' not described in
'mtk_vcodec_dev'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'AP_IPIMSG_DEC_INIT' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'AP_IPIMSG_DEC_START' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'AP_IPIMSG_DEC_END' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'AP_IPIMSG_DEC_DEINIT' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'AP_IPIMSG_DEC_RESET' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'VPU_IPIMSG_DEC_INIT_ACK' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'VPU_IPIMSG_DEC_START_ACK' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'VPU_IPIMSG_DEC_END_ACK' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'VPU_IPIMSG_DEC_DEINIT_ACK' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Enum value 'VPU_IPIMSG_DEC_RESET_ACK' not described in enum 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Excess enum value 'AP_IPIMSG_XXX' description in 'vdec_ipi_msgid'
drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h:27: warning: Excess enum value 'VPU_IPIMSG_XXX_ACK' description in 'vdec_ipi_msgid'

In some cases I just changed /** to /*, in other cases the missing
field descriptions were added.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index d03cca95e99b..8e9a0d9dc577 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -25,7 +25,7 @@
 #define MTK_V4L2_BENCHMARK	0
 #define WAIT_INTR_TIMEOUT_MS	1000

-/**
+/*
  * enum mtk_hw_reg_idx - MTK hw register base index
  */
 enum mtk_hw_reg_idx {
@@ -49,7 +49,7 @@ enum mtk_hw_reg_idx {
 	NUM_MAX_VCODEC_REG_BASE
 };

-/**
+/*
  * enum mtk_instance_type - The type of an MTK Vcodec instance.
  */
 enum mtk_instance_type {
@@ -74,7 +74,7 @@ enum mtk_instance_state {
 	MTK_STATE_ABORT = 4,
 };

-/**
+/*
  * enum mtk_encode_param - General encoding parameters type
  */
 enum mtk_encode_param {
@@ -92,7 +92,7 @@ enum mtk_fmt_type {
 	MTK_FMT_FRAME = 2,
 };

-/**
+/*
  * struct mtk_video_fmt - Structure used to store information about pixelformats
  */
 struct mtk_video_fmt {
@@ -102,7 +102,7 @@ struct mtk_video_fmt {
 	u32	flags;
 };

-/**
+/*
  * struct mtk_codec_framesizes - Structure used to store information about
  *							framesizes
  */
@@ -111,7 +111,7 @@ struct mtk_codec_framesizes {
 	struct	v4l2_frmsize_stepwise	stepwise;
 };

-/**
+/*
  * enum mtk_q_type - Type of queue
  */
 enum mtk_q_type {
@@ -119,7 +119,7 @@ enum mtk_q_type {
 	MTK_Q_DATA_DST = 1,
 };

-/**
+/*
  * struct mtk_q_data - Structure used to store information about queue
  */
 struct mtk_q_data {
@@ -168,7 +168,7 @@ struct mtk_enc_params {
 	unsigned int	force_intra;
 };

-/**
+/*
  * struct mtk_vcodec_clk_info - Structure used to store clock name
  */
 struct mtk_vcodec_clk_info {
@@ -176,7 +176,7 @@ struct mtk_vcodec_clk_info {
 	struct clk	*vcodec_clk;
 };

-/**
+/*
  * struct mtk_vcodec_clk - Structure used to store vcodec clock information
  */
 struct mtk_vcodec_clk {
@@ -184,7 +184,7 @@ struct mtk_vcodec_clk {
 	int	clk_num;
 };

-/**
+/*
  * struct mtk_vcodec_pm - Power management data structure
  */
 struct mtk_vcodec_pm {
@@ -255,6 +255,7 @@ struct vdec_pic_info {
  * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
  * @quantization: enum v4l2_quantization, colorspace quantization
  * @xfer_func: enum v4l2_xfer_func, colorspace transfer function
+ * @decoded_frame_cnt: number of decoded frames
  * @lock: protect variables accessed by V4L2 threads and worker thread such as
  *	  mtk_video_dec_buf.
  */
@@ -310,7 +311,7 @@ enum mtk_chip {
  * @chip: chip this encoder is compatible with
  *
  * @uses_ext: whether the encoder uses the extended firmware messaging format
- * @min_birate: minimum supported encoding bitrate
+ * @min_bitrate: minimum supported encoding bitrate
  * @max_bitrate: maximum supported encoding bitrate
  * @capture_formats: array of supported capture formats
  * @num_capture_formats: number of entries in capture_formats
@@ -347,10 +348,12 @@ struct mtk_vcodec_enc_pdata {
  * @curr_ctx: The context that is waiting for codec hardware
  *
  * @reg_base: Mapped address of MTK Vcodec registers.
+ * @venc_pdata: encoder IC-specific data
  *
  * @fw_handler: used to communicate with the firmware.
  * @id_counter: used to identify current opened instance
  *
+ * @decode_workqueue: decode work queue
  * @encode_workqueue: encode work queue
  *
  * @int_cond: used to identify interrupt condition happen
diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 47a1c1c0fd04..68e8d5cb16d7 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -7,7 +7,7 @@
 #ifndef _VDEC_IPI_MSG_H_
 #define _VDEC_IPI_MSG_H_

-/**
+/*
  * enum vdec_ipi_msgid - message id between AP and VPU
  * @AP_IPIMSG_XXX	: AP to VPU cmd message id
  * @VPU_IPIMSG_XXX_ACK	: VPU ack AP cmd message id
diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
index 5f53d4255c36..587a2cf15b76 100644
--- a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
@@ -12,7 +12,7 @@
 #define AP_IPIMSG_VENC_BASE 0xC000
 #define VPU_IPIMSG_VENC_BASE 0xD000

-/**
+/*
  * enum venc_ipi_msg_id - message id between AP and VPU
  * (ipi stands for inter-processor interrupt)
  * @AP_IPIMSG_ENC_XXX:		AP to VPU cmd message id
@@ -111,7 +111,7 @@ struct venc_ap_ipi_msg_deinit {
 	uint32_t vpu_inst_addr;
 };

-/**
+/*
  * enum venc_ipi_msg_status - VPU ack AP cmd status
  */
 enum venc_ipi_msg_status {
