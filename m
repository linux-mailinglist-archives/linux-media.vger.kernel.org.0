Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF14345922
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 08:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhCWH6Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 03:58:16 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:37581 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229472AbhCWH56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 03:57:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ObvFluQDBUzyrObvJlOcMm; Tue, 23 Mar 2021 08:57:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616486277; bh=cBXEsZLd5iaukr62Q1pSCKyioYAiU90bd0cyy1hRoVY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Su1W8TfBN3XZgW3bwKzJqSDUQcpU5z28wNxq6axheinIfSLqbcIuyX7d6fv642SyZ
         VD6gfUVHGhqE1KJpAuVhVu6AfxzKDwBon7t9JHvDy8SI9QTDUezxSnYgFggdzFIKBJ
         A0wJyGfnsopx3OmR7aFyHSKBX06cf9g0AVCXuT76pPkYneLwndnE72WbCS0mr0bLf8
         OMZhlSR5567zUeCcPGpto4qTXltuYquBMnu+pFph7h4YR1MtwvT/mZTUcKzgWiEP1j
         9ss/25loI5NBvFTHtT7Tagfv+039weoxjCL18fEW0LDH3Bs+6Vt+E9Kr9edgxWxU6I
         czsI2mkxixvhw==
Subject: Re: [PATCH] allegro-dvt/nal-h264.h: fix kernel-doc: hdr -> hrd
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <03e0ce22-1ebe-24f4-0f49-f4c41ae8f598@xs4all.nl>
 <20210323075258.GC31778@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fc54c78a-997e-f1e6-aca4-9f0453579d1a@xs4all.nl>
Date:   Tue, 23 Mar 2021 08:57:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323075258.GC31778@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH7IyQn1r//PklZR35UygKjMlY//7h3g1Xk3tHi0t8JLllc6nb4QPYhzRpmbIzUHl/N14aDFWjGKF7/spwxqu9e6UrTguMK8bsUeQJoUnMxAG7y087pM
 wjsMAI35SWCchNM4nBFaUvTmoj1oe6UftvZ8/oUZdEOFSw7bmCa3x2gX2l8vIj0xWhvb1iR9K1uC9bweNU2ht68jARfSTJRyAGEOzsl0GbcVJ8rGeqZeoav7
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On 23/03/2021 08:52, Michael Tretter wrote:
> On Tue, 23 Mar 2021 08:49:13 +0100, Hans Verkuil wrote:
>> Give typo in kernel-doc documentation: hdr -> hrd
>>
>> Fixes this warning:
>>
>> drivers/media/platform/allegro-dvt/nal-h264.h:33: warning: expecting prototype for struct nal_h264_hdr_parameters. Prototype was for struct
>> nal_h264_hrd_parameters instead
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

Since you made the mistake of replying :-) I want to point out that the allegro headers
produce a large number of kernel-doc warnings since none of the parameters are documented.

You can look at the daily build log for all the warnings, but I've copied them below as
well.

I think you should either document it all, or change /** to /*.

Regards,

	Hans

drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'video_parameter_set_id' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'base_layer_internal_flag' not described in
'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'base_layer_available_flag' not described in
'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'max_layers_minus1' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'max_sub_layers_minus1' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'temporal_id_nesting_flag' not described in
'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'profile_tier_level' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'sub_layer_ordering_info_present_flag' not described
in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'max_dec_pic_buffering_minus1' not described in
'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'max_num_reorder_pics' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'max_latency_increase_plus1' not described in
'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'max_layer_id' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'num_layer_sets_minus1' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'layer_id_included_flag' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'timing_info_present_flag' not described in
'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'num_units_in_tick' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'time_scale' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'poc_proportional_to_timing_flag' not described in
'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'num_ticks_poc_diff_one_minus1' not described in
'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'num_hrd_parameters' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'hrd_layer_set_idx' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'cprms_present_flag' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'extension_flag' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:95: warning: Function parameter or member 'extension_data_flag' not described in 'nal_hevc_vps'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'aspect_ratio_info_present_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'aspect_ratio_idc' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'sar_width' not described in 'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'sar_height' not described in 'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'overscan_info_present_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'overscan_appropriate_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'video_signal_type_present_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'video_format' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'video_full_range_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'colour_description_present_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'colour_primaries' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'transfer_characteristics' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'matrix_coeffs' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'chroma_loc_info_present_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'chroma_sample_loc_type_top_field' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'chroma_sample_loc_type_bottom_field' not described
in 'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'neutral_chroma_indication_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'field_seq_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'frame_field_info_present_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'default_display_window_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'def_disp_win_left_offset' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'def_disp_win_right_offset' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'def_disp_win_top_offset' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'def_disp_win_bottom_offset' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'vui_timing_info_present_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'vui_num_units_in_tick' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'vui_time_scale' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'vui_poc_proportional_to_timing_flag' not described
in 'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'vui_num_ticks_poc_diff_one_minus1' not described
in 'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'vui_hrd_parameters_present_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'nal_hrd_parameters' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'bitstream_restriction_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'tiles_fixed_structure_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'motion_vectors_over_pic_boundaries_flag' not
described in 'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'restricted_ref_pic_lists_flag' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'min_spatial_segmentation_idc' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'max_bytes_per_pic_denom' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'max_bits_per_min_cu_denom' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'log2_max_mv_length_horizontal' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:193: warning: Function parameter or member 'log2_max_mv_length_vertical' not described in
'nal_hevc_vui_parameters'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'video_parameter_set_id' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'max_sub_layers_minus1' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'temporal_id_nesting_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'profile_tier_level' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'seq_parameter_set_id' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'chroma_format_idc' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'separate_colour_plane_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'pic_width_in_luma_samples' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'pic_height_in_luma_samples' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'conformance_window_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'conf_win_left_offset' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'conf_win_right_offset' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'conf_win_top_offset' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'conf_win_bottom_offset' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'bit_depth_luma_minus8' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'bit_depth_chroma_minus8' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'log2_max_pic_order_cnt_lsb_minus4' not described
in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'sub_layer_ordering_info_present_flag' not
described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'max_dec_pic_buffering_minus1' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'max_num_reorder_pics' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'max_latency_increase_plus1' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'log2_min_luma_coding_block_size_minus3' not
described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'log2_diff_max_min_luma_coding_block_size' not
described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'log2_min_luma_transform_block_size_minus2' not
described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'log2_diff_max_min_luma_transform_block_size' not
described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'max_transform_hierarchy_depth_inter' not described
in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'max_transform_hierarchy_depth_intra' not described
in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'scaling_list_enabled_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'scaling_list_data_present_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'amp_enabled_flag' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'sample_adaptive_offset_enabled_flag' not described
in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'pcm_enabled_flag' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'pcm_sample_bit_depth_luma_minus1' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'pcm_sample_bit_depth_chroma_minus1' not described
in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'log2_min_pcm_luma_coding_block_size_minus3' not
described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'log2_diff_max_min_pcm_luma_coding_block_size' not
described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'pcm_loop_filter_disabled_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'num_short_term_ref_pic_sets' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'long_term_ref_pics_present_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'sps_temporal_mvp_enabled_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'strong_intra_smoothing_enabled_flag' not described
in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'vui_parameters_present_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'vui' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'extension_present_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'sps_range_extension_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'sps_multilayer_extension_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'sps_3d_extension_flag' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'sps_scc_extension_flag' not described in
'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-hevc.h:262: warning: Function parameter or member 'sps_extension_4bits' not described in 'nal_hevc_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:33: warning: expecting prototype for struct nal_h264_hdr_parameters. Prototype was for struct
nal_h264_hrd_parameters instead
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'aspect_ratio_info_present_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'aspect_ratio_idc' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'sar_width' not described in 'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'sar_height' not described in 'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'overscan_info_present_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'overscan_appropriate_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'video_signal_type_present_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'video_format' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'video_full_range_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'colour_description_present_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'colour_primaries' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'transfer_characteristics' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'matrix_coefficients' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'chroma_loc_info_present_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'chroma_sample_loc_type_top_field' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'chroma_sample_loc_type_bottom_field' not described
in 'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'timing_info_present_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'num_units_in_tick' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'time_scale' not described in 'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'fixed_frame_rate_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'nal_hrd_parameters_present_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'nal_hrd_parameters' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'vcl_hrd_parameters_present_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'vcl_hrd_parameters' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'low_delay_hrd_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'pic_struct_present_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'bitstream_restriction_flag' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'motion_vectors_over_pic_boundaries_flag' not
described in 'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'max_bytes_per_pic_denom' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'max_bits_per_mb_denom' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'log2_max_mv_length_horizontal' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'log21_max_mv_length_vertical' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'max_num_reorder_frames' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:88: warning: Function parameter or member 'max_dec_frame_buffering' not described in
'nal_h264_vui_parameters'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'profile_idc' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'constraint_set0_flag' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'constraint_set1_flag' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'constraint_set2_flag' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'constraint_set3_flag' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'constraint_set4_flag' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'constraint_set5_flag' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'reserved_zero_2bits' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'level_idc' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'seq_parameter_set_id' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'chroma_format_idc' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'separate_colour_plane_flag' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'bit_depth_luma_minus8' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'bit_depth_chroma_minus8' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'qpprime_y_zero_transform_bypass_flag' not
described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'seq_scaling_matrix_present_flag' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'log2_max_frame_num_minus4' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'pic_order_cnt_type' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'log2_max_pic_order_cnt_lsb_minus4' not described
in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'delta_pic_order_always_zero_flag' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'offset_for_non_ref_pic' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'offset_for_top_to_bottom_field' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'num_ref_frames_in_pic_order_cnt_cycle' not
described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'offset_for_ref_frame' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'max_num_ref_frames' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'gaps_in_frame_num_value_allowed_flag' not
described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'pic_width_in_mbs_minus1' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'pic_height_in_map_units_minus1' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'frame_mbs_only_flag' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'mb_adaptive_frame_field_flag' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'direct_8x8_inference_flag' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'frame_cropping_flag' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'crop_left' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'crop_right' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'crop_top' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'crop_bottom' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'vui_parameters_present_flag' not described in
'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:143: warning: Function parameter or member 'vui' not described in 'nal_h264_sps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'pic_parameter_set_id' not described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'seq_parameter_set_id' not described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'entropy_coding_mode_flag' not described in
'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'bottom_field_pic_order_in_frame_present_flag' not
described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'num_slice_groups_minus1' not described in
'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'slice_group_map_type' not described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'run_length_minus1' not described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'top_left' not described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'bottom_right' not described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'slice_group_change_direction_flag' not described
in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'slice_group_change_rate_minus1' not described in
'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'pic_size_in_map_units_minus1' not described in
'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'slice_group_id' not described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'num_ref_idx_l0_default_active_minus1' not
described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'num_ref_idx_l1_default_active_minus1' not
described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'weighted_pred_flag' not described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'weighted_bipred_idc' not described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'pic_init_qp_minus26' not described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'pic_init_qs_minus26' not described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'chroma_qp_index_offset' not described in
'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'deblocking_filter_control_present_flag' not
described in 'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'constrained_intra_pred_flag' not described in
'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'redundant_pic_cnt_present_flag' not described in
'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'transform_8x8_mode_flag' not described in
'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'pic_scaling_matrix_present_flag' not described in
'nal_h264_pps'
drivers/media/platform/allegro-dvt/nal-h264.h:188: warning: Function parameter or member 'second_chroma_qp_index_offset' not described in
'nal_h264_pps'
