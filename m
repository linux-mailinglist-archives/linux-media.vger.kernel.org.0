Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1B8450F317
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 09:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244639AbiDZHzz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 03:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344508AbiDZHzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 03:55:47 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDE76479;
        Tue, 26 Apr 2022 00:52:40 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a02:3030:3:7d2:2277:ba57:a2c0:3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sebastianfricke)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C0BDA1F4303D;
        Tue, 26 Apr 2022 08:52:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1650959559;
        bh=VRkHoSHCz52DTaL/qaCteKvrAnpJI0RuwyC1ISlouJ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WAJLm96S2y2alDNhtlVBzVYe2YB/5EVq1ztnOv76XGDfc7rYOHIWci6n4s6rf0L4t
         epUN9lCjqVxsKya6qEFd+P3RDZBHDe/irdU3NJVarqxbNBX1cUdczH0WfLTQVxNcws
         QxCPZVV5TuG+EzPweuhFC9GuL75alRy9/Or6dZcojhdX9+oLpkx39Vd2G/z3uKuwH1
         wMQw1x11DZ76Np9rormwiFemVT+AGqOi6ph2A/Eu4sHjI8mPeDjIN1sw8UIbAGJfDS
         UO43scq2lWfoLksxlby9bZXh5SBH2I3IJ3/LS+74uDNsQsvVuObeK3ijrh0jEapcoA
         XrB8fzFpOEKgg==
Date:   Tue, 26 Apr 2022 09:52:34 +0200
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
Subject: Re: [PATCH v5 04/17] media: uapi: HEVC: Add missing fields in HEVC
 controls
Message-ID: <20220426075234.6gk72hzf2bgaxwqw@basti-XPS-13-9310>
References: <20220407152940.738159-1-benjamin.gaignard@collabora.com>
 <20220407152940.738159-5-benjamin.gaignard@collabora.com>
 <20220425135449.oapsrqqyq34s2ii3@basti-XPS-13-9310>
 <d1ba4e57-2f13-ab3b-f79a-dc812cd4c2bf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1ba4e57-2f13-ab3b-f79a-dc812cd4c2bf@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Benjamin,

On 25.04.2022 18:16, Benjamin Gaignard wrote:
>
>Le 25/04/2022 à 15:54, Sebastian Fricke a écrit :
>>On 07.04.2022 17:29, Benjamin Gaignard wrote:
>>>Complete the HEVC controls with missing fields from H.265 
>>>specifications.
>>>Even if these fields aren't used by the current mainlined drivers
>>>they will be need for (at least) rkvdec driver.
>>
>>s/be need/be required/
>>or
>>s/be need/be needed/
>>
>>s/rkvdec/the rkvdec/
>>
>>>
>>>Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>---
>>>.../media/v4l/ext-ctrls-codec.rst             | 19 +++++++++++++++++++
>>>include/media/hevc-ctrls.h                    |  6 +++++-
>>>2 files changed, 24 insertions(+), 1 deletion(-)
>>>
>>>diff --git 
>>>a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst 
>>>b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>index 4cd7c541fc30..dbb08603217b 100644
>>>--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>@@ -2661,6 +2661,16 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>>    :stub-columns: 0
>>>    :widths:       1 1 2
>>>
>>>+    * - __u8
>>>+      - ``video_parameter_set_id``
>>>+      - Specifies the value of the vps_video_parameter_set_id of 
>>>the active VPS
>>>+        as descibed in section "7.4.3.2.1 General sequence 
>>>parameter set RBSP semantics"
>>>+        of H.265 specifications.
>>>+    * - __u8
>>>+      - ``seq_parameter_set_id``
>>>+      - Provides an identifier for the SPS for reference by other 
>>>syntax elements
>>>+        as descibed in section "7.4.3.2.1 General sequence 
>>>parameter set RBSP semantics"
>>>+        of H.265 specifications.
>>>    * - __u16
>>>      - ``pic_width_in_luma_samples``
>>>      -
>>>@@ -2800,6 +2810,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>>    :stub-columns: 0
>>>    :widths:       1 1 2
>>>
>>>+    * - __u8
>>>+      - ``pic_parameter_set_id``
>>>+      - Identifies the PPS for reference by other syntax elements.
>>>    * - __u8
>>>      - ``num_extra_slice_header_bits``
>>>      -
>>>@@ -3026,6 +3039,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>>    * - __u8
>>>      - ``ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>>      - The list of L1 reference elements as indices in the DPB.
>>>+    * - __u16
>>>+      - ``short_term_ref_pic_set_size``
>>>+      - Specifies the size of short-term reference pictures set 
>>>included in the SPS.
>>
>>s/size of/size of the/
>>
>>Section 7.4.8 depicts that the st_ref_pic_set syntax
>>structure can be part of the SPS or the slice header.
>>
>>I think we should mention that we talk about the size of the 
>>st_ref_pic_set
>>syntax structure from section 7.4.8 of the specification.
>>>+    * - __u16
>>>+      - ``long_term_ref_pic_set_size``
>>>+      - Specifies the size of long-term reference pictures set 
>>>include in the SPS.
>>
>>s/size of/size of the/
>>
>>Can we make this a bit more helpful? The specification doesn't contain
>>a similar structure to `st_ref_pic_set` for long term pictures. So, as a
>>programmer this leaves me guessing:
>>- Which syntax structure's size are we talking about?
>>- Does this correlate to any of the existing sections of the
>>specification?
>>Because in the end, I feel like this documentation should be able to
>>help a programmer to provide the correct data for the uABI.
>
>I will reword it like that:
>
>  * - __u16
>    - ``short_term_ref_pic_set_size``
>    - Specifies the size, in bits, of the short-term reference pictures set, described as st_ref_pic_set()

Just ...

s/reference pictures set/reference picture set/

>      in the specification, included in the slice header (section 7.3.6.1).

s/slice header/slice header or SPS/


>
> * - __u16
>   - ``long_term_ref_pic_set_size``
>   - Specifies the size, in bits, of the long-term reference pictures set include in the slice header.

s/reference pictures set/reference picture set/

Looking at the documentation it looks like: s/slice header/slice header or SPS/
(For example in section 7.3.6.1:
```
if( long_term_ref_pics_present_flag ) {
   if( num_long_term_ref_pics_sps > 0 )
     num_long_term_sps
   num_long_term_pics
   for( i = 0; i < num_long_term_sps + num_long_term_pics; i++ ) {
     ...
```
)

... and then it looks very good!

Greetings,
Sebastian

>     It is the number of bits in the conditional block if( long_term_ref_pics_present_flag ) {...}
>     in section 7.3.6.1 of the specification.
>
>Benjamin
>
>
>>
>>Greetings,
>>Sebastian
>>
>>>    * - __u8
>>>      - ``padding``
>>>      - Applications and drivers must set this to zero.
>>>diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>>>index 01ccda48d8c5..a329e086a89a 100644
>>>--- a/include/media/hevc-ctrls.h
>>>+++ b/include/media/hevc-ctrls.h
>>>@@ -58,6 +58,8 @@ enum v4l2_mpeg_video_hevc_start_code {
>>>/* The controls are not stable at the moment and will likely be 
>>>reworked. */
>>>struct v4l2_ctrl_hevc_sps {
>>>    /* ISO/IEC 23008-2, ITU-T Rec. H.265: Sequence parameter set */
>>>+    __u8    video_parameter_set_id;
>>>+    __u8    seq_parameter_set_id;
>>>    __u16    pic_width_in_luma_samples;
>>>    __u16    pic_height_in_luma_samples;
>>>    __u8    bit_depth_luma_minus8;
>>>@@ -108,6 +110,7 @@ struct v4l2_ctrl_hevc_sps {
>>>
>>>struct v4l2_ctrl_hevc_pps {
>>>    /* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
>>>+    __u8    pic_parameter_set_id;
>>>    __u8    num_extra_slice_header_bits;
>>>    __u8    num_ref_idx_l0_default_active_minus1;
>>>    __u8    num_ref_idx_l1_default_active_minus1;
>>>@@ -199,7 +202,8 @@ struct v4l2_ctrl_hevc_slice_params {
>>>    __u32    slice_segment_addr;
>>>    __u8    ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>    __u8    ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>-
>>>+    __u16    short_term_ref_pic_set_size;
>>>+    __u16    long_term_ref_pic_set_size;
>>>    __u8    padding;
>>>
>>>    /* ISO/IEC 23008-2, ITU-T Rec. H.265: Weighted prediction 
>>>parameter */
>>>-- 
>>>2.32.0
>>>
