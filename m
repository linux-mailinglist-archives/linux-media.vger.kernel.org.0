Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D367CC929
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 18:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjJQQyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 12:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234346AbjJQQyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 12:54:08 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE38B0
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 09:54:05 -0700 (PDT)
Received: from localhost (node-1w7jr9sszvrs1l8hzw7y2s2bv.ipv6.telus.net [IPv6:2001:569:be8a:cf00:d491:55fe:74d9:74cb])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B5527660576A;
        Tue, 17 Oct 2023 17:54:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1697561644;
        bh=1ei2jHqPI7sYHzGdl2I9MKs7VOc4uRCZ9y3m2utpQEc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QXZVa4y9QAYrYje4iKmYMvHWFP+AZggVY4Xb3IHQDqaeAxrjSkyWpls+BNwLp6mzB
         gH2o2CnYYoGes1m852TNHur2pv/BDYkxKG/be3doZV54W3b8+VMp7oguO+/qSsJsZ5
         rTTcehfVhCgCw9t+lYt92CFfm0Nj9b1lHbVn2Ha+HTWSNvKqXWfwDxMmHNvjJvfnHY
         v6aAiAjARbOD8DfxArTaISqt57uBaGsqTkwMff/GZwVwKE8voB/1vy4LpRYDJdF/vS
         5yMTW/b2ggJSOI8gPsVngY6e0FzJG/RpHYDYgDSHx6QJSlCT8/u5iqQT21LatqFRLF
         wx0yUNd4Fw5Gw==
Date:   Tue, 17 Oct 2023 09:54:00 -0700
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: v4l2-tracer fails to compile after syncing to latest kernel
 headers
Message-ID: <ZS68KKvhnq+QNXkN@mz550>
References: <0af44b62-4c18-4ec1-ba83-cca712a53acb@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0af44b62-4c18-4ec1-ba83-cca712a53acb@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 17, 2023 at 10:40:42AM +0200, Hans Verkuil wrote:
> Hi Deb,
> 
> I wanted to sync the kernel headers used in v4l-utils to the latest versions,
> but that caused v4l2-tracer to fail on the new AV1 struct.

Hi Hans,
Thanks for letting me know.  The autogeneration scripts actually handled
a lot of AV1 really nicely.  There are just two small changes which I
will send a patch for that should let you compile.  Changes to actually
trace AV1 will follow later. And I promise that improving the readability of
the autogeneration script is on my todo list :)

Deborah

> 
> To test this yourself, go to your checked out kernel git repo and run
> make headers_install:
> 
> cd kernel-repo-dir
> make headers_install
> 
> Next to go the v4l-utils directory and run:
> 
> sync-with-kernel.sh path-to-kernel-repo-dir
> 
> Next build v4l-utils.
> 
> There are two issues:
> 
> 1) v4l2-trace doesn't support the new AV1 struct, at least this patch is needed:
> 
> diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
> index 88e70ea9..06d4f62a 100644
> --- a/utils/v4l2-tracer/retrace.cpp
> +++ b/utils/v4l2-tracer/retrace.cpp
> @@ -872,6 +872,18 @@ struct v4l2_ext_control *retrace_v4l2_ext_control(json_object *parent_obj, int c
>  	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
>  		p->ptr = retrace_v4l2_ctrl_mpeg2_quantisation_gen(v4l2_ext_control_obj);
>  		break;
> +	case V4L2_CID_STATELESS_AV1_SEQUENCE:
> +		p->ptr = retrace_v4l2_ctrl_av1_sequence_gen(v4l2_ext_control_obj);
> +		break;
> +	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:
> +		p->ptr = retrace_v4l2_ctrl_av1_tile_group_entry_gen(v4l2_ext_control_obj);
> +		break;
> +	case V4L2_CID_STATELESS_AV1_FRAME:
> +		p->ptr = retrace_v4l2_ctrl_av1_frame_gen(v4l2_ext_control_obj);
> +		break;
> +	case V4L2_CID_STATELESS_AV1_FILM_GRAIN:
> +		p->ptr = retrace_v4l2_ctrl_av1_film_grain_gen(v4l2_ext_control_obj);
> +		break;
>  	default:
>  		line_info("\n\tWarning: cannot retrace control: %s",
>  		          val2s(p->id, control_val_def).c_str());
> diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
> index 0e8531ff..4ddac491 100644
> --- a/utils/v4l2-tracer/trace.cpp
> +++ b/utils/v4l2-tracer/trace.cpp
> @@ -407,6 +407,18 @@ void trace_v4l2_ext_control(void *arg, json_object *parent_obj, std::string key_
>  	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
>  		trace_v4l2_ctrl_mpeg2_quantisation_gen(p->p_mpeg2_quantisation, v4l2_ext_control_obj);
>  		break;
> +	case V4L2_CID_STATELESS_AV1_SEQUENCE:
> +		trace_v4l2_ctrl_av1_sequence_gen(p->p_av1_sequence, v4l2_ext_control_obj);
> +		break;
> +	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:
> +		trace_v4l2_ctrl_av1_tile_group_entry_gen(p->p_av1_tile_group_entry, v4l2_ext_control_obj);
> +		break;
> +	case V4L2_CID_STATELESS_AV1_FRAME:
> +		trace_v4l2_ctrl_av1_frame_gen(p->p_av1_frame, v4l2_ext_control_obj);
> +		break;
> +	case V4L2_CID_STATELESS_AV1_FILM_GRAIN:
> +		trace_v4l2_ctrl_av1_film_grain_gen(p->p_av1_film_grain, v4l2_ext_control_obj);
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_DEC_PTS:
>  	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:
>  	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
> 
> 
> And even with that it fails to compile:
> 
> $ ninja -C build
> ninja: Entering directory `build'
> [1/5] Compiling C++ object utils/v4l2-tracer/libv4l2tracer.so.p/meson-generated_.._trace-gen.cpp.o
> FAILED: utils/v4l2-tracer/libv4l2tracer.so.p/meson-generated_.._trace-gen.cpp.o
> ccache c++ -Iutils/v4l2-tracer/libv4l2tracer.so.p -Iutils/v4l2-tracer -I../utils/v4l2-tracer -I../utils/common -I../lib/include -I../include -I/usr/include/json-c -fdiagnostics-color=always
> -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=gnu++11 -O2 -g -Wpointer-arith -D_GNU_SOURCE -DPROMOTED_MODE_T=int -DENABLE_NLS -include /home/hans/work/src/v4l/v4l-utils/build/config.h -fPIC
> -U_FILE_OFFSET_BITS -D_FILE_OFFSET_BITS=32 -D_LARGEFILE64_SOURCE -MD -MQ utils/v4l2-tracer/libv4l2tracer.so.p/meson-generated_.._trace-gen.cpp.o -MF
> utils/v4l2-tracer/libv4l2tracer.so.p/meson-generated_.._trace-gen.cpp.o.d -o utils/v4l2-tracer/libv4l2tracer.so.p/meson-generated_.._trace-gen.cpp.o -c utils/v4l2-tracer/trace-gen.cpp
> utils/v4l2-tracer/trace-gen.cpp: In function ‘void trace_v4l2_av1_global_motion_gen(void*, json_object*)’:
> utils/v4l2-tracer/trace-gen.cpp:1193:49: error: ‘json_object_new_’ was not declared in this scope; did you mean ‘json_object_new_int’?
>  1193 |                 json_object_array_add(type_obj, json_object_new_(p->type[i]));
>       |                                                 ^~~~~~~~~~~~~~~~
>       |                                                 json_object_new_int
> utils/v4l2-tracer/trace-gen.cpp: In function ‘void trace_v4l2_av1_loop_restoration_gen(void*, json_object*)’:
> utils/v4l2-tracer/trace-gen.cpp:1220:67: error: ‘json_object_new_’ was not declared in this scope; did you mean ‘json_object_new_int’?
>  1220 |                 json_object_array_add(frame_restoration_type_obj, json_object_new_(p->frame_restoration_type[i]));
>       |                                                                   ^~~~~~~~~~~~~~~~
>       |                                                                   json_object_new_int
> ...
> 
> I suspect the parsing of the header failed here. So either the parser or the v4l2-controls.h
> header (or both!) likely need work.
> 
> Can you take a look?
> 
> Regards,
> 
> 	Hans
