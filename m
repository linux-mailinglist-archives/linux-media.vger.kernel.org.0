Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECA153950A
	for <lists+linux-media@lfdr.de>; Tue, 31 May 2022 18:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346197AbiEaQmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 May 2022 12:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241712AbiEaQmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 May 2022 12:42:10 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6E95AA50
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 09:42:09 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dwlsalmeida)
        with ESMTPSA id C78A41F43BD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1654015328;
        bh=ZRZnMgJ66jQzzDDMvdaGu2DgKvaBwPpDPMtewaxPt8Y=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=PG8mEKoMVn6DcW/BqCo8W5bCIyA+TXe3NaTRm5WS4hcqhRQLirAcJNTttQtCAfC/Q
         hfjQ0aXrds76OwAcs6dQjoPkpuNmxapMgqu79oN2sfqfDiuHa3xQz4VpD2MLb1cFUw
         XFAB4ZzJGgWofDMkWH5vmEzrIJOTSNdWMSXb9Ky7+0yQomac/Q1wnFIqT3Y18ReVRa
         oihV+dF44VZveCp5opufz6vVbeUkRWGTkOqP5RPNQcgPkeYTkH4EHfGuMyOlOwGMJI
         8qG379RR9rcRmSJ4uN0nKKeeuiRi1nSI/p8KySW9lw9O+alamsYM2zbUahNXaYHugm
         2J/pF6R/kaQ9g==
Message-ID: <f366ce58-81e8-7b5b-24ef-b2ab88ce1d99@collabora.com>
Date:   Tue, 31 May 2022 13:42:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2] media: Add AV1 uAPI
Content-Language: en-US
To:     Steve Cho <stevecho@chromium.org>
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20220322160101.620748-1-daniel.almeida@collabora.com>
 <CAC-pXoOQ5kD4bT95j+pwi7+Hb5s5H=0LFhAsk7K2sM9LkbAW1w@mail.gmail.com>
 <fa87fd58-dc73-24b0-0425-e466062c1d6d@collabora.com>
 <CAC-pXoP77VZT1Ftu3Amws9-Y9i11r9M0LxSEwqkezm_3i=HE8g@mail.gmail.com>
 <CAC-pXoOJPveE_+kjjkMS=anMCjJKc4VsxNrJbxkQsXqnLLb6XQ@mail.gmail.com>
 <CAC-pXoPU_bOJu723POgWj+EdXHsPg3X9J5Phq-YTCpO9jt-seg@mail.gmail.com>
 <CAN0yncHrY6jfk6owTEue8PqGmxffU612UgccvPc9Y6XOz38LRA@mail.gmail.com>
 <CAC-pXoPRAM8+xTPHHAxr_80vBGYaFO8R=v+2QMYJ5nEb0gvOTg@mail.gmail.com>
 <CAC-pXoNHRxqe6tzg3++TqYRZE-nocxiz-iPh5vPXC07iA_BaSw@mail.gmail.com>
 <CAC-pXoNRoqT_Fse_3Z8cO-SDwtMTm3fzScpDWvi5sNVr1N1Dzg@mail.gmail.com>
 <CAC-pXoOon18axGdT_+V38sdAWDh+t4jZetXqte7BCwO09YG+2w@mail.gmail.com>
 <CAC-pXoMVKmAZ=9iM7ivuo8rvnL=KQWHnopWharDz-eDky0QS-g@mail.gmail.com>
From:   Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAC-pXoMVKmAZ=9iM7ivuo8rvnL=KQWHnopWharDz-eDky0QS-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sending this again, as apparently my last submission contained some HTML 
that prevented it from being sent on the media ML

---

Hi Steve,

 > I think the below definition is expected to cause a build error.
 >
 > +struct v4l2_av1_loop_restoration {
 > +       u8 flags;
 >
 > s/u8/__u8/ is needed.
 >
 > At least, this change was needed to fix this build error on Chromium
 > build environment.

This will be fixed in RFC v3

 > Question about tile info structure.
 >
 > struct v4l2_av1_tile_info {
 > __u8 flags;
 > __u32 mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1];
 > __u32 mi_row_starts[V4L2_AV1_MAX_TILE_ROWS + 1];
 > __u32 width_in_sbs_minus_1[V4L2_AV1_MAX_TILE_COLS];
 > __u32 height_in_sbs_minus_1[V4L2_AV1_MAX_TILE_ROWS];
 >
 > I see below from the spec and gstreamer implementation
 > for width_in_sbs_minus_1 and height_in_sbs_minus_1 computation.
 >
 >   sb_cols = seq_header->use_128x128_superblock ?
 >       ((parser->state.mi_cols + 31) >> 5) : ((parser->state.mi_cols + 
15) >> 4);
 >   sb_rows = seq_header->use_128x128_superblock ? 
((parser->state.mi_rows +
 >           31) >> 5) : ((parser->state.mi_rows + 15) >> 4);
 >
 > Are we confident that V4L2_AV1_MAX_TILE_COLS is good enough size for
 > width_in_sbs_minus_1?
 > Or does it potentially need to be V4L2_AV1_MAX_TILE_COLS+1?
 >
 > I am asking to double check because I see V4L2_AV1_MAX_TILE_COLS+1
 > used for corresponding field in libgav1.
 > int tile_column_width_in_superblocks[kMaxTileColumns + 1];

I have checked with a few other APIs to be on the safe side.

In VA-API they  use a trick to save space on the last element, therefore 
these two arrays will only be 63 members wide.

In NVDEC, these two arrays are 64 members wide, which is the same as our 
V4L2 stateless implementation.

In DXVA, these two arrays are also 64 members wide

While going through the spec alongside with the libgav1 source code, I 
notice that the index used to index into the two arrays eventually gets 
assigned to tile_info->tile_rows and tile_info->tile_cols, i.e.

https://source.chromium.org/chromium/chromium/src/+/main:third_party/libgav1/src/src/obu_parser.cc;l=1704;drc=242da5037807dde3daf097ba74f875db83b8b613

https://source.chromium.org/chromium/chromium/src/+/main:third_party/libgav1/src/src/obu_parser.cc;drc=242da5037807dde3daf097ba74f875db83b8b613;l=1729

But the spec says that these variables must be less than or equal to 
MAX_TILE_ROWS (i.e. 64) and MAX_TILE_COLS (i.e. 64), respectively, i.e.:

 > TileCols specifies the number of tiles across the frame. It is a 
requirement of bitstream conformance that TileCols is less
 > than or equal to MAX_TILE_COLS.

 > TileRows specifies the number of tiles down the frame. It is a 
requirement of bitstream conformance that TileRows is less
 > than or equal to MAX_TILE_ROWS.

In which case only the first 64 members would be filled when actually 
submitting to the accelerator, i.e.:

https://source.chromium.org/chromium/chromium/src/+/main:media/gpu/windows/d3d11_av1_accelerator.cc;drc=242da5037807dde3daf097ba74f875db83b8b613;l=316


Given what I said above, I feel confident with the current implementation.

 > struct v4l2_ctrl_av1_frame_header {
 >   struct v4l2_av1_tile_info tile_info;
 >   struct v4l2_av1_quantization quantization;
 >   struct v4l2_av1_segmentation segmentation;
 >   struct v4l2_av1_loop_filter loop_filter;
 >   struct v4l2_av1_cdef cdef;
 >   struct v4l2_av1_loop_restoration loop_restoration;
 >   struct v4l2_av1_global_motion global_motion;
 >
 > We used "v4l2_ctrl_vp9_frame" for the similar purpose.
 >
 > I thought "_header" can be confusing in a sense that these are
 > parameters setup from parsing av1 frame header,
 > not necessarily "header" itself.
 >
 > How about making it "v4l2_ctrl_av1_frame" similar to vp9,
 > or "v4l2_ctrl_av1_frame_params"?

Ok, expect this change on RFC v3.

 > Don't we also need V4L2_PIX_FMT_AV1 in addition to V4L2_PIX_FMT_AV1_FRAME
 > as we do with both VP8 and VP9? I see V4L2_PIX_FMT_AV1 is missing.

No, as the non "_FRAME" pixformats are used for the stateful interface.


 > 1. "tab" seems to be used before "descr = ". […] for other cases.
 > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
 > @@ -1441,6 +1441,7 @@ static void v4l_fill_fmtdesc(struct 
v4l2_fmtdesc *fmt)
 >                 case V4L2_PIX_FMT_MT21C:        descr = "Mediatek
 > Compressed Format"; break;
 > +               case V4L2_PIX_FMT_AV1_FRAME: descr = "AV1 Frame"; break;
 >
 > 2. nit: s/the  AOMedia/the AOMedia/
 >
 > This patch adds the  AOMedia Video 1 (AV1) kernel uAPI.
 >
 > 3. nit: s/AV1 film_gram/AV1 film grain/ ?
 > +++ b/include/media/v4l2-ctrls.h
 >
 > + * @p_av1_film_grain:          Pointer to an AV1 film_grain.

Will be fixed in v3.


 >
 > #define V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_PRESENT BIT(2)
 >
 > /**
 >  * struct v4l2_av1_loop_filter - AV1 Loop filter params as defined in 
section
 >  * 6.8.10. "Loop filter semantics" of the AV1 specification.
 > ......
 >
 > struct v4l2_av1_loop_filter {
 > ......
 > __u8 delta_lf_res;
 > __u8 delta_lf_multi;
 > };
 >
 > - I think we should mention "6.8.16. Loop filter delta parameters 
semantics" in the comment too.
 >

Ok

 > - What was the reason "delta_lf_present" is defined with 
V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_PRESENT
 > instead of being inside of "v4l2_av1_loop_filter"?
 > In other words, why do we want to treat it differently from 
delta_lf_res or delta_lf_multi?
 > I am asking this question as this was confusing to me.

Usually we try to keep single-bit flags into a single "flags" field to 
save space. It is not a rule, but tends to get applied most of the time 
(by almost all codec APIs, not only V4L2 stateless)

I did fail to see that delta_lf_multi is only a single bit wide though, 
so by RFC v3 I will possibly have a flag for it as well.

 > AV1 uAPI is using BIT() macro, which is probably from a kernel 
internal header <linux/bits.h>.
 > Is this planned usage? We think we can't include it from userspace.
 >
 > Thank you Chen-Yu for sharing his thought on the issue.

Looking at the other codec APIs in V4L2 stateless, apparently the 
default is to declare the flag using a literal. I will convert the flags 
in AV1 to not use the BIT macro anymore.

 > Question about update_ref_delta, update_mode_delta flags for loop 
filter params in the spec.
 >
 > I don't see these flags in v4l2_av1_loop_filter struct.
 >
 > After looking at gstreamer implementation, I think arrays ref_deltas, 
mode_deltas are only filled in when these flags are 1.
 >
 > Is this correct understanding?
 > If not, can you explain the background why these flags are omitted?

Possibly forgotten. Will fix in RFC v3.

 > I am not sure how to setup loop_restoration_size[0] in 
v4l2_av1_loop_restoration struct,
 > which seems to use RESTORATION_TILESIZE_MAX = 256 at least for 
gstreamer implementation.
 >
 > Is this RESTORATION_TILESIZE_MAX something potentially needs to be 
added in the API by any chance?
 > I do see this from the AV1 spec.

I usually only #define constants if they're used in the actual uAPI code 
somehow as opposed to in intermediary steps such as parsing. You can 
still define the spec constants as needed in userspace code. In this 
particular case, you can compute loop_restoration_size[0] by following 
the spec implementation, i.e.:

LoopRestorationSize[ 0 ] = RESTORATION_TILESIZE_MAX >> (2 - lr_unit_shift);

Where you can #define RESTORATION_TILESIZE_MAX 256 in your own userspace 
code without it having to be part of the uAPI. I don't believe that 
drivers will ever use that constant, but those that do may #define it on 
their own code.

 > could you have the V4L2 CID stuff inserted consistently? In some 
places they are inserted before stateless HEVC / after VP8_FRAME, while 
in others they are after VP9_FRAME. I'd expect them all to be at the 
very end of the stateless block, after VP9_FRAME,
 >

I am adding this feedback from Chen-Yu ^ as a sign that the issue it 
talks about will be fixed in RFC v3.


-- Daniel
