Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F72850E455
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 17:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242920AbiDYP1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 11:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242889AbiDYP1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 11:27:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B8FE0AF8;
        Mon, 25 Apr 2022 08:24:37 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a02:3030:e:60d7:2277:ba57:a2c0:3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sebastianfricke)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F064C1F4133D;
        Mon, 25 Apr 2022 16:24:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1650900276;
        bh=BtjtvOnpAvYAPAeBJbzghlo4LmKVCPSB1JGlZrSgdRc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c9Ki3/029OjA4uG5se4/3sGjKyGEmBLxVyPPkgaXuPO5RNM9qDcMLKMoGXQG8B9La
         RPcpFDCgGBo1iJByMFjpM4ehNhOJWQUT7gS78aXAzVzc/1Z4HYEqKR/EpTLxTOURbE
         pTa44NF7Nl1SkcGiwR/VZiA71cjR82urKe6jlqKcsImzVG/EoD3WueH50gtnWdTyPC
         YKAIOhe3+xNqdTU5D4rC8cOgbL3jpog6PO5br3YO95Ua/evG4A2gKxhZ84C4DjUs8r
         I237o5YWCggpD54xHAXwAuybepAHjcJiLTheQe2PW7gV7oArh5rX50qGrUXXVL7Q9h
         mCt9nwfc1799g==
Date:   Mon, 25 Apr 2022 17:24:32 +0200
From:   Sebastian Fricke <sebastian.fricke@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 07/17] media: uapi: HEVC: Add SEI pic struct flags
Message-ID: <20220425152432.d5bxnpo5wkhw3syt@basti-XPS-13-9310>
References: <20220407152940.738159-1-benjamin.gaignard@collabora.com>
 <20220407152940.738159-8-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220407152940.738159-8-benjamin.gaignard@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Benjamin,

On 07.04.2022 17:29, Benjamin Gaignard wrote:
>The possible values for field_pic field in v4l2_hevc_dpb_entry

s/field_pic/the field_pic/
s/v4l2_hevc_dpb_entry/the v4l2_hevc_dpb_entry/

>structure are defined table D.2 in HEVC specification section D.3.3.

s/defined table/defined in the table/

Greetings,
Sebastian

>Add flags and documentation for each of them.
>
>Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>---
> .../media/v4l/ext-ctrls-codec.rst             | 54 +++++++++++++++++++
> include/media/hevc-ctrls.h                    | 14 +++++
> 2 files changed, 68 insertions(+)
>
>diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>index c679b17b4426..b44ea85c6f0e 100644
>--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>@@ -3193,6 +3193,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>     * - __u8
>       - ``field_pic``
>       - Whether the reference is a field picture or a frame.
>+        See :ref:`HEVC dpb field pic Flags <hevc_dpb_field_pic_flags>`
>     * - __u16
>       - ``pic_order_cnt[2]``
>       - The picture order count of the reference. Only the first element of the
>@@ -3206,6 +3207,59 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>
>     \normalsize
>
>+.. _hevc_dpb_field_pic_flags:
>+
>+``HEVC dpb field pic Flags``
>+
>+.. raw:: latex
>+
>+    \scriptsize
>+
>+.. flat-table::
>+    :header-rows:  0
>+    :stub-columns: 0
>+    :widths:       1 1 2
>+
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_FRAME``
>+      - 0
>+      - (progressive) Frame
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_TOP_FIELD``
>+      - 1
>+      - Top field
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_FIELD``
>+      - 2
>+      - Bottom field
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_TOP_BOTTOM``
>+      - 3
>+      - Top field, bottom field, in that order
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_TOP``
>+      - 4
>+      - Bottom field, top field, in that order
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_TOP_BOTTOM_TOP``
>+      - 5
>+      - Top field, bottom field, top field repeated, in that order
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_TOP_BOTTOM``
>+      - 6
>+      - Bottom field, top field, bottom field repeated, in that order
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_FRAME_DOUBLING``
>+      - 7
>+      - Frame doubling
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_FRAME_TRIPLING``
>+      - 8
>+      - Frame tripling
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_TOP_PAIRED_PREVIOUS_BOTTOM``
>+      - 9
>+      - Top field paired with previous bottom field in output order
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_PAIRED_PREVIOUS_TOP``
>+      - 10
>+      - Bottom field paired with previous top field in output order
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_TOP_PAIRED_NEXT_BOTTOM``
>+      - 11
>+      - Top field paired with next bottom field in output order
>+    * - ``V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_PAIRED_NEXT_TOP``
>+      - 12
>+      - Bottom field paired with next top field in output order
>+
> .. c:type:: v4l2_hevc_pred_weight_table
>
> .. raw:: latex
>diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>index 2812778b41f4..e76a23e22a35 100644
>--- a/include/media/hevc-ctrls.h
>+++ b/include/media/hevc-ctrls.h
>@@ -132,6 +132,20 @@ struct v4l2_ctrl_hevc_pps {
>
> #define V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE	0x01
>
>+#define V4L2_HEVC_SEI_PIC_STRUCT_FRAME				0
>+#define V4L2_HEVC_SEI_PIC_STRUCT_TOP_FIELD			1
>+#define V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_FIELD			2
>+#define V4L2_HEVC_SEI_PIC_STRUCT_TOP_BOTTOM			3
>+#define V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_TOP			4
>+#define V4L2_HEVC_SEI_PIC_STRUCT_TOP_BOTTOM_TOP			5
>+#define V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_TOP_BOTTOM		6
>+#define V4L2_HEVC_SEI_PIC_STRUCT_FRAME_DOUBLING			7
>+#define V4L2_HEVC_SEI_PIC_STRUCT_FRAME_TRIPLING			8
>+#define V4L2_HEVC_SEI_PIC_STRUCT_TOP_PAIRED_PREVIOUS_BOTTOM	9
>+#define V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_PAIRED_PREVIOUS_TOP	10
>+#define V4L2_HEVC_SEI_PIC_STRUCT_TOP_PAIRED_NEXT_BOTTOM		11
>+#define V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_PAIRED_NEXT_TOP		12
>+
> #define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
>
> struct v4l2_hevc_dpb_entry {
>-- 
>2.32.0
>
