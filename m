Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D42857CD4DA
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 09:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344587AbjJRHDD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 03:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235032AbjJRHDB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 03:03:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2B610D
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 00:02:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16471C433C8;
        Wed, 18 Oct 2023 07:02:56 +0000 (UTC)
Message-ID: <1ec4075c-b359-4545-93b3-c44c73280e71@xs4all.nl>
Date:   Wed, 18 Oct 2023 09:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] v4l2-tracer: fix autogen script for AV1
Content-Language: en-US, nl
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
References: <20231017165819.18634-1-deborah.brouwer@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231017165819.18634-1-deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

On 17/10/2023 18:58, Deborah Brouwer wrote:
> The AV1 uAPI introduced some new enums and also defined
> two array sizes arithmetically e.g.
> __u32 mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1];
> 
> Adjust the autogeneration scripts to handle these changes.

Thank you for the quick fix! Applied, and I've now synced up v4l-utils
with the latest staging tree.

Regards,

	Hans

> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  utils/v4l2-tracer/v4l2-tracer-gen.pl | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> index cbfdfbe0..e8f9d71e 100755
> --- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
> +++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
> @@ -32,7 +32,9 @@ EOF
>  
>  sub convert_type_to_json_type {
>  	my $type = shift;
> -	if ($type eq __u8 || $type eq char || $type eq __u16 || $type eq __s8 || $type eq __s16 || $type eq __s32 || $type eq 'int') {
> +	if ($type eq __u8 || $type eq char || $type eq __u16 || $type eq __s8 || $type eq __s16 || $type eq __s32 || $type eq 'int' ||
> +		$type eq 'v4l2_av1_warp_model' || $type eq 'v4l2_av1_frame_restoration_type' || $type eq 'v4l2_av1_frame_type' ||
> +		$type eq 'v4l2_av1_interpolation_filter' || $type eq 'v4l2_av1_tx_mode') {
>  		return "int";
>  	}
>  	if ($type eq __u32 || $type eq __le32 || $type eq __s64) {
> @@ -658,19 +660,29 @@ sub struct_gen_ctrl {
>  		@words = grep  {!/\]/} @words; # remove values with brackets e.g. V4L2_H264_REF_LIST_LEN]
>  
>  		($type) = $words[0];
> +		if ($type eq 'enum') {
> +			$type = $words[1];
> +		}
>  		$json_type = convert_type_to_json_type($type);
>  
>  		($member) = $words[scalar @words - 1];
>  
>  		# generate members that are arrays
>  		if ($line =~ /.*\[.*/) {
> +
> +			# e.g. two dimensional array [x][y]
> +			my @dimensions = ($line) =~ /\[(.*?)\]/g;
> +
> +			#for struct v4l2_av1_tile_info [V4L2_AV1_MAX_TILE_ROWS + 1]
> +			if (grep {$_ =~ /\+/} @dimensions) {
> +				$member = $words[scalar @words - 3];
> +			}
> +
>  			printf $fh_trace_cpp "\t\/\* %s \*\/\n", $line; # add comment
>  			printf $fh_trace_cpp "\tjson_object *%s_obj = json_object_new_array();\n", $member;
>  			printf $fh_retrace_cpp "\n\t\/\* %s \*\/\n", $line; # add comment
>  
> -			my @dimensions = ($line) =~ /\[(\w+)\]/g;
>  			$dimensions_count = scalar @dimensions;
> -
>  			if ($dimensions_count > 1) {
>  				printf $fh_retrace_cpp "\tint count_%s = 0;\n", $member;
>  			}

