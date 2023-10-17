Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F38967CBDE8
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 10:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234673AbjJQIkt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 04:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233882AbjJQIks (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 04:40:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B3AB0
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 01:40:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5256C433C8;
        Tue, 17 Oct 2023 08:40:44 +0000 (UTC)
Message-ID: <0af44b62-4c18-4ec1-ba83-cca712a53acb@xs4all.nl>
Date:   Tue, 17 Oct 2023 10:40:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To:     Deborah Brouwer <deborah.brouwer@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: v4l2-tracer fails to compile after syncing to latest kernel headers
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

I wanted to sync the kernel headers used in v4l-utils to the latest versions,
but that caused v4l2-tracer to fail on the new AV1 struct.

To test this yourself, go to your checked out kernel git repo and run
make headers_install:

cd kernel-repo-dir
make headers_install

Next to go the v4l-utils directory and run:

sync-with-kernel.sh path-to-kernel-repo-dir

Next build v4l-utils.

There are two issues:

1) v4l2-trace doesn't support the new AV1 struct, at least this patch is needed:

diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 88e70ea9..06d4f62a 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -872,6 +872,18 @@ struct v4l2_ext_control *retrace_v4l2_ext_control(json_object *parent_obj, int c
 	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
 		p->ptr = retrace_v4l2_ctrl_mpeg2_quantisation_gen(v4l2_ext_control_obj);
 		break;
+	case V4L2_CID_STATELESS_AV1_SEQUENCE:
+		p->ptr = retrace_v4l2_ctrl_av1_sequence_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:
+		p->ptr = retrace_v4l2_ctrl_av1_tile_group_entry_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_AV1_FRAME:
+		p->ptr = retrace_v4l2_ctrl_av1_frame_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_AV1_FILM_GRAIN:
+		p->ptr = retrace_v4l2_ctrl_av1_film_grain_gen(v4l2_ext_control_obj);
+		break;
 	default:
 		line_info("\n\tWarning: cannot retrace control: %s",
 		          val2s(p->id, control_val_def).c_str());
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index 0e8531ff..4ddac491 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -407,6 +407,18 @@ void trace_v4l2_ext_control(void *arg, json_object *parent_obj, std::string key_
 	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
 		trace_v4l2_ctrl_mpeg2_quantisation_gen(p->p_mpeg2_quantisation, v4l2_ext_control_obj);
 		break;
+	case V4L2_CID_STATELESS_AV1_SEQUENCE:
+		trace_v4l2_ctrl_av1_sequence_gen(p->p_av1_sequence, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:
+		trace_v4l2_ctrl_av1_tile_group_entry_gen(p->p_av1_tile_group_entry, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_AV1_FRAME:
+		trace_v4l2_ctrl_av1_frame_gen(p->p_av1_frame, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_AV1_FILM_GRAIN:
+		trace_v4l2_ctrl_av1_film_grain_gen(p->p_av1_film_grain, v4l2_ext_control_obj);
+		break;
 	case V4L2_CID_MPEG_VIDEO_DEC_PTS:
 	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:
 	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:


And even with that it fails to compile:

$ ninja -C build
ninja: Entering directory `build'
[1/5] Compiling C++ object utils/v4l2-tracer/libv4l2tracer.so.p/meson-generated_.._trace-gen.cpp.o
FAILED: utils/v4l2-tracer/libv4l2tracer.so.p/meson-generated_.._trace-gen.cpp.o
ccache c++ -Iutils/v4l2-tracer/libv4l2tracer.so.p -Iutils/v4l2-tracer -I../utils/v4l2-tracer -I../utils/common -I../lib/include -I../include -I/usr/include/json-c -fdiagnostics-color=always
-D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=gnu++11 -O2 -g -Wpointer-arith -D_GNU_SOURCE -DPROMOTED_MODE_T=int -DENABLE_NLS -include /home/hans/work/src/v4l/v4l-utils/build/config.h -fPIC
-U_FILE_OFFSET_BITS -D_FILE_OFFSET_BITS=32 -D_LARGEFILE64_SOURCE -MD -MQ utils/v4l2-tracer/libv4l2tracer.so.p/meson-generated_.._trace-gen.cpp.o -MF
utils/v4l2-tracer/libv4l2tracer.so.p/meson-generated_.._trace-gen.cpp.o.d -o utils/v4l2-tracer/libv4l2tracer.so.p/meson-generated_.._trace-gen.cpp.o -c utils/v4l2-tracer/trace-gen.cpp
utils/v4l2-tracer/trace-gen.cpp: In function ‘void trace_v4l2_av1_global_motion_gen(void*, json_object*)’:
utils/v4l2-tracer/trace-gen.cpp:1193:49: error: ‘json_object_new_’ was not declared in this scope; did you mean ‘json_object_new_int’?
 1193 |                 json_object_array_add(type_obj, json_object_new_(p->type[i]));
      |                                                 ^~~~~~~~~~~~~~~~
      |                                                 json_object_new_int
utils/v4l2-tracer/trace-gen.cpp: In function ‘void trace_v4l2_av1_loop_restoration_gen(void*, json_object*)’:
utils/v4l2-tracer/trace-gen.cpp:1220:67: error: ‘json_object_new_’ was not declared in this scope; did you mean ‘json_object_new_int’?
 1220 |                 json_object_array_add(frame_restoration_type_obj, json_object_new_(p->frame_restoration_type[i]));
      |                                                                   ^~~~~~~~~~~~~~~~
      |                                                                   json_object_new_int
...

I suspect the parsing of the header failed here. So either the parser or the v4l2-controls.h
header (or both!) likely need work.

Can you take a look?

Regards,

	Hans
