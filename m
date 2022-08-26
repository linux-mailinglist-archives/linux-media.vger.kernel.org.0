Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB3C85A23C5
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 11:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245316AbiHZJJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 05:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237428AbiHZJJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 05:09:30 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9806BD6309
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 02:09:28 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id y3so1988313ejc.1
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 02:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=japMJxzoy3t8mD0DwKduT4HHnH+/hghlTihn/Dd8w/o=;
        b=QW86rteJ0ZohyyIemUU2LzGjDmEYSM4nMoItFMt2lbqYjBuVB1+bpCb0YP9ytLnSVW
         H6uVaJkYq5+iJlBDVjP+E+MYeIQWDnaApPpAhPAsoVSXDpmQJtvHBv41xP2NDTSMu8pW
         jDs8HH2IRcKz7FdA/oJAs8rxvmJLMtR8DTfXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=japMJxzoy3t8mD0DwKduT4HHnH+/hghlTihn/Dd8w/o=;
        b=pKa46d7YSWkDwd0YJa9R+nmN6xJEohpqCC8/GRnYlH1bRQBfs5eRKhla95gCrpUoJ3
         lIjLqrj3mwirrtaDi3eAKPBr6e4/kj9eJpSiuRU+VN8AkGia4T83AKuFRQxdY7mfffGt
         eqONXo2Ektrq2YOX7rFPq2Gv3kX3tPGZ4ZVV5hfv01/aiWpEARD5v8u8FvDHymBmWSFO
         fvtvhavpLgFSkDzJL0IvaVTl04w2F8pDn1meDq4uwxFL1eDMDF3L0j12I8++6b/lxRL4
         ght+1YrKiviXqonIZ3Rl5o2cb15oYBd2JqKXIz4jNvHmSEpqkdzya9wntqndUM/IXcCQ
         j9lA==
X-Gm-Message-State: ACgBeo0Ct/D/XG52W45D7vIgvnaZShSv9wXsbysbgWv/dIBIOfhdZd8Z
        rgHQ9bHWUS3r6QCb6HXhMoiRjxbFLIq7q+jvM3ZYeg==
X-Google-Smtp-Source: AA6agR79aZpe+io1SrSnAnvuK6SaPtYg5T5lafjwRxcgi/aM5JMVnwxgeEBgfXmloENn9pz7ELf3SZW/lxamXOEmWBU=
X-Received: by 2002:a17:907:8a1a:b0:731:6475:68f7 with SMTP id
 sc26-20020a1709078a1a00b00731647568f7mr4769593ejc.359.1661504967081; Fri, 26
 Aug 2022 02:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220825225312.564619-1-daniel.almeida@collabora.com>
In-Reply-To: <20220825225312.564619-1-daniel.almeida@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 26 Aug 2022 17:09:15 +0800
Message-ID: <CAGXv+5F78Y9ioYSMdPP1uGAchr=si0Dqwhd1o1eC2uqi8hynTg@mail.gmail.com>
Subject: Re: [RFC PATCH v3] media: Add AV1 uAPI
To:     daniel.almeida@collabora.com
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

n Fri, Aug 26, 2022 at 6:53 AM <daniel.almeida@collabora.com> wrote:
>
> From: Daniel Almeida <daniel.almeida@collabora.com>
>
> This patch adds the  AOMedia Video 1 (AV1) kernel uAPI.
>
> This design is based on currently available AV1 API implementations and
> aims to support the development of AV1 stateless video codecs
> on Linux.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> Changes from v2:
>
> - Bump AV1 CIDs to HEVC+100
>
> In light of the HEVC upstreaming, bump the AV1 CIDs to the values used by HEVC
> by 100, in order to avoid conflicts. The range previously used by AV1 was taken
> by HEVC, as it was merged first.
>
> - Fix typo in enum v4l2_av1_frame_restoration_type
>
> - Change u8 to __u8 in struct v4l2_av1_loop_restoration
>
> - Rename v4l2_ctrl_av1_frame_header to v4l2_ctrl_av1_frame
>
> - Fix a small typo
>
> - Also include 6.8.16 in the loop filter docs
>
> - delta_lf_multi is now a flag
>
> - Stop using the BIT macro
>
> - Move the AV1 CIDs below the VP9 ones
>
> - Remove useless break
>
> - Fix wrong docs for ref_frame_idx
>
> - Remove tile_group control.
>
> Data in this control is not currently used. The fact that VA-API does not have
> a similar Buffer in its API hints that it probably will not be needed in the
> future as well.
>
> - Move av1 CIDs to the bottom of the stateless block
>
> - Move V4L2_CTRL_TYPE_AV1_* to the end of the stateless block
>
> - Remove stale film_grain doc from av1 frame
>

[...]

> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> index cd33857d947d..5b549addfdde 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -2950,3 +2950,1209 @@ This structure contains all loop filter related parameters. See sections

[...]

> +``V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY (struct)``
> +    Represents a single AV1 tile inside an AV1 Tile Group. Note that MiRowStart,
> +    MiRowEnd, MiColStart and MiColEnd can be retrieved from struct
> +    v4l2_av1_tile_info in struct v4l2_ctrl_av1_frame_header using tile_row and

v4l2_ctrl_av1_frame_header <= should be updated to v4l2_ctrl_av1_frame

[...]

> +.. c:type:: v4l2_av1_loop_filter
> +
> +AV1 Loop filter params as defined in section 6.8.10. "Loop filter semantics" of
> +:ref:`av1`.
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
> +
> +.. flat-table:: struct v4l2_av1_global_motion
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``flags``
> +      - See
> +        :ref:`AV1 Loop Filter flags <av1_loop_filter_flags>` for more details.
> +    * - __u8
> +      - ``level[4]``
> +      - an array containing loop filter strength values. Different loop
> +        filter strength values from the array are used depending on the image
> +        plane being filtered, and the edge direction (vertical or horizontal)
> +        being filtered.
> +    * - __u8
> +      - ``sharpness``
> +      - indicates the sharpness level. The loop_filter_level and
> +        loop_filter_sharpness together determine when a block edge is filtered,
> +        and by how much the filtering can change the sample values. The loop
> +        filter process is described in section 7.14 of :ref:`av1`.
> +    * - __u8
> +      - ``ref_deltas[V4L2_AV1_TOTAL_REFS_PER_FRAME]``
> +      - contains the adjustment needed for the filter level based on the
> +        chosen reference frame. If this syntax element is not present, it
> +        maintains its previous value.
> +    * - __u8
> +      - ``mode_deltas[2]``
> +      - contains the adjustment needed for the filter level based on
> +        the chosen mode. If this syntax element is not present, it maintains its
> +        previous value.
> +    * - __u8
> +      - ``delta_lf_res``
> +      - specifies the left shift which should be applied to decoded loop filter
> +        delta values.
> +    * - __u8
> +      - ``delta_lf_multi``
> +      - a value equal to 1 specifies that separate loop filter
> +        deltas are sent for horizontal luma edges, vertical luma edges, the U
> +        edges, and the V edges. A value of delta_lf_multi equal to 0 specifies
> +        that the same loop filter delta is used for all edges.

delta_lf_multi was removed.

[...]

+    * - ``V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_MULTI``
+      - 0x00000008
+      - A value equal to 1 specifies that separate loop filter
+        deltas are sent for horizontal luma edges, vertical luma edges,
+        the U edges, and the V edges. A value of delta_lf_multi equal to 0
+        specifies that the same loop filter delta is used for all edges.
+
+

Extra new line here not consistent with the other sections.

+.. c:type:: v4l2_av1_quantization

[...]

> +``V4L2_CID_STATELESS_AV1_FRAME (struct)``
> +    Represents a Frame Header OBU. See 6.8. "Frame Header OBU semantics" of
> +    :ref:`av1` for more details.
> +
> +.. c:type:: v4l2_ctrl_av1_frame
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
> +
> +.. flat-table:: struct v4l2_ctrl_av1_frame
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - struct :c:type:`v4l2_av1_tile_info`
> +      - ``tile_info``
> +      - Tile info
> +    * - struct :c:type:`v4l2_av1_quantization`
> +      - ``quantization``
> +      - Quantization params
> +    * - struct :c:type:`v4l2_av1_segmentation`
> +      - ``segmentation``
> +      - Segmentation params
> +    * - struct :c:type:`v4l2_av1_loop_filter`
> +      - ``loop_filter``
> +      - Loop filter params
> +    * - struct :c:type:`v4l2_av1_cdef`
> +      - ``cdef``
> +      - CDEF params
> +    * - struct :c:type:`v4l2_av1_loop_restoration`
> +      - ``loop_restoration``
> +      - Loop restoration params
> +    * - struct :c:type:`v4l2_av1_loop_restoration`
> +      - ``loop_restoration``
> +      - Loop restoration params
> +    * - struct :c:type:`v4l2_av1_loop_global_motion`
> +      - ``global_motion``
> +      - Global motion params
> +    * - __u32
> +      - ``flags``
> +      - See
> +        :ref:`AV1 Tile Info flags <av1_frame_flags>` for more details.

This references <av1_frame_flags>.

[...]

> +.. _av1_frame_header_flags:

But it's still "av1_frame_header_flags" here?

> +
> +``AV1 Frame Flags``

[...]

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 1f85828d6694..53ff4d04a1b6 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c

[...]

> @@ -773,7 +1013,6 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>                 zero_padding(p_vp8_frame->entropy);
>                 zero_padding(p_vp8_frame->coder_state);
>                 break;
> -

Irrelevant change?

>         case V4L2_CTRL_TYPE_HEVC_SPS:
>                 p_hevc_sps = p;
>

[...]

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index e22921e7ea61..4d9d5823d575 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c

[...]

> @@ -1189,6 +1227,12 @@ const char *v4l2_ctrl_get_name(u32 id)
>         case V4L2_CID_STATELESS_HEVC_DECODE_MODE:               return "HEVC Decode Mode";
>         case V4L2_CID_STATELESS_HEVC_START_CODE:                return "HEVC Start Code";
>         case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:       return "HEVC Entry Point Offsets";
> +       case V4L2_CID_STATELESS_AV1_SEQUENCE:                   return "AV1 Sequence parameters";
> +       case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:           return "AV1 Tile Group Entry";

The return statement on this line is indented with space and tabs, while
the other lines only use tabs.

> +       case V4L2_CID_STATELESS_AV1_FRAME:                      return "AV1 Frame parameters";
> +       case V4L2_CID_STATELESS_AV1_PROFILE:                    return "AV1 Profile";
> +       case V4L2_CID_STATELESS_AV1_LEVEL:                      return "AV1 Level";
> +       case V4L2_CID_STATELESS_AV1_FILM_GRAIN:                 return "AV1 Film Grain";
>
>         /* Colorimetry controls */
>         /* Keep the order of the 'case's the same as in v4l2-controls.h! */

[...]

> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 00828a4f9404..d39d4eec2a97 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -52,6 +52,11 @@ struct video_device;
>   * @p_hdr10_cll:               Pointer to an HDR10 Content Light Level structure.
>   * @p_hdr10_mastering:         Pointer to an HDR10 Mastering Display structure.
>   * @p_area:                    Pointer to an area.
> + * @p_av1_sequence:            Pointer to an AV1 sequence.
> + * @p_av1_tile_group:          Pointer to an AV1 tile group.

Stale kernel-doc entry.


Regards
ChenYu
