Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0505A1CC8
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 00:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244180AbiHYWxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 18:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244112AbiHYWxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 18:53:39 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F924E61D
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 15:53:36 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14d:72b4:8284:19ed:f36a:47fa:2c31])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 184F06601EB5;
        Thu, 25 Aug 2022 23:53:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1661468014;
        bh=Y84O14ZKHFh64newRj2rAVn5YzAsDjcC5oio/83r+j8=;
        h=From:To:Cc:Subject:Date:From;
        b=NRscrB0QtbH7Wsnu7KKaysksipSQriu704oXRDf3GPfIxJeh0ZM8u4g+vYg+OcvmI
         VXU8ChclgQZLW6UnGRW9x6K3JEZnfYwkGQ3IH3uuKgw8/KLy5g+afl0NyEbTz10Gs0
         eBGo+/gCifSspbxyR7gx02STAu86X6uLXPIAXQhdvvP2lNHwq4sMDb8bZqKnqn9ltj
         e7/PWCnj4ceHwBUGmn5Is3X9CF8Ua96BdlGBIy2c47j7Tq+JujoddF9mtZDIUU4SI8
         YaiKHJUB612xGDfMyE1XyGfB5Gu6zomUCoYXhu5JyOAAmqr30FVjoDyeLq5xiNr22h
         8WTruOpMRG4qQ==
From:   daniel.almeida@collabora.com
To:     hverkuil@xs4all.nl
Cc:     Daniel Almeida <daniel.almeida@collabora.com>,
        linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [RFC PATCH v3] media: Add AV1 uAPI
Date:   Thu, 25 Aug 2022 19:53:12 -0300
Message-Id: <20220825225312.564619-1-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel Almeida <daniel.almeida@collabora.com>

This patch adds the  AOMedia Video 1 (AV1) kernel uAPI.

This design is based on currently available AV1 API implementations and
aims to support the development of AV1 stateless video codecs
on Linux.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changes from v2:

- Bump AV1 CIDs to HEVC+100

In light of the HEVC upstreaming, bump the AV1 CIDs to the values used by HEVC
by 100, in order to avoid conflicts. The range previously used by AV1 was taken
by HEVC, as it was merged first.

- Fix typo in enum v4l2_av1_frame_restoration_type

- Change u8 to __u8 in struct v4l2_av1_loop_restoration

- Rename v4l2_ctrl_av1_frame_header to v4l2_ctrl_av1_frame

- Fix a small typo

- Also include 6.8.16 in the loop filter docs

- delta_lf_multi is now a flag

- Stop using the BIT macro

- Move the AV1 CIDs below the VP9 ones

- Remove useless break

- Fix wrong docs for ref_frame_idx

- Remove tile_group control.

Data in this control is not currently used. The fact that VA-API does not have
a similar Buffer in its API hints that it probably will not be needed in the
future as well.

- Move av1 CIDs to the bottom of the stateless block

- Move V4L2_CTRL_TYPE_AV1_* to the end of the stateless block

- Remove stale film_grain doc from av1 frame

Changes from v1:

- Fixed the issues pointed out by Hans in his review (Thanks, Hans)
- Fixed the sign for ref_deltas and mode_deltas
    These are signed values and will otherwise fail the validation in
    v4l2-ctrls-core.c.
- Fix film grain y/cb/cr points validation
    We were controlling the entire array, but there is a subset of points
    being set, which lead to the validation to fail. Fix this by limiting
    the test to the number of points. The number of point is already
    controlled in the previous check so should be safe.
- Fix validation for Su(n) syntax 
    The Su(n) AV1 syntax ranges from -2^n/2 to 2^n/2 - 1, while the previous code
    was only validating values from -2^n/2 + 1 to 2^n/2 - 1.
- Fix order_hints and buffer_removal_time
    The buffer_removal_time should have been 32 bit and the
    ref_order_hint got confused with order_hints. We want the
    second one, as the first one is only used as a backup to
    fill the second on missing last frame.
- Fix off by one error in validation code
    There are 5 segmentation flags, so any code that sets the most significant
    flag would automatically fail.
- Feature data can be negative
    Feature data can be negative if Segmentation_Feature_Signed[j] == 1, in which
    case it is read with the Su(n) syntax.
    Reflect that by changing the data type to s16.
- Remove large scale mode controls
    Large scale mode is not supported. Remove all controls associated with it.
    This means that all TILE_LIST_* controls are gone.
- Split v4l2_av1_film_grain into its own control
    Split v4l2_av1_film_grain into its own control, as not all accelerators
    might support it. This control is now optional.
- Fix broken docs for v4l2_av1_interpolation_filter
    Docs mention VP9 instead of AV1. This is a typo.
- Fix broken docs for v4l2_ctrl_av1_tile_group_entry
    Fix a small typo in the docs.
- Fix AV1 reference lists
    We need both all the references and the per frame references. This is
    because unlike VP9, show_existing_frame that are key frame will refresh
    the frame slots, which prevents the driver from keeping track since
    these frame are not signalled to the driver.
    
    Instead mimic other API (like VA and DXVA) and provide a complete list
    of active references. The driver can then cleanup any data it was
    storing for references that are no longer in use, saving previous
    memory.
- Fix broken docs in ext-ctrls-codec-stateless.rst
   :c:type:`struct v4l2_ctrl_av1_tile_group_entry` would not resolve, it would
   also produce a warning when making the docs. Fix this by changing this to
   :c:type:`v4l2_ctrl_av1_tile_group_entry`  instead.


---
 .../userspace-api/media/v4l/biblio.rst        |   10 +
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 1206 +++++++++++++++++
 .../media/v4l/pixfmt-compressed.rst           |   16 +
 .../media/v4l/vidioc-g-ext-ctrls.rst          |   24 +
 .../media/v4l/vidioc-queryctrl.rst            |   30 +
 .../media/videodev2.h.rst.exceptions          |    6 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  261 +++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   59 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/media/v4l2-ctrls.h                    |    9 +
 include/uapi/linux/v4l2-controls.h            |  714 ++++++++++
 include/uapi/linux/videodev2.h                |   10 +
 12 files changed, 2345 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 9cd18c153d19..3e21e51ba329 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -427,3 +427,13 @@ VP9
 :title:     VP9 Bitstream & Decoding Process Specification
 
 :author:    Adrian Grange (Google), Peter de Rivaz (Argon Design), Jonathan Hunt (Argon Design)
+
+.. _av1:
+
+AV1
+===
+
+
+:title:     AV1 Bitstream & Decoding Process Specification
+
+:author:    Peter de Rivaz, Argon Design Ltd, Jack Haughton, Argon Design Ltd
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index cd33857d947d..5b549addfdde 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -2950,3 +2950,1209 @@ This structure contains all loop filter related parameters. See sections
     * - ``V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR``
       - 0x00000004
       -
+
+.. _v4l2-codec-stateless-av1:
+
+``V4L2_CID_STATELESS_AV1_SEQUENCE (struct)``
+    Represents an AV1 Sequence OBU. See section 5.5. "Sequence header OBU syntax"
+    in :ref:`av1` for more details.
+
+.. c:type:: v4l2_ctrl_av1_sequence
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
+
+.. flat-table:: struct v4l2_ctrl_av1_sequence
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``flags``
+      - See :ref:`AV1 Sequence Flags <av1_sequence_flags>`.
+    * - __u8
+      - ``seq_profile``
+      - Specifies the features that can be used in the coded video sequence.
+    * - __u8
+      - ``order_hint_bits``
+      - Specifies the number of bits used for the order_hint field at each frame.
+    * - __u8
+      - ``bit_depth``
+      - the bitdepth to use for the sequence as described in section 5.5.2
+        "Color config syntax" in :ref:`av1` for more details.
+    * - __u16
+      - ``max_frame_width_minus_1``
+      - specifies the maximum frame width minus 1 for the frames represented by
+        this sequence header.
+
+.. _av1_sequence_flags:
+
+``AV1 Sequence Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE``
+      - 0x00000001
+      - If set, specifies that the coded video sequence contains only one coded
+	frame. If not set, specifies that the coded video sequence contains one or
+	more coded frames.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK``
+      - 0x00000002
+      - If set, indicates that superblocks contain 128x128 luma samples.
+	When equal to 0, it indicates that superblocks contain 64x64 luma samples.
+	(The number of contained chroma samples depends on subsampling_x and
+	subsampling_y).
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_FILTER_INTRA``
+      - 0x00000004
+      - If set, specifies that the use_filter_intra syntax element may be
+	present. If not set, specifies that the use_filter_intra syntax element will
+	not be present.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTRA_EDGE_FILTER``
+      - 0x00000008
+      - Specifies whether the intra edge filtering process should be enabled.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTERINTRA_COMPOUND``
+      - 0x00000010
+      - If set, specifies that the mode info for inter blocks may contain the
+	syntax element interintra. If not set, specifies that the syntax element
+	interintra will not be present.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND``
+      - 0x00000020
+      - If set, specifies that the mode info for inter blocks may contain the
+	syntax element compound_type. If not set, specifies that the syntax element
+	compound_type will not be present.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_WARPED_MOTION``
+      - 0x00000040
+      - If set, indicates that the allow_warped_motion syntax element may be
+	present. If not set, indicates that the allow_warped_motion syntax element
+	will not be present.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_DUAL_FILTER``
+      - 0x00000080
+      - If set, indicates that the inter prediction filter type may be specified
+	independently in the horizontal and vertical directions. If the flag is
+	equal to 0, only one filter type may be specified, which is then used in
+	both directions.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_ORDER_HINT``
+      - 0x00000100
+      - If set, indicates that tools based on the values of order hints may be
+	used. If not set, indicates that tools based on order hints are disabled.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_JNT_COMP``
+      - 0x00000200
+      - If set, indicates that the distance weights process may be used for
+	inter prediction.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_REF_FRAME_MVS``
+      - 0x00000400
+      - If set, indicates that the use_ref_frame_mvs syntax element may be
+	present. If not set, indicates that the use_ref_frame_mvs syntax element
+	will not be present.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_SUPERRES``
+      - 0x00000800
+      - If set, specifies that the use_superres syntax element will be present
+	in the uncompressed header. If not set, specifies that the use_superres
+	syntax element will not be present (instead use_superres will be set to 0
+	in the uncompressed header without being read).
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF``
+      - 0x00001000
+      - If set, specifies that cdef filtering may be enabled. If not set,
+	specifies that cdef filtering is disabled.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_ENABLE_RESTORATION``
+      - 0x00002000
+      - If set, specifies that loop restoration filtering may be enabled. If not
+	set, specifies that loop restoration filtering is disabled.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME``
+      - 0x00004000
+      - If set, indicates that the video does not contain U and V color planes.
+	If not set, indicates that the video contains Y, U, and V color planes.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_COLOR_RANGE``
+      - 0x00008000
+      - If set, signals full swing representation. If not set, signals studio
+	swing representation.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X``
+      - 0x00010000
+      - Specify the chroma subsampling format.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y``
+      - 0x00020000
+      - Specify the chroma subsampling format.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_FILM_GRAIN_PARAMS_PRESENT``
+      - 0x00040000
+      - Specifies whether film grain parameters are present in the coded video
+	sequence.
+    * - ``V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q``
+      - 0x00080000
+      - If set, indicates that the U and V planes may have separate delta
+	quantizer values. If not set, indicates that the U and V planes will share
+	the same delta quantizer value.
+
+``V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY (struct)``
+    Represents a single AV1 tile inside an AV1 Tile Group. Note that MiRowStart,
+    MiRowEnd, MiColStart and MiColEnd can be retrieved from struct
+    v4l2_av1_tile_info in struct v4l2_ctrl_av1_frame_header using tile_row and
+    tile_col. See section 6.10.1 "General tile group OBU semantics" in
+    :ref:`av1` for more details.
+
+.. c:type:: v4l2_ctrl_av1_tile_group_entry
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
+
+.. flat-table:: struct v4l2_ctrl_av1_tile_group_entry
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``tile_offset``
+      - Offset from the OBU data, i.e. where the coded tile data actually starts.
+    * - __u32
+      - ``tile_size``
+      - Specifies the size in bytes of the coded tile. Equivalent to "TileSize"
+        in :ref:`av1`.
+    * - __u32
+      - ``tile_row``
+      - Specifies the row of the current tile. Equivalent to "TileRow" in
+        :ref:`av1`.
+    * - __u32
+      - ``tile_col``
+      - Specifies the column of the current tile. Equivalent to "TileColumn" in
+        :ref:`av1`.
+
+.. c:type:: v4l2_av1_warp_model
+
+	AV1 Warp Model as described in section 3 "Symbols and abbreviated terms" of
+	:ref:`av1`.
+
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{7.4cm}|p{0.3cm}|p{9.6cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_WARP_MODEL_IDENTITY``
+      - 0
+      - Warp model is just an identity transform.
+    * - ``V4L2_AV1_WARP_MODEL_TRANSLATION``
+      - 1
+      - Warp model is a pure translation.
+    * - ``V4L2_AV1_WARP_MODEL_ROTZOOM``
+      - 2
+      - Warp model is a rotation + symmetric zoom + translation.
+    * - ``V4L2_AV1_WARP_MODEL_AFFINE``
+      - 3
+      - Warp model is a general affine transform.
+
+.. c:type:: v4l2_av1_reference_frame
+
+AV1 Reference Frames as described in section 6.10.24. "Ref frames semantics"
+of :ref:`av1`.
+
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{7.4cm}|p{0.3cm}|p{9.6cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_REF_INTRA_FRAME``
+      - 0
+      - Intra Frame Reference.
+    * - ``V4L2_AV1_REF_LAST_FRAME``
+      - 1
+      - Last Frame Reference.
+    * - ``V4L2_AV1_REF_LAST2_FRAME``
+      - 2
+      - Last2 Frame Reference.
+    * - ``V4L2_AV1_REF_LAST3_FRAME``
+      - 3
+      - Last3 Frame Reference.
+    * - ``V4L2_AV1_REF_GOLDEN_FRAME``
+      - 4
+      - Golden Frame Reference.
+    * - ``V4L2_AV1_REF_BWDREF_FRAME``
+      - 5
+      - BWD Frame Reference.
+    * - ``V4L2_AV1_REF_ALTREF2_FRAME``
+      - 6
+      - ALTREF2 Frame Reference.
+    * - ``V4L2_AV1_REF_ALTREF_FRAME``
+      - 7
+      - ALTREF Frame Reference.
+    * - ``V4L2_AV1_NUM_REF_FRAMES``
+      - 8
+      - Total number of reference frames.
+
+.. c:type:: v4l2_av1_global_motion
+
+AV1 Global Motion parameters as described in section 6.8.17
+"Global motion params semantics" of :ref:`av1` for more details.
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
+
+.. flat-table:: struct v4l2_av1_global_motion
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``flags[V4L2_AV1_TOTAL_REFS_PER_FRAME]``
+      - A bitfield containing the flags per reference frame. See
+        :ref:`AV1 Global Motion Flags <av1_global_motion_flags>` for more
+        details.
+    * - enum :c:type:`v4l2_av1_warp_model`
+      - ``type[V4L2_AV1_TOTAL_REFS_PER_FRAME]``
+      - The type of global motion transform used.
+    * - __u32
+      - ``params[V4L2_AV1_TOTAL_REFS_PER_FRAME][6]``
+      - This field has the same meaning as "gm_params" in :ref:`av1`.
+    * - __u8
+      - ``invalid``
+      - Bitfield indicating whether the global motion params are invalid for a
+        given reference frame. See section 7.11.3.6. Setup shear process and the
+        variable "warpValid". Use V4L2_AV1_GLOBAL_MOTION_IS_INVALID(ref) to
+        create a suitable mask.
+
+.. _av1_global_motion_flags:
+
+``AV1 Global Motion Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_GLOBAL_MOTION_FLAG_IS_GLOBAL``
+      - 0x00000001
+      - Specifies whether global motion parameters are present for a particular
+        reference frame.
+    * - ``V4L2_AV1_GLOBAL_MOTION_FLAG_IS_ROT_ZOOM``
+      - 0x00000002
+      - Specifies whether a particular reference frame uses rotation and zoom
+        global motion.
+    * - ``V4L2_AV1_GLOBAL_MOTION_FLAG_IS_TRANSLATION``
+      - 0x00000004
+      - Specifies whether a particular reference frame uses rotation and zoom
+        global motion.
+
+.. c:type:: v4l2_av1_frame_restoration_type
+
+AV1 Frame Restoration Type.
+
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{7.4cm}|p{0.3cm}|p{9.6cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_FRAME_RESTORE_NONE``
+      - 0
+      - No filtering is applied.
+    * - ``V4L2_AV1_FRAME_RESTORE_WIENER``
+      - 1
+      - Wiener filter process is invoked.
+    * - ``V4L2_AV1_FRAME_RESTORE_SGRPROJ``
+      - 2
+      - Self guided filter process is invoked.
+    * - ``V4L2_AV1_FRAME_RESTORE_SWITCHABLE``
+      - 3
+      - Restoration filter is swichtable.
+
+.. c:type:: v4l2_av1_loop_restoration
+
+AV1 Loop Restauration as described in section 6.10.15 "Loop restoration params
+semantics" of :ref:`av1`.
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
+
+.. flat-table:: struct v4l2_av1_loop_restoration
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``flags``
+      - See :ref:`AV1 Loop Restoration Flags <av1_loop_restoration_flags>`.
+    * - :c:type:`v4l2_av1_frame_restoration_type`
+      - ``frame_restoration_type[V4L2_AV1_NUM_PLANES_MAX]``
+      - Specifies the type of restoration used for each plane.
+    * - __u8
+      - ``lr_unit_shift``
+      - Specifies if the luma restoration size should be halved.
+    * - __u8
+      - ``lr_uv_shift``
+      - Specifies if the chroma size should be half the luma size.
+    * - __u8
+      - ``loop_restoration_size[V4L2_AV1_MAX_NUM_PLANES]``
+      - specifies the size of loop restoration units in units of samples in the
+        current plane.
+
+.. _av1_loop_restoration_flags:
+
+``AV1 Loop Restoration Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_LOOP_RESTORATION_FLAG_USES_LR``
+      - 0x00000001
+      - Retains the same meaning as UsesLr in :ref:`av1`.
+    * - ``V4L2_AV1_LOOP_RESTORATION_FLAG_USES_CHROMA_LR``
+      - 0x00000002
+      - Retains the same meaning as UsesChromaLr in :ref:`av1`.
+
+.. c:type:: v4l2_av1_cdef
+
+AV1 CDEF params semantics as described in section 6.10.14. "CDEF params
+semantics" of :ref:`av1`.
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
+
+.. flat-table:: struct v4l2_av1_cdef
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``damping_minus_3``
+      - Controls the amount of damping in the deringing filter.
+    * - __u8
+      - ``bits``
+      - Specifies the number of bits needed to specify which CDEF filter to
+        apply.
+    * - __u8
+      - ``y_pri_strength[V4L2_AV1_CDEF_MAX]``
+      -  Specifies the strength of the primary filter.
+    * - __u8
+      - ``y_sec_strength[V4L2_AV1_CDEF_MAX]``
+      -  Specifies the strength of the secondary filter.
+    * - __u8
+      - ``uv_pri_strength[V4L2_AV1_CDEF_MAX]``
+      -  Specifies the strength of the primary filter.
+    * - __u8
+      - ``uv_secondary_strength[V4L2_AV1_CDEF_MAX]``
+      -  Specifies the strength of the secondary filter.
+
+.. c:type:: v4l2_av1_segment_feature
+
+AV1 segment features as described in section 3 "Symbols and abbreviated terms"
+of :ref:`av1`.
+
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{7.4cm}|p{0.3cm}|p{9.6cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_SEG_LVL_ALT_Q``
+      - 0
+      - Index for quantizer segment feature.
+    * - ``V4L2_AV1_SEG_LVL_ALT_LF_Y_V``
+      - 1
+      - Index for vertical luma loop filter segment feature.
+    * - ``V4L2_AV1_SEG_LVL_REF_FRAME``
+      - 5
+      - Index for reference frame segment feature.
+    * - ``V4L2_AV1_SEG_LVL_REF_SKIP``
+      - 6
+      - Index for skip segment feature.
+    * - ``V4L2_AV1_SEG_LVL_REF_GLOBALMV``
+      - 7
+      - Index for global mv feature.
+    * - ``V4L2_AV1_SEG_LVL_MAX``
+      - 8
+      - Number of segment features.
+
+.. c:type:: v4l2_av1_segmentation
+
+AV1 Segmentation params as defined in section 6.8.13. "Segmentation params
+semantics" of :ref:`av1`.
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
+
+.. flat-table:: struct v4l2_av1_film_grain
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``flags``
+      - See :ref:`AV1 Segmentation Flags <av1_segmentation_flags>`
+    * - __u8
+      - ``feature_enabled[V4L2_AV1_MAX_SEGMENTS]``
+      - Bitmask defining which features are enabled in each segment. Use
+        V4L2_AV1_SEGMENT_FEATURE_ENABLED to build a suitable mask.
+    * - __u16
+      - `feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX]``
+      -  Data attached to each feature. Data entry is only valid if the feature
+         is enabled
+    * - __u8
+      - ``last_active_seg_id``
+      -  Indicates the highest numbered segment id that has some
+         enabled feature. This is used when decoding the segment id to only decode
+         choices corresponding to used segments.
+
+.. _av1_segmentation_flags:
+
+``AV1 Segmentation Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_SEGMENTATION_FLAG_ENABLED``
+      - 0x00000001
+      - If set, indicates that this frame makes use of the segmentation tool. If
+        not set, indicates that the frame does not use segmentation.
+    * - ``V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP``
+      - 0x00000002
+      - If set, indicates that the segmentation map are updated during the
+        decoding of this frame. If not set, indicates that the segmentation map
+        from the previous frame is used.
+    * - ``V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE``
+      - 0x00000004
+      - If set, indicates that the updates to the segmentation map are coded
+        relative to the existing segmentation map. If not set, indicates that
+        the new segmentation map is coded without reference to the existing
+        segmentation map.
+    * - ``V4L2_AV1_SEGMENTATION_FLAG_UPDATE_DATA``
+      - 0x00000008
+      - If set, indicates that the updates to the segmentation map are coded
+        relative to the existing segmentation map. If not set, indicates that
+        the new segmentation map is coded without reference to the existing
+        segmentation map.
+    * - ``V4L2_AV1_SEGMENTATION_FLAG_SEG_ID_PRE_SKIP``
+      - 0x00000010
+      - If set, indicates that the segment id will be read before the skip
+        syntax element. If not set, indicates that the skip syntax element will
+        be read first.
+
+.. c:type:: v4l2_av1_loop_filter
+
+AV1 Loop filter params as defined in section 6.8.10. "Loop filter semantics" of
+:ref:`av1`.
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
+
+.. flat-table:: struct v4l2_av1_global_motion
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``flags``
+      - See
+        :ref:`AV1 Loop Filter flags <av1_loop_filter_flags>` for more details.
+    * - __u8
+      - ``level[4]``
+      - an array containing loop filter strength values. Different loop
+        filter strength values from the array are used depending on the image
+        plane being filtered, and the edge direction (vertical or horizontal)
+        being filtered.
+    * - __u8
+      - ``sharpness``
+      - indicates the sharpness level. The loop_filter_level and
+        loop_filter_sharpness together determine when a block edge is filtered,
+        and by how much the filtering can change the sample values. The loop
+        filter process is described in section 7.14 of :ref:`av1`.
+    * - __u8
+      - ``ref_deltas[V4L2_AV1_TOTAL_REFS_PER_FRAME]``
+      - contains the adjustment needed for the filter level based on the
+        chosen reference frame. If this syntax element is not present, it
+        maintains its previous value.
+    * - __u8
+      - ``mode_deltas[2]``
+      - contains the adjustment needed for the filter level based on
+        the chosen mode. If this syntax element is not present, it maintains its
+        previous value.
+    * - __u8
+      - ``delta_lf_res``
+      - specifies the left shift which should be applied to decoded loop filter
+        delta values.
+    * - __u8
+      - ``delta_lf_multi``
+      - a value equal to 1 specifies that separate loop filter
+        deltas are sent for horizontal luma edges, vertical luma edges, the U
+        edges, and the V edges. A value of delta_lf_multi equal to 0 specifies
+        that the same loop filter delta is used for all edges.
+
+.. _av1_loop_filter_flags:
+
+``AV1 Loop Filter Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_LOOP_FILTER_FLAG_DELTA_ENABLED``
+      - 0x00000001
+      - If set, means that the filter level depends on the mode and reference
+        frame used to predict a block. If not set, means that the filter level
+        does not depend on the mode and reference frame.
+    * - ``V4L2_AV1_LOOP_FILTER_FLAG_DELTA_UPDATE``
+      - 0x00000002
+      - If set, means that additional syntax elements are present that specify
+        which mode and reference frame deltas are to be updated. If not set,
+        means that these syntax elements are not present.
+    * - ``V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_PRESENT``
+      - 0x00000004
+      - Specifies whether loop filter delta values are present
+    * - ``V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_MULTI``
+      - 0x00000008
+      - A value equal to 1 specifies that separate loop filter
+        deltas are sent for horizontal luma edges, vertical luma edges,
+        the U edges, and the V edges. A value of delta_lf_multi equal to 0
+        specifies that the same loop filter delta is used for all edges.
+
+
+.. c:type:: v4l2_av1_quantization
+
+AV1 Quantization params as defined in section 6.8.11 "Quantization params
+semantics" of :ref:`av1`.
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
+
+.. flat-table:: struct v4l2_av1_quantization
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``flags``
+      - See
+        :ref:`AV1 Loop Filter flags <av1_quantization_flags>` for more details.
+    * - __u8
+      - ``base_q_idx``
+      - Indicates the base frame qindex. This is used for Y AC coefficients and
+        as the base value for the other quantizers.
+    * - __u8
+      - ``delta_q_y_dc``
+      - Indicates the Y DC quantizer relative to base_q_idx.
+    * - __u8
+      - ``delta_q_u_dc``
+      - Indicates the U DC quantizer relative to base_q_idx.
+    * - __u8
+      - ``delta_q_u_ac``
+      - Indicates the U AC quantizer relative to base_q_idx.
+    * - __u8
+      - ``delta_q_v_dc``
+      - Indicates the V DC quantizer relative to base_q_idx.
+    * - __u8
+      - ``delta_q_v_dc``
+      - Indicates the V DC quantizer relative to base_q_idx.
+    * - __u8
+      - ``qm_y``
+      - Specifies the level in the quantizer matrix that should be used for
+        luma plane decoding.
+    * - __u8
+      - ``qm_u``
+      - Specifies the level in the quantizer matrix that should be used for
+        chroma U plane decoding.
+    * - __u8
+      - ``qm_y``
+      - Specifies the level in the quantizer matrix that should be used for
+        chroma V plane decoding.
+    * - __u8
+      - ``delta_q_res``
+      - Specifies the left shift which should be applied to decoded quantizer
+        index delta values.
+
+.. _av1_quantization_flags:
+
+``AV1 Quantization Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_QUANTIZATION_FLAG_DIFF_UV_DELTA``
+      - 0x00000001
+      - If set, indicates that the U and V delta quantizer values are coded
+        separately. If not set, indicates that the U and V delta quantizer
+        values share a common value.
+    * - ``V4L2_AV1_QUANTIZATION_FLAG_USING_QMATRIX``
+      - 0x00000002
+      - If set, specifies that the quantizer matrix will be used to compute
+        quantizers.
+    * - ``V4L2_AV1_QUANTIZATION_FLAG_DELTA_Q_PRESENT``
+      - 0x00000004
+      - Specifies whether quantizer index delta values are present.
+
+.. c:type:: v4l2_av1_tile_info
+
+AV1 Tile info as defined in section 6.8.14. "Tile info semantics" of ref:`av1`.
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
+
+.. flat-table:: struct v4l2_av1_film_grain
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``flags``
+      - See
+        :ref:`AV1 Tile Info flags <av1_tile_info_flags>` for more details.
+    * - __u32
+      - ``mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1]``
+      - An array specifying the start column (in units of 4x4 luma
+        samples) for each tile across the image.
+    * - __u32
+      - ``mi_row_starts[V4L2_AV1_MAX_TILE_ROWS + 1]``
+      - An array specifying the start row (in units of 4x4 luma
+        samples) for each tile across the image.
+    * - __u32
+      - ``width_in_sbs_minus_1[V4L2_AV1_MAX_TILE_COLS]``
+      - Specifies the width of a tile minus 1 in units of superblocks.
+    * - __u32
+      - ``height_in_sbs_minus_1[V4L2_AV1_MAX_TILE_ROWS]``
+      - Specifies the height of a tile minus 1 in units of superblocks.
+    * - __u8
+      - ``tile_size_bytes``
+      - Specifies the number of bytes needed to code each tile size.
+    * - __u8
+      - ``context_update_tile_id``
+      - Specifies which tile to use for the CDF update.
+    * - __u8
+      - ``tile_rows``
+      - Specifies the number of tiles down the frame.
+    * - __u8
+      - ``tile_rows``
+      - Specifies the number of tiles across the frame.
+
+.. _av1_tile_info_flags:
+
+``AV1 Tile Info Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING``
+      - 0x00000001
+      - If set, means that the tiles are uniformly spaced across the frame. (In
+        other words, all tiles are the same size except for the ones at the
+        right and bottom edge which can be smaller). If not set means that the
+        tile sizes are coded.
+
+.. c:type:: v4l2_av1_frame_type
+
+AV1 Frame Type
+
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{7.4cm}|p{0.3cm}|p{9.6cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_KEY_FRAME``
+      - 0
+      - Key frame.
+    * - ``V4L2_AV1_INTER_FRAME``
+      - 1
+      - Inter frame.
+    * - ``V4L2_AV1_INTRA_ONLY_FRAME``
+      - 2
+      - Intra-only frame.
+    * - ``V4L2_AV1_SWITCH_FRAME``
+      - 3
+      - Switch frame.
+
+.. c:type:: v4l2_av1_interpolation_filter
+
+AV1 Interpolation Filter
+
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{7.4cm}|p{0.3cm}|p{9.6cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP``
+      - 0
+      - Eight tap filter.
+    * - ``V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH``
+      - 1
+      - Eight tap smooth filter.
+    * - ``V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP``
+      - 2
+      - Eight tap sharp filter.
+    * - ``V4L2_AV1_INTERPOLATION_FILTER_BILINEAR``
+      - 3
+      - Bilinear filter.
+    * - ``V4L2_AV1_INTERPOLATION_FILTER_SWITCHABLE``
+      - 4
+      - Filter selection is signaled at the block level.
+
+.. c:type:: v4l2_av1_tx_mode
+
+AV1 Tx mode as described in section 6.8.21 "TX mode semantics" of :ref:`av1`.
+
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{7.4cm}|p{0.3cm}|p{9.6cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_TX_MODE_ONLY_4X4``
+      - 0
+      -  The inverse transform will use only 4x4 transforms.
+    * - ``V4L2_AV1_TX_MODE_LARGEST``
+      - 1
+      - The inverse transform will use the largest transform size that fits
+        inside the block.
+    * - ``V4L2_AV1_TX_MODE_SELECT``
+      - 2
+      - The choice of transform size is specified explicitly for each block.
+
+``V4L2_CID_STATELESS_AV1_FRAME (struct)``
+    Represents a Frame Header OBU. See 6.8. "Frame Header OBU semantics" of
+    :ref:`av1` for more details.
+
+.. c:type:: v4l2_ctrl_av1_frame
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
+
+.. flat-table:: struct v4l2_ctrl_av1_frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - struct :c:type:`v4l2_av1_tile_info`
+      - ``tile_info``
+      - Tile info
+    * - struct :c:type:`v4l2_av1_quantization`
+      - ``quantization``
+      - Quantization params
+    * - struct :c:type:`v4l2_av1_segmentation`
+      - ``segmentation``
+      - Segmentation params
+    * - struct :c:type:`v4l2_av1_loop_filter`
+      - ``loop_filter``
+      - Loop filter params
+    * - struct :c:type:`v4l2_av1_cdef`
+      - ``cdef``
+      - CDEF params
+    * - struct :c:type:`v4l2_av1_loop_restoration`
+      - ``loop_restoration``
+      - Loop restoration params
+    * - struct :c:type:`v4l2_av1_loop_restoration`
+      - ``loop_restoration``
+      - Loop restoration params
+    * - struct :c:type:`v4l2_av1_loop_global_motion`
+      - ``global_motion``
+      - Global motion params
+    * - __u32
+      - ``flags``
+      - See
+        :ref:`AV1 Tile Info flags <av1_frame_flags>` for more details.
+    * - enum :c:type:`v4l2_av1_frame_type`
+      - ``frame_type``
+      - Specifies the AV1 frame type
+    * - __u32
+      - ``order_hint``
+      - Specifies OrderHintBits least significant bits of the expected output
+        order for this frame.
+    * - __u8
+      - ``superres_denom``
+      - The denominator for the upscaling ratio.
+    * - __u32
+      - ``upscaled_width``
+      - The upscaled width.
+    * - enum :c:type:`v4l2_av1_interpolation_filter`
+      - ``interpolation_filter``
+      - Specifies the filter selection used for performing inter prediction.
+    * - enum :c:type:`v4l2_av1_tx_mode`
+      - ``tx_mode``
+      - Specifies how the transform size is determined.
+    * - __u32
+      - ``frame_width_minus_1``
+      - Add 1 to get the frame's width.
+    * - __u32
+      - ``frame_height_minus_1``
+      - Add 1 to get the frame's height.
+    * - __u16
+      - ``render_width_minus_1``
+      - Add 1 to get the render width of the frame in luma samples.
+    * - __u16
+      - ``render_height_minus_1``
+      - Add 1 to get the render height of the frame in luma samples.
+    * - __u32
+      - ``current_frame_id``
+      - Specifies the frame id number for the current frame. Frame
+        id numbers are additional information that do not affect the decoding
+        process, but provide decoders with a way of detecting missing reference
+        frames so that appropriate action can be taken.
+    * - __u8
+      - ``primary_ref_frame``
+      - Specifies which reference frame contains the CDF values and other state
+        that should be loaded at the start of the frame..
+    * - __u8
+      - ``buffer_removal_time[V4L2_AV1_MAX_OPERATING_POINTS]``
+      - Specifies the frame removal time in units of DecCT clock ticks counted
+        from the removal time of the last random access point for operating point
+        opNum.
+    * - __u8
+      - ``refresh_frame_flags[V4L2_AV1_MAX_OPERATING_POINTS]``
+      - Contains a bitmask that specifies which reference frame slots will be
+        updated with the current frame after it is decoded.
+    * - __u32
+      - ``ref_order_hint[V4L2_AV1_NUM_REF_FRAMES]``
+      - Specifies the expected output order hint for each reference frame.
+    * - __s8
+      - ``last_frame_idx``
+      - Specifies the reference frame to use for LAST_FRAME.
+    * - __s8
+      - ``gold_frame_idx``
+      - Specifies the reference frame to use for GOLDEN_FRAME.
+    * - __u64
+      - ``reference_frame_ts[V4L2_AV1_TOTAL_REFS_PER_FRAME]``
+      - the V4L2 timestamp for each of the reference frames enumerated in
+        enum :c:type:`v4l2_av1_reference_frame` starting at
+        ``V4L2_AV1_REF_LAST_FRAME``. This represent the state of reference
+        slot as describe in the spec and updated by userland through the
+        `Reference frame update process` in section 7.20. The timestamp refers
+        to the ``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
+        :c:func:`v4l2_timeval_to_ns()` function to convert the struct
+        :c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
+    * - __u8
+      - ``ref_frame_idx[V4L2_AV1_REFS_PER_FRAME]``
+      - an index into ``reference_frame_ts`` representing the ordered list of
+        references used by inter-frame. Matches the bitstream syntax
+        element of the same name.
+    * - __u8
+      - ``skip_mode_frame[2]``
+      - Specifies the frames to use for compound prediction when skip_mode is
+        equal to 1.
+
+.. _av1_frame_header_flags:
+
+``AV1 Frame Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_FRAME_FLAG_SHOW_FRAME``
+      - 0x00000001
+      - If set, specifies that this frame should be immediately output once
+        decoded. If not set, specifies that this frame should not be immediately
+        output. (It may be output later if a later uncompressed header uses
+        show_existing_frame equal to 1).
+    * - ``V4L2_AV1_FRAME_FLAG_SHOWABLE_FRAME``
+      - 0x00000002
+      - If set, specifies that the frame may be output using the
+        show_existing_frame mechanism. If not set, specifies that this frame
+        will not be output using the show_existing_frame mechanism.
+    * - ``V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE``
+      - 0x00000004
+      - Specifies whether error resilient mode is enabled.
+    * - ``V4L2_AV1_FRAME_FLAG_DISABLE_CDF_UPDATE``
+      - 0x00000008
+      - Specifies whether the CDF update in the symbol decoding process should
+        be disabled.
+    * - ``V4L2_AV1_FRAME_FLAG_ALLOW_SCREEN_CONTENT_TOOLS``
+      - 0x00000010
+      - Specifies whether the CDF update in the symbol decoding process should
+        be disabled.
+    * - ``V4L2_AV1_FRAME_FLAG_FORCE_INTEGER_MV``
+      - 0x00000020
+      - If set, specifies that motion vectors will always be integers. If not
+        set, specifies that motion vectors can contain fractional bits.
+    * - ``V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC``
+      - 0x00000040
+      - If set, indicates that intra block copy may be used in this frame. If
+        not set, indicates that intra block copy is not allowed in this frame.
+    * - ``V4L2_AV1_FRAME_FLAG_USE_SUPERRES``
+      - 0x00000080
+      - If set, indicates that upscaling is needed.
+    * - ``V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV``
+      - 0x00000100
+      - If set, specifies that motion vectors are specified to eighth pel
+        precision. If not set, specifies that motion vectors are specified to
+        quarter pel precision;
+    * - ``V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE``
+      - 0x00000200
+      - If not set, specifies that only the SIMPLE motion mode will be used.
+    * - ``V4L2_AV1_FRAME_FLAG_USE_REF_FRAME_MVS``
+      - 0x00000400
+      - If set specifies that motion vector information from a previous frame
+        can be used when decoding the current frame. If not set, specifies that
+        this information will not be used.
+    * - ``V4L2_AV1_FRAME_FLAG_DISABLE_FRAME_END_UPDATE_CDF``
+      - 0x00000800
+      - If set indicates that the end of frame CDF update is disabled. If not
+        set, indicates that the end of frame CDF update is enabled
+    * - ``V4L2_AV1_FRAME_FLAG_UNIFORM_TILE_SPACING``
+      - 0x00001000
+      - If set, means that the tiles are uniformly spaced across the frame. (In
+        other words, all tiles are the same size except for the ones at the
+        right and bottom edge which can be smaller). If not set, means that the
+        tile sizes are coded
+    * - ``V4L2_AV1_FRAME_FLAG_ALLOW_WARPED_MOTION``
+      - 0x00002000
+      - If set, indicates that the syntax element motion_mode may be present, if
+        not set, indicates that the syntax element motion_mode will not be
+        present.
+    * - ``V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT``
+      - 0x00004000
+      - If set, specifies that the mode info for inter blocks contains the
+        syntax element comp_mode that indicates whether to use single or
+        compound reference prediction. If not set, specifies that all inter
+        blocks will use single prediction.
+    * - ``V4L2_AV1_FRAME_FLAG_REDUCED_TX_SET``
+      - 0x00008000
+      - If set, specifies that the frame is restricted to a reduced subset of
+        the full set of transform types.
+    * - ``V4L2_AV1_FRAME_FLAG_SKIP_MODE_ALLOWED``
+      - 0x00010000
+      - This flag retains the same meaning as SkipModeAllowed in :ref:`av1`.
+    * - ``V4L2_AV1_FRAME_FLAG_SKIP_MODE_PRESENT``
+      - 0x00020000
+      - If set, specifies that the syntax element skip_mode will be present, if
+        not set, specifies that skip_mode will not be used for this frame.
+    * - ``V4L2_AV1_FRAME_FLAG_FRAME_SIZE_OVERRIDE``
+      - 0x00040000
+      - If set, specifies that the frame size will either be specified as the
+        size of one of the reference frames, or computed from the
+        frame_width_minus_1 and frame_height_minus_1 syntax elements. If not
+        set, specifies that the frame size is equal to the size in the sequence
+        header.
+    * - ``V4L2_AV1_FRAME_FLAG_BUFFER_REMOVAL_TIME_PRESENT``
+      - 0x00080000
+      - If set, specifies that buffer_removal_time is present. If not set,
+        specifies that buffer_removal_time is not present.
+    * - ``V4L2_AV1_FRAME_FLAG_FRAME_REFS_SHORT_SIGNALING``
+      - 0x00100000
+      - If set, indicates that only two reference frames are explicitly
+        signaled. If not set, indicates that all reference frames are explicitly
+        signaled.
+
+``V4L2_CID_STATELESS_AV1_FILM_GRAIN (struct)``
+    Represents the optional film grain parameters. See section
+    6.8.20. "Film grain params semantics" of :ref:`av1` for more details.
+
+.. c:type:: v4l2_ctrl_av1_film_grain
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
+
+.. flat-table:: struct v4l2_av1_film_grain
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``flags``
+      - See :ref:`AV1 Film Grain Flags <av1_film_grain_flags>`.
+    * - __u16
+      - ``grain_seed``
+      - Specifies the starting value for the pseudo-random numbers used during
+	film grain synthesis.
+    * - __u8
+      - ``film_grain_params_ref_idx``
+      - Indicates which reference frame contains the film grain parameters to be
+	used for this frame.
+    * - __u8
+      - ``num_y_points``
+      - Specifies the number of points for the piece-wise linear scaling
+	function of the luma component.
+    * - __u8
+      - ``point_y_value[V4L2_AV1_MAX_NUM_Y_POINTS]``
+      - Represents the x (luma value) coordinate for the i-th point
+        of the piecewise linear scaling function for luma component. The values
+        are signaled on the scale of 0..255. (In case of 10 bit video, these
+        values correspond to luma values divided by 4. In case of 12 bit video,
+        these values correspond to luma values divided by 16.).
+    * - __u8
+      - ``point_y_scaling[V4L2_AV1_MAX_NUM_Y_POINTS]``
+      - Represents the scaling (output) value for the i-th point
+	of the piecewise linear scaling function for luma component.
+    * - __u8
+      - ``num_cb_points``
+      -  Specifies the number of points for the piece-wise linear scaling
+         function of the cb component.
+    * - __u8
+      - ``point_cb_value[V4L2_AV1_MAX_NUM_CB_POINTS]``
+      - Represents the x coordinate for the i-th point of the
+        piece-wise linear scaling function for cb component. The values are
+        signaled on the scale of 0..255.
+    * - __u8
+      - ``point_cb_scaling[V4L2_AV1_MAX_NUM_CB_POINTS]``
+      - Represents the scaling (output) value for the i-th point of the
+        piecewise linear scaling function for cb component.
+    * - __u8
+      - ``num_cr_points``
+      - Represents the number of points for the piece-wise
+        linear scaling function of the cr component.
+    * - __u8
+      - ``point_cr_value[V4L2_AV1_MAX_NUM_CR_POINTS]``
+      - Represents the x coordinate for the i-th point of the
+        piece-wise linear scaling function for cr component. The values are
+        signaled on the scale of 0..255.
+    * - __u8
+      - ``point_cr_scaling[V4L2_AV1_MAX_NUM_CR_POINTS]``
+      - Represents the scaling (output) value for the i-th point of the
+        piecewise linear scaling function for cr component.
+    * - __u8
+      - ``grain_scaling_minus_8``
+      - Represents the shift – 8 applied to the values of the chroma component.
+        The grain_scaling_minus_8 can take values of 0..3 and determines the
+        range and quantization step of the standard deviation of film grain.
+    * - __u8
+      - ``ar_coeff_lag``
+      - Specifies the number of auto-regressive coefficients for luma and
+	chroma.
+    * - __u8
+      - ``ar_coeffs_y_plus_128[V4L2_AV1_MAX_NUM_POS_LUMA]``
+      - Specifies auto-regressive coefficients used for the Y plane.
+    * - __u8
+      - ``ar_coeffs_cb_plus_128[V4L2_AV1_MAX_NUM_POS_LUMA]``
+      - Specifies auto-regressive coefficients used for the U plane.
+    * - __u8
+      - ``ar_coeffs_cr_plus_128[V4L2_AV1_MAX_NUM_POS_LUMA]``
+      - Specifies auto-regressive coefficients used for the V plane.
+    * - __u8
+      - ``ar_coeff_shift_minus_6``
+      - Specifies the range of the auto-regressive coefficients. Values of 0,
+        1, 2, and 3 correspond to the ranges for auto-regressive coefficients of
+        [-2, 2), [-1, 1), [-0.5, 0.5) and [-0.25, 0.25) respectively.
+    * - __u8
+      - ``grain_scale_shift``
+      - Specifies how much the Gaussian random numbers should be scaled down
+	during the grain synthesis process.
+    * - __u8
+      - ``cb_mult``
+      - Represents a multiplier for the cb component used in derivation of the
+	input index to the cb component scaling function.
+    * - __u8
+      - ``cb_luma_mult``
+      - Represents a multiplier for the average luma component used in
+	derivation of the input index to the cb component scaling function..
+    * - __u16
+      - ``cb_offset``
+      - Represents an offset used in derivation of the input index to the
+	cb component scaling function.
+    * - __u8
+      - ``cr_mult``
+      - Represents a multiplier for the cb component used in derivation of the
+	input index to the cr component scaling function.
+    * - __u8
+      - ``cr_luma_mult``
+      - Represents a multiplier for the average luma component used in
+        derivation of the input index to the cr component scaling function.
+    * - __u16
+      - ``cr_offset``
+      - Represents an offset used in derivation of the input index to the
+        cr component scaling function.
+
+.. _av1_film_grain_flags:
+
+``AV1 Film Grain Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN``
+      - 0x00000001
+      - If set, specifies that film grain should be added to this frame. If not
+	set, specifies that film grain should not be added.
+    * - ``V4L2_AV1_FILM_GRAIN_FLAG_UPDATE_GRAIN``
+      - 0x00000002
+      - If set, means that a new set of parameters should be sent. If not set,
+	specifies that the previous set of parameters should be used.
+    * - ``V4L2_AV1_FILM_GRAIN_FLAG_CHROMA_SCALING_FROM_LUMA``
+      - 0x00000004
+      - If set, specifies that the chroma scaling is inferred from the luma
+	scaling.
+    * - ``V4L2_AV1_FILM_GRAIN_FLAG_OVERLAP``
+      - 0x00000008
+      - If set, indicates that the overlap between film grain blocks shall be
+	applied. If not set, indicates that the overlap between film grain blocks
+	shall not be applied.
+    * - ``V4L2_AV1_FILM_GRAIN_FLAG_CLIP_TO_RESTRICTED_RANGE``
+      - 0x00000010
+      - If set, indicates that clipping to the restricted (studio) range shall
+        be applied to the sample values after adding the film grain (see the
+        semantics for color_range for an explanation of studio swing). If not
+        set, indicates that clipping to the full range shall be applied to the
+        sample values after adding the film grain.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 506dd3c98884..d7bf21bffa30 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -233,6 +233,22 @@ Compressed Formats
         through the ``V4L2_CID_STATELESS_FWHT_PARAMS`` control.
 	See the :ref:`associated Codec Control ID <codec-stateless-fwht>`.
 
+    * .. _V4L2-PIX-FMT-AV1-FRAME:
+
+      - ``V4L2_PIX_FMT_AV1_FRAME``
+      - 'AV1F'
+      - AV1 parsed frame, including the frame header, as extracted from the container.
+        This format is adapted for stateless video decoders that implement a AV1
+        pipeline with the :ref:`stateless_decoder`. Metadata associated with the
+        frame to decode is required to be passed through the
+        ``V4L2_CID_STATELESS_AV1_SEQUENCE``, ``V4L2_CID_STATELESS_AV1_FRAME``,
+        and ``V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY`` controls.
+        See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-av1>`.
+        Exactly one output and one capture buffer must be provided for use with
+        this pixel format. The output buffer must contain the appropriate number
+        of macroblocks to decode a full corresponding frame to the matching
+        capture buffer.
+
 .. raw:: latex
 
     \normalsize
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 892cfeb8b988..4b035385974c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -269,6 +269,30 @@ still cause this situation.
       - ``p_hevc_decode_params``
       - A pointer to a struct :c:type:`v4l2_ctrl_hevc_decode_params`. Valid if this
         control is of type ``V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS``.
+    * - struct :c:type:`v4l2_ctrl_av1_sequence` *
+      - ``p_av1_sequence``
+      - A pointer to a struct :c:type:`v4l2_ctrl_av1_sequence`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_AV1_SEQUENCE``.
+    * - struct :c:type:`v4l2_ctrl_av1_tile_group_entry` *
+      - ``p_av1_tile_group_entry``
+      - A pointer to a struct :c:type:`v4l2_ctrl_av1_tile_group_entry`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY``.
+    * - struct :c:type:`v4l2_ctrl_av1_frame_header` *
+      - ``p_av1_frame``
+      - A pointer to a struct :c:type:`v4l2_ctrl_av1_frame`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_AV1_FRAME``.
+    * - struct :c:type:`v4l2_ctrl_av1_profile` *
+      - ``p_av1_profile``
+      - A pointer to a struct :c:type:`v4l2_ctrl_av1_profile`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_AV1_PROFILE``.
+    * - struct :c:type:`v4l2_ctrl_av1_level` *
+      - ``p_av1_level``
+      - A pointer to a struct :c:type:`v4l2_ctrl_av1_level`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_AV1_LEVEL``.
+    * - struct :c:type:`v4l2_ctrl_av1_film_grain` *
+      - ``p_av1_film_grain``
+      - A pointer to a struct :c:type:`v4l2_ctrl_av1_film_grain`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_AV1_FILM_GRAIN``.
     * - void *
       - ``ptr``
       - A pointer to a compound type which can be an N-dimensional array
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index a20dfa2a933b..7d3b2983b966 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -525,6 +525,36 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_vp9_frame`, containing VP9
 	frame decode parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_AV1_SEQUENCE``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_av1_sequence`, containing AV1 Sequence OBU
+	decoding parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_av1_tile_group_entry`, containing AV1 Tile Group
+	OBU decoding parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_AV1_FRAME``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_av1_frame`, containing AV1 Frame/Frame
+	Header OBU decoding parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_AV1_PROFILE``
+      - n/a
+      - n/a
+      - n/a
+      - A enum :c:type:`v4l2_ctrl_av1_profile`, indicating what AV1 profiles
+	an AV1 stateless decoder might support.
+    * - ``V4L2_CTRL_TYPE_AV1_LEVEL``
+      - n/a
+      - n/a
+      - n/a
+      - A enum :c:type:`v4l2_ctrl_av1_level`, indicating what AV1 levels
+	an AV1 stateless decoder might support.
 
 .. raw:: latex
 
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 2feea4a5a008..23af9628294f 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -158,6 +158,12 @@ replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AV1_PROFILE :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AV1_LEVEL :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 1f85828d6694..53ff4d04a1b6 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -322,6 +322,19 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
 		pr_cont("HEVC_DECODE_PARAMS");
 		break;
+	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
+		pr_cont("AV1_SEQUENCE");
+		break;
+	case V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY:
+		pr_cont("AV1_TILE_GROUP_ENTRY");
+		break;
+	case V4L2_CTRL_TYPE_AV1_FRAME:
+		pr_cont("AV1_FRAME");
+		break;
+	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
+		pr_cont("AV1_FILM_GRAIN");
+		break;
+
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -518,6 +531,233 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
 	return 0;
 }
 
+static int validate_av1_quantization(struct v4l2_av1_quantization *q)
+{
+	if (q->flags > GENMASK(2, 0))
+		return -EINVAL;
+
+	if (q->delta_q_y_dc < -64 || q->delta_q_y_dc > 63 ||
+	    q->delta_q_u_dc < -64 || q->delta_q_u_dc > 63 ||
+	    q->delta_q_v_dc < -64 || q->delta_q_v_dc > 63 ||
+	    q->delta_q_u_ac < -64 || q->delta_q_u_ac > 63 ||
+	    q->delta_q_v_ac < -64 || q->delta_q_v_ac > 63 ||
+	    q->delta_q_res > GENMASK(1, 0))
+		return -EINVAL;
+
+	if (q->qm_y > GENMASK(3, 0) ||
+	    q->qm_u > GENMASK(3, 0) ||
+	    q->qm_v > GENMASK(3, 0))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int validate_av1_segmentation(struct v4l2_av1_segmentation *s)
+{
+	u32 i;
+	u32 j;
+	s32 limit;
+
+	if (s->flags > GENMASK(4, 0))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(s->feature_data); i++) {
+		const int segmentation_feature_signed[] = { 1, 1, 1, 1, 1, 0, 0, 0 };
+		const int segmentation_feature_max[] = { 255, 63, 63, 63, 63, 7, 0, 0};
+
+		for (j = 0; j < ARRAY_SIZE(s->feature_data[j]); j++) {
+			if (segmentation_feature_signed[j]) {
+				limit = segmentation_feature_max[j];
+
+				if (s->feature_data[i][j] < -limit ||
+				    s->feature_data[i][j] > limit)
+					return -EINVAL;
+			} else {
+				if (s->feature_data[i][j] > limit)
+					return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int validate_av1_loop_filter(struct v4l2_av1_loop_filter *lf)
+{
+	u32 i;
+
+	if (lf->flags > GENMASK(2, 0))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(lf->level); i++) {
+		if (lf->level[i] > GENMASK(5, 0))
+			return -EINVAL;
+	}
+
+	if (lf->sharpness > GENMASK(2, 0))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(lf->ref_deltas); i++) {
+		if (lf->ref_deltas[i] < -64 || lf->ref_deltas[i] > 63)
+			return -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(lf->mode_deltas); i++) {
+		if (lf->mode_deltas[i] < -64 || lf->mode_deltas[i] > 63)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int validate_av1_cdef(struct v4l2_av1_cdef *cdef)
+{
+	u32 i;
+
+	if (cdef->damping_minus_3 > GENMASK(1, 0) ||
+	    cdef->bits > GENMASK(1, 0))
+		return -EINVAL;
+
+	for (i = 0; i < 1 << cdef->bits; i++) {
+		if (cdef->y_pri_strength[i] > GENMASK(3, 0) ||
+		    cdef->y_sec_strength[i] > 4 ||
+		    cdef->uv_pri_strength[i] > GENMASK(3, 0) ||
+		    cdef->uv_sec_strength[i] > 4)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int validate_av1_loop_restauration(struct v4l2_av1_loop_restoration *lr)
+{
+	if (lr->lr_unit_shift > 3 || lr->lr_uv_shift > 1)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
+{
+	u32 i;
+
+	if (fg->flags > GENMASK(4, 0))
+		return -EINVAL;
+
+	if (fg->film_grain_params_ref_idx > GENMASK(2, 0) ||
+	    fg->num_y_points > 14 ||
+	    fg->num_cb_points > 10 ||
+	    fg->num_cr_points > GENMASK(3, 0) ||
+	    fg->grain_scaling_minus_8 > GENMASK(1, 0) ||
+	    fg->ar_coeff_lag > GENMASK(1, 0) ||
+	    fg->ar_coeff_shift_minus_6 > GENMASK(1, 0) ||
+	    fg->grain_scale_shift > GENMASK(1, 0))
+		return -EINVAL;
+
+	if (!(fg->flags & V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN))
+		return 0;
+
+	for (i = 1; i < fg->num_y_points; i++)
+		if (fg->point_y_value[i] <= fg->point_y_value[i - 1])
+			return -EINVAL;
+
+	for (i = 1; i < fg->num_cb_points; i++)
+		if (fg->point_cb_value[i] <= fg->point_cb_value[i - 1])
+			return -EINVAL;
+
+	for (i = 1; i < fg->num_cr_points; i++)
+		if (fg->point_cr_value[i] <= fg->point_cr_value[i - 1])
+			return -EINVAL;
+
+	return 0;
+}
+
+static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
+{
+	int ret = 0;
+
+	ret = validate_av1_quantization(&f->quantization);
+	if (ret)
+		return ret;
+	ret = validate_av1_segmentation(&f->segmentation);
+	if (ret)
+		return ret;
+	ret = validate_av1_loop_filter(&f->loop_filter);
+	if (ret)
+		return ret;
+	ret = validate_av1_cdef(&f->cdef);
+	if (ret)
+		return ret;
+	ret = validate_av1_loop_restauration(&f->loop_restoration);
+	if (ret)
+		return ret;
+
+	if (f->flags &
+	~(V4L2_AV1_FRAME_FLAG_SHOW_FRAME |
+	  V4L2_AV1_FRAME_FLAG_SHOWABLE_FRAME |
+	  V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE |
+	  V4L2_AV1_FRAME_FLAG_DISABLE_CDF_UPDATE |
+	  V4L2_AV1_FRAME_FLAG_ALLOW_SCREEN_CONTENT_TOOLS |
+	  V4L2_AV1_FRAME_FLAG_FORCE_INTEGER_MV |
+	  V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC |
+	  V4L2_AV1_FRAME_FLAG_USE_SUPERRES |
+	  V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV |
+	  V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE |
+	  V4L2_AV1_FRAME_FLAG_USE_REF_FRAME_MVS |
+	  V4L2_AV1_FRAME_FLAG_DISABLE_FRAME_END_UPDATE_CDF |
+	  V4L2_AV1_FRAME_FLAG_UNIFORM_TILE_SPACING |
+	  V4L2_AV1_FRAME_FLAG_ALLOW_WARPED_MOTION |
+	  V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT |
+	  V4L2_AV1_FRAME_FLAG_REDUCED_TX_SET |
+	  V4L2_AV1_FRAME_FLAG_SKIP_MODE_ALLOWED |
+	  V4L2_AV1_FRAME_FLAG_SKIP_MODE_PRESENT |
+	  V4L2_AV1_FRAME_FLAG_FRAME_SIZE_OVERRIDE |
+	  V4L2_AV1_FRAME_FLAG_BUFFER_REMOVAL_TIME_PRESENT |
+	  V4L2_AV1_FRAME_FLAG_FRAME_REFS_SHORT_SIGNALING))
+		return -EINVAL;
+
+	if (f->superres_denom > GENMASK(2, 0) + 9)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int validate_av1_sequence(struct v4l2_ctrl_av1_sequence *s)
+{
+	if (s->flags &
+	~(V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE |
+	 V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_FILTER_INTRA |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTRA_EDGE_FILTER |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTERINTRA_COMPOUND |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_WARPED_MOTION |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_DUAL_FILTER |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_ORDER_HINT |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_JNT_COMP |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_REF_FRAME_MVS |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_SUPERRES |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF |
+	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_RESTORATION |
+	 V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME |
+	 V4L2_AV1_SEQUENCE_FLAG_COLOR_RANGE |
+	 V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X |
+	 V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y |
+	 V4L2_AV1_SEQUENCE_FLAG_FILM_GRAIN_PARAMS_PRESENT |
+	 V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q))
+		return -EINVAL;
+
+	if (s->seq_profile == 1 && s->flags & V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME)
+		return -EINVAL;
+
+	/* reserved */
+	if (s->seq_profile > 2)
+		return -EINVAL;
+
+	/* TODO: PROFILES */
+	return 0;
+}
+
 /*
  * Compound controls validation requires setting unused fields/flags to zero
  * in order to properly detect unchanged controls with std_equal's memcmp.
@@ -773,7 +1013,6 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		zero_padding(p_vp8_frame->entropy);
 		zero_padding(p_vp8_frame->coder_state);
 		break;
-
 	case V4L2_CTRL_TYPE_HEVC_SPS:
 		p_hevc_sps = p;
 
@@ -881,6 +1120,14 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 	case V4L2_CTRL_TYPE_VP9_FRAME:
 		return validate_vp9_frame(p);
+	case V4L2_CTRL_TYPE_AV1_FRAME:
+		return validate_av1_frame(p);
+	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
+		return validate_av1_sequence(p);
+	case V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY:
+		break;
+	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
+		return validate_av1_film_grain(p);
 
 	case V4L2_CTRL_TYPE_AREA:
 		area = p;
@@ -1534,6 +1781,18 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_VP9_FRAME:
 		elem_size = sizeof(struct v4l2_ctrl_vp9_frame);
 		break;
+	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
+		elem_size = sizeof(struct v4l2_ctrl_av1_sequence);
+		break;
+	case V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY:
+		elem_size = sizeof(struct v4l2_ctrl_av1_tile_group_entry);
+		break;
+	case V4L2_CTRL_TYPE_AV1_FRAME:
+		elem_size = sizeof(struct v4l2_ctrl_av1_frame);
+		break;
+	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
+		elem_size = sizeof(struct v4l2_ctrl_av1_film_grain);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e22921e7ea61..4d9d5823d575 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -499,6 +499,40 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		NULL,
 	};
 
+	static const char * const av1_profile[] = {
+		"Main",
+		"High",
+		"Professional",
+		NULL,
+	};
+	static const char * const av1_level[] = {
+		"2.0",
+		"2.1",
+		"2.2",
+		"2.3",
+		"3.0",
+		"3.1",
+		"3.2",
+		"3.3",
+		"4.0",
+		"4.1",
+		"4.2",
+		"4.3",
+		"5.0",
+		"5.1",
+		"5.2",
+		"5.3",
+		"6.0",
+		"6.1",
+		"6.2",
+		"6.3",
+		"7.0",
+		"7.1",
+		"7.2",
+		"7.3",
+		NULL,
+	};
+
 	static const char * const hevc_profile[] = {
 		"Main",
 		"Main Still Picture",
@@ -708,6 +742,10 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return hevc_decode_mode;
 	case V4L2_CID_STATELESS_HEVC_START_CODE:
 		return hevc_start_code;
+	case V4L2_CID_STATELESS_AV1_PROFILE:
+		return av1_profile;
+	case V4L2_CID_STATELESS_AV1_LEVEL:
+		return av1_level;
 	case V4L2_CID_CAMERA_ORIENTATION:
 		return camera_orientation;
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
@@ -1189,6 +1227,12 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_STATELESS_HEVC_START_CODE:		return "HEVC Start Code";
 	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:	return "HEVC Entry Point Offsets";
+	case V4L2_CID_STATELESS_AV1_SEQUENCE:			return "AV1 Sequence parameters";
+	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:	        return "AV1 Tile Group Entry";
+	case V4L2_CID_STATELESS_AV1_FRAME:			return "AV1 Frame parameters";
+	case V4L2_CID_STATELESS_AV1_PROFILE:			return "AV1 Profile";
+	case V4L2_CID_STATELESS_AV1_LEVEL:			return "AV1 Level";
+	case V4L2_CID_STATELESS_AV1_FILM_GRAIN:			return "AV1 Film Grain";
 
 	/* Colorimetry controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1368,6 +1412,8 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_HEVC_START_CODE:
 	case V4L2_CID_STATELESS_H264_DECODE_MODE:
 	case V4L2_CID_STATELESS_H264_START_CODE:
+	case V4L2_CID_STATELESS_AV1_PROFILE:
+	case V4L2_CID_STATELESS_AV1_LEVEL:
 	case V4L2_CID_CAMERA_ORIENTATION:
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
 		*type = V4L2_CTRL_TYPE_MENU;
@@ -1529,6 +1575,19 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_VP9_FRAME:
 		*type = V4L2_CTRL_TYPE_VP9_FRAME;
 		break;
+	case V4L2_CID_STATELESS_AV1_SEQUENCE:
+		*type = V4L2_CTRL_TYPE_AV1_SEQUENCE;
+		break;
+	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:
+		*type = V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_STATELESS_AV1_FRAME:
+		*type = V4L2_CTRL_TYPE_AV1_FRAME;
+		break;
+	case V4L2_CID_STATELESS_AV1_FILM_GRAIN:
+		*type = V4L2_CTRL_TYPE_AV1_FILM_GRAIN;
+		break;
 	case V4L2_CID_UNIT_CELL_SIZE:
 		*type = V4L2_CTRL_TYPE_AREA;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index e6fd355a2e92..0627665ff9cb 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1497,6 +1497,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
 		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
+		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 00828a4f9404..d39d4eec2a97 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -52,6 +52,11 @@ struct video_device;
  * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
  * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display structure.
  * @p_area:			Pointer to an area.
+ * @p_av1_sequence:		Pointer to an AV1 sequence.
+ * @p_av1_tile_group:		Pointer to an AV1 tile group.
+ * @p_av1_tile_group_entry:	Pointer to an AV1 tile group entry.
+ * @p_av1_frame:		Pointer to an AV1 frame.
+ * @p_av1_film_grain:		Pointer to an AV1 film grain.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -81,6 +86,10 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_area *p_area;
+	struct v4l2_ctrl_av1_sequence *p_av1_sequence;
+	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
+	struct v4l2_ctrl_av1_frame *p_av1_frame;
+	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5f46bf4a570c..dcc61970c0f0 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2774,6 +2774,720 @@ struct v4l2_ctrl_vp9_compressed_hdr {
 	struct v4l2_vp9_mv_probs mv;
 };
 
+/* Stateless AV1 controls */
+
+#define V4L2_AV1_TOTAL_REFS_PER_FRAME	8
+#define V4L2_AV1_CDEF_MAX		8
+#define V4L2_AV1_NUM_PLANES_MAX		3 /* 1 if monochrome, 3 otherwise */
+#define V4L2_AV1_MAX_SEGMENTS		8
+#define V4L2_AV1_MAX_OPERATING_POINTS	(1 << 5) /* 5 bits to encode */
+#define V4L2_AV1_REFS_PER_FRAME		7
+#define V4L2_AV1_MAX_NUM_Y_POINTS	(1 << 4) /* 4 bits to encode */
+#define V4L2_AV1_MAX_NUM_CB_POINTS	(1 << 4) /* 4 bits to encode */
+#define V4L2_AV1_MAX_NUM_CR_POINTS	(1 << 4) /* 4 bits to encode */
+#define V4L2_AV1_MAX_NUM_POS_LUMA	25 /* (2 * 3 * (3 + 1)) + 1 */
+#define V4L2_AV1_MAX_NUM_PLANES		3
+#define V4L2_AV1_MAX_TILE_COLS		64
+#define V4L2_AV1_MAX_TILE_ROWS		64
+#define V4L2_AV1_MAX_TILE_COUNT		512
+
+#define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE		  0x00000001
+#define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK	  0x00000002
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_FILTER_INTRA	  0x00000004
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTRA_EDGE_FILTER   0x00000008
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTERINTRA_COMPOUND 0x00000010
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND	  0x00000020
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_WARPED_MOTION	  0x00000040
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_DUAL_FILTER	  0x00000080
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_ORDER_HINT	  0x00000100
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_JNT_COMP		  0x00000200
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_REF_FRAME_MVS	  0x00000400
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_SUPERRES		  0x00000800
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF		  0x00001000
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_RESTORATION	  0x00002000
+#define V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME		  0x00004000
+#define V4L2_AV1_SEQUENCE_FLAG_COLOR_RANGE		  0x00008000
+#define V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X		  0x00010000
+#define V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y		  0x00020000
+#define V4L2_AV1_SEQUENCE_FLAG_FILM_GRAIN_PARAMS_PRESENT  0x00040000
+#define V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q	  0x00080000
+
+#define V4L2_CID_STATELESS_AV1_SEQUENCE (V4L2_CID_CODEC_STATELESS_BASE + 500)
+/**
+ * struct v4l2_ctrl_av1_sequence - AV1 Sequence
+ *
+ * Represents an AV1 Sequence OBU. See section 5.5. "Sequence header OBU syntax"
+ * for more details.
+ *
+ * @flags: See V4L2_AV1_SEQUENCE_FLAG_{}.
+ * @seq_profile: specifies the features that can be used in the coded video
+ * sequence.
+ * @order_hint_bits: specifies the number of bits used for the order_hint field
+ * at each frame.
+ * @bit_depth: the bitdepth to use for the sequence as described in section
+ * 5.5.2 "Color config syntax".
+ * @max_frame_width_minus_1: specifies the maximum frame width minus 1 for the
+ * frames represented by this sequence header.
+ * @max_frame_height_minus_1: specifies the maximum frame height minus 1 for the
+ * frames represented by this sequence header.
+ */
+struct v4l2_ctrl_av1_sequence {
+	__u32 flags;
+	__u8 seq_profile;
+	__u8 order_hint_bits;
+	__u8 bit_depth;
+	__u16 max_frame_width_minus_1;
+	__u16 max_frame_height_minus_1;
+};
+
+#define V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY (V4L2_CID_CODEC_STATELESS_BASE + 501)
+/**
+ * struct v4l2_ctrl_av1_tile_group_entry - AV1 Tile Group entry
+ *
+ * Represents a single AV1 tile inside an AV1 Tile Group. Note that MiRowStart,
+ * MiRowEnd, MiColStart and MiColEnd can be retrieved from struct
+ * v4l2_av1_tile_info in struct v4l2_ctrl_av1_frame_header using tile_row and
+ * tile_col. See section 6.10.1 "General tile group OBU semantics" for more
+ * details.
+ *
+ * @tile_offset: offset from the OBU data, i.e. where the coded tile data
+ * actually starts.
+ * @tile_size: specifies the size in bytes of the coded tile. Equivalent to
+ * "TileSize" in the AV1 Specification.
+ * @tile_row: specifies the row of the current tile. Equivalent to "TileRow" in
+ * the AV1 Specification.
+ * @tile_col: specifies the col of the current tile. Equivalent to "TileCol" in
+ * the AV1 Specification.
+ */
+struct v4l2_ctrl_av1_tile_group_entry {
+	__u32 tile_offset;
+	__u32 tile_size;
+	__u32 tile_row;
+	__u32 tile_col;
+};
+
+/**
+ * enum v4l2_av1_warp_model - AV1 Warp Model as described in section 3
+ * "Symbols and abbreviated terms" of the AV1 Specification.
+ *
+ * @V4L2_AV1_WARP_MODEL_IDENTITY: Warp model is just an identity transform.
+ * @V4L2_AV1_WARP_MODEL_TRANSLATION: Warp model is a pure translation.
+ * @V4L2_AV1_WARP_MODEL_ROTZOOM: Warp model is a rotation + symmetric zoom +
+ * translation.
+ * @V4L2_AV1_WARP_MODEL_AFFINE: Warp model is a general affine transform.
+ */
+enum v4l2_av1_warp_model {
+	V4L2_AV1_WARP_MODEL_IDENTITY = 0,
+	V4L2_AV1_WARP_MODEL_TRANSLATION = 1,
+	V4L2_AV1_WARP_MODEL_ROTZOOM = 2,
+	V4L2_AV1_WARP_MODEL_AFFINE = 3,
+};
+
+/**
+ * enum v4l2_av1_reference_frame - AV1 reference frames
+ *
+ * @V4L2_AV1_REF_INTRA_FRAME: Intra Frame Reference
+ * @V4L2_AV1_REF_LAST_FRAME: Last Reference Frame
+ * @V4L2_AV1_REF_LAST2_FRAME: Last2 Reference Frame
+ * @V4L2_AV1_REF_LAST3_FRAME: Last3 Reference Frame
+ * @V4L2_AV1_REF_GOLDEN_FRAME: Golden Reference Frame
+ * @V4L2_AV1_REF_BWDREF_FRAME: BWD Reference Frame
+ * @V4L2_AV1_REF_ALTREF2_FRAME: Alternative2 Reference Frame
+ * @V4L2_AV1_REF_ALTREF_FRAME: Alternative Reference Frame
+ * @V4L2_AV1_NUM_REF_FRAMES: Total Reference Frame Number
+ */
+enum v4l2_av1_reference_frame {
+	V4L2_AV1_REF_INTRA_FRAME = 0,
+	V4L2_AV1_REF_LAST_FRAME = 1,
+	V4L2_AV1_REF_LAST2_FRAME = 2,
+	V4L2_AV1_REF_LAST3_FRAME = 3,
+	V4L2_AV1_REF_GOLDEN_FRAME = 4,
+	V4L2_AV1_REF_BWDREF_FRAME = 5,
+	V4L2_AV1_REF_ALTREF2_FRAME = 6,
+	V4L2_AV1_REF_ALTREF_FRAME = 7,
+	V4L2_AV1_NUM_REF_FRAMES,
+};
+
+#define V4L2_AV1_GLOBAL_MOTION_IS_INVALID(ref) (1 << (ref))
+
+#define V4L2_AV1_GLOBAL_MOTION_FLAG_IS_GLOBAL	   0x1
+#define V4L2_AV1_GLOBAL_MOTION_FLAG_IS_ROT_ZOOM	   0x2
+#define V4L2_AV1_GLOBAL_MOTION_FLAG_IS_TRANSLATION 0x4
+/**
+ * struct v4l2_av1_global_motion - AV1 Global Motion parameters as described in
+ * section 6.8.17 "Global motion params semantics" of the AV1 specification.
+ *
+ * @flags: A bitfield containing the flags per reference frame. See
+ * V4L2_AV1_GLOBAL_MOTION_FLAG_{}
+ * @type: The type of global motion transform used.
+ * @params: this field has the same meaning as "gm_params" in the AV1
+ * specification.
+ * @invalid: bitfield indicating whether the global motion params are invalid
+ * for a given reference frame. See section 7.11.3.6. Setup shear process and
+ * the variable "warpValid". Use V4L2_AV1_GLOBAL_MOTION_IS_INVALID(ref) to
+ * create a suitable mask.
+ */
+
+struct v4l2_av1_global_motion {
+	__u8 flags[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	enum v4l2_av1_warp_model type[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	__u32 params[V4L2_AV1_TOTAL_REFS_PER_FRAME][6];
+	__u8 invalid;
+};
+
+/**
+ * enum v4l2_av1_frame_restoration_type - AV1 Frame Restoration Type
+ * @V4L2_AV1_FRAME_RESTORE_NONE: no filtering is applied.
+ * @V4L2_AV1_FRAME_RESTORE_WIENER: Wiener filter process is invoked.
+ * @V4L2_AV1_FRAME_RESTORE_SGRPROJ: self guided filter process is invoked.
+ * @V4L2_AV1_FRAME_RESTORE_SWITCHABLE: restoration filter is swichtable.
+ */
+enum v4l2_av1_frame_restoration_type {
+	V4L2_AV1_FRAME_RESTORE_NONE = 0,
+	V4L2_AV1_FRAME_RESTORE_WIENER = 1,
+	V4L2_AV1_FRAME_RESTORE_SGRPROJ = 2,
+	V4L2_AV1_FRAME_RESTORE_SWITCHABLE = 3,
+};
+
+#define V4L2_AV1_LOOP_RESTORATION_FLAG_USES_LR		0x1
+#define V4L2_AV1_LOOP_RESTORATION_FLAG_USES_CHROMA_LR	0x2
+
+/**
+ * struct v4l2_av1_loop_restoration - AV1 Loop Restauration as described in
+ * section 6.10.15 "Loop restoration params semantics" of the AV1 specification.
+ *
+ * @flags: See V4L2_AV1_LOOP_RESTORATION_FLAG_{}.
+ * @frame_restoration_type: specifies the type of restoration used for each
+ * plane. See enum v4l2_av1_frame_restoration_type.
+ * @lr_unit_shift: specifies if the luma restoration size should be halved.
+ * @lr_uv_shift: specifies if the chroma size should be half the luma size.
+ * @loop_restoration_size: specifies the size of loop restoration units in units
+ * of samples in the current plane.
+ */
+struct v4l2_av1_loop_restoration {
+	__u8 flags;
+	enum v4l2_av1_frame_restoration_type frame_restoration_type[V4L2_AV1_NUM_PLANES_MAX];
+	__u8 lr_unit_shift;
+	__u8 lr_uv_shift;
+	__u32 loop_restoration_size[V4L2_AV1_MAX_NUM_PLANES];
+};
+
+/**
+ * struct v4l2_av1_cdef - AV1 CDEF params semantics as described in section
+ * 6.10.14. "CDEF params semantics" of the AV1 specification
+ *
+ * @damping_minus_3: controls the amount of damping in the deringing filter.
+ * @bits: specifies the number of bits needed to specify which CDEF filter to
+ * apply.
+ * @y_pri_strength: specifies the strength of the primary filter.
+ * @y_sec_strength: specifies the strength of the secondary filter.
+ * @uv_pri_strength: specifies the strength of the primary filter.
+ * @uv_sec_strength: specifies the strength of the secondary filter.
+ */
+struct v4l2_av1_cdef {
+	__u8 damping_minus_3;
+	__u8 bits;
+	__u8 y_pri_strength[V4L2_AV1_CDEF_MAX];
+	__u8 y_sec_strength[V4L2_AV1_CDEF_MAX];
+	__u8 uv_pri_strength[V4L2_AV1_CDEF_MAX];
+	__u8 uv_sec_strength[V4L2_AV1_CDEF_MAX];
+};
+
+#define V4L2_AV1_SEGMENTATION_FLAG_ENABLED	   0x1
+#define V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP	   0x2
+#define V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE 0x4
+#define V4L2_AV1_SEGMENTATION_FLAG_UPDATE_DATA	   0x8
+#define V4L2_AV1_SEGMENTATION_FLAG_SEG_ID_PRE_SKIP 0x10
+
+/**
+ * enum v4l2_av1_segment_feature - AV1 segment features as described in section
+ * 3 "Symbols and abbreviated terms" of the AV1 specification.
+ *
+ * @V4L2_AV1_SEG_LVL_ALT_Q: Index for quantizer segment feature.
+ * @V4L2_AV1_SEG_LVL_ALT_LF_Y_V: Index for vertical luma loop filter segment
+ * feature.
+ * @V4L2_AV1_SEG_LVL_REF_FRAME: Index for reference frame segment feature.
+ * @V4L2_AV1_SEG_LVL_SKIP: Index for skip segment feature.
+ * @V4L2_AV1_SEG_LVL_GLOBALMV: Index for global mv feature.
+ * @V4L2_AV1_SEG_LVL_MAX: Number of segment features.
+ */
+enum v4l2_av1_segment_feature {
+	V4L2_AV1_SEG_LVL_ALT_Q = 0,
+	V4L2_AV1_SEG_LVL_ALT_LF_Y_V = 1,
+	V4L2_AV1_SEG_LVL_REF_FRAME = 5,
+	V4L2_AV1_SEG_LVL_REF_SKIP = 6,
+	V4L2_AV1_SEG_LVL_REF_GLOBALMV = 7,
+	V4L2_AV1_SEG_LVL_MAX = 8
+};
+
+#define V4L2_AV1_SEGMENT_FEATURE_ENABLED(id)	(1 << (id))
+
+/**
+ * struct v4l2_av1_segmentation - AV1 Segmentation params as defined in section
+ * 6.8.13. "Segmentation params semantics" of the AV1 specification.
+ *
+ * @flags: see V4L2_AV1_SEGMENTATION_FLAG_{}.
+ * @feature_enabled: bitmask defining which features are enabled in each segment.
+ * Use V4L2_AV1_SEGMENT_FEATURE_ENABLED to build a suitable mask.
+ * @feature_data: data attached to each feature. Data entry is only valid if the
+ * feature is enabled
+ * @last_active_seg_id: indicates the highest numbered segment id that has some
+ * enabled feature. This is used when decoding the segment id to only decode
+ * choices corresponding to used segments.
+ */
+struct v4l2_av1_segmentation {
+	__u8 flags;
+	__u8 feature_enabled[V4L2_AV1_MAX_SEGMENTS];
+	__s16 feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX];
+	__u8 last_active_seg_id;
+};
+
+#define V4L2_AV1_LOOP_FILTER_FLAG_DELTA_ENABLED    0x1
+#define V4L2_AV1_LOOP_FILTER_FLAG_DELTA_UPDATE     0x2
+#define V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_PRESENT 0x4
+#define V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_MULTI   0x8
+
+/**
+ * struct v4l2_av1_loop_filter - AV1 Loop filter params as defined in section
+ * 6.8.10. "Loop filter semantics" and "6.8.16. Loop filter delta parameters
+ * semantics" of the AV1 specification.
+ *
+ * @flags: see V4L2_AV1_LOOP_FILTER_FLAG_{}
+ * @level: an array containing loop filter strength values. Different loop
+ * filter strength values from the array are used depending on the image plane
+ * being filtered, and the edge direction (vertical or horizontal) being
+ * filtered.
+ * @sharpness: indicates the sharpness level. The loop_filter_level and
+ * loop_filter_sharpness together determine when a block edge is filtered, and
+ * by how much the filtering can change the sample values. The loop filter
+ * process is described in section 7.14 of the AV1 specification.
+ * @ref_deltas: contains the adjustment needed for the filter level based on the
+ * chosen reference frame. If this syntax element is not present, it maintains
+ * its previous value.
+ * @mode_deltas: contains the adjustment needed for the filter level based on
+ * the chosen mode. If this syntax element is not present, it maintains its
+ * previous value.
+ * @delta_lf_res: specifies the left shift which should be applied to decoded
+ * loop filter delta values.
+ */
+struct v4l2_av1_loop_filter {
+	__u8 flags;
+	__u8 level[4];
+	__u8 sharpness;
+	__s8 ref_deltas[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	__s8 mode_deltas[2];
+	__u8 delta_lf_res;
+};
+
+#define V4L2_AV1_QUANTIZATION_FLAG_DIFF_UV_DELTA   0x1
+#define V4L2_AV1_QUANTIZATION_FLAG_USING_QMATRIX   0x2
+#define V4L2_AV1_QUANTIZATION_FLAG_DELTA_Q_PRESENT 0x4
+
+/**
+ * struct v4l2_av1_quantization - AV1 Quantization params as defined in section
+ * 6.8.11 "Quantization params semantics" of the AV1 specification.
+ *
+ * @flags: see V4L2_AV1_QUANTIZATION_FLAG_{}
+ * @base_q_idx: indicates the base frame qindex. This is used for Y AC
+ * coefficients and as the base value for the other quantizers.
+ * @delta_q_y_dc: indicates the Y DC quantizer relative to base_q_idx.
+ * @delta_q_u_dc: indicates the U DC quantizer relative to base_q_idx.
+ * @delta_q_u_ac: indicates the U AC quantizer relative to base_q_idx.
+ * @delta_q_v_dc: indicates the V DC quantizer relative to base_q_idx.
+ * @delta_q_v_ac: indicates the V AC quantizer relative to base_q_idx.
+ * @qm_y: specifies the level in the quantizer matrix that should be used for
+ * luma plane decoding.
+ * @qm_u: specifies the level in the quantizer matrix that should be used for
+ * chroma U plane decoding.
+ * @qm_v: specifies the level in the quantizer matrix that should be used for
+ * chroma V plane decoding.
+ * @delta_q_res: specifies the left shift which should be applied to decoded
+ * quantizer index delta values.
+ */
+struct v4l2_av1_quantization {
+	__u8 flags;
+	__u8 base_q_idx;
+	__s8 delta_q_y_dc;
+	__s8 delta_q_u_dc;
+	__s8 delta_q_u_ac;
+	__s8 delta_q_v_dc;
+	__s8 delta_q_v_ac;
+	__u8 qm_y;
+	__u8 qm_u;
+	__u8 qm_v;
+	__u8 delta_q_res;
+};
+
+#define V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING	0x1
+
+/**
+ * struct v4l2_av1_tile_info - AV1 Tile info as defined in section 6.8.14. "Tile
+ * info semantics" of the AV1 specification.
+ *
+ * @flags: see V4L2_AV1_TILE_INFO_FLAG_{}
+ * @mi_col_starts: an array specifying the start column (in units of 4x4 luma
+ * samples) for each tile across the image.
+ * @mi_row_starts: an array specifying the start row (in units of 4x4 luma
+ * samples) for each tile down the image.
+ * @width_in_sbs_minus_1: specifies the width of a tile minus 1 in units of
+ * superblocks.
+ * @height_in_sbs_minus_1:  specifies the height of a tile minus 1 in units of
+ * superblocks.
+ * @tile_size_bytes: specifies the number of bytes needed to code each tile
+ * size.
+ * @context_update_tile_id: specifies which tile to use for the CDF update.
+ * @tile_rows: specifies the number of tiles down the frame.
+ * @tile_cols: specifies the number of tiles across the frame.
+ */
+struct v4l2_av1_tile_info {
+	__u8 flags;
+	__u32 mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1];
+	__u32 mi_row_starts[V4L2_AV1_MAX_TILE_ROWS + 1];
+	__u32 width_in_sbs_minus_1[V4L2_AV1_MAX_TILE_COLS];
+	__u32 height_in_sbs_minus_1[V4L2_AV1_MAX_TILE_ROWS];
+	__u8 tile_size_bytes;
+	__u8 context_update_tile_id;
+	__u8 tile_cols;
+	__u8 tile_rows;
+};
+
+/**
+ * enum v4l2_av1_frame_type - AV1 Frame Type
+ *
+ * @V4L2_AV1_KEY_FRAME: Key frame
+ * @V4L2_AV1_INTER_FRAME: Inter frame
+ * @V4L2_AV1_INTRA_ONLY_FRAME: Intra-only frame
+ * @V4L2_AV1_SWITCH_FRAME: Switch frame
+ */
+enum v4l2_av1_frame_type {
+	V4L2_AV1_KEY_FRAME = 0,
+	V4L2_AV1_INTER_FRAME = 1,
+	V4L2_AV1_INTRA_ONLY_FRAME = 2,
+	V4L2_AV1_SWITCH_FRAME = 3
+};
+
+/**
+ * enum v4l2_av1_interpolation_filter - AV1 interpolation filter types
+ *
+ * @V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP: eight tap filter
+ * @V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH: eight tap smooth filter
+ * @V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP: eight tap sharp filter
+ * @V4L2_AV1_INTERPOLATION_FILTER_BILINEAR: bilinear filter
+ * @V4L2_AV1_INTERPOLATION_FILTER_SWITCHABLE: filter selection is signaled at
+ * the block level
+ *
+ * See section 6.8.9 "Interpolation filter semantics" of the AV1 specification
+ * for more details.
+ */
+enum v4l2_av1_interpolation_filter {
+	V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP = 0,
+	V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH = 1,
+	V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP = 2,
+	V4L2_AV1_INTERPOLATION_FILTER_BILINEAR = 3,
+	V4L2_AV1_INTERPOLATION_FILTER_SWITCHABLE = 4,
+};
+
+/**
+ * enum v4l2_av1_tx_mode - AV1 Tx mode as described in section 6.8.21 "TX mode
+ * semantics" of the AV1 specification.
+ * @V4L2_AV1_TX_MODE_ONLY_4X4: the inverse transform will use only 4x4
+ * transforms
+ * @V4L2_AV1_TX_MODE_LARGEST: the inverse transform will use the largest
+ * transform size that fits inside the block
+ * @V4L2_AV1_TX_MODE_SELECT: the choice of transform size is specified
+ * explicitly for each block.
+ */
+enum v4l2_av1_tx_mode {
+	V4L2_AV1_TX_MODE_ONLY_4X4 = 0,
+	V4L2_AV1_TX_MODE_LARGEST = 1,
+	V4L2_AV1_TX_MODE_SELECT = 2
+};
+
+#define V4L2_AV1_FRAME_FLAG_SHOW_FRAME			 0x00000001
+#define V4L2_AV1_FRAME_FLAG_SHOWABLE_FRAME		 0x00000002
+#define V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE	 0x00000004
+#define V4L2_AV1_FRAME_FLAG_DISABLE_CDF_UPDATE		 0x00000008
+#define V4L2_AV1_FRAME_FLAG_ALLOW_SCREEN_CONTENT_TOOLS	 0x00000010
+#define V4L2_AV1_FRAME_FLAG_FORCE_INTEGER_MV		 0x00000020
+#define V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC		 0x00000040
+#define V4L2_AV1_FRAME_FLAG_USE_SUPERRES		 0x00000080
+#define V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV	 0x00000100
+#define V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE	 0x00000200
+#define V4L2_AV1_FRAME_FLAG_USE_REF_FRAME_MVS		 0x00000400
+#define V4L2_AV1_FRAME_FLAG_DISABLE_FRAME_END_UPDATE_CDF 0x00000800
+#define V4L2_AV1_FRAME_FLAG_UNIFORM_TILE_SPACING	 0x00001000
+#define V4L2_AV1_FRAME_FLAG_ALLOW_WARPED_MOTION		 0x00002000
+#define V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT		 0x00004000
+#define V4L2_AV1_FRAME_FLAG_REDUCED_TX_SET		 0x00008000
+#define V4L2_AV1_FRAME_FLAG_SKIP_MODE_ALLOWED 		 0x00010000
+#define V4L2_AV1_FRAME_FLAG_SKIP_MODE_PRESENT		 0x00020000
+#define V4L2_AV1_FRAME_FLAG_FRAME_SIZE_OVERRIDE		 0x00040000
+#define V4L2_AV1_FRAME_FLAG_BUFFER_REMOVAL_TIME_PRESENT	 0x00080000
+#define V4L2_AV1_FRAME_FLAG_FRAME_REFS_SHORT_SIGNALING	 0x00100000
+
+#define V4L2_CID_STATELESS_AV1_FRAME (V4L2_CID_CODEC_STATELESS_BASE + 502)
+/**
+ * struct v4l2_ctrl_av1_frame - Represents an AV1 Frame Header OBU.
+ *
+ * @tile_info: tile info
+ * @quantization: quantization params
+ * @segmentation: segmentation params
+ * @loop_filter: loop filter params
+ * @cdef: cdef params
+ * @loop_restoration: loop restoration params
+ * @global_motion: global motion params
+ * @flags: see V4L2_AV1_FRAME_HEADER_FLAG_{}
+ * @frame_type: specifies the AV1 frame type
+ * @order_hint: specifies OrderHintBits least significant bits of the expected
+ * output order for this frame.
+ * @superres_denom: the denominator for the upscaling ratio.
+ * @upscaled_width: the upscaled width.
+ * @interpolation_filter: specifies the filter selection used for performing
+ * inter prediction.
+ * @tx_mode: specifies how the transform size is determined.
+ * @frame_width_minus_1: add 1 to get the frame's width.
+ * @frame_height_minus_1: add 1 to get the frame's height
+ * @render_width_minus_1: add 1 to get the render width of the frame in luma
+ * samples.
+ * @render_height_minus_1: add 1 to get the render height of the frame in luma
+ * samples.
+ * @current_frame_id: specifies the frame id number for the current frame. Frame
+ * id numbers are additional information that do not affect the decoding
+ * process, but provide decoders with a way of detecting missing reference
+ * frames so that appropriate action can be taken.
+ * @primary_ref_frame: specifies which reference frame contains the CDF values
+ * and other state that should be loaded at the start of the frame.
+ * @buf_removal_time: specifies the frame removal time in units of DecCT clock
+ * ticks counted from the removal time of the last random access point for
+ * operating point opNum.
+ * @refresh_frame_flags: contains a bitmask that specifies which reference frame
+ * slots will be updated with the current frame after it is decoded.
+ * @order_hints: specifies the expected output order hint for each reference
+ * frame.
+ * @last_frame_idx: specifies the reference frame to use for LAST_FRAME.
+ * @gold_frame_idx: specifies the reference frame to use for GOLDEN_FRAME.
+ * refs
+ * @reference_frame_ts: the V4L2 timestamp of the reference frame slots.
+ * @ref_frame_idx: used to index into @reference_frame_ts when decoding
+ * inter-frames. The meaning of this array is the same as in the specification.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer. Use
+ * v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @skip_mode_frame: specifies the frames to use for compound prediction when
+ * skip_mode is equal to 1.
+ */
+struct v4l2_ctrl_av1_frame {
+	struct v4l2_av1_tile_info tile_info;
+	struct v4l2_av1_quantization quantization;
+	struct v4l2_av1_segmentation segmentation;
+	struct v4l2_av1_loop_filter  loop_filter;
+	struct v4l2_av1_cdef cdef;
+	struct v4l2_av1_loop_restoration loop_restoration;
+	struct v4l2_av1_global_motion global_motion;
+	__u32 flags;
+	enum v4l2_av1_frame_type frame_type;
+	__u32 order_hint;
+	__u8 superres_denom;
+	__u32 upscaled_width;
+	enum v4l2_av1_interpolation_filter interpolation_filter;
+	enum v4l2_av1_tx_mode tx_mode;
+	__u32 frame_width_minus_1;
+	__u32 frame_height_minus_1;
+	__u16 render_width_minus_1;
+	__u16 render_height_minus_1;
+
+	__u32 current_frame_id;
+	__u8 primary_ref_frame;
+	__u32 buffer_removal_time[V4L2_AV1_MAX_OPERATING_POINTS];
+	__u8 refresh_frame_flags;
+	__u32 order_hints[V4L2_AV1_NUM_REF_FRAMES];
+	__s8 last_frame_idx;
+	__s8 gold_frame_idx;
+	__u64 reference_frame_ts[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	__u8 ref_frame_idx[V4L2_AV1_REFS_PER_FRAME];
+	__u8 skip_mode_frame[2];
+};
+
+/**
+ * enum v4l2_stateless_av1_profile - AV1 profiles
+ *
+ * @V4L2_STATELESS_AV1_PROFILE_MAIN: compliant decoders must be able to decode
+ * streams with seq_profile equal to 0.
+ * @V4L2_STATELESS_PROFILE_HIGH: compliant decoders must be able to decode
+ * streams with seq_profile equal to 0.
+ * @V4L2_STATELESS_PROFILE_PROFESSIONAL: compliant decoders must be able to
+ * decode streams with seq_profile equal to 0.
+ *
+ * Conveys the highest profile a decoder can work with.
+ */
+#define V4L2_CID_STATELESS_AV1_PROFILE (V4L2_CID_CODEC_STATELESS_BASE + 503)
+enum v4l2_stateless_av1_profile {
+	V4L2_STATELESS_AV1_PROFILE_MAIN = 0,
+	V4L2_STATELESS_AV1_PROFILE_HIGH = 1,
+	V4L2_STATELESS_AV1_PROFILE_PROFESSIONAL = 2,
+};
+
+/**
+ * enum v4l2_stateless_av1_level - AV1 levels
+ *
+ * @V4L2_STATELESS_AV1_LEVEL_2_0: Level 2.0.
+ * @V4L2_STATELESS_AV1_LEVEL_2_1: Level 2.1.
+ * @V4L2_STATELESS_AV1_LEVEL_2_2: Level 2.2.
+ * @V4L2_STATELESS_AV1_LEVEL_2_3: Level 2.3.
+ * @V4L2_STATELESS_AV1_LEVEL_3_0: Level 3.0.
+ * @V4L2_STATELESS_AV1_LEVEL_3_1: Level 3.1.
+ * @V4L2_STATELESS_AV1_LEVEL_3_2: Level 3.2.
+ * @V4L2_STATELESS_AV1_LEVEL_3_3: Level 3.3.
+ * @V4L2_STATELESS_AV1_LEVEL_4_0: Level 4.0.
+ * @V4L2_STATELESS_AV1_LEVEL_4_1: Level 4.1.
+ * @V4L2_STATELESS_AV1_LEVEL_4_2: Level 4.2.
+ * @V4L2_STATELESS_AV1_LEVEL_4_3: Level 4.3.
+ * @V4L2_STATELESS_AV1_LEVEL_5_0: Level 5.0.
+ * @V4L2_STATELESS_AV1_LEVEL_5_1: Level 5.1.
+ * @V4L2_STATELESS_AV1_LEVEL_5_2: Level 5.2.
+ * @V4L2_STATELESS_AV1_LEVEL_5_3: Level 5.3.
+ * @V4L2_STATELESS_AV1_LEVEL_6_0: Level 6.0.
+ * @V4L2_STATELESS_AV1_LEVEL_6_1: Level 6.1.
+ * @V4L2_STATELESS_AV1_LEVEL_6_2: Level 6.2.
+ * @V4L2_STATELESS_AV1_LEVEL_6_3: Level 6.3.
+ * @V4L2_STATELESS_AV1_LEVEL_7_0: Level 7.0.
+ * @V4L2_STATELESS_AV1_LEVEL_7_2: Level 7.2.
+ * @V4L2_STATELESS_AV1_LEVEL_7_3: Level 7.3.
+ *
+ * Conveys the highest level a decoder can work with.
+ */
+#define V4L2_CID_STATELESS_AV1_LEVEL (V4L2_CID_CODEC_STATELESS_BASE + 504)
+enum v4l2_stateless_av1_level {
+	V4L2_STATELESS_AV1_LEVEL_2_0 = 0,
+	V4L2_STATELESS_AV1_LEVEL_2_1 = 1,
+	V4L2_STATELESS_AV1_LEVEL_2_2 = 2,
+	V4L2_STATELESS_AV1_LEVEL_2_3 = 3,
+
+	V4L2_STATELESS_AV1_LEVEL_3_0 = 4,
+	V4L2_STATELESS_AV1_LEVEL_3_1 = 5,
+	V4L2_STATELESS_AV1_LEVEL_3_2 = 6,
+	V4L2_STATELESS_AV1_LEVEL_3_3 = 7,
+
+	V4L2_STATELESS_AV1_LEVEL_4_0 = 8,
+	V4L2_STATELESS_AV1_LEVEL_4_1 = 9,
+	V4L2_STATELESS_AV1_LEVEL_4_2 = 10,
+	V4L2_STATELESS_AV1_LEVEL_4_3 = 11,
+
+	V4L2_STATELESS_AV1_LEVEL_5_0 = 12,
+	V4L2_STATELESS_AV1_LEVEL_5_1 = 13,
+	V4L2_STATELESS_AV1_LEVEL_5_2 = 14,
+	V4L2_STATELESS_AV1_LEVEL_5_3 = 15,
+
+	V4L2_STATELESS_AV1_LEVEL_6_0 = 16,
+	V4L2_STATELESS_AV1_LEVEL_6_1 = 17,
+	V4L2_STATELESS_AV1_LEVEL_6_2 = 18,
+	V4L2_STATELESS_AV1_LEVEL_6_3 = 19,
+
+	V4L2_STATELESS_AV1_LEVEL_7_0 = 20,
+	V4L2_STATELESS_AV1_LEVEL_7_1 = 21,
+	V4L2_STATELESS_AV1_LEVEL_7_2 = 22,
+	V4L2_STATELESS_AV1_LEVEL_7_3 = 23
+};
+
+#define V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN 0x1
+#define V4L2_AV1_FILM_GRAIN_FLAG_UPDATE_GRAIN 0x2
+#define V4L2_AV1_FILM_GRAIN_FLAG_CHROMA_SCALING_FROM_LUMA 0x4
+#define V4L2_AV1_FILM_GRAIN_FLAG_OVERLAP 0x8
+#define V4L2_AV1_FILM_GRAIN_FLAG_CLIP_TO_RESTRICTED_RANGE 0x10
+
+/**
+ * struct v4l2_av1_film_grain - AV1 Film Grain parameters.
+ *
+ * Film grain parameters as specified by section 6.8.20 of the AV1
+   Specification.
+ *
+ * @flags: see V4L2_AV1_FILM_GRAIN_{}.
+ * @grain_seed: specifies the starting value for the pseudo-random numbers used
+ * during film grain synthesis.
+ * @film_grain_params_ref_idx: indicates which reference frame contains the
+ * film grain parameters to be used for this frame.
+ * @num_y_points: specifies the number of points for the piece-wise linear
+ * scaling function of the luma component.
+ * @point_y_value: represents the x (luma value) coordinate for the i-th point
+ * of the piecewise linear scaling function for luma component. The values are
+ * signaled on the scale of 0..255. (In case of 10 bit video, these values
+ * correspond to luma values divided by 4. In case of 12 bit video, these values
+ * correspond to luma values divided by 16.).
+ * @point_y_scaling:  represents the scaling (output) value for the i-th point
+ * of the piecewise linear scaling function for luma component.
+ * @num_cb_points: specifies the number of points for the piece-wise linear
+ * scaling function of the cb component.
+ * @point_cb_value: represents the x coordinate for the i-th point of the
+ * piece-wise linear scaling function for cb component. The values are signaled
+ * on the scale of 0..255.
+ * @point_cb_scaling: represents the scaling (output) value for the i-th point
+ * of the piecewise linear scaling function for cb component.
+ * @num_cr_points: specifies represents the number of points for the piece-wise
+ * linear scaling function of the cr component.
+ * @point_cr_value:  represents the x coordinate for the i-th point of the
+ * piece-wise linear scaling function for cr component. The values are signaled
+ * on the scale of 0..255.
+ * @point_cr_scaling:  represents the scaling (output) value for the i-th point
+ * of the piecewise linear scaling function for cr component.
+ * @grain_scaling_minus_8: represents the shift – 8 applied to the values of the
+ * chroma component. The grain_scaling_minus_8 can take values of 0..3 and
+ * determines the range and quantization step of the standard deviation of film
+ * grain.
+ * @ar_coeff_lag: specifies the number of auto-regressive coefficients for luma
+ * and chroma.
+ * @ar_coeffs_y_plus_128: specifies auto-regressive coefficients used for the Y
+ * plane.
+ * @ar_coeffs_cb_plus_128: specifies auto-regressive coefficients used for the U
+ * plane.
+ * @ar_coeffs_cr_plus_128: specifies auto-regressive coefficients used for the V
+ * plane.
+ * @ar_coeff_shift_minus_6: specifies the range of the auto-regressive
+ * coefficients. Values of 0, 1, 2, and 3 correspond to the ranges for
+ * auto-regressive coefficients of [-2, 2), [-1, 1), [-0.5, 0.5) and [-0.25,
+ * 0.25) respectively.
+ * @grain_scale_shift: specifies how much the Gaussian random numbers should be
+ * scaled down during the grain synthesis process.
+ * @cb_mult: represents a multiplier for the cb component used in derivation of
+ * the input index to the cb component scaling function.
+ * @cb_luma_mult: represents a multiplier for the average luma component used in
+ * derivation of the input index to the cb component scaling function.
+ * @cb_offset: represents an offset used in derivation of the input index to the
+ * cb component scaling function.
+ * @cr_mult: represents a multiplier for the cr component used in derivation of
+ * the input index to the cr component scaling function.
+ * @cr_luma_mult: represents a multiplier for the average luma component used in
+ * derivation of the input index to the cr component scaling function.
+ * @cr_offset: represents an offset used in derivation of the input index to the
+ * cr component scaling function.
+ */
+#define V4L2_CID_STATELESS_AV1_FILM_GRAIN (V4L2_CID_CODEC_STATELESS_BASE + 505)
+struct v4l2_ctrl_av1_film_grain {
+	__u8 flags;
+	__u16 grain_seed;
+	__u8 film_grain_params_ref_idx;
+	__u8 num_y_points;
+	__u8 point_y_value[V4L2_AV1_MAX_NUM_Y_POINTS];
+	__u8 point_y_scaling[V4L2_AV1_MAX_NUM_Y_POINTS];
+	__u8 num_cb_points;
+	__u8 point_cb_value[V4L2_AV1_MAX_NUM_CB_POINTS];
+	__u8 point_cb_scaling[V4L2_AV1_MAX_NUM_CB_POINTS];
+	__u8 num_cr_points;
+	__u8 point_cr_value[V4L2_AV1_MAX_NUM_CR_POINTS];
+	__u8 point_cr_scaling[V4L2_AV1_MAX_NUM_CR_POINTS];
+	__u8 grain_scaling_minus_8;
+	__u8 ar_coeff_lag;
+	__u8 ar_coeffs_y_plus_128[V4L2_AV1_MAX_NUM_POS_LUMA];
+	__u8 ar_coeffs_cb_plus_128[V4L2_AV1_MAX_NUM_POS_LUMA];
+	__u8 ar_coeffs_cr_plus_128[V4L2_AV1_MAX_NUM_POS_LUMA];
+	__u8 ar_coeff_shift_minus_6;
+	__u8 grain_scale_shift;
+	__u8 cb_mult;
+	__u8 cb_luma_mult;
+	__u16 cb_offset;
+	__u8 cr_mult;
+	__u8 cr_luma_mult;
+	__u16 cr_offset;
+};
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 01e630f2ec78..1e91120eb90b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -738,6 +738,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
+#define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
 
 /*  Vendor-specific formats   */
 #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
@@ -1799,6 +1800,10 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_hevc_slice_params __user *p_hevc_slice_params;
 		struct v4l2_ctrl_hevc_scaling_matrix __user *p_hevc_scaling_matrix;
 		struct v4l2_ctrl_hevc_decode_params __user *p_hevc_decode_params;
+		struct v4l2_ctrl_av1_sequence __user *p_av1_sequence;
+		struct v4l2_ctrl_av1_tile_group_entry __user *p_av1_tile_group_entry;
+		struct v4l2_ctrl_av1_frame __user *p_av1_frame;
+		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
@@ -1872,6 +1877,11 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	= 0x0272,
 	V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	= 0x0273,
 	V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	= 0x0274,
+
+	V4L2_CTRL_TYPE_AV1_SEQUENCE	    = 0x280,
+	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
+	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
+	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.37.2

