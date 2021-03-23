Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1660A346182
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 15:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbhCWObp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 10:31:45 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:34581 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232186AbhCWObb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 10:31:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Oi46lrQbeCAEGOi49lXRvD; Tue, 23 Mar 2021 15:31:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616509890; bh=J+dMJNZRKoCURL9Who3NdN/UFii9Wq3g1BxJvhufwoY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OfDiOyaZRtL2UwctPdi/jv7ElkTmSOtNwHDnNX5TpYjfQl36Iihsh/ef/M0mYL9IN
         mXyG/ZGzlu144PWu6hjar2iDH4nt9B0Q1lKFN6a/cdOeEzOr1qIdQtwUAAUjwgJwPx
         Q8aIChJs5nWkPTVGU5TS+dFLY92uJEHoshp1UnmZKdMqItYeNFqa8BfPp8Fz1Snv29
         MQT4TeO7aE8DEKIXatd/r4RRWEgXmoKgmGwpW0IzfTefNztE0WXMyNM0MHg7s7UmfQ
         MwCyuRzqp1EIroihNe5X0KxTWtiEgCQFKtc98RCc33mGnFzO5UD8OmZVEhFBAagPUk
         IEDVWvZPArOVA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] s5p-mfc/s5p_mfc_common.h: fix kernel-doc warnings
Message-ID: <bc9e52c2-94b9-f667-2013-9b7793fce8f9@xs4all.nl>
Date:   Tue, 23 Mar 2021 15:31:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDhxCYwD4J4fRBY9aF5Zk62X+71k3tyRie1JDxS9cJJGeuvC5aRxteyfpmpKDmMJAus+96M7ADiXa1HEAV22m1LYoWJd1OMQuKqEkhasFU/LdyFZiEzO
 NMheWmnROSEMXv1yUQpE2b2kKLJHiCjNHPvv13suAnSfX3j36PV5j6uar655ZqWTPemLeU5IDQ1psif5sp4XO7ubPjtFg8YxQly+HyvlTdsoqwMw7JbmkH4+
 7yES10cZfybUl4V8e7AsKV0ILL2O2ag4A2ShSI1FJsmNNfci8Y/GgL4smQLmp5VT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Trivial fixes for many kernel-doc warnings. Most of the comments before enums
or struct can just be that: regular comments. So just change /** to /*.

In one remaining case it was just a wrong construct (@mem_dev[] -> @mem_dev).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
index 96d1ecd1521b..80851084bc83 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
@@ -102,7 +102,7 @@
 #define mfc_write(dev, data, offset)	writel((data), dev->regs_base + \
 								(offset))

-/**
+/*
  * enum s5p_mfc_fmt_type - type of the pixelformat
  */
 enum s5p_mfc_fmt_type {
@@ -111,7 +111,7 @@ enum s5p_mfc_fmt_type {
 	MFC_FMT_RAW,
 };

-/**
+/*
  * enum s5p_mfc_inst_type - The type of an MFC instance.
  */
 enum s5p_mfc_inst_type {
@@ -120,7 +120,7 @@ enum s5p_mfc_inst_type {
 	MFCINST_ENCODER,
 };

-/**
+/*
  * enum s5p_mfc_inst_state - The state of an MFC instance.
  */
 enum s5p_mfc_inst_state {
@@ -142,7 +142,7 @@ enum s5p_mfc_inst_state {
 	MFCINST_RES_CHANGE_END,
 };

-/**
+/*
  * enum s5p_mfc_queue_state - The state of buffer queue.
  */
 enum s5p_mfc_queue_state {
@@ -152,7 +152,7 @@ enum s5p_mfc_queue_state {
 	QUEUE_BUFS_MMAPED,
 };

-/**
+/*
  * enum s5p_mfc_decode_arg - type of frame decoding
  */
 enum s5p_mfc_decode_arg {
@@ -171,7 +171,7 @@ enum s5p_mfc_fw_ver {

 struct s5p_mfc_ctx;

-/**
+/*
  * struct s5p_mfc_buf - MFC buffer
  */
 struct s5p_mfc_buf {
@@ -187,7 +187,7 @@ struct s5p_mfc_buf {
 	int flags;
 };

-/**
+/*
  * struct s5p_mfc_pm - power management data structure
  */
 struct s5p_mfc_pm {
@@ -257,7 +257,7 @@ struct s5p_mfc_priv_buf {
  * @vfd_dec:		video device for decoding
  * @vfd_enc:		video device for encoding
  * @plat_dev:		platform device
- * @mem_dev[]:		child devices of the memory banks
+ * @mem_dev:		child devices of the memory banks
  * @regs_base:		base address of the MFC hw registers
  * @irq:		irq resource
  * @dec_ctrl_handler:	control framework handler for decoding
@@ -342,7 +342,7 @@ struct s5p_mfc_dev {
 	bool risc_on; /* indicates if RISC is on or off */
 };

-/**
+/*
  * struct s5p_mfc_h264_enc_params - encoding parameters for h264
  */
 struct s5p_mfc_h264_enc_params {
@@ -391,7 +391,7 @@ struct s5p_mfc_h264_enc_params {
 	u32 aso_slice_order[8];
 };

-/**
+/*
  * struct s5p_mfc_mpeg4_enc_params - encoding parameters for h263 and mpeg4
  */
 struct s5p_mfc_mpeg4_enc_params {
@@ -410,7 +410,7 @@ struct s5p_mfc_mpeg4_enc_params {
 	int level;
 };

-/**
+/*
  * struct s5p_mfc_vp8_enc_params - encoding parameters for vp8
  */
 struct s5p_mfc_vp8_enc_params {
@@ -479,7 +479,7 @@ struct s5p_mfc_hevc_enc_params {
 	u8 prepend_sps_pps_to_idr;
 };

-/**
+/*
  * struct s5p_mfc_enc_params - general encoding parameters
  */
 struct s5p_mfc_enc_params {
@@ -521,7 +521,7 @@ struct s5p_mfc_enc_params {

 };

-/**
+/*
  * struct s5p_mfc_codec_ops - codec ops, used by encoding
  */
 struct s5p_mfc_codec_ops {
@@ -725,7 +725,7 @@ struct s5p_mfc_fmt {
 	u32 versions;
 };

-/**
+/*
  * struct mfc_control -	structure used to store information about MFC controls
  *			it is used to initialize the control framework.
  */
