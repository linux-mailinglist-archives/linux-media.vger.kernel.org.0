Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7794339E9F
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbhCMOnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:50 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58243 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234019AbhCMOn3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:29 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UFlV5d0; Sat, 13 Mar 2021 15:43:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646608; bh=eS0c2i6pG9mlnDwOALMpxpc1i3HkuI9BSF+0nAO5sLo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=CcsENmZtYDANHZ+o5zM9mlwuptj2LSr8urwg7fPZhN94jLDq69yj4x2cgdto4twbg
         LPPX00TItphlw+qOLlH1udWHJ5x4etLW4gTZNNUx0/tLVXym+p9a2GtQZcgafbd1p6
         cugZau9yMqc/hRVTO5EqkkO4sn4V8CCVQGBqQrgg0k26I1YLwZwg+8a6kGld1A2ka9
         hdbVElBo4OGZTPQs6vs3CzUzABty3YLQoVG5xIW9P6QGPOvLn3qAa9YTsMy11GNHG2
         D84n6nfUfQq38wd1qly6oAyEc8IUjfaK1X1ijFAX091KOeoUjJchPrjPbVWftFXdmO
         IqmlLbT+6op9A==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 03/15] Documentation/*/media: rename MPEG to CODEC
Date:   Sat, 13 Mar 2021 15:43:11 +0100
Message-Id: <20210313144323.143600-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLSx1V09vdOsiIy3BaNZdQmR/AETmlTZLgNQ9scdnGUt0EyBA5i0DQ6Ct0+d9egLK+97qvH87Wx78NNmwDGQSId51MO4xwmSM4nX0MFUXNzHT4mEtDo5
 FedObq0D2z1LmGMi8iAH3j1/wChCPGUS+GNnSpfyMSicQMH4O6MZhu6GlpsUE6rY+K+RhwCmBIXUpWwW3CBWhGxjIlqHy1QnLG5cg1al5i+JvOMijy214ozU
 moQjxHrL4nUZhoDqmrKNTv/6lBm39Dvwv/3dqOs4j4iFKXyW9BmCRzEo05tIjgAoix2BCxj68IvhCYVAKve93f2bxsyXAPFPRDAcCsvJSYLNR4LRq68oCZk1
 VwLXYKFU31VmWtxk87Ldo6kNGQwopg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Historically all codec-related data structures and defines used the
MPEG prefix. This is confusing. Rename MPEG to CODEC to make it clear
that the MPEG prefix isn't MPEG specific.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../driver-api/media/v4l2-controls.rst        |    2 +-
 .../media/drivers/cx2341x-uapi.rst            |    8 +-
 .../dvb/audio-bilingual-channel-select.rst    |    2 +-
 .../media/dvb/audio-channel-select.rst        |    2 +-
 .../media/dvb/video-get-frame-count.rst       |    2 +-
 .../userspace-api/media/dvb/video-get-pts.rst |    2 +-
 .../media/v4l/dev-sliced-vbi.rst              |   14 +-
 .../media/v4l/ext-ctrls-codec.rst             | 1250 ++++++++---------
 .../userspace-api/media/v4l/hist-v4l2.rst     |    6 +-
 .../media/v4l/pixfmt-compressed.rst           |   18 +-
 .../userspace-api/media/v4l/v4l2.rst          |    4 +-
 11 files changed, 655 insertions(+), 655 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-controls.rst b/Documentation/driver-api/media/v4l2-controls.rst
index b2e91804829b..3f89d8d5a3ce 100644
--- a/Documentation/driver-api/media/v4l2-controls.rst
+++ b/Documentation/driver-api/media/v4l2-controls.rst
@@ -456,7 +456,7 @@ Driver specific controls can be created using v4l2_ctrl_new_custom():
 
 	static const struct v4l2_ctrl_config ctrl_filter = {
 		.ops = &ctrl_custom_ops,
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER,
 		.name = "Spatial Filter",
 		.type = V4L2_CTRL_TYPE_INTEGER,
 		.flags = V4L2_CTRL_FLAG_SLIDER,
diff --git a/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst b/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
index 8a7977af79d5..49d19ab70abd 100644
--- a/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
+++ b/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
@@ -129,13 +129,13 @@ Raw format c example
 	}
 
 
-Format of embedded V4L2_MPEG_STREAM_VBI_FMT_IVTV VBI data
----------------------------------------------------------
+Format of embedded V4L2_CODEC_STREAM_VBI_FMT_IVTV VBI data
+----------------------------------------------------------
 
 Author: Hans Verkuil <hverkuil@xs4all.nl>
 
 
-This section describes the V4L2_MPEG_STREAM_VBI_FMT_IVTV format of the VBI data
+This section describes the V4L2_CODEC_STREAM_VBI_FMT_IVTV format of the VBI data
 embedded in an MPEG-2 program stream. This format is in part dictated by some
 hardware limitations of the ivtv driver (the driver for the Conexant cx23415/6
 chips), in particular a maximum size for the VBI data. Anything longer is cut
@@ -149,7 +149,7 @@ The stream ID of the VBI data is 0xBD. The maximum size of the embedded data is
 header and a 42 bytes payload each. Anything beyond this limit is cut off by
 the cx23415/6 firmware. Besides the data for the VBI lines we also need 36 bits
 for a bitmask determining which lines are captured and 4 bytes for a magic cookie,
-signifying that this data package contains V4L2_MPEG_STREAM_VBI_FMT_IVTV VBI data.
+signifying that this data package contains V4L2_CODEC_STREAM_VBI_FMT_IVTV VBI data.
 If all lines are used, then there is no longer room for the bitmask. To solve this
 two different magic numbers were introduced:
 
diff --git a/Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst b/Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst
index 33b5363317f1..5bcc22196329 100644
--- a/Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst
+++ b/Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst
@@ -44,7 +44,7 @@ Description
 -----------
 
 This ioctl is obsolete. Do not use in new drivers. It has been replaced
-by the V4L2 ``V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK`` control
+by the V4L2 ``V4L2_CID_CODEC_AUDIO_DEC_MULTILINGUAL_PLAYBACK`` control
 for MPEG decoders controlled through V4L2.
 
 This ioctl call asks the Audio Device to select the requested channel
diff --git a/Documentation/userspace-api/media/dvb/audio-channel-select.rst b/Documentation/userspace-api/media/dvb/audio-channel-select.rst
index 74093df92a68..13c761ad539e 100644
--- a/Documentation/userspace-api/media/dvb/audio-channel-select.rst
+++ b/Documentation/userspace-api/media/dvb/audio-channel-select.rst
@@ -44,7 +44,7 @@ Description
 -----------
 
 This ioctl is for Digital TV devices only. To control a V4L2 decoder use the
-V4L2 ``V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK`` control instead.
+V4L2 ``V4L2_CID_CODEC_AUDIO_DEC_PLAYBACK`` control instead.
 
 This ioctl call asks the Audio Device to select the requested channel if
 possible.
diff --git a/Documentation/userspace-api/media/dvb/video-get-frame-count.rst b/Documentation/userspace-api/media/dvb/video-get-frame-count.rst
index b48ac8c58a41..aaa97912528b 100644
--- a/Documentation/userspace-api/media/dvb/video-get-frame-count.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-frame-count.rst
@@ -51,7 +51,7 @@ Description
 -----------
 
 This ioctl is obsolete. Do not use in new drivers. For V4L2 decoders
-this ioctl has been replaced by the ``V4L2_CID_MPEG_VIDEO_DEC_FRAME``
+this ioctl has been replaced by the ``V4L2_CID_CODEC_VIDEO_DEC_FRAME``
 control.
 
 This ioctl call asks the Video Device to return the number of displayed
diff --git a/Documentation/userspace-api/media/dvb/video-get-pts.rst b/Documentation/userspace-api/media/dvb/video-get-pts.rst
index fedaff41be0b..b3b12ea942d4 100644
--- a/Documentation/userspace-api/media/dvb/video-get-pts.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-pts.rst
@@ -55,7 +55,7 @@ Description
 -----------
 
 This ioctl is obsolete. Do not use in new drivers. For V4L2 decoders
-this ioctl has been replaced by the ``V4L2_CID_MPEG_VIDEO_DEC_PTS``
+this ioctl has been replaced by the ``V4L2_CID_CODEC_VIDEO_DEC_PTS``
 control.
 
 This ioctl call asks the Video Device to return the current PTS
diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
index 97ec2b115c71..8fb01605990e 100644
--- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
@@ -380,17 +380,17 @@ providing
 :ref:`negotiated sliced VBI services <sliced-vbi-format-negotitation>`
 as data embedded in the MPEG stream. Users or applications control this
 sliced VBI data insertion with the
-:ref:`V4L2_CID_MPEG_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
+:ref:`V4L2_CID_CODEC_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
 control.
 
 If the driver does not provide the
-:ref:`V4L2_CID_MPEG_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
+:ref:`V4L2_CID_CODEC_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
 control, or only allows that control to be set to
-:ref:`V4L2_MPEG_STREAM_VBI_FMT_NONE <v4l2-mpeg-stream-vbi-fmt>`,
+:ref:`V4L2_CODEC_STREAM_VBI_FMT_NONE <v4l2-mpeg-stream-vbi-fmt>`,
 then the device cannot embed sliced VBI data in the MPEG stream.
 
 The
-:ref:`V4L2_CID_MPEG_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
+:ref:`V4L2_CID_CODEC_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
 control does not implicitly set the device driver to capture nor cease
 capturing sliced VBI data. The control only indicates to embed sliced
 VBI data in the MPEG stream, if an application has negotiated sliced VBI
@@ -410,7 +410,7 @@ MPEG Stream Embedded, Sliced VBI Data Format: NONE
 --------------------------------------------------
 
 The
-:ref:`V4L2_MPEG_STREAM_VBI_FMT_NONE <v4l2-mpeg-stream-vbi-fmt>`
+:ref:`V4L2_CODEC_STREAM_VBI_FMT_NONE <v4l2-mpeg-stream-vbi-fmt>`
 embedded sliced VBI format shall be interpreted by drivers as a control
 to cease embedding sliced VBI data in MPEG streams. Neither the device
 nor driver shall insert "empty" embedded sliced VBI data packets in the
@@ -421,7 +421,7 @@ MPEG Stream Embedded, Sliced VBI Data Format: IVTV
 --------------------------------------------------
 
 The
-:ref:`V4L2_MPEG_STREAM_VBI_FMT_IVTV <v4l2-mpeg-stream-vbi-fmt>`
+:ref:`V4L2_CODEC_STREAM_VBI_FMT_IVTV <v4l2-mpeg-stream-vbi-fmt>`
 embedded sliced VBI format, when supported, indicates to the driver to
 embed up to 36 lines of sliced VBI data per frame in an MPEG-2 *Private
 Stream 1 PES* packet encapsulated in an MPEG-2 *Program Pack* in the
@@ -444,7 +444,7 @@ this format as well.
 
 The following definitions specify the payload of the MPEG-2 *Private
 Stream 1 PES* packets that contain sliced VBI data when
-:ref:`V4L2_MPEG_STREAM_VBI_FMT_IVTV <v4l2-mpeg-stream-vbi-fmt>`
+:ref:`V4L2_CODEC_STREAM_VBI_FMT_IVTV <v4l2-mpeg-stream-vbi-fmt>`
 is set. (The MPEG-2 *Private Stream 1 PES* packet header and
 encapsulating MPEG-2 *Program Pack* header are not detailed here. Please
 refer to the MPEG-2 specifications for details on those packet headers.)
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index e2d7c4a87fea..34884a785d76 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -34,10 +34,10 @@ Codec Control IDs
 
 .. _v4l2-mpeg-stream-type:
 
-``V4L2_CID_MPEG_STREAM_TYPE``
+``V4L2_CID_CODEC_STREAM_TYPE``
     (enum)
 
-enum v4l2_mpeg_stream_type -
+enum v4l2_codec_stream_type -
     The MPEG-1, -2 or -4 output stream type. One cannot assume anything
     here. Each hardware MPEG encoder tends to support different subsets
     of the available MPEG stream types. This control is specific to
@@ -49,47 +49,47 @@ enum v4l2_mpeg_stream_type -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_STREAM_TYPE_MPEG2_PS``
+    * - ``V4L2_CODEC_STREAM_TYPE_MPEG2_PS``
       - MPEG-2 program stream
-    * - ``V4L2_MPEG_STREAM_TYPE_MPEG2_TS``
+    * - ``V4L2_CODEC_STREAM_TYPE_MPEG2_TS``
       - MPEG-2 transport stream
-    * - ``V4L2_MPEG_STREAM_TYPE_MPEG1_SS``
+    * - ``V4L2_CODEC_STREAM_TYPE_MPEG1_SS``
       - MPEG-1 system stream
-    * - ``V4L2_MPEG_STREAM_TYPE_MPEG2_DVD``
+    * - ``V4L2_CODEC_STREAM_TYPE_MPEG2_DVD``
       - MPEG-2 DVD-compatible stream
-    * - ``V4L2_MPEG_STREAM_TYPE_MPEG1_VCD``
+    * - ``V4L2_CODEC_STREAM_TYPE_MPEG1_VCD``
       - MPEG-1 VCD-compatible stream
-    * - ``V4L2_MPEG_STREAM_TYPE_MPEG2_SVCD``
+    * - ``V4L2_CODEC_STREAM_TYPE_MPEG2_SVCD``
       - MPEG-2 SVCD-compatible stream
 
 
 
-``V4L2_CID_MPEG_STREAM_PID_PMT (integer)``
+``V4L2_CID_CODEC_STREAM_PID_PMT (integer)``
     Program Map Table Packet ID for the MPEG transport stream (default
     16)
 
-``V4L2_CID_MPEG_STREAM_PID_AUDIO (integer)``
+``V4L2_CID_CODEC_STREAM_PID_AUDIO (integer)``
     Audio Packet ID for the MPEG transport stream (default 256)
 
-``V4L2_CID_MPEG_STREAM_PID_VIDEO (integer)``
+``V4L2_CID_CODEC_STREAM_PID_VIDEO (integer)``
     Video Packet ID for the MPEG transport stream (default 260)
 
-``V4L2_CID_MPEG_STREAM_PID_PCR (integer)``
+``V4L2_CID_CODEC_STREAM_PID_PCR (integer)``
     Packet ID for the MPEG transport stream carrying PCR fields (default
     259)
 
-``V4L2_CID_MPEG_STREAM_PES_ID_AUDIO (integer)``
+``V4L2_CID_CODEC_STREAM_PES_ID_AUDIO (integer)``
     Audio ID for MPEG PES
 
-``V4L2_CID_MPEG_STREAM_PES_ID_VIDEO (integer)``
+``V4L2_CID_CODEC_STREAM_PES_ID_VIDEO (integer)``
     Video ID for MPEG PES
 
 .. _v4l2-mpeg-stream-vbi-fmt:
 
-``V4L2_CID_MPEG_STREAM_VBI_FMT``
+``V4L2_CID_CODEC_STREAM_VBI_FMT``
     (enum)
 
-enum v4l2_mpeg_stream_vbi_fmt -
+enum v4l2_codec_stream_vbi_fmt -
     Some cards can embed VBI data (e. g. Closed Caption, Teletext) into
     the MPEG stream. This control selects whether VBI data should be
     embedded, and if so, what embedding method should be used. The list
@@ -104,9 +104,9 @@ enum v4l2_mpeg_stream_vbi_fmt -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_STREAM_VBI_FMT_NONE``
+    * - ``V4L2_CODEC_STREAM_VBI_FMT_NONE``
       - No VBI in the MPEG stream
-    * - ``V4L2_MPEG_STREAM_VBI_FMT_IVTV``
+    * - ``V4L2_CODEC_STREAM_VBI_FMT_IVTV``
       - VBI in private packets, IVTV format (documented in the kernel
 	sources in the file
 	``Documentation/userspace-api/media/drivers/cx2341x-uapi.rst``)
@@ -115,10 +115,10 @@ enum v4l2_mpeg_stream_vbi_fmt -
 
 .. _v4l2-mpeg-audio-sampling-freq:
 
-``V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ``
+``V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ``
     (enum)
 
-enum v4l2_mpeg_audio_sampling_freq -
+enum v4l2_codec_audio_sampling_freq -
     MPEG Audio sampling frequency. Possible values are:
 
 
@@ -127,21 +127,21 @@ enum v4l2_mpeg_audio_sampling_freq -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_AUDIO_SAMPLING_FREQ_44100``
+    * - ``V4L2_CODEC_AUDIO_SAMPLING_FREQ_44100``
       - 44.1 kHz
-    * - ``V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000``
+    * - ``V4L2_CODEC_AUDIO_SAMPLING_FREQ_48000``
       - 48 kHz
-    * - ``V4L2_MPEG_AUDIO_SAMPLING_FREQ_32000``
+    * - ``V4L2_CODEC_AUDIO_SAMPLING_FREQ_32000``
       - 32 kHz
 
 
 
 .. _v4l2-mpeg-audio-encoding:
 
-``V4L2_CID_MPEG_AUDIO_ENCODING``
+``V4L2_CID_CODEC_AUDIO_ENCODING``
     (enum)
 
-enum v4l2_mpeg_audio_encoding -
+enum v4l2_codec_audio_encoding -
     MPEG Audio encoding. This control is specific to multiplexed MPEG
     streams. Possible values are:
 
@@ -151,25 +151,25 @@ enum v4l2_mpeg_audio_encoding -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_AUDIO_ENCODING_LAYER_1``
+    * - ``V4L2_CODEC_AUDIO_ENCODING_LAYER_1``
       - MPEG-1/2 Layer I encoding
-    * - ``V4L2_MPEG_AUDIO_ENCODING_LAYER_2``
+    * - ``V4L2_CODEC_AUDIO_ENCODING_LAYER_2``
       - MPEG-1/2 Layer II encoding
-    * - ``V4L2_MPEG_AUDIO_ENCODING_LAYER_3``
+    * - ``V4L2_CODEC_AUDIO_ENCODING_LAYER_3``
       - MPEG-1/2 Layer III encoding
-    * - ``V4L2_MPEG_AUDIO_ENCODING_AAC``
+    * - ``V4L2_CODEC_AUDIO_ENCODING_AAC``
       - MPEG-2/4 AAC (Advanced Audio Coding)
-    * - ``V4L2_MPEG_AUDIO_ENCODING_AC3``
+    * - ``V4L2_CODEC_AUDIO_ENCODING_AC3``
       - AC-3 aka ATSC A/52 encoding
 
 
 
 .. _v4l2-mpeg-audio-l1-bitrate:
 
-``V4L2_CID_MPEG_AUDIO_L1_BITRATE``
+``V4L2_CID_CODEC_AUDIO_L1_BITRATE``
     (enum)
 
-enum v4l2_mpeg_audio_l1_bitrate -
+enum v4l2_codec_audio_l1_bitrate -
     MPEG-1/2 Layer I bitrate. Possible values are:
 
 
@@ -178,43 +178,43 @@ enum v4l2_mpeg_audio_l1_bitrate -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_32K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_32K``
       - 32 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_64K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_64K``
       - 64 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_96K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_96K``
       - 96 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_128K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_128K``
       - 128 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_160K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_160K``
       - 160 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_192K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_192K``
       - 192 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_224K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_224K``
       - 224 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_256K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_256K``
       - 256 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_288K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_288K``
       - 288 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_320K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_320K``
       - 320 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_352K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_352K``
       - 352 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_384K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_384K``
       - 384 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_416K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_416K``
       - 416 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L1_BITRATE_448K``
+    * - ``V4L2_CODEC_AUDIO_L1_BITRATE_448K``
       - 448 kbit/s
 
 
 
 .. _v4l2-mpeg-audio-l2-bitrate:
 
-``V4L2_CID_MPEG_AUDIO_L2_BITRATE``
+``V4L2_CID_CODEC_AUDIO_L2_BITRATE``
     (enum)
 
-enum v4l2_mpeg_audio_l2_bitrate -
+enum v4l2_codec_audio_l2_bitrate -
     MPEG-1/2 Layer II bitrate. Possible values are:
 
 
@@ -223,43 +223,43 @@ enum v4l2_mpeg_audio_l2_bitrate -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_32K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_32K``
       - 32 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_48K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_48K``
       - 48 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_56K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_56K``
       - 56 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_64K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_64K``
       - 64 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_80K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_80K``
       - 80 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_96K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_96K``
       - 96 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_112K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_112K``
       - 112 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_128K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_128K``
       - 128 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_160K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_160K``
       - 160 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_192K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_192K``
       - 192 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_224K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_224K``
       - 224 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_256K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_256K``
       - 256 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_320K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_320K``
       - 320 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L2_BITRATE_384K``
+    * - ``V4L2_CODEC_AUDIO_L2_BITRATE_384K``
       - 384 kbit/s
 
 
 
 .. _v4l2-mpeg-audio-l3-bitrate:
 
-``V4L2_CID_MPEG_AUDIO_L3_BITRATE``
+``V4L2_CID_CODEC_AUDIO_L3_BITRATE``
     (enum)
 
-enum v4l2_mpeg_audio_l3_bitrate -
+enum v4l2_codec_audio_l3_bitrate -
     MPEG-1/2 Layer III bitrate. Possible values are:
 
 
@@ -268,46 +268,46 @@ enum v4l2_mpeg_audio_l3_bitrate -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_32K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_32K``
       - 32 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_40K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_40K``
       - 40 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_48K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_48K``
       - 48 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_56K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_56K``
       - 56 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_64K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_64K``
       - 64 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_80K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_80K``
       - 80 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_96K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_96K``
       - 96 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_112K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_112K``
       - 112 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_128K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_128K``
       - 128 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_160K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_160K``
       - 160 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_192K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_192K``
       - 192 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_224K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_224K``
       - 224 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_256K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_256K``
       - 256 kbit/s
-    * - ``V4L2_MPEG_AUDIO_L3_BITRATE_320K``
+    * - ``V4L2_CODEC_AUDIO_L3_BITRATE_320K``
       - 320 kbit/s
 
 
 
-``V4L2_CID_MPEG_AUDIO_AAC_BITRATE (integer)``
+``V4L2_CID_CODEC_AUDIO_AAC_BITRATE (integer)``
     AAC bitrate in bits per second.
 
 .. _v4l2-mpeg-audio-ac3-bitrate:
 
-``V4L2_CID_MPEG_AUDIO_AC3_BITRATE``
+``V4L2_CID_CODEC_AUDIO_AC3_BITRATE``
     (enum)
 
-enum v4l2_mpeg_audio_ac3_bitrate -
+enum v4l2_codec_audio_ac3_bitrate -
     AC-3 bitrate. Possible values are:
 
 
@@ -316,53 +316,53 @@ enum v4l2_mpeg_audio_ac3_bitrate -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_32K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_32K``
       - 32 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_40K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_40K``
       - 40 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_48K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_48K``
       - 48 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_56K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_56K``
       - 56 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_64K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_64K``
       - 64 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_80K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_80K``
       - 80 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_96K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_96K``
       - 96 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_112K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_112K``
       - 112 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_128K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_128K``
       - 128 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_160K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_160K``
       - 160 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_192K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_192K``
       - 192 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_224K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_224K``
       - 224 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_256K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_256K``
       - 256 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_320K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_320K``
       - 320 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_384K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_384K``
       - 384 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_448K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_448K``
       - 448 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_512K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_512K``
       - 512 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_576K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_576K``
       - 576 kbit/s
-    * - ``V4L2_MPEG_AUDIO_AC3_BITRATE_640K``
+    * - ``V4L2_CODEC_AUDIO_AC3_BITRATE_640K``
       - 640 kbit/s
 
 
 
 .. _v4l2-mpeg-audio-mode:
 
-``V4L2_CID_MPEG_AUDIO_MODE``
+``V4L2_CID_CODEC_AUDIO_MODE``
     (enum)
 
-enum v4l2_mpeg_audio_mode -
+enum v4l2_codec_audio_mode -
     MPEG Audio mode. Possible values are:
 
 
@@ -371,23 +371,23 @@ enum v4l2_mpeg_audio_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_AUDIO_MODE_STEREO``
+    * - ``V4L2_CODEC_AUDIO_MODE_STEREO``
       - Stereo
-    * - ``V4L2_MPEG_AUDIO_MODE_JOINT_STEREO``
+    * - ``V4L2_CODEC_AUDIO_MODE_JOINT_STEREO``
       - Joint Stereo
-    * - ``V4L2_MPEG_AUDIO_MODE_DUAL``
+    * - ``V4L2_CODEC_AUDIO_MODE_DUAL``
       - Bilingual
-    * - ``V4L2_MPEG_AUDIO_MODE_MONO``
+    * - ``V4L2_CODEC_AUDIO_MODE_MONO``
       - Mono
 
 
 
 .. _v4l2-mpeg-audio-mode-extension:
 
-``V4L2_CID_MPEG_AUDIO_MODE_EXTENSION``
+``V4L2_CID_CODEC_AUDIO_MODE_EXTENSION``
     (enum)
 
-enum v4l2_mpeg_audio_mode_extension -
+enum v4l2_codec_audio_mode_extension -
     Joint Stereo audio mode extension. In Layer I and II they indicate
     which subbands are in intensity stereo. All other subbands are coded
     in stereo. Layer III is not (yet) supported. Possible values are:
@@ -398,23 +398,23 @@ enum v4l2_mpeg_audio_mode_extension -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_4``
+    * - ``V4L2_CODEC_AUDIO_MODE_EXTENSION_BOUND_4``
       - Subbands 4-31 in intensity stereo
-    * - ``V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_8``
+    * - ``V4L2_CODEC_AUDIO_MODE_EXTENSION_BOUND_8``
       - Subbands 8-31 in intensity stereo
-    * - ``V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_12``
+    * - ``V4L2_CODEC_AUDIO_MODE_EXTENSION_BOUND_12``
       - Subbands 12-31 in intensity stereo
-    * - ``V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_16``
+    * - ``V4L2_CODEC_AUDIO_MODE_EXTENSION_BOUND_16``
       - Subbands 16-31 in intensity stereo
 
 
 
 .. _v4l2-mpeg-audio-emphasis:
 
-``V4L2_CID_MPEG_AUDIO_EMPHASIS``
+``V4L2_CID_CODEC_AUDIO_EMPHASIS``
     (enum)
 
-enum v4l2_mpeg_audio_emphasis -
+enum v4l2_codec_audio_emphasis -
     Audio Emphasis. Possible values are:
 
 
@@ -423,21 +423,21 @@ enum v4l2_mpeg_audio_emphasis -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_AUDIO_EMPHASIS_NONE``
+    * - ``V4L2_CODEC_AUDIO_EMPHASIS_NONE``
       - None
-    * - ``V4L2_MPEG_AUDIO_EMPHASIS_50_DIV_15_uS``
+    * - ``V4L2_CODEC_AUDIO_EMPHASIS_50_DIV_15_uS``
       - 50/15 microsecond emphasis
-    * - ``V4L2_MPEG_AUDIO_EMPHASIS_CCITT_J17``
+    * - ``V4L2_CODEC_AUDIO_EMPHASIS_CCITT_J17``
       - CCITT J.17
 
 
 
 .. _v4l2-mpeg-audio-crc:
 
-``V4L2_CID_MPEG_AUDIO_CRC``
+``V4L2_CID_CODEC_AUDIO_CRC``
     (enum)
 
-enum v4l2_mpeg_audio_crc -
+enum v4l2_codec_audio_crc -
     CRC method. Possible values are:
 
 
@@ -446,14 +446,14 @@ enum v4l2_mpeg_audio_crc -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_AUDIO_CRC_NONE``
+    * - ``V4L2_CODEC_AUDIO_CRC_NONE``
       - None
-    * - ``V4L2_MPEG_AUDIO_CRC_CRC16``
+    * - ``V4L2_CODEC_AUDIO_CRC_CRC16``
       - 16 bit parity check
 
 
 
-``V4L2_CID_MPEG_AUDIO_MUTE (boolean)``
+``V4L2_CID_CODEC_AUDIO_MUTE (boolean)``
     Mutes the audio when capturing. This is not done by muting audio
     hardware, which can still produce a slight hiss, but in the encoder
     itself, guaranteeing a fixed and reproducible audio bitstream. 0 =
@@ -461,10 +461,10 @@ enum v4l2_mpeg_audio_crc -
 
 .. _v4l2-mpeg-audio-dec-playback:
 
-``V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK``
+``V4L2_CID_CODEC_AUDIO_DEC_PLAYBACK``
     (enum)
 
-enum v4l2_mpeg_audio_dec_playback -
+enum v4l2_codec_audio_dec_playback -
     Determines how monolingual audio should be played back. Possible
     values are:
 
@@ -476,35 +476,35 @@ enum v4l2_mpeg_audio_dec_playback -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_AUDIO_DEC_PLAYBACK_AUTO``
+    * - ``V4L2_CODEC_AUDIO_DEC_PLAYBACK_AUTO``
       - Automatically determines the best playback mode.
-    * - ``V4L2_MPEG_AUDIO_DEC_PLAYBACK_STEREO``
+    * - ``V4L2_CODEC_AUDIO_DEC_PLAYBACK_STEREO``
       - Stereo playback.
-    * - ``V4L2_MPEG_AUDIO_DEC_PLAYBACK_LEFT``
+    * - ``V4L2_CODEC_AUDIO_DEC_PLAYBACK_LEFT``
       - Left channel playback.
-    * - ``V4L2_MPEG_AUDIO_DEC_PLAYBACK_RIGHT``
+    * - ``V4L2_CODEC_AUDIO_DEC_PLAYBACK_RIGHT``
       - Right channel playback.
-    * - ``V4L2_MPEG_AUDIO_DEC_PLAYBACK_MONO``
+    * - ``V4L2_CODEC_AUDIO_DEC_PLAYBACK_MONO``
       - Mono playback.
-    * - ``V4L2_MPEG_AUDIO_DEC_PLAYBACK_SWAPPED_STEREO``
+    * - ``V4L2_CODEC_AUDIO_DEC_PLAYBACK_SWAPPED_STEREO``
       - Stereo playback with swapped left and right channels.
 
 
 
 .. _v4l2-mpeg-audio-dec-multilingual-playback:
 
-``V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK``
+``V4L2_CID_CODEC_AUDIO_DEC_MULTILINGUAL_PLAYBACK``
     (enum)
 
-enum v4l2_mpeg_audio_dec_playback -
+enum v4l2_codec_audio_dec_playback -
     Determines how multilingual audio should be played back.
 
 .. _v4l2-mpeg-video-encoding:
 
-``V4L2_CID_MPEG_VIDEO_ENCODING``
+``V4L2_CID_CODEC_VIDEO_ENCODING``
     (enum)
 
-enum v4l2_mpeg_video_encoding -
+enum v4l2_codec_video_encoding -
     MPEG Video encoding method. This control is specific to multiplexed
     MPEG streams. Possible values are:
 
@@ -514,21 +514,21 @@ enum v4l2_mpeg_video_encoding -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_ENCODING_MPEG_1``
+    * - ``V4L2_CODEC_VIDEO_ENCODING_MPEG_1``
       - MPEG-1 Video encoding
-    * - ``V4L2_MPEG_VIDEO_ENCODING_MPEG_2``
+    * - ``V4L2_CODEC_VIDEO_ENCODING_MPEG_2``
       - MPEG-2 Video encoding
-    * - ``V4L2_MPEG_VIDEO_ENCODING_MPEG_4_AVC``
+    * - ``V4L2_CODEC_VIDEO_ENCODING_MPEG_4_AVC``
       - MPEG-4 AVC (H.264) Video encoding
 
 
 
 .. _v4l2-mpeg-video-aspect:
 
-``V4L2_CID_MPEG_VIDEO_ASPECT``
+``V4L2_CID_CODEC_VIDEO_ASPECT``
     (enum)
 
-enum v4l2_mpeg_video_aspect -
+enum v4l2_codec_video_aspect -
     Video aspect. Possible values are:
 
 
@@ -537,31 +537,31 @@ enum v4l2_mpeg_video_aspect -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_ASPECT_1x1``
-    * - ``V4L2_MPEG_VIDEO_ASPECT_4x3``
-    * - ``V4L2_MPEG_VIDEO_ASPECT_16x9``
-    * - ``V4L2_MPEG_VIDEO_ASPECT_221x100``
+    * - ``V4L2_CODEC_VIDEO_ASPECT_1x1``
+    * - ``V4L2_CODEC_VIDEO_ASPECT_4x3``
+    * - ``V4L2_CODEC_VIDEO_ASPECT_16x9``
+    * - ``V4L2_CODEC_VIDEO_ASPECT_221x100``
 
 
 
-``V4L2_CID_MPEG_VIDEO_B_FRAMES (integer)``
+``V4L2_CID_CODEC_VIDEO_B_FRAMES (integer)``
     Number of B-Frames (default 2)
 
-``V4L2_CID_MPEG_VIDEO_GOP_SIZE (integer)``
+``V4L2_CID_CODEC_VIDEO_GOP_SIZE (integer)``
     GOP size (default 12)
 
-``V4L2_CID_MPEG_VIDEO_GOP_CLOSURE (boolean)``
+``V4L2_CID_CODEC_VIDEO_GOP_CLOSURE (boolean)``
     GOP closure (default 1)
 
-``V4L2_CID_MPEG_VIDEO_PULLDOWN (boolean)``
+``V4L2_CID_CODEC_VIDEO_PULLDOWN (boolean)``
     Enable 3:2 pulldown (default 0)
 
 .. _v4l2-mpeg-video-bitrate-mode:
 
-``V4L2_CID_MPEG_VIDEO_BITRATE_MODE``
+``V4L2_CID_CODEC_VIDEO_BITRATE_MODE``
     (enum)
 
-enum v4l2_mpeg_video_bitrate_mode -
+enum v4l2_codec_video_bitrate_mode -
     Video bitrate mode. Possible values are:
 
 
@@ -570,35 +570,35 @@ enum v4l2_mpeg_video_bitrate_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_VBR``
+    * - ``V4L2_CODEC_VIDEO_BITRATE_MODE_VBR``
       - Variable bitrate
-    * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CBR``
+    * - ``V4L2_CODEC_VIDEO_BITRATE_MODE_CBR``
       - Constant bitrate
-    * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``
+    * - ``V4L2_CODEC_VIDEO_BITRATE_MODE_CQ``
       - Constant quality
 
 
 
-``V4L2_CID_MPEG_VIDEO_BITRATE (integer)``
+``V4L2_CID_CODEC_VIDEO_BITRATE (integer)``
     Video bitrate in bits per second.
 
-``V4L2_CID_MPEG_VIDEO_BITRATE_PEAK (integer)``
+``V4L2_CID_CODEC_VIDEO_BITRATE_PEAK (integer)``
     Peak video bitrate in bits per second. Must be larger or equal to
     the average video bitrate. It is ignored if the video bitrate mode
     is set to constant bitrate.
 
-``V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY (integer)``
+``V4L2_CID_CODEC_VIDEO_CONSTANT_QUALITY (integer)``
     Constant quality level control. This control is applicable when
-    ``V4L2_CID_MPEG_VIDEO_BITRATE_MODE`` value is
-    ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``. Valid range is 1 to 100
+    ``V4L2_CID_CODEC_VIDEO_BITRATE_MODE`` value is
+    ``V4L2_CODEC_VIDEO_BITRATE_MODE_CQ``. Valid range is 1 to 100
     where 1 indicates lowest quality and 100 indicates highest quality.
     Encoder will decide the appropriate quantization parameter and
     bitrate to produce requested frame quality.
 
 
-``V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE (enum)``
+``V4L2_CID_CODEC_VIDEO_FRAME_SKIP_MODE (enum)``
 
-enum v4l2_mpeg_video_frame_skip_mode -
+enum v4l2_codec_video_frame_skip_mode -
     Indicates in what conditions the encoder should skip frames. If
     encoding a frame would cause the encoded stream to be larger then a
     chosen data limit then the frame will be skipped. Possible values
@@ -615,12 +615,12 @@ enum v4l2_mpeg_video_frame_skip_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED``
+    * - ``V4L2_CODEC_VIDEO_FRAME_SKIP_MODE_DISABLED``
       - Frame skip mode is disabled.
-    * - ``V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT``
+    * - ``V4L2_CODEC_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT``
       - Frame skip mode enabled and buffer limit is set by the chosen
         level and is defined by the standard.
-    * - ``V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT``
+    * - ``V4L2_CODEC_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT``
       - Frame skip mode enabled and buffer limit is set by the
         :ref:`VBV (MPEG1/2/4) <v4l2-mpeg-video-vbv-size>` or
         :ref:`CPB (H264) buffer size <v4l2-mpeg-video-h264-cpb-size>` control.
@@ -629,16 +629,16 @@ enum v4l2_mpeg_video_frame_skip_mode -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION (integer)``
+``V4L2_CID_CODEC_VIDEO_TEMPORAL_DECIMATION (integer)``
     For every captured frame, skip this many subsequent frames (default
     0).
 
-``V4L2_CID_MPEG_VIDEO_MUTE (boolean)``
+``V4L2_CID_CODEC_VIDEO_MUTE (boolean)``
     "Mutes" the video to a fixed color when capturing. This is useful
     for testing, to produce a fixed video bitstream. 0 = unmuted, 1 =
     muted.
 
-``V4L2_CID_MPEG_VIDEO_MUTE_YUV (integer)``
+``V4L2_CID_CODEC_VIDEO_MUTE_YUV (integer)``
     Sets the "mute" color of the video. The supplied 32-bit integer is
     interpreted as follows (bit 0 = least significant bit):
 
@@ -661,7 +661,7 @@ enum v4l2_mpeg_video_frame_skip_mode -
 
 .. _v4l2-mpeg-video-dec-pts:
 
-``V4L2_CID_MPEG_VIDEO_DEC_PTS (integer64)``
+``V4L2_CID_CODEC_VIDEO_DEC_PTS (integer64)``
     This read-only control returns the 33-bit video Presentation Time
     Stamp as defined in ITU T-REC-H.222.0 and ISO/IEC 13818-1 of the
     currently displayed frame. This is the same PTS as is used in
@@ -669,26 +669,26 @@ enum v4l2_mpeg_video_frame_skip_mode -
 
 .. _v4l2-mpeg-video-dec-frame:
 
-``V4L2_CID_MPEG_VIDEO_DEC_FRAME (integer64)``
+``V4L2_CID_CODEC_VIDEO_DEC_FRAME (integer64)``
     This read-only control returns the frame counter of the frame that
     is currently displayed (decoded). This value is reset to 0 whenever
     the decoder is started.
 
-``V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE (boolean)``
+``V4L2_CID_CODEC_VIDEO_DECODER_SLICE_INTERFACE (boolean)``
     If enabled the decoder expects to receive a single slice per buffer,
     otherwise the decoder expects a single frame in per buffer.
     Applicable to the decoder, all codecs.
 
-``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
+``V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
     Enable writing sample aspect ratio in the Video Usability
     Information. Applicable to the H264 encoder.
 
 .. _v4l2-mpeg-video-h264-vui-sar-idc:
 
-``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC``
+``V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_IDC``
     (enum)
 
-enum v4l2_mpeg_video_h264_vui_sar_idc -
+enum v4l2_codec_video_h264_vui_sar_idc -
     VUI sample aspect ratio indicator for H.264 encoding. The value is
     defined in the table E-1 in the standard. Applicable to the H264
     encoder.
@@ -699,59 +699,59 @@ enum v4l2_mpeg_video_h264_vui_sar_idc -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED``
       - Unspecified
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_1x1``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_1x1``
       - 1x1
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_12x11``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_12x11``
       - 12x11
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_10x11``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_10x11``
       - 10x11
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_16x11``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_16x11``
       - 16x11
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_40x33``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_40x33``
       - 40x33
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_24x11``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_24x11``
       - 24x11
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_20x11``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_20x11``
       - 20x11
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_32x11``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_32x11``
       - 32x11
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_80x33``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_80x33``
       - 80x33
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_18x11``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_18x11``
       - 18x11
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_15x11``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_15x11``
       - 15x11
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_64x33``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_64x33``
       - 64x33
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_160x99``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_160x99``
       - 160x99
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_4x3``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_4x3``
       - 4x3
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_3x2``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_3x2``
       - 3x2
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_2x1``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_2x1``
       - 2x1
-    * - ``V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED``
+    * - ``V4L2_CODEC_VIDEO_H264_VUI_SAR_IDC_EXTENDED``
       - Extended SAR
 
 
 
-``V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_VUI_EXT_SAR_WIDTH (integer)``
     Extended sample aspect ratio width for H.264 VUI encoding.
     Applicable to the H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_VUI_EXT_SAR_HEIGHT (integer)``
     Extended sample aspect ratio height for H.264 VUI encoding.
     Applicable to the H264 encoder.
 
 .. _v4l2-mpeg-video-h264-level:
 
-``V4L2_CID_MPEG_VIDEO_H264_LEVEL``
+``V4L2_CID_CODEC_VIDEO_H264_LEVEL``
     (enum)
 
-enum v4l2_mpeg_video_h264_level -
+enum v4l2_codec_video_h264_level -
     The level information for the H264 video elementary stream.
     Applicable to the H264 encoder. Possible values are:
 
@@ -761,55 +761,55 @@ enum v4l2_mpeg_video_h264_level -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_1_0``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_1_0``
       - Level 1.0
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_1B``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_1B``
       - Level 1B
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_1_1``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_1_1``
       - Level 1.1
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_1_2``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_1_2``
       - Level 1.2
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_1_3``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_1_3``
       - Level 1.3
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_2_0``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_2_0``
       - Level 2.0
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_2_1``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_2_1``
       - Level 2.1
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_2_2``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_2_2``
       - Level 2.2
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_3_0``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_3_0``
       - Level 3.0
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_3_1``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_3_1``
       - Level 3.1
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_3_2``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_3_2``
       - Level 3.2
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_4_0``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_4_0``
       - Level 4.0
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_4_1``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_4_1``
       - Level 4.1
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_4_2``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_4_2``
       - Level 4.2
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_5_0``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_5_0``
       - Level 5.0
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_5_1``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_5_1``
       - Level 5.1
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_5_2``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_5_2``
       - Level 5.2
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_6_0``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_6_0``
       - Level 6.0
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_6_1``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_6_1``
       - Level 6.1
-    * - ``V4L2_MPEG_VIDEO_H264_LEVEL_6_2``
+    * - ``V4L2_CODEC_VIDEO_H264_LEVEL_6_2``
       - Level 6.2
 
 
 
 .. _v4l2-mpeg-video-mpeg2-level:
 
-``V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL``
+``V4L2_CID_CODEC_VIDEO_MPEG2_LEVEL``
     (enum)
 
-enum v4l2_mpeg_video_mpeg2_level -
+enum v4l2_codec_video_mpeg2_level -
     The level information for the MPEG2 elementary stream. Applicable to
     MPEG2 codecs. Possible values are:
 
@@ -819,23 +819,23 @@ enum v4l2_mpeg_video_mpeg2_level -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_MPEG2_LEVEL_LOW``
+    * - ``V4L2_CODEC_VIDEO_MPEG2_LEVEL_LOW``
       - Low Level (LL)
-    * - ``V4L2_MPEG_VIDEO_MPEG2_LEVEL_MAIN``
+    * - ``V4L2_CODEC_VIDEO_MPEG2_LEVEL_MAIN``
       - Main Level (ML)
-    * - ``V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH_1440``
+    * - ``V4L2_CODEC_VIDEO_MPEG2_LEVEL_HIGH_1440``
       - High-1440 Level (H-14)
-    * - ``V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH``
+    * - ``V4L2_CODEC_VIDEO_MPEG2_LEVEL_HIGH``
       - High Level (HL)
 
 
 
 .. _v4l2-mpeg-video-mpeg4-level:
 
-``V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL``
+``V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL``
     (enum)
 
-enum v4l2_mpeg_video_mpeg4_level -
+enum v4l2_codec_video_mpeg4_level -
     The level information for the MPEG4 elementary stream. Applicable to
     the MPEG4 encoder. Possible values are:
 
@@ -845,31 +845,31 @@ enum v4l2_mpeg_video_mpeg4_level -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_MPEG4_LEVEL_0``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_LEVEL_0``
       - Level 0
-    * - ``V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_LEVEL_0B``
       - Level 0b
-    * - ``V4L2_MPEG_VIDEO_MPEG4_LEVEL_1``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_LEVEL_1``
       - Level 1
-    * - ``V4L2_MPEG_VIDEO_MPEG4_LEVEL_2``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_LEVEL_2``
       - Level 2
-    * - ``V4L2_MPEG_VIDEO_MPEG4_LEVEL_3``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_LEVEL_3``
       - Level 3
-    * - ``V4L2_MPEG_VIDEO_MPEG4_LEVEL_3B``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_LEVEL_3B``
       - Level 3b
-    * - ``V4L2_MPEG_VIDEO_MPEG4_LEVEL_4``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_LEVEL_4``
       - Level 4
-    * - ``V4L2_MPEG_VIDEO_MPEG4_LEVEL_5``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_LEVEL_5``
       - Level 5
 
 
 
 .. _v4l2-mpeg-video-h264-profile:
 
-``V4L2_CID_MPEG_VIDEO_H264_PROFILE``
+``V4L2_CID_CODEC_VIDEO_H264_PROFILE``
     (enum)
 
-enum v4l2_mpeg_video_h264_profile -
+enum v4l2_codec_video_h264_profile -
     The profile information for H264. Applicable to the H264 encoder.
     Possible values are:
 
@@ -883,41 +883,41 @@ enum v4l2_mpeg_video_h264_profile -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE``
       - Baseline profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE``
       - Constrained Baseline profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_MAIN``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_MAIN``
       - Main profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_EXTENDED``
       - Extended profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_HIGH``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_HIGH``
       - High profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_HIGH_10``
       - High 10 profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_HIGH_422``
       - High 422 profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE``
       - High 444 Predictive profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10_INTRA``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_HIGH_10_INTRA``
       - High 10 Intra profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_HIGH_422_INTRA``
       - High 422 Intra profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_INTRA``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_HIGH_444_INTRA``
       - High 444 Intra profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_CAVLC_444_INTRA``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_CAVLC_444_INTRA``
       - CAVLC 444 Intra profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_BASELINE``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_SCALABLE_BASELINE``
       - Scalable Baseline profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_SCALABLE_HIGH``
       - Scalable High profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA``
       - Scalable High Intra profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_STEREO_HIGH``
       - Stereo High profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_MULTIVIEW_HIGH``
       - Multiview High profile
-    * - ``V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH``
+    * - ``V4L2_CODEC_VIDEO_H264_PROFILE_CONSTRAINED_HIGH``
       - Constrained High profile
 
 .. raw:: latex
@@ -926,10 +926,10 @@ enum v4l2_mpeg_video_h264_profile -
 
 .. _v4l2-mpeg-video-mpeg2-profile:
 
-``V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE``
+``V4L2_CID_CODEC_VIDEO_MPEG2_PROFILE``
     (enum)
 
-enum v4l2_mpeg_video_mpeg2_profile -
+enum v4l2_codec_video_mpeg2_profile -
     The profile information for MPEG2. Applicable to MPEG2 codecs.
     Possible values are:
 
@@ -943,17 +943,17 @@ enum v4l2_mpeg_video_mpeg2_profile -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_MPEG2_PROFILE_SIMPLE``
+    * - ``V4L2_CODEC_VIDEO_MPEG2_PROFILE_SIMPLE``
       - Simple profile (SP)
-    * - ``V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN``
+    * - ``V4L2_CODEC_VIDEO_MPEG2_PROFILE_MAIN``
       - Main profile (MP)
-    * - ``V4L2_MPEG_VIDEO_MPEG2_PROFILE_SNR_SCALABLE``
+    * - ``V4L2_CODEC_VIDEO_MPEG2_PROFILE_SNR_SCALABLE``
       - SNR Scalable profile (SNR)
-    * - ``V4L2_MPEG_VIDEO_MPEG2_PROFILE_SPATIALLY_SCALABLE``
+    * - ``V4L2_CODEC_VIDEO_MPEG2_PROFILE_SPATIALLY_SCALABLE``
       - Spatially Scalable profile (Spt)
-    * - ``V4L2_MPEG_VIDEO_MPEG2_PROFILE_HIGH``
+    * - ``V4L2_CODEC_VIDEO_MPEG2_PROFILE_HIGH``
       - High profile (HP)
-    * - ``V4L2_MPEG_VIDEO_MPEG2_PROFILE_MULTIVIEW``
+    * - ``V4L2_CODEC_VIDEO_MPEG2_PROFILE_MULTIVIEW``
       - Multi-view profile (MVP)
 
 
@@ -963,10 +963,10 @@ enum v4l2_mpeg_video_mpeg2_profile -
 
 .. _v4l2-mpeg-video-mpeg4-profile:
 
-``V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE``
+``V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE``
     (enum)
 
-enum v4l2_mpeg_video_mpeg4_profile -
+enum v4l2_codec_video_mpeg4_profile -
     The profile information for MPEG4. Applicable to the MPEG4 encoder.
     Possible values are:
 
@@ -980,31 +980,31 @@ enum v4l2_mpeg_video_mpeg4_profile -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE``
       - Simple profile
-    * - ``V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE``
       - Advanced Simple profile
-    * - ``V4L2_MPEG_VIDEO_MPEG4_PROFILE_CORE``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_PROFILE_CORE``
       - Core profile
-    * - ``V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE_SCALABLE``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_PROFILE_SIMPLE_SCALABLE``
       - Simple Scalable profile
-    * - ``V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY``
+    * - ``V4L2_CODEC_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY``
       - Advanced Coding Efficiency profile
 
 .. raw:: latex
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_MAX_REF_PIC (integer)``
+``V4L2_CID_CODEC_VIDEO_MAX_REF_PIC (integer)``
     The maximum number of reference pictures used for encoding.
     Applicable to the encoder.
 
 .. _v4l2-mpeg-video-multi-slice-mode:
 
-``V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE``
+``V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE``
     (enum)
 
-enum v4l2_mpeg_video_multi_slice_mode -
+enum v4l2_codec_video_multi_slice_mode -
     Determines how the encoder should handle division of frame into
     slices. Applicable to the encoder. Possible values are:
 
@@ -1016,33 +1016,33 @@ enum v4l2_mpeg_video_multi_slice_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE``
+    * - ``V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_SINGLE``
       - Single slice per frame.
-    * - ``V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB``
+    * - ``V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_MB``
       - Multiple slices with set maximum number of macroblocks per slice.
-    * - ``V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES``
+    * - ``V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_BYTES``
       - Multiple slice with set maximum size in bytes per slice.
 
 
 
-``V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB (integer)``
+``V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_MB (integer)``
     The maximum number of macroblocks in a slice. Used when
-    ``V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE`` is set to
-    ``V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB``. Applicable to the
+    ``V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE`` is set to
+    ``V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_MB``. Applicable to the
     encoder.
 
-``V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES (integer)``
+``V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_BYTES (integer)``
     The maximum size of a slice in bytes. Used when
-    ``V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE`` is set to
-    ``V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES``. Applicable to the
+    ``V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE`` is set to
+    ``V4L2_CODEC_VIDEO_MULTI_SLICE_MODE_MAX_BYTES``. Applicable to the
     encoder.
 
 .. _v4l2-mpeg-video-h264-loop-filter-mode:
 
-``V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE``
+``V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE``
     (enum)
 
-enum v4l2_mpeg_video_h264_loop_filter_mode -
+enum v4l2_codec_video_h264_loop_filter_mode -
     Loop filter mode for H264 encoder. Possible values are:
 
 .. raw:: latex
@@ -1055,11 +1055,11 @@ enum v4l2_mpeg_video_h264_loop_filter_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED``
+    * - ``V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_ENABLED``
       - Loop filter is enabled.
-    * - ``V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED``
+    * - ``V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_DISABLED``
       - Loop filter is disabled.
-    * - ``V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY``
+    * - ``V4L2_CODEC_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY``
       - Loop filter is disabled at the slice boundary.
 
 .. raw:: latex
@@ -1067,14 +1067,14 @@ enum v4l2_mpeg_video_h264_loop_filter_mode -
     \normalsize
 
 
-``V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_ALPHA (integer)``
     Loop filter alpha coefficient, defined in the H264 standard.
     This value corresponds to the slice_alpha_c0_offset_div2 slice header
     field, and should be in the range of -6 to +6, inclusive. The actual alpha
     offset FilterOffsetA is twice this value.
     Applicable to the H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_BETA (integer)``
     Loop filter beta coefficient, defined in the H264 standard.
     This corresponds to the slice_beta_offset_div2 slice header field, and
     should be in the range of -6 to +6, inclusive. The actual beta offset
@@ -1083,10 +1083,10 @@ enum v4l2_mpeg_video_h264_loop_filter_mode -
 
 .. _v4l2-mpeg-video-h264-entropy-mode:
 
-``V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE``
+``V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE``
     (enum)
 
-enum v4l2_mpeg_video_h264_entropy_mode -
+enum v4l2_codec_video_h264_entropy_mode -
     Entropy coding mode for H264 - CABAC/CAVALC. Applicable to the H264
     encoder. Possible values are:
 
@@ -1098,142 +1098,142 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC``
+    * - ``V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CAVLC``
       - Use CAVLC entropy coding.
-    * - ``V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC``
+    * - ``V4L2_CODEC_VIDEO_H264_ENTROPY_MODE_CABAC``
       - Use CABAC entropy coding.
 
 
 
-``V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM (boolean)``
+``V4L2_CID_CODEC_VIDEO_H264_8X8_TRANSFORM (boolean)``
     Enable 8X8 transform for H264. Applicable to the H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION (boolean)``
+``V4L2_CID_CODEC_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION (boolean)``
     Enable constrained intra prediction for H264. Applicable to the H264
     encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_CHROMA_QP_INDEX_OFFSET (integer)``
     Specify the offset that should be added to the luma quantization
     parameter to determine the chroma quantization parameter. Applicable
     to the H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB (integer)``
+``V4L2_CID_CODEC_VIDEO_CYCLIC_INTRA_REFRESH_MB (integer)``
     Cyclic intra macroblock refresh. This is the number of continuous
     macroblocks refreshed every frame. Each frame a successive set of
     macroblocks is refreshed until the cycle completes and starts from
     the top of the frame. Applicable to H264, H263 and MPEG4 encoder.
 
-``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE (boolean)``
+``V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE (boolean)``
     Frame level rate control enable. If this control is disabled then
     the quantization parameter for each frame type is constant and set
     with appropriate controls (e.g.
-    ``V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP``). If frame rate control is
+    ``V4L2_CID_CODEC_VIDEO_H263_I_FRAME_QP``). If frame rate control is
     enabled then quantization parameter is adjusted to meet the chosen
     bitrate. Minimum and maximum value for the quantization parameter
     can be set with appropriate controls (e.g.
-    ``V4L2_CID_MPEG_VIDEO_H263_MIN_QP``). Applicable to encoders.
+    ``V4L2_CID_CODEC_VIDEO_H263_MIN_QP``). Applicable to encoders.
 
-``V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE (boolean)``
+``V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE (boolean)``
     Macroblock level rate control enable. Applicable to the MPEG4 and
     H264 encoders.
 
-``V4L2_CID_MPEG_VIDEO_MPEG4_QPEL (boolean)``
+``V4L2_CID_CODEC_VIDEO_MPEG4_QPEL (boolean)``
     Quarter pixel motion estimation for MPEG4. Applicable to the MPEG4
     encoder.
 
-``V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H263_I_FRAME_QP (integer)``
     Quantization parameter for an I frame for H263. Valid range: from 1
     to 31.
 
-``V4L2_CID_MPEG_VIDEO_H263_MIN_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H263_MIN_QP (integer)``
     Minimum quantization parameter for H263. Valid range: from 1 to 31.
 
-``V4L2_CID_MPEG_VIDEO_H263_MAX_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H263_MAX_QP (integer)``
     Maximum quantization parameter for H263. Valid range: from 1 to 31.
 
-``V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H263_P_FRAME_QP (integer)``
     Quantization parameter for an P frame for H263. Valid range: from 1
     to 31.
 
-``V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H263_B_FRAME_QP (integer)``
     Quantization parameter for an B frame for H263. Valid range: from 1
     to 31.
 
-``V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_I_FRAME_QP (integer)``
     Quantization parameter for an I frame for H264. Valid range: from 0
     to 51.
 
-``V4L2_CID_MPEG_VIDEO_H264_MIN_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_MIN_QP (integer)``
     Minimum quantization parameter for H264. Valid range: from 0 to 51.
 
-``V4L2_CID_MPEG_VIDEO_H264_MAX_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_MAX_QP (integer)``
     Maximum quantization parameter for H264. Valid range: from 0 to 51.
 
-``V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_P_FRAME_QP (integer)``
     Quantization parameter for an P frame for H264. Valid range: from 0
     to 51.
 
-``V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_B_FRAME_QP (integer)``
     Quantization parameter for an B frame for H264. Valid range: from 0
     to 51.
 
-``V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_I_FRAME_MIN_QP (integer)``
     Minimum quantization parameter for the H264 I frame to limit I frame
     quality to a range. Valid range: from 0 to 51. If
-    V4L2_CID_MPEG_VIDEO_H264_MIN_QP is also set, the quantization parameter
+    V4L2_CID_CODEC_VIDEO_H264_MIN_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_I_FRAME_MAX_QP (integer)``
     Maximum quantization parameter for the H264 I frame to limit I frame
     quality to a range. Valid range: from 0 to 51. If
-    V4L2_CID_MPEG_VIDEO_H264_MAX_QP is also set, the quantization parameter
+    V4L2_CID_CODEC_VIDEO_H264_MAX_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_P_FRAME_MIN_QP (integer)``
     Minimum quantization parameter for the H264 P frame to limit P frame
     quality to a range. Valid range: from 0 to 51. If
-    V4L2_CID_MPEG_VIDEO_H264_MIN_QP is also set, the quantization parameter
+    V4L2_CID_CODEC_VIDEO_H264_MIN_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_P_FRAME_MAX_QP (integer)``
     Maximum quantization parameter for the H264 P frame to limit P frame
     quality to a range. Valid range: from 0 to 51. If
-    V4L2_CID_MPEG_VIDEO_H264_MAX_QP is also set, the quantization parameter
+    V4L2_CID_CODEC_VIDEO_H264_MAX_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_B_FRAME_MIN_QP (integer)``
     Minimum quantization parameter for the H264 B frame to limit B frame
     quality to a range. Valid range: from 0 to 51. If
-    V4L2_CID_MPEG_VIDEO_H264_MIN_QP is also set, the quantization parameter
+    V4L2_CID_CODEC_VIDEO_H264_MIN_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_B_FRAME_MAX_QP (integer)``
     Maximum quantization parameter for the H264 B frame to limit B frame
     quality to a range. Valid range: from 0 to 51. If
-    V4L2_CID_MPEG_VIDEO_H264_MAX_QP is also set, the quantization parameter
+    V4L2_CID_CODEC_VIDEO_H264_MAX_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_MPEG4_I_FRAME_QP (integer)``
     Quantization parameter for an I frame for MPEG4. Valid range: from 1
     to 31.
 
-``V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_MPEG4_MIN_QP (integer)``
     Minimum quantization parameter for MPEG4. Valid range: from 1 to 31.
 
-``V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_MPEG4_MAX_QP (integer)``
     Maximum quantization parameter for MPEG4. Valid range: from 1 to 31.
 
-``V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_MPEG4_P_FRAME_QP (integer)``
     Quantization parameter for an P frame for MPEG4. Valid range: from 1
     to 31.
 
-``V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_MPEG4_B_FRAME_QP (integer)``
     Quantization parameter for an B frame for MPEG4. Valid range: from 1
     to 31.
 
 .. _v4l2-mpeg-video-vbv-size:
 
-``V4L2_CID_MPEG_VIDEO_VBV_SIZE (integer)``
+``V4L2_CID_CODEC_VIDEO_VBV_SIZE (integer)``
     The Video Buffer Verifier size in kilobytes, it is used as a
     limitation of frame skip. The VBV is defined in the standard as a
     mean to verify that the produced stream will be successfully
@@ -1245,12 +1245,12 @@ enum v4l2_mpeg_video_h264_entropy_mode -
 
 .. _v4l2-mpeg-video-vbv-delay:
 
-``V4L2_CID_MPEG_VIDEO_VBV_DELAY (integer)``
+``V4L2_CID_CODEC_VIDEO_VBV_DELAY (integer)``
     Sets the initial delay in milliseconds for VBV buffer control.
 
 .. _v4l2-mpeg-video-hor-search-range:
 
-``V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE (integer)``
+``V4L2_CID_CODEC_VIDEO_MV_H_SEARCH_RANGE (integer)``
     Horizontal search range defines maximum horizontal search area in
     pixels to search and match for the present Macroblock (MB) in the
     reference picture. This V4L2 control macro is used to set horizontal
@@ -1258,7 +1258,7 @@ enum v4l2_mpeg_video_h264_entropy_mode -
 
 .. _v4l2-mpeg-video-vert-search-range:
 
-``V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE (integer)``
+``V4L2_CID_CODEC_VIDEO_MV_V_SEARCH_RANGE (integer)``
     Vertical search range defines maximum vertical search area in pixels
     to search and match for the present Macroblock (MB) in the reference
     picture. This V4L2 control macro is used to set vertical search
@@ -1266,19 +1266,19 @@ enum v4l2_mpeg_video_h264_entropy_mode -
 
 .. _v4l2-mpeg-video-force-key-frame:
 
-``V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME (button)``
+``V4L2_CID_CODEC_VIDEO_FORCE_KEY_FRAME (button)``
     Force a key frame for the next queued buffer. Applicable to
     encoders. This is a general, codec-agnostic keyframe control.
 
 .. _v4l2-mpeg-video-h264-cpb-size:
 
-``V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_CPB_SIZE (integer)``
     The Coded Picture Buffer size in kilobytes, it is used as a
     limitation of frame skip. The CPB is defined in the H264 standard as
     a mean to verify that the produced stream will be successfully
     decoded. Applicable to the H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_I_PERIOD (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_I_PERIOD (integer)``
     Period between I-frames in the open GOP for H264. In case of an open
     GOP this is the period between two I-frames. The period between IDR
     (Instantaneous Decoding Refresh) frames is taken from the GOP_SIZE
@@ -1290,10 +1290,10 @@ enum v4l2_mpeg_video_h264_entropy_mode -
 
 .. _v4l2-mpeg-video-header-mode:
 
-``V4L2_CID_MPEG_VIDEO_HEADER_MODE``
+``V4L2_CID_CODEC_VIDEO_HEADER_MODE``
     (enum)
 
-enum v4l2_mpeg_video_header_mode -
+enum v4l2_codec_video_header_mode -
     Determines whether the header is returned as the first buffer or is
     it returned together with the first frame. Applicable to encoders.
     Possible values are:
@@ -1308,9 +1308,9 @@ enum v4l2_mpeg_video_header_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE``
+    * - ``V4L2_CODEC_VIDEO_HEADER_MODE_SEPARATE``
       - The stream header is returned separately in the first buffer.
-    * - ``V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME``
+    * - ``V4L2_CODEC_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME``
       - The stream header is returned together with the first encoded
 	frame.
 
@@ -1319,39 +1319,39 @@ enum v4l2_mpeg_video_header_mode -
     \normalsize
 
 
-``V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER (boolean)``
+``V4L2_CID_CODEC_VIDEO_REPEAT_SEQ_HEADER (boolean)``
     Repeat the video sequence headers. Repeating these headers makes
     random access to the video stream easier. Applicable to the MPEG1, 2
     and 4 encoder.
 
-``V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER (boolean)``
+``V4L2_CID_CODEC_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER (boolean)``
     Enabled the deblocking post processing filter for MPEG4 decoder.
     Applicable to the MPEG4 decoder.
 
-``V4L2_CID_MPEG_VIDEO_MPEG4_VOP_TIME_RES (integer)``
+``V4L2_CID_CODEC_VIDEO_MPEG4_VOP_TIME_RES (integer)``
     vop_time_increment_resolution value for MPEG4. Applicable to the
     MPEG4 encoder.
 
-``V4L2_CID_MPEG_VIDEO_MPEG4_VOP_TIME_INC (integer)``
+``V4L2_CID_CODEC_VIDEO_MPEG4_VOP_TIME_INC (integer)``
     vop_time_increment value for MPEG4. Applicable to the MPEG4
     encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING (boolean)``
+``V4L2_CID_CODEC_VIDEO_H264_SEI_FRAME_PACKING (boolean)``
     Enable generation of frame packing supplemental enhancement
     information in the encoded bitstream. The frame packing SEI message
     contains the arrangement of L and R planes for 3D viewing.
     Applicable to the H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_SEI_FP_CURRENT_FRAME_0 (boolean)``
+``V4L2_CID_CODEC_VIDEO_H264_SEI_FP_CURRENT_FRAME_0 (boolean)``
     Sets current frame as frame0 in frame packing SEI. Applicable to the
     H264 encoder.
 
 .. _v4l2-mpeg-video-h264-sei-fp-arrangement-type:
 
-``V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE``
+``V4L2_CID_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE``
     (enum)
 
-enum v4l2_mpeg_video_h264_sei_fp_arrangement_type -
+enum v4l2_codec_video_h264_sei_fp_arrangement_type -
     Frame packing arrangement type for H264 SEI. Applicable to the H264
     encoder. Possible values are:
 
@@ -1365,17 +1365,17 @@ enum v4l2_mpeg_video_h264_sei_fp_arrangement_type -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_CHEKERBOARD``
+    * - ``V4L2_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_CHEKERBOARD``
       - Pixels are alternatively from L and R.
-    * - ``V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_COLUMN``
+    * - ``V4L2_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_COLUMN``
       - L and R are interlaced by column.
-    * - ``V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_ROW``
+    * - ``V4L2_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_ROW``
       - L and R are interlaced by row.
-    * - ``V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_SIDE_BY_SIDE``
+    * - ``V4L2_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_SIDE_BY_SIDE``
       - L is on the left, R on the right.
-    * - ``V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_TOP_BOTTOM``
+    * - ``V4L2_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_TOP_BOTTOM``
       - L is on top, R on bottom.
-    * - ``V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_TEMPORAL``
+    * - ``V4L2_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_TEMPORAL``
       - One view per frame.
 
 .. raw:: latex
@@ -1384,17 +1384,17 @@ enum v4l2_mpeg_video_h264_sei_fp_arrangement_type -
 
 
 
-``V4L2_CID_MPEG_VIDEO_H264_FMO (boolean)``
+``V4L2_CID_CODEC_VIDEO_H264_FMO (boolean)``
     Enables flexible macroblock ordering in the encoded bitstream. It is
     a technique used for restructuring the ordering of macroblocks in
     pictures. Applicable to the H264 encoder.
 
 .. _v4l2-mpeg-video-h264-fmo-map-type:
 
-``V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE``
+``V4L2_CID_CODEC_VIDEO_H264_FMO_MAP_TYPE``
    (enum)
 
-enum v4l2_mpeg_video_h264_fmo_map_type -
+enum v4l2_codec_video_h264_fmo_map_type -
     When using FMO, the map type divides the image in different scan
     patterns of macroblocks. Applicable to the H264 encoder. Possible
     values are:
@@ -1409,21 +1409,21 @@ enum v4l2_mpeg_video_h264_fmo_map_type -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_INTERLEAVED_SLICES``
+    * - ``V4L2_CODEC_VIDEO_H264_FMO_MAP_TYPE_INTERLEAVED_SLICES``
       - Slices are interleaved one after other with macroblocks in run
 	length order.
-    * - ``V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_SCATTERED_SLICES``
+    * - ``V4L2_CODEC_VIDEO_H264_FMO_MAP_TYPE_SCATTERED_SLICES``
       - Scatters the macroblocks based on a mathematical function known to
 	both encoder and decoder.
-    * - ``V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_FOREGROUND_WITH_LEFT_OVER``
+    * - ``V4L2_CODEC_VIDEO_H264_FMO_MAP_TYPE_FOREGROUND_WITH_LEFT_OVER``
       - Macroblocks arranged in rectangular areas or regions of interest.
-    * - ``V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_BOX_OUT``
+    * - ``V4L2_CODEC_VIDEO_H264_FMO_MAP_TYPE_BOX_OUT``
       - Slice groups grow in a cyclic way from centre to outwards.
-    * - ``V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_RASTER_SCAN``
+    * - ``V4L2_CODEC_VIDEO_H264_FMO_MAP_TYPE_RASTER_SCAN``
       - Slice groups grow in raster scan pattern from left to right.
-    * - ``V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_WIPE_SCAN``
+    * - ``V4L2_CODEC_VIDEO_H264_FMO_MAP_TYPE_WIPE_SCAN``
       - Slice groups grow in wipe scan pattern from top to bottom.
-    * - ``V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_EXPLICIT``
+    * - ``V4L2_CODEC_VIDEO_H264_FMO_MAP_TYPE_EXPLICIT``
       - User defined map type.
 
 .. raw:: latex
@@ -1432,15 +1432,15 @@ enum v4l2_mpeg_video_h264_fmo_map_type -
 
 
 
-``V4L2_CID_MPEG_VIDEO_H264_FMO_SLICE_GROUP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_FMO_SLICE_GROUP (integer)``
     Number of slice groups in FMO. Applicable to the H264 encoder.
 
 .. _v4l2-mpeg-video-h264-fmo-change-direction:
 
-``V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_DIRECTION``
+``V4L2_CID_CODEC_VIDEO_H264_FMO_CHANGE_DIRECTION``
     (enum)
 
-enum v4l2_mpeg_video_h264_fmo_change_dir -
+enum v4l2_codec_video_h264_fmo_change_dir -
     Specifies a direction of the slice group change for raster and wipe
     maps. Applicable to the H264 encoder. Possible values are:
 
@@ -1450,26 +1450,26 @@ enum v4l2_mpeg_video_h264_fmo_change_dir -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_H264_FMO_CHANGE_DIR_RIGHT``
+    * - ``V4L2_CODEC_VIDEO_H264_FMO_CHANGE_DIR_RIGHT``
       - Raster scan or wipe right.
-    * - ``V4L2_MPEG_VIDEO_H264_FMO_CHANGE_DIR_LEFT``
+    * - ``V4L2_CODEC_VIDEO_H264_FMO_CHANGE_DIR_LEFT``
       - Reverse raster scan or wipe left.
 
 
 
-``V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_RATE (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_FMO_CHANGE_RATE (integer)``
     Specifies the size of the first slice group for raster and wipe map.
     Applicable to the H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_FMO_RUN_LENGTH (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_FMO_RUN_LENGTH (integer)``
     Specifies the number of consecutive macroblocks for the interleaved
     map. Applicable to the H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_ASO (boolean)``
+``V4L2_CID_CODEC_VIDEO_H264_ASO (boolean)``
     Enables arbitrary slice ordering in encoded bitstream. Applicable to
     the H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_ASO_SLICE_ORDER (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_ASO_SLICE_ORDER (integer)``
     Specifies the slice order in ASO. Applicable to the H264 encoder.
     The supplied 32-bit integer is interpreted as follows (bit 0 = least
     significant bit):
@@ -1487,15 +1487,15 @@ enum v4l2_mpeg_video_h264_fmo_change_dir -
 
 
 
-``V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING (boolean)``
+``V4L2_CID_CODEC_VIDEO_H264_HIERARCHICAL_CODING (boolean)``
     Enables H264 hierarchical coding. Applicable to the H264 encoder.
 
 .. _v4l2-mpeg-video-h264-hierarchical-coding-type:
 
-``V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE``
+``V4L2_CID_CODEC_VIDEO_H264_HIERARCHICAL_CODING_TYPE``
     (enum)
 
-enum v4l2_mpeg_video_h264_hierarchical_coding_type -
+enum v4l2_codec_video_h264_hierarchical_coding_type -
     Specifies the hierarchical coding type. Applicable to the H264
     encoder. Possible values are:
 
@@ -1505,18 +1505,18 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B``
+    * - ``V4L2_CODEC_VIDEO_H264_HIERARCHICAL_CODING_B``
       - Hierarchical B coding.
-    * - ``V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P``
+    * - ``V4L2_CODEC_VIDEO_H264_HIERARCHICAL_CODING_P``
       - Hierarchical P coding.
 
 
 
-``V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_HIERARCHICAL_CODING_LAYER (integer)``
     Specifies the number of hierarchical coding layers. Applicable to
     the H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP (integer)``
     Specifies a user defined QP for each layer. Applicable to the H264
     encoder. The supplied 32-bit integer is interpreted as follows (bit
     0 = least significant bit):
@@ -1532,30 +1532,30 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - Bit 16:32
       - Layer number
 
-``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L0_BR (integer)``
     Indicates bit rate (bps) for hierarchical coding layer 0 for H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L1_BR (integer)``
     Indicates bit rate (bps) for hierarchical coding layer 1 for H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L2_BR (integer)``
     Indicates bit rate (bps) for hierarchical coding layer 2 for H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L3_BR (integer)``
     Indicates bit rate (bps) for hierarchical coding layer 3 for H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L4_BR (integer)``
     Indicates bit rate (bps) for hierarchical coding layer 4 for H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L5_BR (integer)``
     Indicates bit rate (bps) for hierarchical coding layer 5 for H264 encoder.
 
-``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L6_BR (integer)``
     Indicates bit rate (bps) for hierarchical coding layer 6 for H264 encoder.
 
 .. _v4l2-mpeg-mpeg2:
 
-``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
+``V4L2_CID_CODEC_VIDEO_MPEG2_SLICE_PARAMS (struct)``
     Specifies the slice parameters (as extracted from the bitstream) for the
     associated MPEG-2 slice data. This includes the necessary parameters for
     configuring a stateless hardware decoding pipeline for MPEG-2.
@@ -1702,7 +1702,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION (struct)``
+``V4L2_CID_CODEC_VIDEO_MPEG2_QUANTIZATION (struct)``
     Specifies quantization matrices (as extracted from the bitstream) for the
     associated MPEG-2 slice data.
 
@@ -1780,7 +1780,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 .. _v4l2-mpeg-vp8:
 
-``V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER (struct)``
+``V4L2_CID_CODEC_VIDEO_VP8_FRAME_HEADER (struct)``
     Specifies the frame parameters for the associated VP8 parsed frame data.
     This includes the necessary parameters for
     configuring a stateless hardware decoding pipeline for VP8.
@@ -2135,30 +2135,30 @@ in the S5P family of SoCs by Samsung.
 MFC 5.1 Control IDs
 -------------------
 
-``V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE (boolean)``
+``V4L2_CID_CODEC_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE (boolean)``
     If the display delay is enabled then the decoder is forced to return
     a CAPTURE buffer (decoded frame) after processing a certain number
     of OUTPUT buffers. The delay can be set through
-    ``V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY``. This
+    ``V4L2_CID_CODEC_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY``. This
     feature can be used for example for generating thumbnails of videos.
     Applicable to the H264 decoder.
 
-``V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY (integer)``
+``V4L2_CID_CODEC_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY (integer)``
     Display delay value for H264 decoder. The decoder is forced to
     return a decoded frame after the set 'display delay' number of
     frames. If this number is low it may result in frames returned out
     of display order, in addition the hardware may still be using the
     returned buffer as a reference picture for subsequent frames.
 
-``V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P (integer)``
+``V4L2_CID_CODEC_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P (integer)``
     The number of reference pictures used for encoding a P picture.
     Applicable to the H264 encoder.
 
-``V4L2_CID_MPEG_MFC51_VIDEO_PADDING (boolean)``
+``V4L2_CID_CODEC_MFC51_VIDEO_PADDING (boolean)``
     Padding enable in the encoder - use a color instead of repeating
     border pixels. Applicable to encoders.
 
-``V4L2_CID_MPEG_MFC51_VIDEO_PADDING_YUV (integer)``
+``V4L2_CID_CODEC_MFC51_VIDEO_PADDING_YUV (integer)``
     Padding color in the encoder. Applicable to encoders. The supplied
     32-bit integer is interpreted as follows (bit 0 = least significant
     bit):
@@ -2180,7 +2180,7 @@ MFC 5.1 Control IDs
 
 
 
-``V4L2_CID_MPEG_MFC51_VIDEO_RC_REACTION_COEFF (integer)``
+``V4L2_CID_CODEC_MFC51_VIDEO_RC_REACTION_COEFF (integer)``
     Reaction coefficient for MFC rate control. Applicable to encoders.
 
     .. note::
@@ -2193,41 +2193,41 @@ MFC 5.1 Control IDs
        #. It is not recommended to use the greater number than
 	  FRAME_RATE * (10^9 / BIT_RATE).
 
-``V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK (boolean)``
+``V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK (boolean)``
     Adaptive rate control for dark region. Valid only when H.264 and
     macroblock level RC is enabled
-    (``V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE``). Applicable to the H264
+    (``V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE``). Applicable to the H264
     encoder.
 
-``V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH (boolean)``
+``V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH (boolean)``
     Adaptive rate control for smooth region. Valid only when H.264 and
     macroblock level RC is enabled
-    (``V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE``). Applicable to the H264
+    (``V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE``). Applicable to the H264
     encoder.
 
-``V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC (boolean)``
+``V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC (boolean)``
     Adaptive rate control for static region. Valid only when H.264 and
     macroblock level RC is enabled
-    (``V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE``). Applicable to the H264
+    (``V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE``). Applicable to the H264
     encoder.
 
-``V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY (boolean)``
+``V4L2_CID_CODEC_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY (boolean)``
     Adaptive rate control for activity region. Valid only when H.264 and
     macroblock level RC is enabled
-    (``V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE``). Applicable to the H264
+    (``V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE``). Applicable to the H264
     encoder.
 
 .. _v4l2-mpeg-mfc51-video-frame-skip-mode:
 
-``V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE``
+``V4L2_CID_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE``
     (enum)
 
     .. note::
 
        This control is deprecated. Use the standard
-       ``V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE`` control instead.
+       ``V4L2_CID_CODEC_VIDEO_FRAME_SKIP_MODE`` control instead.
 
-enum v4l2_mpeg_mfc51_video_frame_skip_mode -
+enum v4l2_codec_mfc51_video_frame_skip_mode -
     Indicates in what conditions the encoder should skip frames. If
     encoding a frame would cause the encoded stream to be larger then a
     chosen data limit then the frame will be skipped. Possible values
@@ -2244,12 +2244,12 @@ enum v4l2_mpeg_mfc51_video_frame_skip_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED``
+    * - ``V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED``
       - Frame skip mode is disabled.
-    * - ``V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT``
+    * - ``V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT``
       - Frame skip mode enabled and buffer limit is set by the chosen
 	level and is defined by the standard.
-    * - ``V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT``
+    * - ``V4L2_CODEC_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT``
       - Frame skip mode enabled and buffer limit is set by the VBV
 	(MPEG1/2/4) or CPB (H264) buffer size control.
 
@@ -2257,7 +2257,7 @@ enum v4l2_mpeg_mfc51_video_frame_skip_mode -
 
     \normalsize
 
-``V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT (integer)``
+``V4L2_CID_CODEC_MFC51_VIDEO_RC_FIXED_TARGET_BIT (integer)``
     Enable rate-control with fixed target bit. If this setting is
     enabled, then the rate control logic of the encoder will calculate
     the average bitrate for a GOP and keep it below or equal the set
@@ -2271,10 +2271,10 @@ enum v4l2_mpeg_mfc51_video_frame_skip_mode -
 
 .. _v4l2-mpeg-mfc51-video-force-frame-type:
 
-``V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE``
+``V4L2_CID_CODEC_MFC51_VIDEO_FORCE_FRAME_TYPE``
     (enum)
 
-enum v4l2_mpeg_mfc51_video_force_frame_type -
+enum v4l2_codec_mfc51_video_force_frame_type -
     Force a frame type for the next queued buffer. Applicable to
     encoders. Possible values are:
 
@@ -2284,11 +2284,11 @@ enum v4l2_mpeg_mfc51_video_force_frame_type -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_MFC51_FORCE_FRAME_TYPE_DISABLED``
+    * - ``V4L2_CODEC_MFC51_VIDEO_FORCE_FRAME_TYPE_DISABLED``
       - Forcing a specific frame type disabled.
-    * - ``V4L2_MPEG_MFC51_FORCE_FRAME_TYPE_I_FRAME``
+    * - ``V4L2_CODEC_MFC51_VIDEO_FORCE_FRAME_TYPE_I_FRAME``
       - Force an I-frame.
-    * - ``V4L2_MPEG_MFC51_FORCE_FRAME_TYPE_NOT_CODED``
+    * - ``V4L2_CODEC_MFC51_VIDEO_FORCE_FRAME_TYPE_NOT_CODED``
       - Force a non-coded frame.
 
 
@@ -2306,10 +2306,10 @@ CX2341x Control IDs
 
 .. _v4l2-mpeg-cx2341x-video-spatial-filter-mode:
 
-``V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE``
+``V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE``
     (enum)
 
-enum v4l2_mpeg_cx2341x_video_spatial_filter_mode -
+enum v4l2_codec_cx2341x_video_spatial_filter_mode -
     Sets the Spatial Filter mode (default ``MANUAL``). Possible values
     are:
 
@@ -2320,23 +2320,23 @@ enum v4l2_mpeg_cx2341x_video_spatial_filter_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL``
       - Choose the filter manually
-    * - ``V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO``
       - Choose the filter automatically
 
 
 
-``V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER (integer (0-15))``
+``V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER (integer (0-15))``
     The setting for the Spatial Filter. 0 = off, 15 = maximum. (Default
     is 0.)
 
 .. _luma-spatial-filter-type:
 
-``V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE``
+``V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE``
     (enum)
 
-enum v4l2_mpeg_cx2341x_video_luma_spatial_filter_type -
+enum v4l2_codec_cx2341x_video_luma_spatial_filter_type -
     Select the algorithm to use for the Luma Spatial Filter (default
     ``1D_HOR``). Possible values:
 
@@ -2350,15 +2350,15 @@ enum v4l2_mpeg_cx2341x_video_luma_spatial_filter_type -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_OFF``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_OFF``
       - No filter
-    * - ``V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_HOR``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_HOR``
       - One-dimensional horizontal
-    * - ``V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_VERT``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_VERT``
       - One-dimensional vertical
-    * - ``V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_HV_SEPARABLE``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_HV_SEPARABLE``
       - Two-dimensional separable
-    * - ``V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_SYM_NON_SEPARABLE``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_SYM_NON_SEPARABLE``
       - Two-dimensional symmetrical non-separable
 
 .. raw:: latex
@@ -2367,10 +2367,10 @@ enum v4l2_mpeg_cx2341x_video_luma_spatial_filter_type -
 
 .. _chroma-spatial-filter-type:
 
-``V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE``
+``V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE``
     (enum)
 
-enum v4l2_mpeg_cx2341x_video_chroma_spatial_filter_type -
+enum v4l2_codec_cx2341x_video_chroma_spatial_filter_type -
     Select the algorithm for the Chroma Spatial Filter (default
     ``1D_HOR``). Possible values are:
 
@@ -2384,9 +2384,9 @@ enum v4l2_mpeg_cx2341x_video_chroma_spatial_filter_type -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_OFF``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_OFF``
       - No filter
-    * - ``V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR``
       - One-dimensional horizontal
 
 .. raw:: latex
@@ -2395,10 +2395,10 @@ enum v4l2_mpeg_cx2341x_video_chroma_spatial_filter_type -
 
 .. _v4l2-mpeg-cx2341x-video-temporal-filter-mode:
 
-``V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE``
+``V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE``
     (enum)
 
-enum v4l2_mpeg_cx2341x_video_temporal_filter_mode -
+enum v4l2_codec_cx2341x_video_temporal_filter_mode -
     Sets the Temporal Filter mode (default ``MANUAL``). Possible values
     are:
 
@@ -2410,25 +2410,25 @@ enum v4l2_mpeg_cx2341x_video_temporal_filter_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL``
       - Choose the filter manually
-    * - ``V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO``
       - Choose the filter automatically
 
 .. raw:: latex
 
     \normalsize
 
-``V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER (integer (0-31))``
+``V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER (integer (0-31))``
     The setting for the Temporal Filter. 0 = off, 31 = maximum. (Default
     is 8 for full-scale capturing and 0 for scaled capturing.)
 
 .. _v4l2-mpeg-cx2341x-video-median-filter-type:
 
-``V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE``
+``V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE``
     (enum)
 
-enum v4l2_mpeg_cx2341x_video_median_filter_type -
+enum v4l2_codec_cx2341x_video_median_filter_type -
     Median Filter Type (default ``OFF``). Possible values are:
 
 
@@ -2442,38 +2442,38 @@ enum v4l2_mpeg_cx2341x_video_median_filter_type -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF``
       - No filter
-    * - ``V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_HOR``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_HOR``
       - Horizontal filter
-    * - ``V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_VERT``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_VERT``
       - Vertical filter
-    * - ``V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_HOR_VERT``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_HOR_VERT``
       - Horizontal and vertical filter
-    * - ``V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_DIAG``
+    * - ``V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_DIAG``
       - Diagonal filter
 
 .. raw:: latex
 
     \normalsize
 
-``V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM (integer (0-255))``
+``V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM (integer (0-255))``
     Threshold above which the luminance median filter is enabled
     (default 0)
 
-``V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP (integer (0-255))``
+``V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP (integer (0-255))``
     Threshold below which the luminance median filter is enabled
     (default 255)
 
-``V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM (integer (0-255))``
+``V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM (integer (0-255))``
     Threshold above which the chroma median filter is enabled (default
     0)
 
-``V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP (integer (0-255))``
+``V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP (integer (0-255))``
     Threshold below which the chroma median filter is enabled (default
     255)
 
-``V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS (boolean)``
+``V4L2_CID_CODEC_CX2341X_STREAM_INSERT_NAV_PACKETS (boolean)``
     The CX2341X MPEG encoder can insert one empty MPEG-2 PES packet into
     the stream between every four video frames. The packet size is 2048
     bytes, including the packet_start_code_prefix and stream_id
@@ -2496,7 +2496,7 @@ VPX Control IDs
 
 .. _v4l2-vpx-num-partitions:
 
-``V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS``
+``V4L2_CID_CODEC_VIDEO_VPX_NUM_PARTITIONS``
     (enum)
 
 enum v4l2_vp8_num_partitions -
@@ -2509,23 +2509,23 @@ enum v4l2_vp8_num_partitions -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_CID_MPEG_VIDEO_VPX_1_PARTITION``
+    * - ``V4L2_CID_CODEC_VIDEO_VPX_1_PARTITION``
       - 1 coefficient partition
-    * - ``V4L2_CID_MPEG_VIDEO_VPX_2_PARTITIONS``
+    * - ``V4L2_CID_CODEC_VIDEO_VPX_2_PARTITIONS``
       - 2 coefficient partitions
-    * - ``V4L2_CID_MPEG_VIDEO_VPX_4_PARTITIONS``
+    * - ``V4L2_CID_CODEC_VIDEO_VPX_4_PARTITIONS``
       - 4 coefficient partitions
-    * - ``V4L2_CID_MPEG_VIDEO_VPX_8_PARTITIONS``
+    * - ``V4L2_CID_CODEC_VIDEO_VPX_8_PARTITIONS``
       - 8 coefficient partitions
 
 
 
-``V4L2_CID_MPEG_VIDEO_VPX_IMD_DISABLE_4X4 (boolean)``
+``V4L2_CID_CODEC_VIDEO_VPX_IMD_DISABLE_4X4 (boolean)``
     Setting this prevents intra 4x4 mode in the intra mode decision.
 
 .. _v4l2-vpx-num-ref-frames:
 
-``V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES``
+``V4L2_CID_CODEC_VIDEO_VPX_NUM_REF_FRAMES``
     (enum)
 
 enum v4l2_vp8_num_ref_frames -
@@ -2542,13 +2542,13 @@ enum v4l2_vp8_num_ref_frames -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_CID_MPEG_VIDEO_VPX_1_REF_FRAME``
+    * - ``V4L2_CID_CODEC_VIDEO_VPX_1_REF_FRAME``
       - Last encoded frame will be searched
-    * - ``V4L2_CID_MPEG_VIDEO_VPX_2_REF_FRAME``
+    * - ``V4L2_CID_CODEC_VIDEO_VPX_2_REF_FRAME``
       - Two frames will be searched among the last encoded frame, the
 	golden frame and the alternate reference (altref) frame. The
 	encoder implementation will decide which two are chosen.
-    * - ``V4L2_CID_MPEG_VIDEO_VPX_3_REF_FRAME``
+    * - ``V4L2_CID_CODEC_VIDEO_VPX_3_REF_FRAME``
       - The last encoded frame, the golden frame and the altref frame will
 	be searched.
 
@@ -2558,16 +2558,16 @@ enum v4l2_vp8_num_ref_frames -
 
 
 
-``V4L2_CID_MPEG_VIDEO_VPX_FILTER_LEVEL (integer)``
+``V4L2_CID_CODEC_VIDEO_VPX_FILTER_LEVEL (integer)``
     Indicates the loop filter level. The adjustment of the loop filter
     level is done via a delta value against a baseline loop filter
     value.
 
-``V4L2_CID_MPEG_VIDEO_VPX_FILTER_SHARPNESS (integer)``
+``V4L2_CID_CODEC_VIDEO_VPX_FILTER_SHARPNESS (integer)``
     This parameter affects the loop filter. Anything above zero weakens
     the deblocking effect on the loop filter.
 
-``V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD (integer)``
+``V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD (integer)``
     Sets the refresh period for the golden frame. The period is defined
     in number of frames. For a value of 'n', every nth frame starting
     from the first key frame will be taken as a golden frame. For eg.
@@ -2577,7 +2577,7 @@ enum v4l2_vp8_num_ref_frames -
 
 .. _v4l2-vpx-golden-frame-sel:
 
-``V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL``
+``V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_SEL``
     (enum)
 
 enum v4l2_vp8_golden_frame_sel -
@@ -2593,12 +2593,12 @@ enum v4l2_vp8_golden_frame_sel -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_USE_PREV``
+    * - ``V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_USE_PREV``
       - Use the (n-2)th frame as a golden frame, current frame index being
 	'n'.
-    * - ``V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_USE_REF_PERIOD``
+    * - ``V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_USE_REF_PERIOD``
       - Use the previous specific frame indicated by
-	``V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD`` as a
+	``V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD`` as a
 	golden frame.
 
 .. raw:: latex
@@ -2606,24 +2606,24 @@ enum v4l2_vp8_golden_frame_sel -
     \normalsize
 
 
-``V4L2_CID_MPEG_VIDEO_VPX_MIN_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_VPX_MIN_QP (integer)``
     Minimum quantization parameter for VP8.
 
-``V4L2_CID_MPEG_VIDEO_VPX_MAX_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_VPX_MAX_QP (integer)``
     Maximum quantization parameter for VP8.
 
-``V4L2_CID_MPEG_VIDEO_VPX_I_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_VPX_I_FRAME_QP (integer)``
     Quantization parameter for an I frame for VP8.
 
-``V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_VPX_P_FRAME_QP (integer)``
     Quantization parameter for a P frame for VP8.
 
 .. _v4l2-mpeg-video-vp8-profile:
 
-``V4L2_CID_MPEG_VIDEO_VP8_PROFILE``
+``V4L2_CID_CODEC_VIDEO_VP8_PROFILE``
     (enum)
 
-enum v4l2_mpeg_video_vp8_profile -
+enum v4l2_codec_video_vp8_profile -
     This control allows selecting the profile for VP8 encoder.
     This is also used to enumerate supported profiles by VP8 encoder or decoder.
     Possible values are:
@@ -2632,21 +2632,21 @@ enum v4l2_mpeg_video_vp8_profile -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_VP8_PROFILE_0``
+    * - ``V4L2_CODEC_VIDEO_VP8_PROFILE_0``
       - Profile 0
-    * - ``V4L2_MPEG_VIDEO_VP8_PROFILE_1``
+    * - ``V4L2_CODEC_VIDEO_VP8_PROFILE_1``
       - Profile 1
-    * - ``V4L2_MPEG_VIDEO_VP8_PROFILE_2``
+    * - ``V4L2_CODEC_VIDEO_VP8_PROFILE_2``
       - Profile 2
-    * - ``V4L2_MPEG_VIDEO_VP8_PROFILE_3``
+    * - ``V4L2_CODEC_VIDEO_VP8_PROFILE_3``
       - Profile 3
 
 .. _v4l2-mpeg-video-vp9-profile:
 
-``V4L2_CID_MPEG_VIDEO_VP9_PROFILE``
+``V4L2_CID_CODEC_VIDEO_VP9_PROFILE``
     (enum)
 
-enum v4l2_mpeg_video_vp9_profile -
+enum v4l2_codec_video_vp9_profile -
     This control allows selecting the profile for VP9 encoder.
     This is also used to enumerate supported profiles by VP9 encoder or decoder.
     Possible values are:
@@ -2655,20 +2655,20 @@ enum v4l2_mpeg_video_vp9_profile -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_VP9_PROFILE_0``
+    * - ``V4L2_CODEC_VIDEO_VP9_PROFILE_0``
       - Profile 0
-    * - ``V4L2_MPEG_VIDEO_VP9_PROFILE_1``
+    * - ``V4L2_CODEC_VIDEO_VP9_PROFILE_1``
       - Profile 1
-    * - ``V4L2_MPEG_VIDEO_VP9_PROFILE_2``
+    * - ``V4L2_CODEC_VIDEO_VP9_PROFILE_2``
       - Profile 2
-    * - ``V4L2_MPEG_VIDEO_VP9_PROFILE_3``
+    * - ``V4L2_CODEC_VIDEO_VP9_PROFILE_3``
       - Profile 3
 
 .. _v4l2-mpeg-video-vp9-level:
 
-``V4L2_CID_MPEG_VIDEO_VP9_LEVEL (enum)``
+``V4L2_CID_CODEC_VIDEO_VP9_LEVEL (enum)``
 
-enum v4l2_mpeg_video_vp9_level -
+enum v4l2_codec_video_vp9_level -
     This control allows selecting the level for VP9 encoder.
     This is also used to enumerate supported levels by VP9 encoder or decoder.
     More information can be found at
@@ -2678,33 +2678,33 @@ enum v4l2_mpeg_video_vp9_level -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_1_0``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_1_0``
       - Level 1
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_1_1``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_1_1``
       - Level 1.1
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_2_0``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_2_0``
       - Level 2
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_2_1``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_2_1``
       - Level 2.1
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_3_0``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_3_0``
       - Level 3
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_3_1``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_3_1``
       - Level 3.1
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_4_0``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_4_0``
       - Level 4
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_4_1``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_4_1``
       - Level 4.1
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_0``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_5_0``
       - Level 5
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_1``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_5_1``
       - Level 5.1
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_2``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_5_2``
       - Level 5.2
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_0``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_6_0``
       - Level 6
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_1``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_6_1``
       - Level 6.1
-    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_2``
+    * - ``V4L2_CODEC_VIDEO_VP9_LEVEL_6_2``
       - Level 6.2
 
 
@@ -2720,66 +2720,66 @@ video codec.
 HEVC/H.265 Control IDs
 ----------------------
 
-``V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP (integer)``
     Minimum quantization parameter for HEVC.
     Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP (integer)``
     Maximum quantization parameter for HEVC.
     Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_QP (integer)``
     Quantization parameter for an I frame for HEVC.
-    Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
-    V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
+    Valid range: [V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
+    V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP].
 
-``V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_QP (integer)``
     Quantization parameter for a P frame for HEVC.
-    Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
-    V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
+    Valid range: [V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
+    V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP].
 
-``V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_QP (integer)``
     Quantization parameter for a B frame for HEVC.
-    Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
-    V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
+    Valid range: [V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
+    V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP].
 
-``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_MIN_QP (integer)``
     Minimum quantization parameter for the HEVC I frame to limit I frame
     quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
-    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
+    If V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_MAX_QP (integer)``
     Maximum quantization parameter for the HEVC I frame to limit I frame
     quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
-    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
+    If V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_MIN_QP (integer)``
     Minimum quantization parameter for the HEVC P frame to limit P frame
     quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
-    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
+    If V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_MAX_QP (integer)``
     Maximum quantization parameter for the HEVC P frame to limit P frame
     quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
-    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
+    If V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_MIN_QP (integer)``
     Minimum quantization parameter for the HEVC B frame to limit B frame
     quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
-    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
+    If V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_MAX_QP (integer)``
     Maximum quantization parameter for the HEVC B frame to limit B frame
     quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
-    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
+    If V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP (boolean)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_QP (boolean)``
     HIERARCHICAL_QP allows the host to specify the quantization parameter
     values for each temporal layer through HIERARCHICAL_QP_LAYER. This is
     valid only if HIERARCHICAL_CODING_LAYER is greater than 1. Setting the
@@ -2787,10 +2787,10 @@ HEVC/H.265 Control IDs
 
 .. _v4l2-hevc-hier-coding-type:
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_TYPE``
     (enum)
 
-enum v4l2_mpeg_video_hevc_hier_coding_type -
+enum v4l2_codec_video_hevc_hier_coding_type -
     Selects the hierarchical coding type for encoding. Possible values are:
 
 .. raw:: latex
@@ -2803,9 +2803,9 @@ enum v4l2_mpeg_video_hevc_hier_coding_type -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B``
+    * - ``V4L2_CODEC_VIDEO_HEVC_HIERARCHICAL_CODING_B``
       - Use the B frame for hierarchical coding.
-    * - ``V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P``
+    * - ``V4L2_CODEC_VIDEO_HEVC_HIERARCHICAL_CODING_P``
       - Use the P frame for hierarchical coding.
 
 .. raw:: latex
@@ -2813,53 +2813,53 @@ enum v4l2_mpeg_video_hevc_hier_coding_type -
     \normalsize
 
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_LAYER (integer)``
     Selects the hierarchical coding layer. In normal encoding
     (non-hierarchial coding), it should be zero. Possible values are [0, 6].
     0 indicates HIERARCHICAL CODING LAYER 0, 1 indicates HIERARCHICAL CODING
     LAYER 1 and so on.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L0_QP (integer)``
     Indicates quantization parameter for hierarchical coding layer 0.
-    Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
-    V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
+    Valid range: [V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
+    V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP].
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L1_QP (integer)``
     Indicates quantization parameter for hierarchical coding layer 1.
-    Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
-    V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
+    Valid range: [V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
+    V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP].
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L2_QP (integer)``
     Indicates quantization parameter for hierarchical coding layer 2.
-    Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
-    V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
+    Valid range: [V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
+    V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP].
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L3_QP (integer)``
     Indicates quantization parameter for hierarchical coding layer 3.
-    Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
-    V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
+    Valid range: [V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
+    V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP].
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L4_QP (integer)``
     Indicates quantization parameter for hierarchical coding layer 4.
-    Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
-    V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
+    Valid range: [V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
+    V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP].
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L5_QP (integer)``
     Indicates quantization parameter for hierarchical coding layer 5.
-    Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
-    V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
+    Valid range: [V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
+    V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP].
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_QP (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L6_QP (integer)``
     Indicates quantization parameter for hierarchical coding layer 6.
-    Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
-    V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
+    Valid range: [V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP,
+    V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP].
 
 .. _v4l2-hevc-profile:
 
-``V4L2_CID_MPEG_VIDEO_HEVC_PROFILE``
+``V4L2_CID_CODEC_VIDEO_HEVC_PROFILE``
     (enum)
 
-enum v4l2_mpeg_video_hevc_profile -
+enum v4l2_codec_video_hevc_profile -
     Select the desired profile for HEVC encoder.
 
 .. raw:: latex
@@ -2872,11 +2872,11 @@ enum v4l2_mpeg_video_hevc_profile -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN``
+    * - ``V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN``
       - Main profile.
-    * - ``V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE``
+    * - ``V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE``
       - Main still picture profile.
-    * - ``V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10``
+    * - ``V4L2_CODEC_VIDEO_HEVC_PROFILE_MAIN_10``
       - Main 10 profile.
 
 .. raw:: latex
@@ -2886,60 +2886,60 @@ enum v4l2_mpeg_video_hevc_profile -
 
 .. _v4l2-hevc-level:
 
-``V4L2_CID_MPEG_VIDEO_HEVC_LEVEL``
+``V4L2_CID_CODEC_VIDEO_HEVC_LEVEL``
     (enum)
 
-enum v4l2_mpeg_video_hevc_level -
+enum v4l2_codec_video_hevc_level -
     Selects the desired level for HEVC encoder.
 
-==================================	=========
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_1``	Level 1.0
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_2``	Level 2.0
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1``	Level 2.1
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_3``	Level 3.0
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1``	Level 3.1
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_4``	Level 4.0
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1``	Level 4.1
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_5``	Level 5.0
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1``	Level 5.1
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2``	Level 5.2
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_6``	Level 6.0
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1``	Level 6.1
-``V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2``	Level 6.2
-==================================	=========
-
-``V4L2_CID_MPEG_VIDEO_HEVC_FRAME_RATE_RESOLUTION (integer)``
+===================================	=========
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_1``	Level 1.0
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_2``	Level 2.0
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_2_1``	Level 2.1
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_3``	Level 3.0
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_3_1``	Level 3.1
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_4``	Level 4.0
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_4_1``	Level 4.1
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_5``	Level 5.0
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_5_1``	Level 5.1
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_5_2``	Level 5.2
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_6``	Level 6.0
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_6_1``	Level 6.1
+``V4L2_CODEC_VIDEO_HEVC_LEVEL_6_2``	Level 6.2
+===================================	=========
+
+``V4L2_CID_CODEC_VIDEO_HEVC_FRAME_RATE_RESOLUTION (integer)``
     Indicates the number of evenly spaced subintervals, called ticks, within
     one second. This is a 16 bit unsigned integer and has a maximum value up to
     0xffff and a minimum value of 1.
 
 .. _v4l2-hevc-tier:
 
-``V4L2_CID_MPEG_VIDEO_HEVC_TIER``
+``V4L2_CID_CODEC_VIDEO_HEVC_TIER``
     (enum)
 
-enum v4l2_mpeg_video_hevc_tier -
+enum v4l2_codec_video_hevc_tier -
     TIER_FLAG specifies tiers information of the HEVC encoded picture. Tier
     were made to deal with applications that differ in terms of maximum bit
     rate. Setting the flag to 0 selects HEVC tier as Main tier and setting
     this flag to 1 indicates High tier. High tier is for applications requiring
     high bit rates.
 
-==================================	==========
-``V4L2_MPEG_VIDEO_HEVC_TIER_MAIN``	Main tier.
-``V4L2_MPEG_VIDEO_HEVC_TIER_HIGH``	High tier.
-==================================	==========
+===================================	==========
+``V4L2_CODEC_VIDEO_HEVC_TIER_MAIN``	Main tier.
+``V4L2_CODEC_VIDEO_HEVC_TIER_HIGH``	High tier.
+===================================	==========
 
 
-``V4L2_CID_MPEG_VIDEO_HEVC_MAX_PARTITION_DEPTH (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_MAX_PARTITION_DEPTH (integer)``
     Selects HEVC maximum coding unit depth.
 
 .. _v4l2-hevc-loop-filter-mode:
 
-``V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE``
+``V4L2_CID_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE``
     (enum)
 
-enum v4l2_mpeg_video_hevc_loop_filter_mode -
+enum v4l2_codec_video_hevc_loop_filter_mode -
     Loop filter mode for HEVC encoder. Possible values are:
 
 .. raw:: latex
@@ -2952,11 +2952,11 @@ enum v4l2_mpeg_video_hevc_loop_filter_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED``
+    * - ``V4L2_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED``
       - Loop filter is disabled.
-    * - ``V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED``
+    * - ``V4L2_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED``
       - Loop filter is enabled.
-    * - ``V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY``
+    * - ``V4L2_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY``
       - Loop filter is disabled at the slice boundary.
 
 .. raw:: latex
@@ -2964,21 +2964,21 @@ enum v4l2_mpeg_video_hevc_loop_filter_mode -
     \normalsize
 
 
-``V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2 (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_LF_BETA_OFFSET_DIV2 (integer)``
     Selects HEVC loop filter beta offset. The valid range is [-6, +6].
 
-``V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2 (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_LF_TC_OFFSET_DIV2 (integer)``
     Selects HEVC loop filter tc offset. The valid range is [-6, +6].
 
 .. _v4l2-hevc-refresh-type:
 
-``V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE``
+``V4L2_CID_CODEC_VIDEO_HEVC_REFRESH_TYPE``
     (enum)
 
-enum v4l2_mpeg_video_hevc_hier_refresh_type -
+enum v4l2_codec_video_hevc_hier_refresh_type -
     Selects refresh type for HEVC encoder.
     Host has to specify the period into
-    V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD.
+    V4L2_CID_CODEC_VIDEO_HEVC_REFRESH_PERIOD.
 
 .. raw:: latex
 
@@ -2990,11 +2990,11 @@ enum v4l2_mpeg_video_hevc_hier_refresh_type -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_HEVC_REFRESH_NONE``
+    * - ``V4L2_CODEC_VIDEO_HEVC_REFRESH_NONE``
       - Use the B frame for hierarchical coding.
-    * - ``V4L2_MPEG_VIDEO_HEVC_REFRESH_CRA``
+    * - ``V4L2_CODEC_VIDEO_HEVC_REFRESH_CRA``
       - Use CRA (Clean Random Access Unit) picture encoding.
-    * - ``V4L2_MPEG_VIDEO_HEVC_REFRESH_IDR``
+    * - ``V4L2_CODEC_VIDEO_HEVC_REFRESH_IDR``
       - Use IDR (Instantaneous Decoding Refresh) picture encoding.
 
 .. raw:: latex
@@ -3002,61 +3002,61 @@ enum v4l2_mpeg_video_hevc_hier_refresh_type -
     \normalsize
 
 
-``V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_REFRESH_PERIOD (integer)``
     Selects the refresh period for HEVC encoder.
     This specifies the number of I pictures between two CRA/IDR pictures.
     This is valid only if REFRESH_TYPE is not 0.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_LOSSLESS_CU (boolean)``
+``V4L2_CID_CODEC_VIDEO_HEVC_LOSSLESS_CU (boolean)``
     Indicates HEVC lossless encoding. Setting it to 0 disables lossless
     encoding. Setting it to 1 enables lossless encoding.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED (boolean)``
+``V4L2_CID_CODEC_VIDEO_HEVC_CONST_INTRA_PRED (boolean)``
     Indicates constant intra prediction for HEVC encoder. Specifies the
     constrained intra prediction in which intra largest coding unit (LCU)
     prediction is performed by using residual data and decoded samples of
     neighboring intra LCU only. Setting the value to 1 enables constant intra
     prediction and setting the value to 0 disables constant intra prediction.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_WAVEFRONT (boolean)``
+``V4L2_CID_CODEC_VIDEO_HEVC_WAVEFRONT (boolean)``
     Indicates wavefront parallel processing for HEVC encoder. Setting it to 0
     disables the feature and setting it to 1 enables the wavefront parallel
     processing.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_GENERAL_PB (boolean)``
+``V4L2_CID_CODEC_VIDEO_HEVC_GENERAL_PB (boolean)``
     Setting the value to 1 enables combination of P and B frame for HEVC
     encoder.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_TEMPORAL_ID (boolean)``
+``V4L2_CID_CODEC_VIDEO_HEVC_TEMPORAL_ID (boolean)``
     Indicates temporal identifier for HEVC encoder which is enabled by
     setting the value to 1.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING (boolean)``
+``V4L2_CID_CODEC_VIDEO_HEVC_STRONG_SMOOTHING (boolean)``
     Indicates bi-linear interpolation is conditionally used in the intra
     prediction filtering process in the CVS when set to 1. Indicates bi-linear
     interpolation is not used in the CVS when set to 0.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1 (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1 (integer)``
     Indicates maximum number of merge candidate motion vectors.
     Values are from 0 to 4.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION (boolean)``
+``V4L2_CID_CODEC_VIDEO_HEVC_TMV_PREDICTION (boolean)``
     Indicates temporal motion vector prediction for HEVC encoder. Setting it to
     1 enables the prediction. Setting it to 0 disables the prediction.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE (boolean)``
+``V4L2_CID_CODEC_VIDEO_HEVC_WITHOUT_STARTCODE (boolean)``
     Specifies if HEVC generates a stream with a size of the length field
     instead of start code pattern. The size of the length field is configurable
-    through the V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD control. Setting
+    through the V4L2_CID_CODEC_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD control. Setting
     the value to 0 disables encoding without startcode pattern. Setting the
     value to 1 will enables encoding without startcode pattern.
 
 .. _v4l2-hevc-size-of-length-field:
 
-``V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD``
+``V4L2_CID_CODEC_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD``
 (enum)
 
-enum v4l2_mpeg_video_hevc_size_of_length_field -
+enum v4l2_codec_video_hevc_size_of_length_field -
     Indicates the size of length field.
     This is valid when encoding WITHOUT_STARTCODE_ENABLE is enabled.
 
@@ -3070,52 +3070,52 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_VIDEO_HEVC_SIZE_0``
+    * - ``V4L2_CODEC_VIDEO_HEVC_SIZE_0``
       - Generate start code pattern (Normal).
-    * - ``V4L2_MPEG_VIDEO_HEVC_SIZE_1``
+    * - ``V4L2_CODEC_VIDEO_HEVC_SIZE_1``
       - Generate size of length field instead of start code pattern and length is 1.
-    * - ``V4L2_MPEG_VIDEO_HEVC_SIZE_2``
+    * - ``V4L2_CODEC_VIDEO_HEVC_SIZE_2``
       - Generate size of length field instead of start code pattern and length is 2.
-    * - ``V4L2_MPEG_VIDEO_HEVC_SIZE_4``
+    * - ``V4L2_CODEC_VIDEO_HEVC_SIZE_4``
       - Generate size of length field instead of start code pattern and length is 4.
 
 .. raw:: latex
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L0_BR (integer)``
     Indicates bit rate for hierarchical coding layer 0 for HEVC encoder.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L1_BR (integer)``
     Indicates bit rate for hierarchical coding layer 1 for HEVC encoder.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L2_BR (integer)``
     Indicates bit rate for hierarchical coding layer 2 for HEVC encoder.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L3_BR (integer)``
     Indicates bit rate for hierarchical coding layer 3 for HEVC encoder.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L4_BR (integer)``
     Indicates bit rate for hierarchical coding layer 4 for HEVC encoder.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L5_BR (integer)``
     Indicates bit rate for hierarchical coding layer 5 for HEVC encoder.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR (integer)``
+``V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L6_BR (integer)``
     Indicates bit rate for hierarchical coding layer 6 for HEVC encoder.
 
-``V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES (integer)``
+``V4L2_CID_CODEC_VIDEO_REF_NUMBER_FOR_PFRAMES (integer)``
     Selects number of P reference pictures required for HEVC encoder.
     P-Frame can use 1 or 2 frames for reference.
 
-``V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR (integer)``
+``V4L2_CID_CODEC_VIDEO_PREPEND_SPSPPS_TO_IDR (integer)``
     Indicates whether to generate SPS and PPS at every IDR. Setting it to 0
     disables generating SPS and PPS at every IDR. Setting it to one enables
     generating SPS and PPS at every IDR.
 
 .. _v4l2-mpeg-hevc:
 
-``V4L2_CID_MPEG_VIDEO_HEVC_SPS (struct)``
+``V4L2_CID_CODEC_VIDEO_HEVC_SPS (struct)``
     Specifies the Sequence Parameter Set fields (as extracted from the
     bitstream) for the associated HEVC slice data.
     These bitstream parameters are defined according to :ref:`hevc`.
@@ -3255,7 +3255,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_HEVC_PPS (struct)``
+``V4L2_CID_CODEC_VIDEO_HEVC_PPS (struct)``
     Specifies the Picture Parameter Set fields (as extracted from the
     bitstream) for the associated HEVC slice data.
     These bitstream parameters are defined according to :ref:`hevc`.
@@ -3391,7 +3391,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS (struct)``
+``V4L2_CID_CODEC_VIDEO_HEVC_SLICE_PARAMS (struct)``
     Specifies various slice-specific parameters, especially from the NAL unit
     header, general slice segment header and weighted prediction parameter
     parts of the bitstream.
@@ -3651,7 +3651,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE (enum)``
+``V4L2_CID_CODEC_VIDEO_HEVC_DECODE_MODE (enum)``
     Specifies the decoding mode to use. Currently exposes slice-based and
     frame-based decoding but new modes might be added later on.
     This control is used as a modifier for V4L2_PIX_FMT_HEVC_SLICE
@@ -3666,7 +3666,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
        This menu control is not yet part of the public kernel API and
        it is expected to change.
 
-.. c:type:: v4l2_mpeg_video_hevc_decode_mode
+.. c:type:: v4l2_codec_video_hevc_decode_mode
 
 .. raw:: latex
 
@@ -3679,11 +3679,11 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - ``V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED``
+    * - ``V4L2_CODEC_VIDEO_HEVC_DECODE_MODE_SLICE_BASED``
       - 0
       - Decoding is done at the slice granularity.
         The OUTPUT buffer must contain a single slice.
-    * - ``V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED``
+    * - ``V4L2_CODEC_VIDEO_HEVC_DECODE_MODE_FRAME_BASED``
       - 1
       - Decoding is done at the frame granularity.
         The OUTPUT buffer must contain all slices needed to decode the
@@ -3693,7 +3693,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_HEVC_START_CODE (enum)``
+``V4L2_CID_CODEC_VIDEO_HEVC_START_CODE (enum)``
     Specifies the HEVC slice start code expected for each slice.
     This control is used as a modifier for V4L2_PIX_FMT_HEVC_SLICE
     pixel format. Applications that support V4L2_PIX_FMT_HEVC_SLICE
@@ -3707,7 +3707,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
        This menu control is not yet part of the public kernel API and
        it is expected to change.
 
-.. c:type:: v4l2_mpeg_video_hevc_start_code
+.. c:type:: v4l2_codec_video_hevc_start_code
 
 .. tabularcolumns:: |p{9.2cm}|p{0.6cm}|p{7.5cm}|
 
@@ -3716,19 +3716,19 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - ``V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE``
+    * - ``V4L2_CODEC_VIDEO_HEVC_START_CODE_NONE``
       - 0
       - Selecting this value specifies that HEVC slices are passed
         to the driver without any start code. The bitstream data should be
         according to :ref:`hevc` 7.3.1.1 General NAL unit syntax, hence
         contains emulation prevention bytes when required.
-    * - ``V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B``
+    * - ``V4L2_CODEC_VIDEO_HEVC_START_CODE_ANNEX_B``
       - 1
       - Selecting this value specifies that HEVC slices are expected
         to be prefixed by Annex B start codes. According to :ref:`hevc`
         valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
 
-``V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID (integer)``
+``V4L2_CID_CODEC_VIDEO_BASELAYER_PRIORITY_ID (integer)``
     Specifies a priority identifier for the NAL unit, which will be applied to
     the base layer. By default this value is set to 0 for the base layer,
     and the next layer will have the priority ID assigned as 1, 2, 3 and so on.
diff --git a/Documentation/userspace-api/media/v4l/hist-v4l2.rst b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
index 28a2750d5c8c..fe8f24d9c9f4 100644
--- a/Documentation/userspace-api/media/v4l/hist-v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
@@ -941,10 +941,10 @@ V4L2 in Linux 2.6.27
 V4L2 in Linux 2.6.28
 ====================
 
-1. Added ``V4L2_MPEG_AUDIO_ENCODING_AAC`` and
-   ``V4L2_MPEG_AUDIO_ENCODING_AC3`` MPEG audio encodings.
+1. Added ``V4L2_CODEC_AUDIO_ENCODING_AAC`` and
+   ``V4L2_CODEC_AUDIO_ENCODING_AC3`` MPEG audio encodings.
 
-2. Added ``V4L2_MPEG_VIDEO_ENCODING_MPEG_4_AVC`` MPEG video encoding.
+2. Added ``V4L2_CODEC_VIDEO_ENCODING_MPEG_4_AVC`` MPEG video encoding.
 
 3. The pixel formats ``V4L2_PIX_FMT_SGRBG10`` and
    ``V4L2_PIX_FMT_SGRBG10DPCM8`` were added.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index ba6c0c961204..a50358da099d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -34,7 +34,7 @@ Compressed Formats
       - ``V4L2_PIX_FMT_MPEG``
       - 'MPEG'
       - MPEG multiplexed stream. The actual format is determined by
-	extended control ``V4L2_CID_MPEG_STREAM_TYPE``, see
+	extended control ``V4L2_CID_CODEC_STREAM_TYPE``, see
 	:ref:`mpeg-control-id`.
     * .. _V4L2-PIX-FMT-H264:
 
@@ -114,9 +114,9 @@ Compressed Formats
 	This format is adapted for stateless video decoders that implement a
 	MPEG-2 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
 	Metadata associated with the frame to decode is required to be passed
-	through the ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS`` control and
+	through the ``V4L2_CID_CODEC_VIDEO_MPEG2_SLICE_PARAMS`` control and
 	quantization matrices can optionally be specified through the
-	``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION`` control.
+	``V4L2_CID_CODEC_VIDEO_MPEG2_QUANTIZATION`` control.
 	See the :ref:`associated Codec Control IDs <v4l2-mpeg-mpeg2>`.
 	Exactly one output and one capture buffer must be provided for use with
 	this pixel format. The output buffer must contain the appropriate number
@@ -157,7 +157,7 @@ Compressed Formats
 	This format is adapted for stateless video decoders that implement a
 	VP8 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
 	Metadata associated with the frame to decode is required to be passed
-	through the ``V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER`` control.
+	through the ``V4L2_CID_CODEC_VIDEO_VP8_FRAME_HEADER`` control.
 	See the :ref:`associated Codec Control IDs <v4l2-mpeg-vp8>`.
 	Exactly one output and one capture buffer must be provided for use with
 	this pixel format. The output buffer must contain the appropriate number
@@ -194,13 +194,13 @@ Compressed Formats
 	This format is adapted for stateless video decoders that implement a
 	HEVC pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
 	This pixelformat has two modifiers that must be set at least once
-	through the ``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE``
-        and ``V4L2_CID_MPEG_VIDEO_HEVC_START_CODE`` controls.
+	through the ``V4L2_CID_CODEC_VIDEO_HEVC_DECODE_MODE``
+        and ``V4L2_CID_CODEC_VIDEO_HEVC_START_CODE`` controls.
 	Metadata associated with the frame to decode is required to be passed
 	through the following controls:
-        ``V4L2_CID_MPEG_VIDEO_HEVC_SPS``,
-        ``V4L2_CID_MPEG_VIDEO_HEVC_PPS``, and
-        ``V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS``.
+        ``V4L2_CID_CODEC_VIDEO_HEVC_SPS``,
+        ``V4L2_CID_CODEC_VIDEO_HEVC_PPS``, and
+        ``V4L2_CID_CODEC_VIDEO_HEVC_SLICE_PARAMS``.
 	See the :ref:`associated Codec Control IDs <v4l2-mpeg-hevc>`.
 	Buffers associated with this pixel format must contain the appropriate
 	number of macroblocks to decode a full corresponding frame.
diff --git a/Documentation/userspace-api/media/v4l/v4l2.rst b/Documentation/userspace-api/media/v4l/v4l2.rst
index ad7a2bf0cf26..e474b7e76be0 100644
--- a/Documentation/userspace-api/media/v4l/v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2.rst
@@ -89,7 +89,7 @@ Authors, in alphabetical order:
 
 - Walls, Andy <awalls@md.metrocast.net>
 
-  - Documented the fielded V4L2_MPEG_STREAM_VBI_FMT_IVTV MPEG stream embedded, sliced VBI data format in this specification.
+  - Documented the fielded V4L2_CODEC_STREAM_VBI_FMT_IVTV MPEG stream embedded, sliced VBI data format in this specification.
 
 - Verkuil, Hans <hverkuil@xs4all.nl>
 
@@ -315,7 +315,7 @@ Documented V4L2_PIX_FMT_RGB444.
 :revision: 0.18 / 2006-10-18 (*mhs*)
 
 Added the description of extended controls by Hans Verkuil. Linked
-V4L2_PIX_FMT_MPEG to V4L2_CID_MPEG_STREAM_TYPE.
+V4L2_PIX_FMT_MPEG to V4L2_CID_CODEC_STREAM_TYPE.
 
 
 :revision: 0.17 / 2006-10-12 (*mhs*)
-- 
2.30.1

